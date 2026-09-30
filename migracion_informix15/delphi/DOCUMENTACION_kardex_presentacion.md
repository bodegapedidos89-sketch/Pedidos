# Motor de Kardex por Producto Unificado — Documentación técnica

Documentación de `07_kardex_por_presentacion.sql` y de los cambios que
conecta en `JUNTA.pas`, `UOCRecepcion.pas` y `UCierreDiario.pas`.

## 1. Objetivo

El pedido fue replantear el cierre para trabajar hacia una meta de
mediano plazo: **reducir la cantidad de códigos** del catálogo. Hoy un
mismo producto (melón, por ejemplo) puede tener 3 códigos distintos en
`inarinv` según cómo se compre/venda (caja, kg, pieza), porque `inarinv`
solo trae dos columnas paralelas de existencia (`*_kgs`/`*_caj`) y no
sabe nada de "presentaciones".

`art_presentacion` ya resolvía la mitad del problema (capturar con un
solo código ancla y una sola Cantidad, convirtiendo automáticamente). Lo
que faltaba era que la **existencia y el costo** también vivieran
centralizados en el producto unificado, en vez de repartidos entre los
códigos legacy de cada presentación — que es justo lo que impedía borrar
esos códigos duplicados algún día.

Este cambio invierte quién manda:

|  | Antes | Ahora |
|---|---|---|
| Conversión de una presentación | `art_presentacion` (ya así) | `art_presentacion` (igual) |
| Existencia y costo promedio | `inarinv.exi_cor_kgs/caj`, `cos_pro_kgs/caj`, `can_emp` | `art_existencia.existencia_base/costo_prom_base`, por `cod_art_ancla` |
| `inarinv` | fuente de verdad | catálogo (código/descripción) + **espejo** de compatibilidad |

**Migración gradual, no de golpe**: el motor nuevo solo actúa sobre un
código si ese código ya está dado de alta en `art_presentacion`
(`cod_art_legacy` o `cod_art_ancla`). Si no lo está, todos los
procedimientos nuevos simplemente `RETURN` sin tocar nada — el artículo
sigue funcionando exactamente igual que hoy, 100% en `inarinv`. Esto es
a propósito: el usuario va a depurar y dar de alta en
`art_presentacion`/`bundle_*` únicamente los productos que de verdad se
usan, a su ritmo, y cada uno que agregue empieza a usar el motor nuevo
automáticamente sin que haya que tocar código otra vez.

## 2. `07_kardex_por_presentacion.sql`

### 2.1 `art_existencia`

Un renglón por `(num_emp, cod_art_ancla)`: `existencia_base` (en la
unidad base — la misma a la que `factor_a_base` convierte todas las
presentaciones, normalmente kg), `costo_prom_base`, `saldo_valorizado`
(`existencia_base * costo_prom_base`) y `fecha_ult_mov`.

### 2.2 `art_kardex_mov`

Bitácora de movimientos (equivalente a `inartrinv` pero por producto
unificado): qué se capturó (`cantidad_cap`, en la unidad de la
presentación usada), a cuánto equivale en base (`cantidad_base`), y el
saldo corrido después de aplicarlo (`existencia_base`, `costo_prom_base`)
por cada renglón. Sirve de auditoría; quien manda para "cuánto hay
ahorita" es `art_existencia`, no esta tabla.

### 2.3 `sp_aplica_mov_kardex` — punto de entrada para una venta/recepción

```sql
sp_aplica_mov_kardex(emp, suc, codart, fech, tipdoc, numdoc, ren,
                      cantcap, costouni, esentrada)
```

Quien llama pasa el **código legacy** que ya tiene a la mano (el que
resolvió `TFormPresentacion.Seleccionar` al capturar) — el procedimiento
hace la búsqueda inversa:

```sql
SELECT FIRST 1 id_presentacion, cod_art_ancla, factor_a_base, tara_kg,
       es_variable
  INTO idpres, codancla, factor, tara, variable
  FROM art_presentacion
 WHERE num_emp = emp AND cod_art_legacy = codart AND activo = "S";

IF codancla IS NULL THEN
   RETURN;  -- no migrado: no se toca nada
END IF;
```

y luego:

1. Convierte `cantcap` a unidad base con la **misma fórmula** que ya usa
   Delphi (`ConvierteCantidad`): `es_variable='S'` → `cantcap - tara`;
   si no, `(cantcap * factor) - (cantcap * tara)`.
2. Si `esentrada='S'`: suma a la existencia y recalcula el costo
   promedio ponderado — `(existencia_ant*costo_ant + cantidad*costouni)
   / existencia_nueva` (promedio ponderado estándar de costeo).
