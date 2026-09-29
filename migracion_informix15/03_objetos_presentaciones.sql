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
--
-- ACTUALIZADO para que quede igual a lo que de verdad esta corriendo en
-- produccion (el archivo se habia quedado desactualizado; lo corregido
-- se aplico en su momento directo en el servidor via DROP/CREATE, pero
-- nunca se reflejo aqui). Dos correcciones sobre la version original de
-- este archivo:
--
--   1. sp_aplica_presentacion_venta tenia sus parametros con el MISMO
--      nombre que las columnas de ventas (emp/folio/renglon...), lo que
--      en Informix hace que "WHERE folio = folio AND renglon = renglon"
--      se resuelva como una comparacion de la columna consigo misma
--      (tautologia, siempre verdadera) en vez de comparar contra el
--      parametro -- el SELECT INTO agarraba una fila cualquiera de esa
--      empresa en vez del renglon correcto. Se corrigio prefijando
--      todos los parametros con "p_".
--
--   2. El calculo de kilos/cajas/costo YA lo hace Delphi antes de
--      insertar (ver JUNTA.pas, CAJ_PROExit/ProcesaBundle) y el
--      id_presentacion se marca con un UPDATE SEPARADO despues del
--      INSERT (qmarcapresentacion.ExecSQL) -- un trigger de INSERT
--      nunca vuelve a dispararse con ese UPDATE, asi que siempre veia
--      id_presentacion en NULL. Se simplifico el procedimiento (ya no
--      recalcula nada, solo deja la auditoria en inartrinv_peso con
--      los valores que ya vienen en la fila) y se agrego un SEGUNDO
--      trigger sobre "UPDATE OF id_presentacion" para que si dispare
--      en el momento correcto.
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
-- Procedimiento que deja la auditoria de pesaje (bruto/tara/neto) del
-- renglon de ventas que ya vino marcado con una presentacion. Ya NO
-- recalcula kilos/cajas/codigo -- eso lo hace Delphi (CAJ_PROExit /
-- ProcesaBundle en JUNTA.pas) antes de insertar. Todos los parametros
-- llevan el prefijo p_ a proposito: si se llamaran igual que las
-- columnas de ventas, cualquier WHERE/SELECT contra ventas dentro de
-- este procedimiento se leeria como columna=columna (siempre verdadero)
-- en vez de columna=parametro.
--------------------------------------------------------------------------
CREATE PROCEDURE "informix".sp_aplica_presentacion_venta(
  p_idpres INTEGER, p_emp CHAR(2), p_folio CHAR(10), p_renglon SMALLINT,
  p_art CHAR(14), p_cajascap DECIMAL(10,4), p_kiloscap DECIMAL(10,4),
  p_suc CHAR(20), p_tipodoc CHAR(2))

  IF (p_idpres IS NULL) OR (p_idpres = 0) THEN
     RETURN;  -- renglon sin presentacion marcada: no se toca
  END IF;

  INSERT INTO inartrinv_peso VALUES (p_emp, p_art, p_suc, TODAY, p_tipodoc,
        p_folio, p_idpres, p_cajascap, 0, p_kiloscap);

END PROCEDURE;

--------------------------------------------------------------------------
-- Dos triggers, no uno: Delphi inserta el renglon en ventas SIN
-- id_presentacion (todavia no se sabe si va a haber match) y lo marca
-- despues con un UPDATE aparte (qmarcapresentacion.ExecSQL). Un trigger
-- de solo INSERT nunca se vuelve a disparar con ese UPDATE posterior,
-- por eso hace falta el segundo trigger sobre "UPDATE OF
-- id_presentacion" -- es el que de verdad dispara la auditoria en la
-- practica. El de INSERT se deja por si algun dia se llega a insertar
-- ya con id_presentacion resuelto de una vez.
--------------------------------------------------------------------------
CREATE TRIGGER "informix".tr_ventas_presentacion INSERT ON "informix".ventas
REFERENCING NEW AS n
FOR EACH ROW
(
  EXECUTE PROCEDURE "informix".sp_aplica_presentacion_venta(
     n.id_presentacion, n.num_emp, n.folio, n.renglon, n.codigo,
     n.cajas, n.kilos, n.sucursal, n.tipo)
);

CREATE TRIGGER "informix".tr_ventas_presentacion_upd UPDATE OF id_presentacion
ON "informix".ventas
REFERENCING NEW AS n
FOR EACH ROW
(
  EXECUTE PROCEDURE "informix".sp_aplica_presentacion_venta(
     n.id_presentacion, n.num_emp, n.folio, n.renglon, n.codigo,
     n.cajas, n.kilos, n.sucursal, n.tipo)
);
--------------------------------------------------------------------------
