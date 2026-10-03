--------------------------------------------------------------------------
-- 10_flotilla_choferes.sql
--
-- Catalogo de choferes de la flotilla de reparto. Igual que
-- 09_flotilla.sql, es independiente -- no depende de art_producto/
-- art_presentacion ni de ningun objeto legacy, y nada de lo demas
-- depende de este archivo. Se puede crear en cualquier momento
-- despues del Paso 1.
--
-- No se liga aqui a flotilla_vehiculo.chofer_habitual (que sigue
-- siendo texto libre, informativo, "el chofer de costumbre de esta
-- unidad") -- la asignacion real de QUE chofer va con QUE vehiculo
-- en un dia especifico se captura en reparto_ruta (12_reparto.sql),
-- que si referencia esta tabla por id_chofer.
--------------------------------------------------------------------------

DATABASE <NOMBREBASE>;

CREATE TABLE "informix".flotilla_chofer
  (
    id_chofer         SERIAL,
    num_emp           CHAR(2),
    clave             CHAR(10),   -- numero de empleado o clave interna
    nombre            CHAR(60),
    licencia          CHAR(20),
    vigencia_licencia DATE,       -- para poder avisar cuando este por vencer
    telefono          CHAR(20),
    activo            CHAR(1) DEFAULT "S"
  );
REVOKE ALL ON "informix".flotilla_chofer FROM "public";

CREATE UNIQUE INDEX "informix".a_flotilla_chofer ON "informix".flotilla_chofer
    (num_emp, clave) USING BTREE;
--------------------------------------------------------------------------
