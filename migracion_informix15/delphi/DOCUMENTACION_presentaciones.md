# Catálogo unificado de presentaciones — Documentación técnica

Documentación de los cambios agregados a `JUNTA.pas` y del módulo nuevo
`UFormPresentacion.pas`, que permiten manejar un artículo con varias
presentaciones (caja, kg, malla, pieza...) sin duplicar códigos en el
catálogo legacy de Informix, calculando automáticamente kilos/cajas y el
importe según la presentación que elige el cajero.

## 1. Objetivo

El catálogo legacy (`inarinv`) obliga a crear un `cod_art` distinto por
cada presentación de un mismo producto (una caja de venta, una caja de
compra, un kilo, etc.), porque cada renglón de `inarinv`/`inartrinv` solo
trae dos columnas paralelas (`*_kgs` y `*_caj`). Esto se resolvió
agregando una capa nueva, sin tocar el motor de Kardex existente:

- El cajero teclea un **código ancla** (el que ya conoce) y, si ese
  artículo tiene 2 o más presentaciones configuradas, una ventana le
  pregunta cuál está capturando.
- El cajero teclea **una sola cantidad** (ya no captura kilos y cajas por
  separado). El sistema calcula kilos/cajas automáticamente según el
  factor de conversión y la tara de la presentación elegida.
- Los procedimientos y triggers que ya existían en Informix
  (`inserta_ventas`, el Kardex) **no se modificaron** — todo lo nuevo vive
  en tablas adicionales y en esta capa de Delphi.

Ver también `03_objetos_presentaciones.sql` (tablas `art_producto`,
`art_presentacion`, `inartrinv_peso`, columna `ventas.id_presentacion`,
procedimiento `sp_aplica_presentacion_venta` y triggers
`tr_ventas_presentacion` / `tr_ventas_presentacion_upd`) para el lado de
base de datos.

## 2. `UFormPresentacion.pas` / `.dfm`

Ventana emergente reutilizable. Su único punto de entrada es la función
de clase `TFormPresentacion.Seleccionar`:

```pascal
class function Seleccionar(Database: TDatabase; const CodArtAncla: string;
  Uso: Char; out IdPresentacion: Integer; out CodArtLegacy: string;
  out Factor: Double; out PrecioDerivado: Boolean; out Tara: Double;
  out EsVariable: Boolean): Boolean;
```

| Parámetro | Sentido | Qué significa |
|---|---|---|
| `Database` | in | conexión BDE a usar (mismo `DatabaseName` que el resto del formulario) |
| `CodArtAncla` | in | el código que tecleó el cajero |
| `Uso` | in | `'C'` compra, `'V'` venta, `'A'` ambos — filtra qué presentaciones aplican |
| `IdPresentacion` | out | id de la fila elegida en `art_presentacion` (0 si el artículo no está migrado) |
| `CodArtLegacy` | out | el `cod_art` real de `inarinv` que hay que usar de aquí en adelante |
| `Factor` | out | `factor_a_base`: cuántas unidades base (kg) equivale 1 unidad de esta presentación |
| `PrecioDerivado` | out | si `'S'`, el precio de lista hay que multiplicarlo por `Factor` (la presentación no tiene precio propio) |
| `Tara` | out | `tara_kg` de la presentación |
| `EsVariable` | out | si `'S'`, la cantidad capturada es peso bruto (se resta la tara); si `'N'`, es una cantidad contada |

Comportamiento según cuántas presentaciones activas tenga `CodArtAncla`
(consulta a `art_presentacion` filtrando `activo='S'` y `uso IN (Uso,'A')`):

- **0 filas** → `Result := True` de inmediato, sin ventana. `IdPresentacion`
  queda en 0 y `CodArtLegacy := CodArtAncla` — el artículo se comporta
  exactamente igual que antes de este cambio (compatibilidad total con
  artículos no migrados).
- **1 fila** → se resuelve sola, sin ventana (no hay ambigüedad que
  preguntar).
