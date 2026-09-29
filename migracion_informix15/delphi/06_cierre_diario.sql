--------------------------------------------------------------------------
-- 06_cierre_diario.sql
--
-- Objetos NUEVOS y ADITIVOS para el cierre diario. Se basan en los
-- procedimientos legacy YA EXISTENTES `act_kardex` / `act_kardexall`
-- (recalculan cos_pro/can_emp/existencias replayando inartrinv desde una
-- foto en `inventario`) y `loc_kardexneg` (detecta existencia negativa).
-- No se toca NINGUNO de esos tres procedimientos ni sus tablas
-- (tmp_canemp, log_actkardex, tmp_kardexneg): se dejan intactos por si
-- algo mas los sigue usando via ISQL/4GL.
--
-- Diferencias a proposito frente a los originales:
--   1. act_kardex tiene la rama "DF" que loc_kardexneg no tiene, y
--      act_kardex solo revisa tip_doc="SD" mientras que act_kardexall
--      tambien revisa "DO" -- aqui se unifica: SD y DO se tratan igual.
--   2. Los originales hacen "DELETE FROM tmp_canemp;" / "DELETE FROM
--      log_actkardex;" SIN filtro de num_emp (dos empresas corriendo el
--      cierre a la vez se borrarian los resultados entre si). Las tablas
--      nuevas de abajo SI tienen num_emp y el DELETE se filtra por ella.
--   3. loc_kardexneg detecta negativos REPLAYANDO todo el historial y
--      escribe a una tabla TEMPORAL que se vacia en cada corrida (no sirve
--      para ver tendencia). Para el cierre diario no hace falta replayar:
--      basta leer la existencia YA VIGENTE en inarinv (que las pantallas
--      de ventas/recepcion van manteniendo al dia) y, si esta en
--      negativo, dejar un renglon en una tabla PERMANENTE
--      (hist_existencia_negativa) que se usa para el reporte de
--      tendencias por rango de fechas.
--
-- Uso pensado desde Delphi (UCierreDiario.pas):
--   * Todos los dias: sp_cierre_detecta_negativos(emp, TODAY) -- barato,
--     solo lee inarinv tal cual esta.
--   * De vez en cuando (si se sospecha que el costo promedio o el can_emp
--     se desfaso, por ejemplo tras algun problema detectado):
--     sp_cierre_recalcula_kardex(emp, fecha_de_la_ultima_foto_en_inventario,
--     TODAY) -- repite el mismo recalculo de siempre (mas caro, recorre
--     todo el kardex del rango).
--   No se encadenan dentro de un mismo procedimiento SQL para no anidar
--   BEGIN WORK/COMMIT WORK; Delphi los llama como dos ExecProc seguidos.
--------------------------------------------------------------------------

DATABASE <NOMBREBASE>;

--------------------------------------------------------------------------
-- Historial PERMANENTE de existencia negativa (no se vacia nunca; un
-- renglon por articulo por cada dia de cierre en que salio negativo).
-- Es la base del reporte de tendencias/recurrencia.
--------------------------------------------------------------------------
CREATE TABLE "informix".hist_existencia_negativa
  (
    num_emp       CHAR(2),
    cod_art       CHAR(14),
    fecha_cierre  DATE,
    exi_cor_kgs   DECIMAL(12,4),
    exi_cor_caj   DECIMAL(12,4),
    can_emp       DECIMAL(10,4),
    cos_pro_kgs   DECIMAL(12,4),
    cos_pro_caj   DECIMAL(12,4)
  );
REVOKE ALL ON "informix".hist_existencia_negativa FROM "public";

CREATE INDEX "informix".a_hist_existencia_negativa ON "informix".hist_existencia_negativa
    (num_emp, cod_art, fecha_cierre) USING BTREE;

