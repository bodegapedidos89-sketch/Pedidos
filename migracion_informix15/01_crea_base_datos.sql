--------------------------------------------------------------------------
-- 01_crea_base_datos.sql
-- Crea la base de datos en el servidor NUEVO (Informix Innovator-C 15.0.x
-- en CentOS/RHEL) antes de cargar el esquema legacy.
--
-- AJUSTA estos 3 valores antes de correrlo:
--   <NOMBREBASE>  -> el nombre real de tu base (el mismo que en SE 10.0)
--   <DBSPACE>     -> el dbspace donde quieres que viva (revisa tu onconfig,
--                     normalmente rootdbs si no has creado uno dedicado)
--   locale        -> deja es_mx.8859-1 si tus datos tienen acentos/ñ
--                     capturados como en SE (Latin-1 / codepage 819).
--                     Si tu SE 10 realmente corre en en_us.819 confirma con:
--                        onstat -g glo   (en el servidor viejo)
--                     antes de decidir el locale del nuevo servidor.
--------------------------------------------------------------------------

-- IDS necesita logging de transacciones (SE normalmente corria sin esto).
-- Tus propios procedimientos ya usan BEGIN WORK / COMMIT WORK, asi que
-- la base DEBE crearse WITH LOG para que esas transacciones funcionen.

CREATE DATABASE <NOMBREBASE> IN <DBSPACE>
    WITH LOG
    WITH BUFFERED LOG
    MODE ANSI;          -- quita "MODE ANSI" si tu app no maneja COMMIT
                         -- explicito en todas sus transacciones (revisa con
                         -- cuidado: la mayoria de sistemas Delphi/BDE viejos
                         -- NO esperan modo ANSI; si tienes dudas, omite esta
                         -- linea y usa modo no-ANSI, que es el default).

DATABASE <NOMBREBASE>;

--------------------------------------------------------------------------
-- Notas de compatibilidad SE 10.0 -> IDS 15.0 Innovator-C que debes
-- validar ANTES de continuar con 02_esquema_legacy_original.sql:
--
-- 1) OWNERSHIP: el esquema legacy tiene objetos con dueño "informix" y
--    otros con dueño "xxx". En Informix, el dueño de un objeto se resuelve
--    contra un usuario del SISTEMA OPERATIVO. En el servidor nuevo:
--      - el usuario "informix" ya existe (se crea con la instalacion).
--      - el usuario "xxx" (o el nombre real que tengas en produccion,
--        "xxx" aqui es un valor generico/anonimizado del dump) DEBE
--        existir como usuario del SO en el CentOS nuevo, o todas las
--        sentencias CREATE TABLE/PROCEDURE/TRIGGER de "xxx".* van a
--        fallar. Crea ese usuario del SO antes de correr el script:
--           useradd xxx
--        (sin necesidad de password de login si solo es para ownership).
--
-- 2) Verifica certificacion de tu SO exacto contra la version de Informix
--    15.0.x que vayas a instalar (IBM/HCL certifican por build especifico
--    de RHEL/CentOS, no "CentOS" en general) antes de instalar el motor.
--
-- 3) Corre esto SOLO despues de 01, y ANTES de 02:
--       onmode -c   (opcional, fuerza un checkpoint limpio en el server nuevo)
--------------------------------------------------------------------------
