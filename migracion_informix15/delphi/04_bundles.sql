--------------------------------------------------------------------------
-- 04_bundles.sql
--
-- Tablas para vender un "bundle" (canasta/combo) capturando un solo
-- codigo y una cantidad, descargando automaticamente del kardex cada
-- componente en la proporcion que corresponda. Reutiliza por completo
-- el catalogo de presentaciones (art_presentacion) ya existente.
--------------------------------------------------------------------------

DATABASE <NOMBREBASE>;

-- Cabecera del bundle (el codigo que teclea el cajero)
CREATE TABLE "informix".bundle_producto
  (
    id_bundle    SERIAL,
    num_emp      CHAR(2),
    cod_bundle   CHAR(14),
    descripcion  CHAR(40),
    activo       CHAR(1) DEFAULT "S"
  );
REVOKE ALL ON "informix".bundle_producto FROM "public";
CREATE UNIQUE INDEX "informix".a_bundle_producto ON "informix".bundle_producto
    (num_emp, cod_bundle) USING BTREE;

-- Receta: que productos (y en que presentacion) lleva 1 bundle
CREATE TABLE "informix".bundle_detalle
  (
    id_bundle          INTEGER,        -- FK bundle_producto
    id_presentacion    INTEGER,        -- FK art_presentacion
    cantidad_x_bundle  DECIMAL(12,4),  -- cuanto de esa presentacion lleva 1 bundle
    orden              SMALLINT
  );
REVOKE ALL ON "informix".bundle_detalle FROM "public";
CREATE INDEX "informix".a_bundle_detalle ON "informix".bundle_detalle (id_bundle) USING BTREE;

--------------------------------------------------------------------------
-- IMPORTANTE: el precio del bundle se captura en la tabla "cotiza" que
-- ya existe, usando cod_bundle como si fuera un cod_art normal -- no se
-- necesita tabla de precios nueva.
--
-- IMPORTANTE #2: cod_bundle debe existir tambien como un renglon en
-- inarinv (aunque sea "vacio"/placeholder), porque CODIGOART en JUNTA.pas
-- es un TDBLookupComboBox y necesita que el codigo exista en esa lista
-- para poder teclearlo. El Kardex de ese renglon placeholder nunca se
-- mueve -- solo se mueven los componentes reales.
--------------------------------------------------------------------------

-- Ejemplo (ajusta codigos y precios reales):
--
-- INSERT INTO inarinv (num_emp, cod_art, des_art, uni_art, tip_art, ...)
--   VALUES ('01', 'CANASTA1', 'CANASTA FAMILIAR', 'PZA', 'K', ...);
--
-- INSERT INTO bundle_producto (num_emp, cod_bundle, descripcion, activo)
--   VALUES ('01', 'CANASTA1', 'CANASTA FAMILIAR', 'S');
--
-- INSERT INTO cotiza (num_emp, cod_cli, cod_art, des_art, precio, fecha_ini, fecha_fin)
--   VALUES ('01', '*', 'CANASTA1', 'CANASTA FAMILIAR', 100, '2026-01-01', '2030-12-31');
--
-- INSERT INTO bundle_detalle (id_bundle, id_presentacion, cantidad_x_bundle, orden)
--   VALUES (1, <id_presentacion de fresas KG>, 1, 1);
-- INSERT INTO bundle_detalle (id_bundle, id_presentacion, cantidad_x_bundle, orden)
--   VALUES (1, <id_presentacion de uvas KG>, 1, 2);
-- INSERT INTO bundle_detalle (id_bundle, id_presentacion, cantidad_x_bundle, orden)
--   VALUES (1, <id_presentacion de guayabas KG>, 1, 3);
