# Migración a Delphi 13 Architect / FireDAC — en progreso

Esta carpeta es **nueva y separada** de `migracion_informix15/delphi/`
(Delphi 7 / BDE), que sigue intacta y corriendo en producción. Aquí se
va armando, formulario por formulario, la versión Delphi 13. Ver
`migracion_informix15/delphi/ANALISIS_MIGRACION_DELPHI13.md` para el
diagnóstico completo (qué bloquea qué, en qué orden conviene migrar).

## Qué hay hasta ahora

- `UDMConexion.pas`/`.dfm` — data module con la **única** `TFDConnection`
  que va a compartir todo el proyecto (a diferencia de BDE, donde cada
  formulario tenía su propio `TDatabase` apuntando al mismo alias
  `comyleg` — con FireDAC el patrón normal es una sola conexión
  compartida, referenciada desde cada formulario).
- `UMantChoferes.pas`/`.dfm` — el primer formulario migrado. Compáralo
  línea por línea contra el original en `../delphi/UMantChoferes.pas`:
  el SQL y la lógica de negocio no cambiaron **nada** — solo el tipo
  de los componentes (`TQuery`→`TFDQuery`) y el `uses`. Toda la API que
  usa (`ParamByName`, `.Clear` para NULL, `FieldByName`, `Open`/
  `Close`/`ExecSQL`/`Eof`) se comporta igual en `TFDQuery`.
- `UMenuPrincipal13.pas`/`.dfm` — menú mínimo, mismo patrón que el
  original, por ahora con un solo botón (Choferes). Conforme se migren
  los demás formularios se agregan aquí mismo — **este es el proyecto
  definitivo**, no uno de prueba descartable.
- `PedidosDelphi13.dpr` — fuente del proyecto, debería compilar tal
  cual.
- `PedidosDelphi13.dproj` — **escrito a mano, sin verificar** (no hay
  forma de abrir/compilar Delphi real desde este entorno). Si al
  abrirlo Delphi 13 pide actualizar/convertir el proyecto, acepta — el
  IDE regenera los metadatos exactos de la versión sin tocar tus
  unidades. Si prefieres no arriesgarte: crea un proyecto VCL nuevo
  desde el IDE (`File → New → VCL Forms Application`), borra el
  `Form1` que se crea solo, y agrega estos 3 pares `.pas`/`.dfm` al
  proyecto en vez de confiar en este `.dproj`.

## Qué necesitas rellenar antes de compilar

En `UDMConexion.pas`, procedimiento `DataModuleCreate`, hay 4
placeholders (mismo estilo `<NOMBREBASE>` que ya usan los `.sql` de
este paquete):

```pascal
FDConnection1.Params.Database := '<TU_BASE_INFORMIX>';
FDConnection1.Params.Server := '<TU_INFORMIXSERVER>';
FDConnection1.Params.UserName := '<TU_USUARIO>';
FDConnection1.Params.Password := '<TU_PASSWORD>';
```

- `<TU_BASE_INFORMIX>`: el nombre real de la base — el alias BDE
  `comyleg` lo escondía, aquí hace falta el nombre real.
- `<TU_INFORMIXSERVER>`: el `INFORMIXSERVER`/dbservername tal como
  está en tu `sqlhosts`.

## Prerequisitos en la máquina donde compiles/corras

1. **IBM Informix Client SDK 3.5+** instalado, con el **IBM INFORMIX
   ODBC DRIVER** (x86 o x64 según tu target) — FireDAC lo usa por
   debajo aunque el driver se llame "nativo" de Informix.
2. **Delphi 13 Architect** con FireDAC — verifica que en la paleta
   "FireDAC Links" aparezca `TFDPhysInfxDriverLink` antes de abrir el
   proyecto.

## Cómo probarlo

1. Abre `PedidosDelphi13.dproj` en Delphi 13.
2. Rellena los 4 placeholders de `UDMConexion.pas`.
3. Compila y corre — debería abrir el menú con un botón "Choferes"
   que repita el mismo CRUD (buscar/nuevo/guardar/eliminar) que la
   versión Delphi 7 contra la misma tabla `flotilla_chofer`.

Cualquier error de compilación que te marque el IDE, mándamelo tal
cual (el texto completo del error, no solo "no compiló") — no tengo
forma de compilarlo yo mismo desde aquí, así que el ciclo real es:
yo ajusto el código → tú compilas → me dices qué marcó → ajusto otra
vez.

## Qué sigue

Una vez que este primer formulario compile y funcione contra tu
Informix real, se repite el mismo patrón para los demás formularios
que **no** tienen bloqueadores (`UMantFlotilla`,
`UMantBitacoraFlotilla`, `UMantBundles`, `UMantArticulos`,
`UOCRecepcion`, `UCierreDiario`, `UReporteNegativos`, `UReparto`,
`URepartoMonitor`, `UFormPresentacion`) — se van agregando a este
mismo proyecto.

`JUNTA.pas` y `formato.pas` quedan para el final: necesitan primero
resolver Rave Reports y las unidades `PERSONAL`/`MENSAJE`/`mensaje2-4`
que no están en el repo (secciones 2 y 4 de
`../delphi/ANALISIS_MIGRACION_DELPHI13.md`).