- **2+ filas** → se crea `TFormPresentacion`, un botón por cada
  presentación (etiqueta como caption), y se espera a que el cajero elija
  o cancele.

Cada botón lleva los 5 datos que necesita el llamador empacados en su
propiedad `Hint`, separados por `|` (`cod_art_legacy|factor_a_base|
precio_derivado|tara_kg|es_variable`), porque un `TButton` no tiene dónde
más guardar datos extra. `BotonClick` los desempaqueta con `Pos`/`Copy`
(no se usa `TStrings.DelimitedText` porque `StrictDelimiter` no existe en
Delphi 7).

**Posicionamiento**: los botones se crean dentro de `pnlBotones` (Top=28
en el `.dfm`), así que sus coordenadas son relativas al panel. `btnCancelar`
cuelga directo del formulario, por lo que su `Top` y el `ClientHeight`
del formulario se calculan sumando `pnlBotones.Top` a la posición
acumulada de los botones — si se agregan más controles a este formulario,
hay que respetar esa misma suma o el nuevo control quedará mal ubicado.

## 3. Cambios en `JUNTA.pas`

Todos los cambios son aditivos sobre el flujo de captura existente
(`CODIGOARTKeyPress` → `CAJ_PROExit` → `PRE_PROKeyPress` →
`inserta_ventas.ExecProc`). Nada se eliminó del código original; se
insertaron bloques nuevos marcados con `// === NUEVO ===`.

### 3.1 Campos nuevos de la clase `TForm9`

```pascal
FIdPresentacionSel: Integer;   // id de la presentacion elegida (0 = no migrado)
FCodArtResuelto: string;       // cod_art real que hay que usar (CodArtLegacy)
FFactorPresentacion: Double;   // factor_a_base de la presentacion elegida
FPrecioDerivadoSel: Boolean;   // si hay que multiplicar el precio por el factor
FTaraSel: Double;              // tara_kg de la presentacion elegida
FEsVariableSel: Boolean;       // si la cantidad capturada es peso bruto (bascula)
FCajasCalc: Double;            // "cajas equivalentes" ya calculadas, para inserta_ventas
```

Componentes nuevos: `qmarcapresentacion: TQuery` (UPDATE que marca
`ventas.id_presentacion`) y `qBuscaCanEmp: TQuery` (SELECT de
`inarinv.can_emp`, usado solo para convertir kilos a un número de "cajas"
equivalente para el reporte legacy).

### 3.2 `CODIGOARTKeyPress` — resolver la presentación al teclear el código

Justo después del `Enter` en el código de artículo, **antes** de cualquier
búsqueda de precio o cotización, se llama a `TFormPresentacion.Seleccionar`
y se sobreescribe el código del `TDBLookupComboBox` con el real:

```pascal
if not TFormPresentacion.Seleccionar(Database1, CODIGOART.Text, 'V',
       FIdPresentacionSel, FCodArtResuelto, FFactorPresentacion,
       FPrecioDerivadoSel, FTaraSel, FEsVariableSel) then
begin
  Key := #0;
  Exit; // cancelo, no se toca el articulo
end;
CODIGOART.KEYVALUE := FCodArtResuelto;
```

Se hace aquí (y no después de capturar la cantidad) porque las búsquedas
de precio (`qcotiza`, `qdupli`, etc.) usan `codigoart.Text`/`CODIGOART`
más abajo — si se resolviera después, esas búsquedas usarían el código
ancla en vez del real y traerían el precio equivocado.

### 3.3 `CAJ_PROExit` — el campo "Cantidad" y el cálculo de kilos/cajas

El campo que antes se llamaba/usaba como "Cajas" (`CAJ_PRO`) ahora es el
único campo que teclea el cajero: **Cantidad**. `KIL_PRO` quedó en modo
`ReadOnly` (se sigue mostrando, pero ya no se puede escribir a mano) y su
etiqueta (`Label26`) se renombró de "Cajas" a "Cantidad".

Cuando el artículo está migrado (`FIdPresentacionSel > 0`):

