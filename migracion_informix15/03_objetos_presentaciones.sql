--------------------------------------------------------------------------
-- 03_objetos_presentaciones.sql
--
-- Objetos NUEVOS para el modelo de "productos unificados / unidades / tara"
-- que armamos aparte del esquema legacy. Corre esto DESPUES de que
-- 02_esquema_legacy_original.sql (o tu dbimport) ya haya creado inarinv,
-- ventas, etc. en el servidor nuevo -- estos objetos dependen de esas
-- tablas (FK logica a inarinv, ALTER TABLE sobre ventas).
--
-- Version final acordada (ya sin mov_captura / sp_aplica_mov_captura /
-- tr_mov_captura_kardex, que fueron el primer diseno y se descartaron).
--------------------------------------------------------------------------

DATABASE <NOMBREBASE>;

--------------------------------------------------------------------------
-- Campo nuevo en ventas (nullable: cero impacto en lo que ya existe)
--------------------------------------------------------------------------
ALTER TABLE "informix".ventas ADD id_presentacion INTEGER;

--------------------------------------------------------------------------
-- Producto unificado (el "codigo ancla" + descripcion amigable)
--------------------------------------------------------------------------
CREATE TABLE "informix".art_producto
  (
    num_emp        CHAR(2),
    cod_art_ancla  CHAR(14),
    descripcion    CHAR(40),
    activo         CHAR(1) DEFAULT "S"
  );
REVOKE ALL ON "informix".art_producto FROM "public";

CREATE UNIQUE INDEX "informix".a_art_producto ON "informix".art_producto
    (num_emp, cod_art_ancla) USING BTREE;

--------------------------------------------------------------------------
-- Presentaciones (unidad + factor + tara) de cada producto unificado
--------------------------------------------------------------------------
CREATE TABLE "informix".art_presentacion
  (
    id_presentacion   SERIAL,
    num_emp           CHAR(2),
    cod_art_ancla     CHAR(14),   -- el codigo que ya teclea el cajero
    cod_art_legacy    CHAR(14),   -- el cod_art real que debe quedar grabado
    etiqueta          CHAR(15),   -- 'CAJA','KG','PIEZA'...
    factor_a_base     DECIMAL(12,6),
    tara_kg           DECIMAL(8,4) DEFAULT 0,
    es_variable       CHAR(1) DEFAULT "N",
    uso               CHAR(1),    -- 'C' compra, 'V' venta, 'A' ambos
    activo            CHAR(1) DEFAULT "S"
  );
REVOKE ALL ON "informix".art_presentacion FROM "public";

CREATE UNIQUE INDEX "informix".a_art_presentacion ON "informix".art_presentacion
    (num_emp, cod_art_ancla, etiqueta) USING BTREE;

--------------------------------------------------------------------------
-- Auditoria de pesaje (bruto/tara/neto) por renglon de venta
--------------------------------------------------------------------------
CREATE TABLE "informix".inartrinv_peso
  (
    num_emp         CHAR(2),
    cod_art         CHAR(14),
    num_suc         CHAR(20),
    fech_doc        DATE,
    tip_doc         CHAR(2),
    num_doc         CHAR(10),
    id_presentacion INTEGER,
    cantidad_cap    DECIMAL(12,4),
    peso_tara_kg    DECIMAL(12,4),
    peso_neto_kg    DECIMAL(12,4)
  );
REVOKE ALL ON "informix".inartrinv_peso FROM "public";

--------------------------------------------------------------------------
-- Procedimiento que traduce presentacion -> kg/caja reales y corrige
-- el renglon recien insertado en ventas
--------------------------------------------------------------------------
CREATE PROCEDURE "informix".sp_aplica_presentacion_venta(
  emp CHAR(2), folio CHAR(10), renglon SMALLINT, art CHAR(14),
  cajascap DECIMAL(10,4), kiloscap DECIMAL(10,4), suc CHAR(20), tipodoc CHAR(2))

  DEFINE idpres     INTEGER;
  DEFINE codreal    CHAR(14);
  DEFINE factor     DECIMAL(12,6);
  DEFINE tara       DECIMAL(8,4);
  DEFINE variable   CHAR(1);
  DEFINE cantcap    DECIMAL(12,4);
  DEFINE canemp     DECIMAL(10,4);
  DEFINE pesoneto   DECIMAL(12,4);
  DEFINE cajasfinal DECIMAL(12,4);

  SELECT id_presentacion INTO idpres FROM ventas
   WHERE num_emp = emp AND folio = folio AND renglon = renglon;

  IF idpres IS NULL THEN
     RETURN;  -- renglon capturado sin pasar por el selector: no se toca
  END IF;

  SELECT cod_art_legacy, factor_a_base, tara_kg, es_variable
    INTO codreal, factor, tara, variable
    FROM art_presentacion WHERE id_presentacion = idpres;

  LET cantcap = cajascap;
  IF cantcap = 0 THEN LET cantcap = kiloscap; END IF;

  IF variable = "S" THEN
     LET pesoneto = cantcap - tara;
  ELSE
     LET pesoneto = cantcap * factor;
  END IF;

  SELECT can_emp INTO canemp FROM inarinv WHERE num_emp = emp AND cod_art = codreal;
  IF canemp > 0 THEN LET cajasfinal = pesoneto / canemp; ELSE LET cajasfinal = 0; END IF;

  UPDATE ventas SET codigo = codreal, kilos = pesoneto, cajas = cajasfinal
   WHERE ventas.num_emp = emp AND ventas.folio = folio AND ventas.renglon = renglon;

  INSERT INTO inartrinv_peso VALUES (emp, codreal, suc, TODAY, tipodoc, folio,
        idpres, cantcap, tara, pesoneto);

END PROCEDURE;

--------------------------------------------------------------------------
-- Trigger que dispara el procedimiento en cada INSERT a ventas
--------------------------------------------------------------------------
CREATE TRIGGER "informix".tr_ventas_presentacion INSERT ON "informix".ventas
REFERENCING NEW AS n
FOR EACH ROW
(
  EXECUTE PROCEDURE "informix".sp_aplica_presentacion_venta(
     n.num_emp, n.folio, n.renglon, n.codigo, n.cajas, n.kilos,
     n.sucursal, n.tipo)
);

--------------------------------------------------------------------------
-- Recordatorio: prueba primero en tu copia de desarrollo el UPDATE sobre
-- ventas disparado desde el propio trigger de insercion sobre esa misma
-- tabla (ver conversacion previa) antes de aplicar esto en produccion.
--------------------------------------------------------------------------
