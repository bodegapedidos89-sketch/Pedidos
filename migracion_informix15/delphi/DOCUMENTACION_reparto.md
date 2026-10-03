# Pedidos a ruta de reparto

Módulo nuevo para armar la ruta del día (vehículo + chofer de la
flotilla), asignarle los pedidos que van a reparto, imprimir la
remisión que el cliente firma/sella de recibido, y dar seguimiento de
estatus a cada pedido. Aditivo sobre `09_flotilla.sql` y
`10_flotilla_choferes.sql` — no depende de `03..08` ni los modifica.

## 1. Por qué no hay catálogo de clientes aquí

El esquema legacy (`02_esquema_legacy_original.sql`, tabla `ventas`)
no tiene un catálogo de clientes con dirección — cada venta trae su
`nombre` (comprador) como texto suelto, sin domicilio ni teléfono; la
mayoría de las ventas de este negocio son de mostrador. Por eso
`reparto_pedido` (`12_reparto.sql`) es autocontenido: captura cliente,
dirección de entrega y teléfono directamente, sin asumir que existe un
cliente dado de alta en otro lado.

`folio_venta`/`sucursal_venta`/`tipo_venta` quedan como referencia
**opcional** para cuando el pedido sí viene de una venta ya facturada
en `JUNTA.pas` — si se capturan, la remisión imprime también el
detalle de productos de esa venta (ver sección 4).

## 2. Esquema (`12_reparto.sql`)

| Tabla | Para qué |
|---|---|
| `reparto_ruta` | Una fila por vehículo/chofer que sale a reparto en un día. Estatus: `A` Armando, `S` Salió, `C` Cerrada (ya regresó). |
| `reparto_pedido` | Cada pedido asignado a una ruta. Ver estatus abajo. |
| `reparto_pedido_estatus_hist` | Un renglón por cada cambio de estatus de un pedido — la base del tablero de "tiempo real" y de cualquier auditoría futura. |

Estatus de `reparto_pedido`:

| Código | Significado |
|---|---|
| `P` | Pendiente — asignado a la ruta, todavía en almacén |
| `C` | Cargado — ya está subido al vehículo |
| `R` | En ruta — el vehículo ya salió con este pedido a bordo |
| `E` | Entregado — el cliente firmó/selló de recibido |
| `N` | No entregado — rechazo, cliente cerrado, dirección no encontrada, etc. |

`activo = 'N'` en `reparto_pedido` es una baja lógica (se quitó de la
ruta sin borrar su historial) — distinto de los estatus de arriba.

## 3. Pantalla `UReparto.pas`

Inspirada en el patrón de captura de `JUNTA.pas` (grid + panel de
captura + botones de acción), pero adaptada a un proceso distinto —
aquí no se vende nada, se despacha.

**Panel izquierdo — la ruta:**
- Captura/resuelve vehículo por número económico y chofer por clave
  (`edtClaveVehiculo`/`edtClaveChofer`, validados al salir del campo
  contra `flotilla_vehiculo`/`flotilla_chofer`, igual que el patrón de
  "código + resuelve en Exit" ya usado en `UMantBundles.pas`).
- `Nueva ruta` / `Guardar ruta` (inserta o actualiza el encabezado).
- `Marcar salida` / `Marcar regreso` (ponen `hora_salida`/
  `hora_regreso` con `Now` y mueven el estatus de la ruta).
- Grid de rutas de la fecha capturada (doble clic para cargar esa
  ruta y sus pedidos).
- Grid de pedidos de la ruta seleccionada (doble clic para cargar un
  pedido al panel de captura).

**Panel derecho — el pedido:**
- Orden de visita, referencia opcional a la venta (folio/sucursal/
  tipo), cliente, dirección de entrega, teléfono, referencia de
  pedido, importe total.
- `Nuevo pedido` / `Guardar pedido` / `Quitar de ruta` (baja lógica).
- `Imprimir remisión` (ver sección 4).
- Captura de la entrega: "quién recibió" y observaciones, usados por
  los botones de cambio de estatus `Marcar: Cargado` / `En ruta` /
  `Entregado` / `No entregado` — cada uno escribe el nuevo estatus en
  `reparto_pedido` **y** una fila en `reparto_pedido_estatus_hist`
  (dos sentencias seguidas, sin transacción explícita — mismo estilo
  que el resto de las pantallas de este paquete, ej.
  `UMantBundles.pas`). `Entregado` exige capturar quién recibió;
  `No entregado` exige la observación (el motivo).

El campo "Capturó (iniciales)" (`edtUsuario`) es texto libre — este
paquete no tiene un sistema de login propio, así que el historial
registra lo que el despachador teclee ahí.

## 4. Remisión impresa (`ImprimeRemision` en `UReparto.pas`)