```pascal
cantidad := StrToFloat(caj_pro.text);   // lo que tecleo el cajero, tal cual

if FEsVariableSel then
  // peso variable: 'cantidad' ya es el peso bruto leido en bascula,
  // se resta la tara una sola vez (la del envase que se peso)
  kilos := cantidad - FTaraSel
else
  // cantidad contada (no se pesa): se resta la tara de CADA unidad
  // ej. 10 cajas x 20kg brutos - 10 cajas x 0.5kg tara = 195kg netos
  kilos := (cantidad * FFactorPresentacion) - (cantidad * FTaraSel);

canemp := BuscaCanEmp(FCodArtResuelto);
if canemp > 0 then
  cajas := kilos / canemp
else
  cajas := cantidad;

FCajasCalc := cajas;                          // NO se escribe en pantalla
kil_pro.Text := FloatToStrF(kilos, ffFixed, 10, 4);
```

Importante: **`caj_pro.Text` (el campo "Cantidad") nunca se sobreescribe**.
El cajero siempre ve exactamente lo que tecleó. El valor de "cajas"
equivalentes (`FCajasCalc`, usado solo para el `INSERT` en `ventas` por
compatibilidad con reportes que ya dependen de esa columna) se calcula
aparte usando `inarinv.can_emp` del código real — que puede no coincidir
con `factor_a_base` de la presentación si `can_emp` trae un promedio
histórico distinto; esto es normal y no afecta el kilaje, que es el dato
que manda para el Kardex.

Después del cálculo, sigue exactamente la misma lógica de búsqueda de
precio (`qcotiza`/`qdupli`/`FORM14`) que ya existía, y se hace
`PRE_PRO.SetFocus; Exit;` para saltar todo el código viejo de abajo
(el branching por `CAN_EMP='1'` que aplicaba antes de este cambio, que
sigue intacto para artículos no migrados).

### 3.4 `PRE_PROKeyPress` — cálculo de `TOTAL`

El cálculo original de `TOTAL` decide entre `kilos*precio` o
`cajas*precio` según `TIP_ART` (el indicador K/C legacy de `inarinv`),
sin saber nada de presentaciones. Esto rompía el importe cuando un
artículo con `tip_art='K'` se vendía por una presentación tipo caja con
precio por caja (multiplicaba por kilos en vez de por la cantidad
tecleada). Se agregó un override después de todo ese branching:

```pascal
IF FIdPresentacionSel > 0 THEN
BEGIN
    TOTAL:= floattostrf((STRTOFLOAT(caj_PRO.TEXT) * STRTOFLOAT(PRE_PRO.TEXT)),ffnumber,10,2);
    total := stripped(',',total);
    MULTI := CAJ_PRO.TEXT;
END;
```

Para artículos migrados, el importe **siempre** es
`cantidad tecleada × precio` — el precio de la presentación elegida ya
está expresado en esa unidad (por eso también existe `PrecioPresentacion`,
ver 3.6, para las presentaciones sin precio propio en `cotiza`).

### 3.5 Al grabar — `inserta_ventas` y el marcado de `id_presentacion`

En el único punto vivo donde se llama a `inserta_ventas.ExecProc`
(dentro de `PRE_PROKeyPress`), el parámetro de cajas usa `FCajasCalc`
en vez de leer `caj_pro.text` directo cuando el artículo está migrado:

```pascal
if FIdPresentacionSel > 0 then
  inserta_ventas.params[3].AsString:= FloatToStr(FCajasCalc)
else
  inserta_ventas.params[3].AsString:= caj_pro.text;
inserta_ventas.params[4].AsString:= kil_pro.Text;
```

Justo después de `inserta_ventas.ExecProc;`, se marca el renglón recién
insertado con la presentación usada (esto es lo que dispara, del lado de
Informix, el trigger `tr_ventas_presentacion_upd` que hace el registro de
auditoría en `inartrinv_peso`):