3. Si `esentrada='N'`: resta de la existencia; el costo promedio **no
   cambia** en una salida (igual que en `act_kardex`).
4. Actualiza (o inserta, si es la primera vez que se toca ese ancla)
   `art_existencia`, inserta el renglón en `art_kardex_mov`, y **espeja**
   el resultado en `inarinv` — pero únicamente en la fila del propio
   `cod_art_ancla` (no en cada código legacy de presentación, que se
   queda congelado — es justo lo que permite ir dejando de usarlos).

`can_emp` espejado es *mejor esfuerzo*: queda con el `factor_a_base` de
la presentación usada en **ese** movimiento. Si el producto tiene más de
una presentación tipo "empaque" (caja de 10 y caja de 20, por ejemplo),
ese campo va a ir cambiando según cuál se use más — quien de verdad hay
que consultar para convertir cualquier presentación sigue siendo
`art_presentacion`, nunca `inarinv.can_emp`.

### 2.4 `sp_ajusta_existencia_base` — para diferencias ya calculadas en base

```sql
sp_ajusta_existencia_base(emp, suc, codart, fech, tipdoc, numdoc, ren,
                           deltabase, costouni)
```

Mismo cálculo de costo/existencia que `sp_aplica_mov_kardex`, pero para
cuando el llamador **ya** tiene la diferencia en unidad base (kg) y no
tiene sentido pasar por el factor/tara de una presentación específica —
el caso de "Aplicar diferencias de inventario físico" en
`UCierreDiario.pas`, donde se compara directamente kg contra kg.
`deltabase` positivo = entra, negativo = sale. No toca `can_emp` (eso
sigue siendo exclusivo de una recepción real con una presentación
elegida).

La búsqueda inversa de este procedimiento acepta que `codart` sea el
**código ancla directamente**, no solo un `cod_art_legacy`:

```sql
WHERE num_emp = emp AND activo = "S"
  AND (cod_art_legacy = codart OR cod_art_ancla = codart)
```

Esto importa porque, como explicó el usuario, **el conteo físico
registra el producto, no una presentación** — quien cuenta inventario ve
"melón", no decide si es la presentación caja/kg/pieza. Es esperable que
`inv_diario.cod_art` termine trayendo el propio código ancla para un
producto ya migrado, no el código legacy de una presentación puntual. Si
la búsqueda inversa solo aceptara `cod_art_legacy`, un ancla que no esté
registrada a sí misma como presentación de nada se habría quedado sin
resolver — el ajuste se hubiera saltado en silencio.

## 3. Dónde se conecta

### 3.1 `JUNTA.pas` — venta (artículo normal y cada componente de un bundle)

En el único punto vivo donde ya se llama `inserta_ventas.ExecProc` +
`qmarcapresentacion.ExecSQL` (dentro de `PRE_PROKeyPress`), justo
después:

```pascal
spAplicaMovKardex.ParamByName('codart').AsString := codigoART.text;
spAplicaMovKardex.ParamByName('cantcap').AsFloat := StrToFloat(caj_pro.text);
spAplicaMovKardex.ParamByName('tipdoc').AsString := 'VE';
spAplicaMovKardex.ParamByName('esentrada').AsString := 'N';
spAplicaMovKardex.ExecProc;
```

`cantcap` es `caj_pro.text` (la "Cantidad" tal como la tecleó el
cajero), **no** `FCajasCalc` (que ya es una conversión para
compatibilidad con `ventas`) — `sp_aplica_mov_kardex` hace su propia
conversión con `art_presentacion`, no hay que convertir dos veces.

Dentro de `ProcesaBundle`, mismo mecanismo por cada componente, usando
`codLegacyComp` y `cantComp` (la cantidad de ese componente ya
multiplicada por cuántos bundles se vendieron).

### 3.2 `UOCRecepcion.pas` — recepción de almacén

Justo después de `spRecibeRenglon.ExecProc` (que sigue igual, ver
`DOCUMENTACION_cierre_diario.md` si hace falta repasar `formato.pas`):

```pascal
if kilosNetos <> 0 then
  costoPorKgBase := (FCosUniActual * cantRecibida) / kilosNetos
else
  costoPorKgBase := 0;

spAplicaMovKardex.ParamByName('codart').AsString := FCodArtActual;
spAplicaMovKardex.ParamByName('cantcap').AsFloat := cantRecibida;
spAplicaMovKardex.ParamByName('costouni').AsFloat := costoPorKgBase;
spAplicaMovKardex.ParamByName('tipdoc').AsString := 'AC';
spAplicaMovKardex.ParamByName('esentrada').AsString := 'S';
spAplicaMovKardex.ExecProc;
```

