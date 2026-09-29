# Cierre Diario y Tendencias de Existencia Negativa — Documentación técnica

Documentación de `UCierreDiario.pas` y `UReporteNegativos.pas`, y de los
objetos nuevos en `06_cierre_diario.sql`. Cubre el cierre del día
(recalculo de Kardex, detección de existencia negativa, aplicación de
diferencias del inventario físico) y el reporte gráfico de tendencias.

> **Actualización**: desde `07_kardex_por_presentacion.sql`, "Aplicar
> diferencias de inventario físico" y "Recalcular Kardex completo" ya
> conocen el motor de Kardex por producto unificado (existencia y costo
> centralizados por `cod_art_ancla` en vez de por código legacy) — ver
> `DOCUMENTACION_kardex_presentacion.md` para el detalle de ese motor y
> de qué cambió exactamente en esos dos botones. "Cerrar el día" no
> cambió: sigue funcionando igual gracias al espejo en `inarinv`.

## 1. Objetivo

El sistema ya tenía tres procedimientos legacy que hacen un trabajo
parecido pero para fines distintos:

- **`act_kardex`** / **`act_kardexall`**: recorren `inartrinv` desde una
  foto en `inventario` y recalculan costo promedio, `can_emp` y
  existencias de `inarinv`. Son la herramienta de "reparar cuando algo se
  desfasó", no una rutina diaria (recorren todo el rango de movimientos).
- **`loc_kardexneg`**: hace el mismo recorrido pero sin escribir nada
  (todos sus `UPDATE` están comentados); solo detecta en qué punto la
  existencia recalculada se volvió negativa, y lo deja en una tabla
  temporal (`tmp_kardexneg`) que se **vacía en cada corrida** — no sirve
  para ver tendencia en el tiempo.

Ninguno de los tres se modificó. Lo que se agregó es una capa de cierre
diario que:

1. Detecta existencia negativa de forma barata (leyendo `inarinv` tal
   cual está, no recorriendo el historial) y la deja en un **historial
   permanente** (para poder ver recurrencia por código a lo largo del
   tiempo, que es lo que pide el reporte de tendencias).
2. Ofrece el recálculo completo (`act_kardexall`, mismo cálculo, misma
   fórmula de `can_emp`) como herramienta aparte, no atada a la rutina
   diaria.
3. Conecta el conteo físico de la terminal portátil (`inv_diario`) como
   origen de ajustes al Kardex, reutilizando el mecanismo de
   entradas/salidas diversas que ya existe en el sistema
   (`inserta_entdiv`/`inserta_tr_entdiv`/`inserta_saldiv`/
   `inserta_tr_saldiv` — los mismos cuatro procedimientos que
   `formato.pas` ya usa para el módulo de "terreno").

Ver `06_cierre_diario.sql` para las tablas y procedimientos nuevos:
`hist_existencia_negativa`, `hist_recalculo_kardex`, `hist_log_cierre`,
`sp_cierre_recalcula_kardex`, `sp_cierre_detecta_negativos`.

## 2. `UCierreDiario.pas` / `.dfm`

Pantalla con tres bloques independientes. Comparten `edtEmpresa` y
`dtFecha` (arriba), pero cada botón hace su propia cosa — no hace falta
correr los tres para cerrar el día.

### 2.1 Bloque "Cerrar el día" (`btnDetectaNegativosClick`)

El único paso que se espera correr **todos los días**. Llama a
`sp_cierre_detecta_negativos(emp, fecha)`, que simplemente hace:

```sql
INSERT INTO hist_existencia_negativa (...)
SELECT num_emp, cod_art, fecha, exi_cor_kgs, exi_cor_caj, can_emp,
       cos_pro_kgs, cos_pro_caj
  FROM inarinv
 WHERE inarinv.num_emp = emp
   AND (inarinv.exi_cor_kgs < 0 OR inarinv.exi_cor_caj < 0);
```

No recalcula nada ni recorre el historial: lee la existencia **vigente**
en `inarinv` (la que ventas, recepción de almacén y el bloque de
diferencias de inventario físico van manteniendo al día) y, si algún
artículo está en negativo, deja un renglón fijo con la fecha de ese
cierre. `CargaNegativosHoy` refresca `dbgNegativosHoy` con lo que quedó
guardado para la fecha seleccionada.

Como `hist_existencia_negativa` nunca se vacía (a diferencia de
`tmp_kardexneg`), correr este botón día tras día es lo que arma la
"conducta" de cada código que pidió el usuario: cuántas veces salió
negativo en un rango de fechas (ver `UReporteNegativos.pas`).

### 2.2 Bloque "Recálculo completo de Kardex" (`btnRecalculaClick`)

