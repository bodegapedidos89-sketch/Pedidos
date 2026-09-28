--------------------------------------------------------------------------
-- 05_recepcion_compras.sql
--
-- Objetos NUEVOS y ADITIVOS para separar "capturar el pedido" (formato.pas,
-- Ordenes Compra Locales) de "recibirlo en almacen" (UOCRecepcion.pas).
--
-- Cambio de flujo acordado:
--   ANTES: al dar "Guardar Orden" en formato.pas, cada renglon llamaba a
--          inserta_tr_ped, que insertaba en inartrinv y subia existencias
--          en inarinv en ese mismo momento (el Kardex se afectaba cuando
--          COMPRAS capturaba, no cuando ALMACEN recibia).
--   AHORA: "Guardar Orden" ya NO llama inserta_tr_ped. Solo inserta el
--          renglon "pedido" (lo que se ordeno) en oc_pedido_detalle con
--          estado='P'. inserta_ped (la cabecera en inarped) se sigue
--          llamando igual que siempre.
--          El Kardex (inartrinv + existencias/can_emp de inarinv) se
--          afecta hasta que almacen confirma la recepcion de cada
--          renglon, usando la cantidad REALMENTE recibida -- no la
--          pedida -- via sp_recibe_renglon_oc.
--
-- No se toca inserta_ped, inserta_tr_ped, inarped, inarinv ni inartrinv
-- como objetos (inserta_tr_ped se deja intacto por si algun otro programa
-- lo sigue usando); solo se deja de invocar inserta_tr_ped desde
-- formato.pas.
--------------------------------------------------------------------------

DATABASE <NOMBREBASE>;

--------------------------------------------------------------------------
-- Renglones "pedidos" (lo que Compras capturo y aun no llega a almacen)
--------------------------------------------------------------------------
CREATE TABLE "informix".oc_pedido_detalle
  (
    num_emp             CHAR(2),
    num_suc             CHAR(2),
    num_ped             INTEGER,
    renglon             SMALLINT,
    cod_art             CHAR(14),
    cod_pro             CHAR(8),
    cantidad_ped_cajas  DECIMAL(12,4),   -- lo que hoy se manda a tr_pedido.params[6] (cajas/Cantidad)
    cantidad_ped_kilos  DECIMAL(12,4),   -- lo que hoy se manda a tr_pedido.params[5] (kilos)
    cos_uni             DECIMAL(12,4),
    iva                 DECIMAL(12,4),
    descuento           DECIMAL(12,4) DEFAULT 0,
    flete               DECIMAL(12,4) DEFAULT 0,
    fech_ped            DATE,
    estado              CHAR(1) DEFAULT "P"    -- P=pendiente, R=recibido, X=no recibido
  );
REVOKE ALL ON "informix".oc_pedido_detalle FROM "public";

CREATE INDEX "informix".a_oc_pedido_detalle ON "informix".oc_pedido_detalle
    (num_emp, num_ped, renglon) USING BTREE;

--------------------------------------------------------------------------
-- Confirmacion de almacen por renglon (auditoria: llego o no, y por que)
--------------------------------------------------------------------------
CREATE TABLE "informix".oc_recepcion_detalle
  (
    num_emp             CHAR(2),
    num_ped             INTEGER,
    renglon             SMALLINT,
    cod_art             CHAR(14),
    recibido            CHAR(1),          -- 'S' / 'N'
    cantidad_recibida   DECIMAL(12,4),    -- cajas/piezas que realmente llegaron
    cantidad_x_empaque  DECIMAL(10,4),    -- kg (u otra unidad base) que trae cada empaque
    tara_kg             DECIMAL(8,4) DEFAULT 0,
    kilos_netos         DECIMAL(12,4),    -- calculado: (recibida*x_empaque) - (recibida*tara)
    observaciones       CHAR(100),
    usuario             CHAR(20),
    fecha_recepcion     DATE
  );
REVOKE ALL ON "informix".oc_recepcion_detalle FROM "public";

CREATE INDEX "informix".a_oc_recepcion_detalle ON "informix".oc_recepcion_detalle
    (num_emp, num_ped, renglon) USING BTREE;

