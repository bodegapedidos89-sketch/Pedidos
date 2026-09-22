# Migración Informix SE 10.0 → Informix Innovator-C 15.0.x (CentOS/RHEL)

Este paquete tiene 3 archivos SQL y este LÉEME. **Ningún archivo aquí mueve
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

### Paso 3 — Objetos nuevos (catálogo unificado de presentaciones)
Solo después de que el esquema legacy ya esté completo y validado en el
servidor nuevo, corre:
```
dbaccess nombrebase 03_objetos_presentaciones.sql
```
(edita antes el `<NOMBREBASE>` del `DATABASE` al inicio del archivo).

### Paso 4 — Delphi 7
Repunta el `DatabaseName`/alias BDE (o el driver ODBC, según cómo termines
conectando) de tus programas Delphi al servidor nuevo. Prueba primero
`JUNTA.pas` y el programa de mantenimiento de artículos contra el servidor
nuevo en un ambiente de pruebas antes del corte real.

## Archivos de este paquete

| Archivo | Qué es |
|---|---|
| `01_crea_base_datos.sql` | `CREATE DATABASE` en el servidor nuevo, con notas de locale/log/ownership |
| `02_esquema_legacy_original.sql` | Tu dump de esquema SE 10.0 completo, sin modificar — 208 tablas, ~130 índices, 54 procedimientos, 8 triggers |
| `03_objetos_presentaciones.sql` | Las tablas/procedimiento/trigger nuevos del catálogo unificado (versión final acordada) |
