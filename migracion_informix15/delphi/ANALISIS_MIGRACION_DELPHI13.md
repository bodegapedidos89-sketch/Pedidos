# Análisis de migración: Delphi 7 → Delphi 13 (RAD Studio 13 Florence)

Análisis exhaustivo, basado en inspección directa del código de este
repositorio (no en generalidades de "qué cambia entre Delphi 7 y
Delphi moderno") — cada hallazgo cita archivo/línea real. Objetivo:
identificar TODO lo que hay que resolver antes de que estos programas
compilen y corran en Delphi 13. **Esto es solo el análisis — no se
modificó ningún programa.**

## Resumen ejecutivo

Esta migración **no es un recompilado**. Es, en la práctica, una
reescritura de la capa de acceso a datos de los 14 formularios más la
reconstrucción completa del subsistema de reportes/impresión de
`JUNTA.pas` y `formato.pas`. Los bloqueadores dependen de componentes
que Embarcadero eliminó del producto hace más de una década (Rave
Reports, tablas Paradox) y de un motor (BDE) que sigue instalable pero
oficialmente desaconsejado. Ninguno de los 6 archivos SQL (`00`..`12`)
ni la lógica de negocio en sí están en riesgo — el problema es 100%
de **plomería de acceso a datos y de reportes**, no de las reglas de
presentaciones/Kardex/reparto que ya construimos.

| Bloqueador | Severidad | Alcance |
|---|---|---|
| BDE (`TDatabase`/`TQuery`/`TStoredProc`/`TTable`) | 🔴 Crítico | ~268 componentes en 14 formularios |
| Rave Reports (`TRvProject`/`TRvSystem`/`TRvRenderPDF`) | 🔴 Crítico | `JUNTA.pas` (8 componentes) y `formato.pas` (2) + 2 archivos `.rav` que **no están en este repo** |
| Tablas Paradox locales (`.db` vía alias BDE `ventas`) | 🔴 Crítico | 6 tablas/consultas locales en `JUNTA.pas` |
| Unidades del proyecto faltantes (`PERSONAL`, `MENSAJE`..`mensaje4`) | 🔴 Bloquea compilar | Referenciadas en `uses` de `JUNTA.pas`/`formato.pas`, no están en el repo |
| No existe `.dpr`/`.dproj` | 🟡 Medio (trabajo, no riesgo) | Todo el paquete |
| Indy (SMTP sin TLS visible) | 🟡 Medio | `JUNTA.pas`, envío de CFDI por correo |
| TeeChart (`Chart, TeEngine, Series, TeeProcs`) | 🟢 Bajo-medio | Solo `UReporteNegativos.pas` |
| `jpeg` (Vcl.Imaging.Jpeg) | 🟢 Bajo | `formato.pas` (9 imágenes), no usado realmente en `JUNTA.pas` |
| Unicode / locale (`ShortDateFormat`, codepage Informix) | 🟢 Bajo-medio | Disperso, ya mitigado en parte |
| Licenciamiento FireDAC+Informix | 🟡 Decisión del usuario | Ver sección 7 |

---

## 1. BDE — el bloqueador #1

Los 14 formularios (los legacy y los que construimos en esta sesión)
usan `DB, DBTables` (`TDatabase`, `TQuery`, `TStoredProc`, `TTable`).
BDE **sigue siendo instalable** en RAD Studio 13 por compatibilidad,
pero Embarcadero es explícito: está deprecado, nunca tendrá soporte
Unicode, y no se debe usar para desarrollo nuevo — la recomendación
oficial es migrar a FireDAC.

Conteo real de componentes BDE por formulario (contando directo en
cada `.dfm`):

| Formulario | TDatabase | TQuery | TStoredProc | TTable |
|---|---|---|---|---|
| `JUNTA.dfm` | 1 | **144** | 12 | 24 |
| `formato.dfm` | 1 | 30 | 6 | 5 |
| `UCierreDiario.dfm` | 1 | 6 | 7 | 0 |
| `UOCRecepcion.dfm` | 1 | 3 | 2 | 0 |
| `UMantBundles.dfm` | 1 | 4 | 0 | 0 |
| `UReparto.dfm` | 1 | 3 | 0 | 0 |
| `UMantArticulos.dfm` | 1 | 3 | 0 | 0 |
| `UReporteNegativos.dfm` | 1 | 2 | 0 | 0 |
| `UMantBitacoraFlotilla.dfm` | 1 | 2 | 0 | 0 |
| `UMantChoferes.dfm` / `UMantFlotilla.dfm` / `URepartoMonitor.dfm` | 1 c/u | 1 c/u | 0 | 0 |
| `UFormPresentacion.dfm` / `UMenuPrincipal.dfm` | 0 | 0 | 0 | 0 |
| **Total** | **13** | **~199** | **27** | **29** |

**~268 componentes de dataset BDE en total**, de los cuales **181
viven solo en `JUNTA.dfm`** (el programa de ventas de mostrador — el
más grande y más riesgoso de migrar por mucho margen).

### Reemplazo recomendado: FireDAC

- `TDatabase` → `TFDConnection`
- `TQuery` → `TFDQuery`
- `TStoredProc` → `TFDStoredProc`
- `TTable` → `TFDTable` (solo para las tablas Informix reales — ver
  sección 3 para las que en realidad son archivos Paradox locales)

El SQL en sí (incluyendo el operador `MATCHES` de Informix que usan
varias pantallas nuevas de este repo, ej. `UMantBundles.pas`) viaja
como texto plano al motor — Informix lo interpreta igual sin importar
si lo manda BDE o FireDAC. **No hay que reescribir el SQL**, solo la
capa de componentes que lo transporta.

Lo que SÍ hay que auditar componente por componente al hacer el
cambio:
- `TParam.Clear` (para NULL) — patrón usado en todas las pantallas
  nuevas de esta sesión (`UMantFlotilla.pas`, `UReparto.pas`, etc.) —
  confirmar el equivalente exacto en `TFDParam` antes de asumir que
  es un alias directo.
- `SessionName` (18 usos en `JUNTA.dfm`) — concepto de `TSession` de
  BDE sin equivalente 1:1 en FireDAC; hay que revisar **para qué** se
  usaba cada sesión separada (aislar una conexión de un batch, etc.)
  y replicar la intención con conexiones FireDAC independientes.
- `StoredProcName` (`TStoredProc`) vs `TFDStoredProc.StoredProcName` —
  el auto-descubrimiento de parámetros (`DescribeProc` en BDE) tiene
  un mecanismo distinto en FireDAC (`Prepare`/`ParamCheck`); probar
  cada uno de los 27 `TStoredProc` contra el Informix real, no asumir.
- Precisión numérica: columnas `DECIMAL` de Informix llegan a BDE como
  `TFloatField`/`TBCDField` según el caso; FireDAC tiende a mapear
  `DECIMAL` a `TFMTBCDField`. Revisar cualquier código que dependa del
  tipo exacto del campo (casts, `is TBCDField`, etc. — no se encontró
  ninguno explícito en este repo, pero hay que confirmarlo en
  `formato.pas`/`JUNTA.pas` por su tamaño).

---

## 2. Rave Reports — eliminado de Delphi desde 2012 (XE3)

`JUNTA.pas`/`.dfm` y `formato.pas`/`.dfm` usan componentes Rave
(`TRvProject`, `TRvDataSetConnection`, `TRvSystem`, `TRvRenderPDF`) —
confirmado en el código, no solo en el `uses`:

```pascal
RvProject1: TRvProject;
RvDataSetConnection1: TRvDataSetConnection;
RvSystem1: TRvSystem;
RvRenderPDF1: TRvRenderPDF;
```

Rave Reports (los `Rp*` units: `RpDefine, RpRave, RpBase, RpSystem,
RpCon, RpConDS, RpRender, RpRenderPDF`) **no existe en ninguna versión
de Delphi desde la XE3 (2012)**. Hoy en RAD Studio 13 Florence no hay
forma de instalarlo ni de abrir estos componentes — ni siquiera para
verlos, se necesitaría una copia funcional de Delphi 7/2006 con Rave
instalado.

**Hallazgo más grave todavía**: el diseño de los reportes no vive en
el `.dfm` — se carga en tiempo de ejecución desde archivos externos
con ruta absoluta local, y **esos archivos no están en este repo**:

```
JUNTA.dfm:    ProjectFile = 'C:\delphi\reportes\Factura Electronica\FacturaORI.rav'
formato.dfm:  ProjectFile = 'C:\delphi\reportes\pruebas\reporte oc.rav'
```

Sin esos dos archivos `.rav` (hay que localizarlos en el disco de
producción o de alguna copia de respaldo), ni siquiera se puede saber
qué imprimían estos reportes para rediseñarlos. Con ellos en mano, el
camino recomendado es:

1. Abrir los `.rav` en Delphi 7 (o un visor de Rave Reports standalone
   si existe) para documentar su diseño (campos, agrupaciones, totales).
2. Reconstruir cada reporte en **FastReport VCL** (el reemplazo que el
   propio mercado adoptó tras la salida de Rave — tiene un conversor
   Rave→FastReport, pero es una herramienta de pago, no viene incluida
   con RAD Studio).
3. Alternativa sin costo adicional: seguir el patrón que ya usamos en
   **este mismo repo** para la remisión de reparto (`UReparto.pas`,
   `ImprimeRemision`) — dibujo directo con `Printer.Canvas.TextOut`,
   sin motor de reportes. Viable si el diseño real del `.rav` resulta
   ser razonablemente simple (un ticket/factura, no un reporte con
   subreportes/gráficas).

---

## 3. Tablas Paradox locales — otro motor que ya no existe

Además de Informix (alias BDE `comyleg`), `JUNTA.dfm` usa un
**segundo alias BDE, `ventas`**, que no es Informix — apunta a
archivos `.DB` locales (formato **Paradox**, el driver "Standard" de
BDE):

| Componente | Archivo Paradox |
|---|---|
| `tdescto: TTable` | `descto.db` |
| `temp_ventas: TTable` / `temp: TTable` | `tmp_imprime.db` |
| `ARCHIVOS: TTable` | `ARCHIVOS.db` |
| `corte_new: TTable` | `corte_new.db` |
| `LISTAPRECIOS2: TTable` | `listaprecios.db` |

Más otros `TQuery` que también corren contra ese mismo alias
(`QBORRAR`, `qarchivos`, `Query3`, `agregar_corte`, `qtablet`,
`qborrota`) — es decir, parte de la lógica de `JUNTA.pas` depende de
archivos planos locales, no de la base de datos central.

**El driver Paradox de BDE no tiene ningún equivalente en FireDAC.**
No es "cambiar el componente", es decidir dónde vive ese dato de ahora
en adelante. Dos caminos, sin mezclar ambos:

- **Migrar esas 5 tablas a Informix** (como tablas reales dentro de
  `comyleg`) — consistente con el resto de este proyecto, que ya movió
  todo lo demás a Informix. Recomendado si el volumen de datos es
  pequeño (`descto`/`listaprecios` parecen catálogos; `tmp_imprime`
  parece una tabla de staging temporal, candidata perfecta para una
  tabla temporal de Informix en vez de un archivo).
- **SQLite vía FireDAC** si de verdad se necesita que sean locales
  (ej. `tmp_imprime` si es estrictamente por-estación-de-trabajo).

Cualquiera de los dos requiere **exportar los `.DB` actuales**
(herramienta BDE Administrator / Database Desktop, o un script en
Delphi 7 todavía funcional, antes de perder acceso al motor Paradox)
y decidir el destino antes de tocar el código de `JUNTA.pas` que los
usa.

---

## 4. Unidades del proyecto que no están en este repositorio

`JUNTA.pas` referencia estas unidades en su `uses` y **no existen en
el repo** (ni como `.pas` ni como `.dcu`):

```
PERSONAL, MENSAJE, mensaje2, mensaje3, mensaje4
```

`formato.pas` también referencia `personal`. No se encontró ningún uso
explícito con prefijo de unidad (`Personal.algo`) en el cuerpo del
código revisado, lo que sugiere que exponen identificadores globales
(constantes, funciones sueltas, o formularios que se instancian sin
calificar) — sin el archivo real no se puede saber qué contienen ni
cuánto código adicional representan.

**Esto bloquea literalmente poder intentar compilar**, independiente
de cualquier otro hallazgo de este documento. Antes de cualquier otro
paso: localizar estos 5 archivos `.pas` (deben existir en la máquina
de desarrollo original o en algún respaldo — no llegaron en el dump
que se usó para armar este repositorio) y agregarlos al proyecto.

---

## 5. No existe archivo de proyecto (`.dpr`/`.dproj`)

Este repositorio tiene las unidades (`.pas`/`.dfm`) pero **ningún
`.dpr` ni `.dproj`**. Un proyecto Delphi real necesita el `.dpr` (qué
formularios se auto-crean, en qué orden, `Application.Initialize`,
etc.) y Delphi 13 además espera un `.dproj` (configuración del IDE:
plataformas de destino, rutas de búsqueda, etc.). No es un riesgo
técnico — es trabajo de scaffolding puro, pero significa que migrar
no es "abrir el `.dpr` viejo con el IDE nuevo": hay que **reconstruir
el proyecto desde cero** apuntando a las 15 unidades que sí existen
aquí, más las 5 que faltan (sección 4).

---

## 6. Hallazgos secundarios

### Indy (envío de CFDI por correo) — riesgo medio
`JUNTA.pas` usa `TIdSMTP`/`TIdMessage` (Indy) para mandar las facturas
por correo. Indy viene incluido en RAD Studio 13, generalmente
compatible. **Pero**: no se encontró ninguna configuración de
TLS/SSL (`UseTLS`, `SSLVersion`, componente `TIdSSLIOHandlerSocket*`)
en el código revisado — la conexión parece ir en texto plano. Casi
ningún proveedor de correo moderno (Gmail, Outlook/365, etc.) acepta
ya SMTP sin cifrar. Si el servidor SMTP real de hoy ya exige TLS, esto
puede que **ya esté fallando silenciosamente o vía un relay interno**
independientemente de la migración — vale la pena confirmarlo antes
de asumir que "funciona en Delphi 7 y debe funcionar igual en
Delphi 13". De necesitarse TLS: Indy lo soporta vía `IdSSLOpenSSL`,
que requiere las DLL de OpenSSL (versión específica, suele ser la
parte más propensa a errores de día-uno en instalaciones nuevas).

### TeeChart (`UReporteNegativos.pas`) — riesgo bajo-medio
`Chart, TeEngine, Series, TeeProcs` — TeeChart Standard sigue
incluido con RAD Studio en ediciones recientes, así que probablemente
solo haga falta re-verificar la API contra la versión que trae
Delphi 13 (nombres de unidades y de propiedades se han movido de lugar
entre versiones de TeeChart a lo largo de los años). Impacto acotado:
solo un formulario, 2 series (`TLineSeries`).

### `jpeg` (Vcl.Imaging.Jpeg) — riesgo bajo
Usado de verdad en `formato.pas` (9 `TImage` en el `.dfm`). En
`JUNTA.pas` está en el `uses` pero no se encontró ningún uso real
(`TJPEGImage`) — probablemente una importación muerta, sin impacto.
La unidad en sí sigue incluida tal cual en RAD Studio moderno.

### Unicode / codepage — riesgo bajo-medio, ya parcialmente mitigado
- Los 27 archivos `.pas`/`.dfm` de este repo **ya decodifican limpio
  como UTF-8** (lo verifiqué byte a byte) — no hay un archivo con
  codificación corrupta o mixta hoy. Los 6 programas nuevos de esta
  sesión (flotilla/choferes/bitácora/reparto/monitor) se escribieron
  directamente en UTF-8; los legacy (`JUNTA.pas`, `formato.pas`,
  etc.) también resultaron ser UTF-8 válido. Esto es bueno: Delphi 13
  edita/guarda en UTF-8 de forma nativa, así que no hace falta ninguna
  conversión de codificación de archivo fuente.
- `ShortDateFormat := 'dd/mm/yyyy'` (6 usos en `JUNTA.pas`) — variable
  global de `SysUtils` que en versiones modernas de Delphi vive
  oficialmente en el record `FormatSettings` (`FormatSettings.ShortDateFormat`).
  La variable global suelta probablemente siga compilando (Embarcadero
  ha mantenido alias de compatibilidad para varias de estas), pero
  hay que **verificarlo en el compilador real de Delphi 13** en vez de
  asumirlo — no pude correr el compilador desde aquí.
- El codepage/locale del lado de Informix: el propio
  `00_LEEME_migracion.md` de este proyecto (Paso 0) ya pide verificar
  `onstat -g glo` contra el server viejo — sigue siendo el paso
  correcto, y se vuelve más importante todavía con FireDAC (la
  negociación de codepage la hace el driver ODBC de Informix, no BDE).
- Los archivos de texto para CFDI (`WRITELN(FAC_ELE, ...)` sobre
  `TextFile`) siguen usando la API `TextFile`/`AssignFile`/`Writeln`
  clásica, que en Delphi moderno mantiene su comportamiento de
  escritura en el codepage ANSI del sistema (no UTF-16/UTF-8) por
  compatibilidad — buena noticia para no romper el formato que ya
  consume el proceso externo de timbrado, pero **pruébalo con un
  archivo real** antes de confiar en ello a ciegas.

---

## 7. Licenciamiento: FireDAC + Informix no viene en cualquier edición

Confirmado contra la documentación oficial de Embarcadero: la
conectividad FireDAC a Informix (igual que DB2, SQL Anywhere, Sybase
ASE) es parte del conjunto **Enterprise/Architect** de RAD Studio — la
edición **Professional NO incluye** conectividad cliente/servidor
completa a Informix. Antes de planear la migración, confirma qué
edición de RAD Studio 13 vas a comprar/usar — si es Professional, la
ruta FireDAC-nativo-a-Informix no está disponible y habría que ir
por **FireDAC genérico vía ODBC** (`FireDAC.Phys.ODBC`, que sí viene
en ediciones más bajas) contra el mismo **IBM Informix ODBC Driver**
que ya necesitas tener instalado de cualquier forma (Informix Client
SDK 3.5+).

[Connect to Informix (FireDAC) — Embarcadero DocWiki](https://docwiki.embarcadero.com/RADStudio/en/Connect_to_Informix_(FireDAC)) ·
[Database Connectivity (FireDAC) — ediciones](https://docwiki.embarcadero.com/RADStudio/en/Database_Connectivity_(FireDAC)) ·
[BDE Overview — Athens DocWiki](https://docwiki.embarcadero.com/RADStudio/Athens/en/BDE_Overview) ·
[What's new in RAD Studio 13 Florence](https://embarcadero.greymatter.com/blogs/blog/whats-new-in-rad-studio-13-florence)

---

## 8. Estrategia de migración recomendada (orden de operaciones)

**No empieces por `JUNTA.pas`.** Es el que acumula los tres
bloqueadores críticos a la vez (BDE masivo + Rave + Paradox). Orden
sugerido, cada fase deja algo usable antes de pasar a la siguiente:

1. **Resuelve las unidades faltantes** (sección 4) y arma el `.dpr`/
   `.dproj` nuevo (sección 5) — sin esto no hay "compilar" posible,
   ni siquiera para medir el resto del esfuerzo.
2. **Prueba de concepto de FireDAC+Informix** con el formulario más
   chico que existe (`UMantChoferes.pas`, 1 solo `TQuery`) — valida
   edición de RAD Studio, driver ODBC de Informix, y el patrón de
   conversión `TDatabase`/`TQuery` → `TFDConnection`/`TFDQuery` con el
   menor riesgo posible.
3. **Repite el patrón** en los formularios chicos/medianos sin Rave ni
   Paradox (`UMantFlotilla`, `UMantBitacoraFlotilla`, `UMantBundles`,
   `UMantArticulos`, `UOCRecepcion`, `UCierreDiario`,
   `UReporteNegativos` — este último valida también TeeChart,
   `UReparto`, `URepartoMonitor`). Esto cubre 13 de los 14
   formularios.
4. **Decide y migra las tablas Paradox** (sección 3) — necesario antes
   de tocar `JUNTA.pas`, porque varias de sus 181 conversiones de
   componentes dependen de saber a dónde se movió ese dato.
5. **Reconstruye los reportes Rave** (sección 2) — localiza los 2
   `.rav`, documenta su diseño, decide FastReport vs. `Printer.Canvas`
   directo, antes de tocar el resto de `JUNTA.pas`/`formato.pas`.
6. **Migra `JUNTA.pas` y `formato.pas`** al final — con los pasos 2-5
   ya resueltos, lo que queda es "solo" aplicar el mismo patrón de
   conversión BDE→FireDAC validado, 181 y 42 veces respectivamente.
7. **Revisa Indy/TLS** (sección 6) contra el servidor SMTP real antes
   de dar por cerrado el envío de CFDI por correo.

## 9. Lo que este análisis NO pudo verificar

- No hay forma de compilar ni correr Delphi 13 desde este entorno —
  todo lo marcado como "probablemente compila"/"verificar" es lectura
  de código y de documentación oficial, no un resultado de compilador
  real. Trátalo como una guía de dónde mirar primero, no como un
  veredicto final.
- El contenido de `PERSONAL`, `MENSAJE`, `mensaje2-4` y de los dos
  `.rav` es desconocido por no estar en el repo — el tamaño real del
  esfuerzo en las secciones 2 y 4 podría crecer una vez que se
  localicen.
- No se revisó si existe algún otro ejecutable/DLL externo invocado
  además de los `.bat`/PDF viewer vistos en `ShellExecute` (línea
  13398, 13442-13515 de `JUNTA.pas`) — vale la pena confirmar que esos
  `.bat`/rutas (`c:\cfdiCOLE\REMUEVE.bat`, rutas de PDF) también migran
  o se reemplazan, aunque no es un problema de Delphi 13 en sí.