Impresión directa por `Printer.Canvas.TextOut`, mismo estilo "GDI
crudo" que ya usa `formato.pas` para los tickets de venta (sin
Quickreport ni reportes externos). Imprime:

1. Encabezado: nombre de la empresa, "REMISIÓN DE ENTREGA No. `<id_pedido>`"
   (el folio de remisión es el mismo `id_pedido`, no se duplica un
   contador aparte).
2. Datos de la ruta: fecha, vehículo (número económico + placas),
   chofer.
3. Cliente, dirección, teléfono, referencia de pedido.
4. Si el pedido trae `folio_venta` capturado: el detalle de productos
   de esa venta (descripción/cajas/kilos/importe, leído directo de
   `ventas`). Si no, se omite esta sección y solo se imprime el
   importe total.
5. **Espacio en blanco para observaciones** — un rectángulo dibujado
   con `Canvas.Rectangle`, en blanco, para que el chofer o el cliente
   anoten algo a mano al momento de la entrega.
6. Línea de firma ("Firma o sello de recibido"), más los campos
   "Nombre de quien recibe" y "Fecha y hora de entrega" en blanco para
   llenar a mano — este papel físico, firmado/sellado, es el
   comprobante de entrega.

Después de imprimir se marca `remision_impresa = 'S'` (solo
informativo — se puede reimprimir las veces que haga falta, no hay
límite ni control de copias).

## 5. Estatus en tiempo real — opciones (lo que ya está vs. lo que falta)

El dato ya existe al segundo en la base (`reparto_pedido.estatus` +
`reparto_pedido_estatus_hist` con fecha/hora de cada cambio) en cuanto
alguien lo captura en `UReparto.pas`. La pregunta real es **quién
captura ese cambio y con qué tan poco retraso** — eso es una decisión
de proceso/infraestructura, no solo de pantalla, así que aquí van las
opciones de más a menos inmediatas de implementar, para que decidas
cuál usar (se puede empezar por la más simple y subir después sin
tocar el esquema):

### Opción A — Tablero de monitoreo (`URepartoMonitor.pas`) — YA IMPLEMENTADO
Pantalla de solo lectura con `TTimer` que refresca el query cada N
segundos (configurable, mínimo 5s para no martillar la base),
coloreando cada pedido por estatus (gris/amarillo/azul claro/verde/
rojo). Pensada para quedar abierta en una pantalla de la oficina o del
almacén. Cero infraestructura nueva — es la base para cualquier otra
opción y ya resuelve "ver el estatus actualizado" para quien esté
frente a una computadora con el sistema.

### Opción B — El despachador captura por teléfono/radio (proceso, no código)
El chofer avisa por llamada/WhatsApp/radio ("ya cargué", "ya entregué
el 3"), y quien esté en la oficina lo marca en `UReparto.pas`. Cero
desarrollo adicional — ya funciona con lo que se construyó aquí. Es la
opción más barata y la que recomendaría para empezar: valida si el
seguimiento por estatus realmente ayuda en la operación antes de
invertir en que el chofer capture el mismo directamente.

### Opción C — El chofer captura directo desde su celular (requiere decisión de infraestructura)
Si el volumen de rutas/pedidos crece lo suficiente para que la Opción
B sea un cuello de botella, el siguiente paso natural es una página
web ligera (no una app nativa) que el chofer abra desde el celular
para marcar "Cargado"/"En ruta"/"Entregado"/"No entregado" de un
pedido — por ejemplo abriendo un link con el `id_pedido` (que podría
ir como código QR impreso en la misma remisión, para que lo escanee
sin teclear nada).

Esto **sí implica una decisión de infraestructura que no es solo
Delphi**, porque alguien tiene que exponer una forma seguro de
escribir en `reparto_pedido`/`reparto_pedido_estatus_hist` desde fuera
de la red local: un servicio intermedio (ej. un pequeño backend REST)
que hable con Informix del lado del servidor — nunca exponer el
puerto de Informix directo a internet. Antes de construir esto hace
falta decidir: quién lo hospeda, con qué conectividad cuentan los
choferes (datos móviles, cobertura en ruta), y si el volumen de
pedidos ya lo justifica frente a la Opción B.

### Opción D — Notificación push/SMS al cliente o a la oficina (futuro)
Una vez que exista la Opción C (o cualquier forma de captura casi
inmediata), avisar automáticamente ("tu pedido va en camino" / "tu
pedido fue entregado") es una capa adicional sobre los mismos cambios
de estatus — no requiere tocar el esquema otra vez, solo agregar un
disparador (correo/SMS) en el momento en que se inserta la fila en
`reparto_pedido_estatus_hist`. Se deja como posible siguiente paso, no
como parte de esta entrega.

**Resumen:** empieza con A + B (ya entregado, cero infraestructura
nueva). Sube a C solo si el volumen lo justifica, y D después de C.