Opcional, no es rutina diaria — el propio texto del formulario
(`lblRecalculoNota`) lo advierte. Llama a
`sp_cierre_recalcula_kardex(emp, fech_ini, fech_fin)`, que es la misma
lógica probada de `act_kardexall` (incluida la fórmula de `can_emp`
"LUPITA 4 MARZO 2008": `(exi_kgs-entdivkg+saldivkg)/(exi_caj-entdivca+
saldivca)`, que descuenta las entradas/salidas diversas ya aplicadas en
la misma corrida antes de recalcular `can_emp`), con dos diferencias a
propósito:

- Unifica `SD` y `DO` como salida diversa (`act_kardex` solo revisaba
  `SD`; `act_kardexall` también revisaba `DO`; aquí se tratan igual en
  los dos casos).
- Las tablas de traza (`hist_recalculo_kardex`, `hist_log_cierre`) **sí
  tienen `num_emp`**, así que el `DELETE` de arranque del procedimiento
  se filtra por empresa. Los originales (`tmp_canemp`, `log_actkardex`)
  se vacían sin filtro — si dos empresas corrieran su recálculo al mismo
  tiempo, se borrarían el resultado entre sí.

Antes de ejecutar, `MessageDlg` explica en español qué va a sobrescribir
y qué necesita (una foto en `inventario` con `fecha = fech_ini` para
que el punto de partida no sea cero). Al terminar, `CargaLogCierre`
muestra en `dbgLogCierre` las anomalías que se toparon en el camino
(mismo tipo de mensajes que ya generaba `act_kardex`: `"CO EXIST. EN
KGS 0"`, `"(ED) CAN_EMP EN 0"`, etc., ahora en `hist_log_cierre`).

### 2.3 Bloque "Inventario físico (inv_diario) vs sistema" (`btnAplicaDiferenciasClick`)

Conecta el conteo de la terminal portátil con el Kardex. Paso a paso:

1. Agrupa `inv_diario` por código para la fecha seleccionada, sumando
   `can_kgs`/`can_caj` (por si la terminal bajó el conteo en más de una
   sesión el mismo día — dos bines contados por separado del mismo
   artículo se suman, no se toma solo el último):

   ```sql
   SELECT cod_art, SUM(can_kgs) fis_kgs, SUM(can_caj) fis_caj
     FROM inv_diario
    WHERE num_emp = :emp AND fecha = :fecha
    GROUP BY cod_art
   ```

2. Por cada código, lee `exi_cor_kgs`/`exi_cor_caj`/`tip_art`/
   `cos_pro_kgs`/`cos_pro_caj` **vigentes** de `inarinv` (no una foto
   vieja) y calcula `difKgs`/`difCaj` = físico − sistema.

3. Decide si es entrada o salida usando el eje que manda según
   `tip_art` (K → signo de `difKgs`, C → signo de `difCaj`) — igual
   convención que usa `act_kardex` para decidir cuál de los dos ejes es
   el "primario" del artículo.

4. Llama a `inserta_tr_entdiv` (sobrante) o `inserta_tr_saldiv`
   (faltante) por cada renglón, valuando el ajuste al **costo promedio
   actual** del artículo (`cos_pro_kgs`/`cos_pro_caj`) — no a un costo de
   compra, porque esto no es una compra, es un ajuste de existencia
   diverso. **No toca `can_emp`**: esa columna solo se refresca al
   recibir mercancía en `UOCRecepcion.pas`, no aquí.

5. Al final, si hubo al menos un renglón de entrada, llama una sola vez
   a `inserta_entdiv` (encabezado en `inardiverso`, folio = todos los
   renglones de entrada de esta corrida); lo mismo para salida con
   `inserta_saldiv`. Si una corrida solo tuvo entradas, no se genera
   encabezado de salida (y viceversa) — no quedan encabezados huérfanos
   en `inardiverso`.

El folio (`doc`) de cada corrida sale de `MAX(num_doc)+1` sobre
`inartrinv` filtrado por `tip_doc='ED'`/`'SD'` y la empresa — **no** se
usa el consecutivo `consendiv`/`conssadiv` que usa `formato.pas` para el
"terreno", porque ese consecutivo está atado a las empresas `'10'`/`'14'`
del módulo de terreno y no hay garantía de que exista un renglón para la
empresa real.

**Idempotencia**: como el paso 2 compara contra la existencia *ya
actualizada* de `inarinv` (no contra una foto fija tomada al principio),
si el botón se corre dos veces seguidas para la misma fecha, la segunda
corrida ya no encuentra diferencia (el primer ajuste dejó `inarinv`
exactamente igual al conteo físico) y no aplica nada — no hay riesgo de
duplicar el ajuste por dar clic dos veces.

