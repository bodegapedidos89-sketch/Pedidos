--------------------------------------------------------------------------
-- 07_kardex_por_presentacion.sql
--
-- Motor de Kardex nuevo, centrado en el PRODUCTO UNIFICADO
-- (art_producto.cod_art_ancla) en vez del codigo legacy. Objetivo:
-- poder ir reduciendo con el tiempo la cantidad de codigos duplicados en
-- inarinv (una caja, un kilo y una pieza del mismo producto hoy son 3
-- codigos separados) sin tener que tocar de un dia para otro todo el
-- catalogo -- el motor nuevo solo aplica a los articulos que ya tengan
-- filas en art_presentacion; todo lo que no se haya migrado sigue
-- funcionando exactamente como hoy con inarinv/inartrinv.
--
-- Idea central: art_presentacion (no inarinv) es quien manda en la
-- conversion de cada presentacion. inarinv se sigue actualizando (por
-- compatibilidad con lo que ya exista leyendola) pero pasa a ser un
-- espejo de lo que calcula este motor, no la fuente de verdad.
--
-- No se toca inarinv, inartrinv, act_kardex, act_kardexall,
-- loc_kardexneg, inserta_ventas, inserta_tr_ped, inserta_entdiv,
-- inserta_saldiv ni ningun objeto legacy. Todo lo de este archivo es
-- nuevo y aditivo.
--------------------------------------------------------------------------

DATABASE <NOMBREBASE>;

--------------------------------------------------------------------------
-- Existencia y costo VIGENTES por producto unificado, en su unidad base
-- (la misma unidad a la que art_presentacion.factor_a_base convierte
-- todas las presentaciones -- normalmente kg). Un renglon por
-- (num_emp, cod_art_ancla).
--------------------------------------------------------------------------
CREATE TABLE "informix".art_existencia
  (
    num_emp          CHAR(2),
    cod_art_ancla    CHAR(14),
    existencia_base  DECIMAL(14,4) DEFAULT 0,
    costo_prom_base  DECIMAL(12,4) DEFAULT 0,
    saldo_valorizado DECIMAL(14,4) DEFAULT 0,
    fecha_ult_mov    DATE
  );
REVOKE ALL ON "informix".art_existencia FROM "public";

CREATE UNIQUE INDEX "informix".a_art_existencia ON "informix".art_existencia
    (num_emp, cod_art_ancla) USING BTREE;

--------------------------------------------------------------------------
-- Kardex de movimientos por producto unificado (equivalente a inartrinv
-- pero en unidad base y por cod_art_ancla). Sirve de bitacora/auditoria;
-- lo que manda para saber "cuanto hay ahorita" es art_existencia.
--------------------------------------------------------------------------
CREATE TABLE "informix".art_kardex_mov
  (
    num_emp         CHAR(2),
    cod_art_ancla   CHAR(14),
    num_suc         CHAR(20),
    fech_doc        DATE,
    tip_doc         CHAR(2),
    num_doc         CHAR(10),
    ren_art         SMALLINT,
    id_presentacion INTEGER,
    cantidad_cap    DECIMAL(12,4),   -- lo que se tecleo/conto, en la unidad de la presentacion usada
    cantidad_base   DECIMAL(14,4),   -- convertido a unidad base (+entrada / -salida ya aplicado a existencia)
    costo_uni_base  DECIMAL(12,4),   -- costo unitario del movimiento (solo relevante en entradas)
    costo_prom_base DECIMAL(12,4),   -- costo promedio DESPUES de este movimiento
    existencia_base DECIMAL(14,4)    -- existencia DESPUES de este movimiento (saldo corrido)
  );
REVOKE ALL ON "informix".art_kardex_mov FROM "public";

CREATE INDEX "informix".a_art_kardex_mov ON "informix".art_kardex_mov
    (num_emp, cod_art_ancla, fech_doc) USING BTREE;

--------------------------------------------------------------------------
-- Indice nuevo sobre art_presentacion para la busqueda inversa
-- (cod_art_legacy -> presentacion/ancla) que hace sp_aplica_mov_kardex.
-- El indice unico que ya existia es (num_emp, cod_art_ancla, etiqueta);
-- este es aparte, no lo reemplaza.
--------------------------------------------------------------------------
CREATE INDEX "informix".b_art_presentacion_legacy ON "informix".art_presentacion
    (num_emp, cod_art_legacy) USING BTREE;