--------------------------------------------------------------------------
-- Aplica al Kardex UN renglon ya confirmado como recibido por almacen.
-- Es practicamente la misma logica de inserta_tr_ped (mismo tip_doc "AC"
-- en inartrinv, mismo promedio de costos), pero:
--   * usa la cantidad REALMENTE recibida (kgs/caj), no la pedida
--   * el can_emp del articulo se deja en lo que almacen confirmo que
--     trae cada empaque (canempreal), en vez de recalcularlo como
--     promedio de existencias
--------------------------------------------------------------------------
CREATE PROCEDURE "informix".sp_recibe_renglon_oc(
  emp CHAR(2), suc CHAR(2), art CHAR(14), ped INTEGER, ren SMALLINT,
  fech DATE, kgs DECIMAL(10,4), caj DECIMAL(10,4), cosuni DECIMAL(12,4),
  codpro CHAR(8), iva DECIMAL(12,4), des DECIMAL(12,4), fle DECIMAL(12,4),
  canempreal DECIMAL(10,4))

  DEFINE canemp     DECIMAL(10,4);
  DEFINE exicorkgs  DECIMAL(10,4);
  DEFINE exicorcaj  DECIMAL(10,4);
  DEFINE ultcoskgs  DECIMAL(12,4);
  DEFINE ultcoscaj  DECIMAL(12,4);
  DEFINE cosprokgs  DECIMAL(12,4);
  DEFINE cosprocaj  DECIMAL(12,4);
  DEFINE salval     DECIMAL(14,4);
  DEFINE tipart     CHAR(1);

  SELECT can_emp,exi_cor_kgs,exi_cor_caj,ult_cos_kgs,ult_cos_caj,
         cos_pro_kgs,cos_pro_caj,tip_art,sal_val INTO
         canemp,exicorkgs,exicorcaj,ultcoskgs,ultcoscaj,
         cosprokgs,cosprocaj,tipart,salval
    FROM inarinv
   WHERE inarinv.num_emp = emp AND inarinv.cod_art = art;

  IF tipart IS NULL THEN
     RETURN;  -- el articulo no existe en inarinv de esta empresa
  END IF;

  IF tipart = "K" THEN
     LET exicorkgs = exicorkgs + kgs;
     LET ultcoskgs = cosuni;
     LET salval    = salval + (kgs*cosuni);
     LET exicorcaj = exicorcaj + caj;
     LET ultcoscaj = (kgs*cosuni) / caj;
  END IF;

  IF tipart = "C" THEN
     LET exicorcaj = exicorcaj + caj;
     LET ultcoscaj = cosuni;
     LET salval    = salval + (caj*cosuni);
     LET exicorkgs = exicorkgs + kgs;
     LET ultcoskgs = (caj*cosuni) / kgs;
  END IF;

  LET cosprokgs = salval / exicorkgs;
  LET cosprocaj = salval / exicorcaj;

  -- lo que pidio el usuario: el can_emp del articulo recibido se
  -- refresca con lo que almacen confirmo que trae cada empaque
  LET canemp = canempreal;

  INSERT INTO inartrinv
  VALUES(emp,art,suc,fech,"AC",ped,kgs,caj,ultcoskgs,ultcoscaj,cosprokgs,
         cosprocaj,0,0,des,fle,ren,codpro," ",0," ",iva);

  SET LOCK MODE TO WAIT;
  UPDATE inarinv SET exi_cor_kgs=exicorkgs,
                      exi_cor_caj=exicorcaj,
                      ult_cos_kgs=ultcoskgs,
                      ult_cos_caj=ultcoscaj,
                      cos_pro_kgs=cosprokgs,
                      cos_pro_caj=cosprocaj,
                      sal_val=salval,
                      can_emp=canemp
   WHERE inarinv.num_emp = emp AND inarinv.cod_art = art;
  SET LOCK MODE TO NOT WAIT;

  UPDATE oc_pedido_detalle SET estado = "R"
   WHERE num_emp = emp AND num_ped = ped AND renglon = ren;

END PROCEDURE;

--------------------------------------------------------------------------
-- Notas de uso (UOCRecepcion.pas):
--   * Renglon "Recibido = S": llamar sp_recibe_renglon_oc con las
--     cantidades REALMENTE recibidas, e insertar el mismo renglon en
--     oc_recepcion_detalle (recibido='S') como bitacora.
--   * Renglon "Recibido = N": NO se llama sp_recibe_renglon_oc (no toca
--     Kardex). Solo se marca oc_pedido_detalle.estado='X' y se inserta
--     en oc_recepcion_detalle (recibido='N', observaciones=motivo).
--   * Cuando ya no queden renglones con estado='P' para un num_ped, el
--     programa marca inarped.estado='R' (antes se quedaba siempre en
--     "P" porque nada la actualizaba).
--------------------------------------------------------------------------