`FCosUniActual` es el costo capturado en la orden de compra en la unidad
de COMPRA (p.ej. costo por caja), pero `sp_aplica_mov_kardex` promedia
el costo contra la cantidad ya convertida a unidad BASE (kg) — pasarle
`FCosUniActual` tal cual dejaba el costo promedio multiplicado por el
factor de la presentación (10x sobrestimado comprando por caja de
10kg). Se convierte a costo por kg con el total realmente pagado
(`FCosUniActual * cantRecibida`) entre los kilos netos reales
recibidos (`kilosNetos`), antes de llamar a `spAplicaMovKardex`.

### 3.3 `UCierreDiario.pas`

- **"Aplicar diferencias de inventario físico"**: por cada código de
  `inv_diario`, primero pregunta si ese código (como ancla o como
  legacy) ya está en `art_presentacion`:
  - **Migrado**: compara `SUM(can_kgs)` de `inv_diario` contra
    `art_existencia.existencia_base` **directamente** (no contra
    `inarinv` — que para un código legacy que no sea el propio ancla
    puede estar congelado desde antes de la migración) y, si hay
    diferencia, llama únicamente a `sp_ajusta_existencia_base` con
    `deltabase := difKgs`. No se llama a `inserta_tr_entdiv`/
    `inserta_tr_saldiv` para estos — su Kardex de auditoría ya es
    `art_kardex_mov`, no `inartrinv`.
  - **No migrado**: exactamente el flujo original, comparando contra
    `inarinv.exi_cor_kgs/exi_cor_caj` y usando
    `inserta_tr_entdiv`/`inserta_tr_saldiv`.
  - Los contadores de renglón (y por lo tanto los folios/encabezados
    `inserta_entdiv`/`inserta_saldiv` en `inardiverso`) son
    independientes entre los dos caminos, para no generar un encabezado
    de entrada/salida diversa sin ningún renglón real en `inartrinv`
    cuando todo lo que se ajustó ese día fueron artículos migrados.
- **"Recalcular Kardex completo"** (`sp_cierre_recalcula_kardex`): se le
  agregó un filtro al inicio del recorrido —

  ```sql
  IF EXISTS(SELECT id_presentacion FROM art_presentacion
             WHERE num_emp = emp
               AND (cod_art_ancla = art OR cod_art_legacy = art)
               AND activo = "S")
  THEN
     CONTINUE FOREACH;
  END IF;
  ```

  — para que **no** reprocese artículos ya migrados al motor nuevo. Sin
  este filtro, correr el recálculo completo sobreescribiría el espejo en
  `inarinv` con un valor calculado por el replay viejo de `inartrinv`,
  desincronizándolo de `art_existencia` hasta el siguiente movimiento
  real.
- **"Cerrar el día" (detectar negativos)**: **no se tocó** —
  `sp_cierre_detecta_negativos` sigue leyendo `inarinv.exi_cor_kgs/caj`
  tal cual, y como el motor nuevo espeja esas columnas en la fila del
  ancla, la detección de negativos sigue funcionando igual para
  artículos migrados sin necesidad de cambiar nada ahí.

## 4. Qué falta / siguientes pasos

- **Curar `art_presentacion`**: mientras un producto no tenga fila ahí
  (por `cod_art_legacy`), sigue 100% en el mundo viejo. Ir agregando los
  que de verdad se usan es justo la parte que el usuario va a hacer.
- **Códigos legacy huérfanos**: cuando un producto se migra, sus códigos
  de presentación individuales (los que no son el ancla) dejan de
  recibir actualizaciones de existencia en `inarinv` — quedan congelados
  en el último valor real. Si se quiere, se puede armar un reporte que
  liste esos códigos para confirmar que ya no se usan antes de darlos de
  baja del catálogo.
- **`sp_cierre_recalcula_kardex`** para artículos NO migrados sigue
  funcionando exactamente igual que antes (replay completo desde
  `inventario`); no existe todavía un "recalculo completo" equivalente
  para `art_existencia` (que reconstruya el saldo desde `art_kardex_mov`
  por si se sospecha que se desincronizó). Si hace falta, se puede
  agregar.
- **`can_emp` espejado** es de la última presentación usada, no un
  promedio — ver nota en 2.3. Si algún reporte fuera de lo que hemos
  tocado depende de que `can_emp` sea exacto (no solo aproximado) para
  artículos con varias presentaciones tipo empaque, avisar para revisar
  ese reporte puntual.
