--------------------------------------------------------------------------
-- 12_reparto.sql
--
-- Pedidos que se envian a ruta de reparto con la flotilla y choferes
-- asignados a cada ruta del dia. Depende de que 09_flotilla.sql y
-- 10_flotilla_choferes.sql ya hayan corrido (referencia logica a
-- flotilla_vehiculo.id_vehiculo y flotilla_chofer.id_chofer, sin
-- FOREIGN KEY real). No depende de 03..08 ni los modifica.
--
-- Por que cliente/direccion/importe se capturan en texto libre aqui
-- en vez de hacer FK a un catalogo de clientes:
-- el esquema legacy (ver 02_esquema_legacy_original.sql, tabla
-- "ventas") NO tiene un catalogo de clientes con direccion -- cada
-- venta trae su "nombre" (comprador) como texto suelto, sin domicilio.
-- La mayoria de las ventas en este negocio son de mostrador. Por eso
-- reparto_pedido es autocontenido: captura lo que haga falta para
-- repartir (cliente, direccion de entrega, telefono) sin asumir que
-- existe un cliente dado de alta en otro lado. folio_venta/
-- sucursal_venta/tipo_venta quedan como referencia OPCIONAL (nullable)
-- para cuando el pedido si viene de una venta ya facturada en JUNTA.pas
-- (no hay un INTEGER unico global en ventas -- folio se repite por
-- sucursal/tipo, por eso se guardan los tres juntos, igual que se
-- necesitarian para buscarla de regreso en ventas).
--
-- Estatus de reparto_ruta: 'A' Armando (se le estan agregando pedidos),
-- 'S' Salio a reparto, 'C' Cerrada (ya regreso, dia terminado).
--
-- Estatus de reparto_pedido (ver DOCUMENTACION_reparto.md para el flujo
-- completo y las sugerencias de estatus en tiempo real):
--   'P' Pendiente    -- asignado a la ruta, todavia en almacen
--   'C' Cargado      -- ya esta subido al vehiculo
--   'R' En ruta      -- el vehiculo ya salio con este pedido a bordo
--   'E' Entregado    -- el cliente firmo/sello de recibido
--   'N' No entregado -- rechazo, cliente cerrado, direccion no encontrada, etc.
--------------------------------------------------------------------------

DATABASE <NOMBREBASE>;

--------------------------------------------------------------------------
-- Una fila por vehiculo/chofer que sale a reparto en un dia
--------------------------------------------------------------------------
CREATE TABLE "informix".reparto_ruta
  (
    id_ruta       SERIAL,
    num_emp       CHAR(2),
    fecha         DATE,
    id_vehiculo   INTEGER,
    id_chofer     INTEGER,
    hora_salida   DATETIME YEAR TO MINUTE,
    hora_regreso  DATETIME YEAR TO MINUTE,
    estatus       CHAR(1) DEFAULT "A",
    observaciones CHAR(100)
  );
REVOKE ALL ON "informix".reparto_ruta FROM "public";

CREATE INDEX "informix".a_reparto_ruta ON "informix".reparto_ruta
    (num_emp, fecha) USING BTREE;

--------------------------------------------------------------------------
-- Cada pedido asignado a una ruta
--------------------------------------------------------------------------
CREATE TABLE "informix".reparto_pedido
  (
    id_pedido             SERIAL,
    id_ruta               INTEGER,
    num_emp               CHAR(2),
    orden_visita          SMALLINT,       -- orden sugerido de entrega en la ruta
    folio_venta           INTEGER,        -- opcional, referencia a ventas.folio
    sucursal_venta        CHAR(20),       -- opcional, ventas.sucursal
    tipo_venta            CHAR(2),        -- opcional, ventas.tipo
    cliente               CHAR(60),
    direccion_entrega     CHAR(100),
    telefono              CHAR(20),
    referencia_pedido     CHAR(20),       -- libre, puede amarrar con ventas.pedido
    importe_total         DECIMAL(12,2),
    estatus               CHAR(1) DEFAULT "P",
    fecha_hora_entrega    DATETIME YEAR TO MINUTE,
    quien_recibio         CHAR(60),       -- nombre de quien firma/sella de recibido
    observaciones_entrega CHAR(200),      -- el "espacio en blanco" de la remision, ya capturado de vuelta
    remision_impresa      CHAR(1) DEFAULT "N",
    activo                CHAR(1) DEFAULT "S"  -- 'N' = se dio de baja de la ruta sin borrar el historial
  );
REVOKE ALL ON "informix".reparto_pedido FROM "public";

CREATE INDEX "informix".a_reparto_pedido ON "informix".reparto_pedido
    (id_ruta, orden_visita) USING BTREE;
CREATE INDEX "informix".b_reparto_pedido ON "informix".reparto_pedido
    (num_emp, estatus) USING BTREE;

--------------------------------------------------------------------------
-- Historial de cambios de estatus -- es lo que permite reconstruir en
-- que momento paso cada pedido por cada etapa (pendiente/cargado/
-- en ruta/entregado), base para el tablero de "tiempo real"
-- (URepartoMonitor.pas) y para auditoria si hay una queja de cliente.
--------------------------------------------------------------------------
CREATE TABLE "informix".reparto_pedido_estatus_hist
  (
    id_hist           SERIAL,
    id_pedido         INTEGER,
    estatus_anterior  CHAR(1),
    estatus_nuevo     CHAR(1),
    fecha_hora        DATETIME YEAR TO MINUTE,
    usuario           CHAR(20)
  );
REVOKE ALL ON "informix".reparto_pedido_estatus_hist FROM "public";

CREATE INDEX "informix".a_reparto_pedido_estatus_hist
    ON "informix".reparto_pedido_estatus_hist (id_pedido) USING BTREE;
--------------------------------------------------------------------------