## 3. `UReporteNegativos.pas` / `.dfm`

Reporte gráfico de tendencias sobre `hist_existencia_negativa`. Usa
`TChart` (TeeChart, viene incluido con Delphi 7 — si el paquete no está
activado en el IDE, activarlo desde *Component → Install Packages* antes
de compilar).

### 3.1 Ranking de recurrencia (`btnBuscarClick`)

```sql
SELECT cod_art, COUNT(*) veces, MIN(exi_cor_kgs) peor_kgs,
       MIN(exi_cor_caj) peor_caj
  FROM hist_existencia_negativa
 WHERE num_emp = :emp AND fecha_cierre BETWEEN :desde AND :hasta
 GROUP BY cod_art
 ORDER BY veces DESC
```

Cada renglón de `dbgRanking` es un código que salió negativo al menos
una vez en el rango, ordenado por cuántas veces (`COUNT(*)`) cerró en
negativo — la "conducta" del artículo que pidió el usuario. `peor_kgs`/
`peor_caj` (el `MIN`, o sea el valor más negativo) da una idea rápida de
qué tan grave fue el peor día de cada código sin tener que abrir la
gráfica.

### 3.2 Gráfica de tendencia (`dbgRankingDblClick` → `CargaTendencia`)

Doble clic en un renglón del ranking dispara:

```sql
SELECT fecha_cierre, exi_cor_kgs, exi_cor_caj
  FROM hist_existencia_negativa
 WHERE num_emp = :emp AND cod_art = :art
   AND fecha_cierre BETWEEN :desde AND :hasta
 ORDER BY fecha_cierre
```

y carga dos series (`SerieKgs` en rojo, `SerieCaj` en azul) punto por
punto con `AddXY`, usando `fecha_cierre` como eje X (`XValues.DateTime :=
True` para que `TChart` lo dibuje como fecha, no como número). Las
series se crean **en código**, en `FormCreate` (`SerieKgs :=
TLineSeries.Create(Self); SerieKgs.ParentChart := Chart1; ...`), no en
el `.dfm` — a propósito, para no depender de que el formato binario que
usa el `.dfm` para guardar series de TeeChart coincida exactamente con
la versión de TeeChart instalada en tu Delphi; así, si algo no compila,
el error va a apuntar a una línea de Pascal normal y no a una propiedad
rara del inspector de objetos.

`Chart1.Title.Text.Text` se actualiza con el código graficado, así que
sirve como confirmación visual de qué se está viendo.

## 4. Flujo completo de un cierre de día

1. Durante el día, ventas (`JUNTA.pas`) y recepción de almacén
   (`UOCRecepcion.pas`) van manteniendo `inarinv.exi_cor_kgs`/
   `exi_cor_caj` al día por su cuenta — el cierre no los reemplaza.
2. Si la terminal portátil bajó un conteo físico ese día, correr
   **"Aplicar diferencias de inventario físico"** primero — deja
   `inarinv` cuadrado contra lo que de verdad hay en el almacén antes de
   evaluar quién quedó negativo.
3. Correr **"Cerrar el día"** — barato, siempre se corre, deja el
   historial permanente de qué códigos cerraron negativos ese día.
4. Si se sospecha que el costo promedio o `can_emp` se desfasaron por
   algún problema puntual (no como rutina), correr **"Recalcular Kardex
   completo"** con el rango de fechas correspondiente.
5. Desde **"Ver reporte de tendencias..."** (o directo desde el menú
   principal), revisar qué códigos se repiten en negativo en un rango de
   fechas y graficar su tendencia para decidir si hace falta ajustar
   mínimos, revisar mermas, o investigar al proveedor/almacén.

## 5. Qué falta / posibles siguientes pasos

- `sp_cierre_recalcula_kardex` depende de que exista una foto en
  `inventario` con `fecha = fech_ini` para partir de un punto real; si
  nunca se ha alimentado esa tabla para una empresa, el recálculo arranca
  de cero para todos sus artículos. Si hace falta, se puede armar un
  programa aparte que tome la existencia actual de `inarinv` como "foto"
  inicial para sembrar `inventario` la primera vez.
- El reporte de tendencias solo grafica kilos/cajas de existencia; si se
  quiere superponer la línea de "mínimo sugerido" o el costo, habría que
  agregar una tercera serie y decidir de dónde sale ese dato.
- `UCierreDiario.pas` y `UReporteNegativos.pas` no están protegidos
  contra doble clic mientras corren (una corrida larga de "Recalcular
  Kardex completo" sobre muchos artículos puede tardar); si se vuelve
  molesto en el uso diario, se le puede agregar un `Screen.Cursor :=
  crHourGlass` y deshabilitar el botón mientras dura el `ExecProc`.
