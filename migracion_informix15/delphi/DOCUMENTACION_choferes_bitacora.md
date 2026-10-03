# Catálogo de choferes y bitácora de combustible/mantenimiento

Dos piezas aditivas sobre el catálogo de flotilla (`09_flotilla.sql`):
el catálogo de choferes y la bitácora de combustible/mantenimiento por
vehículo. Ninguna de las dos toca `flotilla_vehiculo` ni ningún objeto
legacy.

## 1. Choferes (`10_flotilla_choferes.sql`, `UMantChoferes.pas`)

Tabla `flotilla_chofer`: clave interna, nombre, número de licencia,
vigencia de la licencia, teléfono, activo. Pantalla CRUD idéntica en
patrón a `UMantFlotilla.pas` (buscar/nuevo/guardar/eliminar).

**No** se liga aquí a `flotilla_vehiculo.chofer_habitual` (que sigue
siendo texto libre, informativo — "el chofer de costumbre de esta
unidad"). La asignación real de qué chofer va con qué vehículo en un
día específico se captura en `reparto_ruta` (ver
`DOCUMENTACION_reparto.md`), que sí referencia esta tabla por
`id_chofer`.

Campo a vigilar: `vigencia_licencia` queda capturado para que, si se
necesita, se agregue después un aviso (reporte o query) de licencias
por vencer — no hay todavía ninguna alerta automática.

## 2. Bitácora de combustible/mantenimiento (`11_flotilla_bitacora.sql`, `UMantBitacoraFlotilla.pas`)

Una sola tabla, `flotilla_bitacora`, para los dos tipos de evento
(columna `tipo`: `C` combustible, `M` mantenimiento) — comparten
fecha/kilometraje/costo/observaciones y se separaron en una sola tabla
porque dividirlos en dos no agregaba nada; `litros` solo aplica a
combustible.

Pantalla maestro-detalle (mismo patrón que `UMantBundles.pas`): se
busca y selecciona el vehículo arriba, y abajo se captura/consulta su
bitácora. Cada entrada queda en el historial — no hay edición, solo
alta y baja, para que la bitácora sea un registro confiable de lo que
realmente se gastó/hizo.

### Qué falta / fuera de alcance por ahora

- No hay alertas de "próximo servicio" por kilometraje o fecha —
  `flotilla_bitacora` ya guarda el kilometraje de cada evento, así que
  un reporte futuro puede calcular el siguiente servicio comparando
  contra el último registro de mantenimiento, sin tocar el esquema.
- No hay reportes de costo por vehículo/periodo todavía — los datos ya
  están capturados para que, cuando se necesite, sea una consulta
  nueva, no un cambio de esquema.
