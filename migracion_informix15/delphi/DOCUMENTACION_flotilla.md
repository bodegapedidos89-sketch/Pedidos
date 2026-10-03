# Catálogo de flotilla de reparto

Catálogo de los vehículos de reparto (principalmente camionetas y
camiones) — aditivo, **completamente independiente** del resto del
paquete: no depende de `art_producto`/`art_presentacion`, no toca
`ventas` ni ningún objeto legacy, y nada de `03..08` depende de él. Se
puede crear en cualquier momento después de que la base ya exista
(Paso 1 del `00_LEEME_migracion.md`).

## 1. Esquema (`09_flotilla.sql`)

Una sola tabla, `flotilla_vehiculo`:

| Columna | Qué guarda |
|---|---|
| `id_vehiculo` | SERIAL, llave interna |
| `num_emp` | Empresa |
| `numero_economico` | Clave interna del vehículo (la que usa el despachador), ej. `CAM-01` |
| `tipo_vehiculo` | `P` = Camioneta (pickup), `C` = Camión |
| `placas` | Placas del vehículo |
| `marca` / `modelo` / `anio` | Datos de identificación, todos opcionales |
| `capacidad_kg` | Carga útil, informativo (no se usa todavía para validar nada en reparto) |
| `chofer_habitual` | Texto libre — no hay catálogo de choferes/empleados todavía |
| `activo` | `S`/`N`, default `S` |

Único índice: `(num_emp, numero_economico)` único, para que no se
repita el mismo número económico en la misma empresa.

## 2. Mantenimiento (`UMantFlotilla.pas`)

Pantalla CRUD simple, calcada de `UMantBundles.pas`: buscar (por número
económico, placas o marca), grid, formulario de captura, Nuevo /
Guardar / Eliminar. `btnGuardarVehiculoClick` busca primero por
`(num_emp, numero_economico)` para decidir INSERT vs UPDATE, igual que
el resto de las pantallas de mantenimiento de este paquete — así
guardar dos veces el mismo número económico actualiza en vez de
duplicar.

`Año` y `Capacidad (kg)` son opcionales: si se dejan vacíos se guardan
como `NULL` (vía `TParam.Clear`), no como cero.

## 3. Menú (`UMenuPrincipal.pas`)

Botón nuevo "Flotilla de Reparto" en el menú principal, mismo patrón
`Create(Application) / ShowModal / Free` que los demás.

## 4. Qué falta / fuera de alcance por ahora

Esto es **solo el catálogo**. Todavía no existe:

- Enlace entre una venta/ruta y un vehículo específico (qué unidad
  repartió qué pedido).
- Catálogo de choferes (por eso `chofer_habitual` es texto libre, no
  una llave foránea).
- Control de mantenimiento/kilometraje/combustible.

Si alguno de estos se necesita después, se agrega aditivo sobre esta
misma tabla (una columna o una tabla nueva que la referencie por
`id_vehiculo`), sin tocar lo que ya existe.