--------------------------------------------------------------------------
-- Traza de sp_cierre_recalcula_kardex (equivalente a tmp_canemp pero con
-- num_emp para poder filtrar el DELETE por empresa)
--------------------------------------------------------------------------
CREATE TABLE "informix".hist_recalculo_kardex
  (
    num_emp    CHAR(2),
    fech_doc   DATE,
    cod_art    CHAR(14),
    tip_doc    CHAR(2),
    num_doc    CHAR(10),
    can_kgs    DECIMAL(10,4),
    can_caj    DECIMAL(10,4),
    can_emp    DECIMAL(10,4),
    ren        SMALLINT,
    pro_kgs    DECIMAL(12,4),
    pro_caj    DECIMAL(12,4),
    exi_kgs    DECIMAL(10,4),
    exi_caj    DECIMAL(10,4),
    sal_val    DECIMAL(12,4)
  );
REVOKE ALL ON "informix".hist_recalculo_kardex FROM "public";

--------------------------------------------------------------------------
-- Log de anomalias de sp_cierre_recalcula_kardex (equivalente a
-- log_actkardex pero con num_emp para poder filtrar el DELETE)
--------------------------------------------------------------------------
CREATE TABLE "informix".hist_log_cierre
  (
    num_emp   CHAR(2),
    fech_doc  DATE,
    num_doc   CHAR(10),
    tip_doc   CHAR(2),
    codigo    CHAR(14),
    can_kgs   DECIMAL(10,4),
    can_caj   DECIMAL(10,4),
    can_emp   DECIMAL(10,4),
    motivo    CHAR(20)
  );
REVOKE ALL ON "informix".hist_log_cierre FROM "public";

