# Migración Informix SE 10.0 → Informix Innovator-C 15.0.x (CentOS/RHEL)

Este paquete tiene 9 archivos SQL y este LÉEME. **Ningún archivo aquí mueve
datos por sí solo** — el esquema (tablas/índices/procedimientos/triggers)
y los datos se migran por separado, que es como IBM/HCL recomiendan hacerlo.

## Orden recomendado

### Paso 0 — Antes de tocar nada
- Confirma que tu SO exacto (versión de CentOS/RHEL/Rocky/Alma) está en la
  matriz de certificación oficial de la versión de Informix 15.0.x que vas
  a instalar. No lo asumas — la certificación es por build específico.
- Crea en el servidor nuevo los usuarios del sistema operativo que sean
  dueños de objetos en el esquema legacy (mínimo `informix`; revisa si
  también necesitas crear el usuario real detrás de `"xxx"` — así aparece
  anonimizado en el dump que me diste, confirma el nombre real en tu
  servidor SE 10.0 antes de continuar).
- Verifica el locale/codepage real de tu SE 10.0 (acentos, ñ) con
  `onstat -g glo` en el servidor viejo, y usa el mismo en el nuevo.

### Paso 1 — Migrar el ESQUEMA + DATOS juntos (la forma recomendada)
En el servidor **viejo** (SE 10.0), por cada base de datos:
```
dbexport -d informixserver_origen -ss -q nombrebase
```
Esto genera una carpeta `nombrebase.exp/` con el `.sql` del esquema y los
archivos `.unl` de datos de cada tabla. **Copia esa carpeta al servidor
nuevo** (scp/sftp).

En el servidor **nuevo** (IDS 15 Innovator-C):
```
dbimport -d nuevoserver -c nombrebase
```
`dbimport` crea la base, las tablas, los índices, los procedimientos y los
triggers, y carga los datos — todo en un solo paso. Esto reemplaza usar
`02_esquema_legacy_original.sql` manualmente.

`dbexport` bloquea la base en modo exclusivo (nadie más puede estar
conectado) — hazlo en una ventana de mantenimiento.

### Paso 1 alterno — Si prefieres esquema y datos por separado
Usa `01_crea_base_datos.sql` + `02_esquema_legacy_original.sql` para crear
la base vacía con la estructura, y luego carga los datos aparte con
`dbimport` apuntando solo a los `.unl` (o con tu propio proceso de carga).
`02_esquema_legacy_original.sql` es tu dump de esquema tal cual (sin datos,
sin modificar), útil también como **referencia/comparación** para validar
que lo que hizo `dbexport`/`dbimport` automáticamente coincide.

### Paso 2 — Validar el esquema migrado
- Compara conteo de tablas, índices, procedimientos y triggers entre viejo
  y nuevo servidor (`dbschema -d nombrebase` en ambos y compara).
- Corre un cuadre de existencias/saldos contra el respaldo del día del
  corte, artículo por artículo, antes de dar por buena la migración.

### Paso 3 (reset opcional, fase de pruebas) — Borrar todo lo nuevo
Mientras se esté probando, para volver a crear el Paso 3 + 3b desde cero
en vez de asumir en qué quedó a medias un intento anterior:
```
dbaccess nombrebase 00_drop_objetos_nuevos.sql
```
Borra todo lo que agregan `03_objetos_presentaciones.sql` y
`delphi/04..08*.sql` (tablas, procedimientos, triggers, las columnas que
se le agregaron a `ventas` y a `art_presentacion`) y **no toca ningún
objeto legacy**. Las dos columnas de `08_codigo_barras.sql`
(`codigo_barras`, `codigo_bascula`) se van solas al `DROP TABLE
art_presentacion` — no hace falta ningún `DROP` aparte para ellas. Si algún objeto
de la lista todavía no existe, ese `DROP` puntual marca error y sigue con
el resto — no hace falta correrlo en un orden específico según qué tanto
se haya aplicado antes. Después de este reset, sigue con el Paso 3 normal.

### Paso 3 — Objetos nuevos (catálogo unificado de presentaciones)
Solo después de que el esquema legacy ya esté completo y validado en el
servidor nuevo, corre:
```
dbaccess nombrebase 03_objetos_presentaciones.sql
```
(edita antes el `<NOMBREBASE>` del `DATABASE` al inicio del archivo).

### Paso 3b — Bundles, recepción, cierre diario, motor de Kardex y código de barras
Todo lo de aquí en adelante es aditivo sobre lo que dejó el Paso 3 — no
modifica ni un solo objeto legacy, así que no hay ventana de mantenimiento
especial más allá de la normal para correr DDL. Los 5 archivos son
independientes entre sí a nivel SQL (ninguno referencia procedimientos o
tablas de otro), salvo que todos dan por hecho que `art_producto` /
`art_presentacion` del Paso 3 ya existen (`08_codigo_barras.sql` además
necesita que `art_presentacion` ya exista para poder agregarle sus dos
columnas nuevas). El orden numérico es solo por trazabilidad con la
auditoría que se les corrió:
```
dbaccess nombrebase 04_bundles.sql
dbaccess nombrebase 05_recepcion_compras.sql
dbaccess nombrebase 06_cierre_diario.sql
dbaccess nombrebase 07_kardex_por_presentacion.sql
dbaccess nombrebase 08_codigo_barras.sql
```
(edita antes el `<NOMBREBASE>` del `DATABASE` al inicio de cada archivo;
los 5 viven en `delphi/`, no en la raíz de `migracion_informix15/`).

