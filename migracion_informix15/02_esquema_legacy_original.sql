--------------------------------------------------------------------------
-- 02_esquema_legacy_original.sql
--
-- Este archivo es tu volcado de esquema de Informix SE 10.0 TAL CUAL
-- (basedatos_legacy.txt), sin modificar el contenido. Es un export de solo
-- ESQUEMA (tablas, indices, permisos, procedimientos SPL y triggers) --
-- NO trae datos. Ya viene en un orden de dependencias que funciona:
--   tablas + revokes  ->  grants  ->  procedimientos  ->  indices  ->  triggers
--
-- Corre este archivo DESPUES de 01_crea_base_datos.sql, dentro de la
-- misma sesion de dbaccess (para que "DATABASE <NOMBREBASE>;" siga activo):
--
--   dbaccess <NOMBREBASE> - <<EOF
--   $(cat 01_crea_base_datos.sql)
--   $(cat 02_esquema_legacy_original.sql)
--   EOF
--
-- o mas simple, concatenando ambos en un solo archivo antes de correrlo:
--   cat 01_crea_base_datos.sql 02_esquema_legacy_original.sql > migra_esquema.sql
--   dbaccess - migra_esquema.sql > migra_esquema.log 2>&1
--
-- IMPORTANTE: este script NO mueve los datos. Los datos se migran aparte
-- con dbexport/dbimport (ver 00_LEEME_migracion.md, paso 2). Corre PRIMERO
-- este script de esquema en una base vacia, y DESPUES carga los datos con
-- dbimport apuntando a filas ya con la estructura correcta -- o, si usas
-- dbexport/dbimport para TODO (esquema + datos juntos, la forma recomendada
-- por IBM/HCL), entonces NO necesitas correr este archivo en absoluto:
-- dbimport genera su propio esquema a partir del .sql que produce dbexport.
-- Este archivo es tu respaldo/version legible y tu referencia para comparar
-- objeto por objeto si algo no importa limpio.
--
-- Revisa las notas de 01_crea_base_datos.sql (ownership de "xxx", locale,
-- modo ANSI) ANTES de correr esto.
--------------------------------------------------------------------------

 

 
{ TABLE "informix".inarinv row size = 399 number of columns = 51 index size = 104 
              }
create table "informix".inarinv 
  (
    num_emp char(2),
    cod_art char(14),
    cod_art1 char(14),
    des_art char(40),
    uni_art char(4),
    emp_art char(4),
    can_emp decimal(10,4),
    precio_1 decimal(10,2),
    precio_2 decimal(10,2),
    precio_3 decimal(10,2),
    precio_4 decimal(10,2),
    precio_5 decimal(10,2),
    sal_val decimal(14,4),
    sal_ant decimal(14,4),
    ult_cos_kgs decimal(12,4),
    cos_pro_kgs decimal(12,4),
    cos_ant_kgs decimal(12,4),
    ven_mes_kgs decimal(14,4),
    cos_mes_kgs decimal(14,4),
    ven_acu_kgs decimal(14,4),
    cos_acu_kgs decimal(14,4),
    exi_cor_kgs decimal(10,4),
    exi_ant_kgs decimal(10,4),
    exi_fis_kgs decimal(10,4),
    can_acu_kgs decimal(12,4),
    can_mes_kgs decimal(12,4),
    ult_cos_caj decimal(12,4),
    cos_pro_caj decimal(12,4),
    cos_ant_caj decimal(12,4),
    ven_mes_caj decimal(14,4),
    cos_mes_caj decimal(14,4),
    ven_acu_caj decimal(14,4),
    cos_acu_caj decimal(14,4),
    exi_cor_caj decimal(10,4),
    exi_ant_caj decimal(10,4),
    exi_fis_caj decimal(10,4),
    can_acu_caj decimal(12,4),
    can_mes_caj decimal(12,4),
    back_cli decimal(6,4),
    back_pro decimal(6,4),
    min_emp decimal(10,4),
    max_emp decimal(10,4),
    iva decimal(4,2),
    lin_ven smallint,
    cod_pro char(8),
    tip_art char(1),
    edo_pro char(2),
    ban_rep char(1),
    min_pre decimal(10,4),
    max_pre decimal(10,4),
    observa char(50)
  );
revoke all on "informix".inarinv from "public";

{ TABLE "informix".inarprov row size = 288 number of columns = 25 index size = 15 
              }
create table "informix".inarprov 
  (
    num_emp char(2),
    cod_pro char(8),
    raz_soc char(50),
    dom_pro char(50),
    ciu_pro char(20),
    est_pro char(10),
    tel_1 char(30),
    rfc_pro char(20),
    cod_pos integer,
    age_pro smallint,
    con_pro char(1),
    pla_pro smallint,
    sta_pro char(1),
    lim_cre decimal(10,0),
    sal_act decimal(12,2),
    sal_ant decimal(12,2),
    com_mes decimal(12,2),
    cos_mes decimal(12,2),
    com_acu decimal(12,2),
    cos_acu decimal(12,2),
    fech_com date,
    can_com decimal(12,2),
    fech_pag date,
    imp_pag decimal(12,2),
    curp char(18)
  );
revoke all on "informix".inarprov from "public";

{ TABLE "informix".inarcl row size = 462 number of columns = 27 index size = 15 }
create table "informix".inarcl 
  (
    num_emp char(2),
    cod_cli char(8),
    raz_soc char(150),
    dom_cli char(60),
    ciu_cli char(20),
    est_cli char(10),
    tel_cli char(12),
    rfc_cli char(20),
    cod_pos integer,
    age_cli smallint,
    con_cli char(1),
    pla_cli smallint,
    sta_cli char(1),
    lim_cre decimal(10,0),
    sal_act decimal(10,2),
    sal_ant decimal(10,2),
    com_mes decimal(10,2),
    cos_mes decimal(10,2),
    com_acu decimal(10,2),
    cos_acu decimal(10,2),
    fech_com date,
    can_com decimal(10,2),
    fech_pag date,
    imp_pag decimal(10,2),
    curp char(18),
    apodo char(40),
    observa char(50)
  );
revoke all on "informix".inarcl from "public";

{ TABLE "informix".inarcia row size = 157 number of columns = 7 index size = 0 }
create table "informix".inarcia 
  (
    num_emp char(2),
    nom_emp char(50),
    dom_emp char(40),
    pob_emp char(30),
    reg_emp char(20),
    par_dls decimal(8,2),
    pass char(10)
  );
revoke all on "informix".inarcia from "public";

{ TABLE "informix".inarsuc row size = 190 number of columns = 18 index size = 0 }
create table "informix".inarsuc 
  (
    num_emp char(2),
    num_suc char(2),
    nom_suc char(50),
    dom_suc char(40),
    pob_suc char(30),
    num_fac integer,
    ventas decimal(14,2),
    costos decimal(14,2),
    num_pag integer,
    num_cot integer,
    ven_exe decimal(14,2),
    ven_gra decimal(14,2),
    num_dev integer,
    ent_div integer,
    sal_div integer,
    pag_pro integer,
    con_lis smallint,
    num_pag1 integer
  );
revoke all on "informix".inarsuc from "public";

{ TABLE "informix".inartrinv2015 row size = 135 number of columns = 22 index size 
              = 0 }
create table "informix".inartrinv2015 
  (
    num_emp char(2),
    cod_art char(14),
    num_suc char(2),
    fech_doc date,
    tip_doc char(2),
    num_doc char(10),
    can_kgs decimal(10,4),
    can_caj decimal(10,4),
    cos_uni_kgs decimal(12,4),
    cos_uni_caj decimal(12,4),
    cos_pro_kgs decimal(12,4),
    cos_pro_caj decimal(12,4),
    pre_vta_kgs decimal(12,4),
    pre_vta_caj decimal(12,4),
    des_vta decimal(12,4),
    fle_art decimal(12,4),
    ren_art smallint,
    cod_pro char(8),
    cod_cli char(8),
    num_ent integer,
    fech_ent date,
    iva_art decimal(12,4)
  );
revoke all on "informix".inartrinv2015 from "public";

{ TABLE "informix".inarent row size = 308 number of columns = 32 index size = 46 
              }
create table "informix".inarent 
  (
    num_emp char(2),
    num_suc char(2),
    num_ent char(10),
    cod_pro char(8),
    raz_soc char(50),
    num_ped integer,
    num_fac char(10),
    imp_exe decimal(12,2),
    imp_6 decimal(12,2),
    imp_15 decimal(12,2),
    imp_20 decimal(12,2),
    des_exe decimal(10,2),
    des_6 decimal(10,2),
    des_15 decimal(10,2),
    des_20 decimal(10,2),
    iva_6 decimal(10,2),
    iva_15 decimal(10,2),
    iva_20 decimal(10,2),
    fle_ent decimal(10,2),
    iva_fle decimal(10,2),
    seg_mer decimal(10,2),
    gas_adu decimal(12,2),
    iva_gas decimal(12,2),
    hon_adu decimal(12,2),
    ret_adu decimal(12,2),
    iva_adu decimal(12,2),
    fecha date,
    dom_pro char(40),
    ciu_pro char(15),
    edo_pro char(10),
    rfc_pro char(20),
    placas_pro char(10)
  );
revoke all on "informix".inarent from "public";

{ TABLE "informix".inartrpr row size = 59 number of columns = 12 index size = 68 
              }
create table "informix".inartrpr 
  (
    num_emp char(2),
    num_suc char(2),
    num_ent char(10),
    tip_ent char(1),
    cod_pro char(8),
    num_fac integer,
    fech_ent date,
    imp_ent decimal(12,2),
    fech_ven date,
    sal_ent decimal(12,2),
    sal_iva decimal(10,2),
    fecha date
  );
revoke all on "informix".inartrpr from "public";

{ TABLE "xxx".log_borrado row size = 44 number of columns = 5 index size = 0 
              }
create table "xxx".log_borrado 
  (
    usuario char(10),
    horario datetime year to minute,
    num_fac char(10),
    imp_fac decimal(12,2),
    tip_doc char(10)
  );
revoke all on "xxx".log_borrado from "public";

{ TABLE "informix".inarcot1 row size = 101 number of columns = 18 index size = 116 
              }
create table "informix".inarcot1 
  (
    num_emp char(2),
    cod_art char(14),
    num_suc char(2),
    fech_doc date,
    tip_doc char(2),
    num_doc integer,
    can_kgs decimal(10,4),
    can_caj decimal(10,4),
    cos_pro_kgs decimal(12,4),
    cos_pro_caj decimal(12,4),
    pre_vta_kgs decimal(12,4),
    pre_vta_caj decimal(12,4),
    des_vta decimal(12,4),
    fle_art decimal(12,4),
    ren_art smallint,
    cod_cli char(8),
    iva_art decimal(12,4),
    cod_ag smallint
  );
revoke all on "informix".inarcot1 from "public";

{ TABLE "informix".inarcot row size = 437 number of columns = 37 index size = 15 
              }
create table "informix".inarcot 
  (
    num_emp char(2),
    num_suc char(2),
    num_doc integer,
    cod_cli char(8),
    raz_soc char(50),
    dom_cli char(60),
    ciu_cli char(20),
    est_cli char(10),
    rfc_cli char(20),
    emb_nom char(40),
    emb_dom char(40),
    emb_pob char(30),
    num_ped integer,
    fech_ped date,
    num_ord integer,
    fech_emb date,
    con_cli char(1),
    cod_ag smallint,
    imp_exe decimal(14,4),
    imp_6 decimal(14,4),
    imp_15 decimal(14,4),
    imp_20 decimal(14,4),
    des_exe decimal(12,4),
    des_6 decimal(12,4),
    des_15 decimal(12,4),
    des_20 decimal(12,4),
    iva_6 decimal(12,4),
    iva_15 decimal(12,4),
    iva_20 decimal(12,4),
    cos_vta decimal(14,4),
    flete decimal(12,4),
    iva_fle decimal(12,4),
    car_1 decimal(12,4),
    iva_1 decimal(12,4),
    car_2 decimal(12,4),
    iva_2 decimal(12,4),
    estado char(1)
  );
revoke all on "informix".inarcot from "public";

{ TABLE "informix".inarag row size = 116 number of columns = 14 index size = 0 }
create table "informix".inarag 
  (
    num_emp char(2),
    num_suc char(2),
    cod_ag smallint,
    nom_ag char(40),
    vta_mes decimal(12,2),
    cos_mes decimal(12,2),
    com_mes decimal(12,2),
    vta_acu decimal(12,2),
    cos_acu decimal(12,2),
    com_acu decimal(12,2),
    pag_mes decimal(12,2),
    pag_acu decimal(12,2),
    folio integer,
    clave char(10)
  );
revoke all on "informix".inarag from "public";

{ TABLE "informix".ventas row size = 279 number of columns = 21 index size = 36 }
create table "informix".ventas 
  (
    folio integer,
    descripcion char(50),
    codigo char(14),
    cajas decimal(10,4),
    kilos decimal(10,4),
    precio decimal(12,4),
    total decimal(12,4),
    nombre char(50),
    iva decimal(12,4),
    cos_pro decimal(12,4),
    totiva decimal(12,4),
    renglon smallint,
    pagado smallint,
    rfc char(20),
    tipo char(2),
    lineaven char(20),
    descto decimal(10,4),
    pedido char(20),
    observacion char(20),
    sucursal char(20),
    num_emp char(2)
  );
revoke all on "informix".ventas from "public";

{ TABLE "informix".sucursales row size = 28 number of columns = 2 index size = 0 
              }
create table "informix".sucursales 
  (
    grupo char(8),
    sucursal char(20)
  );
revoke all on "informix".sucursales from "public";

{ TABLE "informix".inartrcl row size = 51 number of columns = 9 index size = 73 }
create table "informix".inartrcl 
  (
    num_emp char(2),
    num_suc char(2),
    cod_cli char(8),
    tipo char(2),
    num_docto char(10),
    importe decimal(14,4),
    sal_fac decimal(14,4),
    sal_iva decimal(12,4),
    fecha date
  );
revoke all on "informix".inartrcl from "public";

{ TABLE "informix".conspagcli row size = 10 number of columns = 3 index size = 0 
              }
create table "informix".conspagcli 
  (
    num_emp char(2),
    num_pago integer,
    pag_cli integer
  );
revoke all on "informix".conspagcli from "public";

{ TABLE "xxx".bancos row size = 20 number of columns = 1 index size = 0 }
create table "xxx".bancos 
  (
    banco char(20)
  );
revoke all on "xxx".bancos from "public";

{ TABLE "xxx".cajeras row size = 103 number of columns = 10 index size = 0 }
create table "xxx".cajeras 
  (
    num_emp char(2),
    cajera char(12),
    nom_caj char(40),
    imp_che_dia decimal(12,2),
    imp_efe_dia decimal(12,2),
    imp_bon_dia decimal(12,2),
    che_pre_dia decimal(12,2),
    imp_dol_dia decimal(12,2),
    imp_fac decimal(12,2),
    imp_tik decimal(12,2)
  );
revoke all on "xxx".cajeras from "public";

{ TABLE "informix".inarpvt row size = 503 number of columns = 47 index size = 51 
              }
create table "informix".inarpvt 
  (
    num_emp char(2),
    num_suc char(2),
    num_doc integer,
    cod_cli char(8),
    raz_soc char(50),
    dom_cli char(60),
    ciu_cli char(20),
    est_cli char(10),
    emb_nom char(40),
    emb_dom char(40),
    emb_pob char(30),
    num_ped integer,
    fech_ped date,
    num_ord integer,
    fech_emb date,
    con_cli char(1),
    ag_fac smallint,
    imp_exe decimal(14,4),
    imp_6 decimal(14,4),
    imp_15 decimal(14,4),
    imp_20 decimal(14,4),
    des_exe decimal(12,4),
    des_6 decimal(12,4),
    des_15 decimal(12,4),
    des_20 decimal(12,4),
    iva_6 decimal(12,4),
    iva_15 decimal(12,4),
    iva_20 decimal(12,4),
    cos_vta decimal(14,4),
    flete decimal(12,4),
    iva_fle decimal(12,4),
    car_1 decimal(12,4),
    iva_1 decimal(12,4),
    car_2 decimal(12,4),
    iva_2 decimal(12,4),
    fecha date,
    reg_fed char(20),
    tip_fac char(1),
    efectivo decimal(12,4),
    bono decimal(12,4),
    dolar decimal(12,4),
    cheque decimal(12,4),
    num_che integer,
    fech_che date,
    cajera char(12),
    num_fac char(10),
    fech_fac date
  );
revoke all on "informix".inarpvt from "public";

{ TABLE "xxx".consecutivo row size = 18 number of columns = 3 index size = 0 
              }
create table "xxx".consecutivo 
  (
    num_emp char(2),
    cajera char(12),
    num_tik integer
  );
revoke all on "xxx".consecutivo from "public";

{ TABLE "informix".corte_caja row size = 157 number of columns = 16 index size = 
              43 }
create table "informix".corte_caja 
  (
    folio integer,
    factura char(10),
    nombre char(50),
    caja char(12),
    efectivo decimal(14,2),
    bonos decimal(14,2),
    cheque decimal(14,2),
    dolar decimal(14,2),
    total decimal(14,2),
    tipo_pago char(10),
    tipo_fac char(10),
    fecha date,
    num_emp char(2),
    num_suc char(2),
    cod_cli char(6),
    iva decimal(12,2)
  );
revoke all on "informix".corte_caja from "public";

{ TABLE "informix".tcanemp row size = 333 number of columns = 48 index size = 0 }
create table "informix".tcanemp 
  (
    num_emp char(2),
    cod_art char(14),
    cod_art1 char(14),
    des_art char(40),
    uni_art char(4),
    emp_art char(4),
    can_emp decimal(10,4),
    precio_1 decimal(10,2),
    precio_2 decimal(10,2),
    precio_3 decimal(10,2),
    precio_4 decimal(10,2),
    precio_5 decimal(10,2),
    sal_val decimal(14,4),
    sal_ant decimal(14,4),
    ult_cos_kgs decimal(12,4),
    cos_pro_kgs decimal(12,4),
    cos_ant_kgs decimal(12,4),
    ven_mes_kgs decimal(14,4),
    cos_mes_kgs decimal(14,4),
    ven_acu_kgs decimal(14,4),
    cos_acu_kgs decimal(14,4),
    exi_cor_kgs decimal(10,4),
    exi_ant_kgs decimal(10,4),
    exi_fis_kgs decimal(10,4),
    can_acu_kgs decimal(12,4),
    can_mes_kgs decimal(12,4),
    ult_cos_caj decimal(12,4),
    cos_pro_caj decimal(12,4),
    cos_ant_caj decimal(12,4),
    ven_mes_caj decimal(14,4),
    cos_mes_caj decimal(14,4),
    ven_acu_caj decimal(14,4),
    cos_acu_caj decimal(14,4),
    exi_cor_caj decimal(10,4),
    exi_ant_caj decimal(10,4),
    exi_fis_caj decimal(10,4),
    can_acu_caj decimal(12,4),
    can_mes_caj decimal(12,4),
    back_cli decimal(6,4),
    back_pro decimal(6,4),
    minimo decimal(6,0),
    maximo decimal(6,0),
    iva decimal(4,2),
    lin_ven smallint,
    cod_pro char(8),
    tip_art char(1),
    edo_pro char(2),
    ban_rep char(1)
  );
revoke all on "informix".tcanemp from "public";

{ TABLE "informix".inartrcl1 row size = 76 number of columns = 11 index size = 43 
              }
create table "informix".inartrcl1 
  (
    num_emp char(2),
    num_suc char(2),
    tip_car char(2),
    num_car char(10),
    num_cre char(20),
    tip_cre char(2),
    cod_cli char(8),
    importe decimal(14,4),
    iva decimal(14,4),
    fecha date,
    for_pag char(10)
  );
revoke all on "informix".inartrcl1 from "public";

{ TABLE "informix".inarpcl row size = 177 number of columns = 20 index size = 44 
              }
create table "informix".inarpcl 
  (
    num_emp char(2),
    num_suc char(2),
    tipo_pago char(2),
    num_pago char(20),
    cod_cli char(8),
    raz_soc char(50),
    imp_pago decimal(12,2),
    iva_pago decimal(10,2),
    fecha date,
    forma_pago char(10),
    fech_cheq date,
    banco char(20),
    num_cheq integer,
    tip_cheq char(2),
    efectivo decimal(12,2),
    bonos decimal(12,2),
    cheque decimal(12,2),
    dolares decimal(12,2),
    che_pref decimal(12,2),
    loc_for char(1)
  );
revoke all on "informix".inarpcl from "public";

{ TABLE "informix".inarppr row size = 134 number of columns = 15 index size = 42 
              }
create table "informix".inarppr 
  (
    num_emp char(2),
    num_suc char(2),
    tipo_pago char(2),
    num_pago integer,
    cod_pro char(8),
    raz_soc char(50),
    imp_pago decimal(12,2),
    iva_pago decimal(10,2),
    fecha date,
    forma_pago char(10),
    banco char(20),
    num_cheq integer,
    efectivo decimal(12,2),
    cheque decimal(12,2),
    loc_for char(1)
  );
revoke all on "informix".inarppr from "public";

{ TABLE "informix".inartrpr1 row size = 58 number of columns = 11 index size = 27 
              }
create table "informix".inartrpr1 
  (
    num_emp char(2),
    num_suc char(2),
    tip_ent char(2),
    num_ent char(10),
    num_pag integer,
    tip_pag char(2),
    cod_pro char(8),
    importe decimal(12,2),
    iva decimal(12,2),
    fecha date,
    for_pag char(10)
  );
revoke all on "informix".inartrpr1 from "public";

{ TABLE "informix".conspagpro row size = 10 number of columns = 3 index size = 0 
              }
create table "informix".conspagpro 
  (
    num_emp char(2),
    num_pago integer,
    pag_cli integer
  );
revoke all on "informix".conspagpro from "public";

{ TABLE "informix".tmpcli row size = 42 number of columns = 6 index size = 0 }
create table "informix".tmpcli 
  (
    importe decimal(12,2),
    sal_fac decimal(12,2),
    sal_iva decimal(10,2),
    no_doc char(10),
    total_fac decimal(10,2),
    total_iva decimal(10,2)
  );
revoke all on "informix".tmpcli from "public";

{ TABLE "informix".foltickets row size = 42 number of columns = 10 index size = 0 
              }
create table "informix".foltickets 
  (
    num_emp char(2),
    num_suc char(2),
    num_fac char(10),
    tik1 integer,
    tik2 integer,
    tik3 integer,
    tik4 integer,
    tik5 integer,
    tik6 integer,
    fecha date
  );
revoke all on "informix".foltickets from "public";

{ TABLE "informix".inardev row size = 411 number of columns = 30 index size = 99 
              }
create table "informix".inardev 
  (
    num_emp char(2),
    num_suc char(2),
    num_dev char(20),
    cod_cli char(8),
    raz_soc char(50),
    dom_cli char(60),
    ciu_cli char(20),
    est_cli char(10),
    imp_exe decimal(14,4),
    imp_6 decimal(14,4),
    imp_15 decimal(14,4),
    imp_20 decimal(14,4),
    des_exe decimal(10,4),
    des_6 decimal(10,4),
    des_15 decimal(10,4),
    des_20 decimal(10,4),
    iva_6 decimal(10,4),
    iva_15 decimal(10,4),
    iva_20 decimal(10,4),
    cos_vta decimal(12,4),
    flete decimal(12,4),
    iva_fle decimal(12,4),
    car_1 decimal(12,4),
    iva_1 decimal(12,4),
    car_2 decimal(12,4),
    iva_2 decimal(12,4),
    fecha date,
    reg_fed char(20),
    motivo char(80),
    cajera char(12)
  );
revoke all on "informix".inardev from "public";

{ TABLE "informix".tempdev row size = 106 number of columns = 16 index size = 0 }
create table "informix".tempdev 
  (
    num_emp char(2),
    cajas decimal(10,4),
    kilos decimal(10,4),
    no_dev decimal(12,2),
    no_fac char(10),
    codigo char(15),
    pre_vta_kgs decimal(10,4),
    subtot decimal(10,4),
    iva decimal(10,4),
    cos_pro_kgs decimal(10,4),
    cos_pro_caj decimal(10,4),
    desgrav decimal(10,4),
    desexce decimal(10,4),
    pre_vta_caj decimal(10,4),
    flete decimal(10,4),
    renglon decimal(10,4)
  );
revoke all on "informix".tempdev from "public";

{ TABLE "informix".respaventas row size = 261 number of columns = 21 index size = 
              0 }
create table "informix".respaventas 
  (
    folio integer,
    descripcion char(50),
    codigo char(14),
    cajas decimal(10,4),
    kilos decimal(10,4),
    precio decimal(12,4),
    total decimal(12,4),
    nombre char(50),
    iva decimal(12,4),
    cos_pro decimal(12,4),
    totiva decimal(12,4),
    renglon smallint,
    pagado smallint,
    rfc char(20),
    tipo char(2),
    lineaven char(20),
    descto decimal(10,4),
    pedido char(2),
    observacion char(20),
    sucursal char(20),
    num_emp char(2)
  );
revoke all on "informix".respaventas from "public";

{ TABLE "informix".folio row size = 24 number of columns = 2 index size = 0 }
create table "informix".folio 
  (
    caja char(20),
    folio integer
  );
revoke all on "informix".folio from "public";

{ TABLE "informix".tmpprov row size = 48 number of columns = 8 index size = 0 }
create table "informix".tmpprov 
  (
    entrada integer,
    importe decimal(12,2),
    sal_ent decimal(12,2),
    sal_iva decimal(10,2),
    total_fac decimal(10,2),
    total_iva decimal(10,2),
    sal_ieps decimal(10,2),
    total_ieps decimal(10,2)
  );
revoke all on "informix".tmpprov from "public";

{ TABLE "informix".inarfac row size = 458 number of columns = 39 index size = 69 
              }
create table "informix".inarfac 
  (
    num_emp char(2),
    num_suc char(2),
    num_doc char(10),
    cod_cli char(8),
    raz_soc char(50),
    dom_cli char(60),
    ciu_cli char(20),
    est_cli char(10),
    emb_nom char(40),
    emb_dom char(40),
    emb_pob char(30),
    num_ped integer,
    fech_ped date,
    num_ord integer,
    fech_emb date,
    con_cli char(1),
    ag_fac smallint,
    imp_exe decimal(14,4),
    imp_6 decimal(14,4),
    imp_15 decimal(14,4),
    imp_20 decimal(14,4),
    des_exe decimal(12,4),
    des_6 decimal(12,4),
    des_15 decimal(12,4),
    des_20 decimal(12,4),
    iva_6 decimal(12,4),
    iva_15 decimal(12,4),
    iva_20 decimal(12,4),
    cos_vta decimal(12,4),
    flete decimal(12,4),
    iva_fle decimal(12,4),
    car_1 decimal(12,4),
    iva_1 decimal(12,4),
    car_2 decimal(12,4),
    iva_2 decimal(12,4),
    fecha date,
    reg_fed char(20),
    tip_fac char(1),
    cajera char(12)
  );
revoke all on "informix".inarfac from "public";

{ TABLE "informix".tmp_kardex row size = 46 number of columns = 8 index size = 33 
              }
create table "informix".tmp_kardex 
  (
    folio integer,
    codigo char(14),
    kilos decimal(10,2),
    cajas decimal(10,4),
    tipo char(2),
    tipo_doc char(2),
    factura char(10),
    ren smallint
  );
revoke all on "informix".tmp_kardex from "public";

{ TABLE "xxx".tmp_canemp row size = 83 number of columns = 13 index size = 0 
              }
create table "xxx".tmp_canemp 
  (
    fech_doc date,
    cod_art char(14),
    tip_doc char(2),
    num_doc char(10),
    can_kgs decimal(10,4),
    can_caj decimal(10,4),
    can_emp decimal(10,4),
    ren smallint,
    pro_kgs decimal(12,4),
    pro_caj decimal(12,4),
    exi_kgs decimal(10,4),
    exi_caj decimal(10,4),
    sal_val decimal(12,4)
  );
revoke all on "xxx".tmp_canemp from "public";

{ TABLE "xxx".log_actkardex row size = 70 number of columns = 9 index size = 
              0 }
create table "xxx".log_actkardex 
  (
    num_emp char(2),
    fech_doc date,
    num_doc char(10),
    tip_doc char(2),
    codigo char(14),
    can_kgs decimal(10,4),
    can_caj decimal(10,4),
    can_emp decimal(10,4),
    motivo char(20)
  );
revoke all on "xxx".log_actkardex from "public";

{ TABLE "xxx".inardiverso row size = 123 number of columns = 9 index size = 0 
              }
create table "xxx".inardiverso 
  (
    num_emp char(2),
    num_suc char(2),
    fech_doc date,
    num_doc char(10),
    tip_doc char(2),
    imp_exe decimal(14,4),
    imp_15 decimal(14,4),
    iva_15 decimal(12,4),
    concepto char(80)
  );
revoke all on "xxx".inardiverso from "public";

{ TABLE "informix".consendiv row size = 6 number of columns = 2 index size = 0 }
create table "informix".consendiv 
  (
    num_emp char(2),
    num_ent integer
  );
revoke all on "informix".consendiv from "public";

{ TABLE "informix".conssadiv row size = 6 number of columns = 2 index size = 0 }
create table "informix".conssadiv 
  (
    num_emp char(2),
    num_sal integer
  );
revoke all on "informix".conssadiv from "public";

{ TABLE "xxx".tmp_kardexneg row size = 50 number of columns = 8 index size = 
              0 }
create table "xxx".tmp_kardexneg 
  (
    fech_doc date,
    cod_art char(14),
    tip_doc char(2),
    num_doc char(10),
    can_kgs decimal(10,4),
    can_caj decimal(10,4),
    can_emp decimal(10,4),
    ren smallint
  );
revoke all on "xxx".tmp_kardexneg from "public";

{ TABLE "informix".inardevcom row size = 395 number of columns = 30 index size = 
              0 }
create table "informix".inardevcom 
  (
    num_emp char(2),
    num_suc char(2),
    num_dev integer,
    cod_pro char(8),
    raz_soc char(50),
    dom_pro char(60),
    ciu_pro char(20),
    est_pro char(10),
    imp_exe decimal(14,4),
    imp_6 decimal(14,4),
    imp_15 decimal(14,4),
    imp_20 decimal(14,4),
    des_exe decimal(10,4),
    des_6 decimal(10,4),
    des_15 decimal(10,4),
    des_20 decimal(10,4),
    iva_6 decimal(10,4),
    iva_15 decimal(10,4),
    iva_20 decimal(10,4),
    cos_vta decimal(12,4),
    flete decimal(12,4),
    iva_fle decimal(12,4),
    car_1 decimal(12,4),
    iva_1 decimal(12,4),
    car_2 decimal(12,4),
    iva_2 decimal(12,4),
    fecha date,
    reg_fed char(20),
    motivo char(80),
    cajera char(12)
  );
revoke all on "informix".inardevcom from "public";

{ TABLE "informix".inventario row size = 57 number of columns = 9 index size = 27 
              }
create table "informix".inventario 
  (
    num_emp char(2),
    num_suc char(2),
    cod_art char(14),
    fecha date,
    can_kgs decimal(12,4),
    can_caj decimal(12,4),
    can_emp decimal(12,4),
    cos_pro decimal(12,4),
    sal_val decimal(12,4)
  );
revoke all on "informix".inventario from "public";

{ TABLE "informix".tmptrcl row size = 51 number of columns = 9 index size = 23 }
create table "informix".tmptrcl 
  (
    num_emp char(2),
    num_suc char(2),
    cod_cli char(8),
    tipo char(2),
    num_docto char(10),
    importe decimal(14,4),
    sal_fac decimal(14,4),
    sal_iva decimal(12,4),
    fecha date
  );
revoke all on "informix".tmptrcl from "public";

{ TABLE "informix".copyinv_diario row size = 34 number of columns = 6 index size 
              = 0 }
create table "informix".copyinv_diario 
  (
    num_emp char(2),
    num_suc char(2),
    cod_art char(14),
    fecha date,
    can_kgs decimal(10,4),
    can_caj decimal(10,4)
  );
revoke all on "informix".copyinv_diario from "public";

{ TABLE "informix".inv_diario row size = 58 number of columns = 10 index size = 42 
              }
create table "informix".inv_diario 
  (
    num_emp char(2),
    num_suc char(2),
    cod_art char(14),
    fecha date,
    can_kgs decimal(10,4),
    can_caj decimal(10,4),
    exi_cor_kgs decimal(10,4),
    exi_cor_caj decimal(10,4),
    dif_kgs decimal(10,4),
    dif_caj decimal(10,4)
  );
revoke all on "informix".inv_diario from "public";

{ TABLE "informix".tmp_entinv row size = 67 number of columns = 8 index size = 0 
              }
create table "informix".tmp_entinv 
  (
    num_emp char(2),
    cod_art char(15),
    can_kgs decimal(14,4),
    can_caj decimal(14,4),
    imp_exe decimal(14,4),
    imp_iva decimal(14,4),
    iva_15 decimal(14,4),
    num_doc char(10)
  );
revoke all on "informix".tmp_entinv from "public";

{ TABLE "informix".tmp_salinv row size = 67 number of columns = 8 index size = 0 
              }
create table "informix".tmp_salinv 
  (
    num_emp char(2),
    cod_art char(15),
    can_kgs decimal(14,4),
    can_caj decimal(14,4),
    imp_exe decimal(14,4),
    imp_iva decimal(14,4),
    iva_15 decimal(14,4),
    num_doc char(10)
  );
revoke all on "informix".tmp_salinv from "public";

{ TABLE "informix".tmptrinv row size = 141 number of columns = 22 index size = 0 
              }
create table "informix".tmptrinv 
  (
    num_emp char(2),
    cod_art char(14),
    num_suc char(2),
    fech_doc date,
    tip_doc char(2),
    num_doc char(10),
    can_kgs decimal(10,4),
    can_caj decimal(10,4),
    cos_uni_kgs decimal(12,4),
    cos_uni_caj decimal(12,4),
    cos_pro_kgs decimal(12,4),
    cos_pro_caj decimal(12,4),
    pre_vta_kgs decimal(12,4),
    pre_vta_caj decimal(12,4),
    des_vta decimal(12,4),
    fle_art decimal(12,4),
    ren_art smallint,
    cod_pro char(8),
    cod_cli char(8),
    num_ent char(10),
    fech_ent date,
    iva_art decimal(12,4)
  );
revoke all on "informix".tmptrinv from "public";

{ TABLE "informix".respainarped row size = 74 number of columns = 16 index size = 
              0 }
create table "informix".respainarped 
  (
    num_emp char(2),
    num_suc char(2),
    num_ped integer,
    cod_pro char(8),
    num_fac integer,
    fech_ped date,
    fech_fac date,
    con_pro char(1),
    imp_exe decimal(12,4),
    imp_15 decimal(12,4),
    des_exe decimal(10,4),
    des_15 decimal(10,4),
    iva_15 decimal(10,4),
    flete decimal(10,4),
    iva_fle decimal(10,4),
    estado char(1)
  );
revoke all on "informix".respainarped from "public";

{ TABLE "informix".inarped row size = 80 number of columns = 16 index size = 0 }
create table "informix".inarped 
  (
    num_emp char(2),
    num_suc char(2),
    num_ped integer,
    cod_pro char(8),
    num_fac char(10),
    fech_ped date,
    fech_fac date,
    con_pro char(1),
    imp_exe decimal(12,4),
    imp_15 decimal(12,4),
    des_exe decimal(10,4),
    des_15 decimal(10,4),
    iva_15 decimal(10,4),
    flete decimal(10,4),
    iva_fle decimal(10,4),
    estado char(1)
  );
revoke all on "informix".inarped from "public";

{ TABLE "informix".copiainarinv row size = 349 number of columns = 50 index size 
              = 0 }
create table "informix".copiainarinv 
  (
    num_emp char(2),
    cod_art char(14),
    cod_art1 char(14),
    des_art char(40),
    uni_art char(4),
    emp_art char(4),
    can_emp decimal(10,4),
    precio_1 decimal(10,2),
    precio_2 decimal(10,2),
    precio_3 decimal(10,2),
    precio_4 decimal(10,2),
    precio_5 decimal(10,2),
    sal_val decimal(14,4),
    sal_ant decimal(14,4),
    ult_cos_kgs decimal(12,4),
    cos_pro_kgs decimal(12,4),
    cos_ant_kgs decimal(12,4),
    ven_mes_kgs decimal(14,4),
    cos_mes_kgs decimal(14,4),
    ven_acu_kgs decimal(14,4),
    cos_acu_kgs decimal(14,4),
    exi_cor_kgs decimal(10,4),
    exi_ant_kgs decimal(10,4),
    exi_fis_kgs decimal(10,4),
    can_acu_kgs decimal(12,4),
    can_mes_kgs decimal(12,4),
    ult_cos_caj decimal(12,4),
    cos_pro_caj decimal(12,4),
    cos_ant_caj decimal(12,4),
    ven_mes_caj decimal(14,4),
    cos_mes_caj decimal(14,4),
    ven_acu_caj decimal(14,4),
    cos_acu_caj decimal(14,4),
    exi_cor_caj decimal(10,4),
    exi_ant_caj decimal(10,4),
    exi_fis_caj decimal(10,4),
    can_acu_caj decimal(12,4),
    can_mes_caj decimal(12,4),
    back_cli decimal(6,4),
    back_pro decimal(6,4),
    min_emp decimal(10,4),
    max_emp decimal(10,4),
    iva decimal(4,2),
    lin_ven smallint,
    cod_pro char(8),
    tip_art char(1),
    edo_pro char(2),
    ban_rep char(1),
    min_pre decimal(10,4),
    max_pre decimal(10,4)
  );
revoke all on "informix".copiainarinv from "public";

{ TABLE "informix".cve_desblo row size = 52 number of columns = 3 index size = 0 
              }
create table "informix".cve_desblo 
  (
    cod_ag smallint,
    nombre char(40),
    clave char(10)
  );
revoke all on "informix".cve_desblo from "public";

{ TABLE "informix".desblo row size = 178 number of columns = 9 index size = 0 }
create table "informix".desblo 
  (
    num_emp char(2),
    folio integer,
    nombre char(50),
    fecha date,
    producto char(50),
    kilos decimal(10,4),
    cajas decimal(10,4),
    precio decimal(10,4),
    des_art char(50)
  );
revoke all on "informix".desblo from "public";

{ TABLE "xxx".conscheq row size = 12 number of columns = 2 index size = 0 }
create table "xxx".conscheq 
  (
    num_emp char(2),
    num_ent char(10)
  );
revoke all on "xxx".conscheq from "public";

{ TABLE "xxx".inarch_dev row size = 123 number of columns = 9 index size = 0 
              }
create table "xxx".inarch_dev 
  (
    num_emp char(2),
    num_suc char(2),
    fech_doc date,
    num_doc char(10),
    tip_doc char(2),
    imp_exe decimal(14,4),
    imp_15 decimal(14,4),
    iva_15 decimal(12,4),
    concepto char(80)
  );
revoke all on "xxx".inarch_dev from "public";

{ TABLE "informix".inv_mensual row size = 123 number of columns = 15 index size = 
              42 }
create table "informix".inv_mensual 
  (
    num_emp char(2),
    num_suc char(2),
    cod_art char(14),
    fecha date,
    can_kgs decimal(10,4),
    can_caj decimal(10,4),
    exi_cor_kgs decimal(10,4),
    exi_cor_caj decimal(10,4),
    dif_kgs decimal(10,4),
    dif_caj decimal(10,4),
    des_art char(40),
    can_kgs_fis decimal(10,4),
    can_caj_fis decimal(10,4),
    min_emp decimal(10,5),
    max_emp decimal(10,4)
  );
revoke all on "informix".inv_mensual from "public";

{ TABLE "informix".config row size = 12 number of columns = 2 index size = 0 }
create table "informix".config 
  (
    des_bonos integer,
    cam_dol float
  );
revoke all on "informix".config from "public";

{ TABLE "informix".inarpch_dev row size = 161 number of columns = 20 index size = 
              44 }
create table "informix".inarpch_dev 
  (
    num_emp char(2),
    num_suc char(2),
    tipo_pago char(2),
    num_pago integer,
    cod_cli char(8),
    raz_soc char(50),
    imp_pago decimal(12,2),
    iva_pago decimal(10,2),
    fecha date,
    forma_pago char(10),
    fech_cheq date,
    banco char(20),
    num_cheq integer,
    tip_cheq char(2),
    efectivo decimal(12,2),
    bonos decimal(12,2),
    cheque decimal(12,2),
    dolares decimal(12,2),
    che_pref decimal(12,2),
    loc_for char(1)
  );
revoke all on "informix".inarpch_dev from "public";

{ TABLE "informix".tmp_locpag row size = 60 number of columns = 11 index size = 0 
              }
create table "informix".tmp_locpag 
  (
    num_emp char(2),
    num_suc char(2),
    tip_car char(2),
    num_car char(10),
    num_cre integer,
    tip_cre char(2),
    cod_cli char(8),
    importe decimal(14,4),
    iva decimal(14,4),
    fecha date,
    for_pag char(10)
  );
revoke all on "informix".tmp_locpag from "public";

{ TABLE "informix".unicas row size = 52 number of columns = 3 index size = 0 }
create table "informix".unicas 
  (
    codigo smallint,
    nombre char(40),
    clave char(10)
  );
revoke all on "informix".unicas from "public";

{ TABLE "informix".tempdevco row size = 103 number of columns = 16 index size = 0 
              }
create table "informix".tempdevco 
  (
    num_emp char(2),
    cajas decimal(10,4),
    kilos decimal(10,4),
    no_dev decimal(12,2),
    no_fac decimal(12,2),
    codigo char(15),
    pre_vta_kgs decimal(10,4),
    subtot decimal(10,4),
    iva decimal(10,4),
    cos_pro_kgs decimal(10,4),
    cos_pro_caj decimal(10,4),
    desgrav decimal(10,4),
    desexce decimal(10,4),
    pre_vta_caj decimal(10,4),
    flete decimal(10,4),
    renglon decimal(10,4)
  );
revoke all on "informix".tempdevco from "public";

{ TABLE "informix".vips row size = 93 number of columns = 5 index size = 0 }
create table "informix".vips 
  (
    codigo char(30),
    descripcion char(30),
    precio_vta decimal(20,2),
    can_kgs decimal(20,2),
    can_cajas decimal(20,2)
  );
revoke all on "informix".vips from "public";

{ TABLE "informix".cotiza row size = 78 number of columns = 7 index size = 0 }
create table "informix".cotiza 
  (
    num_emp char(2),
    cod_cli char(8),
    cod_art char(14),
    des_art char(40),
    precio decimal(10,2),
    fecha_ini date,
    fecha_fin date
  );
revoke all on "informix".cotiza from "public";

{ TABLE "informix".salike row size = 70 number of columns = 10 index size = 0 }
create table "informix".salike 
  (
    cod_art char(20),
    kilos decimal(10,4),
    cajas decimal(10,4),
    num_ent char(10),
    renglon integer,
    fecha date,
    cos_pro_kg decimal(10,4),
    cos_pro_caj decimal(10,4),
    tipo char(2),
    precio decimal(10,4)
  );
revoke all on "informix".salike from "public";

{ TABLE "xxx".poliza_cab row size = 107 number of columns = 7 index size = 0 
              }
create table "xxx".poliza_cab 
  (
    num_emp char(2),
    fecha date,
    num_pol integer,
    tip_pol char(1),
    concepto char(80),
    cargos decimal(14,2),
    abonos decimal(14,2)
  );
revoke all on "xxx".poliza_cab from "public";

{ TABLE "xxx".poliza row size = 71 number of columns = 8 index size = 0 }
create table "xxx".poliza 
  (
    num_emp char(2),
    fecha date,
    num_pol integer,
    tip_pol char(1),
    car_abo char(1),
    num_cta char(12),
    nom_cta char(40),
    importe decimal(12,2)
  );
revoke all on "xxx".poliza from "public";

{ TABLE "xxx".catalogo_poliza row size = 57 number of columns = 6 index size 
              = 0 }
create table "xxx".catalogo_poliza 
  (
    num_emp char(2),
    num_cta char(12),
    nom_cta char(40),
    tip_rel char(1),
    car_abo char(1),
    tip_pol char(1)
  );
revoke all on "xxx".catalogo_poliza from "public";

{ TABLE "informix".optimo row size = 90 number of columns = 3 index size = 36 }
create table "informix".optimo 
  (
    codigo varchar(30),
    descripcion varchar(50),
    cantidad float
  );
revoke all on "informix".optimo from "public";

{ TABLE "informix".diferencia row size = 86 number of columns = 7 index size = 0 
              }
create table "informix".diferencia 
  (
    codigo char(10),
    fecha date,
    descri char(40),
    exis float,
    opti float,
    dife float,
    sobre float
  );
revoke all on "informix".diferencia from "public";

{ TABLE "xxx".consent row size = 16 number of columns = 3 index size = 0 }
create table "xxx".consent 
  (
    num_emp char(2),
    num_ent char(10),
    tipo integer
  );
revoke all on "xxx".consent from "public";

{ TABLE "informix".tipo row size = 34 number of columns = 2 index size = 0 }
create table "informix".tipo 
  (
    tipo char(30),
    cata integer
  );
revoke all on "informix".tipo from "public";

{ TABLE "informix".pago_parcial row size = 194 number of columns = 12 index size 
              = 0 }
create table "informix".pago_parcial 
  (
    tipo char(20),
    descripcion char(80),
    precio float,
    pago_mes float,
    no_mes float,
    fecha date,
    frecuencia char(10),
    fech_primer date,
    vendedor char(40),
    quedan integer,
    conse integer,
    verifica integer
  );
revoke all on "informix".pago_parcial from "public";

{ TABLE "informix".conse_pagos row size = 4 number of columns = 1 index size = 0 
              }
create table "informix".conse_pagos 
  (
    conse integer
  );
revoke all on "informix".conse_pagos from "public";

{ TABLE "informix".histo_pagos row size = 12 number of columns = 3 index size = 0 
              }
create table "informix".histo_pagos 
  (
    conse integer,
    fecha date,
    num_cheque integer
  );
revoke all on "informix".histo_pagos from "public";

{ TABLE "informix".alta_codigo row size = 44 number of columns = 4 index size = 0 
              }
create table "informix".alta_codigo 
  (
    tipo char(10),
    nombre char(20),
    codigo char(10),
    fecha date
  );
revoke all on "informix".alta_codigo from "public";

{ TABLE "informix".revisa_pago row size = 4 number of columns = 1 index size = 0 
              }
create table "informix".revisa_pago 
  (
    bande integer
  );
revoke all on "informix".revisa_pago from "public";

{ TABLE "informix".sucunew row size = 28 number of columns = 2 index size = 0 }
create table "informix".sucunew 
  (
    grupo char(8),
    sucursal char(20)
  );
revoke all on "informix".sucunew from "public";

{ TABLE "informix".inarconfor row size = 8 number of columns = 2 index size = 0 }
create table "informix".inarconfor 
  (
    num_emp char(4),
    tipo integer
  );
revoke all on "informix".inarconfor from "public";

{ TABLE "informix".inarpapro row size = 44 number of columns = 2 index size = 0 }
create table "informix".inarpapro 
  (
    num_emp char(40),
    tipo integer
  );
revoke all on "informix".inarpapro from "public";

{ TABLE "informix".inarvpf row size = 162 number of columns = 13 index size = 0 }
create table "informix".inarvpf 
  (
    num_emp char(2),
    cod_art char(14),
    des_art char(40),
    kilos decimal(10,4),
    cajas decimal(10,4),
    precio decimal(10,4),
    total decimal(10,4),
    fecha date,
    tipo char(10),
    iva decimal(10,4),
    lin_ven char(2),
    num_doc char(20),
    cajera char(40)
  );
revoke all on "informix".inarvpf from "public";

{ TABLE "informix".log_abonos row size = 75 number of columns = 8 index size = 0 
              }
create table "informix".log_abonos 
  (
    num_fac char(10),
    importe decimal(12,2),
    cod_cli char(6),
    cajera char(20),
    forma_pago char(20),
    tipo integer,
    fecha_fac date,
    fecha_dia date
  );
revoke all on "informix".log_abonos from "public";

{ TABLE "informix".abonos row size = 166 number of columns = 11 index size = 0 }
create table "informix".abonos 
  (
    num_fac char(10),
    importe decimal(12,2),
    cod_cli char(6),
    cajera char(20),
    forma_pago char(20),
    tipo integer,
    fecha_fac date,
    fecha_dia date,
    abono_actual integer,
    observa char(80),
    importe_real decimal(12,2)
  );
revoke all on "informix".abonos from "public";

{ TABLE "informix".abo_blo row size = 26 number of columns = 3 index size = 0 }
create table "informix".abo_blo 
  (
    num_emp char(2),
    tipo integer,
    cajera char(20)
  );
revoke all on "informix".abo_blo from "public";

{ TABLE "informix".tmp_uti_cli row size = 89 number of columns = 13 index size = 
              0 }
create table "informix".tmp_uti_cli 
  (
    num_emp char(2),
    cod_art char(14),
    tip_doc char(2),
    cod_cli char(8),
    can_kgs decimal(12,4),
    can_caj decimal(12,4),
    cos_pro_kgs decimal(12,4),
    cos_pro_caj decimal(12,4),
    pre_vta_kgs decimal(12,4),
    pre_vta_caj decimal(12,4),
    tot_pre_kgs decimal(12,4),
    tot_pre_caj decimal(12,4),
    uti_total decimal(12,4)
  );
revoke all on "informix".tmp_uti_cli from "public";

{ TABLE "informix".tmp_canempvpf row size = 63 number of columns = 3 index size = 
              0 }
create table "informix".tmp_canempvpf 
  (
    cod_art char(15),
    des_art char(40),
    can_emp decimal(14,4)
  );
revoke all on "informix".tmp_canempvpf from "public";

{ TABLE "xxx".ctes_dom row size = 80 number of columns = 2 index size = 0 }
create table "xxx".ctes_dom 
  (
    cod_cli char(40),
    descripcion char(40)
  );
revoke all on "xxx".ctes_dom from "public";

{ TABLE "informix".tmpvtadia row size = 70 number of columns = 7 index size = 0 }
create table "informix".tmpvtadia 
  (
    cod_art char(10),
    des_art char(40),
    tip_art char(2),
    fech_doc date,
    tip_doc char(2),
    can_kgs decimal(10,4),
    can_caj decimal(10,4)
  );
revoke all on "informix".tmpvtadia from "public";

{ TABLE "informix".tmp_codigos row size = 20 number of columns = 1 index size = 0 
              }
create table "informix".tmp_codigos 
  (
    cod_art char(20)
  );
revoke all on "informix".tmp_codigos from "public";

{ TABLE "informix".inarhora row size = 60 number of columns = 2 index size = 0 }
create table "informix".inarhora 
  (
    num_doc char(30),
    hora char(30)
  );
revoke all on "informix".inarhora from "public";

{ TABLE "informix".confacele row size = 40 number of columns = 1 index size = 0 }
create table "informix".confacele 
  (
    num_doc char(40)
  );
revoke all on "informix".confacele from "public";

{ TABLE "informix".factu_cance row size = 78 number of columns = 6 index size = 0 
              }
create table "informix".factu_cance 
  (
    num_doc char(15),
    rfc char(30),
    cod_cli char(10),
    total decimal(14,4),
    iva decimal(14,4),
    fech_can datetime year to minute
  );
revoke all on "informix".factu_cance from "public";

{ TABLE "informix".temp_facan row size = 27 number of columns = 3 index size = 0 
              }
create table "informix".temp_facan 
  (
    horario datetime year to minute,
    num_fac char(10),
    tip_doc char(10)
  );
revoke all on "informix".temp_facan from "public";

{ TABLE "informix".relcance row size = 82 number of columns = 6 index size = 0 }
create table "informix".relcance 
  (
    num_doc char(10),
    rfc char(30),
    aproba integer,
    fecha datetime year to minute,
    tipo char(1),
    tipo_doc char(30)
  );
revoke all on "informix".relcance from "public";

{ TABLE "informix".folios row size = 56 number of columns = 6 index size = 0 }
create table "informix".folios 
  (
    serie char(15),
    folio_final integer,
    ano_aproba integer,
    num_aproba integer,
    cajera char(25),
    folio_inicio integer
  );
revoke all on "informix".folios from "public";

{ TABLE "informix".deta_cte row size = 465 number of columns = 12 index size = 0 
              }
create table "informix".deta_cte 
  (
    num_emp char(10),
    cod_cli char(40),
    calle char(50),
    num_int char(20),
    num_ext char(40),
    colonia char(40),
    email char(50),
    municipio char(50),
    pais char(20),
    email2 char(50),
    email3 char(50),
    regimen char(45)
  );
revoke all on "informix".deta_cte from "public";

{ TABLE "informix".inarcl99 row size = 20 number of columns = 1 index size = 0 }
create table "informix".inarcl99 
  (
    cod_cli char(20)
  );
revoke all on "informix".inarcl99 from "public";

{ TABLE "informix".copiascli row size = 20 number of columns = 1 index size = 0 }
create table "informix".copiascli 
  (
    cod_cli char(20)
  );
revoke all on "informix".copiascli from "public";

{ TABLE "informix".motivo row size = 60 number of columns = 4 index size = 0 }
create table "informix".motivo 
  (
    no_pago char(10),
    motivo char(40),
    imprime integer,
    num_emp char(6)
  );
revoke all on "informix".motivo from "public";

{ TABLE "informix".con_correo row size = 84 number of columns = 3 index size = 0 
              }
create table "informix".con_correo 
  (
    host char(40),
    correo char(40),
    puerto integer
  );
revoke all on "informix".con_correo from "public";

{ TABLE "informix".inarinv2 row size = 161 number of columns = 11 index size = 0 
              }
create table "informix".inarinv2 
  (
    cod_art char(15),
    des_art char(40),
    exi_cor_kgs float,
    exi_cor_caj float,
    exi_fis_kgs float,
    exi_fis_caj float,
    tip_doc char(4),
    observacion char(50),
    fecha date,
    dif_kgs float,
    dif_caj float
  );
revoke all on "informix".inarinv2 from "public";

{ TABLE "informix".inartrinv2 row size = 189 number of columns = 9 index size = 0 
              }
create table "informix".inartrinv2 
  (
    num_doc char(10),
    cod_art char(15),
    tip_doc char(4),
    can_kgs float,
    can_caj float,
    fecha date,
    observacion char(100),
    bande char(20),
    bandera char(20)
  );
revoke all on "informix".inartrinv2 from "public";

{ TABLE "informix".tmp_entra row size = 105 number of columns = 10 index size = 0 
              }
create table "informix".tmp_entra 
  (
    num_emp char(2),
    cod_art char(14),
    cajas decimal(14,4),
    kilos decimal(14,4),
    total_caj decimal(14,4),
    total_kgs decimal(14,4),
    cos_pro_caj decimal(14,4),
    cos_pro_kgs decimal(14,4),
    tipo char(1),
    des_art char(40)
  );
revoke all on "informix".tmp_entra from "public";

{ TABLE "informix".tmp_sale row size = 121 number of columns = 12 index size = 0 
              }
create table "informix".tmp_sale 
  (
    num_emp char(2),
    cod_art char(14),
    cajas decimal(14,4),
    kilos decimal(14,4),
    total_caj decimal(14,4),
    total_kgs decimal(14,4),
    cos_pro_caj decimal(14,4),
    cos_pro_kgs decimal(14,4),
    tipo char(1),
    exi_cor_kgs decimal(14,4),
    exi_cor_caj decimal(14,4),
    des_art char(40)
  );
revoke all on "informix".tmp_sale from "public";

{ TABLE "informix".consinv2 row size = 20 number of columns = 2 index size = 0 }
create table "informix".consinv2 
  (
    num_doc char(10) not null ,
    tip_doc char(10)
  );
revoke all on "informix".consinv2 from "public";

{ TABLE "informix".abonos_new row size = 242 number of columns = 15 index size = 
              0 }
create table "informix".abonos_new 
  (
    num_fac char(10),
    importe decimal(12,2),
    cod_cli char(8),
    cajera char(20),
    forma_pago char(20),
    tipo integer,
    fecha_fac date,
    fecha_dia date,
    abono_actual integer,
    observa char(80),
    importe_real decimal(12,2),
    banco char(30),
    no_cheque char(30),
    importe_iva decimal(12,2),
    importe_ieps decimal(12,2)
  );
revoke all on "informix".abonos_new from "public";

{ TABLE "informix".revisa_abono row size = 24 number of columns = 2 index size = 
              0 }
create table "informix".revisa_abono 
  (
    cajera char(20),
    bande integer
  );
revoke all on "informix".revisa_abono from "public";

{ TABLE "informix".neze_cabe row size = 81 number of columns = 10 index size = 0 
              }
create table "informix".neze_cabe 
  (
    num_emp char(2),
    num_ent char(15),
    cod_pro char(15),
    num_fac char(15),
    imp_exe decimal(10,2),
    imp_15 decimal(10,2),
    des_exe decimal(10,2),
    iva_15 decimal(10,2),
    fle_ent decimal(10,2),
    fecha date
  );
revoke all on "informix".neze_cabe from "public";

{ TABLE "informix".neze_porce row size = 23 number of columns = 3 index size = 0 
              }
create table "informix".neze_porce 
  (
    num_emp char(2),
    cod_art char(15),
    porcentaje decimal(10,2)
  );
revoke all on "informix".neze_porce from "public";

{ TABLE "informix".neze_deta row size = 111 number of columns = 15 index size = 0 
              }
create table "informix".neze_deta 
  (
    num_emp char(2),
    cod_art char(15),
    fecha date,
    num_doc char(20),
    can_kgs decimal(10,2),
    can_caj decimal(10,2),
    cos_uni_kgs decimal(10,2),
    cos_uni_caj decimal(10,2),
    cos_pro_kgs decimal(10,2),
    cos_pro_caj decimal(10,2),
    cod_pro char(20),
    num_ent integer,
    iva_art decimal(10,2),
    impreso char(2),
    tipo char(2)
  );
revoke all on "informix".neze_deta from "public";

{ TABLE "informix".sat row size = 120 number of columns = 3 index size = 0 }
create table "informix".sat 
  (
    cer char(40),
    key char(40),
    pass char(40)
  );
revoke all on "informix".sat from "public";

{ TABLE "informix".rela_sal row size = 20 number of columns = 3 index size = 0 }
create table "informix".rela_sal 
  (
    num_doc char(10),
    tipo char(2),
    tipo_sal char(8)
  );
revoke all on "informix".rela_sal from "public";

{ TABLE "informix".tipo_pago row size = 40 number of columns = 1 index size = 0 }
create table "informix".tipo_pago 
  (
    tipo_pago char(40) not null 
  );
revoke all on "informix".tipo_pago from "public";

{ TABLE "informix".rel_tipo_pago row size = 104 number of columns = 4 index size 
              = 0 }
create table "informix".rel_tipo_pago 
  (
    cod_cli char(40),
    tipo_pago char(40),
    banco char(20),
    num_cta char(4)
  );
revoke all on "informix".rel_tipo_pago from "public";

{ TABLE "informix".tmp_errorneze row size = 38 number of columns = 5 index size = 
              0 }
create table "informix".tmp_errorneze 
  (
    cod_art char(10),
    can_kgs decimal(12,4),
    can_caj decimal(12,4),
    cos_uni_kgs decimal(12,4),
    cos_uni_caj decimal(12,4)
  );
revoke all on "informix".tmp_errorneze from "public";

{ TABLE "informix".compras row size = 171 number of columns = 6 index size = 0 }
create table "informix".compras 
  (
    des_prod char(40),
    prov char(40),
    precio decimal(12,4) not null ,
    fecha date,
    hora char(40),
    cantidad char(40)
  );
revoke all on "informix".compras from "public";

{ TABLE "informix".respa_docu row size = 27 number of columns = 6 index size = 25 
              }
create table "informix".respa_docu 
  (
    num_emp char(2),
    num_suc char(2),
    tipo char(2),
    numero char(10),
    importe decimal(12,2),
    fecha date
  );
revoke all on "informix".respa_docu from "public";

{ TABLE "informix".db row size = 31 number of columns = 7 index size = 0 }
create table "informix".db 
  (
    num_emp char(2),
    num_suc char(2),
    tipo char(2),
    numero char(10),
    importe decimal(12,2),
    fecha date,
    fecha2 date
  );
revoke all on "informix".db from "public";

{ TABLE "informix".documento row size = 38 number of columns = 6 index size = 35 
              }
create table "informix".documento 
  (
    num_emp char(2),
    num_suc char(2),
    tipo char(2),
    numero char(20),
    importe decimal(14,4),
    fecha date
  );
revoke all on "informix".documento from "public";

{ TABLE "informix".temporcom row size = 113 number of columns = 15 index size = 0 
              }
create table "informix".temporcom 
  (
    no_ent char(10),
    no_orden integer,
    codigo char(20),
    fecha date,
    kilos decimal(10,4),
    cajas decimal(10,4),
    precio_kgs decimal(12,4),
    precio_caj decimal(12,4),
    bande integer,
    total decimal(12,2),
    iva float,
    porcentaje decimal(10,4),
    renglon char(10),
    cos_pro_kgs decimal(12,4),
    ieps decimal(12,2)
  );
revoke all on "informix".temporcom from "public";

{ TABLE "informix".tmp_pago row size = 290 number of columns = 18 index size = 0 
              }
create table "informix".tmp_pago 
  (
    num_doc char(40),
    cod_cli char(80),
    total_pago decimal(12,2),
    iva decimal(12,2),
    fecha date,
    formapago char(2),
    banco char(30),
    no_cheque decimal(12,2),
    tipo_cheque char(2),
    efectivo decimal(12,2),
    bonos decimal(12,2),
    cheque decimal(12,2),
    dolar decimal(12,2),
    cheq_pref decimal(12,2),
    tipo_cli char(12),
    cajera char(20),
    bandera integer,
    num_pago char(40)
  );
revoke all on "informix".tmp_pago from "public";

{ TABLE "informix".tmp_vpf row size = 127 number of columns = 12 index size = 0 }
create table "informix".tmp_vpf 
  (
    num_emp char(2),
    cod_art char(14),
    des_art char(40),
    kilos decimal(12,2),
    cajas decimal(12,2),
    precio decimal(12,2),
    total decimal(12,2),
    fecha date,
    tipo char(10),
    iva decimal(12,2),
    lin_ven char(2),
    num_doc char(20)
  );
revoke all on "informix".tmp_vpf from "public";

{ TABLE "informix".cod_sori row size = 44 number of columns = 2 index size = 0 }
create table "informix".cod_sori 
  (
    soriana integer,
    colesa char(40)
  );
revoke all on "informix".cod_sori from "public";

{ TABLE "informix".temp_impre row size = 84 number of columns = 3 index size = 0 
              }
create table "informix".temp_impre 
  (
    bande integer,
    factura char(40),
    cajera char(40)
  );
revoke all on "informix".temp_impre from "public";

{ TABLE "informix".ieps row size = 40 number of columns = 1 index size = 0 }
create table "informix".ieps 
  (
    codigo char(40)
  );
revoke all on "informix".ieps from "public";

{ TABLE "informix".deta_ieps row size = 66 number of columns = 10 index size = 0 
              }
create table "informix".deta_ieps 
  (
    num_emp char(2),
    num_suc char(2),
    num_doc char(10),
    cod_art char(8),
    ieps decimal(14,4),
    debe decimal(14,4),
    fecha date,
    tip_doc char(4),
    cod_cli char(10),
    cod_pro char(10)
  );
revoke all on "informix".deta_ieps from "public";

{ TABLE "informix".tran_prov row size = 274 number of columns = 20 index size = 0 
              }
create table "informix".tran_prov 
  (
    num_emp char(2),
    num_suc char(2),
    no_pedido char(10),
    cod_pro char(8),
    telefono char(12),
    nombre char(50),
    direccion char(60),
    ciudad char(20),
    cod_art char(14),
    descripcion char(40),
    cajas decimal(10,4),
    kilos decimal(10,4),
    precio decimal(10,4),
    total decimal(10,4),
    renglon integer,
    cancelado integer,
    imp_exe decimal(10,4),
    iva decimal(10,4),
    costo_pro decimal(10,4),
    ieps decimal(10,4)
  );
revoke all on "informix".tran_prov from "public";

{ TABLE "informix".tmp_cli row size = 90 number of columns = 2 index size = 0 }
create table "informix".tmp_cli 
  (
    cod_cli char(30),
    nombre char(60)
  );
revoke all on "informix".tmp_cli from "public";

{ TABLE "informix".temp_pref row size = 258 number of columns = 14 index size = 0 
              }
create table "informix".temp_pref 
  (
    num_fac varchar(30),
    importe float,
    cod_cli varchar(30),
    cajera varchar(30),
    forma_pago varchar(20),
    tipo varchar(20),
    fecha_fac date,
    fecha_dia date,
    abono_actual float,
    observa varchar(30),
    importe_real float,
    banco varchar(30),
    no_cheque varchar(20),
    importe_iva float
  );
revoke all on "informix".temp_pref from "public";

{ TABLE "informix".revi_rfc row size = 64 number of columns = 4 index size = 0 }
create table "informix".revi_rfc 
  (
    cod_cli char(20),
    rfc char(20),
    cajera char(20),
    fecha date
  );
revoke all on "informix".revi_rfc from "public";

{ TABLE "informix".neze_por row size = 48 number of columns = 2 index size = 0 }
create table "informix".neze_por 
  (
    cod_art char(40),
    descto decimal(14,4)
  );
revoke all on "informix".neze_por from "public";

{ TABLE "informix".tmp_vtasacum row size = 214 number of columns = 5 index size = 
              0 }
create table "informix".tmp_vtasacum 
  (
    cod_art char(40),
    des_art char(120),
    can_kgs decimal(12,4),
    can_caj decimal(12,4),
    mes char(40)
  );
revoke all on "informix".tmp_vtasacum from "public";

{ TABLE "informix".repsemana row size = 80 number of columns = 5 index size = 0 }
create table "informix".repsemana 
  (
    codigo char(10),
    kilos decimal(14,4),
    cajas decimal(14,4),
    semana integer,
    des_art char(50)
  );
revoke all on "informix".repsemana from "public";

{ TABLE "informix".contra row size = 78 number of columns = 5 index size = 0 }
create table "informix".contra 
  (
    factura char(40),
    fecha date,
    importe decimal(12,4),
    saldo decimal(12,4),
    conse char(20)
  );
revoke all on "informix".contra from "public";

{ TABLE "informix".cod_menudeo row size = 229 number of columns = 4 index size = 
              0 }
create table "informix".cod_menudeo 
  (
    cod_art char(20),
    des_art char(200),
    precio decimal(12,4),
    num_emp char(2)
  );
revoke all on "informix".cod_menudeo from "public";

{ TABLE "informix".recontra row size = 219 number of columns = 5 index size = 0 }
create table "informix".recontra 
  (
    des_art char(200),
    precio decimal(12,4),
    reng integer,
    colu integer,
    pagina integer
  );
revoke all on "informix".recontra from "public";

{ TABLE "informix".caja_menudeo row size = 229 number of columns = 4 index size = 
              0 }
create table "informix".caja_menudeo 
  (
    cod_art char(20),
    des_art char(200),
    precio decimal(12,2),
    num_emp char(2)
  );
revoke all on "informix".caja_menudeo from "public";

{ TABLE "informix".revi_inve row size = 8 number of columns = 2 index size = 0 }
create table "informix".revi_inve 
  (
    fecha date,
    tipo integer
  );
revoke all on "informix".revi_inve from "public";

{ TABLE "informix".plazo_venc row size = 133 number of columns = 9 index size = 0 
              }
create table "informix".plazo_venc 
  (
    num_fac char(20),
    num_pago char(20),
    cod_cli char(20),
    importe decimal(12,2),
    fecha_fact date,
    fecha_pago date,
    plazo integer,
    dias_ven integer,
    nombre char(50)
  );
revoke all on "informix".plazo_venc from "public";

{ TABLE "informix".difeinve row size = 60 number of columns = 4 index size = 0 }
create table "informix".difeinve 
  (
    num_emp char(4),
    cod_art char(40),
    kgs decimal(14,4),
    cajas decimal(14,4)
  );
revoke all on "informix".difeinve from "public";

{ TABLE "informix".torrey row size = 74 number of columns = 3 index size = 0 }
create table "informix".torrey 
  (
    codigo integer not null ,
    cod_art char(20) not null ,
    des_art char(50)
  );
revoke all on "informix".torrey from "public";

{ TABLE "informix".uuid row size = 110 number of columns = 2 index size = 0 }
create table "informix".uuid 
  (
    num_doc char(10) not null ,
    uuid char(100) not null 
  );
revoke all on "informix".uuid from "public";

{ TABLE "informix".usocfdi row size = 103 number of columns = 2 index size = 0 }
create table "informix".usocfdi 
  (
    codigo char(3),
    descrip char(100)
  );
revoke all on "informix".usocfdi from "public";

{ TABLE "informix".uso_ctes_cfdi row size = 135 number of columns = 3 index size 
              = 0 }
create table "informix".uso_ctes_cfdi 
  (
    cod_cli char(30) not null ,
    uso char(5),
    uso_cfdi char(100)
  );
revoke all on "informix".uso_ctes_cfdi from "public";

{ TABLE "informix".ieps_inarcot1 row size = 41 number of columns = 4 index size = 
              0 }
create table "informix".ieps_inarcot1 
  (
    num_doc char(20) not null ,
    cod_art char(10),
    ieps decimal(12,4),
    renglon integer
  );
revoke all on "informix".ieps_inarcot1 from "public";

{ TABLE "informix".ieps_vtas row size = 51 number of columns = 4 index size = 0 }
create table "informix".ieps_vtas 
  (
    folio char(20),
    codigo char(20),
    totieps decimal(12,4),
    renglon integer
  );
revoke all on "informix".ieps_vtas from "public";

{ TABLE "informix".tmpsatpa row size = 71 number of columns = 9 index size = 0 }
create table "informix".tmpsatpa 
  (
    importe decimal(12,2) not null ,
    sal_fac decimal(12,2) not null ,
    sal_iva decimal(12,2) not null ,
    no_doc char(20),
    total_fac decimal(12,2),
    total_iva decimal(12,2),
    tipo char(2),
    total_ieps decimal(12,2),
    sal_ieps decimal(12,2)
  );
revoke all on "informix".tmpsatpa from "public";

{ TABLE "informix".tmp_pago_sat row size = 35 number of columns = 5 index size = 
              0 }
create table "informix".tmp_pago_sat 
  (
    num_doc char(10),
    conta_pago integer,
    total decimal(12,2),
    abono decimal(12,2),
    saldo decimal(12,2)
  );
revoke all on "informix".tmp_pago_sat from "public";

{ TABLE "informix".cod_sat row size = 90 number of columns = 3 index size = 0 }
create table "informix".cod_sat 
  (
    cod_colesa char(20) not null ,
    cod_sat char(20),
    desc_sat char(50)
  );
revoke all on "informix".cod_sat from "public";

{ TABLE "informix".tmp_tarjeta row size = 36 number of columns = 4 index size = 0 
              }
create table "informix".tmp_tarjeta 
  (
    no_doc char(20),
    tdebito decimal(12,4),
    tcredito decimal(12,4),
    num_emp char(2)
  );
revoke all on "informix".tmp_tarjeta from "public";

{ TABLE "informix".ieps_dev row size = 51 number of columns = 4 index size = 0 }
create table "informix".ieps_dev 
  (
    num_dev char(20),
    codigo char(20),
    totieps decimal(12,4),
    renglon integer
  );
revoke all on "informix".ieps_dev from "public";

{ TABLE "informix".iepstrcl row size = 46 number of columns = 4 index size = 0 }
create table "informix".iepstrcl 
  (
    num_emp char(2),
    num_doc char(30),
    ieps decimal(12,2),
    sal_ieps decimal(12,2)
  );
revoke all on "informix".iepstrcl from "public";

{ TABLE "informix".ieps_pcl row size = 39 number of columns = 4 index size = 0 }
create table "informix".ieps_pcl 
  (
    num_emp char(2),
    cod_cli char(10),
    no_pago char(20),
    ieps_pago decimal(12,2)
  );
revoke all on "informix".ieps_pcl from "public";

{ TABLE "informix".iepstrcl1 row size = 110 number of columns = 9 index size = 0 
              }
create table "informix".iepstrcl1 
  (
    num_emp char(2),
    num_doc char(20),
    num_pago char(20),
    cod_cli char(10),
    tipo char(20),
    importe decimal(12,2),
    imp_ieps decimal(12,2),
    fecha date,
    forma_pago char(20)
  );
revoke all on "informix".iepstrcl1 from "public";

{ TABLE "informix".ieps_pchdev row size = 59 number of columns = 4 index size = 0 
              }
create table "informix".ieps_pchdev 
  (
    num_emp char(2),
    cod_cli char(20),
    no_pago char(30),
    pago_ieps decimal(12,2)
  );
revoke all on "informix".ieps_pchdev from "public";

{ TABLE "informix".inartrinv row size = 135 number of columns = 22 index size = 134 
              }
create table "informix".inartrinv 
  (
    num_emp char(2),
    cod_art char(14),
    num_suc char(2),
    fech_doc date,
    tip_doc char(2),
    num_doc char(10),
    can_kgs decimal(10,4),
    can_caj decimal(10,4),
    cos_uni_kgs decimal(12,4),
    cos_uni_caj decimal(12,4),
    cos_pro_kgs decimal(12,4),
    cos_pro_caj decimal(12,4),
    pre_vta_kgs decimal(12,4),
    pre_vta_caj decimal(12,4),
    des_vta decimal(12,4),
    fle_art decimal(12,4),
    ren_art smallint,
    cod_pro char(8),
    cod_cli char(8),
    num_ent integer,
    fech_ent date,
    iva_art decimal(12,4)
  );
revoke all on "informix".inartrinv from "public";

{ TABLE "informix".ieps_ppr row size = 39 number of columns = 4 index size = 0 }
create table "informix".ieps_ppr 
  (
    num_emp char(2),
    cod_pro char(10),
    no_pago char(20),
    ieps_pago decimal(12,2)
  );
revoke all on "informix".ieps_ppr from "public";

{ TABLE "informix".iepstrpr row size = 46 number of columns = 4 index size = 0 }
create table "informix".iepstrpr 
  (
    num_emp char(2),
    num_ent char(30),
    ieps decimal(12,2),
    sal_ieps decimal(12,2)
  );
revoke all on "informix".iepstrpr from "public";

{ TABLE "informix".iepstrpr1 row size = 110 number of columns = 9 index size = 0 
              }
create table "informix".iepstrpr1 
  (
    num_emp char(2),
    num_ent char(20),
    num_pago char(20),
    cod_pro char(10),
    tipo char(20),
    importe decimal(12,2),
    imp_ieps decimal(12,2),
    fecha date,
    forma_pago char(20)
  );
revoke all on "informix".iepstrpr1 from "public";

{ TABLE "informix".pago_sat row size = 126 number of columns = 17 index size = 0 
              }
create table "informix".pago_sat 
  (
    no_doc char(10) not null ,
    cod_cli char(10) not null ,
    conse integer,
    cant_pago decimal(12,2),
    sal_fac decimal(12,2) not null ,
    sal_iva decimal(12,2) not null ,
    sal_ieps decimal(12,2),
    importe decimal(12,2),
    fecha date not null ,
    no_pago char(20),
    total_pago decimal(12,2),
    tipo_pago char(2),
    bande integer,
    no_fac_pago char(20),
    no_emp char(2),
    correo char(1),
    iva decimal(12,2)
  );
revoke all on "informix".pago_sat from "public";

{ TABLE "informix".sat_bancos row size = 105 number of columns = 3 index size = 0 
              }
create table "informix".sat_bancos 
  (
    cod_cli char(15) not null ,
    nom_banco char(40) not null ,
    cuenta char(50) not null 
  );
revoke all on "informix".sat_bancos from "public";

{ TABLE "informix".cod_rest_may row size = 90 number of columns = 2 index size = 
              0 }
create table "informix".cod_rest_may 
  (
    cod_cli char(10) not null ,
    raz_soc char(80)
  );
revoke all on "informix".cod_rest_may from "public";

{ TABLE "informix".uuidno row size = 82 number of columns = 5 index size = 0 }
create table "informix".uuidno 
  (
    num_doc char(20) not null ,
    fecha date,
    total decimal(14,4),
    rfc char(30),
    cod_cli char(20)
  );
revoke all on "informix".uuidno from "public";

{ TABLE "informix".mayoreo row size = 78 number of columns = 3 index size = 0 }
create table "informix".mayoreo 
  (
    cod_art char(20),
    precio decimal(14,4) not null ,
    des_art char(50)
  );
revoke all on "informix".mayoreo from "public";

{ TABLE "informix".menudeo row size = 68 number of columns = 3 index size = 0 }
create table "informix".menudeo 
  (
    cod_art char(10) not null ,
    precio decimal(14,4) not null ,
    des_art char(50) not null 
  );
revoke all on "informix".menudeo from "public";

{ TABLE "informix".cod_rest_men row size = 90 number of columns = 2 index size = 
              0 }
create table "informix".cod_rest_men 
  (
    cod_cli char(10) not null ,
    raz_soc char(80) not null 
  );
revoke all on "informix".cod_rest_men from "public";

{ TABLE "informix".timbrar row size = 28 number of columns = 3 index size = 0 }
create table "informix".timbrar 
  (
    num_emp char(5),
    num_doc char(20) not null ,
    tipo char(3)
  );
revoke all on "informix".timbrar from "public";

{ TABLE "informix".solo_sat row size = 70 number of columns = 2 index size = 0 }
create table "informix".solo_sat 
  (
    cod_sat char(20) not null ,
    des_sat char(50) not null 
  );
revoke all on "informix".solo_sat from "public";

{ TABLE "informix".ieps_vtapro row size = 53 number of columns = 5 index size = 0 
              }
create table "informix".ieps_vtapro 
  (
    num_emp char(2) not null ,
    folio char(20) not null ,
    codigo char(20),
    totieps decimal(12,4) not null ,
    renglon integer
  );
revoke all on "informix".ieps_vtapro from "public";

{ TABLE "informix".no_esta_sat row size = 44 number of columns = 3 index size = 0 
              }
create table "informix".no_esta_sat 
  (
    num_doc char(20),
    cod_cli char(20),
    fecha date
  );
revoke all on "informix".no_esta_sat from "public";

{ TABLE "informix".no_esta_col row size = 20 number of columns = 1 index size = 0 
              }
create table "informix".no_esta_col 
  (
    num_doc char(20) not null 
  );
revoke all on "informix".no_esta_col from "public";

{ TABLE "informix".no_esta_uuid row size = 64 number of columns = 4 index size = 
              0 }
create table "informix".no_esta_uuid 
  (
    num_doc char(20) not null ,
    cod_cli char(20) not null ,
    fecha date not null ,
    estatus char(20) not null 
  );
revoke all on "informix".no_esta_uuid from "public";

{ TABLE "informix".deta_men row size = 99 number of columns = 10 index size = 0 }
create table "informix".deta_men 
  (
    num_emp char(3) not null ,
    folio char(20),
    cod_art char(20) not null ,
    cod_cte char(20) not null ,
    can_kgs decimal(12,4) not null ,
    can_caj decimal(12,4),
    precio decimal(12,4) not null ,
    total decimal(12,4) not null ,
    fecha date not null ,
    bande integer not null 
  );
revoke all on "informix".deta_men from "public";

{ TABLE "informix".cabe_men row size = 358 number of columns = 10 index size = 0 
              }
create table "informix".cabe_men 
  (
    num_emp char(3),
    folio char(20),
    cod_cte char(20),
    raz_soc char(100),
    vendedor char(100),
    fecha date,
    total decimal(12,4),
    bande integer,
    alias char(50),
    sucursal char(50)
  );
revoke all on "informix".cabe_men from "public";

{ TABLE "informix".iepsdevcom row size = 51 number of columns = 4 index size = 0 
              }
create table "informix".iepsdevcom 
  (
    num_dev char(20),
    codigo char(20),
    totieps decimal(12,4),
    renglon integer
  );
revoke all on "informix".iepsdevcom from "public";

{ TABLE "informix".cab_tab row size = 165 number of columns = 6 index size = 0 }
create table "informix".cab_tab 
  (
    folio char(20),
    fecha date,
    cliente char(100),
    total decimal(12,2),
    vendedor char(30),
    bande integer
  );
revoke all on "informix".cab_tab from "public";

{ TABLE "informix".deta_tab row size = 352 number of columns = 16 index size = 0 
              }
create table "informix".deta_tab 
  (
    folio char(20),
    fecha date,
    cliente char(100),
    can_kgs decimal(12,2),
    total decimal(12,2),
    iva decimal(12,2),
    ieps decimal(12,2),
    tipo char(5),
    vendedor char(30),
    cod_art char(20),
    des_art char(100),
    folio_sis char(20),
    can_caj decimal(12,2),
    lin_ven integer,
    pre_kgs decimal(12,2),
    pre_caj decimal(12,2)
  );
revoke all on "informix".deta_tab from "public";

{ TABLE "informix".conv_inve row size = 54 number of columns = 3 index size = 0 }
create table "informix".conv_inve 
  (
    cod_art char(30) not null ,
    cod_artori char(20) not null ,
    formula integer not null 
  );
revoke all on "informix".conv_inve from "public";

{ TABLE "informix".contaven row size = 50 number of columns = 1 index size = 0 }
create table "informix".contaven 
  (
    folio char(50) not null 
  );
revoke all on "informix".contaven from "public";

{ TABLE "informix".tmp_ieps row size = 20 number of columns = 1 index size = 0 }
create table "informix".tmp_ieps 
  (
    num_doc char(20)
  );
revoke all on "informix".tmp_ieps from "public";

{ TABLE "informix".salida_alm row size = 608 number of columns = 10 index size = 
              0 }
create table "informix".salida_alm 
  (
    folio char(20),
    fecha date,
    usuario char(50),
    vendedor char(50),
    alias char(50),
    cod_cli char(50),
    bande integer,
    revisa char(30),
    sucursal char(50),
    observa char(300)
  );
revoke all on "informix".salida_alm from "public";

{ TABLE "informix".cat_salida row size = 88 number of columns = 5 index size = 0 
              }
create table "informix".cat_salida 
  (
    cod_art char(20),
    des_art char(50),
    precio decimal(12,4),
    cantidad decimal(12,4),
    conse integer
  );
revoke all on "informix".cat_salida from "public";

{ TABLE "informix".salimod1 row size = 292 number of columns = 8 index size = 0 }
create table "informix".salimod1 
  (
    folio integer not null ,
    cod_art char(30) not null ,
    des_art char(200) not null ,
    kgs decimal(12,4),
    cajas decimal(12,4),
    precio decimal(12,4),
    vendedor char(30) not null ,
    pza decimal(12,4)
  );
revoke all on "informix".salimod1 from "public";

{ TABLE "informix".salimod2 row size = 592 number of columns = 9 index size = 0 }
create table "informix".salimod2 
  (
    folio integer,
    cod_art char(30),
    des_art char(200),
    kgs decimal(12,4) not null ,
    cajas decimal(12,4) not null ,
    precio decimal(12,4) not null ,
    vendedor char(30) not null ,
    pza decimal(12,4),
    observa char(300)
  );
revoke all on "informix".salimod2 from "public";

{ TABLE "informix".restaurant row size = 78 number of columns = 3 index size = 0 
              }
create table "informix".restaurant 
  (
    cod_art char(20),
    precio decimal(14,4),
    des_art char(50)
  );
revoke all on "informix".restaurant from "public";

{ TABLE "informix".cod_rest row size = 90 number of columns = 2 index size = 0 }
create table "informix".cod_rest 
  (
    cod_cli char(10) not null ,
    raz_soc char(80)
  );
revoke all on "informix".cod_rest from "public";

{ TABLE "informix".sucu_oxxo row size = 197 number of columns = 9 index size = 0 
              }
create table "informix".sucu_oxxo 
  (
    num_emp char(2),
    num_doc char(20),
    fecha date,
    cod_art char(20),
    precio decimal(12,4),
    canti decimal(12,4),
    total decimal(12,4),
    sucursal char(30),
    des_art char(100)
  );
revoke all on "informix".sucu_oxxo from "public";

{ TABLE "informix".salimod3 row size = 292 number of columns = 8 index size = 0 }
create table "informix".salimod3 
  (
    folio integer not null ,
    cod_art char(30) not null ,
    des_art char(200) not null ,
    kgs decimal(12,4),
    cajas decimal(12,4),
    precio decimal(12,4),
    vendedor char(30) not null ,
    pza decimal(12,4)
  );
revoke all on "informix".salimod3 from "public";

{ TABLE "informix".salimod4 row size = 599 number of columns = 10 index size = 0 
              }
create table "informix".salimod4 
  (
    folio integer not null ,
    cod_art char(30) not null ,
    des_art char(200) not null ,
    kgs decimal(12,4),
    cajas decimal(12,4),
    precio decimal(12,4),
    vendedor char(30) not null ,
    pza decimal(12,4),
    observa char(300),
    pre_caj decimal(12,4)
  );
revoke all on "informix".salimod4 from "public";

{ TABLE "informix".imp_cajas row size = 28 number of columns = 3 index size = 0 }
create table "informix".imp_cajas 
  (
    imprime char(20) not null ,
    fecha_ini date not null ,
    fecha_fin date not null 
  );
revoke all on "informix".imp_cajas from "public";

{ TABLE "informix".salida_almdet row size = 762 number of columns = 14 index size 
              = 0 }
create table "informix".salida_almdet 
  (
    folio char(30),
    cod_art char(30),
    can_kgs decimal(12,4),
    des_art char(100),
    precio decimal(12,4),
    vendedor char(50),
    can_caj decimal(12,4),
    pza decimal(12,4),
    pre_men decimal(12,4),
    pre_may decimal(12,4),
    pre_car decimal(12,4),
    observa char(300),
    observa2 char(200),
    tipo_pre char(3)
  );
revoke all on "informix".salida_almdet from "public";

{ TABLE "informix".imp_rela row size = 128 number of columns = 4 index size = 0 }
create table "informix".imp_rela 
  (
    nombre char(20) not null ,
    caja char(100) not null ,
    fecha_ini date not null ,
    fecha_fin date not null 
  );
revoke all on "informix".imp_rela from "public";

{ TABLE "informix".caja_mayoreo row size = 229 number of columns = 4 index size = 
              0 }
create table "informix".caja_mayoreo 
  (
    cod_art char(20),
    des_art char(200),
    precio decimal(12,2),
    num_emp char(2)
  );
revoke all on "informix".caja_mayoreo from "public";

{ TABLE "informix".cod_may row size = 21 number of columns = 2 index size = 0 }
create table "informix".cod_may 
  (
    cod_art char(20),
    tipo char(1)
  );
revoke all on "informix".cod_may from "public";

{ TABLE "informix".cod_men row size = 21 number of columns = 2 index size = 0 }
create table "informix".cod_men 
  (
    cod_art char(20),
    tipo char(1)
  );
revoke all on "informix".cod_men from "public";

{ TABLE "informix".usatableta row size = 100 number of columns = 1 index size = 0 
              }
create table "informix".usatableta 
  (
    nombre char(100) not null 
  );
revoke all on "informix".usatableta from "public";

{ TABLE "informix".descto_ctes row size = 228 number of columns = 3 index size = 
              0 }
create table "informix".descto_ctes 
  (
    cod_cli char(20) not null ,
    sucursal char(200),
    descto decimal(14,4)
  );
revoke all on "informix".descto_ctes from "public";

{ TABLE "informix".tmp_oxxo row size = 43 number of columns = 4 index size = 0 }
create table "informix".tmp_oxxo 
  (
    num_emp char(2) not null ,
    num_doc char(30),
    importe decimal(12,2),
    fecha date
  );
revoke all on "informix".tmp_oxxo from "public";

{ TABLE "informix".borrarvtas row size = 70 number of columns = 2 index size = 0 
              }
create table "informix".borrarvtas 
  (
    folio char(20),
    nombre char(50)
  );
revoke all on "informix".borrarvtas from "public";

{ TABLE "informix".equivale row size = 150 number of columns = 2 index size = 0 }
create table "informix".equivale 
  (
    cod_barra char(100),
    cod_colesa char(50)
  );
revoke all on "informix".equivale from "public";

{ TABLE "informix".tmp_pedido row size = 150 number of columns = 3 index size = 0 
              }
create table "informix".tmp_pedido 
  (
    folio char(50),
    factura char(50),
    nombre char(50)
  );
revoke all on "informix".tmp_pedido from "public";

{ TABLE "informix".tmp_uuid2 row size = 250 number of columns = 2 index size = 0 
              }
create table "informix".tmp_uuid2 
  (
    num_doc char(50),
    uuid char(200)
  );
revoke all on "informix".tmp_uuid2 from "public";

{ TABLE "informix".sd_normal row size = 226 number of columns = 4 index size = 0 
              }
create table "informix".sd_normal 
  (
    cod_art char(200),
    tip_doc char(10),
    kgs decimal(14,2),
    cajas decimal(14,2)
  );
revoke all on "informix".sd_normal from "public";

{ TABLE "informix".subeinv row size = 222 number of columns = 6 index size = 0 }
create table "informix".subeinv 
  (
    num_emp char(2),
    cod_art char(50),
    des_art char(150),
    can_kgs decimal(14,4),
    can_caj decimal(14,4),
    fecha date
  );
revoke all on "informix".subeinv from "public";

{ TABLE "informix".factuoxxo row size = 106 number of columns = 6 index size = 0 
              }
create table "informix".factuoxxo 
  (
    conse char(20),
    fecha date,
    canti decimal(14,2),
    descri char(50),
    impresion integer,
    codigo char(20)
  );
revoke all on "informix".factuoxxo from "public";

{ TABLE "informix".regimen row size = 205 number of columns = 2 index size = 0 }
create table "informix".regimen 
  (
    cod_regimen char(5),
    des_regimen char(200)
  );
revoke all on "informix".regimen from "public";

{ TABLE "informix".tmp_agua row size = 252 number of columns = 5 index size = 0 }
create table "informix".tmp_agua 
  (
    cod_art char(20),
    des_art char(200),
    fecha date,
    cajas decimal(14,4),
    dia_sema char(20)
  );
revoke all on "informix".tmp_agua from "public";

{ TABLE "informix".cod_agua row size = 124 number of columns = 3 index size = 0 }
create table "informix".cod_agua 
  (
    no_doc integer,
    cod_art char(20),
    des_art char(100)
  );
revoke all on "informix".cod_agua from "public";

{ TABLE "informix".tmp_aguacate row size = 256 number of columns = 6 index size = 
              0 }
create table "informix".tmp_aguacate 
  (
    cod_art char(20),
    des_art char(200),
    fecha date,
    cajas decimal(14,4),
    dia_sema char(20),
    conse integer
  );
revoke all on "informix".tmp_aguacate from "public";

{ TABLE "informix".terminal row size = 88 number of columns = 3 index size = 0 }
create table "informix".terminal 
  (
    codigo char(30),
    descripcion char(50),
    cantidad decimal(14,4)
  );
revoke all on "informix".terminal from "public";

{ TABLE "informix".tmp_terminal row size = 88 number of columns = 3 index size = 
              0 }
create table "informix".tmp_terminal 
  (
    codigo char(30),
    descripcion char(50),
    cantidad decimal(14,4)
  );
revoke all on "informix".tmp_terminal from "public";

{ TABLE "informix".audita row size = 125 number of columns = 10 index size = 0 }
create table "informix".audita 
  (
    no_emp char(2),
    no_folio integer,
    no_doc char(10),
    total decimal(14,4),
    fecha date,
    hora datetime year to minute,
    can_art integer,
    cod_cli char(6),
    nombre char(50),
    agente char(30)
  );
revoke all on "informix".audita from "public";

{ TABLE "informix".guardauuid row size = 204 number of columns = 3 index size = 0 
              }
create table "informix".guardauuid 
  (
    uuid char(100),
    fecha date,
    total char(100)
  );
revoke all on "informix".guardauuid from "public";

{ TABLE "informix".concentra row size = 160 number of columns = 6 index size = 0 
              }
create table "informix".concentra 
  (
    cod_art char(30),
    des_art char(100),
    cajas decimal(14,4),
    kilos decimal(14,4),
    fecha date,
    num_doc char(10)
  );
revoke all on "informix".concentra from "public";

{ TABLE "informix".conce_doc row size = 10 number of columns = 1 index size = 0 }
create table "informix".conce_doc 
  (
    num_doc char(10)
  );
revoke all on "informix".conce_doc from "public";

{ TABLE "informix".oxxo_sucu row size = 80 number of columns = 4 index size = 0 }
create table "informix".oxxo_sucu 
  (
    no_tienda char(10),
    descripcion char(50),
    con_sema char(10),
    con_men char(10)
  );
revoke all on "informix".oxxo_sucu from "public";

{ TABLE "informix".cam_plazo row size = 94 number of columns = 4 index size = 0 }
create table "informix".cam_plazo 
  (
    nombre char(50),
    cliente char(20),
    fecha date,
    dias_cambio char(20)
  );
revoke all on "informix".cam_plazo from "public";

{ TABLE "informix".tableta row size = 374 number of columns = 14 index size = 0 }
create table "informix".tableta 
  (
    num_emp char(2),
    folio char(20),
    cod_cli char(50),
    nombre char(100),
    fecha date,
    subtotal decimal(12,4),
    iva decimal(12,4),
    total decimal(12,4),
    bande char(2),
    rfc char(50),
    folio_col char(50),
    vendedor char(30),
    diableros char(30),
    estatus char(15)
  );
revoke all on "informix".tableta from "public";

{ TABLE "informix".listaprecios row size = 78 number of columns = 7 index size = 
              0 }
create table "informix".listaprecios 
  (
    fecha date not null ,
    cod_art char(14) not null ,
    des_art char(40) not null ,
    menudeo decimal(10,2),
    mayoreo decimal(10,2),
    ban_men char(4),
    ban_may char(4)
  );
revoke all on "informix".listaprecios from "public";

{ TABLE "informix".historicolistpre row size = 73 number of columns = 5 index size 
              = 0 }
create table "informix".historicolistpre 
  (
    fecha datetime year to minute not null ,
    cod_art char(14) not null ,
    des_art char(40) not null ,
    menudeo decimal(10,2),
    mayoreo decimal(10,2)
  );
revoke all on "informix".historicolistpre from "public";

{ TABLE "informix".log_cambioprecios row size = 70 number of columns = 5 index size 
              = 0 }
create table "informix".log_cambioprecios 
  (
    fecha date not null ,
    cod_art char(14) not null ,
    des_art char(40) not null ,
    menudeo decimal(10,2),
    mayoreo decimal(10,2)
  );
revoke all on "informix".log_cambioprecios from "public";

{ TABLE "informix".log_validaprecios row size = 153 number of columns = 10 index 
              size = 0 }
create table "informix".log_validaprecios 
  (
    fecha date,
    num_pedido char(10),
    num_factura char(10),
    nom_usuario char(50),
    cod_art char(14) not null ,
    des_art char(50) not null ,
    ban_pre char(2) not null ,
    precio_capt decimal(10,2) not null ,
    precio_ref decimal(10,2) not null ,
    tip_captura char(1) not null 
  );
revoke all on "informix".log_validaprecios from "public";

{ TABLE "informix".log_depurafol row size = 6 number of columns = 2 index size = 
              0 }
create table "informix".log_depurafol 
  (
    num_emp char(2),
    folio integer
  );
revoke all on "informix".log_depurafol from "public";

{ TABLE "informix".tmp_ventas row size = 283 number of columns = 22 index size = 
              65 }
create table "informix".tmp_ventas 
  (
    folio integer,
    descripcion char(50),
    codigo char(14),
    cajas decimal(10,4),
    kilos decimal(10,4),
    precio decimal(12,4),
    total decimal(12,4),
    nombre char(50),
    iva decimal(12,4),
    cos_pro decimal(12,4),
    totiva decimal(12,4),
    renglon smallint,
    pagado smallint,
    rfc char(20),
    tipo char(2),
    lineaven char(20),
    descto decimal(10,4),
    pedido char(20),
    observacion char(20),
    sucursal char(20),
    num_emp char(2),
    fecha date
  );
revoke all on "informix".tmp_ventas from "public";

{ TABLE "informix".hist_ventas row size = 283 number of columns = 22 index size = 
              36 }
create table "informix".hist_ventas 
  (
    folio integer,
    descripcion char(50),
    codigo char(14),
    cajas decimal(10,4),
    kilos decimal(10,4),
    precio decimal(12,4),
    total decimal(12,4),
    nombre char(50),
    iva decimal(12,4),
    cos_pro decimal(12,4),
    totiva decimal(12,4),
    renglon smallint,
    pagado smallint,
    rfc char(20),
    tipo char(2),
    lineaven char(20),
    descto decimal(10,4),
    pedido char(20),
    observacion char(20),
    sucursal char(20),
    num_emp char(2),
    fecha date
  );
revoke all on "informix".hist_ventas from "public";

{ TABLE "informix".hist_corte_caja row size = 157 number of columns = 16 index size 
              = 43 }
create table "informix".hist_corte_caja 
  (
    folio integer,
    factura char(10),
    nombre char(50),
    caja char(12),
    efectivo decimal(14,2),
    bonos decimal(14,2),
    cheque decimal(14,2),
    dolar decimal(14,2),
    total decimal(14,2),
    tipo_pago char(10),
    tipo_fac char(10),
    fecha date,
    num_emp char(2),
    num_suc char(2),
    cod_cli char(6),
    iva decimal(12,2)
  );
revoke all on "informix".hist_corte_caja from "public";

{ TABLE "informix".hist_inartrinv row size = 135 number of columns = 22 index size 
              = 0 }
create table "informix".hist_inartrinv 
  (
    num_emp char(2),
    cod_art char(14),
    num_suc char(2),
    fech_doc date,
    tip_doc char(2),
    num_doc char(10),
    can_kgs decimal(10,4),
    can_caj decimal(10,4),
    cos_uni_kgs decimal(12,4),
    cos_uni_caj decimal(12,4),
    cos_pro_kgs decimal(12,4),
    cos_pro_caj decimal(12,4),
    pre_vta_kgs decimal(12,4),
    pre_vta_caj decimal(12,4),
    des_vta decimal(12,4),
    fle_art decimal(12,4),
    ren_art smallint,
    cod_pro char(8),
    cod_cli char(8),
    num_ent integer,
    fech_ent date,
    iva_art decimal(12,4)
  );
revoke all on "informix".hist_inartrinv from "public";

{ TABLE "informix".hist_inarfac row size = 458 number of columns = 39 index size 
              = 0 }
create table "informix".hist_inarfac 
  (
    num_emp char(2),
    num_suc char(2),
    num_doc char(10),
    cod_cli char(8),
    raz_soc char(50),
    dom_cli char(60),
    ciu_cli char(20),
    est_cli char(10),
    emb_nom char(40),
    emb_dom char(40),
    emb_pob char(30),
    num_ped integer,
    fech_ped date,
    num_ord integer,
    fech_emb date,
    con_cli char(1),
    ag_fac smallint,
    imp_exe decimal(14,4),
    imp_6 decimal(14,4),
    imp_15 decimal(14,4),
    imp_20 decimal(14,4),
    des_exe decimal(12,4),
    des_6 decimal(12,4),
    des_15 decimal(12,4),
    des_20 decimal(12,4),
    iva_6 decimal(12,4),
    iva_15 decimal(12,4),
    iva_20 decimal(12,4),
    cos_vta decimal(12,4),
    flete decimal(12,4),
    iva_fle decimal(12,4),
    car_1 decimal(12,4),
    iva_1 decimal(12,4),
    car_2 decimal(12,4),
    iva_2 decimal(12,4),
    fecha date,
    reg_fed char(20),
    tip_fac char(1),
    cajera char(12)
  );
revoke all on "informix".hist_inarfac from "public";

{ TABLE "informix".hist_inarent row size = 308 number of columns = 32 index size 
              = 0 }
create table "informix".hist_inarent 
  (
    num_emp char(2),
    num_suc char(2),
    num_ent char(10),
    cod_pro char(8),
    raz_soc char(50),
    num_ped integer,
    num_fac char(10),
    imp_exe decimal(12,2),
    imp_6 decimal(12,2),
    imp_15 decimal(12,2),
    imp_20 decimal(12,2),
    des_exe decimal(10,2),
    des_6 decimal(10,2),
    des_15 decimal(10,2),
    des_20 decimal(10,2),
    iva_6 decimal(10,2),
    iva_15 decimal(10,2),
    iva_20 decimal(10,2),
    fle_ent decimal(10,2),
    iva_fle decimal(10,2),
    seg_mer decimal(10,2),
    gas_adu decimal(12,2),
    iva_gas decimal(12,2),
    hon_adu decimal(12,2),
    ret_adu decimal(12,2),
    iva_adu decimal(12,2),
    fecha date,
    dom_pro char(40),
    ciu_pro char(15),
    edo_pro char(10),
    rfc_pro char(20),
    placas_pro char(10)
  );
revoke all on "informix".hist_inarent from "public";

{ TABLE "informix".hist_documento row size = 38 number of columns = 6 index size 
              = 0 }
create table "informix".hist_documento 
  (
    num_emp char(2),
    num_suc char(2),
    tipo char(2),
    numero char(20),
    importe decimal(14,4),
    fecha date
  );
revoke all on "informix".hist_documento from "public";

{ TABLE "informix".hist_inarpvt row size = 503 number of columns = 47 index size 
              = 0 }
create table "informix".hist_inarpvt 
  (
    num_emp char(2),
    num_suc char(2),
    num_doc integer,
    cod_cli char(8),
    raz_soc char(50),
    dom_cli char(60),
    ciu_cli char(20),
    est_cli char(10),
    emb_nom char(40),
    emb_dom char(40),
    emb_pob char(30),
    num_ped integer,
    fech_ped date,
    num_ord integer,
    fech_emb date,
    con_cli char(1),
    ag_fac smallint,
    imp_exe decimal(14,4),
    imp_6 decimal(14,4),
    imp_15 decimal(14,4),
    imp_20 decimal(14,4),
    des_exe decimal(12,4),
    des_6 decimal(12,4),
    des_15 decimal(12,4),
    des_20 decimal(12,4),
    iva_6 decimal(12,4),
    iva_15 decimal(12,4),
    iva_20 decimal(12,4),
    cos_vta decimal(14,4),
    flete decimal(12,4),
    iva_fle decimal(12,4),
    car_1 decimal(12,4),
    iva_1 decimal(12,4),
    car_2 decimal(12,4),
    iva_2 decimal(12,4),
    fecha date,
    reg_fed char(20),
    tip_fac char(1),
    efectivo decimal(12,4),
    bono decimal(12,4),
    dolar decimal(12,4),
    cheque decimal(12,4),
    num_che integer,
    fech_che date,
    cajera char(12),
    num_fac char(10),
    fech_fac date
  );
revoke all on "informix".hist_inarpvt from "public";

{ TABLE "informix".deta_tableta row size = 814 number of columns = 16 index size 
              = 0 }
create table "informix".deta_tableta 
  (
    folio integer,
    cod_art char(30),
    des_art char(200),
    kgs decimal(12,4),
    cajas decimal(12,4),
    pre_kgs decimal(12,4),
    pre_caj decimal(12,4),
    vendedor char(30),
    total decimal(12,4),
    observa char(300),
    renglon char(2),
    cod_cli char(200),
    iva decimal(12,4),
    tip_art char(2),
    lin_ven char(2),
    num_emp char(2)
  );
revoke all on "informix".deta_tableta from "public";

{ TABLE "informix".surtidor row size = 54 number of columns = 3 index size = 0 }
create table "informix".surtidor 
  (
    nombre char(30),
    cod_ag integer,
    clave char(20)
  );
revoke all on "informix".surtidor from "public";

{ TABLE "informix".vendedor row size = 86 number of columns = 4 index size = 0 }
create table "informix".vendedor 
  (
    nom_ag char(50),
    cod_ag char(2),
    clave char(30),
    folio integer
  );
revoke all on "informix".vendedor from "public";

{ TABLE "informix".tmp_rete row size = 150 number of columns = 3 index size = 0 }
create table "informix".tmp_rete 
  (
    num_doc char(10),
    uuid char(40),
    descri char(100)
  );
revoke all on "informix".tmp_rete from "public";

{ TABLE "informix".tmpuuid row size = 130 number of columns = 2 index size = 0 }
create table "informix".tmpuuid 
  (
    num_doc char(30),
    uuid char(100)
  );
revoke all on "informix".tmpuuid from "public";

{ TABLE "informix".tmphora row size = 136 number of columns = 8 index size = 0 }
create table "informix".tmphora 
  (
    num_doc char(20),
    cajera char(40),
    fecha date,
    imp_exe decimal(14,4),
    imp_15 decimal(14,4),
    iva_15 decimal(14,4),
    des_exe decimal(14,4),
    hora char(40)
  );
revoke all on "informix".tmphora from "public";

{ TABLE "informix".tmp_uuid row size = 20 number of columns = 1 index size = 0 }
create table "informix".tmp_uuid 
  (
    no_doc char(20)
  );
revoke all on "informix".tmp_uuid from "public";

{ TABLE "informix".tmp_actcosto row size = 42 number of columns = 5 index size = 
              0 }
create table "informix".tmp_actcosto 
  (
    cod_art char(10),
    exi_ant_kgs decimal(14,4),
    exi_ant_caj decimal(14,4),
    cos_ant_kgs decimal(14,4),
    cos_ant_caj decimal(14,4)
  );
revoke all on "informix".tmp_actcosto from "public";

{ TABLE "informix".tmp_vende row size = 211 number of columns = 5 index size = 0 
              }
create table "informix".tmp_vende 
  (
    num_doc char(50),
    fecha date,
    cod_cli char(50),
    total decimal(12,4),
    vendedor char(100)
  );
revoke all on "informix".tmp_vende from "public";

{ TABLE "informix".panta1 row size = 50 number of columns = 1 index size = 0 }
create table "informix".panta1 
  (
    cod_art char(50)
  );
revoke all on "informix".panta1 from "public";

{ TABLE "informix".autoriza row size = 173 number of columns = 11 index size = 0 
              }
create table "informix".autoriza 
  (
    folio char(30),
    cod_art char(40),
    can_kgs decimal(12,4),
    can_caj decimal(12,4),
    pre_kgs decimal(12,4),
    pre_caj decimal(12,4),
    total decimal(12,4),
    cliente char(20),
    fecha date,
    bande integer,
    vendedor char(40)
  );
revoke all on "informix".autoriza from "public";

{ TABLE "informix".actu_tablet row size = 6 number of columns = 2 index size = 0 
              }
create table "informix".actu_tablet 
  (
    no_actu char(2),
    fecha date
  );
revoke all on "informix".actu_tablet from "public";

{ TABLE "informix".recolar row size = 210 number of columns = 3 index size = 0 }
create table "informix".recolar 
  (
    des_art char(200),
    precio decimal(14,4),
    bande char(2)
  );
revoke all on "informix".recolar from "public";

{ TABLE "informix".recolar1 row size = 210 number of columns = 3 index size = 0 }
create table "informix".recolar1 
  (
    des_art char(200),
    precio decimal(14,4),
    bande char(2)
  );
revoke all on "informix".recolar1 from "public";

{ TABLE "informix".recolar2 row size = 210 number of columns = 3 index size = 0 }
create table "informix".recolar2 
  (
    des_art char(200),
    precio decimal(14,4),
    bande char(2)
  );
revoke all on "informix".recolar2 from "public";

{ TABLE "informix".panta2 row size = 70 number of columns = 2 index size = 0 }
create table "informix".panta2 
  (
    cod_art char(20),
    des_art char(50)
  );
revoke all on "informix".panta2 from "public";

{ TABLE "informix".recolar3 row size = 142 number of columns = 4 index size = 0 }
create table "informix".recolar3 
  (
    des_art char(100),
    precio char(20),
    bande char(2),
    precio2 char(20)
  );
revoke all on "informix".recolar3 from "public";

{ TABLE "informix".recolar4 row size = 142 number of columns = 4 index size = 0 }
create table "informix".recolar4 
  (
    des_art char(100),
    precio char(20),
    bande char(2),
    precio2 char(20)
  );
revoke all on "informix".recolar4 from "public";

{ TABLE "informix".recolar5 row size = 142 number of columns = 4 index size = 0 }
create table "informix".recolar5 
  (
    des_art char(100),
    precio char(20),
    bande char(2),
    precio2 char(20)
  );
revoke all on "informix".recolar5 from "public";

{ TABLE "informix".panta3 row size = 70 number of columns = 2 index size = 0 }
create table "informix".panta3 
  (
    cod_art char(20),
    des_art char(50)
  );
revoke all on "informix".panta3 from "public";

{ TABLE "informix".recolar6 row size = 142 number of columns = 4 index size = 0 }
create table "informix".recolar6 
  (
    des_art char(100),
    precio char(20),
    bande char(2),
    precio2 char(20)
  );
revoke all on "informix".recolar6 from "public";

{ TABLE "informix".recolar7 row size = 142 number of columns = 4 index size = 0 }
create table "informix".recolar7 
  (
    des_art char(100),
    precio char(20),
    bande char(2),
    precio2 char(20)
  );
revoke all on "informix".recolar7 from "public";

{ TABLE "informix".recolar9 row size = 142 number of columns = 4 index size = 0 }
create table "informix".recolar9 
  (
    des_art char(100),
    precio char(20),
    bande char(2),
    precio2 char(20)
  );
revoke all on "informix".recolar9 from "public";

{ TABLE "informix".recolar8 row size = 142 number of columns = 4 index size = 0 }
create table "informix".recolar8 
  (
    des_art char(100),
    precio char(20),
    bande char(2),
    precio2 char(20)
  );
revoke all on "informix".recolar8 from "public";

{ TABLE "informix".panta4 row size = 70 number of columns = 2 index size = 0 }
create table "informix".panta4 
  (
    cod_art char(20),
    des_art char(50)
  );
revoke all on "informix".panta4 from "public";

{ TABLE "informix".recolar10 row size = 142 number of columns = 4 index size = 0 
              }
create table "informix".recolar10 
  (
    des_art char(100),
    precio char(20),
    bande char(2),
    precio2 char(20)
  );
revoke all on "informix".recolar10 from "public";

{ TABLE "informix".recolar11 row size = 142 number of columns = 4 index size = 0 
              }
create table "informix".recolar11 
  (
    des_art char(100),
    precio char(20),
    bande char(2),
    precio2 char(20)
  );
revoke all on "informix".recolar11 from "public";

{ TABLE "informix".recolar12 row size = 142 number of columns = 4 index size = 0 
              }
create table "informix".recolar12 
  (
    des_art char(100),
    precio char(20),
    bande char(2),
    precio2 char(20)
  );
revoke all on "informix".recolar12 from "public";

{ TABLE "informix".recolar13 row size = 142 number of columns = 4 index size = 0 
              }
create table "informix".recolar13 
  (
    des_art char(100),
    precio char(20),
    bande char(2),
    precio2 char(20)
  );
revoke all on "informix".recolar13 from "public";

{ TABLE "informix".tmp_futu row size = 12 number of columns = 2 index size = 0 }
create table "informix".tmp_futu 
  (
    fecha date,
    total decimal(14,4)
  );
revoke all on "informix".tmp_futu from "public";

{ TABLE "informix".panta5 row size = 70 number of columns = 2 index size = 0 }
create table "informix".panta5 
  (
    cod_art char(20),
    des_art char(50)
  );
revoke all on "informix".panta5 from "public";

{ TABLE "informix".recolar14 row size = 142 number of columns = 4 index size = 0 
              }
create table "informix".recolar14 
  (
    des_art char(100),
    precio char(20),
    bande char(2),
    precio2 char(20)
  );
revoke all on "informix".recolar14 from "public";

{ TABLE "informix".recolar15 row size = 142 number of columns = 4 index size = 0 
              }
create table "informix".recolar15 
  (
    des_art char(100),
    precio char(20),
    bande char(2),
    precio2 char(20)
  );
revoke all on "informix".recolar15 from "public";

{ TABLE "informix".recolar16 row size = 142 number of columns = 4 index size = 0 
              }
create table "informix".recolar16 
  (
    des_art char(100),
    precio char(20),
    bande char(2),
    precio2 char(20)
  );
revoke all on "informix".recolar16 from "public";

{ TABLE "informix".porce row size = 73 number of columns = 4 index size = 0 }
create table "informix".porce 
  (
    cod_cli char(25),
    porce decimal(14,4),
    sucu char(30),
    cod_pro char(10)
  );
revoke all on "informix".porce from "public";

{ TABLE "informix".actu_tablet2 row size = 10 number of columns = 3 index size = 
              0 }
create table "informix".actu_tablet2 
  (
    no_actu char(2),
    fecha date,
    bande integer
  );
revoke all on "informix".actu_tablet2 from "public";

{ TABLE "informix".aguacate row size = 14 number of columns = 3 index size = 0 }
create table "informix".aguacate 
  (
    cod_art char(10),
    alias char(2),
    conse char(2)
  );
revoke all on "informix".aguacate from "public";

{ TABLE "informix".pedido row size = 32 number of columns = 4 index size = 0 }
create table "informix".pedido 
  (
    cod_pro char(20),
    tempo char(2),
    dias decimal(10,2),
    lin_ven integer
  );
revoke all on "informix".pedido from "public";

{ TABLE "informix".inarvpf2 row size = 146 number of columns = 13 index size = 0 
              }
create table "informix".inarvpf2 
  (
    num_emp char(2),
    cod_art char(14),
    des_art char(40),
    kilos decimal(10,4),
    cajas decimal(10,4),
    precio decimal(10,4),
    total decimal(10,4),
    fecha date,
    tipo char(10),
    iva decimal(10,4),
    lin_ven char(2),
    num_doc integer,
    cajera char(40)
  );
revoke all on "informix".inarvpf2 from "public";

{ TABLE "informix".pantactu row size = 14 number of columns = 2 index size = 0 }
create table "informix".pantactu 
  (
    pantalla char(10),
    bande integer
  );
revoke all on "informix".pantactu from "public";

{ TABLE "informix".tmp_vpfbo row size = 62 number of columns = 7 index size = 0 }
create table "informix".tmp_vpfbo 
  (
    num_doc char(20),
    cod_art char(14),
    kilos decimal(10,4),
    cajas decimal(10,4),
    total decimal(10,4),
    fecha date,
    precio decimal(10,4)
  );
revoke all on "informix".tmp_vpfbo from "public";

{ TABLE "informix".tmp_kelly row size = 4 number of columns = 1 index size = 0 }
create table "informix".tmp_kelly 
  (
    bande integer
  );
revoke all on "informix".tmp_kelly from "public";

{ TABLE "informix".tmp_utizefe row size = 138 number of columns = 6 index size = 
              0 }
create table "informix".tmp_utizefe 
  (
    cod_art char(10),
    des_art char(100),
    can_kgs decimal(14,4),
    can_caj decimal(14,4),
    uti decimal(14,4),
    bande integer
  );
revoke all on "informix".tmp_utizefe from "public";


grant select on "informix".inarinv to "public" as "informix";
grant update on "informix".inarinv to "public" as "informix";
grant insert on "informix".inarinv to "public" as "informix";
grant delete on "informix".inarinv to "public" as "informix";
grant index on "informix".inarinv to "public" as "informix";
grant select on "informix".inarprov to "public" as "informix";
grant update on "informix".inarprov to "public" as "informix";
grant insert on "informix".inarprov to "public" as "informix";
grant delete on "informix".inarprov to "public" as "informix";
grant index on "informix".inarprov to "public" as "informix";
grant select on "informix".inarcl to "public" as "informix";
grant update on "informix".inarcl to "public" as "informix";
grant insert on "informix".inarcl to "public" as "informix";
grant delete on "informix".inarcl to "public" as "informix";
grant index on "informix".inarcl to "public" as "informix";
grant select on "informix".inarcia to "public" as "informix";
grant update on "informix".inarcia to "public" as "informix";
grant insert on "informix".inarcia to "public" as "informix";
grant delete on "informix".inarcia to "public" as "informix";
grant index on "informix".inarcia to "public" as "informix";
grant select on "informix".inarsuc to "public" as "informix";
grant update on "informix".inarsuc to "public" as "informix";
grant insert on "informix".inarsuc to "public" as "informix";
grant delete on "informix".inarsuc to "public" as "informix";
grant index on "informix".inarsuc to "public" as "informix";
grant select on "informix".inartrinv2015 to "public" as "informix";
grant update on "informix".inartrinv2015 to "public" as "informix";
grant insert on "informix".inartrinv2015 to "public" as "informix";
grant delete on "informix".inartrinv2015 to "public" as "informix";
grant index on "informix".inartrinv2015 to "public" as "informix";
grant select on "informix".inarent to "public" as "informix";
grant update on "informix".inarent to "public" as "informix";
grant insert on "informix".inarent to "public" as "informix";
grant delete on "informix".inarent to "public" as "informix";
grant index on "informix".inarent to "public" as "informix";
grant select on "informix".inartrpr to "public" as "informix";
grant update on "informix".inartrpr to "public" as "informix";
grant insert on "informix".inartrpr to "public" as "informix";
grant delete on "informix".inartrpr to "public" as "informix";
grant index on "informix".inartrpr to "public" as "informix";
grant select on "xxx".log_borrado to "public" as "xxx";
grant update on "xxx".log_borrado to "public" as "xxx";
grant insert on "xxx".log_borrado to "public" as "xxx";
grant delete on "xxx".log_borrado to "public" as "xxx";
grant index on "xxx".log_borrado to "public" as "xxx";
grant select on "informix".inarcot1 to "public" as "informix";
grant update on "informix".inarcot1 to "public" as "informix";
grant insert on "informix".inarcot1 to "public" as "informix";
grant delete on "informix".inarcot1 to "public" as "informix";
grant index on "informix".inarcot1 to "public" as "informix";
grant select on "informix".inarcot to "public" as "informix";
grant update on "informix".inarcot to "public" as "informix";
grant insert on "informix".inarcot to "public" as "informix";
grant delete on "informix".inarcot to "public" as "informix";
grant index on "informix".inarcot to "public" as "informix";
grant select on "informix".inarag to "public" as "informix";
grant update on "informix".inarag to "public" as "informix";
grant insert on "informix".inarag to "public" as "informix";
grant delete on "informix".inarag to "public" as "informix";
grant index on "informix".inarag to "public" as "informix";
grant select on "informix".ventas to "public" as "informix";
grant update on "informix".ventas to "public" as "informix";
grant insert on "informix".ventas to "public" as "informix";
grant delete on "informix".ventas to "public" as "informix";
grant index on "informix".ventas to "public" as "informix";
grant select on "informix".sucursales to "public" as "informix";
grant update on "informix".sucursales to "public" as "informix";
grant insert on "informix".sucursales to "public" as "informix";
grant delete on "informix".sucursales to "public" as "informix";
grant index on "informix".sucursales to "public" as "informix";
grant select on "informix".inartrcl to "public" as "informix";
grant update on "informix".inartrcl to "public" as "informix";
grant insert on "informix".inartrcl to "public" as "informix";
grant delete on "informix".inartrcl to "public" as "informix";
grant index on "informix".inartrcl to "public" as "informix";
grant select on "informix".conspagcli to "public" as "informix";
grant update on "informix".conspagcli to "public" as "informix";
grant insert on "informix".conspagcli to "public" as "informix";
grant delete on "informix".conspagcli to "public" as "informix";
grant index on "informix".conspagcli to "public" as "informix";
grant select on "xxx".bancos to "public" as "xxx";
grant update on "xxx".bancos to "public" as "xxx";
grant insert on "xxx".bancos to "public" as "xxx";
grant delete on "xxx".bancos to "public" as "xxx";
grant index on "xxx".bancos to "public" as "xxx";
grant select on "xxx".cajeras to "public" as "xxx";
grant update on "xxx".cajeras to "public" as "xxx";
grant insert on "xxx".cajeras to "public" as "xxx";
grant delete on "xxx".cajeras to "public" as "xxx";
grant index on "xxx".cajeras to "public" as "xxx";
grant select on "informix".inarpvt to "public" as "informix";
grant update on "informix".inarpvt to "public" as "informix";
grant insert on "informix".inarpvt to "public" as "informix";
grant delete on "informix".inarpvt to "public" as "informix";
grant index on "informix".inarpvt to "public" as "informix";
grant select on "xxx".consecutivo to "public" as "xxx";
grant update on "xxx".consecutivo to "public" as "xxx";
grant insert on "xxx".consecutivo to "public" as "xxx";
grant delete on "xxx".consecutivo to "public" as "xxx";
grant index on "xxx".consecutivo to "public" as "xxx";
grant select on "informix".corte_caja to "public" as "informix";
grant update on "informix".corte_caja to "public" as "informix";
grant insert on "informix".corte_caja to "public" as "informix";
grant delete on "informix".corte_caja to "public" as "informix";
grant index on "informix".corte_caja to "public" as "informix";
grant select on "informix".tcanemp to "public" as "informix";
grant update on "informix".tcanemp to "public" as "informix";
grant insert on "informix".tcanemp to "public" as "informix";
grant delete on "informix".tcanemp to "public" as "informix";
grant index on "informix".tcanemp to "public" as "informix";
grant select on "informix".inartrcl1 to "public" as "informix";
grant update on "informix".inartrcl1 to "public" as "informix";
grant insert on "informix".inartrcl1 to "public" as "informix";
grant delete on "informix".inartrcl1 to "public" as "informix";
grant index on "informix".inartrcl1 to "public" as "informix";
grant select on "informix".inarpcl to "public" as "informix";
grant update on "informix".inarpcl to "public" as "informix";
grant insert on "informix".inarpcl to "public" as "informix";
grant delete on "informix".inarpcl to "public" as "informix";
grant index on "informix".inarpcl to "public" as "informix";
grant select on "informix".inarppr to "public" as "informix";
grant update on "informix".inarppr to "public" as "informix";
grant insert on "informix".inarppr to "public" as "informix";
grant delete on "informix".inarppr to "public" as "informix";
grant index on "informix".inarppr to "public" as "informix";
grant select on "informix".inartrpr1 to "public" as "informix";
grant update on "informix".inartrpr1 to "public" as "informix";
grant insert on "informix".inartrpr1 to "public" as "informix";
grant delete on "informix".inartrpr1 to "public" as "informix";
grant index on "informix".inartrpr1 to "public" as "informix";
grant select on "informix".conspagpro to "public" as "informix";
grant update on "informix".conspagpro to "public" as "informix";
grant insert on "informix".conspagpro to "public" as "informix";
grant delete on "informix".conspagpro to "public" as "informix";
grant index on "informix".conspagpro to "public" as "informix";
grant select on "informix".tmpcli to "public" as "informix";
grant update on "informix".tmpcli to "public" as "informix";
grant insert on "informix".tmpcli to "public" as "informix";
grant delete on "informix".tmpcli to "public" as "informix";
grant index on "informix".tmpcli to "public" as "informix";
grant select on "informix".foltickets to "public" as "informix";
grant update on "informix".foltickets to "public" as "informix";
grant insert on "informix".foltickets to "public" as "informix";
grant delete on "informix".foltickets to "public" as "informix";
grant index on "informix".foltickets to "public" as "informix";
grant select on "informix".inardev to "public" as "informix";
grant update on "informix".inardev to "public" as "informix";
grant insert on "informix".inardev to "public" as "informix";
grant delete on "informix".inardev to "public" as "informix";
grant index on "informix".inardev to "public" as "informix";
grant select on "informix".tempdev to "public" as "informix";
grant update on "informix".tempdev to "public" as "informix";
grant insert on "informix".tempdev to "public" as "informix";
grant delete on "informix".tempdev to "public" as "informix";
grant index on "informix".tempdev to "public" as "informix";
grant select on "informix".respaventas to "public" as "informix";
grant update on "informix".respaventas to "public" as "informix";
grant insert on "informix".respaventas to "public" as "informix";
grant delete on "informix".respaventas to "public" as "informix";
grant index on "informix".respaventas to "public" as "informix";
grant select on "informix".folio to "public" as "informix";
grant update on "informix".folio to "public" as "informix";
grant insert on "informix".folio to "public" as "informix";
grant delete on "informix".folio to "public" as "informix";
grant index on "informix".folio to "public" as "informix";
grant select on "informix".tmpprov to "public" as "informix";
grant update on "informix".tmpprov to "public" as "informix";
grant insert on "informix".tmpprov to "public" as "informix";
grant delete on "informix".tmpprov to "public" as "informix";
grant index on "informix".tmpprov to "public" as "informix";
grant select on "informix".inarfac to "public" as "informix";
grant update on "informix".inarfac to "public" as "informix";
grant insert on "informix".inarfac to "public" as "informix";
grant delete on "informix".inarfac to "public" as "informix";
grant index on "informix".inarfac to "public" as "informix";
grant select on "informix".tmp_kardex to "public" as "informix";
grant update on "informix".tmp_kardex to "public" as "informix";
grant insert on "informix".tmp_kardex to "public" as "informix";
grant delete on "informix".tmp_kardex to "public" as "informix";
grant index on "informix".tmp_kardex to "public" as "informix";
grant select on "xxx".tmp_canemp to "public" as "xxx";
grant update on "xxx".tmp_canemp to "public" as "xxx";
grant insert on "xxx".tmp_canemp to "public" as "xxx";
grant delete on "xxx".tmp_canemp to "public" as "xxx";
grant index on "xxx".tmp_canemp to "public" as "xxx";
grant select on "xxx".log_actkardex to "public" as "xxx";
grant update on "xxx".log_actkardex to "public" as "xxx";
grant insert on "xxx".log_actkardex to "public" as "xxx";
grant delete on "xxx".log_actkardex to "public" as "xxx";
grant index on "xxx".log_actkardex to "public" as "xxx";
grant select on "xxx".inardiverso to "public" as "xxx";
grant update on "xxx".inardiverso to "public" as "xxx";
grant insert on "xxx".inardiverso to "public" as "xxx";
grant delete on "xxx".inardiverso to "public" as "xxx";
grant index on "xxx".inardiverso to "public" as "xxx";
grant select on "informix".consendiv to "public" as "informix";
grant update on "informix".consendiv to "public" as "informix";
grant insert on "informix".consendiv to "public" as "informix";
grant delete on "informix".consendiv to "public" as "informix";
grant index on "informix".consendiv to "public" as "informix";
grant select on "informix".conssadiv to "public" as "informix";
grant update on "informix".conssadiv to "public" as "informix";
grant insert on "informix".conssadiv to "public" as "informix";
grant delete on "informix".conssadiv to "public" as "informix";
grant index on "informix".conssadiv to "public" as "informix";
grant select on "xxx".tmp_kardexneg to "public" as "xxx";
grant update on "xxx".tmp_kardexneg to "public" as "xxx";
grant insert on "xxx".tmp_kardexneg to "public" as "xxx";
grant delete on "xxx".tmp_kardexneg to "public" as "xxx";
grant index on "xxx".tmp_kardexneg to "public" as "xxx";
grant select on "informix".inardevcom to "public" as "informix";
grant update on "informix".inardevcom to "public" as "informix";
grant insert on "informix".inardevcom to "public" as "informix";
grant delete on "informix".inardevcom to "public" as "informix";
grant index on "informix".inardevcom to "public" as "informix";
grant select on "informix".inventario to "public" as "informix";
grant update on "informix".inventario to "public" as "informix";
grant insert on "informix".inventario to "public" as "informix";
grant delete on "informix".inventario to "public" as "informix";
grant index on "informix".inventario to "public" as "informix";
grant select on "informix".tmptrcl to "public" as "informix";
grant update on "informix".tmptrcl to "public" as "informix";
grant insert on "informix".tmptrcl to "public" as "informix";
grant delete on "informix".tmptrcl to "public" as "informix";
grant index on "informix".tmptrcl to "public" as "informix";
grant select on "informix".copyinv_diario to "public" as "informix";
grant update on "informix".copyinv_diario to "public" as "informix";
grant insert on "informix".copyinv_diario to "public" as "informix";
grant delete on "informix".copyinv_diario to "public" as "informix";
grant index on "informix".copyinv_diario to "public" as "informix";
grant select on "informix".inv_diario to "public" as "informix";
grant update on "informix".inv_diario to "public" as "informix";
grant insert on "informix".inv_diario to "public" as "informix";
grant delete on "informix".inv_diario to "public" as "informix";
grant index on "informix".inv_diario to "public" as "informix";
grant select on "informix".tmp_entinv to "public" as "informix";
grant update on "informix".tmp_entinv to "public" as "informix";
grant insert on "informix".tmp_entinv to "public" as "informix";
grant delete on "informix".tmp_entinv to "public" as "informix";
grant index on "informix".tmp_entinv to "public" as "informix";
grant select on "informix".tmp_salinv to "public" as "informix";
grant update on "informix".tmp_salinv to "public" as "informix";
grant insert on "informix".tmp_salinv to "public" as "informix";
grant delete on "informix".tmp_salinv to "public" as "informix";
grant index on "informix".tmp_salinv to "public" as "informix";
grant select on "informix".tmptrinv to "public" as "informix";
grant update on "informix".tmptrinv to "public" as "informix";
grant insert on "informix".tmptrinv to "public" as "informix";
grant delete on "informix".tmptrinv to "public" as "informix";
grant index on "informix".tmptrinv to "public" as "informix";
grant select on "informix".respainarped to "public" as "informix";
grant update on "informix".respainarped to "public" as "informix";
grant insert on "informix".respainarped to "public" as "informix";
grant delete on "informix".respainarped to "public" as "informix";
grant index on "informix".respainarped to "public" as "informix";
grant select on "informix".inarped to "public" as "informix";
grant update on "informix".inarped to "public" as "informix";
grant insert on "informix".inarped to "public" as "informix";
grant delete on "informix".inarped to "public" as "informix";
grant index on "informix".inarped to "public" as "informix";
grant select on "informix".copiainarinv to "public" as "informix";
grant update on "informix".copiainarinv to "public" as "informix";
grant insert on "informix".copiainarinv to "public" as "informix";
grant delete on "informix".copiainarinv to "public" as "informix";
grant index on "informix".copiainarinv to "public" as "informix";
grant select on "informix".cve_desblo to "public" as "informix";
grant update on "informix".cve_desblo to "public" as "informix";
grant insert on "informix".cve_desblo to "public" as "informix";
grant delete on "informix".cve_desblo to "public" as "informix";
grant index on "informix".cve_desblo to "public" as "informix";
grant select on "informix".desblo to "public" as "informix";
grant update on "informix".desblo to "public" as "informix";
grant insert on "informix".desblo to "public" as "informix";
grant delete on "informix".desblo to "public" as "informix";
grant index on "informix".desblo to "public" as "informix";
grant select on "xxx".conscheq to "public" as "xxx";
grant update on "xxx".conscheq to "public" as "xxx";
grant insert on "xxx".conscheq to "public" as "xxx";
grant delete on "xxx".conscheq to "public" as "xxx";
grant index on "xxx".conscheq to "public" as "xxx";
grant select on "xxx".inarch_dev to "public" as "xxx";
grant update on "xxx".inarch_dev to "public" as "xxx";
grant insert on "xxx".inarch_dev to "public" as "xxx";
grant delete on "xxx".inarch_dev to "public" as "xxx";
grant index on "xxx".inarch_dev to "public" as "xxx";
grant select on "informix".inv_mensual to "public" as "informix";
grant update on "informix".inv_mensual to "public" as "informix";
grant insert on "informix".inv_mensual to "public" as "informix";
grant delete on "informix".inv_mensual to "public" as "informix";
grant index on "informix".inv_mensual to "public" as "informix";
grant select on "informix".config to "public" as "informix";
grant update on "informix".config to "public" as "informix";
grant insert on "informix".config to "public" as "informix";
grant delete on "informix".config to "public" as "informix";
grant index on "informix".config to "public" as "informix";
grant select on "informix".inarpch_dev to "public" as "informix";
grant update on "informix".inarpch_dev to "public" as "informix";
grant insert on "informix".inarpch_dev to "public" as "informix";
grant delete on "informix".inarpch_dev to "public" as "informix";
grant index on "informix".inarpch_dev to "public" as "informix";
grant select on "informix".tmp_locpag to "public" as "informix";
grant update on "informix".tmp_locpag to "public" as "informix";
grant insert on "informix".tmp_locpag to "public" as "informix";
grant delete on "informix".tmp_locpag to "public" as "informix";
grant index on "informix".tmp_locpag to "public" as "informix";
grant select on "informix".unicas to "public" as "informix";
grant update on "informix".unicas to "public" as "informix";
grant insert on "informix".unicas to "public" as "informix";
grant delete on "informix".unicas to "public" as "informix";
grant index on "informix".unicas to "public" as "informix";
grant select on "informix".tempdevco to "public" as "informix";
grant update on "informix".tempdevco to "public" as "informix";
grant insert on "informix".tempdevco to "public" as "informix";
grant delete on "informix".tempdevco to "public" as "informix";
grant index on "informix".tempdevco to "public" as "informix";
grant select on "informix".vips to "public" as "informix";
grant update on "informix".vips to "public" as "informix";
grant insert on "informix".vips to "public" as "informix";
grant delete on "informix".vips to "public" as "informix";
grant index on "informix".vips to "public" as "informix";
grant select on "informix".cotiza to "public" as "informix";
grant update on "informix".cotiza to "public" as "informix";
grant insert on "informix".cotiza to "public" as "informix";
grant delete on "informix".cotiza to "public" as "informix";
grant index on "informix".cotiza to "public" as "informix";
grant select on "informix".salike to "public" as "informix";
grant update on "informix".salike to "public" as "informix";
grant insert on "informix".salike to "public" as "informix";
grant delete on "informix".salike to "public" as "informix";
grant index on "informix".salike to "public" as "informix";
grant select on "xxx".poliza_cab to "public" as "xxx";
grant update on "xxx".poliza_cab to "public" as "xxx";
grant insert on "xxx".poliza_cab to "public" as "xxx";
grant delete on "xxx".poliza_cab to "public" as "xxx";
grant index on "xxx".poliza_cab to "public" as "xxx";
grant select on "xxx".poliza to "public" as "xxx";
grant update on "xxx".poliza to "public" as "xxx";
grant insert on "xxx".poliza to "public" as "xxx";
grant delete on "xxx".poliza to "public" as "xxx";
grant index on "xxx".poliza to "public" as "xxx";
grant select on "xxx".catalogo_poliza to "public" as "xxx";
grant update on "xxx".catalogo_poliza to "public" as "xxx";
grant insert on "xxx".catalogo_poliza to "public" as "xxx";
grant delete on "xxx".catalogo_poliza to "public" as "xxx";
grant index on "xxx".catalogo_poliza to "public" as "xxx";
grant select on "informix".optimo to "public" as "informix";
grant update on "informix".optimo to "public" as "informix";
grant insert on "informix".optimo to "public" as "informix";
grant delete on "informix".optimo to "public" as "informix";
grant index on "informix".optimo to "public" as "informix";
grant select on "informix".diferencia to "public" as "informix";
grant update on "informix".diferencia to "public" as "informix";
grant insert on "informix".diferencia to "public" as "informix";
grant delete on "informix".diferencia to "public" as "informix";
grant index on "informix".diferencia to "public" as "informix";
grant select on "xxx".consent to "public" as "xxx";
grant update on "xxx".consent to "public" as "xxx";
grant insert on "xxx".consent to "public" as "xxx";
grant delete on "xxx".consent to "public" as "xxx";
grant index on "xxx".consent to "public" as "xxx";
grant select on "informix".tipo to "public" as "informix";
grant update on "informix".tipo to "public" as "informix";
grant insert on "informix".tipo to "public" as "informix";
grant delete on "informix".tipo to "public" as "informix";
grant index on "informix".tipo to "public" as "informix";
grant select on "informix".pago_parcial to "public" as "informix";
grant update on "informix".pago_parcial to "public" as "informix";
grant insert on "informix".pago_parcial to "public" as "informix";
grant delete on "informix".pago_parcial to "public" as "informix";
grant index on "informix".pago_parcial to "public" as "informix";
grant select on "informix".conse_pagos to "public" as "informix";
grant update on "informix".conse_pagos to "public" as "informix";
grant insert on "informix".conse_pagos to "public" as "informix";
grant delete on "informix".conse_pagos to "public" as "informix";
grant index on "informix".conse_pagos to "public" as "informix";
grant select on "informix".histo_pagos to "public" as "informix";
grant update on "informix".histo_pagos to "public" as "informix";
grant insert on "informix".histo_pagos to "public" as "informix";
grant delete on "informix".histo_pagos to "public" as "informix";
grant index on "informix".histo_pagos to "public" as "informix";
grant select on "informix".alta_codigo to "public" as "informix";
grant update on "informix".alta_codigo to "public" as "informix";
grant insert on "informix".alta_codigo to "public" as "informix";
grant delete on "informix".alta_codigo to "public" as "informix";
grant index on "informix".alta_codigo to "public" as "informix";
grant select on "informix".revisa_pago to "public" as "informix";
grant update on "informix".revisa_pago to "public" as "informix";
grant insert on "informix".revisa_pago to "public" as "informix";
grant delete on "informix".revisa_pago to "public" as "informix";
grant index on "informix".revisa_pago to "public" as "informix";
grant select on "informix".sucunew to "public" as "informix";
grant update on "informix".sucunew to "public" as "informix";
grant insert on "informix".sucunew to "public" as "informix";
grant delete on "informix".sucunew to "public" as "informix";
grant index on "informix".sucunew to "public" as "informix";
grant select on "informix".inarconfor to "public" as "informix";
grant update on "informix".inarconfor to "public" as "informix";
grant insert on "informix".inarconfor to "public" as "informix";
grant delete on "informix".inarconfor to "public" as "informix";
grant index on "informix".inarconfor to "public" as "informix";
grant select on "informix".inarpapro to "public" as "informix";
grant update on "informix".inarpapro to "public" as "informix";
grant insert on "informix".inarpapro to "public" as "informix";
grant delete on "informix".inarpapro to "public" as "informix";
grant index on "informix".inarpapro to "public" as "informix";
grant select on "informix".inarvpf to "public" as "informix";
grant update on "informix".inarvpf to "public" as "informix";
grant insert on "informix".inarvpf to "public" as "informix";
grant delete on "informix".inarvpf to "public" as "informix";
grant index on "informix".inarvpf to "public" as "informix";
grant select on "informix".log_abonos to "public" as "informix";
grant update on "informix".log_abonos to "public" as "informix";
grant insert on "informix".log_abonos to "public" as "informix";
grant delete on "informix".log_abonos to "public" as "informix";
grant index on "informix".log_abonos to "public" as "informix";
grant select on "informix".abonos to "public" as "informix";
grant update on "informix".abonos to "public" as "informix";
grant insert on "informix".abonos to "public" as "informix";
grant delete on "informix".abonos to "public" as "informix";
grant index on "informix".abonos to "public" as "informix";
grant select on "informix".abo_blo to "public" as "informix";
grant update on "informix".abo_blo to "public" as "informix";
grant insert on "informix".abo_blo to "public" as "informix";
grant delete on "informix".abo_blo to "public" as "informix";
grant index on "informix".abo_blo to "public" as "informix";
grant select on "informix".tmp_uti_cli to "public" as "informix";
grant update on "informix".tmp_uti_cli to "public" as "informix";
grant insert on "informix".tmp_uti_cli to "public" as "informix";
grant delete on "informix".tmp_uti_cli to "public" as "informix";
grant index on "informix".tmp_uti_cli to "public" as "informix";
grant select on "informix".tmp_canempvpf to "public" as "informix";
grant update on "informix".tmp_canempvpf to "public" as "informix";
grant insert on "informix".tmp_canempvpf to "public" as "informix";
grant delete on "informix".tmp_canempvpf to "public" as "informix";
grant index on "informix".tmp_canempvpf to "public" as "informix";
grant select on "xxx".ctes_dom to "public" as "xxx";
grant update on "xxx".ctes_dom to "public" as "xxx";
grant insert on "xxx".ctes_dom to "public" as "xxx";
grant delete on "xxx".ctes_dom to "public" as "xxx";
grant index on "xxx".ctes_dom to "public" as "xxx";
grant select on "informix".tmpvtadia to "public" as "informix";
grant update on "informix".tmpvtadia to "public" as "informix";
grant insert on "informix".tmpvtadia to "public" as "informix";
grant delete on "informix".tmpvtadia to "public" as "informix";
grant index on "informix".tmpvtadia to "public" as "informix";
grant select on "informix".tmp_codigos to "public" as "informix";
grant update on "informix".tmp_codigos to "public" as "informix";
grant insert on "informix".tmp_codigos to "public" as "informix";
grant delete on "informix".tmp_codigos to "public" as "informix";
grant index on "informix".tmp_codigos to "public" as "informix";
grant select on "informix".inarhora to "public" as "informix";
grant update on "informix".inarhora to "public" as "informix";
grant insert on "informix".inarhora to "public" as "informix";
grant delete on "informix".inarhora to "public" as "informix";
grant index on "informix".inarhora to "public" as "informix";
grant select on "informix".confacele to "public" as "informix";
grant update on "informix".confacele to "public" as "informix";
grant insert on "informix".confacele to "public" as "informix";
grant delete on "informix".confacele to "public" as "informix";
grant index on "informix".confacele to "public" as "informix";
grant select on "informix".factu_cance to "public" as "informix";
grant update on "informix".factu_cance to "public" as "informix";
grant insert on "informix".factu_cance to "public" as "informix";
grant delete on "informix".factu_cance to "public" as "informix";
grant index on "informix".factu_cance to "public" as "informix";
grant select on "informix".temp_facan to "public" as "informix";
grant update on "informix".temp_facan to "public" as "informix";
grant insert on "informix".temp_facan to "public" as "informix";
grant delete on "informix".temp_facan to "public" as "informix";
grant index on "informix".temp_facan to "public" as "informix";
grant select on "informix".relcance to "public" as "informix";
grant update on "informix".relcance to "public" as "informix";
grant insert on "informix".relcance to "public" as "informix";
grant delete on "informix".relcance to "public" as "informix";
grant index on "informix".relcance to "public" as "informix";
grant select on "informix".folios to "public" as "informix";
grant update on "informix".folios to "public" as "informix";
grant insert on "informix".folios to "public" as "informix";
grant delete on "informix".folios to "public" as "informix";
grant index on "informix".folios to "public" as "informix";
grant select on "informix".deta_cte to "public" as "informix";
grant update on "informix".deta_cte to "public" as "informix";
grant insert on "informix".deta_cte to "public" as "informix";
grant delete on "informix".deta_cte to "public" as "informix";
grant index on "informix".deta_cte to "public" as "informix";
grant select on "informix".inarcl99 to "public" as "informix";
grant update on "informix".inarcl99 to "public" as "informix";
grant insert on "informix".inarcl99 to "public" as "informix";
grant delete on "informix".inarcl99 to "public" as "informix";
grant index on "informix".inarcl99 to "public" as "informix";
grant select on "informix".copiascli to "public" as "informix";
grant update on "informix".copiascli to "public" as "informix";
grant insert on "informix".copiascli to "public" as "informix";
grant delete on "informix".copiascli to "public" as "informix";
grant index on "informix".copiascli to "public" as "informix";
grant select on "informix".motivo to "public" as "informix";
grant update on "informix".motivo to "public" as "informix";
grant insert on "informix".motivo to "public" as "informix";
grant delete on "informix".motivo to "public" as "informix";
grant index on "informix".motivo to "public" as "informix";
grant select on "informix".con_correo to "public" as "informix";
grant update on "informix".con_correo to "public" as "informix";
grant insert on "informix".con_correo to "public" as "informix";
grant delete on "informix".con_correo to "public" as "informix";
grant index on "informix".con_correo to "public" as "informix";
grant select on "informix".inarinv2 to "public" as "informix";
grant update on "informix".inarinv2 to "public" as "informix";
grant insert on "informix".inarinv2 to "public" as "informix";
grant delete on "informix".inarinv2 to "public" as "informix";
grant index on "informix".inarinv2 to "public" as "informix";
grant select on "informix".inartrinv2 to "public" as "informix";
grant update on "informix".inartrinv2 to "public" as "informix";
grant insert on "informix".inartrinv2 to "public" as "informix";
grant delete on "informix".inartrinv2 to "public" as "informix";
grant index on "informix".inartrinv2 to "public" as "informix";
grant select on "informix".tmp_entra to "public" as "informix";
grant update on "informix".tmp_entra to "public" as "informix";
grant insert on "informix".tmp_entra to "public" as "informix";
grant delete on "informix".tmp_entra to "public" as "informix";
grant index on "informix".tmp_entra to "public" as "informix";
grant select on "informix".tmp_sale to "public" as "informix";
grant update on "informix".tmp_sale to "public" as "informix";
grant insert on "informix".tmp_sale to "public" as "informix";
grant delete on "informix".tmp_sale to "public" as "informix";
grant index on "informix".tmp_sale to "public" as "informix";
grant select on "informix".consinv2 to "public" as "informix";
grant update on "informix".consinv2 to "public" as "informix";
grant insert on "informix".consinv2 to "public" as "informix";
grant delete on "informix".consinv2 to "public" as "informix";
grant index on "informix".consinv2 to "public" as "informix";
grant select on "informix".abonos_new to "public" as "informix";
grant update on "informix".abonos_new to "public" as "informix";
grant insert on "informix".abonos_new to "public" as "informix";
grant delete on "informix".abonos_new to "public" as "informix";
grant index on "informix".abonos_new to "public" as "informix";
grant select on "informix".revisa_abono to "public" as "informix";
grant update on "informix".revisa_abono to "public" as "informix";
grant insert on "informix".revisa_abono to "public" as "informix";
grant delete on "informix".revisa_abono to "public" as "informix";
grant index on "informix".revisa_abono to "public" as "informix";
grant select on "informix".neze_cabe to "public" as "informix";
grant update on "informix".neze_cabe to "public" as "informix";
grant insert on "informix".neze_cabe to "public" as "informix";
grant delete on "informix".neze_cabe to "public" as "informix";
grant index on "informix".neze_cabe to "public" as "informix";
grant select on "informix".neze_porce to "public" as "informix";
grant update on "informix".neze_porce to "public" as "informix";
grant insert on "informix".neze_porce to "public" as "informix";
grant delete on "informix".neze_porce to "public" as "informix";
grant index on "informix".neze_porce to "public" as "informix";
grant select on "informix".neze_deta to "public" as "informix";
grant update on "informix".neze_deta to "public" as "informix";
grant insert on "informix".neze_deta to "public" as "informix";
grant delete on "informix".neze_deta to "public" as "informix";
grant index on "informix".neze_deta to "public" as "informix";
grant select on "informix".sat to "public" as "informix";
grant update on "informix".sat to "public" as "informix";
grant insert on "informix".sat to "public" as "informix";
grant delete on "informix".sat to "public" as "informix";
grant index on "informix".sat to "public" as "informix";
grant select on "informix".rela_sal to "public" as "informix";
grant update on "informix".rela_sal to "public" as "informix";
grant insert on "informix".rela_sal to "public" as "informix";
grant delete on "informix".rela_sal to "public" as "informix";
grant index on "informix".rela_sal to "public" as "informix";
grant select on "informix".tipo_pago to "public" as "informix";
grant update on "informix".tipo_pago to "public" as "informix";
grant insert on "informix".tipo_pago to "public" as "informix";
grant delete on "informix".tipo_pago to "public" as "informix";
grant index on "informix".tipo_pago to "public" as "informix";
grant select on "informix".rel_tipo_pago to "public" as "informix";
grant update on "informix".rel_tipo_pago to "public" as "informix";
grant insert on "informix".rel_tipo_pago to "public" as "informix";
grant delete on "informix".rel_tipo_pago to "public" as "informix";
grant index on "informix".rel_tipo_pago to "public" as "informix";
grant select on "informix".tmp_errorneze to "public" as "informix";
grant update on "informix".tmp_errorneze to "public" as "informix";
grant insert on "informix".tmp_errorneze to "public" as "informix";
grant delete on "informix".tmp_errorneze to "public" as "informix";
grant index on "informix".tmp_errorneze to "public" as "informix";
grant select on "informix".compras to "public" as "informix";
grant update on "informix".compras to "public" as "informix";
grant insert on "informix".compras to "public" as "informix";
grant delete on "informix".compras to "public" as "informix";
grant index on "informix".compras to "public" as "informix";
grant select on "informix".respa_docu to "public" as "informix";
grant update on "informix".respa_docu to "public" as "informix";
grant insert on "informix".respa_docu to "public" as "informix";
grant delete on "informix".respa_docu to "public" as "informix";
grant index on "informix".respa_docu to "public" as "informix";
grant select on "informix".db to "public" as "informix";
grant update on "informix".db to "public" as "informix";
grant insert on "informix".db to "public" as "informix";
grant delete on "informix".db to "public" as "informix";
grant index on "informix".db to "public" as "informix";
grant select on "informix".documento to "public" as "informix";
grant update on "informix".documento to "public" as "informix";
grant insert on "informix".documento to "public" as "informix";
grant delete on "informix".documento to "public" as "informix";
grant index on "informix".documento to "public" as "informix";
grant select on "informix".temporcom to "public" as "informix";
grant update on "informix".temporcom to "public" as "informix";
grant insert on "informix".temporcom to "public" as "informix";
grant delete on "informix".temporcom to "public" as "informix";
grant index on "informix".temporcom to "public" as "informix";
grant select on "informix".tmp_pago to "public" as "informix";
grant update on "informix".tmp_pago to "public" as "informix";
grant insert on "informix".tmp_pago to "public" as "informix";
grant delete on "informix".tmp_pago to "public" as "informix";
grant index on "informix".tmp_pago to "public" as "informix";
grant select on "informix".tmp_vpf to "public" as "informix";
grant update on "informix".tmp_vpf to "public" as "informix";
grant insert on "informix".tmp_vpf to "public" as "informix";
grant delete on "informix".tmp_vpf to "public" as "informix";
grant index on "informix".tmp_vpf to "public" as "informix";
grant select on "informix".cod_sori to "public" as "informix";
grant update on "informix".cod_sori to "public" as "informix";
grant insert on "informix".cod_sori to "public" as "informix";
grant delete on "informix".cod_sori to "public" as "informix";
grant index on "informix".cod_sori to "public" as "informix";
grant select on "informix".temp_impre to "public" as "informix";
grant update on "informix".temp_impre to "public" as "informix";
grant insert on "informix".temp_impre to "public" as "informix";
grant delete on "informix".temp_impre to "public" as "informix";
grant index on "informix".temp_impre to "public" as "informix";
grant select on "informix".ieps to "public" as "informix";
grant update on "informix".ieps to "public" as "informix";
grant insert on "informix".ieps to "public" as "informix";
grant delete on "informix".ieps to "public" as "informix";
grant index on "informix".ieps to "public" as "informix";
grant select on "informix".deta_ieps to "public" as "informix";
grant update on "informix".deta_ieps to "public" as "informix";
grant insert on "informix".deta_ieps to "public" as "informix";
grant delete on "informix".deta_ieps to "public" as "informix";
grant index on "informix".deta_ieps to "public" as "informix";
grant select on "informix".tran_prov to "public" as "informix";
grant update on "informix".tran_prov to "public" as "informix";
grant insert on "informix".tran_prov to "public" as "informix";
grant delete on "informix".tran_prov to "public" as "informix";
grant index on "informix".tran_prov to "public" as "informix";
grant select on "informix".tmp_cli to "public" as "informix";
grant update on "informix".tmp_cli to "public" as "informix";
grant insert on "informix".tmp_cli to "public" as "informix";
grant delete on "informix".tmp_cli to "public" as "informix";
grant index on "informix".tmp_cli to "public" as "informix";
grant select on "informix".temp_pref to "public" as "informix";
grant update on "informix".temp_pref to "public" as "informix";
grant insert on "informix".temp_pref to "public" as "informix";
grant delete on "informix".temp_pref to "public" as "informix";
grant index on "informix".temp_pref to "public" as "informix";
grant select on "informix".revi_rfc to "public" as "informix";
grant update on "informix".revi_rfc to "public" as "informix";
grant insert on "informix".revi_rfc to "public" as "informix";
grant delete on "informix".revi_rfc to "public" as "informix";
grant index on "informix".revi_rfc to "public" as "informix";
grant select on "informix".neze_por to "public" as "informix";
grant update on "informix".neze_por to "public" as "informix";
grant insert on "informix".neze_por to "public" as "informix";
grant delete on "informix".neze_por to "public" as "informix";
grant index on "informix".neze_por to "public" as "informix";
grant select on "informix".tmp_vtasacum to "public" as "informix";
grant update on "informix".tmp_vtasacum to "public" as "informix";
grant insert on "informix".tmp_vtasacum to "public" as "informix";
grant delete on "informix".tmp_vtasacum to "public" as "informix";
grant index on "informix".tmp_vtasacum to "public" as "informix";
grant select on "informix".repsemana to "public" as "informix";
grant update on "informix".repsemana to "public" as "informix";
grant insert on "informix".repsemana to "public" as "informix";
grant delete on "informix".repsemana to "public" as "informix";
grant index on "informix".repsemana to "public" as "informix";
grant select on "informix".contra to "public" as "informix";
grant update on "informix".contra to "public" as "informix";
grant insert on "informix".contra to "public" as "informix";
grant delete on "informix".contra to "public" as "informix";
grant index on "informix".contra to "public" as "informix";
grant select on "informix".cod_menudeo to "public" as "informix";
grant update on "informix".cod_menudeo to "public" as "informix";
grant insert on "informix".cod_menudeo to "public" as "informix";
grant delete on "informix".cod_menudeo to "public" as "informix";
grant index on "informix".cod_menudeo to "public" as "informix";
grant select on "informix".recontra to "public" as "informix";
grant update on "informix".recontra to "public" as "informix";
grant insert on "informix".recontra to "public" as "informix";
grant delete on "informix".recontra to "public" as "informix";
grant index on "informix".recontra to "public" as "informix";
grant select on "informix".caja_menudeo to "public" as "informix";
grant update on "informix".caja_menudeo to "public" as "informix";
grant insert on "informix".caja_menudeo to "public" as "informix";
grant delete on "informix".caja_menudeo to "public" as "informix";
grant index on "informix".caja_menudeo to "public" as "informix";
grant select on "informix".revi_inve to "public" as "informix";
grant update on "informix".revi_inve to "public" as "informix";
grant insert on "informix".revi_inve to "public" as "informix";
grant delete on "informix".revi_inve to "public" as "informix";
grant index on "informix".revi_inve to "public" as "informix";
grant select on "informix".plazo_venc to "public" as "informix";
grant update on "informix".plazo_venc to "public" as "informix";
grant insert on "informix".plazo_venc to "public" as "informix";
grant delete on "informix".plazo_venc to "public" as "informix";
grant index on "informix".plazo_venc to "public" as "informix";
grant select on "informix".difeinve to "public" as "informix";
grant update on "informix".difeinve to "public" as "informix";
grant insert on "informix".difeinve to "public" as "informix";
grant delete on "informix".difeinve to "public" as "informix";
grant index on "informix".difeinve to "public" as "informix";
grant select on "informix".torrey to "public" as "informix";
grant update on "informix".torrey to "public" as "informix";
grant insert on "informix".torrey to "public" as "informix";
grant delete on "informix".torrey to "public" as "informix";
grant index on "informix".torrey to "public" as "informix";
grant select on "informix".uuid to "public" as "informix";
grant update on "informix".uuid to "public" as "informix";
grant insert on "informix".uuid to "public" as "informix";
grant delete on "informix".uuid to "public" as "informix";
grant index on "informix".uuid to "public" as "informix";
grant select on "informix".usocfdi to "public" as "informix";
grant update on "informix".usocfdi to "public" as "informix";
grant insert on "informix".usocfdi to "public" as "informix";
grant delete on "informix".usocfdi to "public" as "informix";
grant index on "informix".usocfdi to "public" as "informix";
grant select on "informix".uso_ctes_cfdi to "public" as "informix";
grant update on "informix".uso_ctes_cfdi to "public" as "informix";
grant insert on "informix".uso_ctes_cfdi to "public" as "informix";
grant delete on "informix".uso_ctes_cfdi to "public" as "informix";
grant index on "informix".uso_ctes_cfdi to "public" as "informix";
grant select on "informix".ieps_inarcot1 to "public" as "informix";
grant update on "informix".ieps_inarcot1 to "public" as "informix";
grant insert on "informix".ieps_inarcot1 to "public" as "informix";
grant delete on "informix".ieps_inarcot1 to "public" as "informix";
grant index on "informix".ieps_inarcot1 to "public" as "informix";
grant select on "informix".ieps_vtas to "public" as "informix";
grant update on "informix".ieps_vtas to "public" as "informix";
grant insert on "informix".ieps_vtas to "public" as "informix";
grant delete on "informix".ieps_vtas to "public" as "informix";
grant index on "informix".ieps_vtas to "public" as "informix";
grant select on "informix".tmpsatpa to "public" as "informix";
grant update on "informix".tmpsatpa to "public" as "informix";
grant insert on "informix".tmpsatpa to "public" as "informix";
grant delete on "informix".tmpsatpa to "public" as "informix";
grant index on "informix".tmpsatpa to "public" as "informix";
grant select on "informix".tmp_pago_sat to "public" as "informix";
grant update on "informix".tmp_pago_sat to "public" as "informix";
grant insert on "informix".tmp_pago_sat to "public" as "informix";
grant delete on "informix".tmp_pago_sat to "public" as "informix";
grant index on "informix".tmp_pago_sat to "public" as "informix";
grant select on "informix".cod_sat to "public" as "informix";
grant update on "informix".cod_sat to "public" as "informix";
grant insert on "informix".cod_sat to "public" as "informix";
grant delete on "informix".cod_sat to "public" as "informix";
grant index on "informix".cod_sat to "public" as "informix";
grant select on "informix".tmp_tarjeta to "public" as "informix";
grant update on "informix".tmp_tarjeta to "public" as "informix";
grant insert on "informix".tmp_tarjeta to "public" as "informix";
grant delete on "informix".tmp_tarjeta to "public" as "informix";
grant index on "informix".tmp_tarjeta to "public" as "informix";
grant select on "informix".ieps_dev to "public" as "informix";
grant update on "informix".ieps_dev to "public" as "informix";
grant insert on "informix".ieps_dev to "public" as "informix";
grant delete on "informix".ieps_dev to "public" as "informix";
grant index on "informix".ieps_dev to "public" as "informix";
grant select on "informix".iepstrcl to "public" as "informix";
grant update on "informix".iepstrcl to "public" as "informix";
grant insert on "informix".iepstrcl to "public" as "informix";
grant delete on "informix".iepstrcl to "public" as "informix";
grant index on "informix".iepstrcl to "public" as "informix";
grant select on "informix".ieps_pcl to "public" as "informix";
grant update on "informix".ieps_pcl to "public" as "informix";
grant insert on "informix".ieps_pcl to "public" as "informix";
grant delete on "informix".ieps_pcl to "public" as "informix";
grant index on "informix".ieps_pcl to "public" as "informix";
grant select on "informix".iepstrcl1 to "public" as "informix";
grant update on "informix".iepstrcl1 to "public" as "informix";
grant insert on "informix".iepstrcl1 to "public" as "informix";
grant delete on "informix".iepstrcl1 to "public" as "informix";
grant index on "informix".iepstrcl1 to "public" as "informix";
grant select on "informix".ieps_pchdev to "public" as "informix";
grant update on "informix".ieps_pchdev to "public" as "informix";
grant insert on "informix".ieps_pchdev to "public" as "informix";
grant delete on "informix".ieps_pchdev to "public" as "informix";
grant index on "informix".ieps_pchdev to "public" as "informix";
grant select on "informix".inartrinv to "public" as "informix";
grant update on "informix".inartrinv to "public" as "informix";
grant insert on "informix".inartrinv to "public" as "informix";
grant delete on "informix".inartrinv to "public" as "informix";
grant index on "informix".inartrinv to "public" as "informix";
grant select on "informix".ieps_ppr to "public" as "informix";
grant update on "informix".ieps_ppr to "public" as "informix";
grant insert on "informix".ieps_ppr to "public" as "informix";
grant delete on "informix".ieps_ppr to "public" as "informix";
grant index on "informix".ieps_ppr to "public" as "informix";
grant select on "informix".iepstrpr to "public" as "informix";
grant update on "informix".iepstrpr to "public" as "informix";
grant insert on "informix".iepstrpr to "public" as "informix";
grant delete on "informix".iepstrpr to "public" as "informix";
grant index on "informix".iepstrpr to "public" as "informix";
grant select on "informix".iepstrpr1 to "public" as "informix";
grant update on "informix".iepstrpr1 to "public" as "informix";
grant insert on "informix".iepstrpr1 to "public" as "informix";
grant delete on "informix".iepstrpr1 to "public" as "informix";
grant index on "informix".iepstrpr1 to "public" as "informix";
grant select on "informix".pago_sat to "public" as "informix";
grant update on "informix".pago_sat to "public" as "informix";
grant insert on "informix".pago_sat to "public" as "informix";
grant delete on "informix".pago_sat to "public" as "informix";
grant index on "informix".pago_sat to "public" as "informix";
grant select on "informix".sat_bancos to "public" as "informix";
grant update on "informix".sat_bancos to "public" as "informix";
grant insert on "informix".sat_bancos to "public" as "informix";
grant delete on "informix".sat_bancos to "public" as "informix";
grant index on "informix".sat_bancos to "public" as "informix";
grant select on "informix".cod_rest_may to "public" as "informix";
grant update on "informix".cod_rest_may to "public" as "informix";
grant insert on "informix".cod_rest_may to "public" as "informix";
grant delete on "informix".cod_rest_may to "public" as "informix";
grant index on "informix".cod_rest_may to "public" as "informix";
grant select on "informix".uuidno to "public" as "informix";
grant update on "informix".uuidno to "public" as "informix";
grant insert on "informix".uuidno to "public" as "informix";
grant delete on "informix".uuidno to "public" as "informix";
grant index on "informix".uuidno to "public" as "informix";
grant select on "informix".mayoreo to "public" as "informix";
grant update on "informix".mayoreo to "public" as "informix";
grant insert on "informix".mayoreo to "public" as "informix";
grant delete on "informix".mayoreo to "public" as "informix";
grant index on "informix".mayoreo to "public" as "informix";
grant select on "informix".menudeo to "public" as "informix";
grant update on "informix".menudeo to "public" as "informix";
grant insert on "informix".menudeo to "public" as "informix";
grant delete on "informix".menudeo to "public" as "informix";
grant index on "informix".menudeo to "public" as "informix";
grant select on "informix".cod_rest_men to "public" as "informix";
grant update on "informix".cod_rest_men to "public" as "informix";
grant insert on "informix".cod_rest_men to "public" as "informix";
grant delete on "informix".cod_rest_men to "public" as "informix";
grant index on "informix".cod_rest_men to "public" as "informix";
grant select on "informix".timbrar to "public" as "informix";
grant update on "informix".timbrar to "public" as "informix";
grant insert on "informix".timbrar to "public" as "informix";
grant delete on "informix".timbrar to "public" as "informix";
grant index on "informix".timbrar to "public" as "informix";
grant select on "informix".solo_sat to "public" as "informix";
grant update on "informix".solo_sat to "public" as "informix";
grant insert on "informix".solo_sat to "public" as "informix";
grant delete on "informix".solo_sat to "public" as "informix";
grant index on "informix".solo_sat to "public" as "informix";
grant select on "informix".ieps_vtapro to "public" as "informix";
grant update on "informix".ieps_vtapro to "public" as "informix";
grant insert on "informix".ieps_vtapro to "public" as "informix";
grant delete on "informix".ieps_vtapro to "public" as "informix";
grant index on "informix".ieps_vtapro to "public" as "informix";
grant select on "informix".no_esta_sat to "public" as "informix";
grant update on "informix".no_esta_sat to "public" as "informix";
grant insert on "informix".no_esta_sat to "public" as "informix";
grant delete on "informix".no_esta_sat to "public" as "informix";
grant index on "informix".no_esta_sat to "public" as "informix";
grant select on "informix".no_esta_col to "public" as "informix";
grant update on "informix".no_esta_col to "public" as "informix";
grant insert on "informix".no_esta_col to "public" as "informix";
grant delete on "informix".no_esta_col to "public" as "informix";
grant index on "informix".no_esta_col to "public" as "informix";
grant select on "informix".no_esta_uuid to "public" as "informix";
grant update on "informix".no_esta_uuid to "public" as "informix";
grant insert on "informix".no_esta_uuid to "public" as "informix";
grant delete on "informix".no_esta_uuid to "public" as "informix";
grant index on "informix".no_esta_uuid to "public" as "informix";
grant select on "informix".deta_men to "public" as "informix";
grant update on "informix".deta_men to "public" as "informix";
grant insert on "informix".deta_men to "public" as "informix";
grant delete on "informix".deta_men to "public" as "informix";
grant index on "informix".deta_men to "public" as "informix";
grant select on "informix".cabe_men to "public" as "informix";
grant update on "informix".cabe_men to "public" as "informix";
grant insert on "informix".cabe_men to "public" as "informix";
grant delete on "informix".cabe_men to "public" as "informix";
grant index on "informix".cabe_men to "public" as "informix";
grant select on "informix".iepsdevcom to "public" as "informix";
grant update on "informix".iepsdevcom to "public" as "informix";
grant insert on "informix".iepsdevcom to "public" as "informix";
grant delete on "informix".iepsdevcom to "public" as "informix";
grant index on "informix".iepsdevcom to "public" as "informix";
grant select on "informix".cab_tab to "public" as "informix";
grant update on "informix".cab_tab to "public" as "informix";
grant insert on "informix".cab_tab to "public" as "informix";
grant delete on "informix".cab_tab to "public" as "informix";
grant index on "informix".cab_tab to "public" as "informix";
grant select on "informix".deta_tab to "public" as "informix";
grant update on "informix".deta_tab to "public" as "informix";
grant insert on "informix".deta_tab to "public" as "informix";
grant delete on "informix".deta_tab to "public" as "informix";
grant index on "informix".deta_tab to "public" as "informix";
grant select on "informix".conv_inve to "public" as "informix";
grant update on "informix".conv_inve to "public" as "informix";
grant insert on "informix".conv_inve to "public" as "informix";
grant delete on "informix".conv_inve to "public" as "informix";
grant index on "informix".conv_inve to "public" as "informix";
grant select on "informix".contaven to "public" as "informix";
grant update on "informix".contaven to "public" as "informix";
grant insert on "informix".contaven to "public" as "informix";
grant delete on "informix".contaven to "public" as "informix";
grant index on "informix".contaven to "public" as "informix";
grant select on "informix".tmp_ieps to "public" as "informix";
grant update on "informix".tmp_ieps to "public" as "informix";
grant insert on "informix".tmp_ieps to "public" as "informix";
grant delete on "informix".tmp_ieps to "public" as "informix";
grant index on "informix".tmp_ieps to "public" as "informix";
grant select on "informix".salida_alm to "public" as "informix";
grant update on "informix".salida_alm to "public" as "informix";
grant insert on "informix".salida_alm to "public" as "informix";
grant delete on "informix".salida_alm to "public" as "informix";
grant index on "informix".salida_alm to "public" as "informix";
grant select on "informix".cat_salida to "public" as "informix";
grant update on "informix".cat_salida to "public" as "informix";
grant insert on "informix".cat_salida to "public" as "informix";
grant delete on "informix".cat_salida to "public" as "informix";
grant index on "informix".cat_salida to "public" as "informix";
grant select on "informix".salimod1 to "public" as "informix";
grant update on "informix".salimod1 to "public" as "informix";
grant insert on "informix".salimod1 to "public" as "informix";
grant delete on "informix".salimod1 to "public" as "informix";
grant index on "informix".salimod1 to "public" as "informix";
grant select on "informix".salimod2 to "public" as "informix";
grant update on "informix".salimod2 to "public" as "informix";
grant insert on "informix".salimod2 to "public" as "informix";
grant delete on "informix".salimod2 to "public" as "informix";
grant index on "informix".salimod2 to "public" as "informix";
grant select on "informix".restaurant to "public" as "informix";
grant update on "informix".restaurant to "public" as "informix";
grant insert on "informix".restaurant to "public" as "informix";
grant delete on "informix".restaurant to "public" as "informix";
grant index on "informix".restaurant to "public" as "informix";
grant select on "informix".cod_rest to "public" as "informix";
grant update on "informix".cod_rest to "public" as "informix";
grant insert on "informix".cod_rest to "public" as "informix";
grant delete on "informix".cod_rest to "public" as "informix";
grant index on "informix".cod_rest to "public" as "informix";
grant select on "informix".sucu_oxxo to "public" as "informix";
grant update on "informix".sucu_oxxo to "public" as "informix";
grant insert on "informix".sucu_oxxo to "public" as "informix";
grant delete on "informix".sucu_oxxo to "public" as "informix";
grant index on "informix".sucu_oxxo to "public" as "informix";
grant select on "informix".salimod3 to "public" as "informix";
grant update on "informix".salimod3 to "public" as "informix";
grant insert on "informix".salimod3 to "public" as "informix";
grant delete on "informix".salimod3 to "public" as "informix";
grant index on "informix".salimod3 to "public" as "informix";
grant select on "informix".salimod4 to "public" as "informix";
grant update on "informix".salimod4 to "public" as "informix";
grant insert on "informix".salimod4 to "public" as "informix";
grant delete on "informix".salimod4 to "public" as "informix";
grant index on "informix".salimod4 to "public" as "informix";
grant select on "informix".imp_cajas to "public" as "informix";
grant update on "informix".imp_cajas to "public" as "informix";
grant insert on "informix".imp_cajas to "public" as "informix";
grant delete on "informix".imp_cajas to "public" as "informix";
grant index on "informix".imp_cajas to "public" as "informix";
grant select on "informix".salida_almdet to "public" as "informix";
grant update on "informix".salida_almdet to "public" as "informix";
grant insert on "informix".salida_almdet to "public" as "informix";
grant delete on "informix".salida_almdet to "public" as "informix";
grant index on "informix".salida_almdet to "public" as "informix";
grant select on "informix".imp_rela to "public" as "informix";
grant update on "informix".imp_rela to "public" as "informix";
grant insert on "informix".imp_rela to "public" as "informix";
grant delete on "informix".imp_rela to "public" as "informix";
grant index on "informix".imp_rela to "public" as "informix";
grant select on "informix".caja_mayoreo to "public" as "informix";
grant update on "informix".caja_mayoreo to "public" as "informix";
grant insert on "informix".caja_mayoreo to "public" as "informix";
grant delete on "informix".caja_mayoreo to "public" as "informix";
grant index on "informix".caja_mayoreo to "public" as "informix";
grant select on "informix".cod_may to "public" as "informix";
grant update on "informix".cod_may to "public" as "informix";
grant insert on "informix".cod_may to "public" as "informix";
grant delete on "informix".cod_may to "public" as "informix";
grant index on "informix".cod_may to "public" as "informix";
grant select on "informix".cod_men to "public" as "informix";
grant update on "informix".cod_men to "public" as "informix";
grant insert on "informix".cod_men to "public" as "informix";
grant delete on "informix".cod_men to "public" as "informix";
grant index on "informix".cod_men to "public" as "informix";
grant select on "informix".usatableta to "public" as "informix";
grant update on "informix".usatableta to "public" as "informix";
grant insert on "informix".usatableta to "public" as "informix";
grant delete on "informix".usatableta to "public" as "informix";
grant index on "informix".usatableta to "public" as "informix";
grant select on "informix".descto_ctes to "public" as "informix";
grant update on "informix".descto_ctes to "public" as "informix";
grant insert on "informix".descto_ctes to "public" as "informix";
grant delete on "informix".descto_ctes to "public" as "informix";
grant index on "informix".descto_ctes to "public" as "informix";
grant select on "informix".tmp_oxxo to "public" as "informix";
grant update on "informix".tmp_oxxo to "public" as "informix";
grant insert on "informix".tmp_oxxo to "public" as "informix";
grant delete on "informix".tmp_oxxo to "public" as "informix";
grant index on "informix".tmp_oxxo to "public" as "informix";
grant select on "informix".borrarvtas to "public" as "informix";
grant update on "informix".borrarvtas to "public" as "informix";
grant insert on "informix".borrarvtas to "public" as "informix";
grant delete on "informix".borrarvtas to "public" as "informix";
grant index on "informix".borrarvtas to "public" as "informix";
grant select on "informix".equivale to "public" as "informix";
grant update on "informix".equivale to "public" as "informix";
grant insert on "informix".equivale to "public" as "informix";
grant delete on "informix".equivale to "public" as "informix";
grant index on "informix".equivale to "public" as "informix";
grant select on "informix".tmp_pedido to "public" as "informix";
grant update on "informix".tmp_pedido to "public" as "informix";
grant insert on "informix".tmp_pedido to "public" as "informix";
grant delete on "informix".tmp_pedido to "public" as "informix";
grant index on "informix".tmp_pedido to "public" as "informix";
grant select on "informix".tmp_uuid2 to "public" as "informix";
grant update on "informix".tmp_uuid2 to "public" as "informix";
grant insert on "informix".tmp_uuid2 to "public" as "informix";
grant delete on "informix".tmp_uuid2 to "public" as "informix";
grant index on "informix".tmp_uuid2 to "public" as "informix";
grant select on "informix".sd_normal to "public" as "informix";
grant update on "informix".sd_normal to "public" as "informix";
grant insert on "informix".sd_normal to "public" as "informix";
grant delete on "informix".sd_normal to "public" as "informix";
grant index on "informix".sd_normal to "public" as "informix";
grant select on "informix".subeinv to "public" as "informix";
grant update on "informix".subeinv to "public" as "informix";
grant insert on "informix".subeinv to "public" as "informix";
grant delete on "informix".subeinv to "public" as "informix";
grant index on "informix".subeinv to "public" as "informix";
grant select on "informix".factuoxxo to "public" as "informix";
grant update on "informix".factuoxxo to "public" as "informix";
grant insert on "informix".factuoxxo to "public" as "informix";
grant delete on "informix".factuoxxo to "public" as "informix";
grant index on "informix".factuoxxo to "public" as "informix";
grant select on "informix".regimen to "public" as "informix";
grant update on "informix".regimen to "public" as "informix";
grant insert on "informix".regimen to "public" as "informix";
grant delete on "informix".regimen to "public" as "informix";
grant index on "informix".regimen to "public" as "informix";
grant select on "informix".tmp_agua to "public" as "informix";
grant update on "informix".tmp_agua to "public" as "informix";
grant insert on "informix".tmp_agua to "public" as "informix";
grant delete on "informix".tmp_agua to "public" as "informix";
grant index on "informix".tmp_agua to "public" as "informix";
grant select on "informix".cod_agua to "public" as "informix";
grant update on "informix".cod_agua to "public" as "informix";
grant insert on "informix".cod_agua to "public" as "informix";
grant delete on "informix".cod_agua to "public" as "informix";
grant index on "informix".cod_agua to "public" as "informix";
grant select on "informix".tmp_aguacate to "public" as "informix";
grant update on "informix".tmp_aguacate to "public" as "informix";
grant insert on "informix".tmp_aguacate to "public" as "informix";
grant delete on "informix".tmp_aguacate to "public" as "informix";
grant index on "informix".tmp_aguacate to "public" as "informix";
grant select on "informix".terminal to "public" as "informix";
grant update on "informix".terminal to "public" as "informix";
grant insert on "informix".terminal to "public" as "informix";
grant delete on "informix".terminal to "public" as "informix";
grant index on "informix".terminal to "public" as "informix";
grant select on "informix".tmp_terminal to "public" as "informix";
grant update on "informix".tmp_terminal to "public" as "informix";
grant insert on "informix".tmp_terminal to "public" as "informix";
grant delete on "informix".tmp_terminal to "public" as "informix";
grant index on "informix".tmp_terminal to "public" as "informix";
grant select on "informix".audita to "public" as "informix";
grant update on "informix".audita to "public" as "informix";
grant insert on "informix".audita to "public" as "informix";
grant delete on "informix".audita to "public" as "informix";
grant index on "informix".audita to "public" as "informix";
grant select on "informix".guardauuid to "public" as "informix";
grant update on "informix".guardauuid to "public" as "informix";
grant insert on "informix".guardauuid to "public" as "informix";
grant delete on "informix".guardauuid to "public" as "informix";
grant index on "informix".guardauuid to "public" as "informix";
grant select on "informix".concentra to "public" as "informix";
grant update on "informix".concentra to "public" as "informix";
grant insert on "informix".concentra to "public" as "informix";
grant delete on "informix".concentra to "public" as "informix";
grant index on "informix".concentra to "public" as "informix";
grant select on "informix".conce_doc to "public" as "informix";
grant update on "informix".conce_doc to "public" as "informix";
grant insert on "informix".conce_doc to "public" as "informix";
grant delete on "informix".conce_doc to "public" as "informix";
grant index on "informix".conce_doc to "public" as "informix";
grant select on "informix".oxxo_sucu to "public" as "informix";
grant update on "informix".oxxo_sucu to "public" as "informix";
grant insert on "informix".oxxo_sucu to "public" as "informix";
grant delete on "informix".oxxo_sucu to "public" as "informix";
grant index on "informix".oxxo_sucu to "public" as "informix";
grant select on "informix".cam_plazo to "public" as "informix";
grant update on "informix".cam_plazo to "public" as "informix";
grant insert on "informix".cam_plazo to "public" as "informix";
grant delete on "informix".cam_plazo to "public" as "informix";
grant index on "informix".cam_plazo to "public" as "informix";
grant select on "informix".tableta to "public" as "informix";
grant update on "informix".tableta to "public" as "informix";
grant insert on "informix".tableta to "public" as "informix";
grant delete on "informix".tableta to "public" as "informix";
grant index on "informix".tableta to "public" as "informix";
grant select on "informix".listaprecios to "public" as "informix";
grant update on "informix".listaprecios to "public" as "informix";
grant insert on "informix".listaprecios to "public" as "informix";
grant delete on "informix".listaprecios to "public" as "informix";
grant index on "informix".listaprecios to "public" as "informix";
grant select on "informix".historicolistpre to "public" as "informix";
grant update on "informix".historicolistpre to "public" as "informix";
grant insert on "informix".historicolistpre to "public" as "informix";
grant delete on "informix".historicolistpre to "public" as "informix";
grant index on "informix".historicolistpre to "public" as "informix";
grant select on "informix".log_cambioprecios to "public" as "informix";
grant update on "informix".log_cambioprecios to "public" as "informix";
grant insert on "informix".log_cambioprecios to "public" as "informix";
grant delete on "informix".log_cambioprecios to "public" as "informix";
grant index on "informix".log_cambioprecios to "public" as "informix";
grant select on "informix".log_validaprecios to "public" as "informix";
grant update on "informix".log_validaprecios to "public" as "informix";
grant insert on "informix".log_validaprecios to "public" as "informix";
grant delete on "informix".log_validaprecios to "public" as "informix";
grant index on "informix".log_validaprecios to "public" as "informix";
grant select on "informix".log_depurafol to "public" as "informix";
grant update on "informix".log_depurafol to "public" as "informix";
grant insert on "informix".log_depurafol to "public" as "informix";
grant delete on "informix".log_depurafol to "public" as "informix";
grant index on "informix".log_depurafol to "public" as "informix";
grant select on "informix".tmp_ventas to "public" as "informix";
grant update on "informix".tmp_ventas to "public" as "informix";
grant insert on "informix".tmp_ventas to "public" as "informix";
grant delete on "informix".tmp_ventas to "public" as "informix";
grant index on "informix".tmp_ventas to "public" as "informix";
grant select on "informix".hist_inartrinv to "public" as "informix";
grant update on "informix".hist_inartrinv to "public" as "informix";
grant insert on "informix".hist_inartrinv to "public" as "informix";
grant delete on "informix".hist_inartrinv to "public" as "informix";
grant index on "informix".hist_inartrinv to "public" as "informix";
grant select on "informix".hist_inarfac to "public" as "informix";
grant update on "informix".hist_inarfac to "public" as "informix";
grant insert on "informix".hist_inarfac to "public" as "informix";
grant delete on "informix".hist_inarfac to "public" as "informix";
grant index on "informix".hist_inarfac to "public" as "informix";
grant select on "informix".hist_inarent to "public" as "informix";
grant update on "informix".hist_inarent to "public" as "informix";
grant insert on "informix".hist_inarent to "public" as "informix";
grant delete on "informix".hist_inarent to "public" as "informix";
grant index on "informix".hist_inarent to "public" as "informix";
grant select on "informix".hist_documento to "public" as "informix";
grant update on "informix".hist_documento to "public" as "informix";
grant insert on "informix".hist_documento to "public" as "informix";
grant delete on "informix".hist_documento to "public" as "informix";
grant index on "informix".hist_documento to "public" as "informix";
grant select on "informix".hist_inarpvt to "public" as "informix";
grant update on "informix".hist_inarpvt to "public" as "informix";
grant insert on "informix".hist_inarpvt to "public" as "informix";
grant delete on "informix".hist_inarpvt to "public" as "informix";
grant index on "informix".hist_inarpvt to "public" as "informix";
grant select on "informix".deta_tableta to "public" as "informix";
grant update on "informix".deta_tableta to "public" as "informix";
grant insert on "informix".deta_tableta to "public" as "informix";
grant delete on "informix".deta_tableta to "public" as "informix";
grant index on "informix".deta_tableta to "public" as "informix";
grant select on "informix".surtidor to "public" as "informix";
grant update on "informix".surtidor to "public" as "informix";
grant insert on "informix".surtidor to "public" as "informix";
grant delete on "informix".surtidor to "public" as "informix";
grant index on "informix".surtidor to "public" as "informix";
grant select on "informix".vendedor to "public" as "informix";
grant update on "informix".vendedor to "public" as "informix";
grant insert on "informix".vendedor to "public" as "informix";
grant delete on "informix".vendedor to "public" as "informix";
grant index on "informix".vendedor to "public" as "informix";
grant select on "informix".tmp_rete to "public" as "informix";
grant update on "informix".tmp_rete to "public" as "informix";
grant insert on "informix".tmp_rete to "public" as "informix";
grant delete on "informix".tmp_rete to "public" as "informix";
grant index on "informix".tmp_rete to "public" as "informix";
grant select on "informix".tmpuuid to "public" as "informix";
grant update on "informix".tmpuuid to "public" as "informix";
grant insert on "informix".tmpuuid to "public" as "informix";
grant delete on "informix".tmpuuid to "public" as "informix";
grant index on "informix".tmpuuid to "public" as "informix";
grant select on "informix".tmphora to "public" as "informix";
grant update on "informix".tmphora to "public" as "informix";
grant insert on "informix".tmphora to "public" as "informix";
grant delete on "informix".tmphora to "public" as "informix";
grant index on "informix".tmphora to "public" as "informix";
grant select on "informix".tmp_uuid to "public" as "informix";
grant update on "informix".tmp_uuid to "public" as "informix";
grant insert on "informix".tmp_uuid to "public" as "informix";
grant delete on "informix".tmp_uuid to "public" as "informix";
grant index on "informix".tmp_uuid to "public" as "informix";
grant select on "informix".tmp_actcosto to "public" as "informix";
grant update on "informix".tmp_actcosto to "public" as "informix";
grant insert on "informix".tmp_actcosto to "public" as "informix";
grant delete on "informix".tmp_actcosto to "public" as "informix";
grant index on "informix".tmp_actcosto to "public" as "informix";
grant select on "informix".tmp_vende to "public" as "informix";
grant update on "informix".tmp_vende to "public" as "informix";
grant insert on "informix".tmp_vende to "public" as "informix";
grant delete on "informix".tmp_vende to "public" as "informix";
grant index on "informix".tmp_vende to "public" as "informix";
grant select on "informix".panta1 to "public" as "informix";
grant update on "informix".panta1 to "public" as "informix";
grant insert on "informix".panta1 to "public" as "informix";
grant delete on "informix".panta1 to "public" as "informix";
grant index on "informix".panta1 to "public" as "informix";
grant select on "informix".autoriza to "public" as "informix";
grant update on "informix".autoriza to "public" as "informix";
grant insert on "informix".autoriza to "public" as "informix";
grant delete on "informix".autoriza to "public" as "informix";
grant index on "informix".autoriza to "public" as "informix";
grant select on "informix".actu_tablet to "public" as "informix";
grant update on "informix".actu_tablet to "public" as "informix";
grant insert on "informix".actu_tablet to "public" as "informix";
grant delete on "informix".actu_tablet to "public" as "informix";
grant index on "informix".actu_tablet to "public" as "informix";
grant select on "informix".recolar to "public" as "informix";
grant update on "informix".recolar to "public" as "informix";
grant insert on "informix".recolar to "public" as "informix";
grant delete on "informix".recolar to "public" as "informix";
grant index on "informix".recolar to "public" as "informix";
grant select on "informix".recolar1 to "public" as "informix";
grant update on "informix".recolar1 to "public" as "informix";
grant insert on "informix".recolar1 to "public" as "informix";
grant delete on "informix".recolar1 to "public" as "informix";
grant index on "informix".recolar1 to "public" as "informix";
grant select on "informix".recolar2 to "public" as "informix";
grant update on "informix".recolar2 to "public" as "informix";
grant insert on "informix".recolar2 to "public" as "informix";
grant delete on "informix".recolar2 to "public" as "informix";
grant index on "informix".recolar2 to "public" as "informix";
grant select on "informix".panta2 to "public" as "informix";
grant update on "informix".panta2 to "public" as "informix";
grant insert on "informix".panta2 to "public" as "informix";
grant delete on "informix".panta2 to "public" as "informix";
grant index on "informix".panta2 to "public" as "informix";
grant select on "informix".recolar3 to "public" as "informix";
grant update on "informix".recolar3 to "public" as "informix";
grant insert on "informix".recolar3 to "public" as "informix";
grant delete on "informix".recolar3 to "public" as "informix";
grant index on "informix".recolar3 to "public" as "informix";
grant select on "informix".recolar4 to "public" as "informix";
grant update on "informix".recolar4 to "public" as "informix";
grant insert on "informix".recolar4 to "public" as "informix";
grant delete on "informix".recolar4 to "public" as "informix";
grant index on "informix".recolar4 to "public" as "informix";
grant select on "informix".recolar5 to "public" as "informix";
grant update on "informix".recolar5 to "public" as "informix";
grant insert on "informix".recolar5 to "public" as "informix";
grant delete on "informix".recolar5 to "public" as "informix";
grant index on "informix".recolar5 to "public" as "informix";
grant select on "informix".panta3 to "public" as "informix";
grant update on "informix".panta3 to "public" as "informix";
grant insert on "informix".panta3 to "public" as "informix";
grant delete on "informix".panta3 to "public" as "informix";
grant index on "informix".panta3 to "public" as "informix";
grant select on "informix".recolar6 to "public" as "informix";
grant update on "informix".recolar6 to "public" as "informix";
grant insert on "informix".recolar6 to "public" as "informix";
grant delete on "informix".recolar6 to "public" as "informix";
grant index on "informix".recolar6 to "public" as "informix";
grant select on "informix".recolar7 to "public" as "informix";
grant update on "informix".recolar7 to "public" as "informix";
grant insert on "informix".recolar7 to "public" as "informix";
grant delete on "informix".recolar7 to "public" as "informix";
grant index on "informix".recolar7 to "public" as "informix";
grant select on "informix".recolar9 to "public" as "informix";
grant update on "informix".recolar9 to "public" as "informix";
grant insert on "informix".recolar9 to "public" as "informix";
grant delete on "informix".recolar9 to "public" as "informix";
grant index on "informix".recolar9 to "public" as "informix";
grant select on "informix".recolar8 to "public" as "informix";
grant update on "informix".recolar8 to "public" as "informix";
grant insert on "informix".recolar8 to "public" as "informix";
grant delete on "informix".recolar8 to "public" as "informix";
grant index on "informix".recolar8 to "public" as "informix";
grant select on "informix".panta4 to "public" as "informix";
grant update on "informix".panta4 to "public" as "informix";
grant insert on "informix".panta4 to "public" as "informix";
grant delete on "informix".panta4 to "public" as "informix";
grant index on "informix".panta4 to "public" as "informix";
grant select on "informix".recolar10 to "public" as "informix";
grant update on "informix".recolar10 to "public" as "informix";
grant insert on "informix".recolar10 to "public" as "informix";
grant delete on "informix".recolar10 to "public" as "informix";
grant index on "informix".recolar10 to "public" as "informix";
grant select on "informix".recolar11 to "public" as "informix";
grant update on "informix".recolar11 to "public" as "informix";
grant insert on "informix".recolar11 to "public" as "informix";
grant delete on "informix".recolar11 to "public" as "informix";
grant index on "informix".recolar11 to "public" as "informix";
grant select on "informix".recolar12 to "public" as "informix";
grant update on "informix".recolar12 to "public" as "informix";
grant insert on "informix".recolar12 to "public" as "informix";
grant delete on "informix".recolar12 to "public" as "informix";
grant index on "informix".recolar12 to "public" as "informix";
grant select on "informix".recolar13 to "public" as "informix";
grant update on "informix".recolar13 to "public" as "informix";
grant insert on "informix".recolar13 to "public" as "informix";
grant delete on "informix".recolar13 to "public" as "informix";
grant index on "informix".recolar13 to "public" as "informix";
grant select on "informix".tmp_futu to "public" as "informix";
grant update on "informix".tmp_futu to "public" as "informix";
grant insert on "informix".tmp_futu to "public" as "informix";
grant delete on "informix".tmp_futu to "public" as "informix";
grant index on "informix".tmp_futu to "public" as "informix";
grant select on "informix".panta5 to "public" as "informix";
grant update on "informix".panta5 to "public" as "informix";
grant insert on "informix".panta5 to "public" as "informix";
grant delete on "informix".panta5 to "public" as "informix";
grant index on "informix".panta5 to "public" as "informix";
grant select on "informix".recolar14 to "public" as "informix";
grant update on "informix".recolar14 to "public" as "informix";
grant insert on "informix".recolar14 to "public" as "informix";
grant delete on "informix".recolar14 to "public" as "informix";
grant index on "informix".recolar14 to "public" as "informix";
grant select on "informix".recolar15 to "public" as "informix";
grant update on "informix".recolar15 to "public" as "informix";
grant insert on "informix".recolar15 to "public" as "informix";
grant delete on "informix".recolar15 to "public" as "informix";
grant index on "informix".recolar15 to "public" as "informix";
grant select on "informix".recolar16 to "public" as "informix";
grant update on "informix".recolar16 to "public" as "informix";
grant insert on "informix".recolar16 to "public" as "informix";
grant delete on "informix".recolar16 to "public" as "informix";
grant index on "informix".recolar16 to "public" as "informix";
grant select on "informix".porce to "public" as "informix";
grant update on "informix".porce to "public" as "informix";
grant insert on "informix".porce to "public" as "informix";
grant delete on "informix".porce to "public" as "informix";
grant index on "informix".porce to "public" as "informix";
grant select on "informix".actu_tablet2 to "public" as "informix";
grant update on "informix".actu_tablet2 to "public" as "informix";
grant insert on "informix".actu_tablet2 to "public" as "informix";
grant delete on "informix".actu_tablet2 to "public" as "informix";
grant index on "informix".actu_tablet2 to "public" as "informix";
grant select on "informix".aguacate to "public" as "informix";
grant update on "informix".aguacate to "public" as "informix";
grant insert on "informix".aguacate to "public" as "informix";
grant delete on "informix".aguacate to "public" as "informix";
grant index on "informix".aguacate to "public" as "informix";
grant select on "informix".pedido to "public" as "informix";
grant update on "informix".pedido to "public" as "informix";
grant insert on "informix".pedido to "public" as "informix";
grant delete on "informix".pedido to "public" as "informix";
grant index on "informix".pedido to "public" as "informix";
grant select on "informix".inarvpf2 to "public" as "informix";
grant update on "informix".inarvpf2 to "public" as "informix";
grant insert on "informix".inarvpf2 to "public" as "informix";
grant delete on "informix".inarvpf2 to "public" as "informix";
grant index on "informix".inarvpf2 to "public" as "informix";
grant select on "informix".pantactu to "public" as "informix";
grant update on "informix".pantactu to "public" as "informix";
grant insert on "informix".pantactu to "public" as "informix";
grant delete on "informix".pantactu to "public" as "informix";
grant index on "informix".pantactu to "public" as "informix";
grant select on "informix".tmp_vpfbo to "public" as "informix";
grant update on "informix".tmp_vpfbo to "public" as "informix";
grant insert on "informix".tmp_vpfbo to "public" as "informix";
grant delete on "informix".tmp_vpfbo to "public" as "informix";
grant index on "informix".tmp_vpfbo to "public" as "informix";
grant select on "informix".tmp_kelly to "public" as "informix";
grant update on "informix".tmp_kelly to "public" as "informix";
grant insert on "informix".tmp_kelly to "public" as "informix";
grant delete on "informix".tmp_kelly to "public" as "informix";
grant index on "informix".tmp_kelly to "public" as "informix";
grant select on "informix".tmp_utizefe to "public" as "informix";
grant update on "informix".tmp_utizefe to "public" as "informix";
grant insert on "informix".tmp_utizefe to "public" as "informix";
grant delete on "informix".tmp_utizefe to "public" as "informix";
grant index on "informix".tmp_utizefe to "public" as "informix";





create procedure "xxx".saldo_cli(numemp char(2),codcli char(8),placli smallint)
  returning decimal(14,4);
  define sal_doc decimal(14,4);
  define sal_ven decimal(14,4);
  define fech_ref date;
  define fech_doc date;
  let sal_ven=0;

  foreach select sal_fac,fecha into sal_doc,fech_doc from inartrcl
    where inartrcl.num_emp=numemp and inartrcl.cod_cli=codcli
      and inartrcl.sal_fac<>0

      let fech_ref=fech_doc+placli;
      if fech_ref<=today    then
         let sal_ven=sal_ven+sal_doc;
      end if;
   end foreach;
   return sal_ven;
end procedure;


 

 

 
create procedure "xxx".act_folio_pedido(emp char(2), age integer, fol integer)
SET LOCK MODE TO WAIT;
   update inarag set inarag.folio=fol+1 where inarag.num_emp=emp
                 and inarag.num_suc=emp and inarag.cod_ag=age;
SET LOCK MODE TO NOT WAIT;
end procedure;

CREATE PROCEDURE "xxx".inserta_com(emp CHAR(2),suc CHAR(2),nument CHAR(10),
 codpro CHAR(8),fechent DATE, impexe DECIMAL(12,4),imp15 DECIMAL(12,4),
 desexe DECIMAL(10,4), des15 DECIMAL(10,4), iva15 DECIMAL(10,4),
 fle DECIMAL(10,4), ivafle DECIMAL(10,4), numfac CHAR(10), placas char(10),
 fechfac date);

-- VARIABLES INARPROV
  DEFINE razsoc  LIKE inarprov.raz_soc;
  DEFINE dompro  LIKE inarprov.dom_pro;
  DEFINE ciupro  LIKE inarprov.ciu_pro;
  DEFINE edopro  LIKE inarprov.est_pro;
  DEFINE rfcpro  LIKE inarprov.rfc_pro;
  DEFINE plazo   LIKE inarprov.pla_pro;
  DEFINE conpro  LIKE inarprov.con_pro;

-- VARIABLES INARTRPR
  DEFINE subtot   LIKE inartrpr.imp_ent;
  DEFINE impent   LIKE inartrpr.imp_ent;
  DEFINE fechven  LIKE inartrpr.fech_ven;

-- LEE PROVEEDOR
  SELECT raz_soc,dom_pro,ciu_pro,est_pro,rfc_pro,pla_pro,con_pro
    INTO razsoc,dompro,ciupro,edopro,rfcpro,plazo,conpro
    FROM inarprov
   WHERE inarprov.num_emp=emp AND inarprov.cod_pro=codpro;

-- SUMA IMPORTES Y CALCULA VENCIMIENTOS
  LET subtot=impexe+imp15-desexe-des15;
  LET impent=impexe+imp15+iva15-desexe-des15;
  LET fechven=fechfac+plazo;

-- INSERTA O ACTUALIZA INARENT,INARTRPR,DOCUMENTO
     INSERT INTO inarent VALUES(emp,suc,nument,codpro,razsoc,nument,numfac,
            impexe,0,imp15,0,desexe,0,des15,0,0,iva15,0,fle,ivafle,0,0,0,0,0,0,
            fechent,dompro,ciupro,edopro,rfcpro,placas);

     INSERT INTO inartrpr VALUES(emp,suc,nument,"1",codpro,numfac,fechfac,
            impent,fechven,impent,iva15,fechent);

     INSERT INTO documento VALUES(emp,suc,"CO",nument,impent,fechent);

-- ACTUALIZA SALDO PROVEEDOR
 SET LOCK MODE TO WAIT;
  UPDATE inarprov SET
         inarprov.com_mes=inarprov.com_mes+subtot,
         inarprov.com_acu=inarprov.com_acu+subtot,
         inarprov.can_com=inarprov.can_com+subtot,
         inarprov.fech_com=fechent,
         inarprov.sal_act=inarprov.sal_act+impent
   WHERE inarprov.num_emp=emp
     AND inarprov.cod_pro=codpro;
 SET LOCK MODE TO NOT WAIT;

END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_tr_com(emp CHAR(2),suc CHAR(2),art CHAR(14),
 ped CHAR(10),fech DATE,kgs DECIMAL(10,4),caj DECIMAL(10,4),fle DECIMAL(12,4),
 cosuni DECIMAL(12,4), codpro CHAR(8), iva DECIMAL(12,4), des DECIMAL(12,4),
 ren SMALLINT);

-- VARIABLES INVENTARIO
   DEFINE canemp  DECIMAL(10,4);
   DEFINE exicorkgs DECIMAL(10,4);
   DEFINE exicorcaj DECIMAL(10,4);
   DEFINE ultcoskgs DECIMAL(12,4);
   DEFINE ultcoscaj DECIMAL(12,4);
   DEFINE cosprokgs DECIMAL(12,4);
   DEFINE cosprocaj DECIMAL(12,4);
   DEFINE salval    DECIMAL(14,4);
   DEFINE tipart     CHAR(1);


  SELECT can_emp,exi_cor_kgs,exi_cor_caj,ult_cos_kgs,ult_cos_caj,
         cos_pro_kgs,cos_pro_caj,tip_art,sal_val  INTO
         canemp,exicorkgs,exicorcaj,ultcoskgs,ultcoscaj,
         cosprokgs,cosprocaj,tipart,salval
  FROM inarinv
  WHERE inarinv.num_emp=emp
    AND inarinv.cod_art=art;


     IF tipart="K" THEN
        LET exicorkgs = exicorkgs + kgs;
        LET ultcoskgs = cosuni;
        LET salval = salval + (kgs*cosuni);
        LET exicorcaj = exicorcaj + caj;
        LET canemp = exicorkgs / exicorcaj;
        LET ultcoscaj = (kgs*cosuni) / caj;
     END IF;

     IF tipart="C" THEN
        LET exicorcaj = exicorcaj + caj;
        LET ultcoscaj = cosuni;
        LET salval = salval + (caj*cosuni);
        LET exicorkgs = exicorkgs + kgs;
        LET canemp = exicorkgs / exicorcaj;
        LET ultcoskgs = (caj*cosuni) / kgs;
     END IF;

     LET cosprokgs = salval / exicorkgs;
     LET cosprocaj = salval / exicorcaj;

     INSERT INTO inartrinv 
     VALUES(emp,art,suc,fech,"CO",ped,kgs,caj,ultcoskgs,ultcoscaj,cosprokgs,
            cosprocaj,0,0,des,fle,ren,codpro," ",ped,fech,iva);

   SET LOCK MODE TO WAIT;
     UPDATE inarinv SET exi_cor_kgs=exicorkgs,
                        exi_cor_caj=exicorcaj,
                        ult_cos_kgs=ultcoskgs,
                        ult_cos_caj=ultcoscaj,
                        cos_pro_kgs=cosprokgs,
                        cos_pro_caj=cosprocaj,
                        sal_val=salval,
                        can_emp=canemp
      WHERE inarinv.num_emp=emp
        AND inarinv.cod_art=art;
   SET LOCK MODE TO NOT WAIT;

END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_tr_pag_pro(emp CHAR(2),suc CHAR(2),tipent CHAR(2),
    nument CHAR(10),numpag INTEGER,tippag CHAR(2),pro CHAR(8), 
    imp DECIMAL(12,2), iva15 DECIMAL(10,2), fech DATE, forpag CHAR(10));

   INSERT INTO inartrpr1 VALUES(emp,suc,tipent,nument,numpag,tippag,
                                pro,imp,iva15,fech,forpag);
   
SET LOCK MODE TO WAIT;
   UPDATE inartrpr
      SET inartrpr.sal_ent = inartrpr.sal_ent-imp,
          inartrpr.sal_iva = inartrpr.sal_iva-iva15
    WHERE inartrpr.num_emp   = emp
      AND inartrpr.num_suc   = suc
      AND inartrpr.tip_ent   = tipent
      AND inartrpr.num_ent   = nument
      AND inartrpr.cod_pro   = pro;
SET LOCK MODE TO NOT WAIT;

END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_pago_pro(emp CHAR(2), suc CHAR(2), tipopago CHAR(2),
   numpago INTEGER, pro CHAR(8), imppago DECIMAL(12,2), iva15 DECIMAL(10,2),
   fech DATE, forpag CHAR(10), banco CHAR(20), numcheq INTEGER,
   efvo DECIMAL(12,2), impcheq DECIMAL(12,2),localofor CHAR(1));

-- VARIABLES PROVEEDOR
  DEFINE razsoc   LIKE inarprov.raz_soc;

-- LEE PROVEEDOR
  SELECT raz_soc
    INTO razsoc
    FROM inarprov
   WHERE inarprov.num_emp=emp
     AND inarprov.cod_pro=pro;

   INSERT INTO inarppr VALUES (emp,suc,tipopago,numpago,pro,razsoc,imppago,
       iva15,fech,forpag,banco,numcheq,efvo,impcheq,localofor);

   INSERT INTO documento VALUES(emp,suc,"PP",numpago,imppago,fech);

SET LOCK MODE TO WAIT;
   UPDATE inarprov
      SET inarprov.sal_act  = inarprov.sal_act-imppago,
          inarprov.fech_pag = fech,
          inarprov.imp_pag  = imppago
    WHERE inarprov.num_emp = emp
      AND inarprov.cod_pro = pro;
SET LOCK MODE TO NOT WAIT;

END PROCEDURE;

CREATE PROCEDURE "xxx".cancela_com(emp CHAR(2),suc CHAR(2),nument CHAR(10));

-- VARIABLES INVENTARIO
   DEFINE canemp    LIKE inarinv.can_emp;
   DEFINE exicorkgs LIKE inarinv.exi_cor_kgs;
   DEFINE exicorcaj LIKE inarinv.exi_cor_caj;
   DEFINE cosprokgs LIKE inarinv.cos_pro_kgs;
   DEFINE cosprocaj LIKE inarinv.cos_pro_caj;
   DEFINE salval    LIKE inarinv.sal_val;
   DEFINE tipart    LIKE inarinv.tip_art;

-- VARIABLES INARENT
  DEFINE fechent   LIKE inarent.fecha;
  DEFINE codpro    LIKE inarent.cod_pro;
  DEFINE impexe    LIKE inarent.imp_exe;
  DEFINE imp15     LIKE inarent.imp_15;
  DEFINE iva15     LIKE inarent.iva_15;
  DEFINE desexe    LIKE inarent.des_exe;
  DEFINE des15     LIKE inarent.des_15;

-- VARIABLES INARTRINV  KARDEX
  DEFINE art       LIKE inartrinv.cod_art;
  DEFINE kgs       LIKE inartrinv.can_kgs;
  DEFINE caj       LIKE inartrinv.can_caj;
  DEFINE cosunikgs LIKE inartrinv.cos_uni_kgs;
  DEFINE cosunicaj LIKE inartrinv.cos_uni_caj;
  DEFINE desvta    LIKE inartrinv.des_vta;
  DEFINE renglon   LIKE inartrinv.ren_art;
  DEFINE iva       LIKE inartrinv.iva_art;
  DEFINE fech      LIKE inartrinv.fech_doc;

-- VARIABLES INARTRPR
  DEFINE subtot   LIKE inartrpr.imp_ent;
  DEFINE impent   LIKE inartrpr.imp_ent;

-- BUSCA COMPRA
BEGIN WORK;
IF EXISTS(SELECT numero
            FROM documento
           WHERE documento.num_emp=emp
             AND documento.num_suc=suc
             AND documento.tipo="CO"
             AND documento.numero=nument)
THEN
  FOREACH
    SELECT cod_art,can_kgs,can_caj,cos_uni_kgs,
           cos_uni_caj,ren_art,iva_art,fech_doc,
           cos_pro_kgs,cos_pro_caj
      INTO art,kgs,caj,cosunikgs,
           cosunicaj,renglon,iva,fech,
           cosprokgs,cosprocaj
      FROM inartrinv
     WHERE inartrinv.num_emp=emp AND inartrinv.num_suc=suc
       AND inartrinv.tip_doc="CO" AND inartrinv.num_doc=nument

-- BUSCA INVENTARIO
    LET tipart=" ";
    SELECT can_emp,exi_cor_kgs,exi_cor_caj,
           cos_pro_kgs,cos_pro_caj,tip_art,sal_val
      INTO canemp,exicorkgs,exicorcaj,
           cosprokgs,cosprocaj,tipart,salval
      FROM inarinv
     WHERE inarinv.num_emp=emp
       AND inarinv.cod_art=art;

     IF tipart="K" THEN
        LET exicorkgs = exicorkgs - kgs;
        LET salval = salval - (kgs*cosunikgs);
        LET exicorcaj = exicorcaj - caj;
        LET canemp = exicorkgs / exicorcaj;
     END IF;

     IF tipart="C" THEN
        LET exicorcaj = exicorcaj - caj;
        LET salval = salval - (caj*cosunicaj);
        LET exicorkgs = exicorkgs - kgs;
        LET canemp = exicorkgs / exicorcaj;
     END IF;

     LET cosprokgs = salval / exicorkgs;
     LET cosprocaj = salval / exicorcaj;

-- ACTUALIZA INVENTARIO
   SET LOCK MODE TO WAIT;
     UPDATE inarinv SET exi_cor_kgs=exicorkgs,
                        exi_cor_caj=exicorcaj,
                        cos_pro_kgs=cosprokgs,
                        cos_pro_caj=cosprocaj,
                        sal_val=salval,
                        can_emp=canemp
      WHERE inarinv.num_emp=emp
        AND inarinv.cod_art=art;
   SET LOCK MODE TO NOT WAIT;

-- BORRA TRANSACCION KARDEX
     DELETE FROM inartrinv
       WHERE inartrinv.num_emp=emp    AND inartrinv.cod_art=art
         AND inartrinv.fech_doc=fech  AND inartrinv.tip_doc="CO"
         AND inartrinv.num_doc=nument AND inartrinv.num_suc=suc
         AND inartrinv.ren_art=renglon;
  END FOREACH;

-- BUSCA ENTRADA
  SELECT imp_exe,imp_15,iva_15,des_exe,des_15,cod_pro
    INTO impexe,imp15,iva15,desexe,des15,codpro
    FROM inarent
   WHERE inarent.num_emp=emp
     AND inarent.num_suc=suc
     AND inarent.num_ent=nument;

-- SUMA IMPORTES 
  LET subtot=impexe+imp15-desexe-des15;
  LET impent=impexe+imp15+iva15-desexe-des15;

-- BORRA INARENT,INARTRPR,DOCUMENTO
     DELETE FROM inarent
      WHERE inarent.num_emp=emp
        AND inarent.num_suc=suc
        AND inarent.num_ent=nument;

     DELETE FROM inartrpr
      WHERE inartrpr.num_emp=emp
        AND inartrpr.num_suc=suc
        AND inartrpr.num_ent=nument
        AND inartrpr.tip_ent="1";

-- ACTUALIZA SALDO PROVEEDOR
 SET LOCK MODE TO WAIT;
  UPDATE inarprov
     SET inarprov.com_mes=inarprov.com_mes-subtot,
         inarprov.com_acu=inarprov.com_acu-subtot,
         inarprov.can_com=inarprov.can_com-subtot,
         inarprov.sal_act=inarprov.sal_act-impent
   WHERE inarprov.num_emp=emp
     AND inarprov.cod_pro=codpro;
 SET LOCK MODE TO NOT WAIT;

     DELETE FROM documento
      WHERE documento.num_emp=emp
        AND documento.num_suc=suc
        AND documento.tipo="CO"
        AND documento.numero=nument;
END IF;
COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".mod_trinv(emp char(2),suc char(2), doc char(10),
  tipdoc CHAR(2), artold char(14), artnew char(14));

-- VARIABLES TRANSACCIONES INVENTARIO
  DEFINE kgs LIKE inartrinv.can_kgs;
  DEFINE caj LIKE inartrinv.can_caj;
  DEFINE cosprokgs LIKE inartrinv.cos_pro_kgs;
  DEFINE cosprocaj LIKE inartrinv.cos_pro_caj;
  DEFINE prevtakgs LIKE inartrinv.pre_vta_kgs;
  DEFINE prevtacaj LIKE inartrinv.pre_vta_caj;
  DEFINE desvta LIKE inartrinv.des_vta;
  DEFINE renglon LIKE inartrinv.ren_art;
  DEFINE iva     LIKE inartrinv.iva_art;
-- VARIABLES INVENTARIO
  DEFINE salval    LIKE inarinv.sal_val;
  DEFINE venmeskgs LIKE inarinv.ven_mes_kgs;
  DEFINE venmescaj LIKE inarinv.ven_mes_caj;
  DEFINE venacukgs LIKE inarinv.ven_acu_kgs;
  DEFINE venacucaj LIKE inarinv.ven_acu_caj;
  DEFINE cosmeskgs LIKE inarinv.cos_mes_kgs;
  DEFINE cosmescaj LIKE inarinv.cos_mes_caj;
  DEFINE cosacukgs LIKE inarinv.cos_acu_kgs;
  DEFINE cosacucaj LIKE inarinv.cos_acu_caj;
  DEFINE exicorkgs LIKE inarinv.exi_cor_kgs;
  DEFINE exicorcaj LIKE inarinv.exi_cor_caj;
  DEFINE canmeskgs LIKE inarinv.can_mes_kgs;
  DEFINE canmescaj LIKE inarinv.can_mes_caj;
  DEFINE canacukgs LIKE inarinv.can_acu_kgs;
  DEFINE canacucaj LIKE inarinv.can_acu_caj;
  DEFINE fech      LIKE inartrinv.fech_doc;
-- VARIABLES COSTO DE VENTAS
  DEFINE cosvta LIKE inarpvt.cos_vta;
  DEFINE tipart LIKE inarinv.tip_art;
-- VARIABLES FACTURA
  DEFINE tot    LIKE inartrcl.importe;
  DEFINE stot   LIKE inartrcl.importe;

  LET cosvta=0;
BEGIN WORK;
 IF EXISTS(SELECT numero
             FROM documento
            WHERE documento.num_emp=emp
              AND documento.num_suc=suc
              AND documento.tipo=tipdoc
              AND documento.numero=doc)
 THEN
  FOREACH
    SELECT can_kgs,can_caj,pre_vta_kgs,
           pre_vta_caj,des_vta,ren_art,iva_art,fech_doc,
           cos_pro_kgs,cos_pro_caj
      INTO kgs,caj,prevtakgs,
           prevtacaj,desvta,renglon,iva,fech,
           cosprokgs,cosprocaj
      FROM inartrinv
     WHERE inartrinv.num_emp=emp    AND inartrinv.num_suc=suc
       AND inartrinv.tip_doc=tipdoc AND inartrinv.num_doc=doc
       AND inartrinv.cod_art=artold

-- ACTUALIZA INVENTARIO ARTICULO ERRONEO
  SET LOCK MODE TO WAIT;
    UPDATE inarinv SET
       sal_val     = sal_val + (kgs * cosprokgs),
       ven_mes_kgs = ven_mes_kgs - (kgs * prevtakgs),
       ven_mes_caj = ven_mes_caj - (caj * prevtacaj),
       ven_acu_kgs = ven_acu_kgs - (kgs * prevtakgs),
       ven_acu_caj = ven_acu_caj - (caj * prevtacaj),
       cos_mes_kgs = cos_mes_kgs - (kgs * cosprokgs),
       cos_mes_caj = cos_mes_caj - (caj * cosprocaj),
       cos_acu_kgs = cos_acu_kgs - (kgs * cosprokgs),
       cos_acu_caj = cos_acu_caj - (caj * cosprocaj),
       exi_cor_kgs = exi_cor_kgs + kgs,
       exi_cor_caj = exi_cor_caj + caj,
       can_mes_kgs = can_mes_kgs - kgs,
       can_mes_caj = can_mes_caj - caj,
       can_acu_kgs = can_acu_kgs - kgs,
       can_acu_caj = can_acu_caj - caj
     WHERE inarinv.num_emp=emp AND inarinv.cod_art=artold;
  SET LOCK MODE TO NOT WAIT;

-- ACTUALIZA INVENTARIO ARTICULO CORRECTO
  SET LOCK MODE TO WAIT;
    UPDATE inarinv SET
       sal_val     = sal_val - (kgs * cosprokgs),
       ven_mes_kgs = ven_mes_kgs + (kgs * prevtakgs),
       ven_mes_caj = ven_mes_caj + (caj * prevtacaj),
       ven_acu_kgs = ven_acu_kgs + (kgs * prevtakgs),
       ven_acu_caj = ven_acu_caj + (caj * prevtacaj),
       cos_mes_kgs = cos_mes_kgs + (kgs * cosprokgs),
       cos_mes_caj = cos_mes_caj + (caj * cosprocaj),
       cos_acu_kgs = cos_acu_kgs + (kgs * cosprokgs),
       cos_acu_caj = cos_acu_caj + (caj * cosprocaj),
       exi_cor_kgs = exi_cor_kgs - kgs,
       exi_cor_caj = exi_cor_caj - caj,
       can_mes_kgs = can_mes_kgs + kgs,
       can_mes_caj = can_mes_caj + caj,
       can_acu_kgs = can_acu_kgs + kgs,
       can_acu_caj = can_acu_caj + caj
     WHERE inarinv.num_emp=emp AND inarinv.cod_art=artnew;
  SET LOCK MODE TO NOT WAIT;

-- ACTUALIZA TRANSACCION DEL KARDEX
     UPDATE inartrinv
         SET inartrinv.cod_art=artnew
       WHERE inartrinv.num_emp=emp   AND inartrinv.cod_art=artold
         AND inartrinv.fech_doc=fech AND inartrinv.tip_doc=tipdoc
         AND inartrinv.num_doc=doc   AND inartrinv.num_suc=suc
         AND inartrinv.ren_art=renglon;

  END FOREACH;

 END IF;
COMMIT WORK;
END PROCEDURE;

create procedure "xxx".inserta_cot1(emp char(2), suc char(2), fol integer,
  codart char(14), fech date, tip char(1),cli char(8),
  kgs decimal(10,4), caj decimal(10,4),cosprokgs decimal(12,4),
  cosprocaj decimal(12,4),prevtakgs decimal(12,4),
  prevtacaj decimal(12,4),desvta decimal(12,4),fle decimal(12,4),
  renglon smallint,iva decimal(12,4),agente smallint);

  INSERT INTO inarcot1 VALUES(emp,codart,suc,fech,tip,fol,
  kgs,caj,cosprokgs,cosprocaj,prevtakgs,prevtacaj,desvta,fle,renglon,cli,iva,
  agente);

END PROCEDURE;

create procedure "xxx".inserta_cot(emp char(2), suc char(2), fol integer,
  cli char(8), nomcli char(50), domcli char(60), ciucli char(20),
  estcli char(10),rfccli char(20),
  agente smallint, impexe decimal(14,4), imp15 decimal(14,4),
  iva15 decimal(12,4), fecha date, cosvta decimal(14,4), desexe decimal(12,4));

-- VARIABLES TIPO DE CLIENTE CREDITO=1 CONTADO=2  PAGO ANTICIPADO=3
 DEFINE concli  LIKE inarcl.con_cli;

-- BUSCA INFORMACION CLIENTE
 SELECT con_cli
   INTO concli
   FROM inarcl
  WHERE inarcl.num_emp=emp
    AND inarcl.cod_cli=cli;

 INSERT INTO inarcot VALUES(emp,suc,fol,cli,nomcli,domcli,ciucli,estcli,rfccli,
   "nom","dom","pob",fol,fecha,fol,fecha,concli,agente,impexe,0,imp15,0,desexe,
   0,0,0,0,iva15,0,cosvta,0,0,0,0,0,0,"A");

END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_ticket(emp char(2), suc char(2), fol integer,
  fech date, agente smallint, tik integer, cli char(8),tiptik char(1),
  efvo decimal(12,4), bon decimal(12,4), dls decimal(12,4), che decimal(12,4),
  numche integer, fechche date, clavecajera char(12));

-- VARIABLES TRANSACCIONES INVENTARIO
  DEFINE art LIKE inartrinv.cod_art;
  DEFINE kgs LIKE inartrinv.can_kgs;
  DEFINE caj LIKE inartrinv.can_caj;
  DEFINE cosprokgs LIKE inartrinv.cos_pro_kgs;
  DEFINE cosprocaj LIKE inartrinv.cos_pro_caj;
  DEFINE prevtakgs LIKE inartrinv.pre_vta_kgs;
  DEFINE prevtacaj LIKE inartrinv.pre_vta_caj;
  DEFINE desvta LIKE inartrinv.des_vta;
  DEFINE renglon LIKE inartrinv.ren_art;
  DEFINE iva     LIKE inartrinv.iva_art;
-- VARIABLES INVENTARIO
  DEFINE salval    LIKE inarinv.sal_val;
  DEFINE venmeskgs LIKE inarinv.ven_mes_kgs;
  DEFINE venmescaj LIKE inarinv.ven_mes_caj;
  DEFINE venacukgs LIKE inarinv.ven_acu_kgs;
  DEFINE venacucaj LIKE inarinv.ven_acu_caj;
  DEFINE cosmeskgs LIKE inarinv.cos_mes_kgs;
  DEFINE cosmescaj LIKE inarinv.cos_mes_caj;
  DEFINE cosacukgs LIKE inarinv.cos_acu_kgs;
  DEFINE cosacucaj LIKE inarinv.cos_acu_caj;
  DEFINE exicorkgs LIKE inarinv.exi_cor_kgs;
  DEFINE exicorcaj LIKE inarinv.exi_cor_caj;
  DEFINE canmeskgs LIKE inarinv.can_mes_kgs;
  DEFINE canmescaj LIKE inarinv.can_mes_caj;
  DEFINE canacukgs LIKE inarinv.can_acu_kgs;
  DEFINE canacucaj LIKE inarinv.can_acu_caj;
-- VARIABLES COSTO DE VENTAS
  DEFINE cosvta LIKE inarpvt.cos_vta;
  DEFINE tipart LIKE inarinv.tip_art;
-- VARIABLES TICKET
  DEFINE nomcli LIKE inarfac.raz_soc;
  DEFINE domcli LIKE inarfac.dom_cli;
  DEFINE ciucli LIKE inarfac.ciu_cli;
  DEFINE estcli LIKE inarfac.est_cli;
  DEFINE rfccli LIKE inarfac.reg_fed;
  DEFINE impexe LIKE inarpvt.imp_exe;
  DEFINE imp15  LIKE inarpvt.imp_15;
  DEFINE desexe LIKE inarpvt.des_exe;
  DEFINE des15  LIKE inarpvt.des_15;
  DEFINE iva15  LIKE inarpvt.iva_15;
  DEFINE tot    LIKE inartrcl.importe;
  DEFINE stot   LIKE inartrcl.importe;

  LET cosvta=0;

  FOREACH
    SELECT cod_art,can_kgs,can_caj,pre_vta_kgs,
           pre_vta_caj,des_vta,ren_art,iva_art
      INTO art,kgs,caj,prevtakgs,
           prevtacaj,desvta,renglon,iva
       FROM inarcot1
       WHERE inarcot1.num_emp=emp AND inarcot1.num_suc=suc
         AND inarcot1.num_doc=fol  AND inarcot1.fech_doc=fech
         AND inarcot1.cod_ag=agente

-- VARIABLES COSTO DE VENTAS
  SELECT tip_art,cos_pro_kgs,cos_pro_caj
    INTO tipart,cosprokgs,cosprocaj
    FROM inarinv
   WHERE inarinv.num_emp=emp AND inarinv.cod_art=art;

   IF tipart="K" THEN
     LET cosvta = cosvta + (kgs * cosprokgs);
   END IF;
   IF tipart="C" THEN
     LET cosvta = cosvta + (caj * cosprocaj);
   END IF;

-- ACTUALIZA INVENTARIO
  SET LOCK MODE TO WAIT;
    UPDATE inarinv SET
       sal_val    = sal_val - (kgs * cosprokgs),
       ven_mes_kgs = ven_mes_kgs + (kgs * prevtakgs),
       ven_mes_caj = ven_mes_caj + (caj * prevtacaj),
       ven_acu_kgs = ven_acu_kgs + (kgs * prevtakgs),
       ven_acu_caj = ven_acu_caj + (caj * prevtacaj),
       cos_mes_kgs = cos_mes_kgs + (kgs * cosprokgs),
       cos_mes_caj = cos_mes_caj + (caj * cosprocaj),
       cos_acu_kgs = cos_acu_kgs + (kgs * cosprokgs),
       cos_acu_caj = cos_acu_caj + (caj * cosprocaj),
       exi_cor_kgs = exi_cor_kgs - kgs,
       exi_cor_caj = exi_cor_caj - caj,
       can_mes_kgs = can_mes_kgs + kgs,
       can_mes_caj = can_mes_caj + caj,
       can_acu_kgs = can_acu_kgs + kgs,
       can_acu_caj = can_acu_caj + caj
     WHERE inarinv.num_emp=emp AND inarinv.cod_art=art;
  SET LOCK MODE TO NOT WAIT;

--    SELECT sal_val,ven_mes_kgs,ven_mes_caj,ven_acu_kgs,ven_acu_caj,
--                   cos_mes_kgs,cos_mes_caj,cos_acu_kgs,cos_acu_caj,
--                   exi_cor_kgs,exi_cor_caj,can_mes_kgs,can_mes_caj,
--                   can_acu_kgs,can_acu_caj
--      INTO salval,venmeskgs,venmescaj,venacukgs,venacucaj,
--                  cosmeskgs,cosmescaj,cosacukgs,cosacucaj,
--                  exicorkgs,exicorcaj,canmeskgs,canmescaj,
--                  canacukgs,canacucaj
--       FROM inarinv
--       WHERE inarinv.num_emp=emp AND inarinv.cod_art=art;
--                   
--       LET salval    = salval - (kgs * cosprokgs);
--       LET venmeskgs = venmeskgs + (kgs * prevtakgs);
--       LET venmescaj = venmescaj + (caj * prevtacaj);
--       LET venacukgs = venacukgs + (kgs * prevtakgs);
--       LET venacucaj = venacucaj + (caj * prevtacaj);
--       LET cosmeskgs = cosmeskgs + (kgs * cosprokgs);
--       LET cosmescaj = cosmescaj + (caj * cosprocaj);
--       LET cosacukgs = cosacukgs + (kgs * cosprokgs);
--       LET cosacucaj = cosacucaj + (caj * cosprocaj);
--       LET exicorkgs = exicorkgs - kgs;
--       LET exicorcaj = exicorcaj - caj;
--       LET canmeskgs = canmeskgs + kgs;
--       LET canmescaj = canmescaj + caj;
--       LET canacukgs = canacukgs + kgs;
--       LET canacucaj = canacucaj + caj;

-- INSERTA TRANSACCION DEL KARDEX
     INSERT INTO inartrinv VALUES(emp,art,suc,fech,"TI",tik,kgs,caj,
            0,0,cosprokgs,cosprocaj,prevtakgs,prevtacaj,
            desvta,0,renglon," ",cli,0," ",iva);
  END FOREACH;

-- INSERTA TICKET
 SELECT cod_cli,raz_soc,dom_cli,ciu_cli,est_cli,rfc_cli,imp_exe,imp_15,iva_15,
        des_exe,des_15
   INTO cli,nomcli,domcli,ciucli,estcli,rfccli,impexe,imp15,iva15,
        desexe,des15
   FROM inarcot
  WHERE inarcot.num_emp=emp AND inarcot.num_suc=suc AND inarcot.num_doc=fol
    AND inarcot.cod_ag=agente;

 INSERT INTO inarpvt VALUES(emp,suc,tik,cli,nomcli,domcli,ciucli,estcli,
   "nom","dom","pob",fol,fech,fol,fech,tiptik,agente,impexe,0,
   imp15,0,desexe,0,des15,0,0,iva15,0,cosvta,0,0,0,0,0,0,fech,rfccli,tiptik,
   efvo,bon,dls,che,numche,fechche,clavecajera,0," ");

-- INSERTA TRANSACCIONES CLIENTES
  LET stot=impexe+imp15-desexe-des15;
  LET tot=impexe+imp15+iva15-desexe-des15;
--  INSERT INTO inartrcl VALUES(emp,suc,cli,tiptik,tik,tot,tot,iva15,fech);

-- ACTUALIZA SALDO CLIENTES
-- UPDATE inarcl
--   SET inarcl.com_mes=(com_mes+stot),
--       inarcl.com_acu=(com_acu+stot),
--       inarcl.cos_mes=(cos_mes+cosvta),
--       inarcl.cos_acu=(cos_acu+cosvta),
--       inarcl.can_com=(can_com+stot),
--       inarcl.fech_com=fech,
--       inarcl.sal_act=(sal_act+tot)
--   WHERE inarcl.num_emp=emp
--     AND inarcl.cod_cli=cli;

-- ACTUALIZA VENTA AGENTE
SET LOCK MODE TO WAIT;
 UPDATE inarag
  SET inarag.vta_mes=(vta_mes+stot),
      inarag.vta_acu=(vta_acu+stot),
      inarag.cos_mes=(cos_mes+cosvta),
      inarag.cos_acu=(cos_acu+cosvta)
   WHERE inarag.num_emp=emp
     AND inarag.num_suc=suc
     AND inarag.cod_ag=agente;
SET LOCK MODE TO NOT WAIT;

-- INSERTA CONTROL DE DOCUMENTOS
  INSERT INTO documento VALUES(emp,suc,"TI",tik,tot,fech);
END PROCEDURE;

CREATE PROCEDURE "xxx".cancela_ticket(emp char(2),suc char(2), tik integer,
  clavecajera char(12));

-- VARIABLES TRANSACCIONES INVENTARIO
  DEFINE art LIKE inartrinv.cod_art;
  DEFINE kgs LIKE inartrinv.can_kgs;
  DEFINE caj LIKE inartrinv.can_caj;
  DEFINE cosprokgs LIKE inartrinv.cos_pro_kgs;
  DEFINE cosprocaj LIKE inartrinv.cos_pro_caj;
  DEFINE prevtakgs LIKE inartrinv.pre_vta_kgs;
  DEFINE prevtacaj LIKE inartrinv.pre_vta_caj;
  DEFINE desvta LIKE inartrinv.des_vta;
  DEFINE renglon LIKE inartrinv.ren_art;
  DEFINE iva     LIKE inartrinv.iva_art;
-- VARIABLES INVENTARIO
  DEFINE salval    LIKE inarinv.sal_val;
  DEFINE venmeskgs LIKE inarinv.ven_mes_kgs;
  DEFINE venmescaj LIKE inarinv.ven_mes_caj;
  DEFINE venacukgs LIKE inarinv.ven_acu_kgs;
  DEFINE venacucaj LIKE inarinv.ven_acu_caj;
  DEFINE cosmeskgs LIKE inarinv.cos_mes_kgs;
  DEFINE cosmescaj LIKE inarinv.cos_mes_caj;
  DEFINE cosacukgs LIKE inarinv.cos_acu_kgs;
  DEFINE cosacucaj LIKE inarinv.cos_acu_caj;
  DEFINE exicorkgs LIKE inarinv.exi_cor_kgs;
  DEFINE exicorcaj LIKE inarinv.exi_cor_caj;
  DEFINE canmeskgs LIKE inarinv.can_mes_kgs;
  DEFINE canmescaj LIKE inarinv.can_mes_caj;
  DEFINE canacukgs LIKE inarinv.can_acu_kgs;
  DEFINE canacucaj LIKE inarinv.can_acu_caj;
  DEFINE fech      LIKE inartrinv.fech_doc;
-- VARIABLES COSTO DE VENTAS
  DEFINE cosvta LIKE inarpvt.cos_vta;
  DEFINE tipart LIKE inarinv.tip_art;
-- VARIABLES FACTURA
  DEFINE cli    LIKE inarpvt.cod_cli;
  DEFINE nomcli LIKE inarpvt.raz_soc;
  DEFINE domcli LIKE inarpvt.dom_cli;
  DEFINE ciucli LIKE inarpvt.ciu_cli;
  DEFINE estcli LIKE inarpvt.est_cli;
  DEFINE impexe LIKE inarpvt.imp_exe;
  DEFINE imp15  LIKE inarpvt.imp_15;
  DEFINE desexe LIKE inarpvt.des_exe;
  DEFINE des15  LIKE inarpvt.des_15;
  DEFINE iva15  LIKE inarpvt.iva_15;
  DEFINE tot    LIKE inartrcl.importe;
  DEFINE stot   LIKE inartrcl.importe;
  DEFINE agente LIKE inarpvt.ag_fac;

  LET cosvta=0;
BEGIN WORK;
 IF EXISTS(SELECT numero
             FROM documento
            WHERE documento.num_emp=emp
              AND documento.num_suc=suc
              AND documento.tipo="TI"
              AND documento.numero=tik)
 THEN
  FOREACH
    SELECT cod_art,can_kgs,can_caj,pre_vta_kgs,
           pre_vta_caj,des_vta,ren_art,iva_art,fech_doc,
           cos_pro_kgs,cos_pro_caj
      INTO art,kgs,caj,prevtakgs,
           prevtacaj,desvta,renglon,iva,fech,
           cosprokgs,cosprocaj
      FROM inartrinv
     WHERE inartrinv.num_emp=emp AND inartrinv.num_suc=suc
       AND inartrinv.tip_doc="TI" AND inartrinv.num_doc=tik

-- ACTUALIZA INVENTARIO
  SET LOCK MODE TO WAIT;
    UPDATE inarinv SET
       sal_val     = sal_val + (kgs * cosprokgs),
       ven_mes_kgs = ven_mes_kgs - (kgs * prevtakgs),
       ven_mes_caj = ven_mes_caj - (caj * prevtacaj),
       ven_acu_kgs = ven_acu_kgs - (kgs * prevtakgs),
       ven_acu_caj = ven_acu_caj - (caj * prevtacaj),
       cos_mes_kgs = cos_mes_kgs - (kgs * cosprokgs),
       cos_mes_caj = cos_mes_caj - (caj * cosprocaj),
       cos_acu_kgs = cos_acu_kgs - (kgs * cosprokgs),
       cos_acu_caj = cos_acu_caj - (caj * cosprocaj),
       exi_cor_kgs = exi_cor_kgs + kgs,
       exi_cor_caj = exi_cor_caj + caj,
       can_mes_kgs = can_mes_kgs - kgs,
       can_mes_caj = can_mes_caj - caj,
       can_acu_kgs = can_acu_kgs - kgs,
       can_acu_caj = can_acu_caj - caj
     WHERE inarinv.num_emp=emp AND inarinv.cod_art=art;
  SET LOCK MODE TO NOT WAIT;

-- BORRA TRANSACCION DEL KARDEX
     DELETE FROM inartrinv
       WHERE inartrinv.num_emp=emp   AND inartrinv.cod_art=art
         AND inartrinv.fech_doc=fech AND inartrinv.tip_doc="TI"
         AND inartrinv.num_doc=tik   AND inartrinv.num_suc=suc
         AND inartrinv.ren_art=renglon;

  END FOREACH;

 SELECT cod_cli,raz_soc,dom_cli,ciu_cli,est_cli,imp_exe,imp_15,iva_15,
        des_exe,des_15,ag_fac
   INTO cli,nomcli,domcli,ciucli,estcli,impexe,imp15,iva15,
        desexe,des15,agente
   FROM inarpvt
  WHERE inarpvt.num_emp=emp
    AND inarpvt.num_suc=suc
    AND inarpvt.num_doc=tik;

 LET stot=impexe+imp15-desexe-des15;
 LET tot=impexe+imp15+iva15-desexe-des15;

-- BORRA TICKET
  DELETE FROM inarpvt
        WHERE inarpvt.num_emp=emp
          AND inarpvt.num_suc=suc
          AND inarpvt.num_doc=tik;

-- BORRA CONTROL DE DOCUMENTOS
  DELETE FROM documento
   WHERE documento.num_emp=emp
     AND documento.num_suc=suc
     AND documento.tipo="TI"
     AND documento.numero=tik;

 END IF;
COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".cancela_factinv(emp char(2),suc char(2),
  fac CHAR(10), clavecajera char(12));

-- VARIABLES TRANSACCIONES INVENTARIO
  DEFINE art LIKE inartrinv.cod_art;
  DEFINE kgs LIKE inartrinv.can_kgs;
  DEFINE caj LIKE inartrinv.can_caj;
  DEFINE cosprokgs LIKE inartrinv.cos_pro_kgs;
  DEFINE cosprocaj LIKE inartrinv.cos_pro_caj;
  DEFINE prevtakgs LIKE inartrinv.pre_vta_kgs;
  DEFINE prevtacaj LIKE inartrinv.pre_vta_caj;
  DEFINE desvta LIKE inartrinv.des_vta;
  DEFINE renglon LIKE inartrinv.ren_art;
  DEFINE iva     LIKE inartrinv.iva_art;
-- VARIABLES INVENTARIO
  DEFINE salval    LIKE inarinv.sal_val;
  DEFINE venmeskgs LIKE inarinv.ven_mes_kgs;
  DEFINE venmescaj LIKE inarinv.ven_mes_caj;
  DEFINE venacukgs LIKE inarinv.ven_acu_kgs;
  DEFINE venacucaj LIKE inarinv.ven_acu_caj;
  DEFINE cosmeskgs LIKE inarinv.cos_mes_kgs;
  DEFINE cosmescaj LIKE inarinv.cos_mes_caj;
  DEFINE cosacukgs LIKE inarinv.cos_acu_kgs;
  DEFINE cosacucaj LIKE inarinv.cos_acu_caj;
  DEFINE exicorkgs LIKE inarinv.exi_cor_kgs;
  DEFINE exicorcaj LIKE inarinv.exi_cor_caj;
  DEFINE canmeskgs LIKE inarinv.can_mes_kgs;
  DEFINE canmescaj LIKE inarinv.can_mes_caj;
  DEFINE canacukgs LIKE inarinv.can_acu_kgs;
  DEFINE canacucaj LIKE inarinv.can_acu_caj;
  DEFINE fech      LIKE inartrinv.fech_doc;
-- VARIABLES COSTO DE VENTAS
  DEFINE cosvta LIKE inarfac.cos_vta;
  DEFINE tipart LIKE inarinv.tip_art;
-- VARIABLES FACTURA
  DEFINE cli    LIKE inarfac.cod_cli;
  DEFINE nomcli LIKE inarfac.raz_soc;
  DEFINE domcli LIKE inarfac.dom_cli;
  DEFINE ciucli LIKE inarfac.ciu_cli;
  DEFINE estcli LIKE inarfac.est_cli;
  DEFINE impexe LIKE inarfac.imp_exe;
  DEFINE imp15  LIKE inarfac.imp_15;
  DEFINE desexe LIKE inarfac.des_exe;
  DEFINE des15  LIKE inarfac.des_15;
  DEFINE iva15  LIKE inarfac.iva_15;
  DEFINE tot    LIKE inartrcl.importe;
  DEFINE stot   LIKE inartrcl.importe;
  DEFINE agente LIKE inarfac.ag_fac;

  LET cosvta=0;
BEGIN WORK;
 IF EXISTS(SELECT numero
             FROM documento
            WHERE documento.num_emp=emp
              AND documento.num_suc=suc
              AND documento.tipo="FA"
              AND documento.numero=fac)
 THEN
  FOREACH
    SELECT cod_art,can_kgs,can_caj,pre_vta_kgs,
           pre_vta_caj,des_vta,ren_art,iva_art,fech_doc,
           cos_pro_kgs,cos_pro_caj
      INTO art,kgs,caj,prevtakgs,
           prevtacaj,desvta,renglon,iva,fech,
           cosprokgs,cosprocaj
      FROM inartrinv
     WHERE inartrinv.num_emp=emp AND inartrinv.num_suc=suc
       AND inartrinv.tip_doc="FA" AND inartrinv.num_doc=fac

-- ACTUALIZA INVENTARIO
  SET LOCK MODE TO WAIT;
    UPDATE inarinv SET
       sal_val     = sal_val + (kgs * cosprokgs),
       ven_mes_kgs = ven_mes_kgs - (kgs * prevtakgs),
       ven_mes_caj = ven_mes_caj - (caj * prevtacaj),
       ven_acu_kgs = ven_acu_kgs - (kgs * prevtakgs),
       ven_acu_caj = ven_acu_caj - (caj * prevtacaj),
       cos_mes_kgs = cos_mes_kgs - (kgs * cosprokgs),
       cos_mes_caj = cos_mes_caj - (caj * cosprocaj),
       cos_acu_kgs = cos_acu_kgs - (kgs * cosprokgs),
       cos_acu_caj = cos_acu_caj - (caj * cosprocaj),
       exi_cor_kgs = exi_cor_kgs + kgs,
       exi_cor_caj = exi_cor_caj + caj,
       can_mes_kgs = can_mes_kgs - kgs,
       can_mes_caj = can_mes_caj - caj,
       can_acu_kgs = can_acu_kgs - kgs,
       can_acu_caj = can_acu_caj - caj
     WHERE inarinv.num_emp=emp AND inarinv.cod_art=art;
  SET LOCK MODE TO NOT WAIT;

-- BORRA TRANSACCION DEL KARDEX
     DELETE FROM inartrinv
       WHERE inartrinv.num_emp=emp   AND inartrinv.cod_art=art
         AND inartrinv.fech_doc=fech AND inartrinv.tip_doc="FA"
         AND inartrinv.num_doc=fac   AND inartrinv.num_suc=suc
         AND inartrinv.ren_art=renglon;

  END FOREACH;

 SELECT cod_cli,raz_soc,dom_cli,ciu_cli,est_cli,imp_exe,imp_15,iva_15,
        des_exe,des_15,ag_fac
   INTO cli,nomcli,domcli,ciucli,estcli,impexe,imp15,iva15,
        desexe,des15,agente
   FROM inarfac
  WHERE inarfac.num_emp=emp
    AND inarfac.num_suc=suc
    AND inarfac.num_doc=fac;

 LET stot=impexe+imp15-desexe-des15;
 LET tot=impexe+imp15+iva15-desexe-des15;

-- ACTUALIZA SALDO CLIENTES
SET LOCK MODE TO WAIT;
 UPDATE inarcl
   SET inarcl.com_mes=(com_mes-stot),
       inarcl.com_acu=(com_acu-stot),
       inarcl.cos_mes=(cos_mes-cosvta),
       inarcl.cos_acu=(cos_acu-cosvta),
       inarcl.can_com=(can_com-stot),
       inarcl.fech_com=" ",
       inarcl.sal_act=(sal_act-tot)
   WHERE inarcl.num_emp=emp
     AND inarcl.cod_cli=cli;
SET LOCK MODE TO NOT WAIT;

-- ACTUALIZA VENTA AGENTE
SET LOCK MODE TO WAIT;
 UPDATE inarag
  SET inarag.vta_mes=(vta_mes-stot),
      inarag.vta_acu=(vta_acu-stot),
      inarag.cos_mes=(cos_mes-cosvta),
      inarag.cos_acu=(cos_acu-cosvta)
   WHERE inarag.num_emp=emp
     AND inarag.num_suc=suc
     AND inarag.cod_ag=agente;
SET LOCK MODE TO NOT WAIT;

-- BORRA TRANSACCIONES CLIENTES
  DELETE FROM inartrcl
   WHERE inartrcl.num_emp=emp
     AND inartrcl.num_suc=suc
     AND inartrcl.num_docto=fac
     AND inartrcl.tipo="FA";

-- BORRA FACTURA
  DELETE FROM inarfac
        WHERE inarfac.num_emp=emp
          AND inarfac.num_suc=suc
          AND inarfac.num_doc=fac;

-- BORRA CONTROL DE DOCUMENTOS
  DELETE FROM documento
   WHERE documento.num_emp=emp
     AND documento.num_suc=suc
     AND documento.tipo="FA"
     AND documento.numero=fac;

 END IF;
COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_factick(emp char(2),suc char(2),
  fech date, fac char(10), cli char(8), clavecajera char(12));

-- VARIABLES COSTO DE VENTAS
  DEFINE cosvta LIKE inarfac.cos_vta;
-- VARIABLES FOLTICKETS
  DEFINE ti1    LIKE foltickets.tik1;
  DEFINE ti2    LIKE foltickets.tik2;
  DEFINE ti3    LIKE foltickets.tik3;
  DEFINE ti4    LIKE foltickets.tik4;
  DEFINE ti5    LIKE foltickets.tik5;
  DEFINE ti6    LIKE foltickets.tik6;
-- VARIABLES TICKET
  DEFINE nomcli LIKE inarfac.raz_soc;
  DEFINE domcli LIKE inarfac.dom_cli;
  DEFINE ciucli LIKE inarfac.ciu_cli;
  DEFINE estcli LIKE inarfac.est_cli;
  DEFINE rfccli LIKE inarfac.reg_fed;
  DEFINE impexe LIKE inarfac.imp_exe;
  DEFINE imp15  LIKE inarfac.imp_15;
  DEFINE desexe LIKE inarfac.des_exe;
  DEFINE des15  LIKE inarfac.des_15;
  DEFINE iva15  LIKE inarfac.iva_15;
  DEFINE tot    LIKE inartrcl.importe;
  DEFINE stot   LIKE inartrcl.importe;

 BEGIN WORK;
   SELECT MIN(num_doc) INTO ti1
     FROM inarpvt 
    WHERE inarpvt.num_emp=emp
      AND inarpvt.num_suc=suc
      AND inarpvt.fecha=fech
      AND inarpvt.num_doc BETWEEN 1 AND 1999999;

   SELECT MAX(num_doc) INTO ti2
     FROM inarpvt 
    WHERE inarpvt.num_emp=emp
      AND inarpvt.num_suc=suc
      AND inarpvt.fecha=fech
      AND inarpvt.num_doc BETWEEN 1 AND 1999999;

   SELECT MIN(num_doc) INTO ti3
     FROM inarpvt 
    WHERE inarpvt.num_emp=emp
      AND inarpvt.num_suc=suc
      AND inarpvt.fecha=fech
      AND inarpvt.num_doc BETWEEN 2000000 AND 2999999;

   SELECT MAX(num_doc) INTO ti4
     FROM inarpvt 
    WHERE inarpvt.num_emp=emp
      AND inarpvt.num_suc=suc
      AND inarpvt.fecha=fech
      AND inarpvt.num_doc BETWEEN 2000000 AND 2999999;

   SELECT MIN(num_doc) INTO ti5
     FROM inarpvt 
    WHERE inarpvt.num_emp=emp
      AND inarpvt.num_suc=suc
      AND inarpvt.fecha=fech
      AND inarpvt.num_doc BETWEEN 3000000 AND 3999999;

   SELECT MAX(num_doc) INTO ti6
     FROM inarpvt 
    WHERE inarpvt.num_emp=emp
      AND inarpvt.num_suc=suc
      AND inarpvt.fecha=fech
      AND inarpvt.num_doc BETWEEN 3000000 AND 3999999;

  SELECT SUM(imp_exe),SUM(imp_15),SUM(des_exe),SUM(des_15),SUM(iva_15),
         SUM(cos_vta)
    INTO impexe,imp15,desexe,des15,iva15,cosvta
    FROM inarpvt
   WHERE inarpvt.num_emp=emp
     AND inarpvt.num_suc=suc
     AND inarpvt.fecha=fech;

-- INSERTA FACTURA
 SELECT cod_cli,raz_soc,dom_cli,ciu_cli,est_cli,rfc_cli
   INTO cli,nomcli,domcli,ciucli,estcli,rfccli
   FROM inarcl
  WHERE inarcl.num_emp=emp AND inarcl.cod_cli=cli;

 INSERT INTO inarfac VALUES(emp,suc,fac,cli,nomcli,domcli,ciucli,estcli,
   "nom","dom","pob",0,fech,0,fech,"1",0,impexe,0,
   imp15,0,desexe,0,des15,0,0,iva15,0,cosvta,0,0,0,0,0,0,fech,rfccli,"1",
   clavecajera);

-- INSERTA TRANSACCIONES CLIENTES
 LET stot=impexe+imp15-desexe-des15;
 LET tot=impexe+imp15+iva15-desexe-des15;
 INSERT INTO inartrcl VALUES(emp,suc,cli,"FA",fac,tot,tot,iva15,fech);

-- INSERTA CONTROL DE DOCUMENTOS
  INSERT INTO documento VALUES(emp,suc,"FA",fac,tot,fech);

-- INSERTA CONTROL DE TICKETS
  INSERT INTO foltickets VALUES(emp,suc,fac,ti1,ti2,ti3,ti4,ti5,ti6,fech);

-- ACTUALIZA SALDO CLIENTES
SET LOCK MODE TO WAIT;
 UPDATE inarcl
   SET inarcl.com_mes=(com_mes+stot),
       inarcl.com_acu=(com_acu+stot),
       inarcl.cos_mes=(cos_mes+cosvta),
       inarcl.cos_acu=(cos_acu+cosvta),
       inarcl.can_com=(can_com+stot),
       inarcl.fech_com=fech,
       inarcl.sal_act=(sal_act+tot)
   WHERE inarcl.num_emp=emp
     AND inarcl.cod_cli=cli;
SET LOCK MODE TO NOT WAIT;

SET LOCK MODE TO WAIT;
  UPDATE inarpvt
     SET inarpvt.num_fac=fac,
         inarpvt.fech_fac=fech
   WHERE inarpvt.num_emp=emp
     AND inarpvt.num_suc=suc
     AND fecha=fech;
SET LOCK MODE TO NOT WAIT;

 COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".act_ordencom(emp char(2),suc char(2), fechped date,
  numped  integer,fechent date, nument char(10),numfac char(10));

-- VARIABLES INARPROV
  DEFINE razsoc  LIKE inarprov.raz_soc;
  DEFINE dompro  LIKE inarprov.dom_pro;
  DEFINE ciupro  LIKE inarprov.ciu_pro;
  DEFINE edopro  LIKE inarprov.est_pro;
  DEFINE rfcpro  LIKE inarprov.rfc_pro;
  DEFINE plazo   LIKE inarprov.pla_pro;

-- VARIABLES INARENT
  DEFINE codpro   LIKE inarent.cod_pro;
  DEFINE impexe   LIKE inarent.imp_exe;
  DEFINE imp15    LIKE inarent.imp_15;
  DEFINE iva15    LIKE inarent.iva_15;
  DEFINE fle      LIKE inarent.fle_ent;
  DEFINE ent      LIKE inarent.num_ent;
  DEFINE encon    CHAR(1);

-- VARIABLES INARTRPR
  DEFINE subtot   LIKE inartrpr.imp_ent;
  DEFINE impent   LIKE inartrpr.imp_ent;
  DEFINE fechven  LIKE inartrpr.fech_ven;

-- LEE PEDIDO EN INARPED
  SELECT cod_pro,imp_exe,imp_15,iva_15,flete
    INTO codpro,impexe,imp15,iva15,fle
    FROM inarped WHERE inarped.num_emp=emp AND inarped.num_suc=suc
     AND inarped.num_ped=numped AND inarped.fech_ped=fechped;

-- LEE PROVEEDOR
  SELECT raz_soc,dom_pro,ciu_pro,est_pro,rfc_pro,pla_pro
    INTO razsoc,dompro,ciupro,edopro,rfcpro,plazo
    FROM inarprov
   WHERE inarprov.num_emp=emp AND inarprov.cod_pro=codpro;

-- SUMA IMPORTES Y CALCULA VENCIMIENTOS
  LET subtot=impexe+imp15;
  LET impent=impexe+imp15+iva15;
  LET fechven=fechent+plazo;

-- INSERTA O ACTUALIZA INARENT,INARTRPR,DOCUMENTO
  LET encon="F";
  FOREACH
    SELECT num_ent INTO ent
      FROM inarent
     WHERE inarent.num_emp=emp
       AND inarent.num_suc=suc
       AND inarent.num_ent=nument
      LET encon="T";
  END FOREACH;

  IF encon="F" THEN
     INSERT INTO inarent VALUES(emp,suc,nument,codpro,razsoc,numped,numfac,
            impexe,0,imp15,0,0,0,0,0,0,iva15,0,fle,0,0,0,0,0,0,0,fechent,
            dompro,ciupro,edopro,rfcpro,"placaspro");

     INSERT INTO inartrpr VALUES(emp,suc,nument,"1",codpro,numfac,fechent,
            impent,fechven,impent,iva15,fechent);

     INSERT INTO documento VALUES(emp,suc,"CO",nument,impent,fechent);
  ELSE
   SET LOCK MODE TO WAIT;
     UPDATE inarent SET
            inarent.imp_exe=inarent.imp_exe+impexe,
            inarent.imp_15 =inarent.imp_15+imp15,
            inarent.iva_15 =inarent.iva_15+iva15,
            inarent.fle_ent=inarent.fle_ent+fle
      WHERE inarent.num_emp=emp AND inarent.num_suc=suc
        AND inarent.num_ent=nument;
   SET LOCK MODE TO NOT WAIT;

   SET LOCK MODE TO WAIT;
     UPDATE inartrpr SET
            inartrpr.imp_ent=inartrpr.imp_ent+impent,
            inartrpr.sal_ent=inartrpr.sal_ent+impent
      WHERE inartrpr.num_emp=emp
        AND inartrpr.num_suc=suc
        AND inartrpr.num_ent=nument
        AND inartrpr.tip_ent="1";
   SET LOCK MODE TO NOT WAIT;

   SET LOCK MODE TO WAIT;
     UPDATE documento SET
            documento.importe=documento.importe+impent
      WHERE documento.num_emp=emp
        AND documento.num_suc=suc
        AND documento.tipo="CO"
        AND documento.numero=nument;
   SET LOCK MODE TO NOT WAIT;
  END IF;

-- ACTUALIZA INARTRINV CAMBIA DE AC A CO Y AGREGA NUM_ENT Y FECH_ENT
 SET LOCK MODE TO WAIT;
  UPDATE inartrinv SET
         inartrinv.tip_doc="CO",
         inartrinv.num_ent=nument,
         inartrinv.fech_ent=fechent
   WHERE inartrinv.num_emp=emp
     AND inartrinv.num_suc=suc
     AND inartrinv.tip_doc="AC"
     AND inartrinv.num_doc=numped
     AND inartrinv.fech_doc=fechped;
 SET LOCK MODE TO NOT WAIT;

-- ACTUALIZA SALDO PROVEEDOR
 SET LOCK MODE TO WAIT;
  UPDATE inarprov SET
         inarprov.com_mes=inarprov.com_mes+subtot,
         inarprov.com_acu=inarprov.com_acu+subtot,
         inarprov.can_com=inarprov.can_com+subtot,
         inarprov.fech_com=fechent,
         inarprov.sal_act=inarprov.sal_act+impent
   WHERE inarprov.num_emp=emp
     AND inarprov.cod_pro=codpro;
 SET LOCK MODE TO NOT WAIT;

-- ACTUALIZA ESTATUS DE PEDIDO A COMPRA
 SET LOCK MODE TO WAIT;
  UPDATE inarped SET
         inarped.estado="C"
   WHERE inarped.num_emp=emp
     AND inarped.num_suc=suc
     AND inarped.num_ped=numped;
 SET LOCK MODE TO NOT WAIT;
END PROCEDURE;

CREATE PROCEDURE "xxx".cancela_ped(emp CHAR(2),suc CHAR(2),ped CHAR(10));

-- VARIABLES INVENTARIO
   DEFINE canemp    LIKE inarinv.can_emp;
   DEFINE exicorkgs LIKE inarinv.exi_cor_kgs;
   DEFINE exicorcaj LIKE inarinv.exi_cor_caj;
   DEFINE ultcoskgs LIKE inarinv.ult_cos_kgs;
   DEFINE ultcoscaj LIKE inarinv.ult_cos_caj;
   DEFINE cosprokgs LIKE inarinv.cos_pro_kgs;
   DEFINE cosprocaj LIKE inarinv.cos_pro_caj;
   DEFINE salval    LIKE inarinv.sal_val;
   DEFINE tipart    LIKE inarinv.tip_art;

-- VARIABLES INARENT
  DEFINE fechent   LIKE inarped.fech_ped;
  DEFINE codpro    LIKE inarped.cod_pro;
  DEFINE impexe    LIKE inarped.imp_exe;
  DEFINE imp15     LIKE inarped.imp_15;
  DEFINE iva15     LIKE inarped.iva_15;
  DEFINE desexe    LIKE inarped.des_exe;
  DEFINE des15     LIKE inarped.des_15;

-- VARIABLES INARTRINV  KARDEX
  DEFINE art       LIKE inartrinv.cod_art;
  DEFINE kgs       LIKE inartrinv.can_kgs;
  DEFINE caj       LIKE inartrinv.can_caj;
  DEFINE cosunikgs LIKE inartrinv.cos_uni_kgs;
  DEFINE cosunicaj LIKE inartrinv.cos_uni_caj;
  DEFINE desvta    LIKE inartrinv.des_vta;
  DEFINE renglon   LIKE inartrinv.ren_art;
  DEFINE iva       LIKE inartrinv.iva_art;
  DEFINE fech      LIKE inartrinv.fech_doc;

-- VARIABLES INARTRPR
  DEFINE subtot   LIKE inartrpr.imp_ent;
  DEFINE impent   LIKE inartrpr.imp_ent;

-- BUSCA COMPRA
BEGIN WORK;
IF EXISTS(SELECT numero
            FROM documento
           WHERE documento.num_emp=emp
             AND documento.num_suc=suc
             AND documento.tipo="AC"
             AND documento.numero=ped)
THEN
  FOREACH
    SELECT cod_art,can_kgs,can_caj,cos_uni_kgs,
           cos_uni_caj,ren_art,iva_art,fech_doc,
           cos_pro_kgs,cos_pro_caj
      INTO art,kgs,caj,cosunikgs,
           cosunicaj,renglon,iva,fech,
           cosprokgs,cosprocaj
      FROM inartrinv
     WHERE inartrinv.num_emp=emp  AND inartrinv.num_suc=suc
       AND inartrinv.tip_doc="AC" AND inartrinv.num_doc=ped

-- BUSCA INVENTARIO
    SELECT can_emp,exi_cor_kgs,exi_cor_caj,ult_cos_kgs,ult_cos_caj,
           cos_pro_kgs,cos_pro_caj,tip_art,sal_val  
      INTO canemp,exicorkgs,exicorcaj,ultcoskgs,ultcoscaj,
           cosprokgs,cosprocaj,tipart,salval
      FROM inarinv
     WHERE inarinv.num_emp=emp
       AND inarinv.cod_art=art;

     IF tipart="K" THEN
        LET exicorkgs = exicorkgs - kgs;
        LET salval = salval - (kgs*cosunikgs);
        LET exicorcaj = exicorcaj - caj;
        LET canemp = exicorkgs / exicorcaj;
     END IF;

     IF tipart="C" THEN
        LET exicorcaj = exicorcaj - caj;
        LET salval = salval - (caj*cosunicaj);
        LET exicorkgs = exicorkgs - kgs;
        LET canemp = exicorkgs / exicorcaj;
     END IF;

     LET cosprokgs = salval / exicorkgs;
     LET cosprocaj = salval / exicorcaj;

-- ACTUALIZA INVENTARIO
   SET LOCK MODE TO WAIT;
     UPDATE inarinv SET exi_cor_kgs=exicorkgs,
                        exi_cor_caj=exicorcaj,
                        cos_pro_kgs=cosprokgs,
                        cos_pro_caj=cosprocaj,
                        sal_val=salval,
                        can_emp=canemp
      WHERE inarinv.num_emp=emp
        AND inarinv.cod_art=art;
   SET LOCK MODE TO NOT WAIT;

-- BORRA TRANSACCION KARDEX
     DELETE FROM inartrinv
       WHERE inartrinv.num_emp=emp    AND inartrinv.cod_art=art
         AND inartrinv.fech_doc=fech  AND inartrinv.tip_doc="AC"
         AND inartrinv.num_doc=ped    AND inartrinv.num_suc=suc
         AND inartrinv.ren_art=renglon;
  END FOREACH;

-- BUSCA ENTRADA
  SELECT imp_exe,imp_15,iva_15,des_exe,des_15
    INTO impexe,imp15,iva15,desexe,des15
    FROM inarped
   WHERE inarped.num_emp=emp
     AND inarped.num_suc=suc
     AND inarped.num_ped=ped;

-- SUMA IMPORTES 
  LET subtot=impexe+imp15-desexe-des15;
  LET impent=impexe+imp15+iva15-desexe-des15;

-- BORRA INARPED,DOCUMENTO
     DELETE FROM inarped
      WHERE inarped.num_emp=emp
        AND inarped.num_suc=suc
        AND inarped.num_ped=ped;

     DELETE FROM documento
      WHERE documento.num_emp=emp
        AND documento.num_suc=suc
        AND documento.tipo="AC"
        AND documento.numero=ped;

END IF;
COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_ped(emp CHAR(2),suc CHAR(2),ped CHAR(10),
 codpro CHAR(8),fech DATE, impexe DECIMAL(12,4),imp15 DECIMAL(12,4),
 desexe DECIMAL(10,4), des15 DECIMAL(10,4), iva15 DECIMAL(10,4),
 flete DECIMAL(10,4), ivafle DECIMAL(10,4));

-- VARIABLES TIPO DE PROVEEDOR CREDITO=1 CONTADO=2 PAGO ANTICIPADO=3
  DEFINE conpro LIKE inarprov.con_pro;

-- VARIABLES documento
  DEFINE tot    DECIMAL(12,2);
  LET tot=impexe+imp15-desexe-des15+iva15;

-- BUSCA INFORMACION PROVEEDOR
  SELECT con_pro
    INTO conpro
    FROM inarprov
   WHERE inarprov.num_emp=emp
     AND inarprov.cod_pro=codpro;

-- INSERTA inarped
  INSERT INTO inarped VALUES(emp,suc,ped,codpro,0,fech," ",conpro,impexe,
                     imp15,desexe,des15,iva15,flete,ivafle,"P");

-- INSERTA DOCUMENTO
  INSERT INTO documento VALUES(emp,suc,"AC",ped,tot,fech);

END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_tr_ped(emp CHAR(2),suc CHAR(2),art CHAR(14),
 ped INTEGER,fech DATE,kgs DECIMAL(10,4),caj DECIMAL(10,4),fle DECIMAL(12,4),
 cosuni DECIMAL(12,4), codpro CHAR(8), iva DECIMAL(12,4), des DECIMAL(12,4),
 ren SMALLINT);

-- VARIABLES INVENTARIO
   DEFINE canemp  DECIMAL(10,4);
   DEFINE exicorkgs DECIMAL(10,4);
   DEFINE exicorcaj DECIMAL(10,4);
   DEFINE ultcoskgs DECIMAL(12,4);
   DEFINE ultcoscaj DECIMAL(12,4);
   DEFINE cosprokgs DECIMAL(12,4);
   DEFINE cosprocaj DECIMAL(12,4);
   DEFINE salval    DECIMAL(14,4);
   DEFINE tipart     CHAR(1);


  SELECT can_emp,exi_cor_kgs,exi_cor_caj,ult_cos_kgs,ult_cos_caj,
         cos_pro_kgs,cos_pro_caj,tip_art,sal_val  INTO
         canemp,exicorkgs,exicorcaj,ultcoskgs,ultcoscaj,
         cosprokgs,cosprocaj,tipart,salval
  FROM inarinv
  WHERE inarinv.num_emp=emp
    AND inarinv.cod_art=art;


     IF tipart="K" THEN
        LET exicorkgs = exicorkgs + kgs;
        LET ultcoskgs = cosuni;
        LET salval = salval + (kgs*cosuni);
        LET exicorcaj = exicorcaj + caj;
        LET canemp = exicorkgs / exicorcaj;
        LET ultcoscaj = (kgs*cosuni) / caj;
     END IF;

     IF tipart="C" THEN
        LET exicorcaj = exicorcaj + caj;
        LET ultcoscaj = cosuni;
        LET salval = salval + (caj*cosuni);
        LET exicorkgs = exicorkgs + kgs;
        LET canemp = exicorkgs / exicorcaj;
        LET ultcoskgs = (caj*cosuni) / kgs;
     END IF;

     LET cosprokgs = salval / exicorkgs;
     LET cosprocaj = salval / exicorcaj;

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
      WHERE inarinv.num_emp=emp
        AND inarinv.cod_art=art;
   SET LOCK MODE TO NOT WAIT;
             
END PROCEDURE;

CREATE PROCEDURE "xxx".mod_trinvcom(emp char(2),suc char(2), doc char(10),
  tipdoc CHAR(2), artold char(14), artnew char(14));

-- VARIABLES TRANSACCIONES INVENTARIO
  DEFINE kgs LIKE inartrinv.can_kgs;
  DEFINE caj LIKE inartrinv.can_caj;
  DEFINE cosprokgs LIKE inartrinv.cos_pro_kgs;
  DEFINE cosprocaj LIKE inartrinv.cos_pro_caj;
  DEFINE prevtakgs LIKE inartrinv.pre_vta_kgs;
  DEFINE prevtacaj LIKE inartrinv.pre_vta_caj;
  DEFINE desvta LIKE inartrinv.des_vta;
  DEFINE renglon LIKE inartrinv.ren_art;
  DEFINE iva     LIKE inartrinv.iva_art;
-- VARIABLES INVENTARIO
  DEFINE salval    LIKE inarinv.sal_val;
  DEFINE venmeskgs LIKE inarinv.ven_mes_kgs;
  DEFINE venmescaj LIKE inarinv.ven_mes_caj;
  DEFINE venacukgs LIKE inarinv.ven_acu_kgs;
  DEFINE venacucaj LIKE inarinv.ven_acu_caj;
  DEFINE cosmeskgs LIKE inarinv.cos_mes_kgs;
  DEFINE cosmescaj LIKE inarinv.cos_mes_caj;
  DEFINE cosacukgs LIKE inarinv.cos_acu_kgs;
  DEFINE cosacucaj LIKE inarinv.cos_acu_caj;
  DEFINE exicorkgs LIKE inarinv.exi_cor_kgs;
  DEFINE exicorcaj LIKE inarinv.exi_cor_caj;
  DEFINE canmeskgs LIKE inarinv.can_mes_kgs;
  DEFINE canmescaj LIKE inarinv.can_mes_caj;
  DEFINE canacukgs LIKE inarinv.can_acu_kgs;
  DEFINE canacucaj LIKE inarinv.can_acu_caj;
  DEFINE fech      LIKE inartrinv.fech_doc;
-- VARIABLES COSTO DE VENTAS
  DEFINE cosvta LIKE inarpvt.cos_vta;
  DEFINE tipart LIKE inarinv.tip_art;
-- VARIABLES FACTURA
  DEFINE tot    LIKE inartrcl.importe;
  DEFINE stot   LIKE inartrcl.importe;

  LET cosvta=0;
BEGIN WORK;
 IF EXISTS(SELECT numero
             FROM documento
            WHERE documento.num_emp=emp
              AND documento.num_suc=suc
              AND documento.tipo=tipdoc
              AND documento.numero=doc)
 THEN
  FOREACH
    SELECT can_kgs,can_caj,pre_vta_kgs,
           pre_vta_caj,des_vta,ren_art,iva_art,fech_doc,
           cos_pro_kgs,cos_pro_caj
      INTO kgs,caj,prevtakgs,
           prevtacaj,desvta,renglon,iva,fech,
           cosprokgs,cosprocaj
      FROM inartrinv
     WHERE inartrinv.num_emp=emp    AND inartrinv.num_suc=suc
       AND inartrinv.tip_doc=tipdoc AND inartrinv.num_doc=doc
       AND inartrinv.cod_art=artold

-- ACTUALIZA INVENTARIO ARTICULO ERRONEO
  SET LOCK MODE TO WAIT;
    UPDATE inarinv SET
       sal_val     = sal_val - (kgs * cosprokgs),
       exi_cor_kgs = exi_cor_kgs - kgs,
       exi_cor_caj = exi_cor_caj - caj
     WHERE inarinv.num_emp=emp AND inarinv.cod_art=artold;
  SET LOCK MODE TO NOT WAIT;

-- ACTUALIZA INVENTARIO ARTICULO CORRECTO
  SET LOCK MODE TO WAIT;
    UPDATE inarinv SET
       sal_val     = sal_val + (kgs * cosprokgs),
       exi_cor_kgs = exi_cor_kgs + kgs,
       exi_cor_caj = exi_cor_caj + caj
     WHERE inarinv.num_emp=emp AND inarinv.cod_art=artnew;
  SET LOCK MODE TO NOT WAIT;

-- ACTUALIZA TRANSACCION DEL KARDEX
     UPDATE inartrinv
         SET inartrinv.cod_art=artnew
       WHERE inartrinv.num_emp=emp   AND inartrinv.cod_art=artold
         AND inartrinv.fech_doc=fech AND inartrinv.tip_doc=tipdoc
         AND inartrinv.num_doc=doc   AND inartrinv.num_suc=suc
         AND inartrinv.ren_art=renglon;

  END FOREACH;

 END IF;
COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_entdiv(emp CHAR(2),suc CHAR(2),
 doc INTEGER,fech DATE,imp DECIMAL(14,4), concept CHAR(80));

   INSERT INTO inardiverso
   VALUES(emp,suc,fech,doc,"ED",imp,0,0,concept);

END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_saldiv(emp CHAR(2),suc CHAR(2),
 doc INTEGER,fech DATE,imp DECIMAL(14,4), concept CHAR(80));

   INSERT INTO inardiverso
   VALUES(emp,suc,fech,doc,"SD",imp,0,0,concept);

END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_tr_entdiv(emp CHAR(2),suc CHAR(2),art CHAR(14),
 doc INTEGER,fech DATE,kgs DECIMAL(10,4),caj DECIMAL(10,4),
 cosprokgs DECIMAL(12,4), cosprocaj DECIMAL(12,4), ren SMALLINT);

   INSERT INTO inartrinv 
   VALUES(emp,art,suc,fech,"ED",doc,kgs,caj,0,0,cosprokgs,
         cosprocaj,0,0,0,0,ren," "," ",0," ",0);

   SET LOCK MODE TO WAIT;
     UPDATE inarinv SET exi_cor_kgs=exi_cor_kgs + kgs,
                        exi_cor_caj=exi_cor_caj + caj
      WHERE inarinv.num_emp=emp
        AND inarinv.cod_art=art;
   SET LOCK MODE TO NOT WAIT;
END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_tr_saldiv(emp CHAR(2),suc CHAR(2),art CHAR(14),
 doc INTEGER,fech DATE,kgs DECIMAL(10,4),caj DECIMAL(10,4),
 cosprokgs DECIMAL(12,4), cosprocaj DECIMAL(12,4), ren SMALLINT);

   INSERT INTO inartrinv 
   VALUES(emp,art,suc,fech,"SD",doc,kgs,caj,0,0,cosprokgs,
         cosprocaj,0,0,0,0,ren," "," ",0," ",0);

   SET LOCK MODE TO WAIT;
     UPDATE inarinv SET exi_cor_kgs=exi_cor_kgs - kgs,
                        exi_cor_caj=exi_cor_caj - caj
      WHERE inarinv.num_emp=emp
        AND inarinv.cod_art=art;
   SET LOCK MODE TO NOT WAIT;
END PROCEDURE;

CREATE PROCEDURE "xxx".cancela_consolidado(emp char(2),suc char(2),
  nument integer);

-- VARIABLES INARENT
  DEFINE codpro   LIKE inarent.cod_pro;
  DEFINE impexe   LIKE inarent.imp_exe;
  DEFINE imp15    LIKE inarent.imp_15;
  DEFINE iva15    LIKE inarent.iva_15;
  DEFINE numped   LIKE inarped.num_ped;

-- VARIABLES INARTRPR
  DEFINE subtot   LIKE inartrpr.imp_ent;
  DEFINE impent   LIKE inartrpr.imp_ent;

BEGIN WORK;
  IF EXISTS(SELECT numero
              FROM documento
             WHERE documento.num_emp=emp
               AND documento.num_suc=suc
               AND documento.tipo="CO"
               AND documento.numero=nument)
  THEN
    FOREACH
    SELECT num_doc
      INTO numped
      FROM inartrinv
     WHERE inartrinv.num_emp=emp
       AND inartrinv.num_suc=suc
       AND inartrinv.tip_doc="CO"
       AND inartrinv.num_ent=nument
       AND inartrinv.ren_art=1

-- ACTUALIZA ESTATUS DE PEDIDO A ORDEN DE COMPRA
     SET LOCK MODE TO WAIT;
      UPDATE inarped
         SET inarped.estado="P"
       WHERE inarped.num_emp=emp
         AND inarped.num_suc=suc
         AND inarped.num_ped=numped;
     SET LOCK MODE TO NOT WAIT;
    END FOREACH;

-- LEE ENTRADA
    SELECT cod_pro, imp_exe, imp_15, iva_15
      INTO codpro, impexe, imp15, iva15
      FROM inarent
     WHERE inarent.num_emp=emp
       AND inarent.num_suc=suc
       AND inarent.num_ent=nument;

  LET subtot=impexe+imp15;
  LET impent=impexe+imp15+iva15;

-- ACTUALIZA KARDEX NUM_ENT Y FECH_ENT
  SET LOCK MODE TO WAIT;
    UPDATE inartrinv
       SET inartrinv.tip_doc="AC",
           inartrinv.num_ent=0,
           inartrinv.fech_ent=" "
     WHERE inartrinv.num_emp=emp
       AND inartrinv.num_suc=suc
       AND inartrinv.tip_doc="CO"
       AND inartrinv.num_ent=nument;
  SET LOCK MODE TO NOT WAIT;

-- ACTUALIZA SALDO PROVEEDOR
   SET LOCK MODE TO WAIT;
    UPDATE inarprov
       SET inarprov.com_mes=inarprov.com_mes-subtot,
           inarprov.com_acu=inarprov.com_acu-subtot,
           inarprov.can_com=inarprov.can_com-subtot,
           inarprov.sal_act=inarprov.sal_act-impent
     WHERE inarprov.num_emp=emp
       AND inarprov.cod_pro=codpro;
   SET LOCK MODE TO NOT WAIT;

-- BORRA INARENT
   DELETE FROM inarent
         WHERE inarent.num_emp=emp
           AND inarent.num_suc=suc
           AND inarent.num_ent=nument;

   DELETE FROM inartrpr
         WHERE inartrpr.num_emp=emp
           AND inartrpr.num_suc=suc
           AND inartrpr.num_ent=nument
           AND inartrpr.tip_ent="1";

   DELETE FROM documento
         WHERE documento.num_emp=emp
           AND documento.num_suc=suc
           AND documento.tipo="CO"
           AND documento.numero=nument;
  END IF;
COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".loc_kardexneg(emp CHAR(2), fech_ini DATE, 
                                     fech_fin DATE);

DEFINE art      LIKE inarinv.cod_art;
DEFINE exi_kgs  LIKE inarinv.exi_cor_kgs;
DEFINE exi_caj  LIKE inarinv.exi_cor_caj;
DEFINE pro_kgs  LIKE inarinv.cos_pro_kgs;
DEFINE pro_caj  LIKE inarinv.cos_pro_caj;
DEFINE canemp   LIKE inarinv.can_emp;
DEFINE tipart   LIKE inarinv.tip_art;
DEFINE val      LIKE inarinv.sal_val;
DEFINE prom     LIKE inventario.cos_pro;
DEFINE tkgs     LIKE inartrinv.can_kgs;
DEFINE tcaj     LIKE inartrinv.can_caj;
DEFINE kgs      LIKE inartrinv.can_kgs;
DEFINE caj      LIKE inartrinv.can_caj;
DEFINE uni_kgs  LIKE inartrinv.cos_uni_kgs;
DEFINE uni_caj  LIKE inartrinv.cos_uni_caj;
DEFINE tipdoc   LIKE inartrinv.tip_doc;
DEFINE numdoc   LIKE inartrinv.num_doc;
DEFINE fech     LIKE inartrinv.fech_doc;
DEFINE suc      LIKE inartrinv.num_suc;
DEFINE renglon  LIKE inartrinv.ren_art;
DEFINE enc      CHAR(1);

-- INICIALIZA TABLA TEMPORAL
DELETE FROM tmp_kardexneg;
DELETE FROM log_actkardex;

BEGIN WORK;
-- LEE CATALOGO DE ARTICULOS
FOREACH
  SELECT cod_art,tip_art
    INTO art,tipart
    FROM inarinv
   WHERE inarinv.num_emp=emp
   ORDER BY cod_art

  IF EXISTS(SELECT cod_art
              FROM inventario
             WHERE inventario.num_emp=emp
               AND inventario.fecha=fech_ini
               AND inventario.cod_art=art)
  THEN
     LET enc="S";
  ELSE
     LET enc="N";
  END IF;

-- SELECCIONA INVENTARIO INICIAL DEL ARTICULO
  IF enc = "S" THEN
     SELECT can_kgs, can_caj, can_emp, cos_pro
       INTO exi_kgs, exi_caj, canemp, prom
       FROM inventario
      WHERE inventario.num_emp=emp
        AND inventario.fecha=fech_ini
        AND inventario.cod_art=art;
  ELSE
      LET exi_kgs=0;
      LET exi_caj=0;
      LET canemp=0;
      LET prom=0;
  END IF;

  IF tipart="K" THEN
     LET pro_kgs = prom;
     LET val     = pro_kgs * exi_kgs;
     IF exi_caj <> 0 THEN
        LET pro_caj = val / exi_caj;
     ELSE
        LET pro_caj = 0;
     END IF;
  END IF;

  IF tipart="C" THEN
     LET pro_caj = prom;
     LET val     = pro_caj * exi_caj;
     IF exi_kgs <> 0 THEN
        LET pro_kgs = val / exi_kgs;
     ELSE
        LET pro_kgs = 0;
     END IF;
  END IF; 

--BEGIN WORK;
-- SELECCIONA MOVIMIENTOS KARDEX
   FOREACH 
     SELECT can_kgs,can_caj,cos_uni_kgs, cos_uni_caj,
            num_suc, tip_doc, fech_doc, num_doc, ren_art
       INTO kgs,caj,uni_kgs, uni_caj,
            suc, tipdoc, fech, numdoc, renglon
       FROM inartrinv
      WHERE inartrinv.num_emp=emp
        AND inartrinv.cod_art=art
        AND inartrinv.fech_doc BETWEEN fech_ini AND fech_fin
      ORDER BY fech_doc, tip_doc, num_doc

-- SI SON COMPRAS
    IF tipdoc="AC" or tipdoc="CO" THEN

       IF tipart="K" THEN
          LET exi_kgs = exi_kgs + kgs;
          LET val     = val + (kgs * uni_kgs);
          LET exi_caj = exi_caj + caj;
       END IF;

       IF tipart="C" THEN
          LET exi_caj = exi_caj + caj;
          LET val     = val + (caj * uni_caj);
          LET exi_kgs = exi_kgs + kgs;
       END IF;

       IF exi_kgs <> 0 THEN
          LET pro_kgs = val / exi_kgs;
       ELSE
          LET pro_kgs = 0;
          INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
                      exi_caj,canemp,"CO  EXIST. EN KGS 0");
       END IF;
       IF exi_caj <> 0 THEN
          LET pro_caj = val / exi_caj;
          LET canemp  = exi_kgs / exi_caj;
       ELSE
          LET pro_caj = 0;
          LET canemp  = 0;
          INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
                      exi_caj,canemp,"CO  EXIST. EN CAJ 0");
       END IF;

-- ACTUALIZA KARDEX
--     UPDATE inartrinv
--        SET inartrinv.cos_pro_kgs=pro_kgs,
--            inartrinv.cos_pro_caj=pro_caj 
--      WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
--        AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
--        AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
--        AND inartrinv.ren_art=renglon;

--      UPDATE inarinv
--         SET inarinv.ult_cos_kgs = uni_kgs,
--             inarinv.ult_cos_caj = uni_caj,
--             inarinv.cos_pro_kgs = pro_kgs,
--             inarinv.cos_pro_caj = pro_caj,
--             inarinv.can_emp     = canemp
--       WHERE inarinv.num_emp=emp
--         AND inarinv.cod_art=art;

    END IF;

-- SI SON DEVOLUCIONES COMPRAS
    IF tipdoc="DC" THEN

       IF tipart="K" THEN
          LET exi_kgs = exi_kgs - kgs;
          LET val     = val - (kgs * uni_kgs);
          LET exi_caj = exi_caj - caj;
       END IF;

       IF tipart="C" THEN
          LET exi_caj = exi_caj - caj;
          LET val     = val - (caj * uni_caj);
          LET exi_kgs = exi_kgs - kgs;
       END IF;

       IF exi_kgs <> 0 THEN
          LET pro_kgs = val / exi_kgs;
       ELSE
          LET pro_kgs = 0;
          INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
                      exi_caj,canemp,"DC  EXIST. EN KGS 0");
       END IF;
       IF exi_caj <> 0 THEN
          LET pro_caj = val / exi_caj;
          LET canemp  = exi_kgs / exi_caj;
       ELSE
          LET pro_caj = 0;
          LET canemp  = 0;
          INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
                      exi_caj,canemp,"DC  EXIST. EN CAJ 0");
       END IF;
-- ACTUALIZA KARDEX
--     UPDATE inartrinv
--        SET inartrinv.cos_pro_kgs=pro_kgs,
--            inartrinv.cos_pro_caj=pro_caj 
--      WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
--        AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
--        AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
--        AND inartrinv.ren_art=renglon;

--      UPDATE inarinv
--         SET inarinv.ult_cos_kgs = uni_kgs,
--             inarinv.ult_cos_caj = uni_caj,
--             inarinv.cos_pro_kgs = pro_kgs,
--             inarinv.cos_pro_caj = pro_caj,
--             inarinv.can_emp     = canemp
--       WHERE inarinv.num_emp=emp
--         AND inarinv.cod_art=art;
    END IF;


-- SI SON ENTRADAS DIVERSAS
    IF tipdoc="ED" THEN
       IF canemp = 0 THEN
          INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
                      exi_caj,canemp,"(ED) CAN_EMP EN 0   ");
       END IF;
       IF tipart="K" THEN
          LET exi_kgs = exi_kgs + kgs;
          LET val     = val + (kgs * pro_kgs);
          IF canemp <> 0 THEN
             LET caj     = kgs / canemp;
          ELSE
             LET caj     = 0;
          END IF;
          LET exi_caj = exi_caj + caj;
       END IF; 
       IF tipart="C" THEN
          LET exi_caj = exi_caj + caj;
          LET val     = val + (caj * pro_caj);
          LET kgs     = caj * canemp;
          LET exi_kgs = exi_kgs + kgs;
       END IF; 


-- ACTUALIZA KARDEX
--     UPDATE inartrinv
--        SET inartrinv.cos_pro_kgs=pro_kgs,
--            inartrinv.cos_pro_caj=pro_caj,
--            inartrinv.can_kgs=kgs,
--            inartrinv.can_caj=caj 
--      WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
--        AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
--        AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
--        AND inartrinv.ren_art=renglon;
    END IF;


-- SI SON SALIDAS DIVERSAS
    IF tipdoc="SD" THEN
       IF canemp = 0 THEN
          INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
                      exi_caj,canemp,"(SD) CAN_EMP EN 0   ");
       END IF;
       IF tipart="K" THEN
          LET exi_kgs = exi_kgs - kgs;
          LET val     = val - (kgs * pro_kgs);
          IF canemp <> 0 THEN
             LET caj     = kgs / canemp;
          ELSE
             LET caj     = 0;
          END IF;
          LET exi_caj = exi_caj - caj;
       END IF; 
       IF tipart="C" THEN
          LET exi_caj = exi_caj - caj;
          LET val     = val - (caj * pro_caj);
          LET kgs     = caj * canemp;
          LET exi_kgs = exi_kgs - kgs;
       END IF; 


-- ACTUALIZA KARDEX
--     UPDATE inartrinv
--        SET inartrinv.cos_pro_kgs=pro_kgs,
--            inartrinv.cos_pro_caj=pro_caj,
--            inartrinv.can_kgs=kgs,
--            inartrinv.can_caj=caj 
--      WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
--        AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
--        AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
--        AND inartrinv.ren_art=renglon;
    END IF;


-- SI SON DEVOLUCIONES SOBRE VENTAS
    IF tipdoc="DV" THEN
       IF canemp = 0 THEN
          INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
                      exi_caj,canemp,"(DV) CAN_EMP EN 0   ");
       END IF;
       IF tipart="K" THEN
          LET exi_kgs = exi_kgs + kgs;
          LET val     = val + (kgs * pro_kgs);
          IF canemp <> 0 THEN
             LET caj     = kgs / canemp;
          ELSE
             LET caj     = 0;
          END IF;
          LET exi_caj = exi_caj + caj;
       END IF; 
       IF tipart="C" THEN
          LET exi_caj = exi_caj + caj;
          LET val     = val + (caj * pro_caj);
          LET kgs     = caj * canemp;
          LET exi_kgs = exi_kgs + kgs;
       END IF; 

-- ACTUALIZA KARDEX
--     UPDATE inartrinv
--        SET inartrinv.cos_pro_kgs=pro_kgs,
--            inartrinv.cos_pro_caj=pro_caj,
--            inartrinv.can_kgs=kgs,
--            inartrinv.can_caj=caj 
--      WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
--        AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
--        AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
--        AND inartrinv.ren_art=renglon;
    END IF;
 
-- SI SON VENTAS
    IF tipdoc="FA" or tipdoc="TI" THEN
       SELECT kilos, cajas
         INTO tkgs, tcaj
         FROM tmp_kardex
        WHERE tmp_kardex.factura  = numdoc
          AND tmp_kardex.tipo_doc = tipdoc
          AND tmp_kardex.codigo   = art
          AND tmp_kardex.ren      = renglon;

       IF canemp = 0 THEN
          INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
                      exi_caj,canemp,"VTA  CAN_EMP EN 0   ");
       END IF;

       IF (tkgs > 0)  AND (tcaj > 0) THEN
          LET caj     = tcaj;
          LET kgs     = tkgs;
       END IF;
       IF (tkgs > 0)  AND (tcaj = 0) THEN
          IF canemp <> 0 THEN
             LET caj     = tkgs / canemp;
          ELSE
             LET caj     = 0;
          END IF;
       END IF;
       IF (tkgs = 0) AND (tcaj > 0) THEN
          LET kgs     = tcaj * canemp;
       END IF;
       IF tipart="K" THEN
          LET exi_kgs = exi_kgs - kgs;
          LET val     = val - (kgs * pro_kgs);
          LET exi_caj = exi_caj - caj;
       END IF; 
       IF tipart="C" THEN
          LET exi_caj = exi_caj - caj;
          LET val     = val - (caj * pro_caj);
          LET exi_kgs = exi_kgs - kgs;
       END IF; 

-- ACTUALIZA KARDEX
--     UPDATE inartrinv
--        SET inartrinv.cos_pro_kgs=pro_kgs,
--            inartrinv.cos_pro_caj=pro_caj,
--            inartrinv.can_kgs=kgs,
--            inartrinv.can_caj=caj 
--      WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
--        AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
--        AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
--        AND inartrinv.ren_art=renglon;
    END IF;
IF exi_kgs < 0 OR exi_caj < 0 THEN
   INSERT INTO tmp_kardexneg VALUES(fech,art,tipdoc,numdoc,
          exi_kgs,exi_caj,canemp,renglon);
END IF;
   END FOREACH;
-- COMMIT WORK;

--PDATE inarinv
--  SET inarinv.exi_cor_kgs=exi_kgs,
--      inarinv.exi_cor_caj=exi_caj,
--      inarinv.can_emp=canemp,
--      inarinv.sal_val=val,
--      inarinv.cos_pro_kgs=pro_kgs,
--      inarinv.cos_pro_caj=pro_caj
--WHERE inarinv.num_emp=emp
--  AND inarinv.cod_art=art;

END FOREACH; 
 COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".act_ctofactik(emp char(2), fech_ini date,
  fech_fin date);

-- VARIABLES COSTO DE VENTAS
  DEFINE cosvta LIKE inarfac.cos_vta;
  DEFINE numfac LIKE inarpvt.num_fac;
  DEFINE fech   LIKE inarpvt.fech_fac;

 BEGIN WORK;
   FOREACH
      SELECT num_fac,fech_fac
        INTO numfac,fech
        FROM inarpvt
       WHERE inarpvt.num_emp=emp
         AND inarpvt.fech_fac BETWEEN fech_ini AND fech_fin

       SELECT SUM(cos_vta)
         INTO cosvta
         FROM inarpvt
        WHERE inarpvt.num_emp=emp
          AND inarpvt.num_fac=numfac
          AND inarpvt.fecha=fech;

     UPDATE inarfac
        SET inarfac.cos_vta=cosvta
      WHERE inarfac.num_emp=emp
        AND inarfac.num_doc=numfac;
   END FOREACH;
 COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".act_costovta(emp CHAR(2), suc CHAR(2),
  fech_ini DATE, fech_fin DATE);

-- VARIABLES COSTO VENTAS
  DEFINE cosvta LIKE inarfac.cos_vta;
  DEFINE numdoc LIKE inarfac.num_doc;
  DEFINE fech   LIKE inarfac.fecha;

-- VARIABLES KARDEX
  DEFINE kgs     LIKE inartrinv.can_kgs;
  DEFINE caj     LIKE inartrinv.can_caj;
  DEFINE pro_kgs LIKE inartrinv.cos_pro_kgs;
  DEFINE pro_caj LIKE inartrinv.cos_pro_caj;
  DEFINE art     LIKE inarinv.cod_art;
  DEFINE tipart  LIKE inarinv.tip_art;

--GIN WORK;
-- LEE FACTURAS
 FOREACH
   SELECT num_doc, fecha
     INTO numdoc, fech
     FROM inarfac
    WHERE inarfac.num_emp=emp
      AND inarfac.num_suc=suc
      AND inarfac.fecha BETWEEN fech_ini AND fech_fin

   LET cosvta=0;

-- LEE KARDEX FACTURAS
    FOREACH
      SELECT cod_art, can_kgs, can_caj, cos_pro_kgs, cos_pro_caj
        INTO art, kgs, caj, pro_kgs, pro_caj
        FROM inartrinv
       WHERE inartrinv.num_emp=emp
         AND inartrinv.num_suc=suc
         AND inartrinv.tip_doc="FA"
         AND inartrinv.num_doc=numdoc
         AND inartrinv.fech_doc=fech

      SELECT tip_art
        INTO tipart
        FROM inarinv
       WHERE inarinv.num_emp=emp
         AND inarinv.cod_art=art;

      IF tipart="K" THEN
         LET cosvta = cosvta + (kgs * pro_kgs);
      END IF;

      IF tipart="C" THEN
         LET cosvta = cosvta + (caj * pro_caj);
      END IF;
    END FOREACH;

-- ACTUALIZA COSTO VTAS FACTURA
   UPDATE inarfac
      SET cos_vta = cosvta
    WHERE inarfac.num_emp=emp
      AND inarfac.num_suc=suc
      AND inarfac.num_doc=numdoc
      AND inarfac.fecha=fech;

 END FOREACH;

-- LEE TICKETS
 FOREACH
   SELECT num_doc, fecha
     INTO numdoc, fech
     FROM inarpvt
    WHERE inarpvt.num_emp=emp
      AND inarpvt.num_suc=suc
      AND inarpvt.fecha BETWEEN fech_ini AND fech_fin

   LET cosvta=0;

-- LEE KARDEX TICKETS
    FOREACH
      SELECT cod_art, can_kgs, can_caj, cos_pro_kgs, cos_pro_caj
        INTO art, kgs, caj, pro_kgs, pro_caj
        FROM inartrinv
       WHERE inartrinv.num_emp=emp
         AND inartrinv.num_suc=suc
         AND inartrinv.tip_doc="TI"
         AND inartrinv.num_doc=numdoc
         AND inartrinv.fech_doc=fech

      SELECT tip_art
        INTO tipart
        FROM inarinv
       WHERE inarinv.num_emp=emp
         AND inarinv.cod_art=art;

      IF tipart="K" THEN
         LET cosvta = cosvta + (kgs * pro_kgs);
      END IF;

      IF tipart="C" THEN
         LET cosvta = cosvta + (caj * pro_caj);
      END IF;
    END FOREACH;

-- ACTUALIZA COSTO VTAS TICKETS
   UPDATE inarpvt
      SET cos_vta = cosvta
    WHERE inarpvt.num_emp=emp
      AND inarpvt.num_suc=suc
      AND inarpvt.num_doc=numdoc;
 END FOREACH;


-- LEE DEVOLUCION
 FOREACH
   SELECT num_dev, fecha
     INTO numdoc, fech
     FROM inardev
    WHERE inardev.num_emp=emp
      AND inardev.num_suc=suc
      AND inardev.fecha BETWEEN fech_ini AND fech_fin

   LET cosvta=0;

-- LEE KARDEX DEVOLUCION
    FOREACH
      SELECT cod_art, can_kgs, can_caj, cos_pro_kgs, cos_pro_caj
        INTO art, kgs, caj, pro_kgs, pro_caj
        FROM inartrinv
       WHERE inartrinv.num_emp=emp
         AND inartrinv.num_suc=suc
         AND inartrinv.tip_doc="DV"
         AND inartrinv.num_doc=numdoc
         AND inartrinv.fech_doc=fech

      SELECT tip_art
        INTO tipart
        FROM inarinv
       WHERE inarinv.num_emp=emp
         AND inarinv.cod_art=art;

      IF tipart="K" THEN
         LET cosvta = cosvta + (kgs * pro_kgs);
      END IF;

      IF tipart="C" THEN
         LET cosvta = cosvta + (caj * pro_caj);
      END IF;
    END FOREACH;

-- ACTUALIZA COSTO VTAS TICKETS
   UPDATE inardev
      SET cos_vta = cosvta
    WHERE inardev.num_emp=emp
      AND inardev.num_suc=suc
      AND inardev.num_dev=numdoc;
 END FOREACH;
--MMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".aut_entdiv(emp CHAR(2), fech DATE);

-- VARIABLES ENTRADAS DIV.
DEFINE art     LIKE inarinv.cod_art;
DEFINE tipart  LIKE inarinv.tip_art;
DEFINE ren     SMALLINT;
DEFINE kgs     LIKE inv_diario.dif_kgs;
DEFINE caj     LIKE inv_diario.dif_caj;
DEFINE ent     LIKE consendiv.num_ent;
DEFINE prokgs  LIKE inarinv.cos_pro_kgs;
DEFINE procaj  LIKE inarinv.cos_pro_caj;
DEFINE imp     LIKE inardiverso.imp_exe;
DEFINE cos     LIKE inardiverso.imp_exe;
DEFINE concept LIKE inardiverso.concepto;

LET imp = 0;
LET ren = 0;

-- ACTUALIZA CONSECUTIVO NUM. ENTTRADA DIVERSA
 SET LOCK MODE TO WAIT;
  UPDATE consendiv
     SET consendiv.num_ent = consendiv.num_ent + 1
   WHERE consendiv.num_emp = emp;
 SET LOCK MODE TO NOT WAIT;

-- BUSCA LAS DIFERECIAS POSITIVAS QUE SE CONVIERTEN EN ENTRADAS DIV.
BEGIN WORK;
FOREACH
  SELECT cod_art, dif_kgs, dif_caj
    INTO art, kgs, caj
    FROM inv_diario
   WHERE inv_diario.num_emp = emp
     AND inv_diario.fecha   = fech
     AND (inv_diario.dif_kgs>0 OR inv_diario.dif_caj>0)

-- SELECCIONA CONSECUTIVO ENTTRADA DIVERSA
  SELECT num_ent 
    INTO ent
    FROM consendiv
   WHERE consendiv.num_emp=emp;

  SELECT cos_pro_kgs, cos_pro_caj, tip_art
    INTO prokgs, procaj, tipart
    FROM inarinv
   WHERE inarinv.num_emp = emp
     AND inarinv.cod_art = art;

   IF kgs < 0 THEN
      LET kgs = 0;
      LET prokgs = 0;
   END IF;

   IF caj < 0 THEN
      LET caj = 0;
      LET procaj = 0;
   END IF;

   IF tipart="K" AND caj > 0 THEN
      LET procaj = 0;
   END IF;

   IF tipart="C" AND kgs > 0 THEN
      LET prokgs = 0;
   END IF;

   IF tipart="K" AND kgs > 0 THEN
      LET cos = kgs * prokgs;
      LET imp = imp + cos;
   END IF;

   IF tipart="C" AND caj > 0 THEN
      LET cos = caj * procaj;
      LET imp = imp + cos;
   END IF;

   LET ren = ren + 1;

   INSERT INTO inartrinv
   VALUES(emp,art,emp,fech,"ED",ent,kgs,caj,0,0,prokgs,
         procaj,0,0,0,0,ren," "," ",0," ",0);

   SET LOCK MODE TO WAIT;
     UPDATE inarinv SET exi_cor_kgs = exi_cor_kgs + kgs,
                        exi_cor_caj = exi_cor_caj + caj
      WHERE inarinv.num_emp = emp
        AND inarinv.cod_art = art;
   SET LOCK MODE TO NOT WAIT;
END FOREACH;

-- INSERTA CABECERA DE ENTRADA DIVERSA
   LET concept="AJUSTE DE INVENTARIO DEL CIERRE DEL "||fech;
   INSERT INTO inardiverso
   VALUES(emp,emp,fech,ent,"ED",imp,0,0,concept);

COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".aut_saldiv(emp CHAR(2), fech DATE);

-- VARIABLES SALIDAS DIV.
DEFINE art     LIKE inarinv.cod_art;
DEFINE tipart  LIKE inarinv.tip_art;
DEFINE ren     SMALLINT;
DEFINE kgs     LIKE inv_diario.dif_kgs;
DEFINE caj     LIKE inv_diario.dif_caj;
DEFINE sal     LIKE conssadiv.num_sal;
DEFINE prokgs  LIKE inarinv.cos_pro_kgs;
DEFINE procaj  LIKE inarinv.cos_pro_caj;
DEFINE imp     LIKE inardiverso.imp_exe;
DEFINE concept LIKE inardiverso.concepto;

LET imp=0;
LET ren=0;

-- ACTUALIZA CONSECUTIVO NUM. ENTTRADA DIVERSA
 SET LOCK MODE TO WAIT;
  UPDATE conssadiv
     SET conssadiv.num_sal = conssadiv.num_sal + 1
   WHERE conssadiv.num_emp = emp;
 SET LOCK MODE TO NOT WAIT;

-- BUSCA LAS DIFERECIAS POSITIVAS QUE SE CONVIERTEN EN SALIDAS DIV.
BEGIN WORK;
FOREACH
  SELECT cod_art, dif_kgs, dif_caj
    INTO art, kgs, caj
    FROM inv_diario
   WHERE inv_diario.num_emp = emp
     AND inv_diario.fecha   = fech
     AND (inv_diario.dif_kgs<0  OR inv_diario.dif_caj<0)

-- SELECCIONA CONSECUTIVO SALIDA DIVERSA
  SELECT num_sal 
    INTO sal
    FROM conssadiv
   WHERE conssadiv.num_emp=emp;

  SELECT cos_pro_kgs, cos_pro_caj, tip_art
    INTO prokgs, procaj, tipart
    FROM inarinv
   WHERE inarinv.num_emp = emp
     AND inarinv.cod_art = art;

   IF kgs < 0 THEN
      LET kgs = kgs * (-1);
   ELSE
      LET kgs = 0;
      LET prokgs = 0;
   END IF;

   IF caj < 0 THEN
      LET caj = caj * (-1);
   ELSE
      LET caj = 0;
      LET procaj = 0;
   END IF;

   IF tipart="K" AND caj > 0 THEN
      LET procaj = 0;
   END IF;

   IF tipart="C" AND kgs > 0 THEN
      LET prokgs = 0;
   END IF;

   IF tipart="K" AND kgs > 0 THEN
      LET imp = imp + (kgs * prokgs);
   END IF;

   IF tipart="C" AND caj > 0 THEN
      LET imp = imp + (caj * procaj);
   END IF;

   LET ren = ren + 1;

   INSERT INTO inartrinv
   VALUES(emp,art,emp,fech,"SD",sal,kgs,caj,0,0,prokgs,
         procaj,0,0,0,0,ren," "," ",0," ",0);

   SET LOCK MODE TO WAIT;
     UPDATE inarinv SET exi_cor_kgs = exi_cor_kgs - kgs,
                        exi_cor_caj = exi_cor_caj - caj
      WHERE inarinv.num_emp = emp
        AND inarinv.cod_art = art;
   SET LOCK MODE TO NOT WAIT;
END FOREACH;

-- INSERTA CABECERA DE ENTRADA DIVERSA
   LET concept="AJUSTE DE INVENTARIO DEL CIERRE DEL "||fech;
   INSERT INTO inardiverso
   VALUES(emp,emp,fech,sal,"SD",imp,0,0,concept);

COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_factinv(emp char(2),suc char(2), fol integer,
  fech date, agente smallint, fac char(10), cli char(8),tipfac char(1),
  clavecajera char(12));

-- VARIABLES TRANSACCIONES INVENTARIO
  DEFINE art LIKE inartrinv.cod_art;
  DEFINE kgs LIKE inartrinv.can_kgs;
  DEFINE caj LIKE inartrinv.can_caj;
  DEFINE cosprokgs LIKE inartrinv.cos_pro_kgs;
  DEFINE cosprocaj LIKE inartrinv.cos_pro_caj;
  DEFINE prevtakgs LIKE inartrinv.pre_vta_kgs;
  DEFINE prevtacaj LIKE inartrinv.pre_vta_caj;
  DEFINE desvta LIKE inartrinv.des_vta;
  DEFINE renglon LIKE inartrinv.ren_art;
  DEFINE iva     LIKE inartrinv.iva_art;
-- VARIABLES INVENTARIO
  DEFINE salval    LIKE inarinv.sal_val;
  DEFINE venmeskgs LIKE inarinv.ven_mes_kgs;
  DEFINE venmescaj LIKE inarinv.ven_mes_caj;
  DEFINE venacukgs LIKE inarinv.ven_acu_kgs;
  DEFINE venacucaj LIKE inarinv.ven_acu_caj;
  DEFINE cosmeskgs LIKE inarinv.cos_mes_kgs;
  DEFINE cosmescaj LIKE inarinv.cos_mes_caj;
  DEFINE cosacukgs LIKE inarinv.cos_acu_kgs;
  DEFINE cosacucaj LIKE inarinv.cos_acu_caj;
  DEFINE exicorkgs LIKE inarinv.exi_cor_kgs;
  DEFINE exicorcaj LIKE inarinv.exi_cor_caj;
  DEFINE canmeskgs LIKE inarinv.can_mes_kgs;
  DEFINE canmescaj LIKE inarinv.can_mes_caj;
  DEFINE canacukgs LIKE inarinv.can_acu_kgs;
  DEFINE canacucaj LIKE inarinv.can_acu_caj;
-- VARIABLES COSTO DE VENTAS
  DEFINE cosvta LIKE inarfac.cos_vta;
  DEFINE tipart LIKE inarinv.tip_art;
-- VARIABLES FACTURA
  DEFINE nomcli LIKE inarfac.raz_soc;
  DEFINE domcli LIKE inarfac.dom_cli;
  DEFINE ciucli LIKE inarfac.ciu_cli;
  DEFINE estcli LIKE inarfac.est_cli;
  DEFINE rfccli LIKE inarfac.reg_fed;
  DEFINE impexe LIKE inarfac.imp_exe;
  DEFINE imp15  LIKE inarfac.imp_15;
  DEFINE desexe LIKE inarfac.des_exe;
  DEFINE des15  LIKE inarfac.des_15;
  DEFINE iva15  LIKE inarfac.iva_15;
  DEFINE tot    LIKE inartrcl.importe;
  DEFINE stot   LIKE inartrcl.importe;

  LET cosvta=0;

  FOREACH
    SELECT cod_art,can_kgs,can_caj,pre_vta_kgs,
           pre_vta_caj,des_vta,ren_art,iva_art
      INTO art,kgs,caj,prevtakgs,
           prevtacaj,desvta,renglon,iva
       FROM inarcot1
       WHERE inarcot1.num_emp=emp AND inarcot1.num_suc=suc
         AND inarcot1.num_doc=fol  AND inarcot1.fech_doc=fech
         AND inarcot1.cod_ag=agente

-- VARIABLES COSTO DE VENTAS
  SELECT tip_art,cos_pro_kgs,cos_pro_caj
    INTO tipart,cosprokgs,cosprocaj
    FROM inarinv
   WHERE inarinv.num_emp=emp AND inarinv.cod_art=art;

   IF tipart="K" THEN
     LET cosvta = cosvta + (kgs * cosprokgs);
   END IF;
   IF tipart="C" THEN
     LET cosvta = cosvta + (caj * cosprocaj);
   END IF;

-- ACTUALIZA INVENTARIO
  SET LOCK MODE TO WAIT;
    UPDATE inarinv SET
       sal_val    = sal_val - (kgs * cosprokgs),
       ven_mes_kgs = ven_mes_kgs + (kgs * prevtakgs),
       ven_mes_caj = ven_mes_caj + (caj * prevtacaj),
       ven_acu_kgs = ven_acu_kgs + (kgs * prevtakgs),
       ven_acu_caj = ven_acu_caj + (caj * prevtacaj),
       cos_mes_kgs = cos_mes_kgs + (kgs * cosprokgs),
       cos_mes_caj = cos_mes_caj + (caj * cosprocaj),
       cos_acu_kgs = cos_acu_kgs + (kgs * cosprokgs),
       cos_acu_caj = cos_acu_caj + (caj * cosprocaj),
       exi_cor_kgs = exi_cor_kgs - kgs,
       exi_cor_caj = exi_cor_caj - caj,
       can_mes_kgs = can_mes_kgs + kgs,
       can_mes_caj = can_mes_caj + caj,
       can_acu_kgs = can_acu_kgs + kgs,
       can_acu_caj = can_acu_caj + caj
     WHERE inarinv.num_emp=emp AND inarinv.cod_art=art;
  SET LOCK MODE TO NOT WAIT;

--    SELECT sal_val,ven_mes_kgs,ven_mes_caj,ven_acu_kgs,ven_acu_caj,
--                   cos_mes_kgs,cos_mes_caj,cos_acu_kgs,cos_acu_caj,
--                   exi_cor_kgs,exi_cor_caj,can_mes_kgs,can_mes_caj,
--                   can_acu_kgs,can_acu_caj
--      INTO salval,venmeskgs,venmescaj,venacukgs,venacucaj,
--                  cosmeskgs,cosmescaj,cosacukgs,cosacucaj,
--                  exicorkgs,exicorcaj,canmeskgs,canmescaj,
--                  canacukgs,canacucaj
--       FROM inarinv
--       WHERE inarinv.num_emp=emp AND inarinv.cod_art=art;
--                   
--       LET salval    = salval - (kgs * cosprokgs);
--       LET venmeskgs = venmeskgs + (kgs * prevtakgs);
--       LET venmescaj = venmescaj + (caj * prevtacaj);
--       LET venacukgs = venacukgs + (kgs * prevtakgs);
--       LET venacucaj = venacucaj + (caj * prevtacaj);
--       LET cosmeskgs = cosmeskgs + (kgs * cosprokgs);
--       LET cosmescaj = cosmescaj + (caj * cosprocaj);
--       LET cosacukgs = cosacukgs + (kgs * cosprokgs);
--       LET cosacucaj = cosacucaj + (caj * cosprocaj);
--       LET exicorkgs = exicorkgs - kgs;
--       LET exicorcaj = exicorcaj - caj;
--       LET canmeskgs = canmeskgs + kgs;
--       LET canmescaj = canmescaj + caj;
--       LET canacukgs = canacukgs + kgs;
--       LET canacucaj = canacucaj + caj;

-- INSERTA TRANSACCION DEL KARDEX
     INSERT INTO inartrinv VALUES(emp,art,suc,fech,"FA",fac,kgs,caj,
            0,0,cosprokgs,cosprocaj,prevtakgs,prevtacaj,
            desvta,0,renglon," ",cli,0," ",iva);
  END FOREACH;

-- INSERTA FACTURA
 SELECT cod_cli,raz_soc,dom_cli,ciu_cli,est_cli,rfc_cli,imp_exe,imp_15,iva_15,
        des_exe,des_15
   INTO cli,nomcli,domcli,ciucli,estcli,rfccli,impexe,imp15,iva15,
        desexe,des15
   FROM inarcot
  WHERE inarcot.num_emp=emp AND inarcot.num_suc=suc AND inarcot.num_doc=fol
    AND inarcot.cod_ag=agente;

 INSERT INTO inarfac VALUES(emp,suc,fac,cli,nomcli,domcli,ciucli,estcli,
   "nom","dom","pob",fol,fech,fol,fech,tipfac,agente,impexe,0,
   imp15,0,desexe,0,des15,0,0,iva15,0,cosvta,0,0,0,0,0,0,fech,rfccli,tipfac,
   clavecajera);

-- INSERTA TRANSACCIONES CLIENTES
 LET stot=impexe+imp15-desexe-des15;
 LET tot=impexe+imp15+iva15-desexe-des15;
 INSERT INTO inartrcl VALUES(emp,suc,cli,"FA",fac,tot,tot,iva15,fech);

-- ACTUALIZA SALDO CLIENTES
SET LOCK MODE TO WAIT;
 UPDATE inarcl
   SET inarcl.com_mes=(com_mes+stot),
       inarcl.com_acu=(com_acu+stot),
       inarcl.cos_mes=(cos_mes+cosvta),
       inarcl.cos_acu=(cos_acu+cosvta),
       inarcl.can_com=tot,
       inarcl.fech_com=fech,
       inarcl.sal_act=(sal_act+tot)
   WHERE inarcl.num_emp=emp
     AND inarcl.cod_cli=cli;
SET LOCK MODE TO NOT WAIT;

-- ACTUALIZA VENTA AGENTE
SET LOCK MODE TO WAIT;
 UPDATE inarag
  SET inarag.vta_mes=(vta_mes+stot),
      inarag.vta_acu=(vta_acu+stot),
      inarag.cos_mes=(cos_mes+cosvta),
      inarag.cos_acu=(cos_acu+cosvta)
   WHERE inarag.num_emp=emp
     AND inarag.num_suc=suc
     AND inarag.cod_ag=agente;
SET LOCK MODE TO NOT WAIT;

-- INSERTA CONTROL DE DOCUMENTOS
  INSERT INTO documento VALUES(emp,suc,"FA",fac,tot,fech);
END PROCEDURE;

CREATE PROCEDURE "xxx".act_salxcli(emp CHAR(2), fech_ini DATE, fech_fin DATE,
cli CHAR(8));

-- VARIABLES SALDO
  DEFINE codcli   LIKE inarcl.cod_cli;
  DEFINE salact   LIKE inarcl.sal_act;
  DEFINE numfac   LIKE inartrcl.num_docto;
  DEFINE salfac   LIKE inartrcl.sal_fac;
  DEFINE saliva   LIKE inartrcl.sal_iva;
  DEFINE tipfac   LIKE inartrcl.tipo;
  DEFINE imppago  LIKE inartrcl1.importe;
  DEFINE ivapago  LIKE inartrcl1.iva;
  DEFINE suc      LIKE inartrcl.num_suc;
  DEFINE ffac     LIKE inartrcl.fecha;

DELETE FROM tmptrcl;

BEGIN WORK;
-- LEE CATALOGO DE CLIENTES
  FOREACH
   SELECT cod_cli, sal_ant
     INTO codcli, salact
     FROM inarcl
    WHERE inarcl.num_emp=emp and inarcl.cod_cli=cli
    ORDER BY cod_cli

-- IF salact IS NULL THEN
   LET salact=0;
-- END IF;

-- BUSCA FACTURAS DEL CLIENTE
    FOREACH 
       SELECT tipo, num_docto, importe, sal_iva, num_suc, fecha
         INTO tipfac, numfac, salfac, saliva, suc, ffac
         FROM inartrcl
        WHERE inartrcl.num_emp=emp
          AND inartrcl.num_suc=emp
          AND inartrcl.cod_cli=codcli
          AND inartrcl.fecha <= fech_fin
          ORDER BY fecha

INSERT INTO tmptrcl VALUES(emp,emp,codcli,tipfac,numfac,salfac,salfac,saliva,
                           ffac);

    LET salact = salact + salfac;

-- BUSCA PAGOS, DEVOLUCIONES Y BONIFICACIONES
       FOREACH
          SELECT importe, iva
            INTO imppago, ivapago
            FROM inartrcl1
           WHERE inartrcl1.num_emp=emp
             AND inartrcl1.num_suc=suc
             AND inartrcl1.num_car=numfac
             AND inartrcl1.tip_car=tipfac
             AND inartrcl1.fecha <= fech_fin
             ORDER BY fecha

          LET salact = salact - imppago;

UPDATE tmptrcl
SET    tmptrcl.sal_fac = tmptrcl.sal_fac - imppago,
       tmptrcl.sal_iva = tmptrcl.sal_iva - ivapago
        WHERE tmptrcl.num_emp=emp
          AND tmptrcl.fecha = ffac
          AND tmptrcl.num_docto = numfac
          AND tmptrcl.tipo = tipfac;

       END FOREACH;
    END FOREACH;
  UPDATE inarcl
     SET inarcl.sal_act = salact
   WHERE inarcl.num_emp = emp
     AND inarcl.cod_cli = codcli;
  END FOREACH;
COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".loc_pag(emp char(2),fini date, ffin date);
  DEFINE suc    LIKE inartrcl.num_suc;
  DEFINE tipcar LIKE inartrcl1.tip_car;
  DEFINE numcar LIKE inartrcl1.num_car;
  DEFINE numcre LIKE inartrcl1.num_cre;
  DEFINE tipcre LIKE inartrcl1.tip_cre;
  DEFINE cli    LIKE inartrcl1.cod_cli;
  DEFINE imp    LIKE inartrcl1.importe;
  DEFINE iva_15 LIKE inartrcl1.iva;
  DEFINE fech   LIKE inartrcl1.fecha;
  DEFINE forpag LIKE inartrcl1.for_pag;
  DEFINE enc    CHAR(1);

DELETE FROM tmp_locpag;

BEGIN WORK;
  FOREACH
  SELECT tip_car,num_car,num_cre,tip_cre,cod_cli,importe,iva,fecha,for_pag
    INTO tipcar,numcar,numcre,tipcre,cli,imp,iva_15,fech,forpag
    FROM inartrcl1
   WHERE inartrcl1.num_emp=emp
     AND inartrcl1.fecha BETWEEN fini AND ffin
--   AND inartrcl1.tip_cre="PA"

     LET enc="F";

      FOREACH
       SELECT num_suc INTO suc
         FROM inartrcl
        WHERE inartrcl.num_emp=emp
          AND inartrcl.num_docto=numcar
          AND inartrcl.tipo=tipcar
          AND inartrcl.cod_cli=cli

            LET enc="T";

       END FOREACH;

       IF enc="F" THEN
          INSERT INTO tmp_locpag VALUES(emp,emp,tipcar,numcar,numcre,tipcre,
                      cli,imp,iva_15,fech,forpag);
       END IF;
END FOREACH;
COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_ventas(folio INTEGER, descripcion CHAR(50),
  codigo CHAR(14), cajas DECIMAL(10,4), kilos DECIMAL(10,4),
  precio DECIMAL(12,4), total DECIMAL(12,4), nombre CHAR(50),
  iva DECIMAL(12,4), cos_pro DECIMAL(12,4), totiva DECIMAL(12,4),
  renglon SMALLINT, pagado SMALLINT, rfc CHAR(20), tipo CHAR(2),
  lineaven CHAR(20), descto DECIMAL(10,4), pedido CHAR(20),
  observacion CHAR(20), sucursal CHAR(20), num_emp CHAR(2));

  INSERT INTO ventas VALUES (folio, descripcion,
  codigo, cajas, kilos, precio, total, nombre,
  iva, cos_pro, totiva, renglon, pagado, rfc, tipo,
  lineaven, descto, pedido, observacion, sucursal, num_emp); 

END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_devcom(emp char(2), suc char(2), dev integer,
 fech date, pro char(8), ent integer, impexe decimal(12,4), imp15 decimal(12,4),
 iva15 decimal(10,4), cosvta decimal(12,4), desexe decimal(10,4),
 des15 decimal(10,4), motiv char(80), clavecajera char(12));

-- VARIABLES DEVOLUCION
  DEFINE nompro  LIKE inarent.raz_soc;
  DEFINE dompro  LIKE inarent.dom_pro;
  DEFINE ciupro  LIKE inarent.ciu_pro;
  DEFINE estpro  LIKE inarent.edo_pro;
  DEFINE rfcpro  LIKE inarent.rfc_pro;
  DEFINE stot    LIKE inartrpr1.importe;
  DEFINE tot     LIKE inartrpr1.importe;

BEGIN WORK;
-- INSERTA DEVOLUCION
 SELECT raz_soc,dom_pro,ciu_pro,edo_pro,rfc_pro
   INTO nompro,dompro,ciupro,estpro,rfcpro
   FROM inarent
  WHERE inarent.num_emp=emp AND inarent.cod_pro=pro
    AND inarent.num_ent=ent AND inarent.num_suc=suc;

 INSERT INTO inardevcom VALUES(emp,suc,dev,pro,nompro,dompro,ciupro,estpro,
   impexe,0,imp15,0,desexe,0,des15,0,0,iva15,0,cosvta,0,0,0,0,0,0,fech,
   rfcpro,motiv,clavecajera);

-- INSERTA TRANSACCIONES PROVEEDORES
 LET stot=impexe+imp15-desexe-des15;
 LET tot=impexe+imp15+iva15-desexe-des15;

 INSERT INTO inartrpr1 VALUES(emp,suc,"1",ent,dev,"DC",pro,tot,iva15,fech,
                               "DEVOLUCION");

-- ACTUALIZA SALDO ENTRADA
SET LOCK MODE TO WAIT;
UPDATE inartrpr
   SET inartrpr.sal_ent=inartrpr.sal_ent-tot,
       inartrpr.sal_iva=inartrpr.sal_iva-iva15
 WHERE inartrpr.num_emp   = emp
   AND inartrpr.num_suc   = suc
   AND inartrpr.tip_ent   = "1"
   AND inartrpr.num_ent   = ent
   AND inartrpr.cod_pro   = pro;
SET LOCK MODE TO NOT WAIT;

-- ACTUALIZA SALDO PROVEEDORES
SET LOCK MODE TO WAIT;
 UPDATE inarprov
   SET inarprov.com_mes=(com_mes-stot),
       inarprov.com_acu=(com_acu-stot),
       inarprov.cos_mes=(cos_mes-cosvta),
       inarprov.cos_acu=(cos_acu-cosvta),
       inarprov.can_com=(can_com-stot),
       inarprov.sal_act=(sal_act-tot)
   WHERE inarprov.num_emp=emp
     AND inarprov.cod_pro=pro;
SET LOCK MODE TO NOT WAIT;

-- INSERTA CONTROL DE DOCUMENTOS
  INSERT INTO documento VALUES(emp,suc,"DC",dev,tot,fech);
COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".cancela_devcom(emp CHAR(2),suc CHAR(2),numdev INTEGER);

-- VARIABLES INVENTARIO
   DEFINE canemp    LIKE inarinv.can_emp;
   DEFINE exicorkgs LIKE inarinv.exi_cor_kgs;
   DEFINE exicorcaj LIKE inarinv.exi_cor_caj;
   DEFINE cosprokgs LIKE inarinv.cos_pro_kgs;
   DEFINE cosprocaj LIKE inarinv.cos_pro_caj;
   DEFINE salval    LIKE inarinv.sal_val;
   DEFINE tipart    LIKE inarinv.tip_art;

-- VARIABLES DEVOLUCION COMPRAS
  DEFINE fechdev   LIKE inardevcom.fecha;
  DEFINE codpro    LIKE inardevcom.cod_pro;
  DEFINE impexe    LIKE inardevcom.imp_exe;
  DEFINE imp15     LIKE inardevcom.imp_15;
  DEFINE iva15     LIKE inardevcom.iva_15;
  DEFINE desexe    LIKE inardevcom.des_exe;
  DEFINE des15     LIKE inardevcom.des_15;

-- VARIABLES INARTRINV  KARDEX
  DEFINE art       LIKE inartrinv.cod_art;
  DEFINE kgs       LIKE inartrinv.can_kgs;
  DEFINE caj       LIKE inartrinv.can_caj;
  DEFINE cosunikgs LIKE inartrinv.cos_uni_kgs;
  DEFINE cosunicaj LIKE inartrinv.cos_uni_caj;
  DEFINE desvta    LIKE inartrinv.des_vta;
  DEFINE renglon   LIKE inartrinv.ren_art;
  DEFINE iva       LIKE inartrinv.iva_art;
  DEFINE fech      LIKE inartrinv.fech_doc;

-- VARIABLES INARTRPR
  DEFINE ent      LIKE inartrpr.num_ent;
  DEFINE subtot   LIKE inartrpr.imp_ent;
  DEFINE impent   LIKE inartrpr.imp_ent;

-- BUSCA DEVOLUCION COMPRA
BEGIN WORK;
IF EXISTS(SELECT numero
            FROM documento
           WHERE documento.num_emp=emp
             AND documento.num_suc=suc
             AND documento.tipo="DC"
             AND documento.numero=numdev)
THEN
  FOREACH
    SELECT cod_art,can_kgs,can_caj,cos_uni_kgs,
           cos_uni_caj,ren_art,iva_art,fech_doc,
           cos_pro_kgs,cos_pro_caj
      INTO art,kgs,caj,cosunikgs,
           cosunicaj,renglon,iva,fech,
           cosprokgs,cosprocaj
      FROM inartrinv
     WHERE inartrinv.num_emp=emp AND inartrinv.num_suc=suc
       AND inartrinv.tip_doc="DC" AND inartrinv.num_doc=numdev

-- BUSCA INVENTARIO
    LET tipart=" ";
    SELECT can_emp,exi_cor_kgs,exi_cor_caj,
           cos_pro_kgs,cos_pro_caj,tip_art,sal_val
      INTO canemp,exicorkgs,exicorcaj,
           cosprokgs,cosprocaj,tipart,salval
      FROM inarinv
     WHERE inarinv.num_emp=emp
       AND inarinv.cod_art=art;

     IF tipart="K" THEN
        LET exicorkgs = exicorkgs + kgs;
        LET salval = salval + (kgs*cosunikgs);
        LET exicorcaj = exicorcaj + caj;
        LET canemp = exicorkgs / exicorcaj;
     END IF;

     IF tipart="C" THEN
        LET exicorcaj = exicorcaj + caj;
        LET salval = salval + (caj*cosunicaj);
        LET exicorkgs = exicorkgs + kgs;
        LET canemp = exicorkgs / exicorcaj;
     END IF;

     LET cosprokgs = salval / exicorkgs;
     LET cosprocaj = salval / exicorcaj;

-- ACTUALIZA INVENTARIO
   SET LOCK MODE TO WAIT;
     UPDATE inarinv SET exi_cor_kgs=exicorkgs,
                        exi_cor_caj=exicorcaj,
                        cos_pro_kgs=cosprokgs,
                        cos_pro_caj=cosprocaj,
                        sal_val=salval,
                        can_emp=canemp
      WHERE inarinv.num_emp=emp
        AND inarinv.cod_art=art;
   SET LOCK MODE TO NOT WAIT;

-- BORRA TRANSACCION KARDEX
     DELETE FROM inartrinv
       WHERE inartrinv.num_emp=emp    AND inartrinv.cod_art=art
         AND inartrinv.fech_doc=fech  AND inartrinv.tip_doc="DC"
         AND inartrinv.num_doc=numdev AND inartrinv.num_suc=suc
         AND inartrinv.ren_art=renglon;
  END FOREACH;

-- BUSCA DEVOLUCION COMPRA
  SELECT imp_exe,imp_15,iva_15,des_exe,des_15,cod_pro
    INTO impexe,imp15,iva15,desexe,des15,codpro
    FROM inardevcom
   WHERE inardevcom.num_emp=emp
     AND inardevcom.num_suc=suc
     AND inardevcom.num_dev=numdev;

-- BUSCA NUMERO DE ENTRADA DE LA DEVOLUCION
  SELECT num_ent
    INTO ent
    FROM inartrpr1
   WHERE inartrpr1.num_emp = emp
     AND inartrpr1.num_suc = suc
     AND inartrpr1.num_pag = numdev
     AND inartrpr1.tip_pag = "DC"
     AND inartrpr1.cod_pro = codpro;

-- SUMA IMPORTES
  LET subtot=impexe+imp15-desexe-des15;
  LET impent=impexe+imp15+iva15-desexe-des15;

-- ACTUALIZA SALDO ENTRADA
SET LOCK MODE TO WAIT;
UPDATE inartrpr
   SET inartrpr.sal_ent=inartrpr.sal_ent+impent,
       inartrpr.sal_iva=inartrpr.sal_iva+iva15
 WHERE inartrpr.num_emp   = emp
   AND inartrpr.num_suc   = suc
   AND inartrpr.tip_ent   = "1"
   AND inartrpr.num_ent   = ent
   AND inartrpr.cod_pro   = codpro;
SET LOCK MODE TO NOT WAIT;

-- BORRA INARDEVCOM,INARTRPR1,DOCUMENTO
     DELETE FROM inardevcom
      WHERE inardevcom.num_emp=emp
        AND inardevcom.num_suc=suc
        AND inardevcom.num_dev=numdev;

     DELETE FROM inartrpr1
      WHERE inartrpr1.num_emp=emp
        AND inartrpr1.num_suc=suc
        AND inartrpr1.num_pag=numdev
        AND inartrpr1.tip_pag="DC";

-- ACTUALIZA SALDO PROVEEDOR
 SET LOCK MODE TO WAIT;
  UPDATE inarprov
     SET inarprov.com_mes=inarprov.com_mes+subtot,
         inarprov.com_acu=inarprov.com_acu+subtot,
         inarprov.can_com=inarprov.can_com+subtot,
         inarprov.sal_act=inarprov.sal_act+impent
   WHERE inarprov.num_emp=emp
     AND inarprov.cod_pro=codpro;
 SET LOCK MODE TO NOT WAIT;

     DELETE FROM documento
      WHERE documento.num_emp=emp
        AND documento.num_suc=suc
        AND documento.tipo="DC"
        AND documento.numero=numdev;
END IF;
COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_tr_devcom(emp char(2), suc char(2),
  art char(14), fech date, dev integer, pro char(8),
  kgs decimal(10,4), caj decimal(10,4),cosprokgs decimal(12,4),
  cosprocaj decimal(12,4),cosunikgs decimal(12,4),
  cosunicaj decimal(12,4),desvta decimal(12,4),fle decimal(12,4),
  renglon smallint,iva decimal(12,4));

-- VARIABLES INVENTARIO
  DEFINE salval    LIKE inarinv.sal_val;
  DEFINE exicorkgs LIKE inarinv.exi_cor_kgs;
  DEFINE exicorcaj LIKE inarinv.exi_cor_caj;
  DEFINE cosprokgs LIKE inarinv.cos_pro_kgs;
  DEFINE cosprocaj LIKE inarinv.cos_pro_caj;
  DEFINE canemp    LIKE inarinv.can_emp;
-- VARIABLES COSTO DE VENTAS
  DEFINE tipart LIKE inarinv.tip_art;
  DEFINE tot    LIKE inartrpr.imp_ent;
  DEFINE stot   LIKE inartrpr.imp_ent;

  SELECT exi_cor_kgs,exi_cor_caj,
         cos_pro_kgs,cos_pro_caj,tip_art,sal_val  INTO
         exicorkgs,exicorcaj,
         cosprokgs,cosprocaj,tipart,salval
  FROM inarinv
  WHERE inarinv.num_emp=emp
    AND inarinv.cod_art=art;

     IF tipart="K" THEN
        LET exicorkgs = exicorkgs - kgs;
        LET salval = salval - (kgs*cosunikgs);
        LET exicorcaj = exicorcaj - caj;
     END IF;

     IF tipart="C" THEN
        LET exicorcaj = exicorcaj - caj;
        LET salval = salval - (caj*cosunicaj);
        LET exicorkgs = exicorkgs - kgs;
     END IF;

   LET canemp    = exicorkgs / exicorcaj;
   LET cosprokgs = salval / exicorkgs;
   LET cosprocaj = salval / exicorcaj;

BEGIN WORK;
-- ACTUALIZA INVENTARIO
  SET LOCK MODE TO WAIT;
    UPDATE inarinv SET
       sal_val    = salval,
       exi_cor_kgs = exicorkgs,
       exi_cor_caj = exicorcaj,
       cos_pro_kgs = cosprokgs,
       cos_pro_caj = cosprocaj,
       can_emp     = canemp
     WHERE inarinv.num_emp=emp AND inarinv.cod_art=art;
  SET LOCK MODE TO NOT WAIT;

-- INSERTA TRANSACCION DEL KARDEX
     INSERT INTO inartrinv VALUES(emp,art,suc,fech,"DC",dev,kgs,caj,
            cosunikgs,cosunicaj,cosprokgs,cosprocaj,0,0,
            desvta,0,renglon,pro," ",0," ",iva);
COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".act_saldospro(emp CHAR(2), fech_ini DATE, fech_fin DATE);

-- VARIABLES SALDO
  DEFINE codpro   LIKE inarprov.cod_pro;
  DEFINE salact   LIKE inarprov.sal_act;
  DEFINE nument   LIKE inartrpr.num_ent;
  DEFINE salent   LIKE inartrpr.sal_ent;
  DEFINE saliva   LIKE inartrpr.sal_iva;
  DEFINE tipent   LIKE inartrpr.tip_ent;
  DEFINE imppago  LIKE inartrpr1.importe;
  DEFINE ivapago  LIKE inartrpr1.iva;
  DEFINE suc      LIKE inartrpr.num_suc;
  DEFINE fent     LIKE inartrpr.fecha;

--LETE FROM tmptrpr;

BEGIN WORK;
-- LEE CATALOGO DE PROVEEDORES
  FOREACH
   SELECT cod_pro, sal_ant
     INTO codpro, salact
     FROM inarprov
    WHERE inarprov.num_emp=emp
    ORDER BY cod_pro

-- IF salact IS NULL THEN
   LET salact=0;
-- END IF;

-- BUSCA FACTURAS DEL PROVEEDOR
    FOREACH 
       SELECT tip_ent, num_ent, imp_ent, sal_iva, num_suc, fecha
         INTO tipent, nument, salent, saliva, suc, fent
         FROM inartrpr
        WHERE inartrpr.num_emp=emp
          AND inartrpr.num_suc=emp
          AND inartrpr.cod_pro=codpro
          AND inartrpr.fecha <= fech_fin
          ORDER BY fecha

--SERT INTO tmptrcl VALUES(emp,emp,codpro,tipfac,numfac,salent,salent,saliva,
--                         ffac);

    LET salact = salact + salent;

-- BUSCA PAGOS, DEVOLUCIONES Y BONIFICACIONES
       FOREACH
          SELECT importe, iva
            INTO imppago, ivapago
            FROM inartrpr1
           WHERE inartrpr1.num_emp=emp
             AND inartrpr1.num_suc=suc
             AND inartrpr1.num_ent=nument
             AND inartrpr1.tip_ent=tipent
             AND inartrpr1.fecha <= fech_fin
             ORDER BY fecha

          LET salact = salact - imppago;
          LET salent = salent - imppago;
          LET saliva = saliva - ivapago;

--DATE tmptrcl
--T    tmptrcl.sal_ent = tmptrcl.sal_ent - imppago,
--     tmptrcl.sal_iva = tmptrcl.sal_iva - ivapago
--      WHERE tmptrcl.num_emp=emp
--        AND tmptrcl.fecha = ffac
--        AND tmptrcl.num_docto = numfac
--        AND tmptrcl.tipo = tipfac;

          -- ACTUALIZA SALDO ENTRADA
          UPDATE inartrpr
             SET inartrpr.sal_ent = salent
           WHERE inartrpr.num_emp = emp
             AND inartrpr.num_suc = emp
             AND inartrpr.num_ent = nument
             AND inartrpr.tip_ent = tipent
             AND inartrpr.fecha = fent;
       END FOREACH;
    END FOREACH;
  UPDATE inarprov
     SET inarprov.sal_act = salact
   WHERE inarprov.num_emp = emp
     AND inarprov.cod_pro = codpro;
  END FOREACH;
COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".act_kardex(emp CHAR(2), fech_ini DATE,
                                     fech_fin DATE,art CHAR(14));

--FINE art      LIKE inarinv.cod_art;
DEFINE exi_kgs  LIKE inarinv.exi_cor_kgs;
DEFINE exi_caj  LIKE inarinv.exi_cor_caj;
DEFINE entdivkg LIKE inarinv.exi_cor_kgs;
DEFINE entdivca LIKE inarinv.exi_cor_caj;
DEFINE saldivkg LIKE inarinv.exi_cor_kgs;
DEFINE saldivca LIKE inarinv.exi_cor_caj;
DEFINE pro_kgs  LIKE inarinv.cos_pro_kgs;
DEFINE pro_caj  LIKE inarinv.cos_pro_caj;
DEFINE canemp   LIKE inarinv.can_emp;
DEFINE tipart   LIKE inarinv.tip_art;
DEFINE val      LIKE inarinv.sal_val;
DEFINE prom     LIKE inventario.cos_pro;
DEFINE tkgs     LIKE inartrinv.can_kgs;
DEFINE tcaj     LIKE inartrinv.can_caj;
DEFINE kgs      LIKE inartrinv.can_kgs;
DEFINE caj      LIKE inartrinv.can_caj;
DEFINE uni_kgs  LIKE inartrinv.cos_uni_kgs;
DEFINE uni_caj  LIKE inartrinv.cos_uni_caj;
DEFINE tipdoc   LIKE inartrinv.tip_doc;
DEFINE numdoc   LIKE inartrinv.num_doc;
DEFINE fech     LIKE inartrinv.fech_doc;
DEFINE suc      LIKE inartrinv.num_suc;
DEFINE renglon  LIKE inartrinv.ren_art;
DEFINE enc      CHAR(1);

-- INICIALIZA TABLA TEMPORAL
DELETE FROM tmp_canemp;
DELETE FROM log_actkardex;

BEGIN WORK;
-- LEE CATALOGO DE ARTICULOS
FOREACH
  SELECT cod_art,tip_art
    INTO art,tipart
    FROM inarinv
   WHERE inarinv.num_emp=emp
     AND inarinv.cod_art=art

  LET entdivkg = 0;
  LET entdivca = 0;
  LET saldivkg = 0;
  LET saldivca = 0;

  IF EXISTS(SELECT cod_art
              FROM inventario
             WHERE inventario.num_emp=emp
               AND inventario.fecha=fech_ini
               AND inventario.cod_art=art)
  THEN
     LET enc="S";
  ELSE
     LET enc="N";
  END IF;

-- SELECCIONA INVENTARIO INICIal del articulo
  IF enc = "S" THEN
     SELECT can_kgs, can_caj, can_emp, cos_pro
       INTO exi_kgs, exi_caj, canemp, prom
       FROM inventario
      WHERE inventario.num_emp=emp
        AND inventario.fecha=fech_ini
        AND inventario.cod_art=art;
  ELSE
      LET exi_kgs=0;
      LET exi_caj=0;
      LET canemp=0;
      LET prom=0;
  END IF;

  IF tipart="K" THEN
     LET pro_kgs = prom;
     LET val     = pro_kgs * exi_kgs;
     IF exi_caj <> 0 THEN
        LET pro_caj = val / exi_caj;
     ELSE
        LET pro_caj = 0;
     END IF;
  END IF;

  IF tipart="C" THEN
     LET pro_caj = prom;
     LET val     = pro_caj * exi_caj;
     IF exi_kgs <> 0 THEN
        LET pro_kgs = val / exi_kgs;
     ELSE
        LET pro_kgs = 0;
     END IF;
  END IF;

--BEGIN WORK;
-- SELECCIONA MOVIMIENTOS KARDEX
   FOREACH
     SELECT can_kgs,can_caj,cos_uni_kgs, cos_uni_caj,
            num_suc, tip_doc, fech_doc, num_doc, ren_art
       INTO kgs,caj,uni_kgs, uni_caj,
            suc, tipdoc, fech, numdoc, renglon
       FROM inartrinv
      WHERE inartrinv.num_emp=emp
        AND inartrinv.cod_art=art
        AND inartrinv.fech_doc BETWEEN fech_ini AND fech_fin
      ORDER BY fech_doc, tip_doc, num_doc

-- SI SON COMPRAS
    IF tipdoc="AC" or tipdoc="CO" THEN

       IF tipart="K" THEN
          LET exi_kgs = exi_kgs + kgs;
          LET val     = val + (kgs * uni_kgs);
          LET exi_caj = exi_caj + caj;
       END IF;

       IF tipart="C" THEN
          LET exi_caj = exi_caj + caj;
          LET val     = val + (caj * uni_caj);
          LET exi_kgs = exi_kgs + kgs;
       END IF;

       IF exi_kgs <> 0 THEN
          LET pro_kgs = val / exi_kgs;
       ELSE
          LET pro_kgs = 0;
          INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
                      exi_caj,canemp,"CO  EXIST. EN KGS 0");
       END IF;
       IF exi_caj <> 0 THEN
          LET pro_caj = val / exi_caj;
          LET canemp  = (exi_kgs-entdivkg+saldivkg)/(exi_caj-entdivca+saldivca);
       ELSE
          LET pro_caj = 0;
          LET canemp  = 0;
          INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
                      exi_caj,canemp,"CO  EXIST. EN CAJ 0");
       END IF;

-- ACTUALIZA KARDEX
       UPDATE inartrinv
          SET inartrinv.cos_pro_kgs=pro_kgs,
              inartrinv.cos_pro_caj=pro_caj
        WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
          AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
          AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
          AND inartrinv.ren_art=renglon;

        UPDATE inarinv
           SET inarinv.ult_cos_kgs = uni_kgs,
               inarinv.ult_cos_caj = uni_caj,
               inarinv.cos_pro_kgs = pro_kgs,
               inarinv.cos_pro_caj = pro_caj,
               inarinv.can_emp     = canemp
         WHERE inarinv.num_emp=emp
           AND inarinv.cod_art=art;

    END IF;

-- SI SON DEVOLUCIONES COMPRAS
    IF tipdoc="DC" THEN

       IF tipart="K" THEN
          LET exi_kgs = exi_kgs - kgs;
          LET val     = val - (kgs * uni_kgs);
          LET exi_caj = exi_caj - caj;
       END IF;

       IF tipart="C" THEN
          LET exi_caj = exi_caj - caj;
          LET val     = val - (caj * uni_caj);
          LET exi_kgs = exi_kgs - kgs;
       END IF;

--     IF exi_kgs <> 0 THEN
--        LET pro_kgs = val / exi_kgs;
--     ELSE
--        LET pro_kgs = 0;
--        INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
--                    exi_caj,canemp,"DC  EXIST. EN KGS 0");
--     END IF;
--     IF exi_caj <> 0 THEN
--       LET pro_caj = val / exi_caj;
--          LET canemp  = exi_kgs / exi_caj;
--     ELSE
--        LET pro_caj = 0;
--        LET canemp  = 0;
--        INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
--                    exi_caj,canemp,"DC  EXIST. EN CAJ 0");
--     END IF;
-- ACTUALIZA KARDEX
       UPDATE inartrinv
          SET inartrinv.cos_pro_kgs=pro_kgs,
              inartrinv.cos_pro_caj=pro_caj
        WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
          AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
          AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
          AND inartrinv.ren_art=renglon;

        UPDATE inarinv
           SET inarinv.cos_pro_kgs = pro_kgs,
               inarinv.cos_pro_caj = pro_caj
         WHERE inarinv.num_emp=emp
           AND inarinv.cod_art=art;
    END IF;


-- SI SON ENTRADAS DIVERSAS
    IF tipdoc="ED" THEN
--     IF canemp = 0 THEN
--        INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
--                    exi_caj,canemp,"(ED) CAN_EMP EN 0   ");
--     END IF;
       IF tipart="K" THEN
          LET exi_kgs = exi_kgs + kgs;
          LET val     = val + (kgs * pro_kgs);
--        IF canemp <> 0 THEN
--           LET caj     = kgs / canemp;
--        ELSE
--           LET caj     = 0;
--        END IF;
          LET exi_caj = exi_caj + caj;
       END IF;
       IF tipart="C" THEN
          LET exi_caj = exi_caj + caj;
          LET val     = val + (caj * pro_caj);
--        LET kgs     = caj * canemp;
          LET exi_kgs = exi_kgs + kgs;
       END IF;
-- SUMA ENTRADAS DIV. PARA RESTAR EN CALCULO DE CAN_EMP LUPITA 4 MARZO 2008
  LET entdivkg = entdivkg + kgs;
  LET entdivca = entdivca + caj;

-- ACTUALIZA KARDEX
       UPDATE inartrinv
          SET inartrinv.cos_pro_kgs=pro_kgs,
              inartrinv.cos_pro_caj=pro_caj,
              inartrinv.can_kgs=kgs,
              inartrinv.can_caj=caj
        WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
          AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
          AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
          AND inartrinv.ren_art=renglon;
    END IF;

-- SI SON SALIDAS DIVERSAS
    IF tipdoc="SD" THEN
--     IF canemp = 0 THEN
--        INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
--                    exi_caj,canemp,"(SD) CAN_EMP EN 0   ");
--     END IF;
       IF tipart="K" THEN
          LET exi_kgs = exi_kgs - kgs;
          LET val     = val - (kgs * pro_kgs);
--        IF canemp <> 0 THEN
--           LET caj     = kgs / canemp;
--        ELSE
--           LET caj     = 0;
--        END IF;
          LET exi_caj = exi_caj - caj;
       END IF;
       IF tipart="C" THEN
          LET exi_caj = exi_caj - caj;
          LET val     = val - (caj * pro_caj);
--        LET kgs     = caj * canemp;
          LET exi_kgs = exi_kgs - kgs;
       END IF;

-- SUMA SALIDAS DIV. PARA RESTAR EN CALCULO DE CAN_EMP LUPITA 4 MARZO 2008
  LET saldivkg = saldivkg + kgs;
  LET saldivca = saldivca + caj;

-- ACTUALIZA KARDEX
       UPDATE inartrinv
          SET inartrinv.cos_pro_kgs=pro_kgs,
              inartrinv.cos_pro_caj=pro_caj,
              inartrinv.can_kgs=kgs,
              inartrinv.can_caj=caj
        WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
          AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
          AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
          AND inartrinv.ren_art=renglon;
    END IF;


-- SI SON DEVOLUCIONES SOBRE VENTAS DE SUPERS SOLO KGS
    IF tipdoc="DF" THEN
       IF canemp = 0 THEN
          INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
                      exi_caj,canemp,"(DF) CAN_EMP EN 0   ");
       END IF;
        LET exi_kgs = exi_kgs + kgs;
        LET val     = val + (kgs * pro_kgs);
        LET caj     = 0;

-- ACTUALIZA KARDEX SOLO KGS
       UPDATE inartrinv
          SET inartrinv.cos_pro_kgs=pro_kgs,
              inartrinv.cos_pro_caj=pro_caj,
              inartrinv.can_kgs=kgs,
              inartrinv.can_caj=0
        WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
          AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
          AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
          AND inartrinv.ren_art=renglon;
    END IF;


-- SI SON DEVOLUCIONES SOBRE VENTAS
    IF tipdoc="DV" THEN
       IF canemp = 0 THEN
          INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
                      exi_caj,canemp,"(DV) CAN_EMP EN 0   ");
       END IF;
       IF tipart="K" THEN
          LET exi_kgs = exi_kgs + kgs;
          LET val     = val + (kgs * pro_kgs);
          IF canemp <> 0 THEN
             LET caj     = kgs / canemp;
          ELSE
             LET caj     = 0;
          END IF;
          LET exi_caj = exi_caj + caj;
       END IF;
       IF tipart="C" THEN
          LET exi_caj = exi_caj + caj;
          LET val     = val + (caj * pro_caj);
          LET kgs     = caj * canemp;
          LET exi_kgs = exi_kgs + kgs;
       END IF;

-- ACTUALIZA KARDEX
       UPDATE inartrinv
          SET inartrinv.cos_pro_kgs=pro_kgs,
              inartrinv.cos_pro_caj=pro_caj,
              inartrinv.can_kgs=kgs,
              inartrinv.can_caj=caj
        WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
          AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
          AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
          AND inartrinv.ren_art=renglon;
    END IF;

-- SI SON VENTAS
    IF tipdoc="FA" or tipdoc="TI" THEN
       SELECT kilos, cajas
         INTO tkgs, tcaj
         FROM tmp_kardex
        WHERE tmp_kardex.factura  = numdoc
          AND tmp_kardex.tipo_doc = tipdoc
          AND tmp_kardex.codigo   = art
          AND tmp_kardex.ren      = renglon;

       IF canemp = 0 THEN
          INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
                      exi_caj,canemp,"VTA  CAN_EMP EN 0   ");
       END IF;

       IF (tkgs > 0)  AND (tcaj > 0) THEN
          LET caj     = tcaj;
          LET kgs     = tkgs;
       END IF;
       IF (tkgs > 0)  AND (tcaj = 0) THEN
          IF canemp <> 0 THEN
             LET caj     = tkgs / canemp;
          ELSE
             LET caj     = 0;
          END IF;
       END IF;
       IF (tkgs = 0) AND (tcaj > 0) THEN
          LET kgs     = tcaj * canemp;
       END IF;
       IF tipart="K" THEN
          LET exi_kgs = exi_kgs - kgs;
          LET val     = val - (kgs * pro_kgs);
          LET exi_caj = exi_caj - caj;
       END IF;
       IF tipart="C" THEN
          LET exi_caj = exi_caj - caj;
          LET val     = val - (caj * pro_caj);
          LET exi_kgs = exi_kgs - kgs;
       END IF;

-- ACTUALIZA KARDEX
       UPDATE inartrinv
          SET inartrinv.cos_pro_kgs=pro_kgs,
              inartrinv.cos_pro_caj=pro_caj,
              inartrinv.can_kgs=kgs,
              inartrinv.can_caj=caj
        WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
          AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
          AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
          AND inartrinv.ren_art=renglon;
    END IF;

INSERT INTO tmp_canemp VALUES(fech,art,tipdoc,numdoc,kgs,caj,canemp,renglon,
       pro_kgs,pro_caj,exi_kgs,exi_caj,val);

   END FOREACH;
-- COMMIT WORK;

 UPDATE inarinv
    SET inarinv.exi_cor_kgs=exi_kgs,
        inarinv.exi_cor_caj=exi_caj,
        inarinv.can_emp=canemp,
        inarinv.sal_val=val,
        inarinv.cos_pro_kgs=pro_kgs,
        inarinv.cos_pro_caj=pro_caj
  WHERE inarinv.num_emp=emp
    AND inarinv.cod_art=art;

END FOREACH;
 COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".cancela_pago_pro (emp CHAR(2), suc CHAR(2), 
   tipopago CHAR(2), numpago INTEGER, pro CHAR(8));

-- VARIABLES PAGO
DEFINE imppago  LIKE inarppr.imp_pago;
DEFINE ivapago  LIKE inarppr.iva_pago;
DEFINE fech     LIKE inarppr.fecha;
DEFINE imp      LIKE inartrpr1.importe;
DEFINE iva15    LIKE inartrpr1.iva;
DEFINE tipent   LIKE inartrpr1.tip_ent;
DEFINE nument   LIKE inartrpr1.num_ent;

BEGIN WORK;
  IF EXISTS(SELECT numero
              FROM documento
             WHERE documento.num_emp = emp
               AND documento.num_suc = suc
               AND documento.tipo    = "PP"
               AND documento.numero  = numpago)
   THEN
     FOREACH
      SELECT num_ent, tip_ent, importe, iva
        INTO nument, tipent, imp, iva15
        FROM inartrpr1
       WHERE inartrpr1.num_emp = emp
         AND inartrpr1.num_suc = suc
         AND inartrpr1.tip_pag = tipopago
         AND inartrpr1.num_pag = numpago
         AND inartrpr1.cod_pro = pro

       SET LOCK MODE TO WAIT;
          UPDATE inartrpr
             SET inartrpr.sal_ent = inartrpr.sal_ent+imp,
                 inartrpr.sal_iva = inartrpr.sal_iva+iva15
           WHERE inartrpr.num_emp   = emp
             AND inartrpr.num_suc   = suc
             AND inartrpr.tip_ent   = tipent
             AND inartrpr.num_ent   = nument
             AND inartrpr.cod_pro   = pro;
       SET LOCK MODE TO NOT WAIT;

      DELETE FROM inartrpr1
       WHERE inartrpr1.num_emp = emp
         AND inartrpr1.num_suc = suc
         AND inartrpr1.tip_pag = tipopago
         AND inartrpr1.num_pag = numpago
         AND inartrpr1.cod_pro = pro
         AND inartrpr1.num_ent = nument
         AND inartrpr1.tip_ent = tipent;
     END FOREACH;

     SELECT imp_pago, iva_pago
       INTO imppago, ivapago
       FROM inarppr
      WHERE inarppr.num_emp = emp
        AND inarppr.num_suc = suc
        AND inarppr.tipo_pago = tipopago
        AND inarppr.num_pago  = numpago
        AND inarppr.cod_pro   = pro;

     DELETE FROM inarppr
      WHERE inarppr.num_emp = emp
        AND inarppr.num_suc = suc
        AND inarppr.tipo_pago = tipopago
        AND inarppr.num_pago  = numpago
        AND inarppr.cod_pro   = pro;
  
     DELETE FROM documento
       WHERE documento.num_emp = emp
         AND documento.num_suc = suc
         AND documento.tipo    = "PP"
         AND documento.numero  = numpago;
  
     SET LOCK MODE TO WAIT;
        UPDATE inarprov
           SET inarprov.sal_act  = inarprov.sal_act+imppago
         WHERE inarprov.num_emp = emp
           AND inarprov.cod_pro = pro;
     SET LOCK MODE TO NOT WAIT;
END IF;
COMMIT WORK;

END PROCEDURE;

CREATE PROCEDURE "xxx".act_saldoscli(emp CHAR(2), fech_ini DATE, fech_fin DATE);

-- VARIABLES SALDO
  DEFINE codcli   LIKE inarcl.cod_cli;
  DEFINE salact   LIKE inarcl.sal_act;
  DEFINE numfac   LIKE inartrcl.num_docto;
  DEFINE salfac   LIKE inartrcl.sal_fac;
  DEFINE saliva   LIKE inartrcl.sal_iva;
  DEFINE tipfac   LIKE inartrcl.tipo;
  DEFINE imppago  LIKE inartrcl1.importe;
  DEFINE ivapago  LIKE inartrcl1.iva;
  DEFINE suc      LIKE inartrcl.num_suc;
  DEFINE ffac     LIKE inartrcl.fecha;

DELETE FROM tmptrcl;

BEGIN WORK;
-- LEE CATALOGO DE CLIENTES
  FOREACH
   SELECT cod_cli, sal_ant
     INTO codcli, salact
     FROM inarcl
    WHERE inarcl.num_emp=emp
    ORDER BY cod_cli

-- IF salact IS NULL THEN
   LET salact=0;
-- END IF;

-- BUSCA FACTURAS DEL CLIENTE
    FOREACH 
       SELECT tipo, num_docto, importe, sal_iva, num_suc, fecha
         INTO tipfac, numfac, salfac, saliva, suc, ffac
         FROM inartrcl
        WHERE inartrcl.num_emp=emp
          AND inartrcl.num_suc=emp
          AND inartrcl.cod_cli=codcli
          AND inartrcl.fecha <= fech_fin
          ORDER BY fecha

INSERT INTO tmptrcl VALUES(emp,emp,codcli,tipfac,numfac,salfac,salfac,saliva,
                           ffac);

    LET salact = salact + salfac;

-- BUSCA PAGOS, DEVOLUCIONES Y BONIFICACIONES
       FOREACH
          SELECT importe, iva
            INTO imppago, ivapago
            FROM inartrcl1
           WHERE inartrcl1.num_emp=emp
             AND inartrcl1.num_suc=suc
             AND inartrcl1.num_car=numfac
             AND inartrcl1.tip_car=tipfac
             AND inartrcl1.fecha <= fech_fin
             ORDER BY fecha

          LET salact = salact - imppago;
          LET salfac = salfac - imppago;
          LET saliva = saliva - ivapago;
          IF salfac<1 THEN
             LET salfac=0;
          END IF;
          IF saliva<1 THEN
             LET saliva=0;
          END IF;

UPDATE tmptrcl
SET    tmptrcl.sal_fac = tmptrcl.sal_fac - imppago,
       tmptrcl.sal_iva = tmptrcl.sal_iva - ivapago
        WHERE tmptrcl.num_emp=emp
          AND tmptrcl.fecha = ffac
          AND tmptrcl.num_docto = numfac
          AND tmptrcl.tipo = tipfac;

          -- ACTUALIZA SALDO FACTURA
          UPDATE inartrcl
             SET inartrcl.sal_fac = salfac
           WHERE inartrcl.num_emp = emp
             AND inartrcl.num_suc = emp
             AND inartrcl.num_docto = numfac
             AND inartrcl.tipo = tipfac
             AND inartrcl.fecha = ffac;
       END FOREACH;
    END FOREACH;
  UPDATE inarcl
     SET inarcl.sal_act = salact
   WHERE inarcl.num_emp = emp
     AND inarcl.cod_cli = codcli;
  END FOREACH;
COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".gen_poliza(emp CHAR(2), fec DATE, tip CHAR(1), num INTEGER,
    con  CHAR(80));
-- DEFINE VARIABLES
  DEFINE    cta LIKE catalogo_poliza.num_cta;
  DEFINE    nom LIKE catalogo_poliza.nom_cta;
  DEFINE    rel LIKE catalogo_poliza.tip_rel;
  DEFINE tipmov LIKE catalogo_poliza.car_abo;
  DEFINE    imp LIKE poliza.importe;
  DEFINE    car LIKE poliza_cab.cargos;
  DEFINE    abo LIKE poliza_cab.abonos;

  DELETE FROM poliza WHERE poliza.num_emp=emp AND poliza.fecha=fec
     AND poliza.num_pol=num AND poliza.tip_pol=tip;

  DELETE FROM poliza_cab WHERE poliza_cab.num_emp=emp AND poliza_cab.fecha=fec
     AND poliza_cab.num_pol=num AND poliza_cab.tip_pol=tip;

  LET car=0;
  LET abo=0;

-- BUSCA CATALOGO CUENTAS PARA LA POLIZA
    FOREACH
       SELECT num_cta, nom_cta, tip_rel, car_abo
         INTO cta, nom, rel, tipmov
         FROM catalogo_poliza
        WHERE catalogo_poliza.num_emp=emp
          AND catalogo_poliza.tip_pol=tip
          ORDER BY tip_rel

-- TOTAL COMPRAS SIN I.V.A.
     IF rel="A" THEN
        SELECT sum(imp_exe) INTO imp FROM inarent
         WHERE num_emp=emp AND fecha=fec;
        IF imp IS NULL THEN
           LET imp=0;
        END IF;
        INSERT INTO poliza VALUES(emp,fec,num,tip,tipmov,cta,nom,imp);
     END IF;

-- TOTAL COMPRAS CON I.V.A.
     IF rel="B" THEN
        SELECT sum(imp_15) INTO imp FROM inarent
         WHERE num_emp=emp AND fecha=fec;
        IF imp IS NULL THEN
           LET imp=0;
        END IF;
        INSERT INTO poliza VALUES(emp,fec,num,tip,tipmov,cta,nom,imp);
     END IF;

-- TOTAL VENTAS A CLIENTES FORANEOS
     IF rel="C" THEN
        SELECT sum(importe) INTO imp FROM inartrcl
         WHERE num_emp=emp AND fecha=fec
           AND tipo="FA"
           AND cod_cli NOT MATCHES "*L";
        IF imp IS NULL THEN
           LET imp=0;
        END IF;
        INSERT INTO poliza VALUES(emp,fec,num,tip,tipmov,cta,nom,imp);
     END IF;

-- TOTAL VENTAS A CLIENTES LOCALES
     IF rel="D" THEN
        SELECT sum(importe) INTO imp FROM inartrcl
         WHERE num_emp=emp
           AND tipo="FA"
           AND fecha=fec AND cod_cli MATCHES "*L";
        IF imp IS NULL THEN
           LET imp=0;
        END IF;
        INSERT INTO poliza VALUES(emp,fec,num,tip,tipmov,cta,nom,imp);
     END IF;

-- TOTAL I.V.A. DE COMPRAS GRAVADAS
     IF rel="E" THEN
        SELECT sum(iva_15) INTO imp FROM inarent
         WHERE num_emp=emp AND fecha=fec;
        IF imp IS NULL THEN
           LET imp=0;
        END IF;
        INSERT INTO poliza VALUES(emp,fec,num,tip,tipmov,cta,nom,imp);
     END IF;

-- TOTAL DESCUENTOS DE VENTA
     IF rel="F" THEN
        SELECT sum(des_exe+des_15) INTO imp FROM inarfac
         WHERE num_emp=emp AND fecha=fec;
        IF imp IS NULL THEN
           LET imp=0;
        END IF;
        INSERT INTO poliza VALUES(emp,fec,num,tip,tipmov,cta,nom,imp);
     END IF;

-- TOTAL COSTO DE VENTAS
     IF rel="G" THEN
        SELECT sum(cos_vta) INTO imp FROM inarfac
         WHERE num_emp=emp AND fecha=fec;
        IF imp IS NULL THEN
           LET imp=0;
        END IF;
        INSERT INTO poliza VALUES(emp,fec,num,tip,tipmov,cta,nom,imp);
     END IF;

-- TOTAL SALIDAS POR VENTA (INVENTARIO)
     IF rel="H" THEN
        SELECT sum(cos_vta) INTO imp FROM inarfac
         WHERE num_emp=emp AND fecha=fec;
        IF imp IS NULL THEN
           LET imp=0;
        END IF;
        INSERT INTO poliza VALUES(emp,fec,num,tip,tipmov,cta,nom,imp);
     END IF;

-- TOTAL COMPRAS A PROVEEDORES FORANEOS
     IF rel="I" THEN
        SELECT sum(imp_ent) INTO imp FROM inartrpr
         WHERE num_emp=emp AND tip_ent="1"
           AND fecha=fec AND cod_pro NOT MATCHES "*L";
        IF imp IS NULL THEN
           LET imp=0;
        END IF;
        INSERT INTO poliza VALUES(emp,fec,num,tip,tipmov,cta,nom,imp);
     END IF;

-- TOTAL COMPRAS A PROVEEDORES LOCALES
     IF rel="J" THEN
        SELECT sum(imp_ent) INTO imp FROM inartrpr
         WHERE num_emp=emp AND tip_ent="1"
           AND fecha=fec AND cod_pro MATCHES "*L";
        IF imp IS NULL THEN
           LET imp=0;
        END IF;
        INSERT INTO poliza VALUES(emp,fec,num,tip,tipmov,cta,nom,imp);
     END IF;

-- TOTAL I.V.A. TRASLADADO DE VENTAS
     IF rel="K" THEN
        SELECT sum(iva_15) INTO imp FROM inarfac
         WHERE num_emp=emp AND fecha=fec;
        IF imp IS NULL THEN
           LET imp=0;
        END IF;
        INSERT INTO poliza VALUES(emp,fec,num,tip,tipmov,cta,nom,imp);
     END IF;

-- TOTAL DE VENTAS GRAVADAS
     IF rel="L" THEN
        SELECT sum(imp_15) INTO imp FROM inarfac
         WHERE num_emp=emp AND fecha=fec;
        IF imp IS NULL THEN
           LET imp=0;
        END IF;
        INSERT INTO poliza VALUES(emp,fec,num,tip,tipmov,cta,nom,imp);
     END IF;

-- TOTAL DE VENTAS EXENTAS
     IF rel="M" THEN
        SELECT sum(imp_exe) INTO imp FROM inarfac
         WHERE num_emp=emp AND fecha=fec;
        IF imp IS NULL THEN
           LET imp=0;
        END IF;
        INSERT INTO poliza VALUES(emp,fec,num,tip,tipmov,cta,nom,imp);
     END IF;

-- SUMA TOTALES DE POLIZA CARGOS Y ABONOS
      IF tipmov="0" THEN
         LET car=car+imp;
      ELSE
         LET abo=abo+imp;
      END IF;
    END FOREACH;
  INSERT INTO poliza_cab VALUES(emp,fec,num,tip,con,car,abo);
END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_dev(emp char(2), suc char(2), dev char(10),
 fech date, cli char(8), fac char(10), impexe decimal(12,4),imp15 decimal(12,4),
 iva15 decimal(10,4), cosvta decimal(12,4), desexe decimal(10,4),
 des15 decimal(10,4), motiv char(80), clavecajera char(12),tipdoc CHAR(2));

-- VARIABLES DEVOLUCION
  DEFINE nomcli  LIKE inarfac.raz_soc;
  DEFINE domcli  LIKE inarfac.dom_cli;
  DEFINE ciucli  LIKE inarfac.ciu_cli;
  DEFINE estcli  LIKE inarfac.est_cli;
  DEFINE rfccli  LIKE inarfac.reg_fed;
  DEFINE agente  LIKE inarfac.ag_fac;
  DEFINE stot    LIKE inartrcl1.importe;
  DEFINE tot     LIKE inartrcl1.importe;

-- INSERTA DEVOLUCION
 SELECT raz_soc,dom_cli,ciu_cli,est_cli,reg_fed,ag_fac
   INTO nomcli,domcli,ciucli,estcli,rfccli,agente
   FROM inarfac
  WHERE inarfac.num_emp=emp AND inarfac.cod_cli=cli
    AND inarfac.num_doc=fac AND inarfac.num_suc=suc;

 INSERT INTO inardev VALUES(emp,suc,dev,cli,nomcli,domcli,ciucli,estcli,
   impexe,0,imp15,0,desexe,0,des15,0,0,iva15,0,cosvta,0,0,0,0,0,0,fech,
   rfccli,motiv,clavecajera);

-- INSERTA TRANSACCIONES CLIENTES
 LET stot=impexe+imp15-desexe-des15;
 LET tot=impexe+imp15+iva15-desexe-des15;

 INSERT INTO inartrcl1 VALUES(emp,suc,"FA",fac,dev,tipdoc,cli,tot,iva15,fech,
                               "DEVOLUCION");

-- ACTUALIZA SALDO FACTURA
SET LOCK MODE TO WAIT;
UPDATE inartrcl
   SET inartrcl.sal_fac=inartrcl.sal_fac-tot,
       inartrcl.sal_iva=inartrcl.sal_iva-iva15
 WHERE inartrcl.num_emp   = emp
   AND inartrcl.num_suc   = suc
   AND inartrcl.tipo      = "FA"
   AND inartrcl.num_docto = fac
   AND inartrcl.cod_cli   = cli;
SET LOCK MODE TO NOT WAIT;

-- ACTUALIZA VENTA AGENTE
SET LOCK MODE TO WAIT;
 UPDATE inarag
  SET inarag.vta_mes=(vta_mes-stot),
      inarag.vta_acu=(vta_acu-stot),
      inarag.cos_mes=(cos_mes-cosvta),
      inarag.cos_acu=(cos_acu-cosvta)
   WHERE inarag.num_emp=emp
     AND inarag.num_suc=suc
     AND inarag.cod_ag=agente;
SET LOCK MODE TO NOT WAIT;

-- ACTUALIZA SALDO CLIENTES
SET LOCK MODE TO WAIT;
 UPDATE inarcl
   SET inarcl.com_mes=(com_mes-stot),
       inarcl.com_acu=(com_acu-stot),
       inarcl.cos_mes=(cos_mes-cosvta),
       inarcl.cos_acu=(cos_acu-cosvta),
       inarcl.can_com=(can_com-stot),
       inarcl.sal_act=(sal_act-tot)
   WHERE inarcl.num_emp=emp
     AND inarcl.cod_cli=cli;
SET LOCK MODE TO NOT WAIT;

-- INSERTA CONTROL DE DOCUMENTOS
  INSERT INTO documento VALUES(emp,suc,tipdoc,dev,tot,fech);
END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_tr_dev(emp char(2), suc char(2),
  art char(14), fech date, dev char(10), cli char(8),
  kgs decimal(10,4), caj decimal(10,4),cosprokgs decimal(12,4),
  cosprocaj decimal(12,4),prevtakgs decimal(12,4),
  prevtacaj decimal(12,4),desvta decimal(12,4),fle decimal(12,4),
  renglon smallint,iva decimal(12,4), tipdoc CHAR(2));

-- VARIABLES INVENTARIO
  DEFINE salval    LIKE inarinv.sal_val;
  DEFINE venmeskgs LIKE inarinv.ven_mes_kgs;
  DEFINE venmescaj LIKE inarinv.ven_mes_caj;
  DEFINE venacukgs LIKE inarinv.ven_acu_kgs;
  DEFINE venacucaj LIKE inarinv.ven_acu_caj;
  DEFINE cosmeskgs LIKE inarinv.cos_mes_kgs;
  DEFINE cosmescaj LIKE inarinv.cos_mes_caj;
  DEFINE cosacukgs LIKE inarinv.cos_acu_kgs;
  DEFINE cosacucaj LIKE inarinv.cos_acu_caj;
  DEFINE exicorkgs LIKE inarinv.exi_cor_kgs;
  DEFINE exicorcaj LIKE inarinv.exi_cor_caj;
  DEFINE canmeskgs LIKE inarinv.can_mes_kgs;
  DEFINE canmescaj LIKE inarinv.can_mes_caj;
  DEFINE canacukgs LIKE inarinv.can_acu_kgs;
  DEFINE canacucaj LIKE inarinv.can_acu_caj;
-- VARIABLES COSTO DE VENTAS
  DEFINE cosvta LIKE inarfac.cos_vta;
  DEFINE tipart LIKE inarinv.tip_art;
  DEFINE tot    LIKE inartrcl.importe;
  DEFINE stot   LIKE inartrcl.importe;

  LET cosvta=0;

-- ACTUALIZA INVENTARIO
  SET LOCK MODE TO WAIT;
    UPDATE inarinv SET
       sal_val    = sal_val + (kgs * cosprokgs),
       ven_mes_kgs = ven_mes_kgs - (kgs * prevtakgs),
       ven_mes_caj = ven_mes_caj - (caj * prevtacaj),
       ven_acu_kgs = ven_acu_kgs - (kgs * prevtakgs),
       ven_acu_caj = ven_acu_caj - (caj * prevtacaj),
       cos_mes_kgs = cos_mes_kgs - (kgs * cosprokgs),
       cos_mes_caj = cos_mes_caj - (caj * cosprocaj),
       cos_acu_kgs = cos_acu_kgs - (kgs * cosprokgs),
       cos_acu_caj = cos_acu_caj - (caj * cosprocaj),
       exi_cor_kgs = exi_cor_kgs + kgs,
       exi_cor_caj = exi_cor_caj + caj,
       can_mes_kgs = can_mes_kgs - kgs,
       can_mes_caj = can_mes_caj - caj,
       can_acu_kgs = can_acu_kgs - kgs,
       can_acu_caj = can_acu_caj - caj
     WHERE inarinv.num_emp=emp AND inarinv.cod_art=art;
  SET LOCK MODE TO NOT WAIT;

-- INSERTA TRANSACCION DEL KARDEX
     INSERT INTO inartrinv VALUES(emp,art,suc,fech,tipdoc,dev,kgs,caj,
            0,0,cosprokgs,cosprocaj,prevtakgs,prevtacaj,
            desvta,0,renglon," ",cli,0," ",iva);

END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_tr_devsup(emp char(2), suc char(2),
  art char(14), fech date, dev char(10), cli char(8),
  kgs decimal(10,4), caj decimal(10,4),cosprokgs decimal(12,4),
  cosprocaj decimal(12,4),prevtakgs decimal(12,4),
  prevtacaj decimal(12,4),desvta decimal(12,4),fle decimal(12,4),
  renglon smallint,iva decimal(12,4), tipdoc CHAR(2), fac char(10));

-- VARIABLES INVENTARIO
  DEFINE salval    LIKE inarinv.sal_val;
  DEFINE venmeskgs LIKE inarinv.ven_mes_kgs;
  DEFINE venmescaj LIKE inarinv.ven_mes_caj;
  DEFINE venacukgs LIKE inarinv.ven_acu_kgs;
  DEFINE venacucaj LIKE inarinv.ven_acu_caj;
  DEFINE cosmeskgs LIKE inarinv.cos_mes_kgs;
  DEFINE cosmescaj LIKE inarinv.cos_mes_caj;
  DEFINE cosacukgs LIKE inarinv.cos_acu_kgs;
  DEFINE cosacucaj LIKE inarinv.cos_acu_caj;
  DEFINE exicorkgs LIKE inarinv.exi_cor_kgs;
  DEFINE exicorcaj LIKE inarinv.exi_cor_caj;
  DEFINE canmeskgs LIKE inarinv.can_mes_kgs;
  DEFINE canmescaj LIKE inarinv.can_mes_caj;
  DEFINE canacukgs LIKE inarinv.can_acu_kgs;
  DEFINE canacucaj LIKE inarinv.can_acu_caj;
-- VARIABLES COSTO DE VENTAS
  DEFINE cosvta LIKE inarfac.cos_vta;
  DEFINE tipart LIKE inarinv.tip_art;
  DEFINE tot    LIKE inartrcl.importe;

  LET cosvta=0;

-- ACTUALIZA INVENTARIO
  SET LOCK MODE TO WAIT;
    UPDATE inarinv SET
       sal_val    = sal_val + (kgs * cosprokgs),
       ven_mes_kgs = ven_mes_kgs - (kgs * prevtakgs),
       ven_mes_caj = ven_mes_caj - (caj * prevtacaj),
       ven_acu_kgs = ven_acu_kgs - (kgs * prevtakgs),
       ven_acu_caj = ven_acu_caj - (caj * prevtacaj),
       cos_mes_kgs = cos_mes_kgs - (kgs * cosprokgs),
       cos_mes_caj = cos_mes_caj - (caj * cosprocaj),
       cos_acu_kgs = cos_acu_kgs - (kgs * cosprokgs),
       cos_acu_caj = cos_acu_caj - (caj * cosprocaj),
       exi_cor_kgs = exi_cor_kgs + kgs,
       exi_cor_caj = exi_cor_caj + caj,
       can_mes_kgs = can_mes_kgs - kgs,
       can_mes_caj = can_mes_caj - caj,
       can_acu_kgs = can_acu_kgs - kgs,
       can_acu_caj = can_acu_caj - caj
     WHERE inarinv.num_emp=emp AND inarinv.cod_art=art;
  SET LOCK MODE TO NOT WAIT;

-- INSERTA TRANSACCION DEL KARDEX
     INSERT INTO inartrinv VALUES(emp,art,suc,fech,tipdoc,dev,kgs,caj,
            0,0,cosprokgs,cosprocaj,prevtakgs,prevtacaj,
            desvta,0,renglon," ",cli,0," ",iva);

-- INSERTA TRANSACCIONES CLIENTES
 LET tot=(prevtakgs*kgs)-desvta+iva;

 INSERT INTO inartrcl1 VALUES(emp,suc,"FA",fac,dev,tipdoc,cli,tot,iva,fech,
                               "DEVOLUCION");

-- ACTUALIZA SALDO FACTURA
SET LOCK MODE TO WAIT;
UPDATE inartrcl
   SET inartrcl.sal_fac=inartrcl.sal_fac-tot,
       inartrcl.sal_iva=inartrcl.sal_iva-iva
 WHERE inartrcl.num_emp   = emp
   AND inartrcl.num_suc   = suc
   AND inartrcl.tipo      = "FA"
   AND inartrcl.num_docto = fac
   AND inartrcl.cod_cli   = cli;
SET LOCK MODE TO NOT WAIT;

END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_devsup(emp char(2), suc char(2),
 dev char(10), fech date, cli char(8), fac char(10),impexe decimal(12,4),
 imp15 decimal(12,4), iva15 decimal(10,4), cosvta decimal(12,4),
 desexe decimal(10,4), des15 decimal(10,4), motiv char(80),
 clavecajera char(12),tipdoc CHAR(2));

-- VARIABLES DEVOLUCION
  DEFINE nomcli  LIKE inarfac.raz_soc;
  DEFINE domcli  LIKE inarfac.dom_cli;
  DEFINE ciucli  LIKE inarfac.ciu_cli;
  DEFINE estcli  LIKE inarfac.est_cli;
  DEFINE rfccli  LIKE inarfac.reg_fed;
  DEFINE agente  LIKE inarfac.ag_fac;
  DEFINE stot    LIKE inartrcl1.importe;
  DEFINE tot     LIKE inartrcl1.importe;

-- INSERTA DEVOLUCION
 SELECT raz_soc,dom_cli,ciu_cli,est_cli,reg_fed,ag_fac
   INTO nomcli,domcli,ciucli,estcli,rfccli,agente
   FROM inarfac
  WHERE inarfac.num_emp=emp AND inarfac.cod_cli=cli
    AND inarfac.num_doc=fac AND inarfac.num_suc=suc;

 INSERT INTO inardev VALUES(emp,suc,dev,cli,nomcli,domcli,ciucli,estcli,
   impexe,0,imp15,0,desexe,0,des15,0,0,iva15,0,cosvta,0,0,0,0,0,0,fech,
   rfccli,motiv,clavecajera);

 LET stot=impexe+imp15-desexe-des15;
 LET tot=impexe+imp15+iva15-desexe-des15;

-- ACTUALIZA VENTA AGENTE
SET LOCK MODE TO WAIT;
 UPDATE inarag
  SET inarag.vta_mes=(vta_mes-stot),
      inarag.vta_acu=(vta_acu-stot),
      inarag.cos_mes=(cos_mes-cosvta),
      inarag.cos_acu=(cos_acu-cosvta)
   WHERE inarag.num_emp=emp
     AND inarag.num_suc=suc
     AND inarag.cod_ag=agente;
SET LOCK MODE TO NOT WAIT;

-- ACTUALIZA SALDO CLIENTES
SET LOCK MODE TO WAIT;
 UPDATE inarcl
   SET inarcl.com_mes=(com_mes-stot),
       inarcl.com_acu=(com_acu-stot),
       inarcl.cos_mes=(cos_mes-cosvta),
       inarcl.cos_acu=(cos_acu-cosvta),
       inarcl.can_com=(can_com-stot),
       inarcl.sal_act=(sal_act-tot)
   WHERE inarcl.num_emp=emp
     AND inarcl.cod_cli=cli;
SET LOCK MODE TO NOT WAIT;

-- INSERTA CONTROL DE DOCUMENTOS
  INSERT INTO documento VALUES(emp,suc,tipdoc,dev,tot,fech);
END PROCEDURE;

CREATE PROCEDURE "xxx".cancela_dev(emp char(2), suc char(2), dev char(10));

-- VARIABLES INVENTARIO
  DEFINE art       LIKE inarinv.cod_art;
  DEFINE salval    LIKE inarinv.sal_val;
  DEFINE exicorkgs LIKE inarinv.exi_cor_kgs;
  DEFINE exicorcaj LIKE inarinv.exi_cor_caj;
  DEFINE kgs       LIKE inartrinv.can_kgs;
  DEFINE caj       LIKE inartrinv.can_caj;
  DEFINE prevtakgs LIKE inartrinv.pre_vta_kgs;
  DEFINE prevtacaj LIKE inartrinv.pre_vta_caj;
  DEFINE desvta    LIKE inartrinv.des_vta;
  DEFINE renglon   LIKE inartrinv.ren_art;
  DEFINE iva       LIKE inartrinv.iva_art;
  DEFINE cosprokgs LIKE inartrinv.cos_pro_kgs;
  DEFINE cosprocaj LIKE inartrinv.cos_pro_caj;

-- VARIABLES DEVOLUCION
  DEFINE cli       LIKE inardev.cod_cli;
  DEFINE fech      LIKE inardev.fecha;
  DEFINE impexe    LIKE inardev.imp_exe;
  DEFINE imp15     LIKE inardev.imp_15;
  DEFINE iva15     LIKE inardev.iva_15;
  DEFINE cosvta    LIKE inardev.cos_vta;
  DEFINE desexe    LIKE inardev.des_exe;
  DEFINE des15     LIKE inardev.des_15;
  DEFINE agente    LIKE inarfac.ag_fac;
  DEFINE stot      LIKE inartrcl1.importe;
  DEFINE fac       LIKE inarfac.num_doc;
  DEFINE tot       LIKE inartrcl1.importe;

BEGIN WORK;
-- BUSCA DEVOLUCION
IF EXISTS(SELECT numero
            FROM documento
           WHERE documento.num_emp=emp
             AND documento.num_suc=suc
             AND documento.tipo="DV"
             AND documento.numero=dev)
THEN
  FOREACH
    SELECT cod_art,can_kgs,can_caj,pre_vta_kgs,
           pre_vta_caj,des_vta,ren_art,iva_art,fech_doc,
           cos_pro_kgs,cos_pro_caj
      INTO art,kgs,caj,prevtakgs,
           prevtacaj,desvta,renglon,iva,fech,
           cosprokgs,cosprocaj
      FROM inartrinv
     WHERE inartrinv.num_emp=emp AND inartrinv.num_suc=suc
       AND inartrinv.tip_doc="DV" AND inartrinv.num_doc=dev

-- ACTUALIZA INVENTARIO
  SET LOCK MODE TO WAIT;
    UPDATE inarinv SET
       sal_val     = sal_val - (kgs * cosprokgs),
       ven_mes_kgs = ven_mes_kgs + (kgs * prevtakgs),
       ven_mes_caj = ven_mes_caj + (caj * prevtacaj),
       ven_acu_kgs = ven_acu_kgs + (kgs * prevtakgs),
       ven_acu_caj = ven_acu_caj + (caj * prevtacaj),
       cos_mes_kgs = cos_mes_kgs + (kgs * cosprokgs),
       cos_mes_caj = cos_mes_caj + (caj * cosprocaj),
       cos_acu_kgs = cos_acu_kgs + (kgs * cosprokgs),
       cos_acu_caj = cos_acu_caj + (caj * cosprocaj),
       exi_cor_kgs = exi_cor_kgs - kgs,
       exi_cor_caj = exi_cor_caj - caj,
       can_mes_kgs = can_mes_kgs + kgs,
       can_mes_caj = can_mes_caj + caj,
       can_acu_kgs = can_acu_kgs + kgs,
       can_acu_caj = can_acu_caj + caj
     WHERE inarinv.num_emp=emp AND inarinv.cod_art=art;
  SET LOCK MODE TO NOT WAIT;

-- BORRA TRANSACCION DEL KARDEX
     DELETE FROM inartrinv
       WHERE inartrinv.num_emp=emp   AND inartrinv.cod_art=art
         AND inartrinv.fech_doc=fech AND inartrinv.tip_doc="DV"
         AND inartrinv.num_doc=dev   AND inartrinv.num_suc=suc
         AND inartrinv.ren_art=renglon;

  END FOREACH;

  SELECT imp_exe,imp_15,iva_15,cos_vta,des_exe,des_15,cod_cli
    INTO impexe,imp15,iva15,cosvta,desexe,des15,cli
    FROM inardev
   WHERE inardev.num_emp=emp AND inardev.num_suc=suc
     AND inardev.num_dev=dev;

-- TRANSACCIONES CLIENTES
 LET stot=impexe+imp15-desexe-des15;
 LET tot=impexe+imp15+iva15-desexe-des15;

-- LOCALIZA NUMERO DE FACTURA
  SELECT num_car
    INTO fac
    FROM inartrcl1
   WHERE inartrcl1.num_emp=emp
     AND inartrcl1.num_suc=suc
     AND inartrcl1.tip_cre="DV"
     AND inartrcl1.num_cre=dev;

-- LOCALIZA AGENTE DE FACTURA
  SELECT ag_fac
    INTO agente
    FROM inarfac
   WHERE inarfac.num_emp=emp
     AND inarfac.num_suc=suc
     AND inarfac.num_doc=fac;

-- ACTUALIZA VENTA AGENTE
  SET LOCK MODE TO WAIT;
   UPDATE inarag
    SET inarag.vta_mes=(vta_mes+stot),
        inarag.vta_acu=(vta_acu+stot),
        inarag.cos_mes=(cos_mes+cosvta),
        inarag.cos_acu=(cos_acu+cosvta)
     WHERE inarag.num_emp=emp
       AND inarag.num_suc=suc
       AND inarag.cod_ag=agente;
  SET LOCK MODE TO NOT WAIT;

-- ACTUALIZA SALDO CLIENTES
  SET LOCK MODE TO WAIT;
   UPDATE inarcl
     SET inarcl.com_mes=(com_mes+stot),
         inarcl.com_acu=(com_acu+stot),
         inarcl.cos_mes=(cos_mes+cosvta),
         inarcl.cos_acu=(cos_acu+cosvta),
         inarcl.can_com=(can_com+stot),
         inarcl.sal_act=(sal_act+tot)
     WHERE inarcl.num_emp=emp
       AND inarcl.cod_cli=cli;
  SET LOCK MODE TO NOT WAIT;

-- ACTUALIZA SALDO FACTURA
  SET LOCK MODE TO WAIT;
   UPDATE inartrcl
      SET inartrcl.sal_fac=inartrcl.sal_fac+tot,
          inartrcl.sal_iva=inartrcl.sal_iva+iva15
    WHERE inartrcl.num_emp   = emp
      AND inartrcl.num_suc   = suc
      AND inartrcl.tipo      = "FA"
      AND inartrcl.num_docto = fac
      AND inartrcl.cod_cli   = cli;
  SET LOCK MODE TO NOT WAIT;

-- BORRA TRANSACCIONES DEVOLUCIONES
  DELETE FROM inartrcl1
   WHERE inartrcl1.num_emp=emp
     AND inartrcl1.num_suc=suc
     AND inartrcl1.num_car=fac
     AND inartrcl1.tip_car="FA"
     AND inartrcl1.num_cre=dev
     AND inartrcl1.tip_cre="DV";

-- BORRA DEVOLUCION
  DELETE FROM inardev
        WHERE inardev.num_emp=emp
          AND inardev.num_suc=suc
          AND inardev.num_dev=dev;

-- BORRA CONTROL DE DOCUMENTOS
  DELETE FROM documento
   WHERE documento.num_emp=emp
     AND documento.num_suc=suc
     AND documento.tipo="DV"
     AND documento.numero=dev;

END IF;
COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_pago_cl (emp CHAR(2), suc CHAR(2),
   tipopago CHAR(2),
   numpago char(20), cli CHAR(8), imppago DECIMAL(14,4), iva15 DECIMAL(12,4),
   fech DATE, forpag CHAR(10), fecheq DATE, banco CHAR(20), numcheq INTEGER,
   tipcheq CHAR(2), efvo DECIMAL(14,4),bono DECIMAL(14,4),
   impcheq DECIMAL(14,4), dls DECIMAL(14,4),chepref DECIMAL(14,4),
   localofor CHAR(10));

-- VARIABLES CLIENTE
  DEFINE razsoc   LIKE inarcl.raz_soc;

-- LEE CLIENTE
  SELECT raz_soc
    INTO razsoc
    FROM inarcl
   WHERE inarcl.num_emp=emp
     AND inarcl.cod_cli=cli;

   INSERT INTO inarpcl VALUES (emp,suc,tipopago,numpago,cli,razsoc,imppago,
       iva15,fech,forpag,fecheq,banco,numcheq,tipcheq,efvo,bono,impcheq,
       dls,chepref,localofor);

   INSERT INTO documento VALUES(emp,suc,"PC",numpago,imppago,fech);

SET LOCK MODE TO WAIT;
   UPDATE inarcl
      SET inarcl.sal_act  = inarcl.sal_act-imppago,
          inarcl.fech_pag = fech,
          inarcl.imp_pag  = imppago
    WHERE inarcl.num_emp = emp
      AND inarcl.cod_cli = cli;
SET LOCK MODE TO NOT WAIT;

END PROCEDURE;

CREATE PROCEDURE "xxx".inserta_tr_pag_cl(emp CHAR(2),suc CHAR(2),
    tipfac CHAR(2),
    numfac CHAR(10),numpag char(20),tippag CHAR(2),cli CHAR(8),
    imp DECIMAL(14,4), iva15 DECIMAL(12,4), fech DATE, forpag CHAR(10));

   INSERT INTO inartrcl1 VALUES(emp,suc,tipfac,numfac,numpag,tippag,
                                cli,imp,iva15,fech,forpag);

SET LOCK MODE TO WAIT;
   UPDATE inartrcl
      SET inartrcl.sal_fac = inartrcl.sal_fac-imp,
          inartrcl.sal_iva = inartrcl.sal_iva-iva15
    WHERE inartrcl.num_emp   = emp
      AND inartrcl.num_suc   = suc
      AND inartrcl.tipo      = tipfac
      AND inartrcl.num_docto = numfac
      AND inartrcl.cod_cli   = cli;
SET LOCK MODE TO NOT WAIT;

END PROCEDURE;

CREATE PROCEDURE "xxx".act_kardexall(emp CHAR(2), fech_ini DATE,
                                     fech_fin DATE);

DEFINE art      LIKE inarinv.cod_art;
DEFINE exi_kgs  LIKE inarinv.exi_cor_kgs;
DEFINE exi_caj  LIKE inarinv.exi_cor_caj;
DEFINE entdivkg LIKE inarinv.exi_cor_kgs;
DEFINE entdivca LIKE inarinv.exi_cor_caj;
DEFINE saldivkg LIKE inarinv.exi_cor_kgs;
DEFINE saldivca LIKE inarinv.exi_cor_caj;
DEFINE pro_kgs  LIKE inarinv.cos_pro_kgs;
DEFINE pro_caj  LIKE inarinv.cos_pro_caj;
DEFINE canemp   LIKE inarinv.can_emp;
DEFINE tipart   LIKE inarinv.tip_art;
DEFINE val      LIKE inarinv.sal_val;
DEFINE prom     LIKE inventario.cos_pro;
DEFINE tkgs     LIKE inartrinv.can_kgs;
DEFINE tcaj     LIKE inartrinv.can_caj;
DEFINE kgs      LIKE inartrinv.can_kgs;
DEFINE caj      LIKE inartrinv.can_caj;
DEFINE uni_kgs  LIKE inartrinv.cos_uni_kgs;
DEFINE uni_caj  LIKE inartrinv.cos_uni_caj;
DEFINE tipdoc   LIKE inartrinv.tip_doc;
DEFINE numdoc   LIKE inartrinv.num_doc;
DEFINE fech     LIKE inartrinv.fech_doc;
DEFINE suc      LIKE inartrinv.num_suc;
DEFINE renglon  LIKE inartrinv.ren_art;
DEFINE enc      CHAR(1);

-- INICIALIZA TABLA TEMPORAL
DELETE FROM tmp_canemp;
DELETE FROM log_actkardex;

BEGIN WORK;
-- LEE CATALOGO DE ARTICULOS
FOREACH
  SELECT cod_art,tip_art
    INTO art,tipart
    FROM inarinv
   WHERE inarinv.num_emp=emp
   ORDER BY cod_art

  LET entdivkg = 0;
  LET entdivca = 0;
  LET saldivkg = 0;
  LET saldivca = 0;

  IF EXISTS(SELECT cod_art
              FROM inventario
             WHERE inventario.num_emp=emp
               AND inventario.fecha=fech_ini
               AND inventario.cod_art=art)
  THEN
     LET enc="S";
  ELSE
     LET enc="N";
  END IF;

-- SELECCIONA INVENTARIO INICIal del articulo
  IF enc = "S" THEN
     SELECT can_kgs, can_caj, can_emp, cos_pro
       INTO exi_kgs, exi_caj, canemp, prom
       FROM inventario
      WHERE inventario.num_emp=emp
        AND inventario.fecha=fech_ini
        AND inventario.cod_art=art;
  ELSE
      LET exi_kgs=0;
      LET exi_caj=0;
      LET canemp=0;
      LET prom=0;
  END IF;

  IF tipart="K" THEN
     LET pro_kgs = prom;
     LET val     = pro_kgs * exi_kgs;
     IF exi_caj <> 0 THEN
        LET pro_caj = val / exi_caj;
     ELSE
        LET pro_caj = 0;
     END IF;
  END IF;

  IF tipart="C" THEN
     LET pro_caj = prom;
     LET val     = pro_caj * exi_caj;
     IF exi_kgs <> 0 THEN
        LET pro_kgs = val / exi_kgs;
     ELSE
        LET pro_kgs = 0;
     END IF;
  END IF;

--BEGIN WORK;
-- SELECCIONA MOVIMIENTOS KARDEX
   FOREACH
     SELECT can_kgs,can_caj,cos_uni_kgs, cos_uni_caj,
            num_suc, tip_doc, fech_doc, num_doc, ren_art
       INTO kgs,caj,uni_kgs, uni_caj,
            suc, tipdoc, fech, numdoc, renglon
       FROM inartrinv
      WHERE inartrinv.num_emp=emp
        AND inartrinv.cod_art=art
        AND inartrinv.fech_doc BETWEEN fech_ini AND fech_fin
      ORDER BY fech_doc, tip_doc, num_doc

-- SI SON COMPRAS
    IF tipdoc="AC" or tipdoc="CO" THEN

       IF tipart="K" THEN
          LET exi_kgs = exi_kgs + kgs;
          LET val     = val + (kgs * uni_kgs);
          LET exi_caj = exi_caj + caj;
       END IF;

       IF tipart="C" THEN
          LET exi_caj = exi_caj + caj;
          LET val     = val + (caj * uni_caj);
          LET exi_kgs = exi_kgs + kgs;
       END IF;

       IF exi_kgs <> 0 THEN
          LET pro_kgs = val / exi_kgs;
       ELSE
          LET pro_kgs = 0;
          INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
                      exi_caj,canemp,"CO  EXIST. EN KGS 0");
       END IF;
       IF exi_caj <> 0 THEN
          LET pro_caj = val / exi_caj;
          LET canemp  = (exi_kgs-entdivkg+saldivkg)/(exi_caj-entdivca+saldivca);
       ELSE
          LET pro_caj = 0;
          LET canemp  = 0;
          INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
                      exi_caj,canemp,"CO  EXIST. EN CAJ 0");
       END IF;

-- ACTUALIZA KARDEX
       UPDATE inartrinv
          SET inartrinv.cos_pro_kgs=pro_kgs,
              inartrinv.cos_pro_caj=pro_caj
        WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
          AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
          AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
          AND inartrinv.ren_art=renglon;

        UPDATE inarinv
           SET inarinv.ult_cos_kgs = uni_kgs,
               inarinv.ult_cos_caj = uni_caj,
               inarinv.cos_pro_kgs = pro_kgs,
               inarinv.cos_pro_caj = pro_caj,
               inarinv.can_emp     = canemp
         WHERE inarinv.num_emp=emp
           AND inarinv.cod_art=art;

    END IF;

-- SI SON DEVOLUCIONES COMPRAS
    IF tipdoc="DC" THEN

       IF tipart="K" THEN
          LET exi_kgs = exi_kgs - kgs;
          LET val     = val - (kgs * uni_kgs);
          LET exi_caj = exi_caj - caj;
       END IF;

       IF tipart="C" THEN
          LET exi_caj = exi_caj - caj;
          LET val     = val - (caj * uni_caj);
          LET exi_kgs = exi_kgs - kgs;
       END IF;

--     IF exi_kgs <> 0 THEN
--        LET pro_kgs = val / exi_kgs;
--     ELSE
--        LET pro_kgs = 0;
--        INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
--                    exi_caj,canemp,"DC  EXIST. EN KGS 0");
--     END IF;
--     IF exi_caj <> 0 THEN
--       LET pro_caj = val / exi_caj;
--          LET canemp  = exi_kgs / exi_caj;
--     ELSE
--        LET pro_caj = 0;
--        LET canemp  = 0;
--        INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
--                    exi_caj,canemp,"DC  EXIST. EN CAJ 0");
--     END IF;
-- ACTUALIZA KARDEX
       UPDATE inartrinv
          SET inartrinv.cos_pro_kgs=pro_kgs,
              inartrinv.cos_pro_caj=pro_caj
        WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
          AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
          AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
          AND inartrinv.ren_art=renglon;

        UPDATE inarinv
           SET inarinv.cos_pro_kgs = pro_kgs,
               inarinv.cos_pro_caj = pro_caj
         WHERE inarinv.num_emp=emp
           AND inarinv.cod_art=art;
    END IF;


-- SI SON ENTRADAS DIVERSAS
    IF tipdoc="ED" THEN
--     IF canemp = 0 THEN
--        INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
--                    exi_caj,canemp,"(ED) CAN_EMP EN 0   ");
--     END IF;
       IF tipart="K" THEN
          LET exi_kgs = exi_kgs + kgs;
          LET val     = val + (kgs * pro_kgs);
--        IF canemp <> 0 THEN
--           LET caj     = kgs / canemp;
--        ELSE
--           LET caj     = 0;
--        END IF;
          LET exi_caj = exi_caj + caj;
       END IF;
       IF tipart="C" THEN
          LET exi_caj = exi_caj + caj;
          LET val     = val + (caj * pro_caj);
--        LET kgs     = caj * canemp;
          LET exi_kgs = exi_kgs + kgs;
       END IF;
-- SUMA ENTRADAS DIV. PARA RESTAR EN CALCULO DE CAN_EMP LUPITA 4 MARZO 2008
  LET entdivkg = entdivkg + kgs;
  LET entdivca = entdivca + caj;

-- ACTUALIZA KARDEX
       UPDATE inartrinv
          SET inartrinv.cos_pro_kgs=pro_kgs,
              inartrinv.cos_pro_caj=pro_caj,
              inartrinv.can_kgs=kgs,
              inartrinv.can_caj=caj
        WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
          AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
          AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
          AND inartrinv.ren_art=renglon;
    END IF;

-- SI SON SALIDAS DIVERSAS
    IF tipdoc="SD" OR tipdoc="DO" THEN
--     IF canemp = 0 THEN
--        INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
--                    exi_caj,canemp,"(SD) CAN_EMP EN 0   ");
--     END IF;
       IF tipart="K" THEN
          LET exi_kgs = exi_kgs - kgs;
          LET val     = val - (kgs * pro_kgs);
--        IF canemp <> 0 THEN
--           LET caj     = kgs / canemp;
--        ELSE
--           LET caj     = 0;
--        END IF;
          LET exi_caj = exi_caj - caj;
       END IF;
       IF tipart="C" THEN
          LET exi_caj = exi_caj - caj;
          LET val     = val - (caj * pro_caj);
--        LET kgs     = caj * canemp;
          LET exi_kgs = exi_kgs - kgs;
       END IF;

-- SUMA SALIDAS DIV. PARA RESTAR EN CALCULO DE CAN_EMP LUPITA 4 MARZO 2008
  LET saldivkg = saldivkg + kgs;
  LET saldivca = saldivca + caj;

-- ACTUALIZA KARDEX
       UPDATE inartrinv
          SET inartrinv.cos_pro_kgs=pro_kgs,
              inartrinv.cos_pro_caj=pro_caj,
              inartrinv.can_kgs=kgs,
              inartrinv.can_caj=caj
        WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
          AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
          AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
          AND inartrinv.ren_art=renglon;
    END IF;


-- SI SON DEVOLUCIONES SOBRE VENTAS DE SUPERS SOLO KGS
    IF tipdoc="DF" THEN
       IF canemp = 0 THEN
          INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
                      exi_caj,canemp,"(DF) CAN_EMP EN 0   ");
       END IF;
        LET exi_kgs = exi_kgs + kgs;
        LET val     = val + (kgs * pro_kgs);
        LET caj     = 0;

-- ACTUALIZA KARDEX SOLO KGS
       UPDATE inartrinv
          SET inartrinv.cos_pro_kgs=pro_kgs,
              inartrinv.cos_pro_caj=pro_caj,
              inartrinv.can_kgs=kgs,
              inartrinv.can_caj=0
        WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
          AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
          AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
          AND inartrinv.ren_art=renglon;
    END IF;


-- SI SON DEVOLUCIONES SOBRE VENTAS
    IF tipdoc="DV" THEN
       IF canemp = 0 THEN
          INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
                      exi_caj,canemp,"(DV) CAN_EMP EN 0   ");
       END IF;
       IF tipart="K" THEN
          LET exi_kgs = exi_kgs + kgs;
          LET val     = val + (kgs * pro_kgs);
          IF canemp <> 0 THEN
             LET caj     = kgs / canemp;
          ELSE
             LET caj     = 0;
          END IF;
          LET exi_caj = exi_caj + caj;
       END IF;
       IF tipart="C" THEN
          LET exi_caj = exi_caj + caj;
          LET val     = val + (caj * pro_caj);
          LET kgs     = caj * canemp;
          LET exi_kgs = exi_kgs + kgs;
       END IF;

-- ACTUALIZA KARDEX
       UPDATE inartrinv
          SET inartrinv.cos_pro_kgs=pro_kgs,
              inartrinv.cos_pro_caj=pro_caj,
              inartrinv.can_kgs=kgs,
              inartrinv.can_caj=caj
        WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
          AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
          AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
          AND inartrinv.ren_art=renglon;
    END IF;

-- SI SON VENTAS
    IF tipdoc="FA" or tipdoc="TI" THEN
       SELECT kilos, cajas
         INTO tkgs, tcaj
         FROM tmp_kardex
        WHERE tmp_kardex.factura  = numdoc
          AND tmp_kardex.tipo_doc = tipdoc
          AND tmp_kardex.codigo   = art
          AND tmp_kardex.ren      = renglon;

       IF canemp = 0 THEN
          INSERT INTO log_actkardex VALUES(emp,fech,numdoc,tipdoc,art,exi_kgs,
                      exi_caj,canemp,"VTA  CAN_EMP EN 0   ");
       END IF;

       IF (tkgs > 0)  AND (tcaj > 0) THEN
          LET caj     = tcaj;
          LET kgs     = tkgs;
       END IF;
       IF (tkgs > 0)  AND (tcaj = 0) THEN
          IF canemp <> 0 THEN
             LET caj     = tkgs / canemp;
          ELSE
             LET caj     = 0;
          END IF;
       END IF;
       IF (tkgs = 0) AND (tcaj > 0) THEN
          LET kgs     = tcaj * canemp;
       END IF;
       IF tipart="K" THEN
          LET exi_kgs = exi_kgs - kgs;
          LET val     = val - (kgs * pro_kgs);
          LET exi_caj = exi_caj - caj;
       END IF;
       IF tipart="C" THEN
          LET exi_caj = exi_caj - caj;
          LET val     = val - (caj * pro_caj);
          LET exi_kgs = exi_kgs - kgs;
       END IF;

-- ACTUALIZA KARDEX
       UPDATE inartrinv
          SET inartrinv.cos_pro_kgs=pro_kgs,
              inartrinv.cos_pro_caj=pro_caj,
              inartrinv.can_kgs=kgs,
              inartrinv.can_caj=caj
        WHERE inartrinv.num_emp=emp     AND inartrinv.cod_art=art
          AND inartrinv.fech_doc=fech   AND inartrinv.tip_doc=tipdoc
          AND inartrinv.num_doc=numdoc  AND inartrinv.num_suc=suc
          AND inartrinv.ren_art=renglon;
    END IF;

INSERT INTO tmp_canemp VALUES(fech,art,tipdoc,numdoc,kgs,caj,canemp,renglon,
       pro_kgs,pro_caj,exi_kgs,exi_caj,val);

   END FOREACH;
-- COMMIT WORK;

 UPDATE inarinv
    SET inarinv.exi_cor_kgs=exi_kgs,
        inarinv.exi_cor_caj=exi_caj,
        inarinv.can_emp=canemp,
        inarinv.sal_val=val,
        inarinv.cos_pro_kgs=pro_kgs,
        inarinv.cos_pro_caj=pro_caj
  WHERE inarinv.num_emp=emp
    AND inarinv.cod_art=art;

END FOREACH;
 COMMIT WORK;
END PROCEDURE;

CREATE PROCEDURE "xxx".cancela_pago_cl (emp CHAR(2), suc CHAR(2),
   tipopago CHAR(2), numpago char(20), cli CHAR(8));

-- VARIABLES PAGO
DEFINE imppago  LIKE inarpcl.imp_pago;
DEFINE ivapago  LIKE inarpcl.iva_pago;
DEFINE fech     LIKE inarpcl.fecha;
DEFINE imp      LIKE inartrcl1.importe;
DEFINE iva15    LIKE inartrcl1.iva;
DEFINE tipfac   LIKE inartrcl1.tip_car;
DEFINE numfac   LIKE inartrcl1.num_car;

BEGIN WORK;
  IF EXISTS(SELECT numero
              FROM documento
             WHERE documento.num_emp = emp
               AND documento.num_suc = suc
               AND documento.tipo    = "PC"
               AND documento.numero  = numpago)
   THEN
     FOREACH
      SELECT num_car, tip_car, importe, iva
        INTO numfac, tipfac, imp, iva15
        FROM inartrcl1
       WHERE inartrcl1.num_emp = emp
         AND inartrcl1.num_suc = suc
         AND inartrcl1.tip_cre = tipopago
         AND inartrcl1.num_cre = numpago
         AND inartrcl1.cod_cli = cli

       SET LOCK MODE TO WAIT;
          UPDATE inartrcl
             SET inartrcl.sal_fac = inartrcl.sal_fac+imp,
                 inartrcl.sal_iva = inartrcl.sal_iva+iva15
           WHERE inartrcl.num_emp   = emp
             AND inartrcl.num_suc   = suc
             AND inartrcl.tipo      = tipfac
             AND inartrcl.num_docto = numfac
             AND inartrcl.cod_cli   = cli;
       SET LOCK MODE TO NOT WAIT;

      DELETE FROM inartrcl1
       WHERE inartrcl1.num_emp = emp
         AND inartrcl1.num_suc = suc
         AND inartrcl1.tip_cre = tipopago
         AND inartrcl1.num_cre = numpago
         AND inartrcl1.cod_cli = cli
         AND inartrcl1.tip_car = tipfac
         AND inartrcl1.num_car = numfac;
     END FOREACH;

     SELECT imp_pago, iva_pago
       INTO imppago, ivapago
       FROM inarpcl
      WHERE inarpcl.num_emp = emp
        AND inarpcl.num_suc = suc
        AND inarpcl.tipo_pago = tipopago
        AND inarpcl.num_pago  = numpago
        AND inarpcl.cod_cli   = cli;

     DELETE FROM inarpcl
      WHERE inarpcl.num_emp = emp
        AND inarpcl.num_suc = suc
        AND inarpcl.tipo_pago = tipopago
        AND inarpcl.num_pago  = numpago
        AND inarpcl.cod_cli   = cli;

     DELETE FROM documento
       WHERE documento.num_emp = emp
         AND documento.num_suc = suc
         AND documento.tipo    = "PC"
         AND documento.numero  = numpago;

     SET LOCK MODE TO WAIT;
        UPDATE inarcl
           SET inarcl.sal_act  = inarcl.sal_act+imppago
         WHERE inarcl.num_emp = emp
           AND inarcl.cod_cli = cli;
     SET LOCK MODE TO NOT WAIT;
END IF;
COMMIT WORK;

END PROCEDURE;

CREATE PROCEDURE "informix".inserta_corte_caja(fol integer, fac char(10), nomcli char(50),
               caj char(12), efvo decimal(14,2), bon decimal(14,2),
               che decimal(14,2), dll decimal(14,2), tot decimal(14,2),
               tippag char(10), tipfac char(10), fec date, emp char(2),
               suc char(2), cli char(6), impiva decimal(12,2));

 INSERT INTO corte_caja VALUES(fol, fac, nomcli, caj, efvo, bon, che, dll, tot,
                               tippag, tipfac, fec, emp, suc, cli, impiva);

END PROCEDURE;

CREATE PROCEDURE "informix".valida_precios(fech date, numped char(10), numfac char(10),
  nomusuario char(50), codart char(14), desart char(50), tipodeprecio char(2),
  precio decimal(10,2), tipodoc char(1));

-- VARIABLES DE USO
  DEFINE lp_fecha   LIKE historicolistpre.fecha;
  DEFINE lp_codart  LIKE historicolistpre.cod_art;
  DEFINE lp_desart  LIKE historicolistpre.des_art;
  DEFINE lp_menudeo LIKE historicolistpre.menudeo;
  DEFINE lp_mayoreo LIKE historicolistpre.mayoreo;
  DEFINE precio_ref  DECIMAL(10,2);

-- BUSCA PRECIOS DE REFERENCIA Y VALIDA PRECIOS
  IF EXISTS(SELECT cod_art
       FROM historicolistpre
      WHERE historicolistpre.fecha=fech
        AND historicolistpre.cod_art=codart
        AND historicolistpre.des_art=desart)
  THEN
     SELECT fecha,cod_art,des_art,menudeo,mayoreo
       INTO lp_fecha,lp_codart,lp_desart,lp_menudeo,lp_mayoreo
       FROM historicolistpre
      WHERE historicolistpre.fecha=fech
        AND historicolistpre.cod_art=codart
        AND historicolistpre.des_art=desart;
-- COMPARA PRECIOS Y VALIDA TIPO DE DOCTO S=SURTIDO F=FACTURADO
      IF tipodeprecio="ME" THEN
         LET precio_ref=lp_menudeo;
      ELSE
         LET precio_ref=lp_mayoreo;
      END IF
      IF precio < precio_ref THEN
         INSERT INTO log_validaprecios
           VALUES(fech, numped, numfac, nomusuario, codart, desart,
                  tipodeprecio, precio, precio_ref, tipodoc);
      END IF;
  ELSE
   -- NO ENCONTRO PRODUCTO EN LISTA DE PRECIOS
      LET tipodeprecio="XX";
      LET precio_ref=0;
      INSERT INTO log_validaprecios
        VALUES(fech, numped, numfac, nomusuario, codart, desart,
               tipodeprecio, precio, precio_ref, tipodoc);
-- NO ENCONTRO PRECIOS DE REFERENCIA
  END IF;
END PROCEDURE;

CREATE PROCEDURE "informix".inserta_menudeo(fech date, codart char(14),
  desart char(50), pmenudeo decimal(10,2));

-- VARIABLES DE USO
  DEFINE lp_fecha   LIKE historicolistpre.fecha;
  DEFINE lp_codart  LIKE historicolistpre.cod_art;
  DEFINE lp_desart  LIKE historicolistpre.des_art;
  DEFINE lp_menudeo LIKE historicolistpre.menudeo;
  DEFINE lp_mayoreo LIKE historicolistpre.mayoreo;

-- IDENTIFICA CAMBIO DE PRECIOS EN EL MISMO DIA
  LET lp_mayoreo=0;
  IF EXISTS(SELECT cod_art
       FROM historicolistpre
      WHERE historicolistpre.fecha=fech
        AND historicolistpre.cod_art=codart
        AND historicolistpre.des_art=desart)
  THEN
     SELECT fecha,cod_art,des_art,menudeo,mayoreo
       INTO lp_fecha,lp_codart,lp_desart,lp_menudeo,lp_mayoreo
       FROM historicolistpre
      WHERE historicolistpre.fecha=fech
        AND historicolistpre.cod_art=codart
        AND historicolistpre.des_art=desart;
     IF lp_menudeo <> pmenudeo THEN
        INSERT INTO log_cambioprecios
               VALUES(lp_fecha, lp_codart, lp_desart, lp_menudeo, lp_mayoreo);
        UPDATE historicolistpre
           SET historicolistpre.menudeo=pmenudeo
         WHERE historicolistpre.fecha=fech
           AND historicolistpre.cod_art=codart
           AND historicolistpre.des_art=desart;
     END IF;
  ELSE
     INSERT INTO historicolistpre VALUES(fech,codart,desart,pmenudeo,
         lp_mayoreo);
  END IF;
END PROCEDURE;

CREATE PROCEDURE "informix".inserta_mayoreo(fech date, codart char(14),
  desart char(50), pmayoreo decimal(10,2));

-- VARIABLES DE USO
  DEFINE lp_fecha   LIKE historicolistpre.fecha;
  DEFINE lp_codart  LIKE historicolistpre.cod_art;
  DEFINE lp_desart  LIKE historicolistpre.des_art;
  DEFINE lp_menudeo LIKE historicolistpre.menudeo;
  DEFINE lp_mayoreo LIKE historicolistpre.mayoreo;

-- IDENTIFICA CAMBIO DE PRECIOS EN EL MISMO DIA
  LET lp_menudeo=0;
  IF EXISTS(SELECT cod_art
       FROM historicolistpre
      WHERE historicolistpre.fecha=fech
        AND historicolistpre.cod_art=codart
        AND historicolistpre.des_art=desart)
  THEN
     SELECT fecha,cod_art,des_art,menudeo,mayoreo
       INTO lp_fecha,lp_codart,lp_desart,lp_menudeo,lp_mayoreo
       FROM historicolistpre
      WHERE historicolistpre.fecha=fech
        AND historicolistpre.cod_art=codart
        AND historicolistpre.des_art=desart;
     IF lp_mayoreo <> pmayoreo THEN
        INSERT INTO log_cambioprecios
               VALUES(lp_fecha, lp_codart, lp_desart, lp_menudeo, lp_mayoreo);
        UPDATE historicolistpre
           SET historicolistpre.mayoreo=pmayoreo
         WHERE historicolistpre.fecha=fech
           AND historicolistpre.cod_art=codart
           AND historicolistpre.des_art=desart;
     END IF;
  ELSE
     INSERT INTO historicolistpre VALUES(fech,codart,desart,
       lp_menudeo,pmayoreo);
  END IF;
END PROCEDURE;

CREATE PROCEDURE "informix".depura_tabla_ventas(vtas_numemp INTEGER);

DEFINE vtas_folio    LIKE ventas.folio;

-- LEE VENTAS
FOREACH
  SELECT folio
    INTO vtas_folio
    FROM ventas
   WHERE ventas.num_emp=vtas_numemp
   ORDER BY folio


  IF NOT EXISTS(SELECT folio
                  FROM corte_caja
                 WHERE corte_caja.num_emp=vtas_numemp
                   AND corte_caja.folio=vtas_folio)
  THEN
     IF NOT EXISTS(SELECT num_emp
                    FROM log_depurafol
                   WHERE log_depurafol.num_emp=vtas_numemp
                     AND log_depurafol.folio=vtas_folio)
     THEN
        INSERT INTO log_depurafol VALUES(vtas_numemp,vtas_folio);
     END IF;
  END IF;

END FOREACH;
END PROCEDURE;

CREATE PROCEDURE "informix".depura_tabla_vtas(vtas_numemp INTEGER);

DEFINE vtas_folio    LIKE ventas.folio;

-- LEE FOLIOS
FOREACH
  SELECT folio
    INTO vtas_folio
    FROM log_depurafol
   WHERE log_depurafol.num_emp=vtas_numemp
   ORDER BY folio

  DELETE FROM ventas
        WHERE ventas.num_emp=vtas_numemp
          AND ventas.folio=vtas_folio;

END FOREACH;
END PROCEDURE;

CREATE PROCEDURE "informix".inserta_tmpventas(vtas_numemp INTEGER, fech_ini date, 
                                     fech_fin date);

DEFINE vtas_folio integer;
DEFINE vtas_fecha date;
DEFINE tmp_folio integer;
DEFINE tmp_descripcion char(50);
DEFINE tmp_codigo char(14);
DEFINE tmp_cajas decimal(10,4);
DEFINE tmp_kilos decimal(10,4);
DEFINE tmp_precio decimal(12,4);
DEFINE tmp_total decimal(12,4);
DEFINE tmp_nombre char(50);
DEFINE tmp_iva decimal(12,4);
DEFINE tmp_cos_pro decimal(12,4);
DEFINE tmp_totiva decimal(12,4);
DEFINE tmp_renglon smallint;
DEFINE tmp_pagado smallint;
DEFINE tmp_rfc char(20);
DEFINE tmp_tipo char(2);
DEFINE tmp_lineaven char(20);
DEFINE tmp_descto decimal(10,4);
DEFINE tmp_pedido char(20);
DEFINE tmp_observacion char(20);
DEFINE tmp_sucursal char(20);
DEFINE tmp_num_emp char(2);
DEFINE tmp_fecha   date;


-- LEE CORTE DE CAJA
FOREACH
  SELECT folio,fecha
    INTO vtas_folio,vtas_fecha
    FROM corte_caja
   WHERE corte_caja.num_emp=vtas_numemp
     AND corte_caja.fecha BETWEEN fech_ini AND fech_fin

-- LEE VENTAS DE FOLIOS DE CORTE DE CAJA PARA PASAR A NUEVA TABLA TMP_VENTAS
  LET tmp_fecha=vtas_fecha;
  FOREACH
    SELECT folio, descripcion, codigo, cajas, kilos, precio,
           total, nombre, iva, cos_pro, totiva, renglon,
           pagado, rfc, tipo, lineaven, descto, pedido,
           observacion, sucursal, num_emp
     INTO
       tmp_folio, tmp_descripcion, tmp_codigo, tmp_cajas, tmp_kilos, tmp_precio,
       tmp_total, tmp_nombre, tmp_iva, tmp_cos_pro, tmp_totiva, tmp_renglon,
       tmp_pagado, tmp_rfc, tmp_tipo, tmp_lineaven, tmp_descto, tmp_pedido,
       tmp_observacion, tmp_sucursal, tmp_num_emp
      FROM ventas
     WHERE ventas.num_emp=vtas_numemp
       AND ventas.folio=vtas_folio
-- INSERTA EN TABLA TMP VENTAS
     INSERT INTO tmp_ventas 
     VALUES(tmp_folio, tmp_descripcion, tmp_codigo, tmp_cajas,tmp_kilos,
            tmp_precio, tmp_total, tmp_nombre, tmp_iva, tmp_cos_pro,
            tmp_totiva, tmp_renglon, tmp_pagado, tmp_rfc, tmp_tipo,
            tmp_lineaven, tmp_descto, tmp_pedido, tmp_observacion, 
            tmp_sucursal, tmp_num_emp, tmp_fecha);
  END FOREACH;
END FOREACH;
END PROCEDURE;

CREATE PROCEDURE "informix".inserta_listaprecios(fech date, codart char(14),
  desart char(50), pmenudeo decimal(10,2), pmayoreo decimal(10,2));

-- VARIABLES DE USO
  DEFINE lp_fecha   LIKE historicolistpre.fecha;
  DEFINE lp_codart  LIKE historicolistpre.cod_art;
  DEFINE lp_desart  LIKE historicolistpre.des_art;
  DEFINE lp_menudeo LIKE historicolistpre.menudeo;
  DEFINE lp_mayoreo LIKE historicolistpre.mayoreo;
  DEFINE banmenudeo LIKE listaprecios.ban_men;
  DEFINE banmayoreo LIKE listaprecios.ban_may;

-- ACTUALIZA PRECIOS EN LISTA DE PRECIOS
  LET banmenudeo=" ";
  LET banmayoreo=" ";
  IF EXISTS(SELECT cod_art,des_art
       FROM listaprecios
      WHERE listaprecios.cod_art=codart
        AND listaprecios.des_art=desart)
  THEN
     SELECT fecha,cod_art,des_art,menudeo,mayoreo
       INTO lp_fecha,lp_codart,lp_desart,lp_menudeo,lp_mayoreo
       FROM listaprecios
      WHERE listaprecios.cod_art=codart
        AND listaprecios.des_art=desart;

-- VALIDA SI HAY INCREMENTO DE PRECIOS
     IF pmenudeo > lp_menudeo THEN
        LET banmenudeo="U";
     END IF;
     IF pmayoreo > lp_mayoreo THEN
        LET banmayoreo="U";
     END IF;

     UPDATE listaprecios
        SET listaprecios.fecha=fech,
            listaprecios.menudeo=pmenudeo,
            listaprecios.mayoreo=pmayoreo,
            listaprecios.ban_men=banmenudeo,
            listaprecios.ban_may=banmayoreo
      WHERE listaprecios.cod_art=codart
        AND listaprecios.des_art=desart;
  ELSE
     INSERT INTO listaprecios VALUES(fech,codart,desart,pmenudeo,pmayoreo,
                 banmenudeo,banmayoreo);
  END IF;

-- IDENTIFICA CAMBIO DE PRECIOS EN EL MISMO DIA
  IF EXISTS(SELECT fecha,cod_art,des_art,menudeo,mayoreo
       FROM historicolistpre
      WHERE historicolistpre.fecha=fech
        AND historicolistpre.cod_art=codart
        AND historicolistpre.des_art=desart)
  THEN
     SELECT fecha,cod_art,des_art,menudeo,mayoreo
       INTO lp_fecha,lp_codart,lp_desart,lp_menudeo,lp_mayoreo
       FROM historicolistpre
      WHERE historicolistpre.fecha=fech
        AND historicolistpre.cod_art=codart
        AND historicolistpre.des_art=desart;
     IF lp_menudeo <> pmenudeo OR lp_mayoreo <> pmayoreo THEN
        INSERT INTO log_cambioprecios
               VALUES(lp_fecha, lp_codart, lp_desart, lp_menudeo, lp_mayoreo);
        UPDATE historicolistpre
           SET historicolistpre.menudeo=pmenudeo,
               historicolistpre.mayoreo=pmayoreo
         WHERE historicolistpre.fecha=fech
           AND historicolistpre.cod_art=codart
           AND historicolistpre.des_art=desart;
     END IF;
  ELSE
     INSERT INTO historicolistpre VALUES(fech,codart,desart,pmenudeo,pmayoreo);
  END IF;
END PROCEDURE;


 

 

 

grant  execute on function "xxx".saldo_cli (char,char,smallint) to "public" as "xxx";
grant  execute on procedure "xxx".act_folio_pedido (char,integer,integer) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_com (char,char,char,char,date,decimal,decimal,decimal,decimal,decimal,decimal,decimal,char,char,date) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_tr_com (char,char,char,char,date,decimal,decimal,decimal,decimal,char,decimal,decimal,smallint) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_tr_pag_pro (char,char,char,char,integer,char,char,decimal,decimal,date,char) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_pago_pro (char,char,char,integer,char,decimal,decimal,date,char,char,integer,decimal,decimal,char) to "public" as "xxx";
grant  execute on procedure "xxx".cancela_com (char,char,char) to "public" as "xxx";
grant  execute on procedure "xxx".mod_trinv (char,char,char,char,char,char) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_cot1 (char,char,integer,char,date,char,char,decimal,decimal,decimal,decimal,decimal,decimal,decimal,decimal,smallint,decimal,smallint) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_cot (char,char,integer,char,char,char,char,char,char,smallint,decimal,decimal,decimal,date,decimal,decimal) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_ticket (char,char,integer,date,smallint,integer,char,char,decimal,decimal,decimal,decimal,integer,date,char) to "public" as "xxx";
grant  execute on procedure "xxx".cancela_ticket (char,char,integer,char) to "public" as "xxx";
grant  execute on procedure "xxx".cancela_factinv (char,char,char,char) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_factick (char,char,date,char,char,char) to "public" as "xxx";
grant  execute on procedure "xxx".act_ordencom (char,char,date,integer,date,char,char) to "public" as "xxx";
grant  execute on procedure "xxx".cancela_ped (char,char,char) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_ped (char,char,char,char,date,decimal,decimal,decimal,decimal,decimal,decimal,decimal) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_tr_ped (char,char,char,integer,date,decimal,decimal,decimal,decimal,char,decimal,decimal,smallint) to "public" as "xxx";
grant  execute on procedure "xxx".mod_trinvcom (char,char,char,char,char,char) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_entdiv (char,char,integer,date,decimal,char) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_saldiv (char,char,integer,date,decimal,char) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_tr_entdiv (char,char,char,integer,date,decimal,decimal,decimal,decimal,smallint) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_tr_saldiv (char,char,char,integer,date,decimal,decimal,decimal,decimal,smallint) to "public" as "xxx";
grant  execute on procedure "xxx".cancela_consolidado (char,char,integer) to "public" as "xxx";
grant  execute on procedure "xxx".loc_kardexneg (char,date,date) to "public" as "xxx";
grant  execute on procedure "xxx".act_ctofactik (char,date,date) to "public" as "xxx";
grant  execute on procedure "xxx".act_costovta (char,char,date,date) to "public" as "xxx";
grant  execute on procedure "xxx".aut_entdiv (char,date) to "public" as "xxx";
grant  execute on procedure "xxx".aut_saldiv (char,date) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_factinv (char,char,integer,date,smallint,char,char,char,char) to "public" as "xxx";
grant  execute on procedure "xxx".act_salxcli (char,date,date,char) to "public" as "xxx";
grant  execute on procedure "xxx".loc_pag (char,date,date) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_ventas (integer,char,char,decimal,decimal,decimal,decimal,char,decimal,decimal,decimal,smallint,smallint,char,char,char,decimal,char,char,char,char) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_devcom (char,char,integer,date,char,integer,decimal,decimal,decimal,decimal,decimal,decimal,char,char) to "public" as "xxx";
grant  execute on procedure "xxx".cancela_devcom (char,char,integer) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_tr_devcom (char,char,char,date,integer,char,decimal,decimal,decimal,decimal,decimal,decimal,decimal,decimal,smallint,decimal) to "public" as "xxx";
grant  execute on procedure "xxx".act_saldospro (char,date,date) to "public" as "xxx";
grant  execute on procedure "xxx".act_kardex (char,date,date,char) to "public" as "xxx";
grant  execute on procedure "xxx".cancela_pago_pro (char,char,char,integer,char) to "public" as "xxx";
grant  execute on procedure "xxx".act_saldoscli (char,date,date) to "public" as "xxx";
grant  execute on procedure "xxx".gen_poliza (char,date,char,integer,char) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_dev (char,char,char,date,char,char,decimal,decimal,decimal,decimal,decimal,decimal,char,char,char) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_tr_dev (char,char,char,date,char,char,decimal,decimal,decimal,decimal,decimal,decimal,decimal,decimal,smallint,decimal,char) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_tr_devsup (char,char,char,date,char,char,decimal,decimal,decimal,decimal,decimal,decimal,decimal,decimal,smallint,decimal,char,char) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_devsup (char,char,char,date,char,char,decimal,decimal,decimal,decimal,decimal,decimal,char,char,char) to "public" as "xxx";
grant  execute on procedure "xxx".cancela_dev (char,char,char) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_pago_cl (char,char,char,char,char,decimal,decimal,date,char,date,char,integer,char,decimal,decimal,decimal,decimal,decimal,char) to "public" as "xxx";
grant  execute on procedure "xxx".inserta_tr_pag_cl (char,char,char,char,char,char,char,decimal,decimal,date,char) to "public" as "xxx";
grant  execute on procedure "xxx".act_kardexall (char,date,date) to "public" as "xxx";
grant  execute on procedure "xxx".cancela_pago_cl (char,char,char,char,char) to "public" as "xxx";
grant  execute on procedure "informix".inserta_corte_caja (integer,char,char,char,decimal,decimal,decimal,decimal,decimal,char,char,date,char,char,char,decimal) to "public" as "informix";
grant  execute on procedure "informix".valida_precios (date,char,char,char,char,char,char,decimal,char) to "public" as "informix";
grant  execute on procedure "informix".inserta_menudeo (date,char,char,decimal) to "public" as "informix";
grant  execute on procedure "informix".inserta_mayoreo (date,char,char,decimal) to "public" as "informix";
grant  execute on procedure "informix".depura_tabla_ventas (integer) to "public" as "informix";
grant  execute on procedure "informix".depura_tabla_vtas (integer) to "public" as "informix";
grant  execute on procedure "informix".inserta_tmpventas (integer,date,date) to "public" as "informix";
grant  execute on procedure "informix".inserta_listaprecios (date,char,char,decimal,decimal) to "public" as "informix";

revoke usage on language SPL from public ;

grant usage on language SPL to public ;





create unique index "informix".a_inarinv on "informix".inarinv 
    (num_emp,cod_art) using btree ;
create unique index "xxx".b_inarinv on "informix".inarinv 
    (num_emp,cod_art1) using btree ;
create unique index "xxx".c_inarinv on "informix".inarinv 
    (num_emp,lin_ven,cod_pro,cod_art) using btree ;
create unique index "xxx".d_inarinv on "informix".inarinv 
    (num_emp,cod_pro,lin_ven,cod_art) using btree ;
create unique index "informix".a_inarprov on "informix".inarprov 
    (num_emp,cod_pro) using btree ;
create unique index "informix".a_inarcl on "informix".inarcl (num_emp,
    cod_cli) using btree ;
create unique index "xxx".a_inarent on "informix".inarent 
    (num_emp,num_suc,num_ent) using btree ;
create unique index "xxx".b_inarent on "informix".inarent 
    (num_emp,cod_pro,num_ent,num_suc) using btree ;
create unique index "xxx".a_inartrpr on "informix".inartrpr 
    (num_emp,cod_pro,num_ent,tip_ent,num_suc) using btree ;
create unique index "xxx".b_inartrpr on "informix".inartrpr 
    (num_emp,num_suc,num_ent,tip_ent) using btree ;
create index "xxx".c_inartrpr on "informix".inartrpr (num_emp,
    num_suc,fecha,sal_ent) using btree ;
create unique index "informix".va_inarcot1 on "informix".inarcot1 
    (num_emp,cod_art,fech_doc,tip_doc,num_doc,num_suc,ren_art) 
    using btree ;
create unique index "informix".vb_inarcot1 on "informix".inarcot1 
    (num_emp,num_suc,tip_doc,num_doc,cod_art,ren_art) using btree 
    ;
create index "informix".vc_inarcot1 on "informix".inarcot1 (num_emp,
    fech_doc,tip_doc) using btree ;
create index "informix".vd_inarcot1 on "informix".inarcot1 (cod_cli,
    tip_doc,fech_doc,num_doc,cod_art) using btree ;
create unique index "informix".va_inarcot on "informix".inarcot 
    (num_emp,num_suc,num_ped,cod_ag) using btree ;
create index "informix".a_ventas on "informix".ventas (num_emp,
    folio) using btree ;
create index "informix".b_ventas on "informix".ventas (num_emp,
    folio,codigo) using btree ;
create unique index "informix".a_inartrcl on "informix".inartrcl 
    (num_emp,cod_cli,num_suc,num_docto,tipo) using btree ;
create unique index "informix".b_inartrcl on "informix".inartrcl 
    (num_emp,num_suc,num_docto,tipo) using btree ;
create unique index "informix".c_inartrcl on "informix".inartrcl 
    (num_emp,fecha,num_docto,tipo) using btree ;
create unique index "informix".va_inarpvt on "informix".inarpvt 
    (num_emp,num_suc,num_doc) using btree ;
create unique index "informix".vb_inarpvt on "informix".inarpvt 
    (num_emp,cod_cli,num_doc,num_suc) using btree ;
create unique index "informix".vc_inarpvt on "informix".inarpvt 
    (num_emp,num_suc,fecha,num_doc) using btree ;
create index "xxx".a_corte_caja on "informix".corte_caja (num_emp,
    factura) using btree ;
create index "informix".b_corte_caja on "informix".corte_caja 
    (num_emp,fecha) using btree ;
create index "informix".c_corte_caja on "informix".corte_caja 
    (num_emp,fecha,folio) using btree ;
create unique index "informix".a_inartrcl1 on "informix".inartrcl1 
    (num_emp,num_suc,num_car,tip_car,num_cre,tip_cre) using btree 
    ;
create index "informix".b_inarpcl on "informix".inarpcl (num_emp,
    num_suc,tipo_pago,fecha,forma_pago,tip_cheq,num_cheq) using 
    btree ;
create index "informix".c_inarpcl on "informix".inarpcl (num_emp,
    num_suc,num_cheq) using btree ;
create index "informix".b_inarppr on "informix".inarppr (num_emp,
    num_suc,tipo_pago,fecha,forma_pago,num_cheq) using btree 
    ;
create index "informix".c_inarppr on "informix".inarppr (num_emp,
    num_suc,num_cheq) using btree ;
create unique index "informix".a_inartrpr1 on "informix".inartrpr1 
    (num_emp,num_suc,num_ent,tip_ent,num_pag,tip_pag) using btree 
    ;
create unique index "xxx".a_inardev on "informix".inardev 
    (num_emp,num_suc,num_dev) using btree ;
create unique index "xxx".b_inardev on "informix".inardev 
    (num_emp,cod_cli,num_dev,num_suc) using btree ;
create unique index "xxx".c_inardev on "informix".inardev 
    (num_emp,num_suc,fecha,num_dev) using btree ;
create unique index "informix".va_inarfac on "informix".inarfac 
    (num_emp,num_suc,num_doc) using btree ;
create unique index "informix".vb_inarfac on "informix".inarfac 
    (num_emp,cod_cli,num_doc,num_suc) using btree ;
create unique index "informix".vc_inarfac on "informix".inarfac 
    (num_emp,num_suc,fecha,num_doc) using btree ;
create unique index "xxx".a_tmpkardex on "informix".tmp_kardex 
    (factura,tipo_doc,codigo,ren) using btree ;
create unique index "xxx".a_inventario on "informix".inventario 
    (num_emp,num_suc,cod_art,fecha) using btree ;
create unique index "xxx".a_tmptrcl on "informix".tmptrcl 
    (num_emp,fecha,num_docto,tipo) using btree ;
create index "informix".inventario1a_inventario on "informix".inv_diario 
    (cod_art) using btree ;
create index "informix".inventario1b_inventario on "informix".inv_diario 
    (cod_art,fecha) using btree ;
create index "informix".inv_diario1inventario1a_inventario on 
    "informix".inv_mensual (cod_art) using btree ;
create index "informix".inv_diario1inventario1b_inventario on 
    "informix".inv_mensual (cod_art,fecha) using btree ;
create index "informix".inarpcl1b_inarpcl on "informix".inarpch_dev 
    (num_emp,num_suc,tipo_pago,fecha,forma_pago,tip_cheq,num_cheq) 
    using btree ;
create index "informix".inarpcl1c_inarpcl on "informix".inarpch_dev 
    (num_emp,num_suc,num_cheq) using btree ;
create unique index "informix".optimo_index1 on "informix".optimo 
    (codigo) using btree ;
create index "xxx".respa_docu on "informix".respa_docu (num_emp,
    num_suc,tipo,numero,fecha) using btree ;
create index "informix".va_documento on "informix".documento (num_emp,
    num_suc,tipo,numero,fecha) using btree ;
create unique index "informix".va_inartrinv on "informix".inartrinv 
    (num_emp,cod_art,fech_doc,tip_doc,num_doc,num_suc,ren_art) 
    using btree ;
create unique index "informix".vb_inartrinv on "informix".inartrinv 
    (num_emp,num_suc,tip_doc,num_doc,cod_art,ren_art) using btree 
    ;
create index "informix".vc_inartrinv on "informix".inartrinv (num_emp,
    fech_doc,tip_doc) using btree ;
create index "informix".vd_inartrinv on "informix".inartrinv (cod_cli,
    tip_doc,fech_doc,num_doc,cod_art) using btree ;
create index "informix".a_tmpventas on "informix".tmp_ventas (num_emp,
    folio) using btree ;
create index "informix".b_tmpventas on "informix".tmp_ventas (num_emp,
    folio,codigo) using btree ;
create index "informix".c_tmpventas on "informix".tmp_ventas (fecha,
    num_emp,folio,codigo) using btree ;
create index "informix".a_hist_ventas on "informix".hist_ventas 
    (num_emp,folio) using btree ;
create index "informix".b_hist_ventas on "informix".hist_ventas 
    (num_emp,folio,codigo) using btree ;
create index "informix".a_hist_corte_caja on "informix".hist_corte_caja 
    (num_emp,factura) using btree ;
create index "informix".b_hist_corte_caja on "informix".hist_corte_caja 
    (num_emp,fecha) using btree ;
create index "informix".c_hist_corte_caja on "informix".hist_corte_caja 
    (num_emp,fecha,folio) using btree ;

create trigger "xxx".log_bor_com delete on "informix".inarent 
    referencing old as pre
    for each row
        (
        insert into "xxx".log_borrado (usuario,horario,num_fac,
    imp_fac,tip_doc)  values (USER ,TODAY ,pre.num_ent ,pre.imp_exe ,
    'ENTRADA' ));

create trigger "xxx".log_bor_tik delete on "informix".inarpvt 
    referencing old as pre
    for each row
        (
        insert into "xxx".log_borrado (usuario,horario,num_fac,
    imp_fac,tip_doc)  values (USER ,TODAY ,pre.num_doc ,pre.imp_exe ,
    'TICKET' ));

create trigger "xxx".log_bor_pcl delete on "informix".inartrcl1 
    referencing old as pre
    for each row
        (
        insert into "xxx".log_borrado (usuario,horario,num_fac,
    imp_fac,tip_doc)  values (USER ,TODAY ,pre.num_cre ,pre.importe ,
    pre.tip_cre ));

create trigger "xxx".log_bor_ppr delete on "informix".inartrpr1 
    referencing old as pre
    for each row
        (
        insert into "xxx".log_borrado (usuario,horario,num_fac,
    imp_fac,tip_doc)  values (USER ,TODAY ,pre.num_pag ,pre.importe ,
    pre.tip_pag ));

create trigger "xxx".log_bor_dev delete on "informix".inardev 
    referencing old as pre
    for each row
        (
        insert into "xxx".log_borrado (usuario,horario,num_fac,
    imp_fac,tip_doc)  values (USER ,TODAY ,pre.num_dev ,pre.imp_exe ,
    'DEVOLUC' ));

create trigger "xxx".log_bor_fac delete on "informix".inarfac 
    referencing old as pre
    for each row
        (
        insert into "xxx".log_borrado (usuario,horario,num_fac,
    imp_fac,tip_doc)  values (USER ,TODAY ,pre.num_doc ,pre.imp_exe ,
    'FACTURA' ));

create trigger "xxx".log_bor_div delete on "xxx".inardiverso 
    referencing old as pre
    for each row
        (
        insert into "xxx".log_borrado (usuario,horario,num_fac,
    imp_fac,tip_doc)  values (USER ,TODAY ,pre.num_doc ,pre.imp_exe ,
    pre.tip_doc ));

create trigger "xxx".log_bor_chdev delete on "xxx".inarch_dev 
    referencing old as pre
    for each row
        (
        insert into "xxx".log_borrado (usuario,horario,num_fac,
    imp_fac,tip_doc)  values (USER ,TODAY ,pre.num_doc ,pre.imp_exe ,
    pre.tip_doc ));