--------------------------------------------------------------------------
-- sp_cierre_recalcula_kardex: recalcula cos_pro/can_emp/existencias de
-- TODOS los articulos de una empresa, replayando inartrinv entre
-- fech_ini y fech_fin a partir de la foto en `inventario` en fech_ini.
-- Es la misma logica probada de act_kardexall (formula de can_emp
-- "LUPITA 4 MARZO 2008" incluida), unificando SD/DO y con traza propia.
--------------------------------------------------------------------------
CREATE PROCEDURE "informix".sp_cierre_recalcula_kardex(
  emp CHAR(2), fech_ini DATE, fech_fin DATE)

  DEFINE art      CHAR(14);
  DEFINE exi_kgs  DECIMAL(10,4);
  DEFINE exi_caj  DECIMAL(10,4);
  DEFINE entdivkg DECIMAL(10,4);
  DEFINE entdivca DECIMAL(10,4);
  DEFINE saldivkg DECIMAL(10,4);
  DEFINE saldivca DECIMAL(10,4);
  DEFINE pro_kgs  DECIMAL(12,4);
  DEFINE pro_caj  DECIMAL(12,4);
  DEFINE canemp   DECIMAL(10,4);
  DEFINE tipart   CHAR(1);
  DEFINE val      DECIMAL(14,4);
  DEFINE prom     DECIMAL(12,4);
  DEFINE tkgs     DECIMAL(10,4);
  DEFINE tcaj     DECIMAL(10,4);
  DEFINE kgs      DECIMAL(10,4);
  DEFINE caj      DECIMAL(10,4);
  DEFINE uni_kgs  DECIMAL(12,4);
  DEFINE uni_caj  DECIMAL(12,4);
  DEFINE tipdoc   CHAR(2);
  DEFINE numdoc   CHAR(10);
  DEFINE fech     DATE;
  DEFINE suc      CHAR(20);
  DEFINE renglon  SMALLINT;
  DEFINE enc      CHAR(1);

  DELETE FROM hist_recalculo_kardex WHERE num_emp = emp;
  DELETE FROM hist_log_cierre WHERE num_emp = emp;

  BEGIN WORK;

  FOREACH
    SELECT cod_art, tip_art
      INTO art, tipart
      FROM inarinv
     WHERE inarinv.num_emp = emp
     ORDER BY cod_art

    -- articulo migrado al motor nuevo (07_kardex_por_presentacion.sql):
    -- su existencia/costo vive en art_existencia y se mantiene con
    -- sp_aplica_mov_kardex/sp_ajusta_existencia_base en cada movimiento;
    -- este recalculo por replay de inartrinv es del motor viejo y ya no
    -- aplica para el (si lo tocara, lo desincronizaria de art_existencia
    -- en la siguiente venta/recepcion, que si sigue escribiendo ahi).
    IF EXISTS(SELECT id_presentacion FROM art_presentacion
               WHERE num_emp = emp
                 AND (cod_art_ancla = art OR cod_art_legacy = art)
                 AND activo = "S")
    THEN
       CONTINUE FOREACH;
    END IF;

    LET entdivkg = 0;
    LET entdivca = 0;
    LET saldivkg = 0;
    LET saldivca = 0;

    IF EXISTS(SELECT cod_art FROM inventario
               WHERE inventario.num_emp = emp
                 AND inventario.fecha = fech_ini
                 AND inventario.cod_art = art)
    THEN
       LET enc = "S";
    ELSE
       LET enc = "N";
    END IF;

    IF enc = "S" THEN
       SELECT can_kgs, can_caj, can_emp, cos_pro
         INTO exi_kgs, exi_caj, canemp, prom
         FROM inventario
        WHERE inventario.num_emp = emp
          AND inventario.fecha = fech_ini
          AND inventario.cod_art = art;
    ELSE
       LET exi_kgs = 0;
       LET exi_caj = 0;
       LET canemp = 0;
       LET prom = 0;
    END IF;

    IF tipart = "K" THEN
       LET pro_kgs = prom;
       LET val = pro_kgs * exi_kgs;
       IF exi_caj <> 0 THEN
          LET pro_caj = val / exi_caj;
       ELSE
          LET pro_caj = 0;
       END IF;
    END IF;

    IF tipart = "C" THEN
       LET pro_caj = prom;
       LET val = pro_caj * exi_caj;
       IF exi_kgs <> 0 THEN
          LET pro_kgs = val / exi_kgs;
       ELSE
          LET pro_kgs = 0;
       END IF;
    END IF;

    FOREACH
      SELECT can_kgs, can_caj, cos_uni_kgs, cos_uni_caj,
             num_suc, tip_doc, fech_doc, num_doc, ren_art
        INTO kgs, caj, uni_kgs, uni_caj,
             suc, tipdoc, fech, numdoc, renglon
        FROM inartrinv
       WHERE inartrinv.num_emp = emp
         AND inartrinv.cod_art = art
         AND inartrinv.fech_doc BETWEEN fech_ini AND fech_fin
       ORDER BY fech_doc, tip_doc, num_doc

      -- COMPRAS
      IF tipdoc = "AC" OR tipdoc = "CO" THEN
         IF tipart = "K" THEN
            LET exi_kgs = exi_kgs + kgs;
            LET val = val + (kgs * uni_kgs);
            LET exi_caj = exi_caj + caj;
         END IF;
         IF tipart = "C" THEN
            LET exi_caj = exi_caj + caj;
            LET val = val + (caj * uni_caj);
            LET exi_kgs = exi_kgs + kgs;
         END IF;

         IF exi_kgs <> 0 THEN
            LET pro_kgs = val / exi_kgs;
         ELSE
            LET pro_kgs = 0;
            INSERT INTO hist_log_cierre VALUES(emp,fech,numdoc,tipdoc,art,
                        exi_kgs,exi_caj,canemp,"CO  EXIST. EN KGS 0");
         END IF;
         IF exi_caj <> 0 THEN
            LET pro_caj = val / exi_caj;
            LET canemp = (exi_kgs-entdivkg+saldivkg)/(exi_caj-entdivca+saldivca);
         ELSE
            LET pro_caj = 0;
            LET canemp = 0;
            INSERT INTO hist_log_cierre VALUES(emp,fech,numdoc,tipdoc,art,
                        exi_kgs,exi_caj,canemp,"CO  EXIST. EN CAJ 0");
         END IF;

         UPDATE inartrinv
            SET inartrinv.cos_pro_kgs = pro_kgs,
                inartrinv.cos_pro_caj = pro_caj
          WHERE inartrinv.num_emp = emp   AND inartrinv.cod_art = art
            AND inartrinv.fech_doc = fech AND inartrinv.tip_doc = tipdoc
            AND inartrinv.num_doc = numdoc AND inartrinv.num_suc = suc
            AND inartrinv.ren_art = renglon;

         UPDATE inarinv
            SET inarinv.ult_cos_kgs = uni_kgs,
                inarinv.ult_cos_caj = uni_caj,
                inarinv.cos_pro_kgs = pro_kgs,
                inarinv.cos_pro_caj = pro_caj,
                inarinv.can_emp = canemp
          WHERE inarinv.num_emp = emp AND inarinv.cod_art = art;
      END IF;

      -- DEVOLUCIONES COMPRAS
      IF tipdoc = "DC" THEN
         IF tipart = "K" THEN
            LET exi_kgs = exi_kgs - kgs;
            LET val = val - (kgs * uni_kgs);
            LET exi_caj = exi_caj - caj;
         END IF;
         IF tipart = "C" THEN
            LET exi_caj = exi_caj - caj;
            LET val = val - (caj * uni_caj);
            LET exi_kgs = exi_kgs - kgs;
         END IF;

         UPDATE inartrinv
            SET inartrinv.cos_pro_kgs = pro_kgs,
                inartrinv.cos_pro_caj = pro_caj
          WHERE inartrinv.num_emp = emp   AND inartrinv.cod_art = art
            AND inartrinv.fech_doc = fech AND inartrinv.tip_doc = tipdoc
            AND inartrinv.num_doc = numdoc AND inartrinv.num_suc = suc
            AND inartrinv.ren_art = renglon;

         UPDATE inarinv
            SET inarinv.cos_pro_kgs = pro_kgs,
                inarinv.cos_pro_caj = pro_caj
          WHERE inarinv.num_emp = emp AND inarinv.cod_art = art;
      END IF;

      -- ENTRADAS DIVERSAS
      IF tipdoc = "ED" THEN
         IF canemp = 0 THEN
            INSERT INTO hist_log_cierre VALUES(emp,fech,numdoc,tipdoc,art,
                        exi_kgs,exi_caj,canemp,"(ED) CAN_EMP EN 0   ");
         END IF;
         IF tipart = "K" THEN
            LET exi_kgs = exi_kgs + kgs;
            LET val = val + (kgs * pro_kgs);
            LET exi_caj = exi_caj + caj;
         END IF;
         IF tipart = "C" THEN
            LET exi_caj = exi_caj + caj;
            LET val = val + (caj * pro_caj);
            LET exi_kgs = exi_kgs + kgs;
         END IF;
         LET entdivkg = entdivkg + kgs;
         LET entdivca = entdivca + caj;

         UPDATE inartrinv
            SET inartrinv.cos_pro_kgs = pro_kgs,
                inartrinv.cos_pro_caj = pro_caj,
                inartrinv.can_kgs = kgs,
                inartrinv.can_caj = caj
          WHERE inartrinv.num_emp = emp   AND inartrinv.cod_art = art
            AND inartrinv.fech_doc = fech AND inartrinv.tip_doc = tipdoc
            AND inartrinv.num_doc = numdoc AND inartrinv.num_suc = suc
            AND inartrinv.ren_art = renglon;
      END IF;

      -- SALIDAS DIVERSAS (unifica SD y DO)
      IF tipdoc = "SD" OR tipdoc = "DO" THEN
         IF canemp = 0 THEN
            INSERT INTO hist_log_cierre VALUES(emp,fech,numdoc,tipdoc,art,
                        exi_kgs,exi_caj,canemp,"(SD) CAN_EMP EN 0   ");
         END IF;
         IF tipart = "K" THEN
            LET exi_kgs = exi_kgs - kgs;
            LET val = val - (kgs * pro_kgs);
            LET exi_caj = exi_caj - caj;
         END IF;
         IF tipart = "C" THEN
            LET exi_caj = exi_caj - caj;
            LET val = val - (caj * pro_caj);
            LET exi_kgs = exi_kgs - kgs;
         END IF;
         LET saldivkg = saldivkg + kgs;
         LET saldivca = saldivca + caj;

         UPDATE inartrinv
            SET inartrinv.cos_pro_kgs = pro_kgs,
                inartrinv.cos_pro_caj = pro_caj,
                inartrinv.can_kgs = kgs,
                inartrinv.can_caj = caj
          WHERE inartrinv.num_emp = emp   AND inartrinv.cod_art = art
            AND inartrinv.fech_doc = fech AND inartrinv.tip_doc = tipdoc
            AND inartrinv.num_doc = numdoc AND inartrinv.num_suc = suc
            AND inartrinv.ren_art = renglon;
      END IF;

      -- DEVOLUCIONES SOBRE VENTAS DE SUPERS (solo kgs)
      IF tipdoc = "DF" THEN
         IF canemp = 0 THEN
            INSERT INTO hist_log_cierre VALUES(emp,fech,numdoc,tipdoc,art,
                        exi_kgs,exi_caj,canemp,"(DF) CAN_EMP EN 0   ");
         END IF;
         LET exi_kgs = exi_kgs + kgs;
         LET val = val + (kgs * pro_kgs);
         LET caj = 0;

         UPDATE inartrinv
            SET inartrinv.cos_pro_kgs = pro_kgs,
                inartrinv.cos_pro_caj = pro_caj,
                inartrinv.can_kgs = kgs,
                inartrinv.can_caj = 0
          WHERE inartrinv.num_emp = emp   AND inartrinv.cod_art = art
            AND inartrinv.fech_doc = fech AND inartrinv.tip_doc = tipdoc
            AND inartrinv.num_doc = numdoc AND inartrinv.num_suc = suc
            AND inartrinv.ren_art = renglon;
      END IF;

      -- DEVOLUCIONES SOBRE VENTAS
      IF tipdoc = "DV" THEN
         IF canemp = 0 THEN
            INSERT INTO hist_log_cierre VALUES(emp,fech,numdoc,tipdoc,art,
                        exi_kgs,exi_caj,canemp,"(DV) CAN_EMP EN 0   ");
         END IF;
         IF tipart = "K" THEN
            LET exi_kgs = exi_kgs + kgs;
            LET val = val + (kgs * pro_kgs);
            IF canemp <> 0 THEN
               LET caj = kgs / canemp;
            ELSE
               LET caj = 0;
            END IF;
            LET exi_caj = exi_caj + caj;
         END IF;
         IF tipart = "C" THEN
            LET exi_caj = exi_caj + caj;
            LET val = val + (caj * pro_caj);
            LET kgs = caj * canemp;
            LET exi_kgs = exi_kgs + kgs;
         END IF;

         UPDATE inartrinv
            SET inartrinv.cos_pro_kgs = pro_kgs,
                inartrinv.cos_pro_caj = pro_caj,
                inartrinv.can_kgs = kgs,
                inartrinv.can_caj = caj
          WHERE inartrinv.num_emp = emp   AND inartrinv.cod_art = art
            AND inartrinv.fech_doc = fech AND inartrinv.tip_doc = tipdoc
            AND inartrinv.num_doc = numdoc AND inartrinv.num_suc = suc
            AND inartrinv.ren_art = renglon;
      END IF;

      -- VENTAS
      IF tipdoc = "FA" OR tipdoc = "TI" THEN
         SELECT kilos, cajas INTO tkgs, tcaj FROM tmp_kardex
          WHERE tmp_kardex.factura = numdoc AND tmp_kardex.tipo_doc = tipdoc
            AND tmp_kardex.codigo = art AND tmp_kardex.ren = renglon;

         IF canemp = 0 THEN
            INSERT INTO hist_log_cierre VALUES(emp,fech,numdoc,tipdoc,art,
                        exi_kgs,exi_caj,canemp,"VTA  CAN_EMP EN 0   ");
         END IF;

         IF (tkgs > 0) AND (tcaj > 0) THEN
            LET caj = tcaj;
            LET kgs = tkgs;
         END IF;
         IF (tkgs > 0) AND (tcaj = 0) THEN
            IF canemp <> 0 THEN
               LET caj = tkgs / canemp;
            ELSE
               LET caj = 0;
            END IF;
         END IF;
         IF (tkgs = 0) AND (tcaj > 0) THEN
            LET kgs = tcaj * canemp;
         END IF;

         IF tipart = "K" THEN
            LET exi_kgs = exi_kgs - kgs;
            LET val = val - (kgs * pro_kgs);
            LET exi_caj = exi_caj - caj;
         END IF;
         IF tipart = "C" THEN
            LET exi_caj = exi_caj - caj;
            LET val = val - (caj * pro_caj);
            LET exi_kgs = exi_kgs - kgs;
         END IF;

         UPDATE inartrinv
            SET inartrinv.cos_pro_kgs = pro_kgs,
                inartrinv.cos_pro_caj = pro_caj,
                inartrinv.can_kgs = kgs,
                inartrinv.can_caj = caj
          WHERE inartrinv.num_emp = emp   AND inartrinv.cod_art = art
            AND inartrinv.fech_doc = fech AND inartrinv.tip_doc = tipdoc
            AND inartrinv.num_doc = numdoc AND inartrinv.num_suc = suc
            AND inartrinv.ren_art = renglon;
      END IF;

      INSERT INTO hist_recalculo_kardex VALUES(emp,fech,art,tipdoc,numdoc,
             kgs,caj,canemp,renglon,pro_kgs,pro_caj,exi_kgs,exi_caj,val);

    END FOREACH;

    UPDATE inarinv
       SET inarinv.exi_cor_kgs = exi_kgs,
           inarinv.exi_cor_caj = exi_caj,
           inarinv.can_emp = canemp,
           inarinv.sal_val = val,
           inarinv.cos_pro_kgs = pro_kgs,
           inarinv.cos_pro_caj = pro_caj
     WHERE inarinv.num_emp = emp AND inarinv.cod_art = art;

  END FOREACH;

  COMMIT WORK;

