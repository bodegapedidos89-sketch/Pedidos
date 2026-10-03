# Código de barras por presentación

Identificación por código de barras para las presentaciones que se
venden principalmente por menudeo — aditivo sobre `art_presentacion`
(`03_objetos_presentaciones.sql`). No toca ningún objeto legacy ni
ningún objeto de `04..07`.

## 1. Esquema (`08_codigo_barras.sql`)

Dos columnas nuevas en `art_presentacion`, ambas nullable:

| Columna | Para qué presentaciones | Qué guarda |
|---|---|---|
| `codigo_barras CHAR(14)` | `es_variable = 'N'` (fijo, impreso de fábrica/empaque) | El código completo, 13 dígitos. Búsqueda por igualdad exacta. |
| `codigo_bascula CHAR(5)` | `es_variable = 'S'` (peso variable, báscula) | Solo el segmento interno de 5 dígitos que identifica la presentación — el peso **no** se guarda, viene codificado en cada código escaneado y cambia en cada venta. |

Índices simples (no únicos — mientras no todas las presentaciones
tengan código, puede haber varias filas en `NULL`) sobre
`(num_emp, codigo_barras)` y `(num_emp, codigo_bascula)`.

### Formato del código de báscula (confirmado con el usuario)

EAN-13, 2+5+5+1:

```
dígitos 1-2    prefijo interno de báscula, 20 a 29
dígitos 3-7    codigo_bascula (5 dígitos) — identifica la presentación
dígitos 8-12   peso en GRAMOS (5 dígitos, con ceros a la izquierda)
dígito  13     dígito verificador (no se valida)
```

Ejemplo: código escaneado `2000102019507` → prefijo `20` (en rango) →
`codigo_bascula = 00102` → peso = `01950` = 1.950 kg.

## 2. Captura (`UMantArticulos.pas`)

Dos campos nuevos en el panel de presentación: "Código de barras fijo"
y "Código interno báscula". Validación al guardar:

- Código de barras fijo: si se captura, tiene que ser de **13 dígitos
  numéricos exactos** — es el mismo largo que `JUNTA.pas` exige para
  reconocer algo como código de barras escaneado. Si no coincide en
  largo, la captura queda "muerta" (nunca va a hacer match en el
  mostrador) sin que se note, por eso se valida aquí.
- Código de báscula: si se captura, 5 dígitos numéricos exactos, y solo
  se permite si "Es variable" está marcado (no tiene sentido en una
  presentación de empaque fijo).
- Si el campo queda vacío, se guarda `NULL` (no cadena vacía), para que
  el índice de búsqueda no confunda "sin código" con un código vacío.

## 3. Resolución en venta (`UFormPresentacion.ResuelvePorCodigoBarras`)

Punto de entrada único, análogo a `Seleccionar` pero sin preguntarle
nada al cajero — un código de barras ya identifica **una sola**
presentación (a diferencia de teclear el código ancla, que puede tener
varias y ahí sí hace falta el selector):

```pascal
class function TFormPresentacion.ResuelvePorCodigoBarras(Database: TDatabase;
  const NumEmp, CodigoEscaneado: string; out IdPresentacion: Integer;
  out CodArtAncla, CodArtLegacy: string; out Factor: Double;
  out PrecioDerivado: Boolean; out Tara: Double; out EsVariable: Boolean;
  out PesoKgBascula: Double): Boolean;
```

1. Si `CodigoEscaneado` no tiene exactamente 13 dígitos numéricos,
   regresa `False` de inmediato — el llamador lo trata como lo que sea
   que haya tecleado (código ancla, bundle, etc.).
2. Si el prefijo está entre `20` y `29`: intenta resolver como código de
   báscula (`codigo_bascula`, solo presentaciones `es_variable='S'`) y
   decodifica el peso. Si no hace match, **no asume que es inválido** —
   sigue al paso 3 (podría coincidir, aunque es muy improbable, con un
   código fijo que por casualidad empiece igual).
3. Intenta resolver como código fijo (`codigo_barras`, igualdad exacta).

## 4. Dónde se conecta (`JUNTA.pas`, `CODIGOARTKeyPress`)

Justo al presionar Enter en `CODIGOART`, antes de la detección de
bundle y de `TFormPresentacion.Seleccionar`:

- Si el texto tecleado/escaneado mide 13 caracteres y son todos dígitos
  → se trata como código de barras: se llama
  `ResuelvePorCodigoBarras`, se fija `CODIGOART.KeyValue` directo al
  `cod_art_legacy` resuelto, y si es de báscula se **prellena
  `CAJ_PRO.Text` con el peso decodificado** — el cajero no teclea nada,
  solo escanea.
- Si no mide 13 dígitos → sigue exactamente el flujo de siempre (check
  de bundle, luego `Seleccionar` con su selector de presentación si hay
  ambigüedad).

Ambos caminos convergen en el mismo punto (`CODIGOART.KEYVALUE` ya
resuelto) antes de seguir con la búsqueda de precio — el resto de
`CODIGOARTKeyPress`, igual que todo lo demás del motor de presentaciones,
sigue sin tocarse.

## 5. Qué falta / decisión pendiente del usuario

- Las presentaciones que ya existen (aguacate CAJA/KG/BOLSA5 del
  ejemplo, etc.) no tienen código capturado todavía — hay que ir
  dándolas de alta en `UMantArticulos.pas` según se vayan etiquetando
  físicamente los productos de menudeo.
- El dígito verificador del EAN-13 no se valida. Si en la práctica
  llegan a escanearse códigos corruptos con frecuencia, se puede
  agregar la validación de checksum GS1 estándar en
  `ResuelvePorCodigoBarras` sin tocar nada más.
