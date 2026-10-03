--------------------------------------------------------------------------
-- 08_codigo_barras.sql
--
-- Agrega identificacion por codigo de barras a las presentaciones que
-- se venden principalmente por menudeo. Aditivo sobre art_presentacion
-- (03_objetos_presentaciones.sql) -- no toca ningun objeto legacy ni
-- ningun objeto de 04..07.
--
-- Dos mecanismos conviven en las mismas dos columnas nuevas, segun
-- es_variable de la presentacion:
--
--   * FIJO (es_variable='N'): el codigo impreso de fabrica/empaque no
--     cambia nunca -- se guarda completo en codigo_barras y se busca
--     por igualdad exacta.
--
--   * BASCULA (es_variable='S'): la bascula imprime una etiqueta con un
--     EAN-13 que trae el peso codificado adentro, distinto en cada
--     venta -- no sirve buscar por igualdad. Formato confirmado por el
--     usuario (el mas comun en Mexico/LatAm):
--
--       dígitos 1-2   prefijo interno de bascula, 20 a 29
--       dígitos 3-7   codigo interno de la presentacion (5 digitos)
--       dígitos 8-12  peso en GRAMOS (5 digitos)
--       dígito  13    digito verificador (no se valida aqui)
--
--     Solo el segmento de 5 digitos de "codigo interno" se guarda en
--     codigo_bascula -- el peso viene codificado en el propio codigo
--     escaneado y se decodifica en el momento de la venta
--     (UFormPresentacion.ResuelvePorCodigoBarras), no se guarda en
--     ningun lado de antemano.
--------------------------------------------------------------------------

DATABASE <NOMBREBASE>;

ALTER TABLE "informix".art_presentacion ADD codigo_barras CHAR(14);
ALTER TABLE "informix".art_presentacion ADD codigo_bascula CHAR(5);

-- no son UNIQUE a proposito: mientras se van capturando puede haber mas
-- de una fila en NULL (presentaciones de compra sin codigo de barras),
-- igual que las demas columnas opcionales de este catalogo.
CREATE INDEX "informix".c_art_presentacion_barras ON "informix".art_presentacion
    (num_emp, codigo_barras) USING BTREE;
CREATE INDEX "informix".d_art_presentacion_bascula ON "informix".art_presentacion
    (num_emp, codigo_bascula) USING BTREE;