--------------------------------------------------------------------------
-- sp_aplica_mov_kardex: punto de entrada UNICO para registrar una
-- entrada o salida en el motor nuevo. Quien llama (ventas, recepcion,
-- ajustes de cierre) le pasa el codigo LEGACY tal cual ya lo tiene hoy
-- (el que resulta de capturar/recibir/contar) -- el procedimiento hace
-- la busqueda inversa en art_presentacion y:
--
--   * Si ese codigo NO esta dado de alta en art_presentacion, no hace
--     NADA (ni toca art_existencia ni inarinv) -- ese es el mecanismo
--     por el que los articulos que aun no se han migrado siguen
--     funcionando exactamente igual que hoy, sin que el llamador tenga
--     que preguntar antes "ya esta migrado o no".
--   * Si si esta, convierte la cantidad capturada a unidad base con la
--     MISMA formula que ya usan JUNTA.pas/formato.pas
--     (ConvierteCantidad), actualiza art_existencia (costo promedio
--     ponderado en entradas, el costo no cambia en salidas -- promedio
--     ponderado estandar), dej a el renglon en art_kardex_mov, y
--     espeja el resultado en la fila de inarinv del propio codigo
--     ancla (NO en cada codigo legacy de presentacion -- por diseno,
--     ya que la existencia real vive centralizada en el ancla).
--
-- can_emp/exi_cor_caj espejados en inarinv usan un factor FIJO, no el
-- de la presentacion de ESTE movimiento: el de la presentacion propia
-- del ancla (donde cod_art_legacy = cod_art_ancla). Asi no van
-- cambiando segun cual presentacion se vendio/recibio mas
-- recientemente (version anterior: 10 si se vendia por caja, 1 si
-- despues se vendia por kg suelto). Si el ancla no tiene presentacion
-- propia dada de alta, se deja el can_emp que ya traia inarinv en vez
-- de inventar un factor. De todos modos, quien de verdad debe
-- consultarse para convertir cualquier presentacion sigue siendo
-- art_presentacion, nunca inarinv.can_emp -- este espejo es solo por
-- compatibilidad con quien todavia lea inarinv directo.
--------------------------------------------------------------------------
CREATE PROCEDURE "informix".sp_aplica_mov_kardex(
  emp CHAR(2), suc CHAR(20), codart CHAR(14), fech DATE,
  tipdoc CHAR(2), numdoc CHAR(10), ren SMALLINT,
  cantcap DECIMAL(12,4), costouni DECIMAL(12,4), esentrada CHAR(1))

  DEFINE idpres    INTEGER;
  DEFINE codancla  CHAR(14);
  DEFINE factor    DECIMAL(12,6);
  DEFINE tara      DECIMAL(8,4);
  DEFINE variable  CHAR(1);
  DEFINE cantbase  DECIMAL(14,4);
  DEFINE existant  DECIMAL(14,4);
  DEFINE costoant  DECIMAL(12,4);
  DEFINE existnew  DECIMAL(14,4);
  DEFINE costonew  DECIMAL(12,4);
  DEFINE saldoval  DECIMAL(14,4);
  DEFINE exicaj    DECIMAL(14,4);
  DEFINE existe    CHAR(1);
  DEFINE factorancla   DECIMAL(12,6);
  DEFINE canempactual  DECIMAL(10,4);

  LET codancla = NULL;

  SELECT FIRST 1 id_presentacion, cod_art_ancla, factor_a_base, tara_kg, es_variable
    INTO idpres, codancla, factor, tara, variable
    FROM art_presentacion
   WHERE num_emp = emp AND cod_art_legacy = codart AND activo = "S";

  IF codancla IS NULL THEN
     RETURN;  -- articulo no migrado a presentaciones: no se toca nada
  END IF;

  IF variable = "S" THEN
     LET cantbase = cantcap - tara;
  ELSE
     LET cantbase = (cantcap * factor) - (cantcap * tara);
  END IF;

  IF EXISTS(SELECT cod_art_ancla FROM art_existencia
             WHERE num_emp = emp AND cod_art_ancla = codancla)
  THEN
     LET existe = "S";
     SELECT existencia_base, costo_prom_base INTO existant, costoant
       FROM art_existencia WHERE num_emp = emp AND cod_art_ancla = codancla;
  ELSE
     LET existe = "N";
     LET existant = 0;
     LET costoant = 0;
  END IF;

  IF esentrada = "S" THEN
     LET existnew = existant + cantbase;
     IF existnew <> 0 THEN
        LET costonew = ((existant * costoant) + (cantbase * costouni)) / existnew;
     ELSE
        LET costonew = costouni;
     END IF;
  ELSE
     LET existnew = existant - cantbase;
     LET costonew = costoant;
  END IF;

  LET saldoval = existnew * costonew;

  BEGIN WORK;

  IF existe = "S" THEN
     UPDATE art_existencia
        SET existencia_base = existnew, costo_prom_base = costonew,
            saldo_valorizado = saldoval, fecha_ult_mov = fech
      WHERE num_emp = emp AND cod_art_ancla = codancla;
  ELSE
     INSERT INTO art_existencia VALUES(emp, codancla, existnew, costonew,
            saldoval, fech);
  END IF;

  INSERT INTO art_kardex_mov VALUES(emp, codancla, suc, fech, tipdoc, numdoc,
         ren, idpres, cantcap, cantbase, costouni, costonew, existnew);

  -- factor de referencia ESTABLE para espejar can_emp/exi_cor_caj en
  -- inarinv: el de la presentacion PROPIA del ancla (donde
  -- cod_art_legacy = cod_art_ancla), no el de la presentacion usada en
  -- ESTE movimiento ("factor" de arriba). Si se usara ese ultimo,
  -- can_emp iria cambiando cada vez segun cual presentacion se vendio
  -- mas recientemente (10 si se vendio por caja, 1 si despues se vendio
  -- por kg suelto, etc.) -- con esto queda fijo mientras no cambie el
  -- catalogo de presentaciones.
  LET factorancla = NULL;
  SELECT FIRST 1 factor_a_base INTO factorancla
    FROM art_presentacion
   WHERE num_emp = emp AND cod_art_legacy = codancla AND activo = "S";

  IF factorancla IS NULL OR factorancla = 0 THEN
     -- el ancla no tiene presentacion propia dada de alta (es un
     -- codigo nuevo que no es ninguno de los legacy fusionados): no se
     -- inventa un factor, se deja el can_emp que ya traia inarinv
     LET canempactual = NULL;
     SELECT can_emp INTO canempactual FROM inarinv
      WHERE inarinv.num_emp = emp AND inarinv.cod_art = codancla;
     IF canempactual IS NULL OR canempactual = 0 THEN
        LET factorancla = 1;
     ELSE
        LET factorancla = canempactual;
     END IF;
  END IF;

  IF factorancla <> 0 THEN
     LET exicaj = existnew / factorancla;
  ELSE
     LET exicaj = 0;
  END IF;

  UPDATE inarinv
     SET exi_cor_kgs = existnew,
         exi_cor_caj = exicaj,
         can_emp = factorancla,
         cos_pro_kgs = costonew,
         sal_val = saldoval
   WHERE inarinv.num_emp = emp AND inarinv.cod_art = codancla;

  COMMIT WORK;

