--------------------------------------------------------------------------
-- 00_drop_objetos_nuevos.sql
--
-- Reset limpio de TODO lo agregado en 03..09 (presentaciones, bundles,
-- recepcion, cierre diario, el motor de Kardex por presentacion, codigo
-- de barras y el catalogo de flotilla), para volver a crear todo desde
-- cero durante la fase de pruebas. NO TOCA ningun objeto legacy
-- (inarinv, inartrinv, ventas como tabla, inarped, act_kardex, etc.) --
-- solo quita lo que agregaron 03_objetos_presentaciones.sql,
-- delphi/04_bundles.sql, delphi/05_recepcion_compras.sql,
-- delphi/06_cierre_diario.sql, delphi/07_kardex_por_presentacion.sql,
-- delphi/08_codigo_barras.sql y delphi/09_flotilla.sql. Las columnas de
-- 08 (codigo_barras, codigo_bascula) se van solas al DROP TABLE
-- art_presentacion, no necesitan un DROP aparte.
--
-- Orden: triggers -> procedimientos -> tablas -> la columna agregada a
-- ventas. Los indices NO se dropean aparte -- en Informix, DROP TABLE se
-- lleva automaticamente todos los indices (y triggers) de esa tabla.
--
-- Si algun objeto de la lista todavia no existe (por ejemplo, primera
-- vez que corres esto, o solo se habia aplicado parte del paquete), ese
-- DROP puntual va a marcar error ("...does not exist" / -206 / -710) --
-- es esperado y NO detiene el resto del script; dbaccess sigue con la
-- siguiente instruccion. Revisa el log nomas para confirmar que los
-- unicos errores son de objetos inexistentes, no otra cosa.
--
-- Despues de correr este archivo, vuelve a crear todo con, en este
-- orden (ver 00_LEEME_migracion.md, Paso 3 / Paso 3b / Paso 3c):
--   dbaccess nombrebase 03_objetos_presentaciones.sql
--   dbaccess nombrebase delphi/04_bundles.sql
--   dbaccess nombrebase delphi/05_recepcion_compras.sql
--   dbaccess nombrebase delphi/06_cierre_diario.sql
--   dbaccess nombrebase delphi/07_kardex_por_presentacion.sql
--   dbaccess nombrebase delphi/08_codigo_barras.sql
--   dbaccess nombrebase delphi/09_flotilla.sql   (independiente, en cualquier momento)
--------------------------------------------------------------------------

DATABASE <NOMBREBASE>;

-- catalogo de flotilla de reparto (09) -- independiente de todo lo demas,
-- se puede dropear/recrear en cualquier orden respecto al resto
DROP TABLE "informix".flotilla_vehiculo;

-- triggers sobre ventas (tabla legacy que NO se dropea, solo se le quita
-- el trigger y la columna que agrego 03_objetos_presentaciones.sql)
DROP TRIGGER "informix".tr_ventas_presentacion_upd;
DROP TRIGGER "informix".tr_ventas_presentacion;

-- procedimientos, en el orden inverso al que se fueron agregando
DROP PROCEDURE "informix".sp_ajusta_existencia_base;      -- 07
DROP PROCEDURE "informix".sp_aplica_mov_kardex;            -- 07
DROP PROCEDURE "informix".sp_cierre_detecta_negativos;     -- 06
DROP PROCEDURE "informix".sp_cierre_recalcula_kardex;      -- 06
DROP PROCEDURE "informix".sp_recibe_renglon_oc;            -- 05
DROP PROCEDURE "informix".sp_aplica_presentacion_venta;    -- 03

-- tablas del motor de Kardex por presentacion (07)
DROP TABLE "informix".art_kardex_mov;
DROP TABLE "informix".art_existencia;

-- tablas de cierre diario (06)
DROP TABLE "informix".hist_log_cierre;
DROP TABLE "informix".hist_recalculo_kardex;
DROP TABLE "informix".hist_existencia_negativa;

-- tablas de recepcion de compras (05)
DROP TABLE "informix".oc_recepcion_detalle;
DROP TABLE "informix".oc_pedido_detalle;

-- tablas de bundles (04)
DROP TABLE "informix".bundle_detalle;
DROP TABLE "informix".bundle_producto;

-- tablas del catalogo unificado de presentaciones (03) -- se dropean al
-- final porque son las que referencian las demas por comentario/diseno
-- (bundle_detalle.id_presentacion, art_kardex_mov.id_presentacion, etc.
-- no son FOREIGN KEY reales, asi que el orden aqui no es estrictamente
-- obligatorio, pero se deja asi por claridad)
DROP TABLE "informix".inartrinv_peso;
DROP TABLE "informix".art_presentacion;   -- se lleva tambien el indice
                                           -- b_art_presentacion_legacy (07)
DROP TABLE "informix".art_producto;

-- columna agregada a la tabla legacy ventas
ALTER TABLE "informix".ventas DROP id_presentacion;

--------------------------------------------------------------------------
-- Fin. En este punto la base deberia quedar exactamente como estaba
-- antes de correr 03_objetos_presentaciones.sql por primera vez.
--------------------------------------------------------------------------