```pascal
if FIdPresentacionSel > 0 then
begin
  qmarcapresentacion.Close;
  qmarcapresentacion.ParamByName('emp').AsString    := NUM_EMPRESA.Text;
  qmarcapresentacion.ParamByName('folio').AsString  := foliotmp;
  qmarcapresentacion.ParamByName('reng').AsInteger  := reng;
  qmarcapresentacion.ParamByName('idpres').AsInteger:= FIdPresentacionSel;
  qmarcapresentacion.ExecSQL;
end;
```

`inserta_ventas` (el procedimiento de Informix) no se tocó — sigue
insertando exactamente las mismas 21 columnas de siempre; `id_presentacion`
se llena aparte con este `UPDATE`.

### 3.6 Funciones auxiliares nuevas

```pascal
function PrecioPresentacion(const PrecioTexto: string): string;
```
Envuelve cada lugar donde antes se hacía
`pre_pro.Text := qcotiza.fieldbyname('precio').AsString;` (3 sitios:
`CODIGOARTKeyPress`, `CAJ_PROExit`, `KIL_PROExit`). Si `FPrecioDerivadoSel`
es verdadero, multiplica el precio encontrado por `FFactorPresentacion`
(caso de una presentación sin precio propio en `cotiza`, que toma
prestado el precio de otra presentación del mismo artículo y lo escala).

```pascal
function BuscaCanEmp(const CodArt: string): Double;
```
`SELECT can_emp FROM inarinv WHERE num_emp=... AND cod_art=...` — usado
únicamente para derivar la columna `cajas` equivalente que se manda a
`ventas` (ver 3.3).

## 4. Flujo completo de una venta con artículo migrado

1. Cajero teclea el código ancla en `CODIGOART`, `Enter`.
2. `CODIGOARTKeyPress` llama a `TFormPresentacion.Seleccionar`.
   - 0 presentaciones → sigue el flujo de siempre, sin cambios.
   - 1 presentación → se resuelve sola.
   - 2+ → aparece la ventana, el cajero elige (o cancela, y no se captura
     el renglón).
3. `CODIGOART.KEYVALUE` se actualiza al código real (`FCodArtResuelto`).
   Las búsquedas de precio de aquí en adelante ya usan ese código.
4. Cajero teclea la **Cantidad** en el campo que antes decía "Cajas".
5. Al salir del campo (`CAJ_PROExit`), se calculan `kilos` (con tara y
   factor) y `FCajasCalc` (cajas equivalentes); `Kilos` se muestra en
   pantalla de solo lectura; "Cantidad" no cambia.
6. Cajero captura/valida el precio (`PRE_PRO`).
7. Al confirmar el renglón, `TOTAL` se calcula como `Cantidad × Precio`
   (no kilos ni cajas).
8. `inserta_ventas.ExecProc` graba el renglón en `ventas` (con el código
   real y `FCajasCalc`/`kilos` ya convertidos).
9. `qmarcapresentacion.ExecSQL` marca `ventas.id_presentacion`.
10. El trigger `tr_ventas_presentacion_upd` en Informix inserta el
    renglón de auditoría en `inartrinv_peso`.

## 5. Qué falta / posibles siguientes pasos

- El programa de mantenimiento (`UMantArticulos.pas`) es donde se da de
  alta cada `art_presentacion` — ahí se define si una presentación
  representa "cantidad contada" (`es_variable='N'`, con `factor_a_base`
  = peso de una unidad) o "peso pesado en báscula"
  (`es_variable='S'`, con `factor_a_base` normalmente en 1 y `tara_kg`
  = peso del envase).
- Si más adelante se necesita que la tara también aplique a
  presentaciones de peso variable multiplicada por una cantidad de
  unidades (no solo una resta simple), avisar para ajustar la fórmula de
  `CAJ_PROExit`.
- Este documento cubre solo el flujo de **venta** (`Uso='V'`); si se
  activa el flujo de compra con presentaciones, revisar que los mismos
  puntos (precio, total, `inserta_ventas`) tengan su equivalente en la
  pantalla de compras.