### Paso 3c — Catálogo de flotilla de reparto (independiente)
```
dbaccess nombrebase delphi/09_flotilla.sql
```
A diferencia de 04..08, este archivo **no depende de nada del Paso 3**
(ni de `art_producto`/`art_presentacion` ni de ningún objeto legacy) —
se puede correr en cualquier momento después del Paso 1, incluso antes
del Paso 3. Crea `flotilla_vehiculo` (camionetas/camiones) para
`UMantFlotilla.pas`. Ver `delphi/DOCUMENTACION_flotilla.md`.

Verifica después de correrlos que los objetos nuevos quedaron dados de
alta (ajusta el nombre de base):
```sql
SELECT tabname FROM systables
 WHERE tabname IN ('bundle_producto','bundle_detalle','oc_pedido_detalle',
   'oc_recepcion_detalle','hist_existencia_negativa','hist_recalculo_kardex',
   'hist_log_cierre','art_existencia','art_kardex_mov','flotilla_vehiculo');

SELECT procname FROM sysprocedures
 WHERE procname IN ('sp_recibe_renglon_oc','sp_cierre_recalcula_kardex',
   'sp_cierre_detecta_negativos','sp_aplica_mov_kardex',
   'sp_ajusta_existencia_base');
```
Cada consulta debe regresar todas las filas esperadas.

Antes de generalizar, prueba el flujo completo (compra → recepción → venta
→ cierre) con **un solo producto real de bajo riesgo** dado de alta en
`art_presentacion` vía `UMantArticulos.pas` — la migración está diseñada
para ser gradual justamente por esto: mientras un artículo no tenga fila en
`art_presentacion`, sigue funcionando exactamente igual que hoy.

### Paso 4 — Delphi 7
Repunta el `DatabaseName`/alias BDE (o el driver ODBC, según cómo termines
conectando) de tus programas Delphi al servidor nuevo, y agrega los
`.dcu`/ejecutables recompilados de `formato.pas`, `UOCRecepcion.pas`,
`UCierreDiario.pas`, `UReporteNegativos.pas`, `UMantArticulos.pas`,
`UMantBundles.pas` y `UMantFlotilla.pas` (todos ya integrados en
`UMenuPrincipal.pas`) — sus `TStoredProc`/`TQuery` fallan al primer
`Open`/`ExecProc` si el Paso 3b (o, para `UMantFlotilla.pas`, el Paso 3c)
no se corrió antes en ese servidor. `JUNTA.pas` y `UFormPresentacion.pas`
también cambiaron (lectura de código de barras escaneado) y dependen de
que `08_codigo_barras.sql` ya haya corrido. Prueba primero `JUNTA.pas`
(venta normal y escaneando un código de barras) y el programa de
mantenimiento de artículos contra el servidor nuevo en un ambiente de
pruebas antes del corte real.

## Archivos de este paquete

| Archivo | Qué es |
|---|---|
| `01_crea_base_datos.sql` | `CREATE DATABASE` en el servidor nuevo, con notas de locale/log/ownership |
| `02_esquema_legacy_original.sql` | Tu dump de esquema SE 10.0 completo, sin modificar — 208 tablas, ~130 índices, 54 procedimientos, 8 triggers |
| `00_drop_objetos_nuevos.sql` | Reset de fase de pruebas: borra todo lo de 03..09 sin tocar nada legacy |
| `03_objetos_presentaciones.sql` | Las tablas/procedimiento/trigger nuevos del catálogo unificado (versión final acordada) |
| `delphi/04_bundles.sql` | Tablas de canastas/combos (`bundle_producto`, `bundle_detalle`) — sin procedimientos, todo lo resuelve Delphi |
| `delphi/05_recepcion_compras.sql` | `oc_pedido_detalle`/`oc_recepcion_detalle` + `sp_recibe_renglon_oc` — separa capturar el pedido de recibirlo en almacén |
| `delphi/06_cierre_diario.sql` | Detección de negativos, recálculo de Kardex y su historial, para `UCierreDiario.pas` |
| `delphi/08_codigo_barras.sql` | `codigo_barras`/`codigo_bascula` en `art_presentacion` — identificación por código de barras fijo o de báscula para `JUNTA.pas` |
| `delphi/07_kardex_por_presentacion.sql` | `art_existencia`/`art_kardex_mov` + `sp_aplica_mov_kardex`/`sp_ajusta_existencia_base` — el motor de Kardex unificado por producto |
| `delphi/09_flotilla.sql` | `flotilla_vehiculo` — catálogo de camionetas/camiones de reparto, independiente del resto, para `UMantFlotilla.pas` |
