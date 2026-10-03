--------------------------------------------------------------------------
-- 11_flotilla_bitacora.sql
--
-- Bitacora de combustible y mantenimiento por vehiculo. Una sola tabla
-- para los dos tipos de evento (columna "tipo") -- ambos comparten
-- fecha/kilometraje/costo/observaciones, y se diferencian solo en un
-- par de columnas (litros para combustible, taller/descripcion para
-- mantenimiento), asi que separarlas en dos tablas no agregaba nada.
--
-- Depende de que 09_flotilla.sql ya haya corrido (referencia logica a
-- flotilla_vehiculo.id_vehiculo, sin FOREIGN KEY real, igual que el
-- resto del paquete).
--------------------------------------------------------------------------

DATABASE <NOMBREBASE>;

CREATE TABLE "informix".flotilla_bitacora
  (
    id_bitacora       SERIAL,
    num_emp           CHAR(2),
    id_vehiculo       INTEGER,
    tipo              CHAR(1),        -- 'C' combustible, 'M' mantenimiento
    fecha             DATE,
    kilometraje       INTEGER,        -- odometro en el momento del registro
    litros            DECIMAL(8,2),   -- solo tipo='C'
    costo             DECIMAL(10,2),
    taller_proveedor  CHAR(40),       -- gasolinera o taller
    descripcion       CHAR(60),       -- ej. 'Diesel', 'Cambio de aceite', 'Frenos'
    observaciones     CHAR(100)
  );
REVOKE ALL ON "informix".flotilla_bitacora FROM "public";

CREATE INDEX "informix".a_flotilla_bitacora ON "informix".flotilla_bitacora
    (num_emp, id_vehiculo, fecha) USING BTREE;
--------------------------------------------------------------------------