END PROCEDURE;

--------------------------------------------------------------------------
-- sp_ajusta_existencia_base: para cuando ya se tiene la diferencia
-- calculada directamente en unidad base (kg) -- el caso de "Aplicar
-- diferencias de inventario fisico" en UCierreDiario.pas, donde el
-- conteo de la terminal portatil ya se compara en la misma unidad base
-- que art_existencia, sin pasar por el factor/tara de una presentacion
-- especifica (no se esta "capturando con una presentacion", se esta
-- corrigiendo un saldo). deltabase positivo = entra, negativo = sale.
-- Mismo mecanismo de auto-filtro que sp_aplica_mov_kardex: si codart no
-- esta en art_presentacion, no hace nada. No toca can_emp -- eso sigue
-- siendo exclusivo de una recepcion real con una presentacion elegida.
--------------------------------------------------------------------------
CREATE PROCEDURE "informix".sp_ajusta_existencia_base(
  emp CHAR(2), suc CHAR(20), codart CHAR(14), fech DATE,
  tipdoc CHAR(2), numdoc CHAR(10), ren SMALLINT,
  deltabase DECIMAL(14,4), costouni DECIMAL(12,4))

  DEFINE idpres    INTEGER;
  DEFINE codancla  CHAR(14);
  DEFINE existant  DECIMAL(14,4);
  DEFINE costoant  DECIMAL(12,4);
  DEFINE existnew  DECIMAL(14,4);
  DEFINE costonew  DECIMAL(12,4);
  DEFINE saldoval  DECIMAL(14,4);
  DEFINE exicaj    DECIMAL(14,4);
  DEFINE existe    CHAR(1);
  DEFINE factorancla   DECIMAL(12,6);
  DEFINE canempactual  DECIMAL(10,4);

  LET codancla = NULL;

  -- el conteo fisico registra EL PRODUCTO, no una presentacion
  -- especifica -- por eso codart puede llegar aqui siendo directamente
  -- el cod_art_ancla (lo que se contó) o el cod_art_legacy de alguna
  -- presentacion puntual, segun como quede armado inv_diario. Se
  -- aceptan los dos: solo se necesita resolver el ancla (idpres queda
  -- de la presentacion que haya hecho match, nada más para trazar el
  -- movimiento en art_kardex_mov); deltabase ya viene en unidad base,
  -- no se vuelve a convertir.
  SELECT FIRST 1 id_presentacion, cod_art_ancla
    INTO idpres, codancla
    FROM art_presentacion
   WHERE num_emp = emp AND activo = "S"
     AND (cod_art_legacy = codart OR cod_art_ancla = codart);

  IF codancla IS NULL THEN
     RETURN;  -- articulo no migrado a presentaciones
  END IF;

  IF EXISTS(SELECT cod_art_ancla FROM art_existencia
             WHERE num_emp = emp AND cod_art_ancla = codancla)
  THEN
     LET existe = "S";
     SELECT existencia_base, costo_prom_base INTO existant, costoant
       FROM art_existencia WHERE num_emp = emp AND cod_art_ancla = codancla;
  ELSE
     LET existe = "N";
     LET existant = 0;
     LET costoant = 0;
  END IF;

  LET existnew = existant + deltabase;

  IF deltabase > 0 THEN
     IF existnew <> 0 THEN
        LET costonew = ((existant * costoant) + (deltabase * costouni)) / existnew;
     ELSE
        LET costonew = costouni;
     END IF;
  ELSE
     LET costonew = costoant;   -- el costo promedio no cambia al reducir saldo
  END IF;

  LET saldoval = existnew * costonew;

  BEGIN WORK;

  IF existe = "S" THEN
     UPDATE art_existencia
        SET existencia_base = existnew, costo_prom_base = costonew,
            saldo_valorizado = saldoval, fecha_ult_mov = fech
      WHERE num_emp = emp AND cod_art_ancla = codancla;
  ELSE
     INSERT INTO art_existencia VALUES(emp, codancla, existnew, costonew,
            saldoval, fech);
  END IF;

  INSERT INTO art_kardex_mov VALUES(emp, codancla, suc, fech, tipdoc, numdoc,
         ren, idpres, deltabase, deltabase, costouni, costonew, existnew);

  -- mismo factor de referencia ESTABLE que sp_aplica_mov_kardex: el de
  -- la presentacion PROPIA del ancla, nunca el que haya hecho match en
  -- el SELECT FIRST 1 de arriba (ese es arbitrario entre las
  -- presentaciones del producto cuando codart llega siendo ya el
  -- cod_art_ancla, porque matchea a todas por igual). No toca can_emp.
  LET factorancla = NULL;
  SELECT FIRST 1 factor_a_base INTO factorancla
    FROM art_presentacion
   WHERE num_emp = emp AND cod_art_legacy = codancla AND activo = "S";

  IF factorancla IS NULL OR factorancla = 0 THEN
     LET canempactual = NULL;
     SELECT can_emp INTO canempactual FROM inarinv
      WHERE inarinv.num_emp = emp AND inarinv.cod_art = codancla;
     IF canempactual IS NULL OR canempactual = 0 THEN
        LET factorancla = 1;
     ELSE
        LET factorancla = canempactual;
     END IF;
  END IF;

  IF factorancla <> 0 THEN
     LET exicaj = existnew / factorancla;
  ELSE
     LET exicaj = 0;
  END IF;

  UPDATE inarinv
     SET exi_cor_kgs = existnew,
         exi_cor_caj = exicaj,
         cos_pro_kgs = costonew,
         sal_val = saldoval
   WHERE inarinv.num_emp = emp AND inarinv.cod_art = codancla;

  COMMIT WORK;

END PROCEDURE;

--------------------------------------------------------------------------
-- Notas de uso / que llama a esto:
--   * JUNTA.pas (venta de un articulo o de cada componente de un
--     bundle): esentrada='N' (salida), tipdoc='VE'.
--   * UOCRecepcion.pas (recepcion confirmada de almacen): esentrada='S'
--     (entrada), tipdoc='AC', costouni = precio pagado.
--   * UCierreDiario.pas (aplicar diferencias de inv_diario): llama a
--     sp_ajusta_existencia_base (no a sp_aplica_mov_kardex) porque ahi
--     la diferencia ya viene calculada en unidad base, no hay una
--     presentacion especifica que convertir.
--
-- En todos los casos el llamador sigue pasando el codigo LEGACY que ya
-- tenia a la mano (el que capturo/recibio/conto) -- nunca tiene que
-- resolver el ancla el mismo, eso lo hace el procedimiento.
--------------------------------------------------------------------------
