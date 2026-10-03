--------------------------------------------------------------------------
-- 09_flotilla.sql
--
-- Catalogo de la flotilla de reparto (camionetas y camiones). A
-- diferencia de 04..08, esto NO depende de art_producto/art_presentacion
-- ni de ningun objeto legacy -- es un catalogo nuevo, independiente,
-- que se puede crear en cualquier momento despues de que la base ya
-- exista (Paso 1). No hay FK real (ni logica) hacia inarinv/ventas: por
-- ahora es solo el catalogo de unidades, sin todavia enlazar ventas o
-- rutas a un vehiculo especifico -- eso se agrega despues, aditivo,
-- cuando se necesite.
--------------------------------------------------------------------------

DATABASE <NOMBREBASE>;

--------------------------------------------------------------------------
-- Vehiculos de la flotilla
--------------------------------------------------------------------------
CREATE TABLE "informix".flotilla_vehiculo
  (
    id_vehiculo       SERIAL,
    num_emp           CHAR(2),
    numero_economico  CHAR(10),   -- clave interna, la que usa el despachador
    tipo_vehiculo     CHAR(1),    -- 'P' camioneta (pickup), 'C' camion
    placas            CHAR(10),
    marca             CHAR(20),
    modelo            CHAR(20),
    anio              SMALLINT,
    capacidad_kg      DECIMAL(10,2),  -- carga util, opcional/informativo
    chofer_habitual   CHAR(40),       -- opcional, texto libre (sin catalogo de choferes todavia)
    activo            CHAR(1) DEFAULT "S"
  );
REVOKE ALL ON "informix".flotilla_vehiculo FROM "public";

CREATE UNIQUE INDEX "informix".a_flotilla_vehiculo ON "informix".flotilla_vehiculo
    (num_emp, numero_economico) USING BTREE;
--------------------------------------------------------------------------