END PROCEDURE;

--------------------------------------------------------------------------
-- sp_cierre_detecta_negativos: lee la existencia VIGENTE en inarinv (la
-- que ventas/recepcion van manteniendo al dia) y deja un renglon
-- permanente en hist_existencia_negativa por cada articulo que cierra en
-- negativo ese dia. Barato -- pensado para correr TODOS los dias.
--------------------------------------------------------------------------
CREATE PROCEDURE "informix".sp_cierre_detecta_negativos(
  emp CHAR(2), fecha DATE)

  INSERT INTO hist_existencia_negativa
    (num_emp, cod_art, fecha_cierre, exi_cor_kgs, exi_cor_caj, can_emp,
     cos_pro_kgs, cos_pro_caj)
  SELECT num_emp, cod_art, fecha, exi_cor_kgs, exi_cor_caj, can_emp,
         cos_pro_kgs, cos_pro_caj
    FROM inarinv
   WHERE inarinv.num_emp = emp
     AND (inarinv.exi_cor_kgs < 0 OR inarinv.exi_cor_caj < 0);

END PROCEDURE;

--------------------------------------------------------------------------
-- Reporte de tendencias / recurrencia (consulta de referencia para
-- UReporteNegativos.pas): cuantas veces salio negativo cada codigo en un
-- rango de fechas, ordenado por recurrencia.
--
--   SELECT cod_art, COUNT(*) veces, MIN(exi_cor_kgs) peor_kgs,
--          MIN(exi_cor_caj) peor_caj
--     FROM hist_existencia_negativa
--    WHERE num_emp = ? AND fecha_cierre BETWEEN ? AND ?
--    GROUP BY cod_art
--    ORDER BY veces DESC;
--
-- y la tendencia puntual de UN codigo (para graficar):
--
--   SELECT fecha_cierre, exi_cor_kgs, exi_cor_caj
--     FROM hist_existencia_negativa
--    WHERE num_emp = ? AND cod_art = ? AND fecha_cierre BETWEEN ? AND ?
--    ORDER BY fecha_cierre;
--------------------------------------------------------------------------
