unit JUNTA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  printers, Dialogs, DB, DBTables, jpeg, ExtCtrls, ComCtrls, DBCtrls, StdCtrls,PERSONAL,
  Buttons, Grids, DBGrids, StrUtils, RpDefine, RpRave, RpBase,
  RpSystem, RpCon, RpConDS, RpRender, RpRenderPDF, ShellAPI, dateutils,
  IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP,
  IdBaseComponent, IdMessage, MENSAJE, mensaje2, mensaje3, mensaje4, math,
  UFormPresentacion;     // se agrego UFormPresentacion

type
  TForm9 = class(TForm)
    Panel2: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    efectivo: TMemo;
    transf: TMemo;
    cheque: TMemo;
    dolar: TMemo;
    nocheque: TMemo;
    dbbanco: TDBLookupComboBox;
    banfecha: TDateTimePicker;
    Panel3: TPanel;
    Label13: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    BitBtn3: TBitBtn;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    DataSource43: TDataSource;
    QSACA: TQuery;
    DataSource42: TDataSource;
    sacadup2: TQuery;
    sacadup: TQuery;
    DataSource27: TDataSource;
    QTIPO: TQuery;
    DataSource3: TDataSource;
    qnumemp: TQuery;
    qnumempnum_emp: TStringField;
    DataSource2: TDataSource;
    DataSource23: TDataSource;
    conse: TQuery;
    DataSource19: TDataSource;
    qcodigoart: TQuery;
    DataSource22: TDataSource;
    Panel4: TPanel;
    s: TDBGrid;
    TVENTAS: TTable;
    TVENTASfolio: TIntegerField;
    TVENTASdescripcion: TStringField;
    TVENTAScodigo: TStringField;
    TVENTAScajas: TFloatField;
    TVENTASkilos: TFloatField;
    TVENTASprecio: TFloatField;
    TVENTAStotal: TFloatField;
    TVENTASnombre: TStringField;
    TVENTASiva: TFloatField;
    TVENTAScos_pro: TFloatField;
    TVENTAStotiva: TFloatField;
    TVENTASrenglon: TSmallintField;
    TVENTASpagado: TSmallintField;
    TVENTASrfc: TStringField;
    TVENTAStipo: TStringField;
    TVENTASlineaven: TStringField;
    TVENTASdescto: TFloatField;
    TVENTASpedido: TStringField;
    TVENTASobservacion: TStringField;
    TVENTASsucursal: TStringField;
    TVENTASnum_emp: TStringField;
    DataSource1: TDataSource;
    inserta_ventas: TStoredProc;
    DataSource4: TDataSource;
    qventas: TQuery;
    DataSource5: TDataSource;
    QBORRA: TQuery;
    qcodigo: TQuery;
    DataSource6: TDataSource;
    DataSource20: TDataSource;
    Actufolio: TQuery;
    Label16: TLabel;
    totart: TMemo;
    tbanco: TTable;
    DataSource8: TDataSource;
    tconfig: TTable;
    cheqpref: TMemo;
    StoredProc2: TStoredProc;
    sal_cli: TQuery;
    sal_clinum_emp: TStringField;
    sal_clicod_cli: TStringField;
    sal_cliraz_soc: TStringField;
    sal_clidom_cli: TStringField;
    sal_cliciu_cli: TStringField;
    sal_cliest_cli: TStringField;
    sal_clitel_cli: TStringField;
    sal_clirfc_cli: TStringField;
    sal_clicod_pos: TIntegerField;
    sal_cliage_cli: TSmallintField;
    sal_clicon_cli: TStringField;
    sal_clipla_cli: TSmallintField;
    sal_clista_cli: TStringField;
    sal_clilim_cre: TFloatField;
    sal_clisal_act: TFloatField;
    sal_clisal_ant: TFloatField;
    sal_clicom_mes: TFloatField;
    sal_clicos_mes: TFloatField;
    sal_clicom_acu: TFloatField;
    sal_clicos_acu: TFloatField;
    sal_clifech_com: TDateField;
    sal_clican_com: TFloatField;
    sal_clifech_pag: TDateField;
    sal_cliimp_pag: TFloatField;
    sal_clicurp: TStringField;
    sal_cliapodo: TStringField;
    DataSource9: TDataSource;
    DataSource40: TDataSource;
    QBUSBOR: TQuery;
    sinsertacot: TStoredProc;
    DataSource11: TDataSource;
    Sinsertacot1: TStoredProc;
    DataSource10: TDataSource;
    DataSource18: TDataSource;
    qcanemp: TQuery;
    qcanempnum_emp: TStringField;
    qcanempcod_art: TStringField;
    qcanempcod_art1: TStringField;
    qcanempdes_art: TStringField;
    qcanempuni_art: TStringField;
    qcanempemp_art: TStringField;
    qcanempcan_emp: TFloatField;
    qcanempprecio_1: TFloatField;
    qcanempprecio_2: TFloatField;
    qcanempprecio_3: TFloatField;
    qcanempprecio_4: TFloatField;
    qcanempprecio_5: TFloatField;
    qcanempsal_val: TFloatField;
    qcanempsal_ant: TFloatField;
    qcanempult_cos_kgs: TFloatField;
    qcanempcos_pro_kgs: TFloatField;
    qcanempcos_ant_kgs: TFloatField;
    qcanempven_mes_kgs: TFloatField;
    qcanempcos_mes_kgs: TFloatField;
    qcanempven_acu_kgs: TFloatField;
    qcanempcos_acu_kgs: TFloatField;
    qcanempexi_cor_kgs: TFloatField;
    qcanempexi_ant_kgs: TFloatField;
    qcanempexi_fis_kgs: TFloatField;
    qcanempcan_acu_kgs: TFloatField;
    qcanempcan_mes_kgs: TFloatField;
    qcanempult_cos_caj: TFloatField;
    qcanempcos_pro_caj: TFloatField;
    qcanempcos_ant_caj: TFloatField;
    qcanempven_mes_caj: TFloatField;
    qcanempcos_mes_caj: TFloatField;
    qcanempven_acu_caj: TFloatField;
    qcanempcos_acu_caj: TFloatField;
    qcanempexi_cor_caj: TFloatField;
    qcanempexi_ant_caj: TFloatField;
    qcanempexi_fis_caj: TFloatField;
    qcanempcan_acu_caj: TFloatField;
    qcanempcan_mes_caj: TFloatField;
    qcanempback_cli: TFloatField;
    qcanempback_pro: TFloatField;
    qcanempmin_emp: TFloatField;
    qcanempmax_emp: TFloatField;
    qcanempiva: TFloatField;
    qcanemplin_ven: TSmallintField;
    qcanempcod_pro: TStringField;
    qcanemptip_art: TStringField;
    qcanempedo_pro: TStringField;
    qcanempban_rep: TStringField;
    qcanempmin_pre: TFloatField;
    qcanempmax_pre: TFloatField;
    DataSource12: TDataSource;
    StoredProc1: TStoredProc;
    StoredProc3: TStoredProc;
    DataSource13: TDataSource;
    tconse: TQuery;
    DataSource17: TDataSource;
    Corte_caja: TTable;
    sacafac: TQuery;
    DataSource25: TDataSource;
    DataSource26: TDataSource;
    agregafac: TQuery;
    QPPAL: TQuery;
    DataSource14: TDataSource;
    DataSource15: TDataSource;
    tdescto: TTable;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label15: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label6: TLabel;
    Label17: TLabel;
    Label33: TLabel;
    Tfolio: TEdit;
    Tdire: TEdit;
    trfc: TEdit;
    tipo_fac: TRadioGroup;
    Tipo_pago: TRadioGroup;
    nombre: TDBLookupComboBox;
    csucursal: TDBLookupComboBox;
    FECHAVIENTOS: TDateTimePicker;
    CODIGOART: TDBLookupComboBox;
    DESCRIPART: TEdit;
    tipoconsulta: TRadioGroup;
    NUM_EMPRESA: TDBLookupComboBox;
    CODIGOCLI: TDBLookupComboBox;
    BitBtn5: TBitBtn;
    nombre_cli: TEdit;
    PRE_PRO: TEdit;
    CAJ_PRO: TEdit;
    KIL_PRO: TEdit;
    OBSERVA: TEdit;
    alias: TEdit;
    name: TEdit;
    code: TEdit;
    BitBtn2: TBitBtn;
    Button1: TButton;
    qborraf: TQuery;
    DataSource7: TDataSource;
    qcambiarfc: TQuery;
    DataSource16: TDataSource;
    QACTCOT: TQuery;
    DataSource21: TDataSource;
    Panel5: TPanel;
    Label35: TLabel;
    Label31: TLabel;
    Label34: TLabel;
    Label32: TLabel;
    edit9: TMemo;
    edit10: TMemo;
    Memo4: TMemo;
    edit1: TMemo;
    Label30: TLabel;
    Edit2: TEdit;
    FACTU: TEdit;
    DataSource24: TDataSource;
    qcotiza: TQuery;
    qcotizanum_emp: TStringField;
    qcotizacod_cli: TStringField;
    qcotizacod_art: TStringField;
    qcotizades_art: TStringField;
    qcotizaprecio: TFloatField;
    qcotizafecha_ini: TDateField;
    qcotizafecha_fin: TDateField;
    BitBtn7: TBitBtn;
    qdupli: TQuery;
    DataSource28: TDataSource;
    qduplicount: TFloatField;
    qsucur: TQuery;
    QBUSCACO: TQuery;
    DataSource29: TDataSource;
    Label36: TLabel;
    tot_debe: TEdit;
    QDEBEFAC: TQuery;
    DataSource30: TDataSource;
    thora: TTable;
    DataSource31: TDataSource;
    BUS_ART: TQuery;
    DataSource32: TDataSource;
    ACTUFAC: TQuery;
    DataSource33: TDataSource;
    qsacafael: TQuery;
    DataSource34: TDataSource;
    qactfae: TQuery;
    DataSource35: TDataSource;
    qfolio: TQuery;
    DataSource36: TDataSource;
    qfolioserie: TStringField;
    qfoliofolio_final: TIntegerField;
    qfolioano_aproba: TIntegerField;
    qfolionum_aproba: TIntegerField;
    qfoliocajera: TStringField;
    qfoliofolio_inicio: TIntegerField;
    qdeta: TQuery;
    qdetanum_emp: TStringField;
    qdetacod_cli: TStringField;
    qdetacalle: TStringField;
    qdetanum_int: TStringField;
    qdetanum_ext: TStringField;
    qdetacolonia: TStringField;
    qdetaemail: TStringField;
    qdetamunicipio: TStringField;
    qdetapais: TStringField;
    DataSource37: TDataSource;
    Corte_cajafolio: TIntegerField;
    Corte_cajafactura: TStringField;
    Corte_cajanombre: TStringField;
    Corte_cajacaja: TStringField;
    Corte_cajaefectivo: TFloatField;
    Corte_cajabonos: TFloatField;
    Corte_cajacheque: TFloatField;
    Corte_cajadolar: TFloatField;
    Corte_cajatotal: TFloatField;
    Corte_cajatipo_pago: TStringField;
    Corte_cajatipo_fac: TStringField;
    Corte_cajafecha: TDateField;
    Corte_cajanum_emp: TStringField;
    Corte_cajanum_suc: TStringField;
    Corte_cajacod_cli: TStringField;
    Corte_cajaiva: TFloatField;
    DataSource38: TDataSource;
    qupdatefac: TQuery;
    DataSource39: TDataSource;
    QBUS99: TQuery;
    QBUS99cod_cli: TStringField;
    copiascli: TQuery;
    DataSource41: TDataSource;
    copiasclicod_cli: TStringField;
    DataSource44: TDataSource;
    QEMPRESA: TQuery;
    RvProject1: TRvProject;
    RvDataSetConnection1: TRvDataSetConnection;
    RvSystem1: TRvSystem;
    RvRenderPDF1: TRvRenderPDF;
    QEMPRESAraz_soc: TStringField;
    QEMPRESAciu_cli: TStringField;
    QEMPRESAest_cli: TStringField;
    QEMPRESAcod_pos: TIntegerField;
    QEMPRESArfc_cli: TStringField;
    QEMPRESAmunicipio: TStringField;
    QEMPRESApais: TStringField;
    QEMPRESAcolonia: TStringField;
    QEMPRESAcalle: TStringField;
    QEMPRESAnum_ext: TStringField;
    QEMPRESAnum_int: TStringField;
    RvDataSetConnection2: TRvDataSetConnection;
    temp_ventas: TTable;
    DataSource45: TDataSource;
    temp_ventasCodigo: TStringField;
    temp_ventasCantidad: TFloatField;
    temp_ventasDescripcion: TStringField;
    temp_ventasPre_uni: TFloatField;
    temp_ventasImporte: TFloatField;
    QBORRAR: TQuery;
    DataSource46: TDataSource;
    Label37: TLabel;
    orden_compra: TEdit;
    qnvoserie: TQuery;
    DataSource47: TDataSource;
    qnvoserieserie: TStringField;
    qnvoseriefolio_final: TIntegerField;
    qnvoserieano_aproba: TIntegerField;
    qnvoserienum_aproba: TIntegerField;
    qnvoseriecajera: TStringField;
    qnvoseriefolio_inicio: TIntegerField;
    qupdafol: TQuery;
    DataSource48: TDataSource;
    qinarcot: TQuery;
    qinarcot1: TQuery;
    DataSource49: TDataSource;
    DataSource50: TDataSource;
    qinarcotnum_emp: TStringField;
    qinarcotnum_suc: TStringField;
    qinarcotnum_doc: TIntegerField;
    qinarcotcod_cli: TStringField;
    qinarcotraz_soc: TStringField;
    qinarcotdom_cli: TStringField;
    qinarcotciu_cli: TStringField;
    qinarcotest_cli: TStringField;
    qinarcotrfc_cli: TStringField;
    qinarcotemb_nom: TStringField;
    qinarcotemb_dom: TStringField;
    qinarcotemb_pob: TStringField;
    qinarcotnum_ped: TIntegerField;
    qinarcotfech_ped: TDateField;
    qinarcotnum_ord: TIntegerField;
    qinarcotfech_emb: TDateField;
    qinarcotcon_cli: TStringField;
    qinarcotcod_ag: TSmallintField;
    qinarcotimp_exe: TFloatField;
    qinarcotimp_6: TFloatField;
    qinarcotimp_15: TFloatField;
    qinarcotimp_20: TFloatField;
    qinarcotdes_exe: TFloatField;
    qinarcotdes_6: TFloatField;
    qinarcotdes_15: TFloatField;
    qinarcotdes_20: TFloatField;
    qinarcotiva_6: TFloatField;
    qinarcotiva_15: TFloatField;
    qinarcotiva_20: TFloatField;
    qinarcotcos_vta: TFloatField;
    qinarcotflete: TFloatField;
    qinarcotiva_fle: TFloatField;
    qinarcotcar_1: TFloatField;
    qinarcotiva_1: TFloatField;
    qinarcotcar_2: TFloatField;
    qinarcotiva_2: TFloatField;
    qinarcotestado: TStringField;
    tinarfac: TTable;
    tinartrinv: TTable;
    tdocumento: TTable;
    tinartrcl: TTable;
    DataSource51: TDataSource;
    DataSource52: TDataSource;
    DataSource53: TDataSource;
    DataSource54: TDataSource;
    tinarfacnum_emp: TStringField;
    tinarfacnum_suc: TStringField;
    tinarfacnum_doc: TStringField;
    tinarfaccod_cli: TStringField;
    tinarfacraz_soc: TStringField;
    tinarfacdom_cli: TStringField;
    tinarfacciu_cli: TStringField;
    tinarfacest_cli: TStringField;
    tinarfacemb_nom: TStringField;
    tinarfacemb_dom: TStringField;
    tinarfacemb_pob: TStringField;
    tinarfacnum_ped: TIntegerField;
    tinarfacfech_ped: TDateField;
    tinarfacnum_ord: TIntegerField;
    tinarfacfech_emb: TDateField;
    tinarfaccon_cli: TStringField;
    tinarfacag_fac: TSmallintField;
    tinarfacimp_exe: TFloatField;
    tinarfacimp_6: TFloatField;
    tinarfacimp_15: TFloatField;
    tinarfacimp_20: TFloatField;
    tinarfacdes_exe: TFloatField;
    tinarfacdes_6: TFloatField;
    tinarfacdes_15: TFloatField;
    tinarfacdes_20: TFloatField;
    tinarfaciva_6: TFloatField;
    tinarfaciva_15: TFloatField;
    tinarfaciva_20: TFloatField;
    tinarfaccos_vta: TFloatField;
    tinarfacflete: TFloatField;
    tinarfaciva_fle: TFloatField;
    tinarfaccar_1: TFloatField;
    tinarfaciva_1: TFloatField;
    tinarfaccar_2: TFloatField;
    tinarfaciva_2: TFloatField;
    tinarfacfecha: TDateField;
    tinarfacreg_fed: TStringField;
    tinarfactip_fac: TStringField;
    tinarfaccajera: TStringField;
    qinarcot1num_emp: TStringField;
    qinarcot1cod_art: TStringField;
    qinarcot1num_suc: TStringField;
    qinarcot1fech_doc: TDateField;
    qinarcot1tip_doc: TStringField;
    qinarcot1num_doc: TIntegerField;
    qinarcot1can_kgs: TFloatField;
    qinarcot1can_caj: TFloatField;
    qinarcot1cos_pro_kgs: TFloatField;
    qinarcot1cos_pro_caj: TFloatField;
    qinarcot1pre_vta_kgs: TFloatField;
    qinarcot1pre_vta_caj: TFloatField;
    qinarcot1des_vta: TFloatField;
    qinarcot1fle_art: TFloatField;
    qinarcot1ren_art: TSmallintField;
    qinarcot1cod_cli: TStringField;
    qinarcot1iva_art: TFloatField;
    qinarcot1cod_ag: TSmallintField;
    tinartrinvnum_emp: TStringField;
    tinartrinvcod_art: TStringField;
    tinartrinvnum_suc: TStringField;
    tinartrinvfech_doc: TDateField;
    tinartrinvtip_doc: TStringField;
    tinartrinvnum_doc: TStringField;
    tinartrinvcan_kgs: TFloatField;
    tinartrinvcan_caj: TFloatField;
    tinartrinvcos_uni_kgs: TFloatField;
    tinartrinvcos_uni_caj: TFloatField;
    tinartrinvcos_pro_kgs: TFloatField;
    tinartrinvcos_pro_caj: TFloatField;
    tinartrinvpre_vta_kgs: TFloatField;
    tinartrinvpre_vta_caj: TFloatField;
    tinartrinvdes_vta: TFloatField;
    tinartrinvfle_art: TFloatField;
    tinartrinvren_art: TSmallintField;
    tinartrinvcod_pro: TStringField;
    tinartrinvcod_cli: TStringField;
    tinartrinvnum_ent: TIntegerField;
    tinartrinvfech_ent: TDateField;
    tinartrinviva_art: TFloatField;
    QSACADIAS: TQuery;
    DataSource55: TDataSource;
    QSACADIASnum_emp: TStringField;
    QSACADIASnum_suc: TStringField;
    QSACADIAScod_cli: TStringField;
    QSACADIAStipo: TStringField;
    QSACADIASnum_docto: TStringField;
    QSACADIASimporte: TFloatField;
    QSACADIASsal_fac: TFloatField;
    QSACADIASsal_iva: TFloatField;
    QSACADIASfecha: TDateField;
    Panel6: TPanel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    btnSendMail: TBitBtn;
    StatusMemo: TMemo;
    DBLookupComboBox2: TDBLookupComboBox;
    co_cli: TEdit;
    Query1: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    IntegerField1: TIntegerField;
    SmallintField1: TSmallintField;
    StringField9: TStringField;
    SmallintField2: TSmallintField;
    StringField10: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    DateField1: TDateField;
    FloatField8: TFloatField;
    DateField2: TDateField;
    FloatField9: TFloatField;
    StringField11: TStringField;
    StringField12: TStringField;
    DataSource56: TDataSource;
    Database1: TDatabase;
    MailMessage: TIdMessage;
    SMTP: TIdSMTP;
    AttachmentDialog: TOpenDialog;
    ARCHIVOS: TTable;
    DataSource57: TDataSource;
    config: TTable;
    confighost: TStringField;
    configcorreo: TStringField;
    configpuerto: TIntegerField;
    DataSource58: TDataSource;
    Query2: TQuery;
    StringField13: TStringField;
    DataSource59: TDataSource;
    qcorreo: TQuery;
    qcorreonum_emp: TStringField;
    qcorreocod_cli: TStringField;
    qcorreocalle: TStringField;
    qcorreonum_int: TStringField;
    qcorreonum_ext: TStringField;
    qcorreocolonia: TStringField;
    qcorreoemail: TStringField;
    qcorreomunicipio: TStringField;
    qcorreopais: TStringField;
    DataSource60: TDataSource;
    qarchivos: TQuery;
    qarchivosNOMBRE: TStringField;
    DataSource61: TDataSource;
    Query3: TQuery;
    DataSource62: TDataSource;
    sat: TQuery;
    DataSource63: TDataSource;
    satcer: TStringField;
    satkey: TStringField;
    satpass: TStringField;
    qtipo_pago: TQuery;
    DataSource64: TDataSource;
    qtipo_pagocod_cli: TStringField;
    qtipo_pagotipo_pago: TStringField;
    qtipo_pagobanco: TStringField;
    qbustipo: TQuery;
    DataSource65: TDataSource;
    qbustipocod_cli: TStringField;
    qbustipotipo_pago: TStringField;
    qbustipobanco: TStringField;
    qbustiponum_cta: TStringField;
    qtipo_pagonum_cta: TStringField;
    tmp_pago: TTable;
    DataSource66: TDataSource;
    tmp_pagonum_doc: TStringField;
    tmp_pagocod_cli: TStringField;
    tmp_pagototal_pago: TFloatField;
    tmp_pagoiva: TFloatField;
    tmp_pagofecha: TDateField;
    tmp_pagoformapago: TStringField;
    tmp_pagobanco: TStringField;
    tmp_pagono_cheque: TFloatField;
    tmp_pagotipo_cheque: TStringField;
    tmp_pagoefectivo: TFloatField;
    tmp_pagobonos: TFloatField;
    tmp_pagocheque: TFloatField;
    tmp_pagodolar: TFloatField;
    tmp_pagocheq_pref: TFloatField;
    tmp_pagotipo_cli: TStringField;
    tmp_pagocajera: TStringField;
    tmp_pagobandera: TIntegerField;
    qsacainfo: TQuery;
    DataSource67: TDataSource;
    qsacainfonum_emp: TStringField;
    qsacainfocod_art: TStringField;
    qsacainfonum_suc: TStringField;
    qsacainfofech_doc: TDateField;
    qsacainfotip_doc: TStringField;
    qsacainfonum_doc: TStringField;
    qsacainfocan_kgs: TFloatField;
    qsacainfocan_caj: TFloatField;
    qsacainfocos_uni_kgs: TFloatField;
    qsacainfocos_uni_caj: TFloatField;
    qsacainfocos_pro_kgs: TFloatField;
    qsacainfocos_pro_caj: TFloatField;
    qsacainfopre_vta_kgs: TFloatField;
    qsacainfopre_vta_caj: TFloatField;
    qsacainfodes_vta: TFloatField;
    qsacainfofle_art: TFloatField;
    qsacainforen_art: TSmallintField;
    qsacainfocod_pro: TStringField;
    qsacainfocod_cli: TStringField;
    qsacainfonum_ent: TIntegerField;
    qsacainfofech_ent: TDateField;
    qsacainfoiva_art: TFloatField;
    qsacainfonum_emp_1: TStringField;
    qsacainfonum_suc_1: TStringField;
    qsacainfonum_doc_1: TStringField;
    qsacainfocod_cli_1: TStringField;
    qsacainforaz_soc: TStringField;
    qsacainfodom_cli: TStringField;
    qsacainfociu_cli: TStringField;
    qsacainfoest_cli: TStringField;
    qsacainfoemb_nom: TStringField;
    qsacainfoemb_dom: TStringField;
    qsacainfoemb_pob: TStringField;
    qsacainfonum_ped: TIntegerField;
    qsacainfofech_ped: TDateField;
    qsacainfonum_ord: TIntegerField;
    qsacainfofech_emb: TDateField;
    qsacainfocon_cli: TStringField;
    qsacainfoag_fac: TSmallintField;
    qsacainfoimp_exe: TFloatField;
    qsacainfoimp_6: TFloatField;
    qsacainfoimp_15: TFloatField;
    qsacainfoimp_20: TFloatField;
    qsacainfodes_exe: TFloatField;
    qsacainfodes_6: TFloatField;
    qsacainfodes_15: TFloatField;
    qsacainfodes_20: TFloatField;
    qsacainfoiva_6: TFloatField;
    qsacainfoiva_15: TFloatField;
    qsacainfoiva_20: TFloatField;
    qsacainfocos_vta: TFloatField;
    qsacainfoflete: TFloatField;
    qsacainfoiva_fle: TFloatField;
    qsacainfocar_1: TFloatField;
    qsacainfoiva_1: TFloatField;
    qsacainfocar_2: TFloatField;
    qsacainfoiva_2: TFloatField;
    qsacainfofecha: TDateField;
    qsacainforeg_fed: TStringField;
    qsacainfotip_fac: TStringField;
    qsacainfocajera: TStringField;
    qartibus: TQuery;
    DataSource68: TDataSource;
    RvSystem2: TRvSystem;
    RvDataSetConnection3: TRvDataSetConnection;
    RvProject2: TRvProject;
    DataSource69: TDataSource;
    qtotkil: TQuery;
    qtotkilsum: TFloatField;
    qtotkilsum_1: TFloatField;
    qartibusnum_emp: TStringField;
    qartibuscod_art: TStringField;
    qartibusnum_suc: TStringField;
    qartibusfech_doc: TDateField;
    qartibustip_doc: TStringField;
    qartibusnum_doc: TStringField;
    qartibuscan_kgs: TFloatField;
    qartibuscan_caj: TFloatField;
    qartibuscos_uni_kgs: TFloatField;
    qartibuscos_uni_caj: TFloatField;
    qartibuscos_pro_kgs: TFloatField;
    qartibuscos_pro_caj: TFloatField;
    qartibuspre_vta_kgs: TFloatField;
    qartibuspre_vta_caj: TFloatField;
    qartibusdes_vta: TFloatField;
    qartibusfle_art: TFloatField;
    qartibusren_art: TSmallintField;
    qartibuscod_pro: TStringField;
    qartibuscod_cli: TStringField;
    qartibusnum_ent: TIntegerField;
    qartibusfech_ent: TDateField;
    qartibusiva_art: TFloatField;
    qartibustip_art: TStringField;
    qartibusdes_art: TStringField;
    Label41: TLabel;
    tdebito: TMemo;
    qsorinum: TQuery;
    DataSource70: TDataSource;
    qsorinumsoriana: TIntegerField;
    qsorinumcolesa: TStringField;
    temp: TTable;
    StringField14: TStringField;
    FloatField10: TFloatField;
    StringField15: TStringField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    DataSource71: TDataSource;
    temp_fact: TTable;
    DataSource72: TDataSource;
    temp_factbande: TIntegerField;
    temp_factfactura: TStringField;
    temp_factcajera: TStringField;
    qborra_tmpfa: TQuery;
    StringField16: TStringField;
    DataSource73: TDataSource;
    Label42: TLabel;
    IEPS: TMemo;
    Label43: TLabel;
    qcorreoemail2: TStringField;
    qcorreoemail3: TStringField;
    sinsertacot4: TStoredProc;
    DataSource74: TDataSource;
    qtotventas: TQuery;
    DataSource75: TDataSource;
    qventas1: TQuery;
    DataSource76: TDataSource;
    qventas1folio: TIntegerField;
    qventas1descripcion: TStringField;
    qventas1codigo: TStringField;
    qventas1cajas: TFloatField;
    qventas1kilos: TFloatField;
    qventas1precio: TFloatField;
    qventas1total: TFloatField;
    qventas1nombre: TStringField;
    qventas1iva: TFloatField;
    qventas1cos_pro: TFloatField;
    qventas1totiva: TFloatField;
    qventas1renglon: TSmallintField;
    qventas1pagado: TSmallintField;
    qventas1rfc: TStringField;
    qventas1tipo: TStringField;
    qventas1lineaven: TStringField;
    qventas1descto: TFloatField;
    qventas1pedido: TStringField;
    qventas1observacion: TStringField;
    qventas1sucursal: TStringField;
    qventas1num_emp: TStringField;
    qppal1: TQuery;
    DataSource77: TDataSource;
    qppal1folio: TIntegerField;
    qppal1descripcion: TStringField;
    qppal1codigo: TStringField;
    qppal1cajas: TFloatField;
    qppal1kilos: TFloatField;
    qppal1precio: TFloatField;
    qppal1total: TFloatField;
    qppal1nombre: TStringField;
    qppal1iva: TFloatField;
    qppal1cos_pro: TFloatField;
    qppal1totiva: TFloatField;
    qppal1renglon: TSmallintField;
    qppal1pagado: TSmallintField;
    qppal1rfc: TStringField;
    qppal1tipo: TStringField;
    qppal1lineaven: TStringField;
    qppal1descto: TFloatField;
    qppal1pedido: TStringField;
    qppal1observacion: TStringField;
    qppal1sucursal: TStringField;
    qppal1num_emp: TStringField;
    DataSource78: TDataSource;
    QVENTAS2: TQuery;
    IntegerField2: TIntegerField;
    StringField17: TStringField;
    StringField18: TStringField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    StringField19: TStringField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    SmallintField3: TSmallintField;
    SmallintField4: TSmallintField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    FloatField20: TFloatField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    DataSource79: TDataSource;
    qventas3: TQuery;
    IntegerField3: TIntegerField;
    StringField27: TStringField;
    StringField28: TStringField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    StringField29: TStringField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    SmallintField5: TSmallintField;
    SmallintField6: TSmallintField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    FloatField28: TFloatField;
    StringField33: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    StringField36: TStringField;
    DataSource80: TDataSource;
    QPPALPA: TQuery;
    IntegerField4: TIntegerField;
    StringField37: TStringField;
    StringField38: TStringField;
    FloatField29: TFloatField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    StringField39: TStringField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    FloatField35: TFloatField;
    SmallintField7: TSmallintField;
    SmallintField8: TSmallintField;
    StringField40: TStringField;
    StringField41: TStringField;
    StringField42: TStringField;
    FloatField36: TFloatField;
    StringField43: TStringField;
    StringField44: TStringField;
    StringField45: TStringField;
    StringField46: TStringField;
    conent: TQuery;
    DataSource81: TDataSource;
    consal: TQuery;
    DataSource82: TDataSource;
    StoredProc4: TStoredProc;
    DataSource83: TDataSource;
    StoredProc5: TStoredProc;
    DataSource84: TDataSource;
    conentnum_emp: TStringField;
    conentnum_ent: TIntegerField;
    consalnum_emp: TStringField;
    consalnum_sal: TIntegerField;
    qbuscod: TQuery;
    DataSource85: TDataSource;
    qbuscodnum_emp: TStringField;
    qbuscodcod_art: TStringField;
    qbuscodcod_art1: TStringField;
    qbuscoddes_art: TStringField;
    qbuscoduni_art: TStringField;
    qbuscodemp_art: TStringField;
    qbuscodcan_emp: TFloatField;
    qbuscodprecio_1: TFloatField;
    qbuscodprecio_2: TFloatField;
    qbuscodprecio_3: TFloatField;
    qbuscodprecio_4: TFloatField;
    qbuscodprecio_5: TFloatField;
    qbuscodsal_val: TFloatField;
    qbuscodsal_ant: TFloatField;
    qbuscodult_cos_kgs: TFloatField;
    qbuscodcos_pro_kgs: TFloatField;
    qbuscodcos_ant_kgs: TFloatField;
    qbuscodven_mes_kgs: TFloatField;
    qbuscodcos_mes_kgs: TFloatField;
    qbuscodven_acu_kgs: TFloatField;
    qbuscodcos_acu_kgs: TFloatField;
    qbuscodexi_cor_kgs: TFloatField;
    qbuscodexi_ant_kgs: TFloatField;
    qbuscodexi_fis_kgs: TFloatField;
    qbuscodcan_acu_kgs: TFloatField;
    qbuscodcan_mes_kgs: TFloatField;
    qbuscodult_cos_caj: TFloatField;
    qbuscodcos_pro_caj: TFloatField;
    qbuscodcos_ant_caj: TFloatField;
    qbuscodven_mes_caj: TFloatField;
    qbuscodcos_mes_caj: TFloatField;
    qbuscodven_acu_caj: TFloatField;
    qbuscodcos_acu_caj: TFloatField;
    qbuscodexi_cor_caj: TFloatField;
    qbuscodexi_ant_caj: TFloatField;
    qbuscodexi_fis_caj: TFloatField;
    qbuscodcan_acu_caj: TFloatField;
    qbuscodcan_mes_caj: TFloatField;
    qbuscodback_cli: TFloatField;
    qbuscodback_pro: TFloatField;
    qbuscodmin_emp: TFloatField;
    qbuscodmax_emp: TFloatField;
    qbuscodiva: TFloatField;
    qbuscodlin_ven: TSmallintField;
    qbuscodcod_pro: TStringField;
    qbuscodtip_art: TStringField;
    qbuscodedo_pro: TStringField;
    qbuscodban_rep: TStringField;
    qbuscodmin_pre: TFloatField;
    qbuscodmax_pre: TFloatField;
    qbuscodobserva: TStringField;
    QUPENT: TQuery;
    StringField47: TStringField;
    StringField48: TStringField;
    StringField49: TStringField;
    StringField50: TStringField;
    StringField51: TStringField;
    StringField52: TStringField;
    FloatField37: TFloatField;
    FloatField38: TFloatField;
    FloatField39: TFloatField;
    FloatField40: TFloatField;
    FloatField41: TFloatField;
    FloatField42: TFloatField;
    FloatField43: TFloatField;
    FloatField44: TFloatField;
    FloatField45: TFloatField;
    FloatField46: TFloatField;
    FloatField47: TFloatField;
    FloatField48: TFloatField;
    FloatField49: TFloatField;
    FloatField50: TFloatField;
    FloatField51: TFloatField;
    FloatField52: TFloatField;
    FloatField53: TFloatField;
    FloatField54: TFloatField;
    FloatField55: TFloatField;
    FloatField56: TFloatField;
    FloatField57: TFloatField;
    FloatField58: TFloatField;
    FloatField59: TFloatField;
    FloatField60: TFloatField;
    FloatField61: TFloatField;
    FloatField62: TFloatField;
    FloatField63: TFloatField;
    FloatField64: TFloatField;
    FloatField65: TFloatField;
    FloatField66: TFloatField;
    FloatField67: TFloatField;
    FloatField68: TFloatField;
    FloatField69: TFloatField;
    FloatField70: TFloatField;
    FloatField71: TFloatField;
    FloatField72: TFloatField;
    FloatField73: TFloatField;
    SmallintField9: TSmallintField;
    StringField53: TStringField;
    StringField54: TStringField;
    StringField55: TStringField;
    StringField56: TStringField;
    FloatField74: TFloatField;
    FloatField75: TFloatField;
    StringField57: TStringField;
    DataSource86: TDataSource;
    Qactu: TQuery;
    DataSource88: TDataSource;
    DataSource89: TDataSource;
    DataSource90: TDataSource;
    StoredProc6: TStoredProc;
    StoredProc7: TStoredProc;
    QPPALfolio: TIntegerField;
    QPPALdescripcion: TStringField;
    QPPALcodigo: TStringField;
    QPPALcajas: TFloatField;
    QPPALkilos: TFloatField;
    QPPALprecio: TFloatField;
    QPPALtotal: TFloatField;
    QPPALnombre: TStringField;
    QPPALiva: TFloatField;
    QPPALcos_pro: TFloatField;
    QPPALtotiva: TFloatField;
    QPPALrenglon: TSmallintField;
    QPPALpagado: TSmallintField;
    QPPALrfc: TStringField;
    QPPALtipo: TStringField;
    QPPALlineaven: TStringField;
    QPPALdescto: TFloatField;
    QPPALpedido: TStringField;
    QPPALobservacion: TStringField;
    QPPALsucursal: TStringField;
    QPPALnum_emp: TStringField;
    qhora: TQuery;
    StringField58: TStringField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    StringField59: TStringField;
    IntegerField8: TIntegerField;
    DataSource87: TDataSource;
    QTIPOnum_emp: TStringField;
    QTIPOcod_cli: TStringField;
    QTIPOraz_soc: TStringField;
    QTIPOdom_cli: TStringField;
    QTIPOciu_cli: TStringField;
    QTIPOest_cli: TStringField;
    QTIPOtel_cli: TStringField;
    QTIPOrfc_cli: TStringField;
    QTIPOcod_pos: TIntegerField;
    QTIPOage_cli: TSmallintField;
    QTIPOcon_cli: TStringField;
    QTIPOpla_cli: TSmallintField;
    QTIPOsta_cli: TStringField;
    QTIPOlim_cre: TFloatField;
    QTIPOsal_act: TFloatField;
    QTIPOsal_ant: TFloatField;
    QTIPOcom_mes: TFloatField;
    QTIPOcos_mes: TFloatField;
    QTIPOcom_acu: TFloatField;
    QTIPOcos_acu: TFloatField;
    QTIPOfech_com: TDateField;
    QTIPOcan_com: TFloatField;
    QTIPOfech_pag: TDateField;
    QTIPOimp_pag: TFloatField;
    QTIPOcurp: TStringField;
    QTIPOapodo: TStringField;
    QTIPOobserva: TStringField;
    qguardau: TQuery;
    StringField60: TStringField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    StringField61: TStringField;
    IntegerField12: TIntegerField;
    DataSource91: TDataSource;
    qbustipago: TQuery;
    DataSource92: TDataSource;
    qbustipagocod_cli: TStringField;
    qbustipagotipo_pago: TStringField;
    qbustipagobanco: TStringField;
    qbustipagonum_cta: TStringField;
    qieps: TQuery;
    DataSource93: TDataSource;
    qiepscodigo: TStringField;
    iepsinarcot: TQuery;
    StringField62: TStringField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    StringField63: TStringField;
    IntegerField16: TIntegerField;
    DataSource94: TDataSource;
    vtasieps: TQuery;
    StringField64: TStringField;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    IntegerField19: TIntegerField;
    StringField65: TStringField;
    IntegerField20: TIntegerField;
    DataSource95: TDataSource;
    iepsinarcot1: TQuery;
    StringField66: TStringField;
    IntegerField21: TIntegerField;
    IntegerField22: TIntegerField;
    IntegerField23: TIntegerField;
    StringField67: TStringField;
    IntegerField24: TIntegerField;
    DataSource96: TDataSource;
    DataSource97: TDataSource;
    IEPSBORRA: TQuery;
    qvtasieps: TQuery;
    DataSource98: TDataSource;
    qvtasiepsfolio: TStringField;
    qvtasiepscodigo: TStringField;
    qvtasiepstotieps: TFloatField;
    qvtasiepsrenglon: TIntegerField;
    busiepcot: TQuery;
    DataSource99: TDataSource;
    busiepcotfolio: TStringField;
    busiepcotcodigo: TStringField;
    busiepcottotieps: TFloatField;
    busiepcotrenglon: TIntegerField;
    qusocfdi: TQuery;
    DataSource100: TDataSource;
    qusocfdicod_cli: TStringField;
    qusocfdiuso: TStringField;
    qusocfdiuso_cfdi: TStringField;
    qbusat: TQuery;
    DataSource101: TDataSource;
    qbusatcod_colesa: TStringField;
    qbusatcod_sat: TStringField;
    upfacieps: TQuery;
    IntegerField25: TIntegerField;
    StringField68: TStringField;
    StringField69: TStringField;
    FloatField76: TFloatField;
    FloatField77: TFloatField;
    FloatField78: TFloatField;
    FloatField79: TFloatField;
    StringField70: TStringField;
    FloatField80: TFloatField;
    FloatField81: TFloatField;
    FloatField82: TFloatField;
    SmallintField10: TSmallintField;
    SmallintField11: TSmallintField;
    StringField71: TStringField;
    StringField72: TStringField;
    StringField73: TStringField;
    FloatField83: TFloatField;
    StringField74: TStringField;
    StringField75: TStringField;
    StringField76: TStringField;
    StringField77: TStringField;
    DataSource102: TDataSource;
    QIEPSITO: TQuery;
    DataSource103: TDataSource;
    ins_ieps: TQuery;
    DataSource104: TDataSource;
    QIEPSITOfolio: TStringField;
    QIEPSITOcodigo: TStringField;
    QIEPSITOtotieps: TFloatField;
    QIEPSITOrenglon: TIntegerField;
    iepstrcl: TTable;
    DataSource105: TDataSource;
    iepstrclnum_emp: TStringField;
    iepstrclnum_doc: TStringField;
    iepstrclieps: TFloatField;
    iepstrclsal_ieps: TFloatField;
    qtotieps: TQuery;
    IntegerField26: TIntegerField;
    StringField78: TStringField;
    StringField79: TStringField;
    FloatField84: TFloatField;
    FloatField85: TFloatField;
    FloatField86: TFloatField;
    FloatField87: TFloatField;
    StringField80: TStringField;
    FloatField88: TFloatField;
    FloatField89: TFloatField;
    FloatField90: TFloatField;
    SmallintField12: TSmallintField;
    SmallintField13: TSmallintField;
    StringField81: TStringField;
    StringField82: TStringField;
    StringField83: TStringField;
    FloatField91: TFloatField;
    StringField84: TStringField;
    StringField85: TStringField;
    StringField86: TStringField;
    StringField87: TStringField;
    DataSource106: TDataSource;
    qtotcl: TQuery;
    DataSource107: TDataSource;
    ins_inartrcl: TQuery;
    DataSource108: TDataSource;
    qtotclnum_emp: TStringField;
    qtotclnum_suc: TStringField;
    qtotclcod_cli: TStringField;
    qtotcltipo: TStringField;
    qtotclnum_docto: TStringField;
    qtotclimporte: TFloatField;
    qtotclsal_fac: TFloatField;
    qtotclsal_iva: TFloatField;
    qtotclfecha: TDateField;
    Label44: TLabel;
    pon_usocfdi: TDBLookupComboBox;
    cfdiuso: TQuery;
    DataSource109: TDataSource;
    cfdiusocodigo: TStringField;
    cfdiusodescrip: TStringField;
    qresta: TQuery;
    DataSource110: TDataSource;
    qrestpre: TQuery;
    DataSource111: TDataSource;
    QRESTPREMEN: TQuery;
    QRESTAMEN: TQuery;
    DataSource112: TDataSource;
    DataSource113: TDataSource;
    QRESTPREMENcod_art: TStringField;
    QRESTPREMENprecio: TFloatField;
    QRESTPREMENdes_art: TStringField;
    qrestprecod_art: TStringField;
    qrestpreprecio: TFloatField;
    qrestpredes_art: TStringField;
    qrestacod_cli: TStringField;
    qrestaraz_soc: TStringField;
    QRESTAMENcod_cli: TStringField;
    QRESTAMENraz_soc: TStringField;
    dupmay: TQuery;
    DataSource114: TDataSource;
    dupmaycount: TFloatField;
    dupmen: TQuery;
    DataSource115: TDataSource;
    timbrar: TTable;
    DataSource116: TDataSource;
    timbrarnum_emp: TStringField;
    timbrarnum_doc: TStringField;
    timbrartipo: TStringField;
    IMP_REST: TRadioGroup;
    qrestaura: TQuery;
    DataSource117: TDataSource;
    qrestauracod_cli: TStringField;
    qrestauraraz_soc: TStringField;
    qrestaupre: TQuery;
    DataSource118: TDataSource;
    qrestauprecod_art: TStringField;
    qrestaupreprecio: TFloatField;
    qrestaupredes_art: TStringField;
    duprest: TQuery;
    FloatField92: TFloatField;
    DataSource119: TDataSource;
    qbusimp: TQuery;
    qbusimpnombre: TStringField;
    qbusimpcaja: TStringField;
    qbusimpfecha_ini: TDateField;
    qbusimpfecha_fin: TDateField;
    DataSource120: TDataSource;
    qventas4: TQuery;
    DataSource121: TDataSource;
    qventas4folio: TIntegerField;
    qventas4descripcion: TStringField;
    qventas4codigo: TStringField;
    qventas4cajas: TFloatField;
    qventas4kilos: TFloatField;
    qventas4precio: TFloatField;
    qventas4total: TFloatField;
    qventas4nombre: TStringField;
    qventas4iva: TFloatField;
    qventas4cos_pro: TFloatField;
    qventas4totiva: TFloatField;
    qventas4renglon: TSmallintField;
    qventas4pagado: TSmallintField;
    qventas4rfc: TStringField;
    qventas4tipo: TStringField;
    qventas4lineaven: TStringField;
    qventas4descto: TFloatField;
    qventas4pedido: TStringField;
    qventas4observacion: TStringField;
    qventas4sucursal: TStringField;
    qventas4num_emp: TStringField;
    qsacades: TQuery;
    DataSource122: TDataSource;
    qsacadescod_cli: TStringField;
    qsacadessucursal: TStringField;
    qsacadesdescto: TFloatField;
    qventasfolio: TIntegerField;
    qventasdescripcion: TStringField;
    qventascodigo: TStringField;
    qventascajas: TFloatField;
    qventaskilos: TFloatField;
    qventasprecio: TFloatField;
    qventastotal: TFloatField;
    qventasnombre: TStringField;
    qventasiva: TFloatField;
    qventascos_pro: TFloatField;
    qventastotiva: TFloatField;
    qventasrenglon: TSmallintField;
    qventaspagado: TSmallintField;
    qventasrfc: TStringField;
    qventastipo: TStringField;
    qventaslineaven: TStringField;
    qventasdescto: TFloatField;
    qventaspedido: TStringField;
    qventasobservacion: TStringField;
    qventassucursal: TStringField;
    qventasnum_emp: TStringField;
    qespera: TQuery;
    StringField88: TStringField;
    StringField89: TStringField;
    FloatField93: TFloatField;
    DataSource123: TDataSource;
    qespera2: TQuery;
    StringField90: TStringField;
    StringField91: TStringField;
    FloatField94: TFloatField;
    DataSource124: TDataSource;
    Label45: TLabel;
    busfolio: TEdit;
    BitBtn1: TBitBtn;
    qbusfolio: TQuery;
    DataSource125: TDataSource;
    DataSource126: TDataSource;
    qbusinarcot: TQuery;
    cueqventas: TQuery;
    DataSource127: TDataSource;
    cueqventascount: TFloatField;
    qactuemp8: TQuery;
    IntegerField27: TIntegerField;
    StringField92: TStringField;
    StringField93: TStringField;
    FloatField95: TFloatField;
    FloatField96: TFloatField;
    FloatField97: TFloatField;
    FloatField98: TFloatField;
    StringField94: TStringField;
    FloatField99: TFloatField;
    FloatField100: TFloatField;
    FloatField101: TFloatField;
    SmallintField14: TSmallintField;
    SmallintField15: TSmallintField;
    StringField95: TStringField;
    StringField96: TStringField;
    StringField97: TStringField;
    FloatField102: TFloatField;
    StringField98: TStringField;
    StringField99: TStringField;
    StringField100: TStringField;
    StringField101: TStringField;
    DataSource128: TDataSource;
    qbusfoliofolio: TIntegerField;
    qbusfoliodescripcion: TStringField;
    qbusfoliocodigo: TStringField;
    qbusfoliocajas: TFloatField;
    qbusfoliokilos: TFloatField;
    qbusfolioprecio: TFloatField;
    qbusfoliototal: TFloatField;
    qbusfolionombre: TStringField;
    qbusfolioiva: TFloatField;
    qbusfoliocos_pro: TFloatField;
    qbusfoliototiva: TFloatField;
    qbusfoliorenglon: TSmallintField;
    qbusfoliopagado: TSmallintField;
    qbusfoliorfc: TStringField;
    qbusfoliotipo: TStringField;
    qbusfoliolineaven: TStringField;
    qbusfoliodescto: TFloatField;
    qbusfoliopedido: TStringField;
    qbusfolioobservacion: TStringField;
    qbusfoliosucursal: TStringField;
    qbusfolionum_emp: TStringField;
    qbusinarcotsum: TFloatField;
    qbusinarcotsum_1: TFloatField;
    qbusinarcotsum_2: TFloatField;
    qbusinarcotsum_3: TFloatField;
    qbusinarcotsum_4: TFloatField;
    qbusinarcotsum_5: TFloatField;
    qbusinarcotcod_cli: TStringField;
    qbusfoliocorte: TQuery;
    DataSource129: TDataSource;
    qbusfoliocortefolio: TIntegerField;
    qbusfoliocortefactura: TStringField;
    qbusfoliocortenombre: TStringField;
    qbusfoliocortecaja: TStringField;
    qbusfoliocorteefectivo: TFloatField;
    qbusfoliocortebonos: TFloatField;
    qbusfoliocortecheque: TFloatField;
    qbusfoliocortedolar: TFloatField;
    qbusfoliocortetotal: TFloatField;
    qbusfoliocortetipo_pago: TStringField;
    qbusfoliocortetipo_fac: TStringField;
    qbusfoliocortefecha: TDateField;
    qbusfoliocortenum_emp: TStringField;
    qbusfoliocortenum_suc: TStringField;
    qbusfoliocortecod_cli: TStringField;
    qbusfoliocorteiva: TFloatField;
    UPDATE_BUSFOLIO: TQuery;
    StringField102: TStringField;
    StringField103: TStringField;
    FloatField103: TFloatField;
    DataSource130: TDataSource;
    busemp: TQuery;
    DataSource131: TDataSource;
    busemp08: TQuery;
    DataSource132: TDataSource;
    actuemp: TQuery;
    DataSource133: TDataSource;
    busempfolio: TIntegerField;
    busempfactura: TStringField;
    busempnombre: TStringField;
    busempcaja: TStringField;
    busempefectivo: TFloatField;
    busempbonos: TFloatField;
    busempcheque: TFloatField;
    busempdolar: TFloatField;
    busemptotal: TFloatField;
    busemptipo_pago: TStringField;
    busemptipo_fac: TStringField;
    busempfecha: TDateField;
    busempnum_emp: TStringField;
    busempnum_suc: TStringField;
    busempcod_cli: TStringField;
    busempiva: TFloatField;
    busemp08num_emp: TStringField;
    busemp08cod_art: TStringField;
    busemp08num_suc: TStringField;
    busemp08fech_doc: TDateField;
    busemp08tip_doc: TStringField;
    busemp08num_doc: TIntegerField;
    busemp08can_kgs: TFloatField;
    busemp08can_caj: TFloatField;
    busemp08cos_pro_kgs: TFloatField;
    busemp08cos_pro_caj: TFloatField;
    busemp08pre_vta_kgs: TFloatField;
    busemp08pre_vta_caj: TFloatField;
    busemp08des_vta: TFloatField;
    busemp08fle_art: TFloatField;
    busemp08ren_art: TSmallintField;
    busemp08cod_cli: TStringField;
    busemp08iva_art: TFloatField;
    busemp08cod_ag: TSmallintField;
    corte_new: TTable;
    DataSource134: TDataSource;
    corte_newFolio: TIntegerField;
    corte_newFactura: TStringField;
    corte_newNombre: TStringField;
    corte_newCaja: TStringField;
    corte_newEfectivo: TFloatField;
    corte_newBonos: TFloatField;
    corte_newCheque: TFloatField;
    corte_newDolar: TFloatField;
    corte_newTotal: TFloatField;
    corte_newTipo_pago: TStringField;
    corte_newTipo_fac: TStringField;
    corte_newFecha: TDateField;
    corte_newNum_emp: TStringField;
    corte_newNum_suc: TStringField;
    corte_newCod_cli: TStringField;
    corte_newIva: TFloatField;
    corte_newPase: TIntegerField;
    agregar_corte: TQuery;
    DataSource135: TDataSource;
    busregimen: TQuery;
    DataSource136: TDataSource;
    busregimennum_emp: TStringField;
    busregimencod_cli: TStringField;
    busregimencalle: TStringField;
    busregimennum_int: TStringField;
    busregimennum_ext: TStringField;
    busregimencolonia: TStringField;
    busregimenemail: TStringField;
    busregimenmunicipio: TStringField;
    busregimenpais: TStringField;
    busregimenemail2: TStringField;
    busregimenemail3: TStringField;
    busregimenregimen: TStringField;
    audita: TTable;
    DataSource137: TDataSource;
    auditano_emp: TStringField;
    auditano_folio: TIntegerField;
    auditano_doc: TStringField;
    auditatotal: TFloatField;
    auditafecha: TDateField;
    auditahora: TDateTimeField;
    auditacan_art: TIntegerField;
    auditacod_cli: TStringField;
    auditanombre: TStringField;
    auditaagente: TStringField;
    Query4: TQuery;
    StringField104: TStringField;
    StringField105: TStringField;
    FloatField104: TFloatField;
    DataSource138: TDataSource;
    Label46: TLabel;
    Edit3: TEdit;
    qtableta: TQuery;
    DataSource139: TDataSource;
    upvtascom: TQuery;
    StringField106: TStringField;
    StringField107: TStringField;
    FloatField105: TFloatField;
    DataSource140: TDataSource;
    DataSource141: TDataSource;
    upvtastab: TQuery;
    StringField108: TStringField;
    StringField109: TStringField;
    FloatField106: TFloatField;
    qtableta2: TQuery;
    DataSource142: TDataSource;
    qtableta2num_emp: TStringField;
    qtableta2folio: TStringField;
    qtableta2cod_cli: TStringField;
    qtableta2nombre: TStringField;
    qtableta2fecha: TDateField;
    qtableta2subtotal: TFloatField;
    qtableta2iva: TFloatField;
    qtableta2total: TFloatField;
    qtableta2bande: TStringField;
    qtableta2rfc: TStringField;
    qtableta2folio_col: TStringField;
    UPDATABLE: TQuery;
    StringField110: TStringField;
    StringField111: TStringField;
    StringField112: TStringField;
    StringField113: TStringField;
    DateField3: TDateField;
    FloatField107: TFloatField;
    FloatField108: TFloatField;
    FloatField109: TFloatField;
    StringField114: TStringField;
    StringField115: TStringField;
    StringField116: TStringField;
    DataSource143: TDataSource;
    qdetab: TQuery;
    qbusal: TQuery;
    DataSource144: TDataSource;
    DataSource145: TDataSource;
    qbusalnum_emp: TStringField;
    qbusalfolio: TStringField;
    qbusalcod_cli: TStringField;
    qbusalnombre: TStringField;
    qbusalfecha: TDateField;
    qbusalsubtotal: TFloatField;
    qbusaliva: TFloatField;
    qbusaltotal: TFloatField;
    qbusalbande: TStringField;
    qbusalrfc: TStringField;
    qbusalfolio_col: TStringField;
    qbusalvendedor: TStringField;
    qbusaldiableros: TStringField;
    qbusalestatus: TStringField;
    qdetabfolio: TIntegerField;
    qdetabcod_art: TStringField;
    qdetabdes_art: TStringField;
    qdetabkgs: TFloatField;
    qdetabcajas: TFloatField;
    qdetabpre_kgs: TFloatField;
    qdetabpre_caj: TFloatField;
    qdetabvendedor: TStringField;
    qdetabtotal: TFloatField;
    qdetabobserva: TMemoField;
    qdetabrenglon: TStringField;
    qdetabcod_cli: TStringField;
    qdetabiva: TFloatField;
    qdetabtip_art: TStringField;
    qdetablin_ven: TStringField;
    qdetabnum_emp: TStringField;
    qtabletanum_emp: TStringField;
    qtabletafolio: TStringField;
    qtabletacod_cli: TStringField;
    qtabletanombre: TStringField;
    qtabletafecha: TDateField;
    qtabletasubtotal: TFloatField;
    qtabletaiva: TFloatField;
    qtabletatotal: TFloatField;
    qtabletabande: TStringField;
    qtabletarfc: TStringField;
    qtabletafolio_col: TStringField;
    qtabletavendedor: TStringField;
    qtabletadiableros: TStringField;
    qtabletaestatus: TStringField;
    upventas: TQuery;
    StringField117: TStringField;
    StringField118: TStringField;
    FloatField110: TFloatField;
    DataSource146: TDataSource;
    DataSource147: TDataSource;
    qsumvtas: TQuery;
    uptableta: TQuery;
    StringField119: TStringField;
    StringField120: TStringField;
    FloatField111: TFloatField;
    DataSource148: TDataSource;
    qsumvtassum: TFloatField;
    qsumvtassum_1: TFloatField;
    qsumvtasexpression: TFloatField;
    qlistapre: TQuery;
    DataSource149: TDataSource;
    DataSource150: TDataSource;
    Query6: TQuery;
    qlistapremenudeo: TFloatField;
    qlistapremayoreo: TFloatField;
    qcodigonum_emp: TStringField;
    qcodigocod_art: TStringField;
    qcodigocod_art1: TStringField;
    qcodigodes_art: TStringField;
    qcodigouni_art: TStringField;
    qcodigoemp_art: TStringField;
    qcodigocan_emp: TFloatField;
    qcodigoprecio_1: TFloatField;
    qcodigoprecio_2: TFloatField;
    qcodigoprecio_3: TFloatField;
    qcodigoprecio_4: TFloatField;
    qcodigoprecio_5: TFloatField;
    qcodigosal_val: TFloatField;
    qcodigosal_ant: TFloatField;
    qcodigoult_cos_kgs: TFloatField;
    qcodigocos_pro_kgs: TFloatField;
    qcodigocos_ant_kgs: TFloatField;
    qcodigoven_mes_kgs: TFloatField;
    qcodigocos_mes_kgs: TFloatField;
    qcodigoven_acu_kgs: TFloatField;
    qcodigocos_acu_kgs: TFloatField;
    qcodigoexi_cor_kgs: TFloatField;
    qcodigoexi_ant_kgs: TFloatField;
    qcodigoexi_fis_kgs: TFloatField;
    qcodigocan_acu_kgs: TFloatField;
    qcodigocan_mes_kgs: TFloatField;
    qcodigoult_cos_caj: TFloatField;
    qcodigocos_pro_caj: TFloatField;
    qcodigocos_ant_caj: TFloatField;
    qcodigoven_mes_caj: TFloatField;
    qcodigocos_mes_caj: TFloatField;
    qcodigoven_acu_caj: TFloatField;
    qcodigocos_acu_caj: TFloatField;
    qcodigoexi_cor_caj: TFloatField;
    qcodigoexi_ant_caj: TFloatField;
    qcodigoexi_fis_caj: TFloatField;
    qcodigocan_acu_caj: TFloatField;
    qcodigocan_mes_caj: TFloatField;
    qcodigoback_cli: TFloatField;
    qcodigoback_pro: TFloatField;
    qcodigomin_emp: TFloatField;
    qcodigomax_emp: TFloatField;
    qcodigoiva: TFloatField;
    qcodigolin_ven: TSmallintField;
    qcodigocod_pro: TStringField;
    qcodigotip_art: TStringField;
    qcodigoedo_pro: TStringField;
    qcodigoban_rep: TStringField;
    qcodigomin_pre: TFloatField;
    qcodigomax_pre: TFloatField;
    qcodigoobserva: TStringField;
    BitBtn4: TBitBtn;
    upcamnomvtas: TQuery;
    DataSource151: TDataSource;
    UPTAB04: TQuery;
    StringField121: TStringField;
    StringField122: TStringField;
    StringField123: TStringField;
    StringField124: TStringField;
    StringField125: TStringField;
    FloatField112: TFloatField;
    FloatField113: TFloatField;
    FloatField114: TFloatField;
    DateField4: TDateField;
    DataSource152: TDataSource;
    DataSource153: TDataSource;
    UPVTAS04: TQuery;
    upcortecaja: TTable;
    DataSource154: TDataSource;
    upcortecajano_doc: TStringField;
    upcortecajatdebito: TFloatField;
    upcortecajatcredito: TFloatField;
    upcortecajanum_emp: TStringField;
    qerror: TQuery;
    DataSource155: TDataSource;
    qerrornum_emp: TStringField;
    qerrornum_suc: TStringField;
    qerrornum_doc: TStringField;
    qerrorcod_cli: TStringField;
    qerrorraz_soc: TStringField;
    qerrordom_cli: TStringField;
    qerrorciu_cli: TStringField;
    qerrorest_cli: TStringField;
    qerroremb_nom: TStringField;
    qerroremb_dom: TStringField;
    qerroremb_pob: TStringField;
    qerrornum_ped: TIntegerField;
    qerrorfech_ped: TDateField;
    qerrornum_ord: TIntegerField;
    qerrorfech_emb: TDateField;
    qerrorcon_cli: TStringField;
    qerrorag_fac: TSmallintField;
    qerrorimp_exe: TFloatField;
    qerrorimp_6: TFloatField;
    qerrorimp_15: TFloatField;
    qerrorimp_20: TFloatField;
    qerrordes_exe: TFloatField;
    qerrordes_6: TFloatField;
    qerrordes_15: TFloatField;
    qerrordes_20: TFloatField;
    qerroriva_6: TFloatField;
    qerroriva_15: TFloatField;
    qerroriva_20: TFloatField;
    qerrorcos_vta: TFloatField;
    qerrorflete: TFloatField;
    qerroriva_fle: TFloatField;
    qerrorcar_1: TFloatField;
    qerroriva_1: TFloatField;
    qerrorcar_2: TFloatField;
    qerroriva_2: TFloatField;
    qerrorfecha: TDateField;
    qerrorreg_fed: TStringField;
    qerrortip_fac: TStringField;
    qerrorcajera: TStringField;
    qbusauto: TQuery;
    DataSource156: TDataSource;
    qbusautofolio: TStringField;
    qbusautocod_art: TStringField;
    qbusautocan_kgs: TFloatField;
    qbusautocan_caj: TFloatField;
    qbusautopre_kgs: TFloatField;
    qbusautopre_caj: TFloatField;
    qbusautototal: TFloatField;
    qbusautocliente: TStringField;
    qbusautofecha: TDateField;
    qbusautobande: TIntegerField;
    qbusautovendedor: TStringField;
    qbuserror: TQuery;
    DataSource157: TDataSource;
    DataSource158: TDataSource;
    qcerokgs: TQuery;
    StringField128: TStringField;
    StringField129: TStringField;
    FloatField116: TFloatField;
    FloatField117: TFloatField;
    FloatField118: TFloatField;
    FloatField119: TFloatField;
    FloatField120: TFloatField;
    StringField130: TStringField;
    DateField5: TDateField;
    IntegerField28: TIntegerField;
    StringField131: TStringField;
    AUTORIZA: TTable;
    DataSource159: TDataSource;
    AUTORIZAfolio: TStringField;
    AUTORIZAcod_art: TStringField;
    AUTORIZAcan_kgs: TFloatField;
    AUTORIZAcan_caj: TFloatField;
    AUTORIZApre_kgs: TFloatField;
    AUTORIZApre_caj: TFloatField;
    AUTORIZAtotal: TFloatField;
    AUTORIZAcliente: TStringField;
    AUTORIZAfecha: TDateField;
    AUTORIZAbande: TIntegerField;
    AUTORIZAvendedor: TStringField;
    qsacapor: TQuery;
    DataSource160: TDataSource;
    qsacaporcod_cli: TStringField;
    qsacaporporce: TFloatField;
    qsacaporsucu: TStringField;
    qsacaporcod_pro: TStringField;
    qsacapor2: TQuery;
    StringField126: TStringField;
    FloatField115: TFloatField;
    StringField127: TStringField;
    StringField132: TStringField;
    DataSource161: TDataSource;
    qsacapor3: TQuery;
    StringField133: TStringField;
    FloatField121: TFloatField;
    StringField134: TStringField;
    StringField135: TStringField;
    DataSource162: TDataSource;
    qcolesa: TQuery;
    qcolesano_actu: TStringField;
    qcolesafecha: TDateField;
    qtablet: TQuery;
    DataSource163: TDataSource;
    DataSource164: TDataSource;
    DataSource165: TDataSource;
    actualiza: TTable;
    qtabletNo_actu: TStringField;
    qtabletFecha: TDateField;
    actualizaNo_actu: TStringField;
    actualizaFecha: TDateField;
    LISTAPRECIOS2: TTable;
    DataSource166: TDataSource;
    qlistata: TQuery;
    DateField8: TDateField;
    StringField140: TStringField;
    StringField141: TStringField;
    FloatField124: TFloatField;
    FloatField125: TFloatField;
    StringField142: TStringField;
    StringField143: TStringField;
    DataSource167: TDataSource;
    DataSource168: TDataSource;
    qborrota: TQuery;
    DateField7: TDateField;
    StringField144: TStringField;
    StringField145: TStringField;
    FloatField126: TFloatField;
    FloatField127: TFloatField;
    StringField146: TStringField;
    StringField147: TStringField;
    LISTAPRECIOS2Fecha: TDateField;
    LISTAPRECIOS2Cod_art: TStringField;
    LISTAPRECIOS2Des_art: TStringField;
    LISTAPRECIOS2Menudeo: TFloatField;
    LISTAPRECIOS2Mayoreo: TFloatField;
    LISTAPRECIOS2Ban_men: TStringField;
    LISTAPRECIOS2Ban_may: TStringField;
    Label47: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    qbusprecio: TQuery;
    DataSource169: TDataSource;
    qbuspreciofecha: TDateField;
    qbuspreciocod_art: TStringField;
    qbuspreciodes_art: TStringField;
    qbuspreciomenudeo: TFloatField;
    qbuspreciomayoreo: TFloatField;
    qbusprecioban_men: TStringField;
    qbusprecioban_may: TStringField;
    qtotventassum: TFloatField;
    QBUSDESCTO: TQuery;
    DataSource170: TDataSource;
    QBUSDESCTOcod_cli: TStringField;
    QBUSDESCTOsucursal: TStringField;
    QBUSDESCTOdescto: TFloatField;
    QBUSEMP04: TQuery;
    QBUSEMP04num_emp: TStringField;
    QBUSEMP04cod_cli: TStringField;
    QBUSEMP04raz_soc: TStringField;
    QBUSEMP04dom_cli: TStringField;
    QBUSEMP04ciu_cli: TStringField;
    QBUSEMP04est_cli: TStringField;
    QBUSEMP04tel_cli: TStringField;
    QBUSEMP04rfc_cli: TStringField;
    QBUSEMP04cod_pos: TIntegerField;
    QBUSEMP04age_cli: TSmallintField;
    QBUSEMP04con_cli: TStringField;
    QBUSEMP04pla_cli: TSmallintField;
    QBUSEMP04sta_cli: TStringField;
    QBUSEMP04lim_cre: TFloatField;
    QBUSEMP04sal_act: TFloatField;
    QBUSEMP04sal_ant: TFloatField;
    QBUSEMP04com_mes: TFloatField;
    QBUSEMP04cos_mes: TFloatField;
    QBUSEMP04com_acu: TFloatField;
    QBUSEMP04cos_acu: TFloatField;
    QBUSEMP04fech_com: TDateField;
    QBUSEMP04can_com: TFloatField;
    QBUSEMP04fech_pag: TDateField;
    QBUSEMP04imp_pag: TFloatField;
    QBUSEMP04curp: TStringField;
    QBUSEMP04apodo: TStringField;
    QBUSEMP04observa: TStringField;
    DataSource171: TDataSource;
    DataSource172: TDataSource;
    qmarcapresentacion: TQuery;
    qBuscaCanEmp: TQuery;
    procedure FormShow(Sender: TObject);
    procedure inicializa;
    procedure factuExit(Sender: TObject);
    procedure factuKeyPress(Sender: TObject; var Key: Char);
    procedure tipo_facClick(Sender: TObject);
    procedure tipoconsultaClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure CODIGOARTClick(Sender: TObject);
    procedure CAJ_PROExit(Sender: TObject);
    procedure CAJ_PROKeyPress(Sender: TObject; var Key: Char);
    procedure KIL_PROKeyPress(Sender: TObject; var Key: Char);
    procedure PRE_PROKeyPress(Sender: TObject; var Key: Char);
    PROCEDURE VERIFICA;
    function  stripped(stripchar : char; str : string) : string;
    procedure CODIGOARTKeyPress(Sender: TObject; var Key: Char);
    procedure sDblClick(Sender: TObject);
    procedure sacatotal;
    procedure actu_folio;
    procedure KIL_PROExit(Sender: TObject);
    procedure efectivoExit(Sender: TObject);
    procedure efectivoKeyPress(Sender: TObject; var Key: Char);
    procedure transfKeyPress(Sender: TObject; var Key: Char);
    procedure chequeExit(Sender: TObject);
    procedure chequeKeyPress(Sender: TObject; var Key: Char);
    procedure dolarKeyPress(Sender: TObject; var Key: Char);
    procedure cheqprefExit(Sender: TObject);
    procedure cheqprefKeyPress(Sender: TObject; var Key: Char);
    procedure nochequeExit(Sender: TObject);
    procedure nochequeKeyPress(Sender: TObject; var Key: Char);
    PROCEDURE SACATOTAL1;
    procedure impri_tick;
    procedure impri_tick2;
    procedure impri_fac;
    procedure BitBtn3Click(Sender: TObject);
     procedure ticket_conse;
    procedure PRE_PROExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure aliasKeyPress(Sender: TObject; var Key: Char);
    procedure NUM_EMPRESAExit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure QCODIGOI(Sender: TObject; var Key: Char);
    procedure csucursalKeyPress(Sender: TObject; var Key: Char);
    procedure CODIGOCLIKeyPress(Sender: TObject; var Key: Char);
    procedure Btsendmail(Sender: TObject);
    procedure Tipo_pagoClick(Sender: TObject);
//    procedure crear_xml;
    procedure crear_pdf;
     procedure crear_pdf2;
//    procedure firma;
    procedure inc_fac;
    procedure orden_compraKeyPress(Sender: TObject; var Key: Char);
    procedure al_super;
    procedure FormCreate(Sender: TObject);
    procedure SMTPStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure cfditxt;
    procedure enviar_mail;
    procedure notaremision;
    procedure copiaryabrir;
    procedure tdebitoExit(Sender: TObject);
    procedure nuevo_prov;
    procedure nombreClick(Sender: TObject);
    procedure CODIGOCLIClick(Sender: TObject);
    procedure NUM_EMPRESAClick(Sender: TObject);
    procedure uuid;
    procedure transfExit(Sender: TObject);
    procedure pon_usocfdiClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure revisavtas;
    procedure sKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure inicializa2;
    procedure verifica2;






  private
    { Private declarations }
  public
  TOTAL, codigo_azu, descto, TOTALTOIVA,TOTIVA33, TOTIEPS33,  cod_sat, cod_uso, uso_cfdi, ieps_st, empresita,NOMBRECTE, nom_caja, cod_debe, FACTUROTA,certi, arch_key, pass, cod_pos, subtotale, horafinal,
  tmpdia, tmpano, tmpmes,pla_clie, pla_cliestr, seriee, folio_finale, folio_inicioe, ano_aprobae, num_aprobae, dine_letra, fijo, RESTO,ORDEN, nom_cli, est_cli, ciu_cli, rfc_tmp,codigo, cod_cli,
   AGENTE_ORI, RFC_CAM, PEDIDO_CAM, NOMBRE_CAM, sitienefolio, CONSETICK, TIP_ART, CAN_EMP, LIN_VEN, regimen_cli, OBJETOIMP,nombre_table : STRING;
  agregaruno, entrofolio, div_tick, si_debe, salirtodo, falta_envio, futus, papel, desblo_precio, bande, yasevio, LABANDE, NUM_ARTICULOS, ACHI, YA_PUSE_RFC,  FOLIO, SIKEDO2, SIKEDO, IVA, reng: integer;
  lim_cre, ACUDES, tot_iva, fin_tot, imp_exe, coniva, conieps, imp_exe4, ivatotal4, iepstotal4, SALDO_VEN, tot_dlls, tot_bonos, TOTIVA,BASE_TOT,  TOTIVA1, TOTIEPS, TOTIEPS1,  SUBTOTAL, iepstotal, IVATOTAL,TOTAL_FIN,totdes, ven_tot : real;
  entra_azu, ACTIVOSALIDA: INTEGER;
   { Public declarations }
  FIdPresentacionSel: Integer;
  FCodArtResuelto: string;
  FFactorPresentacion: Double;
  FPrecioDerivadoSel: Boolean;
  FTaraSel: Double;
  FEsVariableSel: Boolean;
  FCajasCalc: Double;
  function PrecioPresentacion(const PrecioTexto: string): string;
  function BuscaCanEmp(const CodArt: string): Double;
  end;

var
  Form9: TForm9;
  TOT, CAMBALACHE, ACU: REAL;
  fac, tfecha1,sello, firma_digi, cadena: string;
  FAC_ELE1, FAC_ELE, mueve, remueve : TextFile;



 { function SAT_Version : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_LicenceType : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_CompileTime(szOutput : PAnsiChar; nOutChars : Integer) : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_ModuleName(szOutput : PAnsiChar; nOutChars : Integer; nOptions : Integer) : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_PKIVersion : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_PKICompileTime(szOutput : PAnsiChar; nOutChars : Integer) : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_PKIModuleName(szOutput : PAnsiChar; nOutChars : Integer; nOptions : Integer) : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_LastError(szOutput : PAnsiChar; nOutChars : Integer) : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_ErrorLookup(szOutput : PAnsiChar; nOutChars : Integer; nErrCode : Integer) : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_MakePipeStringFromXml(szOut : PAnsiChar; nOutChars : Integer; szXmlFile : AnsiString; nOptions : Integer) : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_ValidateXml(szXmlFile : AnsiString; nOptions : Integer) : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_SignXml(szOutputFile : AnsiString; szInputXmlFile : AnsiString; szKeyFile : AnsiString; szPassword : AnsiString; szCertFile : AnsiString; nOptions : Integer) : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_VerifySignature(szXmlFile : AnsiString; szCertFile : AnsiString; nOptions : Integer) : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_MakeDigestFromXml(szOut : PAnsiChar; nOutChars : Integer; szXmlFile : AnsiString; nOptions : Integer) : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_ExtractDigestFromSignature(szOut : PAnsiChar; nOutChars : Integer; szXmlFile : AnsiString; szCertFile : AnsiString; nOptions : Integer) : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_GetXmlAttribute(szOut : PAnsiChar; nOutChars : Integer; szXmlFile : AnsiString; szAttribute : AnsiString; szElement : AnsiString) : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_GetCertNumber(szOut : PAnsiChar; nOutChars : Integer; szFileName : AnsiString; nOptions : Integer) : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_GetCertExpiry(szOut : PAnsiChar; nOutChars : Integer; szFileName : AnsiString; nOptions : Integer) : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_GetCertAsString(szOut : PAnsiChar; nOutChars : Integer; szFileName : AnsiString; nOptions : Integer) : Integer; stdcall; external 'diFirmaSAT2.dll';
  function SAT_MakeSignatureFromXml(szOut : PAnsiChar; nOutChars : Integer; szInputXmlFile : AnsiString; szKeyFile : AnsiString; szPassword : AnsiString) : Integer; stdcall; external 'diFirmaSAT2.dll';

  }

implementation

uses contrasena, dipos, kilocaj, DESBLO, aprobar, CHECAR, ultcve,
  mostrar, soriana, cvesaldo, abonos, CADODUPLI, liver, duplicod, dupmen,
  AUTORIZA, OTRACVE, DESBLO2;

{$R *.dfm}

const
  // WARNING: this is where we expect to find the test files.
  // You may need to change this on your system
  TEST_DIR = 'C:\ENVIAR';

  CRLF = #13 + #10;
//  SAT_MD5_CHARS  = 32;
   SAT_HASH_SHA1 = #20;
   SAT_MAX_HASH_CHARS = 40;

 {
Procedure disp_error(nErrCode : Integer; showLast : Boolean = True);
const
  MAX_CHARS = 2048;
var
	msg : Array[0..MAX_CHARS-1] of AnsiChar;
	nchars : Integer;
begin
 showmessage('Error code ' + IntToStr(nErrCode));

	nchars := SAT_ErrorLookup(msg, MAX_CHARS, nErrCode);
	If (nchars > 0) then
		write(': ' +  msg);

  if showLast then
  begin
    nchars := SAT_LastError(msg, MAX_CHARS);
    if (nchars > 0) then
      Write(': ' +  msg);
  end;
	showmessage('');
end;   }

FUNCTION iPosition(const i: INTEGER): INTEGER;
BEGIN
  RESULT := Integer(i * LongInt(Printer.PageWidth) DIV 1000)
END {iPosition};


FUNCTION jPosition(const j: INTEGER): INTEGER;
BEGIN
  RESULT := Integer(j * LongInt(Printer.PageHeight) DIV 1000)
END {jPosition};

Function RequiredFilesExist(certi, arch_key: string) : Boolean;
begin


  Result := True; // Innocent until proven guilty
  if Not FileExists(certi) then Result := False;
  if Not FileExists(arch_key) then Result := False;
//  if Not FileExists(factu.text+'.xml') then Result := False;
 { if Not FileExists('Muestra_v2_bad.xml') then Result := False;
  if Not FileExists('Muestra_v2_base2.xml') then Result := False;
  if Not FileExists('Muestra_v2_signed2.xml') then Result := False;  }
end;




procedure TForm9.FormShow(Sender: TObject);
var
      ruta_ori, ruta_des:string;
begin


       ENTROFOLIO := 1;
       inicializa;

      si_debe := 0;


      qnumemp.Close;
      qnumemp.Open;


      nocheque.Text := '0';

      actu_folio;
      papel:=1;

     QBORRAR.Close;
     QBORRAR.ExecSQL;

     sat.Close;
     sat.Open;

     certi:= sat.fieldbyname('cer').asstring;
     arch_key:= sat.fieldbyname('key').asstring;
     pass:= sat.fieldbyname('pass').asstring;

     IMP_REST.ItemIndex := 1;

     TIPO_FAC.ItemIndex := 1;


     num_empresa.SetFocus;

end;


procedure tform9.actu_folio;
begin
      qsaca.close;
      qsaca.parambyname('nombre').AsString:= form4.agente1;
      qsaca.Open;

      tfolio.Text := INTTOSTR(qsaca.fields[0].ASINTEGER + 1);



      actufolio.close;
      actufolio.parambyname('nombre').asstring:= FORM4.AGENTE1;
      actufolio.parambyname('folio').asstring:= tfolio.text;
      ACTUFOLIO.execsql;
 end;


procedure tform9.inicializa;
begin
     totieps := 0;

     entra_azu := 0;
     codigo_azu := '';

     regimen_cli := '';
     OBJETOIMP := '';

      imp_exe4 := 0;
      BASE_TOT := 0;
      ivatotal4 := 0;
      iepstotal4 := 0;

      IMP_REST.ItemIndex := 1;

      NUM_ARTICULOS:= 0;
      ACHI:= 0;
      memo2.text:='0';
      memo1.Text:='0';
      memo3.text:='0';
      memo4.Text:= '0';
      lim_cre:= 0;
      futus := 0;
      edit9.Text:= '0';
      edit10.text:= '0';
      ieps.Text := '0';
      edit1.Text:= '0';
      div_tick := 0;


      efectivo.Text:='0';
      transf.text:='0';
      cheque.text:='0';
      dolar.text:='0';
      cheqpref.text:='0';
      TDEBITO.Text := '0';
      


      tdire.Text:= '';
      trfc.Text:= '';
      SUBTOTAL := 0;
      IVATOTAL := 0;
      iepstotal := 0;
      TOTAL_FIN := 0;
      sikedo:= 0;
      SIKEDO2:= 0;

      RENG:= 0;
      LABEL15.VISIBLE:= FALSE;
      FACTU.Visible:= FALSE;

      YA_PUSE_RFC := 0;

      ACU:= 0;
      TOT:= 0;
      CAMBALACHE:= 0;
      ACUDES:= 0;

      qventas.close;
      QSUCUR.Close;
      QTIPO.Close;
      QCODIGOART.Close;
      TOTART.Text:= '0';

      TIPO_PAGO.ItemIndex:= -1;
      TIPOCONSULTA.ItemIndex:= -1;
      TIPO_FAC.ItemIndex:= -1;

      FECHAVIENTOS.DATE:= DATE;

      caj_pro.Text:='0';
      kil_pro.text:='0';
      pre_pro.Text:= '0';
      descripart.Text:= '0';
      falta_envio:= 0;

      name.Visible:= false;
      NOMBRE_CLI.VISIBLE:= FALSE;
      CODIGOCLI.VISIBLE:= FALSE;
      NOMBRE.VISIBLE:= TRUE;
      code.Visible:= TRUE;
      label17.Visible:= false;
      label33.Visible:= TRUE;


      QTIPO.Close;
      TVENTAS.Close;
      CORTE_CAJA.Close;
      TDESCTO.CLOSE;
      tconfig.Close;

      EDIT2.TEXT:= '';
      aLIAS.Text:= '';
      FORM13.EMP := 1;

      LABANDE:= 0;
      yasevio:= 0;
      desblo_precio:= 0;

      tot_debe.Text:= '0';
      FACTU.Text:= '0';
      papel:=1;

      orden_compra.Text:= '';
      label37.Visible:= false;
      orden_compra.visible:= false;

      OBSERVA.Text := '';
      CODE.Text := '';
      NOMBRE.KeyValue := NULL;
      CODIGOART.KeyValue := NULL;

      DBBANCO.KeyValue := NULL;
      NOCHEQUE.Text := '';
      BANFECHA.Visible := FALSE;
      DBBANCO.Visible := FALSE;
      NOCHEQUE.Visible := FALSE;


      LABEL18.Visible := FALSE;
      LABEL19.Visible := FALSE;
      LABEL20.Visible := FALSE;

       salirtodo:= 0;

       sori.tienda.Text:= '';
       sori.remision.Text := '';
       sori.pedido.Text := '';

       NUM_EMPRESA.KEYVALUE := '01';

       totdes:= 0;

       pon_usocfdi.KeyValue := null;
       cfdiuso.Close;

       BUSFOLIO.Text := '';
       TOTIEPS33 := '0';
       TOTIVA33 := '0';
       TOTAL:= '0';

       EDIT3.TEXT := '';
       NOMBRE_TABLE:= '';



end;

procedure tform9.inicializa2;
begin
     totieps := 0;

     regimen_cli := '';
     OBJETOIMP := '';

      imp_exe4 := 0;
      BASE_TOT := 0;
      ivatotal4 := 0;
      iepstotal4 := 0;

      IMP_REST.ItemIndex := 1;

      NUM_ARTICULOS:= 0;
      ACHI:= 0;
      memo2.text:='0';
      memo1.Text:='0';
      memo3.text:='0';
      memo4.Text:= '0';
      lim_cre:= 0;
      futus := 0;
      edit9.Text:= '0';
      edit10.text:= '0';
      ieps.Text := '0';
      edit1.Text:= '0';
      div_tick := 0;


      efectivo.Text:='0';
      transf.text:='0';
      cheque.text:='0';
      dolar.text:='0';
      cheqpref.text:='0';
      TDEBITO.Text := '0';
      


      tdire.Text:= '';
      trfc.Text:= '';
      SUBTOTAL := 0;
      IVATOTAL := 0;
      iepstotal := 0;
      TOTAL_FIN := 0;
      sikedo:= 0;
      SIKEDO2 := 0;

      RENG:= 0;
      LABEL15.VISIBLE:= FALSE;
      FACTU.Visible:= FALSE;

      YA_PUSE_RFC := 0;

      ACU:= 0;
      TOT:= 0;
      CAMBALACHE:= 0;
      ACUDES:= 0;

      qventas.close;
      QSUCUR.Close;
      QTIPO.Close;
      QCODIGOART.Close;
      TOTART.Text:= '0';

      TIPO_PAGO.ItemIndex:= -1;
      TIPOCONSULTA.ItemIndex:= -1;
      TIPO_FAC.ItemIndex:= -1;

      FECHAVIENTOS.DATE:= DATE;

      caj_pro.Text:='0';
      kil_pro.text:='0';
      pre_pro.Text:= '0';
      descripart.Text:= '0';
      falta_envio:= 0;

      name.Visible:= false;
      NOMBRE_CLI.VISIBLE:= FALSE;
      CODIGOCLI.VISIBLE:= FALSE;
      NOMBRE.VISIBLE:= TRUE;
      code.Visible:= TRUE;
      label17.Visible:= false;
      label33.Visible:= TRUE;


      QTIPO.Close;
      TVENTAS.Close;
      CORTE_CAJA.Close;
      TDESCTO.CLOSE;
      tconfig.Close;

      EDIT2.TEXT:= '';
      aLIAS.Text:= '';
      FORM13.EMP := 1;

      LABANDE:= 0;
      yasevio:= 0;
      desblo_precio:= 0;

      tot_debe.Text:= '0';
      FACTU.Text:= '0';
      papel:=1;

      orden_compra.Text:= '';
      label37.Visible:= false;
      orden_compra.visible:= false;

      OBSERVA.Text := '';
      CODE.Text := '';
      NOMBRE.KeyValue := NULL;
      CODIGOART.KeyValue := NULL;

      DBBANCO.KeyValue := NULL;
      NOCHEQUE.Text := '';
      BANFECHA.Visible := FALSE;
      DBBANCO.Visible := FALSE;
      NOCHEQUE.Visible := FALSE;


      LABEL18.Visible := FALSE;
      LABEL19.Visible := FALSE;
      LABEL20.Visible := FALSE;

       salirtodo:= 0;

       sori.tienda.Text:= '';
       sori.remision.Text := '';
       sori.pedido.Text := '';

       NUM_EMPRESA.KEYVALUE := '01';

       totdes:= 0;

       pon_usocfdi.KeyValue := null;
       cfdiuso.Close;

       BUSFOLIO.Text := '';
       TOTIEPS33 := '0';
       TOTIVA33 := '0';
       TOTAL:= '0';


       NOMBRE_TABLE:= '';



end;




procedure TForm9.factuExit(Sender: TObject);
begin
       if factu.text='' then
        begin
          factu.text:= '0';
          factu.SelectAll;
        end;

        sacadup2.Close;
        sacadup2.ParamByName('factura').AsString:= factu.text;
        sacadup2.ParamByName('num_emp').AsString:= num_empresa.text;
        sacadup2.open;

        if sacadup2.FieldByName('NUM_DOC').AsString <> '' then
           BEGIN
             stop('Esta factura ya esta Capturada');
             factu.setfocus;
             FACTU.SELECTALL;
             EXIT;
           end;

        sacadup.Close;
        sacadup.ParamByName('factura').AsString:= factu.text;
        sacadup.ParamByName('num_emp').AsString:= num_empresa.text;
        sacadup.open;

        if sacadup.FieldByName('NUM_DOC').AsString <> '' then
           BEGIN
             stop('Esta factura ya esta Capturada');
             factu.setfocus;
             FACTU.SELECTALL;
             EXIT;
           end;

end;

procedure TForm9.factuKeyPress(Sender: TObject; var Key: Char);
begin
     if key = '' then
          key:= '0';

   {  if not (key in [chr(0)..chr(31),'0'..'9','.'])then
              key:= '0';
                               }

     if Key = #13 then                          { if it's an enter key }
               begin

              if yasevio = 0 then
              begin
                  IF TIPOCONSULTA.ItemIndex = 0 THEN
                         CODIGOCLI.SetFocus;

                  IF TIPOCONSULTA.ItemIndex = 1 THEN
                         NOMBRE.SetFocus;
              end;

              if yasevio = 1 then
                  begin
                       codigoart.SetFocus;
                  end;

               end

end;

procedure TForm9.tipo_facClick(Sender: TObject);
Begin

     IF (NUM_EMPRESA.TEXT = '') THEN
          BEGIN
              SHOWMESSAGE('SELECCIONA LA EMPRESA');
              TIPO_FAC.ItemIndex:= -1;
              EXIT;

          END;


  IF  (NUM_EMPRESA.TEXT = '02')  AND (FORM13.EMP= 1) THEN
        BEGIN
            SHOWMESSAGE('CAMBIA LA EMPRESA');
            EXIT;
        END;

  IF BUSFOLIO.TEXT = '' THEN
   BEGIN
   PON_USOCFDI.KeyValue := NULL;
   CFDIUSO.Close;
    if tipo_fac.ItemIndex = 0 then
     begin
        label15.CAPTION:= 'FACTURA';
        label15.Visible:= true;
        factu.Visible:= true;
        factu.text:='';
       // factu.setfocus;
        FACTU.ReadOnly:= FALSE;
      //  TIPO_PAGO.ItemIndex:= 0;
        TIPOCONSULTA.ItemIndex:= 1;
        NOMBRE_CLI.VISIBLE:= FALSE;
        NOMBRE.VISIBLE:= TRUE;
        edit2.SETFOCUS;

     end
     else
      begin
        label15.CAPTION:= 'TICKET';
        LABEL15.Visible:= TRUE;
        factu.Visible:= TRUE;
        FACTU.ReadOnly:= TRUE;
        tipo_pago.ItemIndex:= 1;
        tipoconsulta.ItemIndex:= 0;
        edit2.SetFocus;
        ticket_conse;
        NAME.Text:= '';

       end;
  END;

  IF BUSFOLIO.TEXT <> '' THEN
         BEGIN
             label15.CAPTION:= 'TICKET';
             LABEL15.Visible:= TRUE;
             factu.Visible:= TRUE;
             FACTU.ReadOnly:= TRUE;
             tipo_pago.ItemIndex:= 1;
             tipoconsulta.ItemIndex:= 0;
             edit2.SetFocus;
             ticket_conse;
            // NAME.Text:= '';

         END;

end;

procedure TForm9.tipoconsultaClick(Sender: TObject);
begin


        IF  (NUM_EMPRESA.TEXT = '02')  AND (FORM13.EMP= 1) THEN
        BEGIN
            SHOWMESSAGE('CAMBIA LA EMPRESA');
            tipoconsulta.ItemIndex:= -1;
            EXIT;
        END;


        if num_empresa.Text= '' then
            begin
                showmessage('ELIGE LA EMPRESA');
                EXIT;
            END;

        QTIPO.Close;
        QTIPO.ParamByName('NUM_EMP').AsString:= NUM_EMPRESA.TEXT;
        QTIPO.Open;

        if tipoconsulta.ItemIndex = 0 then
            begin
               codigocli.Visible:= true;
               label3.Caption:= 'Codigo';
               nombre.Visible:= false;
               nombre_cli.visible:= false;
          //     nombre_cli.text:= qtipo.FIELDBYNAME('raz_soc').AsString;
               TDIRE.Text:='';
               TRFC.Text:= '';
               label17.Visible:= TRUE;
               name.Visible:= TRUE;
               label33.visible:= FALSE;
               code.Visible:= FALSE;
             end;

         if tipoconsulta.ItemIndex = 1 then
            begin
               codigocli.Visible:= false;
               label3.Caption:= 'Nombre';
               nombre.Visible:= true;
               nombre_cli.visible:= false;
            //   nombre_cli.text:= qtipo.fieldbyname('raz_soc').AsString;
               TDIRE.Text:='';
               TRFC.Text:= '';
               label17.Visible:= FALSE;
               name.Visible:= FALSE;
               label33.visible:= TRUE;
               code.Visible:= TRUE;
            end;





end;





procedure TForm9.BitBtn5Click(Sender: TObject);
begin
      form10.showmodal;
end;



procedure TForm9.CODIGOARTClick(Sender: TObject);

begin
     DESCRIPART.Text:= QCODIGOART.FieldByName('DES_ART').AsString;

     LIN_VEN := QCODIGOART.FIELDBYNAME('LIN_VEN').AsString;
     TIP_aRT := QCODIGOART.FIELDBYNAME('TIP_aRT').AsString;
     CAN_EMP := QCODIGOART.FIELDBYNAME('CAN_EMP').AsString;
     IVA:= STRTOINT(QCODIGOART.FIELDBYNAME('IVA').AsString);
     CODIGO:= QCODIGOART.FIELDBYNAME('COD_aRT').AsString;

     CAJ_PRO.TEXT := '0';
     PRE_PRO.Text := '0';
     KIL_PRO.Text := '0';


     PRE_PRO.ReadOnly := FALSE;

     qieps.close;
     qieps.parambyname('codigo').asstring:= codigo;
     qieps.open;

     if qieps.fields[0].asstring <> '' then
        ieps_st := '8'
      else
        ieps_st := '0';




     end;

procedure TForm9.CAJ_PROExit(Sender: TObject);
var
  cantidad, canemp, kilos, cajas: Double;
begin

     if caj_pro.Text = '' then
          caj_pro.text:= '0';

     // === NUEVO: CAJ_PRO ahora es "cantidad"; se calcula kilos/cajas segun presentacion ===
     if FIdPresentacionSel > 0 then
     begin
       cantidad := StrToFloat(caj_pro.text);

       if FEsVariableSel then
         kilos := cantidad - FTaraSel
       else
         kilos := cantidad * FFactorPresentacion;

       canemp := BuscaCanEmp(FCodArtResuelto);
       if canemp > 0 then
         cajas := kilos / canemp
       else
         cajas := cantidad;

       // OJO: "Cantidad" (caj_pro) NO se toca -- se queda mostrando
       // exactamente lo que tecleo el cajero. "cajas" se guarda aparte
       // (FCajasCalc) para usarse solo al grabar en ventas.
       FCajasCalc := cajas;
       kil_pro.Text := FloatToStrF(kilos, ffFixed, 10, 4);

       qcotiza.Close;
       qcotiza.parambyname('cod_cli').AsString:= cod_CLI;
       qcotiza.parambyname('cod_art').AsString:= codigoart.Text;
       qcotiza.ParamByName('fecha').asdate:= fechavientos.Date;
       qcotiza.Open;

       if qcotiza.fieldbyname('Precio').AsString <> '' then
       begin
         desblo_precio := 1;
         qdupli.Close;
         qdupli.parambyname('cod_cli').AsString:= cod_CLI;
         qdupli.parambyname('cod_art').AsString:= codigoart.Text;
         qdupli.ParamByName('fecha').asdate:= fechavientos.Date;
         qdupli.Open;

         if qdupli.Fields[0].AsInteger > 1 then
         begin
           FORM14.SHOWMODAL;
           pre_pro.ReadOnly:= true;
           pre_pro.SetFocus;
         end
         else
         begin
           pre_pro.Text:= PrecioPresentacion(qcotiza.fieldbyname('precio').AsString);
           pre_pro.ReadOnly:= true;
           pre_pro.SetFocus;
         end;
       end;

       PRE_PRO.SetFocus;
       Exit;
     end;
     // =======================================================================


    IF CAN_EMP ='1' THEN
       BEGIN


    qcotiza.Close;
    qcotiza.parambyname('cod_cli').AsString:= cod_CLI;
    qcotiza.parambyname('cod_art').AsString:= codigoart.Text;
    qcotiza.ParamByName('fecha').asdate:= fechavientos.Date;
    qcotiza.Open;


    if qcotiza.fieldbyname('Precio').AsString <> '' then
           begin
               desblo_precio := 1;

           //con este query buscamos si existen mas de 2 precios...
               qdupli.Close;
               qdupli.parambyname('cod_cli').AsString:= cod_CLI;
               qdupli.parambyname('cod_art').AsString:= codigoart.Text;
               qdupli.ParamByName('fecha').asdate:= fechavientos.Date;
               qdupli.Open;

              if qdupli.Fields[0].AsInteger > 1 then
                  begin
                FORM14.SHOWMODAL;
               //pre_pro.Text:= qcotiza.fieldbyname('precio').AsString;
               pre_pro.ReadOnly:= true;
               pre_pro.SetFocus;

                   end
                   else
                      begin
 //cambia x PrecioPresentacion ======= pre_pro.Text:= qcotiza.fieldbyname('precio').AsString;
                        pre_pro.Text:= PrecioPresentacion(qcotiza.fieldbyname('precio').AsString);
                        pre_pro.ReadOnly:= true;
                        pre_pro.SetFocus;
                      end;
           END;



            caj_pro.text := floattostrf(strtofloat(caj_pro.text), ffnumber,10,2);
            caj_pro.text := stripped(',', caj_pro.text);


        KIL_PRO.Text:= CAJ_PRO.Text;
        PRE_PRO.SetFocus;

       END;




     caj_pro.text := floattostrf(strtofloat(caj_pro.text), ffnumber,10,2);
     caj_pro.text := stripped(',', caj_pro.text);




end;

procedure TForm9.CAJ_PROKeyPress(Sender: TObject; var Key: Char);


begin
     if key = '' then
          key:= '0'
        else
           if not (key in [chr(0)..chr(31),'0'..'9','.'])then
              key:= '0'
              else
                 if (KEY = #13) then
                           begin
                              Key := #0;                                 { eat enter key }
                              Perform(WM_NEXTDLGCTL, 0, 0);             { move to next control }
                           end
end;

procedure TForm9.KIL_PROKeyPress(Sender: TObject; var Key: Char);
begin
 if key = '' then
          key:= '0'
        else
           if not (key in [chr(0)..chr(31),'0'..'9','.'])then
              key:= '0'
              else
                 if (KEY = #13) then
                           begin
                              Key := #0;                                 { eat enter key }
                              Perform(WM_NEXTDLGCTL, 0, 0);             { move to next control }
                           end


end;

procedure TForm9.PRE_PROKeyPress(Sender: TObject; var Key: Char);
VAR
   PRE1F, porce_cte: real;
   foliotmp, descto_iva, casitot, MULTI, PRESINTO, CAMBIO_TOTIVA, CAMBIO_TOTAL, TOTALIEPS1, totaliva1, TOTALPREIVA,  TOTALPREIEPS, TOTALTOIEPS: string;
begin
     totaliva1:= '0';
     totalieps1 := '0';
     descto_iva := '0';
     porce_cte := 0;
     PRE1F := 0;



     if key = '' then
          key:= '0';
        if not (key in [chr(0)..chr(31),'0'..'9','.'])then
              key:= '0';

       if Key = #13 then                          { if it's an enter key }
       begin
       Key := #0;                                 { eat enter key }
       Perform(WM_NEXTDLGCTL, 0, 0);                            { move to next control }



        //AQUI PONGO EL DESCTO DEL CLIENTE COLESA
      IF COD_CLI = 'E257L' THEN
    BEGIN
          QBUSDESCTO.CLOSE;
          QBUSDESCTO.OPEN;

         PRE1F := STRTOFLOAT(PRE_PRO.TEXT) * QBUSDESCTO.FIELDBYNAME('DESCTO').ASFLOAT;
         PRE_PRO.TEXT := FLOATTOSTRF((STRTOFLOAT(PRE_PRO.TEXT) - PRE1F),FFFIXED,10,2);

    END;



        IF (PRE_PRO.TEXT = '0') OR (PRE_PRO.TEXT = '0.00') OR (PRE_PRO.TEXT = '')  THEN
                      BEGIN
                           SHOWMESSAGE('REVISA EL PRECIO');
                           EXIT;

                      END;

        iF ((CAJ_PRO.TEXT = '0') OR (CAJ_PRO.TEXT = '') OR (CAJ_PRO.TEXT = '0.00')) AND ((KIL_PRO.TEXT = '0') OR (KIL_PRO.TEXT = '') OR (KIL_PRO.TEXT = '0.00')) THEN
                BEGIN
                    SHOWMESSAGE('REVISA CANTIDADES');
                    EXIT;
                END;


              IF  TRFC.TEXT = '' THEN
                 BEGIN
                           SHOWMESSAGE('REVISA EL CLIENTE');
                           EXIT;

                      END;










       ORDEN := COPY(EDIT2.TEXT, 1,1);




       IF (ORDEN ='1') OR (ORDEN ='2') OR (ORDEN ='3') OR (ORDEN ='4') OR (ORDEN ='5')OR
                   (ORDEN ='6') OR (ORDEN ='7') OR (ORDEN ='8') OR (ORDEN ='9') THEN
                  begin
                    // mensaje:=Application.MessageBox('Dig�te Letras', 'Error de entrada');
                    SHOWMESSAGE('DIGITA LETRAS AL PPIO DE LA ORDEN');

                     key := char(0); //Limpia el EditBox
                     EDIT2.SETFOCUS;
                     EDIT2.SelectAll;
                     EXIT;
                  END;

       if edit2.text = '' then
              begin
                 SHOWMESSAGE('FAVOR DE PONER EL NUM ORDEN');
                 EDIT2.SetFocus;
                 EXIT;

              end;


       IF (CAJ_PRO.TEXT ='') OR (CAJ_PRO.TEXT = '0') THEN
             CAJ_PRO.TEXT := '0.00';


       IF (KIL_PRO.TEXT ='') OR (KIL_PRO.TEXT = '0') THEN
             KIL_PRO.TEXT := '0.00';



      IF (CODIGOART.Text = 'CHTAJINC') AND (COD_CLI ='O14L') THEN
        BEGIN

             IF CAJ_PRO.TEXT <> '0.00' THEN
                    KIL_PRO.Text := FLOATTOSTRF((STRTOFLOAT(CAJ_PRO.TEXT) * 100),ffnumber, 10,2);

        END;


       IF (CODIGOART.Text = 'C401EC') AND (COD_CLI ='O14L') THEN
        BEGIN

             IF CAJ_PRO.TEXT <> '0.00' THEN
                    KIL_PRO.Text := FLOATTOSTRF((STRTOFLOAT(CAJ_PRO.TEXT) * 50),ffnumber, 10,2);

        END;



       IF (CODIGOART.Text = 'A15PB') OR (CODIGOART.TEXT = 'A15P') OR (CODIGOART.Text = 'A15PC') AND (COD_CLI ='O14L') THEN
        BEGIN

             IF CAJ_PRO.TEXT <> '0.00' THEN
                    KIL_PRO.Text := FLOATTOSTRF((STRTOFLOAT(CAJ_PRO.TEXT) * 165),ffnumber, 10,2);

        END;




      KIL_PRO.TEXT := stripped( ',' , kil_pro.text);



      if (cod_cli ='O14L') AND ((CAJ_PRO.Text = '0.00') OR (KIL_PRO.Text = '0.00')) THEN
          BEGIN
               SHOWMESSAGE('FALTA LLENAR CAJAS O KILOS');
               CAJ_PRO.SetFocus;
               EXIT;
          END;







       IF (NUM_EMPRESA.TEXT = '02') AND (FORM13.EMP = 1)THEN
        BEGIN
           showmessage('No se puede capturar en la empresa 2');
           NUM_EMPRESA.SETFOCUS;
           exit;

        END;

       if (alias.Visible = true) and (alias.text = '') then
            begin
                Showmessage('Favor de Poner el Alias');
                alias.SetFocus;
                exit;
            end
            else
            if (nombre_CLI.TEXT = '') and (codigocli.TEXT = '') and (nombre.TEXT = '')  AND (COD_CLI  = '') then
              begin
                   Showmessage('Favor Poner Cliente');
                   nombre_cli.SetFocus;
                exit;
              end
              else
              if (rfc_tmp <> trfc.text) and ((rfc_tmp = 'CCO-860523-1N4')  OR (TRFC.TEXT = 'CCO-860523-1N4')) then
                 begin
                   Showmessage('No puedes Cambiar de Cliente OXXO');
                   exit;
                 end
                 else
                if codigoart.Text = '' then
                 begin
                   Showmessage('Favor Poner Codigo');
                   codigoart.SetFocus;
                   exit;
                 end
                 else
                   if (strtofloat(caj_pro.Text) = 0) and (strtofloat(kil_pro.Text) = 0) then
                     begin
                       Showmessage('Favor Poner Kilos o Cajas');
                       caj_pro.SetFocus;
                       exit;
                     end
                     ELSE
                     if (caj_pro.Text = '') OR(kil_pro.Text = '') then
                     begin
                       Showmessage('Favor Poner Kilos o Cajas');
                       caj_pro.SetFocus;
                       exit;
                     end
                     ELSE
                      if (DESCRIPART.Text ='') OR (descripart.Text = '0')  then
                      begin
                       Showmessage('Favor de Poner Descripcion Art');
                       CODIGOART.SetFocus;
                       exit;
                     end
                     else
                      if (tip_Art = 'K') and (strtofloat(kil_pro.text) = 0) then
                      begin
                       Showmessage('Este producto se vende por KILOS');
                       kil_pro.SetFocus;
                       exit;
                     end
                       else
                       BEGIN
                 //       sikedo := 1;



                     if (NUM_ARTICULOS >= 20) and (tipo_fac.itemindex = 1) then
                            begin
                              SHOWMESSAGE('LIMITE PRODUCTOS');
                              EXIT;
                            END;   





               //AQUI ASIGNAMOS EL TOTAL

            if tip_art ='K' THEN
                BEGIN
                    TOTAL:= floattostrf((STRTOFLOAT(KIL_PRO.TEXT) * STRTOFLOAT(PRE_PRO.TEXT)),ffnumber,10,2);
                    total := stripped(',',total);
                    MULTI := KIL_PRO.TEXT;                                                                                                                                                                   
                END;

             if (tip_art ='C' ) AND (STRTOFLOAT(CAJ_PRO.TEXT) = 0 ) THEN
                BEGIN
                     TOTAL:= floattostrf((STRTOFLOAT(KIL_PRO.TEXT) * STRTOFLOAT(PRE_PRO.TEXT)),ffnumber,10,2);
                    total := stripped(',',total);
                    MULTI := KIL_PRO.TEXT;
                END;


              if (tip_art ='C') AND (STRTOFLOAT(CAJ_PRO.TEXT) <> 0)  THEN
                BEGIN
                    TOTAL:= floattostrf((STRTOFLOAT(caj_PRO.TEXT) * STRTOFLOAT(PRE_PRO.TEXT)),ffnumber,10,2);
                    total := stripped(',',total);
                    MULTI := CAJ_PRO.TEXT;
                END;


              if (tip_art ='C') and (STRTOFLOAT(kil_pro.text) <> 0) then
               begin
                    TOTAL:= floattostrf((STRTOFLOAT(KIL_PRO.TEXT) * STRTOFLOAT(PRE_PRO.TEXT)),ffnumber,10,2);
                    total := stripped(',',total);
                   MULTI := KIL_PRO.TEXT;
               end;


               IF (TIP_ART = 'C') AND (COD_CLI ='O14L') AND (CODIGOART.Text = 'CHTAJINC') THEN
                  BEGIN
                    TOTAL:= floattostrf((STRTOFLOAT(caj_PRO.TEXT) * STRTOFLOAT(PRE_PRO.TEXT)),ffnumber,10,2);
                    total := stripped(',',total);
                    MULTI := CAJ_PRO.TEXT;
                END;


                IF (TIP_ART = 'C') AND (COD_CLI ='O14L') AND (CODIGOART.Text = 'C401EC') THEN
                  BEGIN
                    TOTAL:= floattostrf((STRTOFLOAT(caj_PRO.TEXT) * STRTOFLOAT(PRE_PRO.TEXT)),ffnumber,10,2);
                    total := stripped(',',total);
                    MULTI := CAJ_PRO.TEXT;
                END;



                   IF (TIP_ART = 'K') AND (COD_CLI ='O14L') AND (CODIGOART.Text = 'A15PB') OR (CODIGOART.TEXT = 'A15P') OR (CODIGOART.Text = 'A15PC') THEN
                  BEGIN
                    TOTAL:= floattostrf((STRTOFLOAT(kil_PRO.TEXT) * STRTOFLOAT(PRE_PRO.TEXT)),ffnumber,10,2);
                    total := stripped(',',total);
                    MULTI := CAJ_PRO.TEXT;
                END;









               // AQUI VA EL TOTAL DE IVA

             IF IVA <> 0 THEN
                BEGIN


                 //    TOTALIVA1:= floattostrf(TOTAL / 1.16), ffnumber,10,2) ;


                      TOTALPREIVA:= floattostrf((STRTOFLOAT(PRE_PRO.TEXT) / 1.16), ffnumber,10,2) ;
                      TOTALPREIVA:= STRIPPED(',',totalpreiva);

                      TOTALTOIVA:= FLOATTOSTRF((STRTOFLOAT(TOTALPREIVA) * STRTOFLOAT(MULTI)),FFNUMBER,10,2);

                      TOTALTOIVA := STRIPPED(',',TOTALTOIVA);

                      TOTALIVA1 := FLOATTOSTRF((STRTOFLOAT(TOTALTOIVA) * 1.16),FFNUMBER,10,2);

                      totaliva1:= stripped (',', totaliva1);

                      totiva1 := strtofloat(totaliva1);


                      TOTIVA33:= FLOATTOSTRF((STRTOFLOAT(TOTALIVA1) - STRTOFLOAT(TOTALTOIVA)),FFNUMBER,10,2);
                      TOTIVA33:= STRIPPED(',',TOTIVA33);
                END
                ELSE
                    TOTIVA33:= '0';




            //aqui voy a poner el total del IEPSSSS

            IF STRTOFLOAT(IEPS_ST) <> 0 THEN
            BEGIN

                      TOTALPREIVA:= floattostrf((STRTOFLOAT(PRE_PRO.TEXT) / 1.08), ffnumber,10,2) ;

                      TOTALTOIVA:= FLOATTOSTRF((STRTOFLOAT(TOTALPREIVA) * STRTOFLOAT(MULTI)),FFNUMBER,10,2);

                      TOTALTOIVA := STRIPPED(',',TOTALTOIVA);

                      TOTALIVA1 := FLOATTOSTRF((STRTOFLOAT(TOTALTOIVA) * 1.08),FFNUMBER,10,2);


                      totalIVA1:= stripped (',', totalIVA1);

                      totIVA1 := strtofloat(totalIVA1);

                      TOTIEPS33:= FLOATTOSTRF((STRTOFLOAT(TOTALIVA1) - STRTOFLOAT(TOTALTOIVA)),FFNUMBER,10,2);
                      TOTIEPS33:= STRIPPED(',',TOTIEPS33);
                END
                ELSE
                    TOTIEPS33:= '0';





              // AQUI VA EL DESCUENTO DEL OXXO..

        {      if ((cod_CLI = 'C21L') and not(strtoint(lin_ven) in [0,4, 6, 7, 10,13,14,15,16,17,27,36,
                43,44,45,51,54,55,56,57,58,59,61,64,72,76,78,80, 91,92,94,99,101,106,116,
                 118,132,150,154,157,159])) then
             begin
               totdes:= 1;

               CASITOT:= '.06';


               descto:= floattostrf((strtofloat(TOTAL)  * 0.06),ffnumber,10,2);
               descto := stripped(',',descto);


             end;   }


                if (cod_CLI = 'A95F') then
             begin
               totdes:= 1;

               qsacapor.close;
               qsacapor.ParamByName('cod_cli').asstring := 'A95F';
               qsacapor.Open;

              // CASITOT:= '.30';
              CASITOT:= qsacapor.fieldbyname('porce').AsString;


               descto:= floattostrf((strtofloat(TOTAL)  * STRTOFLOAT(CASITOT)),ffnumber,10,2);
               descto := stripped(',',descto);


             end;






      if (cod_cli = 'O14L') and  (csucursal.text = 'CEDIS') AND (CODIGOART.TEXT <> 'C401EC') THEN
      BEGIN
               totdes:= 1;


               qsacapor2.close;
               qsacapor2.ParamByName('cod_cli').asstring := 'O14L';
               qsacapor2.ParamByName('sucu').asstring := 'CEDIS';
               qsacapor2.Open;

               CASITOT:= qsacapor2.fieldbyname('porce').AsString;

          //     CASITOT:= '.10';

               descto:= floattostrf((strtofloat(TOTAL)  * strtofloat(casitot)),ffnumber,10,2);
               descto := stripped(',',descto);

       end;




       if (cod_cli = 'O14L') and  (csucursal.text = 'CEDIS') AND (CODIGOART.TEXT ='C401EC') THEN
      BEGIN
               totdes:= 1;


               {  qsacapor2.close;
               qsacapor2.ParamByName('cod_cli').asstring := 'O14L';
               qsacapor2.ParamByName('sucu').asstring := 'CEDIS';
               qsacapor2.Open;

               CASITOT:= qsacapor2.fieldbyname('porce').AsString;      }


               CASITOT:= '.10';

               descto:= floattostrf((strtofloat(TOTAL)  * strtofloat(casitot)),ffnumber,10,2);
               descto := stripped(',',descto);

       end;



      if (cod_cli = 'C211L')  THEN
      BEGIN
               totdes:= 1;

               qsacapor.close;
               qsacapor.ParamByName('cod_cli').asstring := 'C211L';
               qsacapor.Open;

               CASITOT:= qsacapor.fieldbyname('porce').AsString;

          //     CASITOT:= '.0975';

               descto:= floattostrf((strtofloat(TOTAL)  *  strtofloat(casitot)),ffnumber,10,2);
               descto := stripped(',',descto);

       end;






      
      if (cod_cli = 'O14L') and  (csucursal.text = 'CEDIS LAGUNA') THEN
      BEGIN
             totdes:= 1;

              qsacapor2.close;
               qsacapor2.ParamByName('cod_cli').asstring := 'O14L';
               qsacapor2.ParamByName('sucu').asstring := 'CEDIS LAGUNA';
               qsacapor2.Open;

               CASITOT:= qsacapor2.fieldbyname('porce').AsString;

          //     CASITOT:= '.1382';


               descto:= floattostrf((strtofloat(TOTAL)  *  strtofloat(casitot)),ffnumber,10,2);
               descto := stripped(',',descto);

       end;





      if (cod_cli = 'O14L') and  (csucursal.text <> 'CEDIS') AND (csucursal.text <> 'CEDIS LAGUNA') THEN
      BEGIN

             totdes:= 1;


               qsacapor.close;
               qsacapor.ParamByName('cod_cli').asstring := 'O14L';
               qsacapor.Open;

               CASITOT:= qsacapor.fieldbyname('porce').AsString;

             //  CASITOT:= '.045';


               descto:= floattostrf((strtofloat(TOTAL)  *  strtofloat(casitot)),ffnumber,10,2);
               descto := stripped(',',descto);


       end;


      // AQUI AGREGO EL DESCTO DEL OXXO

       if (cod_cli = 'C21L') and  (csucursal.text = 'ROLLER CUF')  THEN
      BEGIN

               totdes:= 1;





               if codigoart.Text =  'C191PO' THEN
               BEGIN
                // CASITOT:= '.10';

                qsacapor3.close;
                qsacapor3.ParamByName('cod_cli').asstring := 'C21L';
                qsacapor3.ParamByName('sucu').asstring := 'ROLLER CUF';
                qsacapor3.ParamByName('cod_pro').asstring := 'C191PO';
                qsacapor3.Open;

                 CASITOT:= qsacapor3.fieldbyname('porce').AsString;

                 descto:= floattostrf((strtofloat(TOTAL)  * strtofloat(casitot)),ffnumber,10,2);
                 descto := stripped(',',descto);
               END;



               if codigoart.Text =  'T1522' THEN
               BEGIN
              // CASITOT:= '.0555';

               qsacapor3.close;
               qsacapor3.ParamByName('cod_cli').asstring := 'C21L';
               qsacapor3.ParamByName('sucu').asstring := 'ROLLER CUF';
               qsacapor3.ParamByName('cod_pro').asstring := 'T1522';
               qsacapor3.Open;

               CASITOT:= qsacapor3.fieldbyname('porce').AsString;

               descto:= floattostrf((strtofloat(TOTAL)  *  strtofloat(casitot)),ffnumber,10,2);
               descto := stripped(',',descto);
               END;




       end;






          if (cod_cli = 'C21L') and  (csucursal.text = 'OSABOR CUF')  THEN
      BEGIN

               totdes:= 1;

               qsacapor2.close;
               qsacapor2.ParamByName('cod_cli').asstring := 'C21L';
               qsacapor2.ParamByName('sucu').asstring := 'OSABOR CUF';
               qsacapor2.Open;

               CASITOT:= qsacapor2.fieldbyname('porce').AsString;

             //  CASITOT:= '.095';


               descto:= floattostrf((strtofloat(TOTAL)  * strtofloat(casitot)),ffnumber,10,2);
               descto := stripped(',',descto);


       end;
                                

              if (cod_cli = 'C21L') and  (csucursal.text = 'CEDIS') THEN
              BEGIN

               totdes:= 1;


               qsacapor2.close;
               qsacapor2.ParamByName('cod_cli').asstring := 'C21L';
               qsacapor2.ParamByName('sucu').asstring := 'CEDIS';
               qsacapor2.Open;

               CASITOT:= qsacapor2.fieldbyname('porce').AsString;

            //   CASITOT:= '.0649';


               descto:= floattostrf((strtofloat(TOTAL)  * strtofloat(casitot)),ffnumber,10,2);
               descto := stripped(',',descto);


              end;



            if (cod_cli = 'C21L') and  (csucursal.text = 'OJINAGA') THEN
               BEGIN

               totdes:= 1;

               qsacapor2.close;
               qsacapor2.ParamByName('cod_cli').asstring := 'C21L';
               qsacapor2.ParamByName('sucu').asstring := 'OJINAGA';
               qsacapor2.Open;

               CASITOT:= qsacapor2.fieldbyname('porce').AsString;

            //   CASITOT:= '.1619';


               descto:= floattostrf((strtofloat(TOTAL)  * strtofloat(casitot)),ffnumber,10,2);
               descto := stripped(',',descto);


          end;



          if (cod_cli = 'C2100L')   THEN
             BEGIN

               totdes:= 1;

               qsacapor.close;
               qsacapor.ParamByName('cod_cli').asstring := 'C2100L';
               qsacapor.Open;

               CASITOT:= qsacapor.fieldbyname('porce').AsString;

           //    CASITOT:= '.157';


               descto:= floattostrf((strtofloat(TOTAL) * strtofloat(casitot)),ffnumber,10,2);
               descto := stripped(',',descto);


             end;





      if (cod_cli = 'A95F')  THEN
      BEGIN

              qsacades.close;
              qsacades.parambyname('sucursal').asstring :=  csucursal.text;
              qsacades.parambyname('cod_cli').asstring :=  cod_cli;
              qsacades.open;


              porce_cte:= qsacades.fieldbyname('descto').asfloat;


              if csucursal.text = '' then
               begin
                   totdes:= 1;

                  qsacapor.close;
                  qsacapor.ParamByName('cod_cli').asstring := 'A95F';
                  qsacapor.Open;

                  CASITOT:= qsacapor.fieldbyname('porce').AsString;

                  //CASITOT:= '.324';

                   descto:= floattostrf((strtofloat(TOTAL)  * strtofloat(casitot)),ffnumber,10,2);
                   descto := stripped(',',descto);

                   IF IVA <> 0 THEN
                   BEGIN


                 //    TOTALIVA1:= floattostrf(TOTAL / 1.16), ffnumber,10,2) ;

                      TOTALPREIVA:= floattostrf((STRTOFLOAT(PRE_PRO.TEXT) / 1.16), ffnumber,10,2) ;
                      TOTALPREIVA:= STRIPPED(',',totalpreiva);


                      TOTALTOIVA:= FLOATTOSTRF((STRTOFLOAT(TOTALPREIVA) * STRTOFLOAT(MULTI)),FFNUMBER,10,2);
                      TOTALTOIVA := STRIPPED(',',TOTALTOIVA);

                      descto:= floattostrf((strtofloat(TOTALTOIVA)  * porce_cte),ffnumber,10,2);
                      descto := stripped(',',descto);


                      descto_iva :=  floattostrf((STRTOFLOAT(totaltoiva) - strtofloat(descto)), ffnumber,10,2) ;
                      descto_iva:= floattostrf((STRTOFLOAT(descto_iva)), ffnumber,10,2) ;


                      TOTALIVA1 := FLOATTOSTRF((STRTOFLOAT(DESCTO_IVA) * 1.16),FFNUMBER,10,2);

                      totaliva1:= stripped (',', totaliva1);

                      totiva1 := strtofloat(totaliva1);


                      TOTIVA33:= FLOATTOSTRF((STRTOFLOAT(TOTALIVA1) - STRTOFLOAT(descto_iva)),FFNUMBER,10,2);
                      TOTIVA33:= STRIPPED(',',TOTIVA33);
                END
                ELSE
                    TOTIVA33:= '0';



               end
               else
               begin
                   totdes:= 1;

                   qsacapor2.close;
                   qsacapor2.ParamByName('cod_cli').asstring := 'A95F';
                   qsacapor2.ParamByName('sucu').asstring := 'ALGO';
                   qsacapor2.Open;

                   CASITOT:= qsacapor2.fieldbyname('porce').AsString;

                  //  CASITOT:= '.16';
                   descto:= floattostrf((strtofloat(TOTAL)  * strtofloat(casitot)),ffnumber,10,2);
                   descto := stripped(',',descto);


                   IF IVA <> 0 THEN
                BEGIN


                 //    TOTALIVA1:= floattostrf(TOTAL / 1.16), ffnumber,10,2) ;

                      TOTALPREIVA:= floattostrf((STRTOFLOAT(PRE_PRO.TEXT) / 1.16), ffnumber,10,2) ;
                      TOTALPREIVA:= STRIPPED(',',totalpreiva);


                      TOTALTOIVA:= FLOATTOSTRF((STRTOFLOAT(TOTALPREIVA) * STRTOFLOAT(MULTI)),FFNUMBER,10,2);
                      TOTALTOIVA := STRIPPED(',',TOTALTOIVA);

                      descto:= floattostrf((strtofloat(TOTALTOIVA)  * porce_cte),ffnumber,10,2);
                      descto := stripped(',',descto);


                      descto_iva :=  floattostrf((STRTOFLOAT(totaltoiva) - strtofloat(descto)), ffnumber,10,2) ;
                      descto_iva:= floattostrf((STRTOFLOAT(descto_iva)), ffnumber,10,2) ;


                      TOTALIVA1 := FLOATTOSTRF((STRTOFLOAT(DESCTO_IVA) * 1.16),FFNUMBER,10,2);

                      totaliva1:= stripped (',', totaliva1);

                      totiva1 := strtofloat(totaliva1);


                      TOTIVA33:= FLOATTOSTRF((STRTOFLOAT(TOTALIVA1) - STRTOFLOAT(descto_iva)),FFNUMBER,10,2);
                      TOTIVA33:= STRIPPED(',',TOTIVA33);
                END
                ELSE
                    TOTIVA33:= '0';




               end;

      end;





      if totdes <> 1 then
           descto := '';



       {
                   if ((cod_CLI = 'O07F') and not(strtoint(lin_ven) in [0,4, 6, 7, 10,13,14,15,16,17,27,36,
                43,44,45,51,54,55,56,57,58,59,61,64,72,76,78,80, 91,92,94,99,101,106,116,
                 118,132,150,154,157,159])) then
             begin
               totdes:= 1;

               CASITOT:= (totdes + (2/100));

               descto:= TOTAL  * (CASITOT-1);

             end
             else
               descto:= 0;       }





              //aqui estoy poniendo que no se ejecute la revision de precios Zefe el dia 18 de feb 2026
          //    verifica;



          //   IF (SIKEDO = 0) AND (COD_CLI <> 'E257L') AND (SIKEDO2 = 0) THEN
               VERIFICA2;

             IF COD_CLI = 'E257L' THEN
             BEGIN
                  SIKEDO := 1;
                //  SIKEDO2 := 1;

             END;



                IF (SIKEDO = 1)   THEN
                BEGIN


        //aqui valido si se esta buscando folio y si estoy dando de alta nuevo prod se le asigna un nuevo folio y se agregan los datos
       //en la tabla de ventas con este nuevo folio solo una vez se agregan ya despues solo el nuevo
      {
                if (busfolio.Text  <> '') and (agregaruno = 0) then
                begin


                  qventas.Close;
                  qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                  qventas.ParamByName('folio').AsString:= sitienefolio;
                  qventas.Open;


                  while not qventas.Eof do

                  begin

                      inserta_ventas.params[0].AsString:= tfolio.Text;
                      inserta_ventas.params[1].AsString:= qventas.fieldbyname('descripcion').AsString;
                      inserta_ventas.params[2].AsString:= qventas.fieldbyname('codigo').AsString;
                      inserta_ventas.params[3].AsString:= qventas.fieldbyname('cajas').AsString;
                      inserta_ventas.params[4].AsString:= qventas.fieldbyname('kilos').AsString;
                      inserta_ventas.params[5].AsSTRING:= qventas.fieldbyname('precio').AsString;
                      inserta_ventas.params[6].AsSTRING:= qventas.fieldbyname('total').AsString;
                      inserta_ventas.params[7].AsString:= qventas.fieldbyname('nombre').AsString;
                      inserta_ventas.params[8].AsString:= qventas.fieldbyname('iva').AsString;
                      inserta_ventas.params[9].AsString:= qventas.fieldbyname('cos_pro').AsString;
                      inserta_ventas.params[10].AsSTRING:= qventas.fieldbyname('totiva').AsString;
                      inserta_ventas.params[11].AsINTEGER:= qventas.fieldbyname('renglon').Asinteger;
                      inserta_ventas.params[12].AsINTEGER:=qventas.fieldbyname('pagado').asinteger;;
                      inserta_ventas.params[13].AsString:= qventas.fieldbyname('rfc').AsString;
                      inserta_ventas.params[14].AsString:= qventas.fieldbyname('tipo').AsString;
                      inserta_ventas.params[15].AsString:= qventas.fieldbyname('lineaven').AsString;
                      inserta_ventas.params[16].Asstring:= qventas.fieldbyname('descto').AsString;
                      inserta_ventas.params[17].AsString:= qventas.fieldbyname('pedido').AsString;
                      inserta_ventas.params[18].AsString:= qventas.fieldbyname('observacion').AsString;
                      inserta_ventas.params[19].AsString:= qventas.fieldbyname('sucursal').AsString;
                      inserta_ventas.params[20].AsString:= qventas.fieldbyname('num_emp').AsString;
                      inserta_ventas.ExecProc;


                       reng:= reng + 1;
                       NUM_ARTICULOS:= NUM_ARTICULOS + 1;
                       agregaruno := 1;

                       qventas.next;

                  end;
               end;   }


                              reng:= reng + 1;

                              NUM_ARTICULOS:= NUM_ARTICULOS + 1;

                      sacatotal;

                      //aqui cambiamos por si se equivocan de RFC

                      if RFC_TMp <> TRFC.TEXT then
                          begin

                              qcambiarfc.Close;
                              qcambiarfc.ParamByName('folio').AsString:= tfolio.Text;
                              qcambiarfc.ParamByName('num_emp').AsString:= num_empresa.text;
                              QCAMBIARFC.PARAMBYNAME('RFC').ASSTRING:= TRFC.TEXT;
                              qcambiarfc.ExecSQL;

                          end;


                {      IF (LIN_VEN = '1') AND (tipo_fac.ItemIndex = 1) THEN
                      BEGIN

                      inserta_ventas.params[0].AsString:= tfolio.Text;
                      inserta_ventas.params[1].AsString:= descripart.text;
                      inserta_ventas.params[2].AsString:= codigoART.text;
                      inserta_ventas.params[3].AsString:= caj_pro.text;
                      inserta_ventas.params[4].AsString:= kil_pro.Text;
                      inserta_ventas.params[5].AsSTRING:= pre_pro.text;
                      inserta_ventas.params[6].Asfloat:= total;
                      inserta_ventas.params[7].AsString:= form4.agente1;
                      inserta_ventas.params[8].AsString:= INTTOSTR(IVA);
                      inserta_ventas.params[9].AsString:= '0';
                      inserta_ventas.params[10].Asfloat:= TOTIVA;
                      inserta_ventas.params[11].AsINTEGER:= reng;
                      inserta_ventas.params[12].AsINTEGER:= 1;
                      inserta_ventas.params[13].AsString:= Trfc.TEXT;
                      inserta_ventas.params[14].AsString:= tip_aRT;
                      inserta_ventas.params[15].AsString:= lin_ven;
                      inserta_ventas.params[16].Asfloat:= descto;
                      inserta_ventas.params[17].AsString:= edit2.Text;
                      inserta_ventas.params[18].AsString:= OBSERVA.text;
                      inserta_ventas.params[19].AsString:= CSUCURSAL.Text;
                      inserta_ventas.params[20].AsString:= '05';
                      inserta_ventas.ExecProc;

                      END
                      ELSE
                      BEGIN    }
                      //ESTO LO AGREGO PARA SEPARAR EL TICKET DEL AGUACATE

                      CAMBIO_TOTAL := total;
                      CAMBIO_TOTAL := STRIPPED(',', CAMBIO_TOTAL);

                      CAMBIO_TOTIVA := TOTIVA33;
                      CAMBIO_TOTIVA := STRIPPED(',', CAMBIO_TOTIVA);

                      IF  (STRTOFLOAT(IEPS_ST) <> 0) OR (IVA <> 0) THEN
                      BEGIN
                            PRESINTO := TOTALPREIVA;
                            CAMBIO_TOTAL := TOTALTOIVA;
                      END
                      ELSE
                           PRESINTO := PRE_PRO.TEXT;


                      if EDIT3.text <> '' then
                            BEGIN
                                foliotmp := EDIT3.TEXT;
                                TRFC.TEXT :=  rfc_cam;
                      //          AGENTE_ORI := FORM4.AGENTE1;
                      //          FORM4.AGENTE1:= nombre_cam;
                                EDIT2.TEXT := EDIT3.TEXT;

                            END
                              else
                                foliotmp:= tfolio.text;

                      inserta_ventas.params[0].AsString:= foliotmp;
                      inserta_ventas.params[1].AsString:= descripart.text;
                      inserta_ventas.params[2].AsString:= codigoART.text;
                      if FIdPresentacionSel > 0 then
                        inserta_ventas.params[3].AsString:= FloatToStr(FCajasCalc)
                      else
                        inserta_ventas.params[3].AsString:= caj_pro.text;
                      inserta_ventas.params[4].AsString:= kil_pro.Text;
                      inserta_ventas.params[5].AsSTRING:= PRESINTO;
                      inserta_ventas.params[6].AsSTRING:= CAMBIO_total;
                      inserta_ventas.params[7].AsString:= form4.agente1;
                      inserta_ventas.params[8].AsString:= INTTOSTR(IVA);
                      inserta_ventas.params[9].AsString:= '0';
                      inserta_ventas.params[10].AsSTRING:= CAMBIO_TOTIVA;
                      inserta_ventas.params[11].AsINTEGER:= reng;
                      inserta_ventas.params[12].AsINTEGER:= 1;
                      inserta_ventas.params[13].AsString:= Trfc.TEXT;
                      inserta_ventas.params[14].AsString:= tip_aRT;
                      inserta_ventas.params[15].AsString:= lin_ven;
                      inserta_ventas.params[16].Asstring:= descto;
                      inserta_ventas.params[17].AsString:= edit2.Text;
                      inserta_ventas.params[18].AsString:= OBSERVA.text;
                      inserta_ventas.params[19].AsString:= CSUCURSAL.Text;
                      inserta_ventas.params[20].AsString:= NUM_EMPRESA.Text;
                 //     inserta_ventas.params[21].AsString:= UFORMPRESENTACION.IDPRESENTACION;
                      inserta_ventas.ExecProc;



                        // === NUEVO ===
                      if FIdPresentacionSel > 0 then
                      begin
                        qmarcapresentacion.Close;
                        qmarcapresentacion.ParamByName('emp').AsString    := NUM_EMPRESA.Text;
                        qmarcapresentacion.ParamByName('folio').AsString := foliotmp;
                        qmarcapresentacion.ParamByName('reng').AsInteger  := reng;
                        qmarcapresentacion.ParamByName('idpres').AsInteger := FIdPresentacionSel;
                        qmarcapresentacion.ExecSQL;
                      end;





                     // si tiene ieps voy a hacer un update a ventas

                     if STRTOFLOAT(totieps33) <> 0 then
                     begin

                      vtasieps.close;
                      vtasieps.parambyname('folio').asstring := foliotmp;
                      vtasieps.parambyname('codigo').asstring := codigoart.text;
                      vtasieps.parambyname('renglon').asinteger := RENG;
                      vtasieps.parambyname('totieps').asstring := totieps33;
                      vtasieps.execsql;

                     end;



                      //AQUI DESPLEGAMOS EL DBGRID

                   {      if busfolio.text <> '' then
                                foliotmp := sitienefolio
                              else
                                foliotmp:= tfolio.text;  }


                       qventas.Close;
                       qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                       qventas.ParamByName('folio').AsString:= foliotmp;
                       qventas.Open;


                       RFC_TMP:= TRFC.TEXT;

                            totart.Text:= inttostr(NUM_ARTICULOS);

                       SIKEDO := 0;
                       SIKEDO2 := 0;

                       DESCRIPART.Text:= '';
                       CAJ_PRO.Text:= '';
                       KIL_PRO.Text:= '';
                       PRE_PRO.Text:= '';
                    //   OBSERVA.Text:= '';

                       pre_pro.ReadOnly:= false;
                       CODIGOART.SetFocus;



                       YA_PUSE_RFC := 1;
                       TOT:= STRTOFLOAT(MEMO1.Text);
                END;

       END;

      end;

END;


procedure tform9.verifica2;
var
   POR_EMP, precioinicio, preciofin: real;
begin



precioinicio := 0;
preciofin := 0;

qbusprecio.close;
qbusprecio.parambyname('cod_art').asstring :=  codigoart.text;
qbusprecio.open;




while not qbusprecio.eof do
begin

                          QCODIGO.close;
                          QCODIGO.parambyname('cod_art').AsString:= CODIGOART.Text;
                          qcodigo.parambyname('num_Emp').asstring:= num_empresa.text;
                          QCODIGO.Open;


       IF PRE_PRO.TEXT = '0' THEN
                   BEGIN
                        SHOWMESSAGE('REVISA PRECIO');
                        PRE_PRO.SETFOCUS;
                        EXIT;
                   END;

       if strtofloat(QCODIGO.fieldbyname('can_emp').AsString ) = 0 then
              begin
                showmessage('El CanEmp del Producto esta en Ceros');
                exit;
              end;


        if (strtofloat(caj_pro.Text) <> 0) and (strtofloat(kil_pro.text) <> 0) then
            begin
                por_emp := strtofloat(kil_pro.text) / strtofloat(caj_pro.text);

                if ((por_emp) < STRTOFLOAT(QCODIGO.FieldByName('min_emp').asstring)) or ((por_emp) > STRTOFLOAT(QCODIGO.FieldByName('mAX_emp').AsString)) then
                          begin
                              form12.boton1.Caption := 'REVISA KGS O CAJ';
                             FORM12.showmodal;

                              showmessage('El Minimo Empaque es: '+ QCODIGO.FieldByName('min_emp').asstring+'el Maximo es: '+QCODIGO.FieldByName('max_emp').asstring);


                              exit;
                           end;
            //   SIKEDO2:= 1;
             END;








     //primero checo con el precio de menudeo y veo si esta en el rango
     if qbusprecio.fieldbyname('menudeo').asstring <> '0' then
        begin
	        if qbusprecio.fieldbyname('ban_men').asstring <>'0' then
             begin
                precioinicio:= qbusprecio.fieldbyname('menudeo').asfloat - qbusprecio.fieldbyname('ban_men').asfloat;
	              preciofin:= qbusprecio.fieldbyname('menudeo').asfloat + qbusprecio.fieldbyname('ban_men').asfloat;
             end;



             if (strtofloat(pre_pro.Text) >= precioinicio) and (strtofloat(pre_pro.Text) <= preciofin) then
                     begin
			                   sikedo:= 1;
                         SIKEDO2:= 1;
                         break;
	                   end;

        	end;

           //primero checo con el precio de mayoreo y veo si esta en el rango
      if qbusprecio.fieldbyname('mayoreo').asstring <> '0' then
        begin

             if qbusprecio.fieldbyname('ban_may').asstring <>'0' then
                 begin
                   precioinicio:= qbusprecio.fieldbyname('mayoreo').asfloat - qbusprecio.fieldbyname('ban_may').asfloat;
	                 preciofin:= qbusprecio.fieldbyname('mayoreo').asfloat + qbusprecio.fieldbyname('ban_may').asfloat;
                 end;



            if (strtofloat(pre_pro.Text) >= precioinicio) and (strtofloat(pre_pro.Text) <= preciofin) then
                     begin
                         sikedo:= 1;
                         SIKEDO2:= 1;
                         break;
                     end;

      	end;

   

   qbusprecio.next;

end;


 IF (qbusprecio.fieldbyname('menudeo').asstring = '') OR (qbusprecio.fieldbyname('mayoreo').asstring = '') THEN
 BEGIN
      SIKEDO:= 1;
      SIKEDO2:= 1;
 END;



IF SIKEDO = 0 then
  BEGIN
    FORM12.boton1.caption:= 'Revisa Precio';
    FORM12.showmodal;
  END;

end;

procedure tform9.verifica;
var
 can_cajas, CAJCOSPROmin, CAJCOSPROmax,kgscospromin, kgscospromax, PRECIOKG, cajasconve, precio_vta, por_emp, caj_tot, pre1, pre2, kil_tot: real;
begin
can_cajas := 0;

                   IF PRE_PRO.TEXT = '0' THEN
                   BEGIN
                        SHOWMESSAGE('REVISA PRECIO');
                        PRE_PRO.SETFOCUS;
                        EXIT;
                   END;

                   {IF (LIN_VEN = '1') AND (tipo_fac.ItemIndex = 1) THEN
                      BEGIN
                         QCODIGO.close;
                         QCODIGO.parambyname('cod_art').AsString:= CODIGOART.Text;
                         qcodigo.parambyname('num_Emp').asstring:= '05';
                         QCODIGO.Open;
                      END
                      ELSE
                      BEGIN}
                          QCODIGO.close;
                          QCODIGO.parambyname('cod_art').AsString:= CODIGOART.Text;
                          qcodigo.parambyname('num_Emp').asstring:= num_empresa.text;
                          QCODIGO.Open;
                     // END;

              if strtofloat(QCODIGO.fieldbyname('can_emp').AsString ) = 0 then
              begin
                showmessage('El CanEmp del Producto esta en Ceros');
                exit;
              end;

if QCODIGO.FieldByName('tip_art').asstring = 'K' then
    begin
        if (strtofloat(caj_pro.Text) =0) and (strtofloat(kil_pro.Text) <> 0) then
          begin
                if strtofloat(kil_pro.Text) >  strtofloat(QCODIGO.FieldByName('min_emp').AsString) then
                    begin
                        FORM12.boton1.caption:= 'Captura las Cajas';
                        FORM12.showmodal;
                        exit;
                    end
                    else
                      BEGIN
                        IF strtofloat(QCODIGO.fieldbyname('cos_pro_kgs').asstring) = 0 THEN
                         BEGIN
                          SHOWMESSAGE('REVISA EL COSTO PROMEDIO');
                          EXIT;
                         END
                           ELSE
                             precio_vta:= (strtofloat(pre_pro.Text) / strtofloat(QCODIGO.fieldbyname('cos_pro_kgs').asstring)) -1 ;
                      END;



                    if  ((precio_vta) < strtofloat(QCODIGO.FieldByName('min_pre').asstring)) or ((precio_vta) > strtofloat(QCODIGOART.fieldbyname('max_pre').asstring))
                         then
                          begin
                               kgscospromin:= strtofloat(QCODIGO.fieldbyname('cos_pro_kgs').asstring)*(1+strtofloat(QCODIGO.FieldByName('min_PRE').AsString));
                               IF (strtofloat(QCODIGO.FieldByName('mAX_PRE').AsString))  < 1 THEN
                                     kgscospromax:= strtofloat(QCODIGO.fieldbyname('cos_pro_KGS').asstring)*(1+strtofloat(QCODIGO.FieldByName('mAX_PRE').AsString))
                                  ELSE
                                     kgscospromax:= strtofloat(QCODIGO.fieldbyname('cos_pro_KGS').asstring)*(strtofloat(QCODIGO.FieldByName('mAX_PRE').AsString));


                             if (desblo_precio = 0) then
                              begin
                              FORM12.boton1.caption:= 'Revisa Precio';
                              FORM12.showmodal;
                          //    showmessage('El Costo minimo es: '+ floattostrf(kgscospromin,ffnumber,10,2)+'El Costo Maximo es: '+floattostrf(kgscospromax,ffnumber,10,2));
                              exit;
                              end;
                         end;

          end;


        if  (strtofloat(caj_pro.Text) <> 0) and (strtofloat(kil_pro.Text) = 0) then
            begin

                        FORM12.boton1.caption:= 'Captura las Cajas';
                        FORM12.showmodal;
            exit;

            end;



        if (strtofloat(caj_pro.Text) <> 0) and (strtofloat(kil_pro.text) <> 0) then
            begin
                por_emp := strtofloat(kil_pro.text) / strtofloat(caj_pro.text);

                if ((por_emp) < STRTOFLOAT(QCODIGO.FieldByName('min_emp').asstring)) or ((por_emp) > STRTOFLOAT(QCODIGO.FieldByName('mAX_emp').AsString)) then
                          begin
                              FORM12.boton1.caption:= 'Revisa KGS o CAJ';
                              FORM12.showmodal;

                              showmessage('El Minimo Empaque es: '+ QCODIGO.FieldByName('min_emp').asstring+'el Maximo es: '+QCODIGO.FieldByName('max_emp').asstring);


                          exit;
                           end;
                IF strtofloat(QCODIGO.fieldbyname('cos_pro_kgs').asstring) = 0 THEN
                      BEGIN
                          SHOWMESSAGE('REVISA EL COSTO PROMEDIO');
                          EXIT;
                      END
                      ELSE
                          precio_vta:= (strtofloat(pre_pro.Text) / strtofloat(QCODIGO.fieldbyname('cos_pro_kgs').asstring)) -1 ;


                if ((precio_vta) < strtofloat(QCODIGO.FieldByName('min_pre').asstring)) or ((precio_vta) > strtofloat(QCODIGO.fieldbyname('max_pre').asstring)) then
                          begin
                              kgscospromin:= strtofloat(QCODIGO.fieldbyname('cos_pro_kgs').asstring)*(1+strtofloat(QCODIGO.FieldByName('min_PRE').AsString));
                               IF (strtofloat(QCODIGO.FieldByName('mAX_PRE').AsString)) < 1 THEN
                                     kgscospromax:= strtofloat(QCODIGO.fieldbyname('cos_pro_KGS').asstring)*(1+strtofloat(QCODIGO.FieldByName('mAX_PRE').AsString))
                                  ELSE
                                     kgscospromax:= strtofloat(QCODIGO.fieldbyname('cos_pro_KGS').asstring)*(strtofloat(QCODIGO.FieldByName('mAX_PRE').AsString));


                                if (desblo_precio = 0) then
                                begin
                               FORM12.boton1.caption:= 'Revisa Precio Producto';
                               FORM12.showmodal;
                           //    showmessage('El Costo minimo es: '+ floattostrf(kgscospromin,ffnumber,10,2)+'El Costo Maximo es: '+floattostrf(kgscospromax,ffnumber,10,2));
                               exit;
                                end;
                          end;

            end;

        { if (CAJ_pro.text = '0') then
                    begin
                       can_CAJAS := strtofloat(kil_pro.text) / strtofloat(qcodigo.fieldbyname('can_emp').asstring);
                       caj_pro.text:= floattostrf(can_cajas, ffnumber, 10,2);
                       caj_pro.text:= stripped(',',caj_pro.text);
                    end;}
       SIKEDO := 1;
       SIKEDO2 := 1;
    end;





    if QCODIGO.FieldByName('tip_art').asstring = 'C' then
    begin
          if  (strtofloat(caj_pro.Text) =0) and (strtofloat(kil_pro.Text) <> 0) then
            BEGIN
                   if STRTOFLOAT(KIL_PRO.TEXT) >  strtofloat(qcodigo.FieldByName('min_emp').AsString) THEN
                     begin
                        FORM12.boton1.caption:= 'Captura las Cajas';
                        FORM12.showmodal;

                        exit;
                    end
                    ELSE
                    BEGIN
                        IF strtofloat(qcodigo.fieldbyname('cos_pro_kgs').asstring) = 0 THEN
                         BEGIN
                          SHOWMESSAGE('REVISA EL COSTO PROMEDIO');
                          EXIT;
                         END
                          ELSE
                             PRECIOKG := (strtofloat(pre_pro.Text)/ strtofloat(qcodigo.fieldbyname('cos_pro_KGS').asstring)) -1;


                     if ((precioKG) < strtofloat(qcodigo.FieldByName('min_pre').asstring)) or ((precioKG) > strtofloat(qcodigo.fieldbyname('max_pre').asstring)) then
                          begin
                               kgscospromin:= strtofloat(qcodigo.fieldbyname('cos_pro_kgs').asstring)*(1+strtofloat(qcodigo.FieldByName('min_PRE').AsString));
                               IF (strtofloat(qcodigo.FieldByName('mAX_PRE').AsString)) < 1 THEN
                                     kgscospromax:= strtofloat(qcodigo.fieldbyname('cos_pro_KGS').asstring)*(1+strtofloat(qcodigo.FieldByName('mAX_PRE').AsString))
                                  ELSE
                                     kgscospromax:= strtofloat(qcodigo.fieldbyname('cos_pro_KGS').asstring)*(strtofloat(qcodigo.FieldByName('mAX_PRE').AsString));

                           if (desblo_precio = 0) then
                           begin
                          FORM12.boton1.caption:= 'Revisa Precio';
                          FORM12.showmodal;
                        //    showmessage('El Costo minimo es: '+ floattostrf(kgscospromin,ffnumber,10,2)+'El Costo Maximo es: '+ floattostrf(kgscospromax,ffnumber,10,2));
                            exit;
                            end;
                          end;
                     END;
            END;



            if  (strtofloat(caj_pro.Text) <>0) and (strtofloat(kil_pro.Text) = 0) then
               BEGIN


                      IF strtofloat(qcodigo.fieldbyname('cos_pro_kgs').asstring) = 0 THEN
                      BEGIN
                          SHOWMESSAGE('REVISA EL COSTO PROMEDIO');
                          EXIT;
                      END
                      ELSE
                        precio_vta:= (strtofloat(pre_pro.Text) / strtofloat(qcodigo.fieldbyname('cos_pro_CAJ').asstring)) -1 ;


                if ((precio_vta) < strtofloat(qcodigo.FieldByName('min_pre').asstring)) or ((precio_vta) > strtofloat(qcodigo.fieldbyname('max_pre').asstring))
                   then
                          begin
                          cajcospromin:= strtofloat(qcodigo.fieldbyname('cos_pro_CAJ').asstring)* (1+strtofloat(qcodigo.FieldByName('min_pre').asstring));
                          IF (strtofloat(qcodigo.FieldByName('max_pre').asstring)) < 1 THEN
                                   cajcospromax:= strtofloat(qcodigo.fieldbyname('cos_pro_CAJ').asstring)* (1+strtofloat(qcodigo.FieldByName('max_pre').asstring))
                                ELSE
                                   cajcospromax:= strtofloat(qcodigo.fieldbyname('cos_pro_CAJ').asstring)* strtofloat(qcodigo.FieldByName('max_pre').asstring);
                           if (desblo_precio = 0) then
                           begin
                          FORM12.boton1.caption:= 'Revisa Precio';
                           FORM12.showmodal;
                    //       showmessage('El Costo Minimo es:  '+floattostrf(cajcospromin,ffnumber,10,2)+'El Costo Maximo es: '+floattostrf(cajcospromax,ffnumber,10,2));
                            exit;
                            end;
                          end;


              END;


        if (strtofloat(caj_pro.Text) <> 0) and (strtofloat(kil_pro.text) <> 0) then
            begin
                por_emp := strtofloat(kil_pro.text) / strtofloat(caj_pro.text);

                if ((por_emp) < strtofloat(qcodigo.FieldByName('min_emp').asstring)) or ((por_emp) > strtofloat(qcodigo.FieldByName('mAX_emp').AsString)) then
                          begin

                              FORM12.boton1.caption:= 'Revisa KGs o CAJ';
                              FORM12.showmodal;
                              showmessage('El Minimo Empaque es: '+ qcodigo.FieldByName('min_emp').asstring+'el Maximo es: '+qcodigo.FieldByName('max_emp').asstring);
                              exit;
                           end;


                 IF strtofloat(qcodigo.fieldbyname('cos_pro_kgs').asstring) = 0 THEN
                      BEGIN
                          SHOWMESSAGE('REVISA EL COSTO PROMEDIO');
                          EXIT;
                      END
                      ELSE
                         precio_vta:= (strtofloat(pre_pro.Text) / strtofloat(qcodigo.fieldbyname('cos_pro_KGS').asstring)) -1 ;


                if ((precio_vta) < strtofloat(qcodigo.FieldByName('min_pre').asstring)) or ((precio_vta) > strtofloat(qcodigo.fieldbyname('max_pre').asstring)) then
                          begin
                               kgscospromin:= strtofloat(qcodigo.fieldbyname('cos_pro_kgs').asstring)*(1+strtofloat(qcodigo.FieldByName('min_PRE').AsString));
                               IF (strtofloat(qcodigo.FieldByName('mAX_PRE').AsString)) < 1 THEN
                                     kgscospromax:= strtofloat(qcodigo.fieldbyname('cos_pro_KGS').asstring)*(1+strtofloat(qcodigo.FieldByName('mAX_PRE').AsString))
                                  ELSE
                                     kgscospromax:= strtofloat(qcodigo.fieldbyname('cos_pro_KGS').asstring)*(strtofloat(qcodigo.FieldByName('mAX_PRE').AsString));

                                if (desblo_precio = 0) then
                                begin
                              FORM12.boton1.caption:= 'Revisa Precio';
                              FORM12.showmodal;
                    //           showmessage('El Costo minimo es: '+ floattostrf(kgscospromin, ffnumber,10,2)+'El Costo Maximo es: '+floattostrf(kgscospromax,ffnumber,10,2));
                              exit;
                                end;
                           end;





              end;
             {if (caj_pro.text = '0') then
                    begin
                       can_cajas := strtofloat(kil_pro.text) /strtofloat(qcodigo.fieldbyname('can_emp').asstring);
                       caj_pro.text:= floattostrf(can_cajas, ffnumber, 10,2);
                       caj_pro.text:= stripped(',',caj_pro.text);
                    end; }


        SIKEDO := 1;
        SIKEDO2 := 1;
   END;

END;


function Tform9.stripped(stripchar : char; str : string) : string;
 var
   tmpstr : string;
 begin
   tmpstr := str;
   while pos(stripchar, tmpstr) > 0 do
     delete(tmpstr, pos(stripchar, tmpstr), 1);
   stripped := tmpstr;
 end;

// nuevo ===================
function TForm9.PrecioPresentacion(const PrecioTexto: string): string;
var
  P: Double;
begin
  if PrecioTexto = '' then begin Result := PrecioTexto; Exit; end;
  P := StrToFloat(PrecioTexto);
  if FPrecioDerivadoSel then
    P := P * FFactorPresentacion;
  Result := FloatToStrF(P, ffFixed, 10, 2);
end;

function TForm9.BuscaCanEmp(const CodArt: string): Double;
begin
  Result := 0;
  qBuscaCanEmp.Close;
  qBuscaCanEmp.SQL.Text :=
    'SELECT can_emp FROM inarinv WHERE num_emp = :emp AND cod_art = :cod';
  qBuscaCanEmp.ParamByName('emp').AsString := NUM_EMPRESA.Text;
  qBuscaCanEmp.ParamByName('cod').AsString := Trim(CodArt);
  qBuscaCanEmp.Open;
  if not qBuscaCanEmp.Eof then
    Result := qBuscaCanEmp.FieldByName('can_emp').AsFloat;
  qBuscaCanEmp.Close;
end;
//===========================

procedure TForm9.CODIGOARTKeyPress(Sender: TObject; var Key: Char);
var
    SITIENECOTI, sirestau : integer;
    PRE1F : REAL;
begin
     IF KEY = (#13) THEN
      BEGIN

      sirestau:= 0;
      SITIENECOTI := 0;
      PRE1F:= 0;

      // === NUEVO: resolver presentacion ANTES de cualquier busqueda de precio ===
      if not TFormPresentacion.Seleccionar(Database1, CODIGOART.Text, 'V',
             FIdPresentacionSel, FCodArtResuelto, FFactorPresentacion,
             FPrecioDerivadoSel, FTaraSel, FEsVariableSel) then
      begin
        Key := #0;
        Exit; // cancelo, no se toca el articulo
      end;
      CODIGOART.KEYVALUE := FCodArtResuelto;
      // ==========================================================================

      qbusat.close;
      qbusat.parambyname('cod_colesa').asstring := codigo;
      qbusat.open;

      if qbusat.fieldbyname('cod_colesa').asstring = '' then
      begin
           showmessage('NO tiene asignado codigo en SAT REVISA');
           exit;
      end
      else
          cod_sat:= qbusat.fieldbyname('cod_sat').asstring;




      QBUSCACO.Close;
      qBUSCACO.parambyname('cod_cli').AsString:= cod_CLI;
      QBUSCACO.Open;


      if  QBUSCACO.FieldByName('COD_CLI').AsString <> ''
       THEN

        BEGIN

          desblo_precio:= 1;

          qcotiza.Close;
          qcotiza.parambyname('cod_cli').AsString:= cod_CLI;
          qcotiza.parambyname('cod_art').AsString:= codIGOART.Text;
          qcotiza.ParamByName('fecha').asdate:= fechAVIENTOS.Date;
          qcotiza.Open;


          if qcotiza.fieldbyname('Precio').AsString = '' then
             begin
               showmessage('Este codigo no esta en la cotizacion');
               FORM11.SHOWMODAL;

                IF SIKEDO = 1 THEN
                  BEGIN
                   CAJ_PRO.SetFocus;
                    sikedo := 0;
                   PRE_PRO.ReadOnly:= FALSE;
                   KIL_PRO.ReadOnly:= FALSE;
                   CAJ_PRO.ReadOnly:= FALSE;
                 end
                ELSE
                  BEGIN
                     SHOWMESSAGE('CLAVE ERRONEO');
                     PRE_PRO.ReadOnly:= TRUE;
                     KIL_PRO.ReadOnly:= TRUE;
                     CAJ_PRO.ReadOnly:= TRUE;
                     ACHI:= 1;
                  END;
              END
            ELSE
              BEGIN
//cambia x PrecioPresentacion ======= pre_pro.Text:= qcotiza.fieldbyname('precio').AsString;
                pre_pro.Text:= PrecioPresentacion(qcotiza.fieldbyname('precio').AsString);
                PRE_PRO.ReadOnly:= FALSE;
                KIL_PRO.ReadOnly:= FALSE;
                CAJ_PRO.ReadOnly:= FALSE;
                CAJ_PRO.SetFocus;
                CAJ_PRO.SelectAll;
                SIKEDO := 1;
                SIKEDO2 := 1;

                SITIENECOTI := 1;

              END;

              //reviso que este cliente con coti no tenga precio rest.
               qresta.close;
               qresta.parambyname('cod_cli').asstring := cod_cli;
               qresta.open;

               IF (QRESTA.FIELDBYNAME('COD_CLI').ASSTRING  <> '') AND (SITIENECOTI = 1) then
                      begin
                          showmessage('Este Cliente tiene precio de Rest. y cotizacion Revisalo');
                          sirestau := 1;
                      end;


                //reviso que este cliente con coti no tenga precio rest.
               qrestaMEN.close;
               qrestaMEN.parambyname('cod_cli').asstring := cod_cli;
               qrestaMEN.open;

               IF (QRESTAMEN.FIELDBYNAME('COD_CLI').ASSTRING  <> '') AND (SITIENECOTI = 1) then
                      begin
                          showmessage('Este Cliente tiene precio de Rest. y cotizacion Revisalo');
                          sirestau := 1;
                      end;

           END
       else
          desblo_precio:= 0;


      IF ACHI = 0 THEN
      BEGIN
           PRE_PRO.ReadOnly:= FALSE;
           KIL_PRO.ReadOnly:= FALSE;
           CAJ_PRO.ReadOnly:= FALSE;
           CAJ_PRO.SetFocus;
           CAJ_PRO.SelectAll;
      END;

           //aqui reviso el precio del restaurante


   qrestaura.close;
   qrestaura.parambyname('cod_cli').asstring := cod_cli;
   qrestaura.open;

   IF (qrestaura.FIELDBYNAME('COD_CLI').ASSTRING  <> '') and (sirestau = 0)  then
       begin

         qrestaupre.close;
         qrestaupre.parambyname('cod_art').asstring := codigoart.text;
         qrestaupre.open;

         if qrestaupre.FIELDBYNAME('COD_art').ASSTRING  <> '' then
         begin

              duprest.close;
              duprest.PARAMBYNAME('COD_ART').AsString := CODIGOART.Text;
              duprest.open;


               IF duprest.Fields[0].AsINTEGER > 1 THEN
                  BEGIN
                      FORM20.SHOWMODAL;
                      CAJ_PRO.SetFocus;

                      IF PRE_PRO.Text = '0' THEN
                           pre_pro.ReadOnly := FALSE
                        ELSE
                           pre_pro.ReadOnly := true;

                  END
                  ELSE
                  BEGIN
                      if qrestaupre.FIELDBYNAME('precio').ASSTRING <> '0' then
                      begin
                          pre_pro.Text := qrestaupre.FIELDBYNAME('precio').ASSTRING;

                          IF PRE_PRO.Text = '0' THEN
                           pre_pro.ReadOnly := FALSE
                        ELSE
                           pre_pro.ReadOnly := true;

                          caj_pro.setfocus;
                      end
                       else
                          caj_pro.setfocus;

                   end;


       end;

      end;







      //aqui reviso el precio del restaurant mayoreo


   qresta.close;
   qresta.parambyname('cod_cli').asstring := cod_cli;
   qresta.open;

   IF (QRESTA.FIELDBYNAME('COD_CLI').ASSTRING  <> '') and (sirestau = 0)  then
       begin

         qrestpre.close;
         qrestpre.parambyname('cod_art').asstring := codigoart.text;
         qrestpre.open;

         if QRESTpre.FIELDBYNAME('COD_art').ASSTRING  <> '' then
         begin

              dupmay.close;
              dupmay.PARAMBYNAME('COD_ART').AsString := CODIGOART.Text;
              dupmay.open;


               IF DUPMay.Fields[0].AsINTEGER > 1 THEN
                  BEGIN
                      FORM20.SHOWMODAL;
                      CAJ_PRO.SetFocus;

                      IF PRE_PRO.Text = '0' THEN
                           pre_pro.ReadOnly := FALSE
                        ELSE
                           pre_pro.ReadOnly := true;

                  END
                  ELSE
                  BEGIN
                      if QRESTpre.FIELDBYNAME('precio').ASSTRING <> '0' then
                      begin
                          pre_pro.Text := QRESTpre.FIELDBYNAME('precio').ASSTRING;

                          IF PRE_PRO.Text = '0' THEN
                           pre_pro.ReadOnly := FALSE
                        ELSE
                           pre_pro.ReadOnly := true;

                          caj_pro.setfocus;
                      end
                       else
                          caj_pro.setfocus;

                   end;


       end;

      end;

        //aqui reviso el precio del restaurant menudeo



   qrestamen.close;
   qrestamen.parambyname('cod_cli').asstring := cod_cli;
   qrestamen.open;

   IF (QRESTAmen.FIELDBYNAME('COD_CLI').ASSTRING  <> '') and (sirestau = 0)  then
       begin

         qrestpremen.close;
         qrestpremen.parambyname('cod_art').asstring := codigoart.text;
         qrestpremen.open;


         if QRESTpremen.FIELDBYNAME('COD_art').ASSTRING  <> '' then
         begin

              dupmen.close;
              dupmen.PARAMBYNAME('COD_ART').AsString := CODIGOART.Text;
              dupmen.open;

              
               IF DUPMen.Fields[0].AsINTEGER > 1 THEN
                  BEGIN
                      form21.ShowModal;
                      caj_pro.setfocus;
                      IF PRE_PRO.Text = '0' THEN
                           pre_pro.ReadOnly := FALSE
                        ELSE
                           pre_pro.ReadOnly := true;
                  end
                  else
                  begin
                      if QRESTpremen.FIELDBYNAME('precio').ASSTRING <> '0' then
                      begin
                      pre_pro.Text := QRESTpremen.FIELDBYNAME('precio').ASSTRING;

                      IF PRE_PRO.Text = '0' THEN
                           pre_pro.ReadOnly := FALSE
                        ELSE
                           pre_pro.ReadOnly := true;
                      caj_pro.setfocus;
                      end
                      else
                          caj_pro.SetFocus;
                      end;


       end;

    END;

end;





END;



procedure TForm9.sDblClick(Sender: TObject);
VAR
    TEMPOSUM: REAL;
    IEOLO : INTEGER;
    num_corre: string;
begin

        IEOLO := 0;

         IF (EDIT9.TEXT = '') OR (EDIT9.TEXT = '0') THEN
                      BEGIN
                           SHOWMESSAGE('NECESITAS AUTORIZAR PARA QUITAR PROD.');
                           EXIT;
                      END;

       IF QUESTION('ESTAS SEGURO DE BORRAR') = TRUE THEN
            BEGIN


              if (EDIT3.text = '0') OR  (EDIT3.text = '') then
                      num_corre :=   TFOLIO.TEXT
                   else
                      num_corre :=  EDIT3.TEXT;

                     
                      
                       SUBTOTAL := STRTOFLOAT(edit9.Text); // := floattostrf(subtotal,ffnumber,10,2);
                       IVATOTAL := STRTOFLOAT(edit10.text); // := floattostrf(ivatotal,ffnumber,10,2);
                       TOTAL_FIN := STRTOFLOAT(edit1.Text); // := floattostrf(total_fin,ffnumber,10,2);
                       IEPSTOTAL := STRTOFLOAT(ieps.text);  //:= floattostrf(iepstotal,ffnumber,10,2);
                       ACUDES := STRTOFLOAT(MEMO4.TEXT); //:= floattostrf(ACUDES,ffnumber,10,2);




              //     IF EDIT3.TEXT <> '' THEN
              //          begin
                                qvtasieps.Close;
                                QVTASIEPS.PARAMBYNAME('RENglon').ASINTEGER := QVENTAS.FIELDBYNAME('RENGLON').ASINTEGER;
                                qvtasieps.ParamByName('folio').AsString:= num_corre;
                                qvtasieps.Open;

                                iepsBORRA.CLOSE;
                                iepsBORRA.PARAMBYNAME('FOLIO').ASSTRING := num_corre;
                                iepsBORRA.PARAMBYNAME('CODIGO').ASSTRING := QVENTAS.FIELDBYNAME('CODIGO').ASSTRING;
                                iepsBORRA.PARAMBYNAME('REN').ASINTEGER := QVENTAS.FIELDBYNAME('RENGLON').ASINTEGER;
                                iepsBORRA.ExecSQL;



                                QBORRA.CLOSE;
                                QBORRA.PARAMBYNAME('FOLIO').ASSTRING := num_corre;
                                QBORRA.PARAMBYNAME('NUM_EMP').ASSTRING := num_empresa.text;
                                QBORRA.PARAMBYNAME('CODIGO').ASSTRING := QVENTAS.FIELDBYNAME('CODIGO').ASSTRING;
                                QBORRA.PARAMBYNAME('REN').ASINTEGER := QVENTAS.FIELDBYNAME('RENGLON').ASINTEGER;
                                QBORRA.ExecSQL;





                 {       end
                        else
                        begin



                  qvtasieps.Close;
                  QVTASIEPS.PARAMBYNAME('RENglon').ASINTEGER := QVENTAS.FIELDBYNAME('RENGLON').ASINTEGER;
                  qvtasieps.ParamByName('folio').AsString:= tfolio.Text;
                  qvtasieps.Open;



                   QBORRA.CLOSE;
                   QBORRA.PARAMBYNAME('FOLIO').ASSTRING := TFOLIO.TEXT;
                   QBORRA.PARAMBYNAME('NUM_EMP').ASSTRING := NUM_EMPRESA.TEXT;
                   QBORRA.PARAMBYNAME('CODIGO').ASSTRING := QVENTAS.FIELDBYNAME('CODIGO').ASSTRING;
                   QBORRA.PARAMBYNAME('REN').ASINTEGER := QVENTAS.FIELDBYNAME('RENGLON').ASINTEGER;
                   QBORRA.ExecSQL;



                  iepsBORRA.CLOSE;
                  iepsBORRA.PARAMBYNAME('FOLIO').ASSTRING := TFOLIO.TEXT;
                  iepsBORRA.PARAMBYNAME('CODIGO').ASSTRING := QVENTAS.FIELDBYNAME('CODIGO').ASSTRING;
                  iepsBORRA.PARAMBYNAME('REN').ASINTEGER := QVENTAS.FIELDBYNAME('RENGLON').ASINTEGER;
                  iepsBORRA.ExecSQL;

                  end;


                       }



                      ACUDES:= ACUDES - QVENTAS.FIELDBYNAME('DESCTO').AsFloat;
                      IF QVENTAS.FIELDBYNAME('totiva').ASFLOAT <> 0 THEN
                      BEGIN

                         SUBTOTAL := subtotal - (QVENTAS.FIELDBYNAME('TOTAL').ASFLOAT );
                         IEOLO:= 1;
                      END;



                      IF QVtasieps.FIELDBYNAME('totieps').ASFLOAT <> 0 THEN
                      BEGIN
                         SUBTOTAL := subtotal - (Qventas.FIELDBYNAME('TOTAL').ASFLOAT);
                         IEOLO:= 1;
                      END;




                      IF IEOLO = 0 THEN
                          SUBTOTAL := subtotal - (QVENTAS.FIELDBYNAME('TOTAL').ASFLOAT);


                      IVATOTAL := ivatotal - QVENTAS.FIELDBYNAME('totiva').ASFLOAT;
                      iepstotal := iepstotal - QVtasieps.FIELDBYNAME('totieps').ASFLOAT;
                      TOTAL_FIN := subtotal + ivatotal + iepstotal -ACUDES;


                      edit9.Text:= floattostrf(subtotal,ffnumber,10,2);
                      edit10.text:= floattostrf(ivatotal,ffnumber,10,2);
                      edit1.Text:= floattostrf(total_fin,ffnumber,10,2);
                      ieps.text := floattostrf(iepstotal,ffnumber,10,2);
                      MEMO4.TEXT:= floattostrf(ACUDES,ffnumber,10,2);

                      edit9.text:=stripped(',',edit9.text);
                      edit10.text:=stripped(',',edit10.text);
                      ieps.text:=stripped(',',ieps.text);
                      edit1.text:=stripped(',',edit1.text);
                      MEMO4.Text:= stripped(',',MEMO4.text);
                      MEMO2.Text:= stripped(',',MEMO2.text);
                      MEMO1.Text:= EDIT1.Text;
                      TOT:= STRTOFLOAT(EDIT1.Text);


                      IF (STRTOFLOAT(MEMO2.Text) <> 0.00) OR (STRTOFLOAT(MEMO2.Text) <> 0)THEN
                      BEGIN
                         TEMPOSUM:= STRTOFLOAT(MEMO1.TEXT) - ACU;
                         MEMO2.TEXT:= FLOATTOSTRF(ACU,FFNUMBER,10,2);
                         MEMO3.Text:= floattostrf(temposum,ffnumber,10,2);
                      END;


                     NUM_ARTICULOS:= NUM_ARTICULOS - 1;

                     totart.Text:= inttostr(NUM_ARTICULOS);

                     IF EDIT3.TEXT <> '' THEN
                      begin
                               {    qventas.Close;
                                    qventas.ParamByName('num_emp').asstring:= num_empresa.text;
                                    qventas.ParamByName('folio').AsString:= NUM_CORRE ;
                                    qventas.Open;     }

                                    UPDATABLE.CLOSE;
                                    updatable.parambyname('subtotal').asstring := edit9.text;
                                    updatable.parambyname('iva').asstring := edit10.text;
                                    updatable.parambyname('total').asstring := edit1.text;
                                    updatable.parambyname('folio').asstring := edit3.text;
                                    updatable.parambyname('num_emp').asstring := num_empresa.text;
                                    updatable.execsql;

                        end;

                                    SUBTOTAL := STRTOFLOAT(edit9.Text); // := floattostrf(subtotal,ffnumber,10,2);
                                    IVATOTAL := STRTOFLOAT(edit10.text); // := floattostrf(ivatotal,ffnumber,10,2);
                                    TOTAL_FIN := STRTOFLOAT(edit1.Text); // := floattostrf(total_fin,ffnumber,10,2);
                                    IEPSTOTAL := STRTOFLOAT(ieps.text);  //:= floattostrf(iepstotal,ffnumber,10,2);
                                    ACUDES := STRTOFLOAT(MEMO4.TEXT); //:= floattostrf(ACUDES,ffnumber,10,2);
            END;


          qventas.Close;
          qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
          qventas.ParamByName('folio').AsString:= num_corre;
          qventas.Open;
end;

procedure tform9.sacatotal;
VAR
  TOILI : INTEGER;

begin

                        if (EDIT3.text <> '') and (entrofolio = 0) AND (subtotal = 0) then
                              begin

                                   subtotal:= strtofloat(edit9.text) + subtotal;
                                   ivatotal:= strtofloat(edit10.text) + ivatotal;
                                   iepstotal:= strtofloat(ieps.text) + iepstotal;
                                   total_fin:= strtofloat(edit1.text) + total_fin;
                                   acudes:= strtofloat(memo4.text) + acudes;


                                    entrofolio := 1;

                              end;




                      IF DESCTO = '' THEN
                            DESCTO := '0';

                      TOILI := 0;
                       ACUDES:= ACUDES + strtofloat(DESCTO);

                      if STRTOFLOAT(totiva33) <> 0 then
                       BEGIN
                        SUBTOTAL := SUBTOTAL + STRTOFLOAT(TOTALTOIVA);
                        TOILI := 1;
                       END;
                       {else
                        SUBTOTAL := subtotal + TOTAL;}



                      IF STRTOFLOAT(totieps33) <> 0 then
                        BEGIN
                           SUBTOTAL := SUBTOTAL + STRTOFLOAT(TOTALTOIVA);
                           TOILI:= 1;
                        END;


                      IF TOILI = 0 THEN
                            SUBTOTAL := subtotal + strtofloat(TOTAL);

                      iepstotal := iepstotal + STRTOFLOAT(totieps33);
                      IVATOTAL := ivatotal + STRTOFLOAT(totiva33);
                      TOTAL_FIN := subtotal + ivatotal+iepstotal-ACUDES;



                      //sumar el acumulado por si es de un folio atrasado

                      edit9.Text:= floattostrf(subtotal,ffnumber,10,2);
                      edit10.text:= floattostrf(ivatotal,ffnumber,10,2);
                      ieps.text:= floattostrf(iepstotal,ffnumber,10,2);
                      edit1.Text:= floattostrf(total_fin,ffnumber,10,2);
                      memo4.text:= floattostrf(acudes,ffNUMBER,10,2);



                      edit9.text:=stripped(',',edit9.text);
                      edit10.text:=stripped(',',edit10.text);
                      ieps.Text := stripped(',',ieps.Text);
                      edit1.text:=stripped(',',edit1.text);
                      MEMO1.Text:= EDIT1.Text;
                      MEMO4.Text:= stripped(',',MEMO4.text);


                      IF EDIT3.TEXT <> '' THEN
                          BEGIN

                              UPDATABLE.CLOSE;
                              updatable.parambyname('subtotal').asstring := edit9.text;
                              updatable.parambyname('iva').asstring := edit10.text;
                              updatable.parambyname('total').asstring := edit1.text;
                              updatable.parambyname('folio').asstring := edit3.text;
                              updatable.parambyname('num_emp').asstring := num_empresa.text;
                              updatable.execsql;



                          END;



end;



procedure TForm9.KIL_PROExit(Sender: TObject);
begin
       if kil_pro.Text = '' then
          kil_pro.Text:= '0';


     //ESTO LO COMENTE EL DIA 27 SEP 18 POR LO DE LOS REST.
    qcotiza.Close;
    qcotiza.parambyname('cod_cli').AsString:= cod_CLI;
    qcotiza.parambyname('cod_art').AsString:= codigoart.Text;
    qcotiza.ParamByName('fecha').asdate:= fechavientos.Date;
    qcotiza.Open;






    if qcotiza.fieldbyname('Precio').AsString <> '' then
           begin


           //con este query buscamos si existen mas de 2 precios...
               qdupli.Close;
               qdupli.parambyname('cod_cli').AsString:= cod_CLI;
               qdupli.parambyname('cod_art').AsString:= codigoart.Text;
               qdupli.ParamByName('fecha').asdate:= fechavientos.Date;
               qdupli.Open;

              if qdupli.Fields[0].AsInteger > 1 then
                  begin
                FORM14.SHOWMODAL;
               //pre_pro.Text:= qcotiza.fieldbyname('precio').AsString;
               pre_pro.ReadOnly:= true;
               pre_pro.SetFocus;

                   end
                   else
                      begin
 //cambia x PrecioPresentacion ======= pre_pro.Text:= qcotiza.fieldbyname('precio').AsString;
                        pre_pro.Text:= PrecioPresentacion(qcotiza.fieldbyname('precio').AsString);
                        pre_pro.ReadOnly:= true;
                        pre_pro.SetFocus;
                      end;
           END;


     kil_pro.text := floattostrf(strtofloat(kil_pro.text), ffnumber,10,2);
     kil_pro.text := stripped(',', kil_pro.text);




end;

procedure TForm9.efectivoExit(Sender: TObject);
begin

        if efectivo.text='' then
        begin
          efectivo.text:= '0';
          transf.SelectAll;
        end;
    sacatotal1;
    transf.SelectAll;
end;




procedure TForm9.efectivoKeyPress(Sender: TObject; var Key: Char);

begin
       if key = '' then
          key:= '0';

       if not (key in [chr(0)..chr(31),'0'..'9','.'])then
              key:= '0';

          if Key = #13 then                          { if it's an enter key }
               begin
                 Key := #0;                                 { eat enter key }
                  Perform(WM_NEXTDLGCTL, 0, 0);              { move to next control }
               end
end;

procedure TForm9.transfKeyPress(Sender: TObject; var Key: Char);
var
  bono:real;
  des_bon: integer;
  temp_bonos: string;

begin
     if key = '' then
          key:= '0';

     if not (key in [chr(0)..chr(31),'0'..'9','.'])then
              key:= '0';

     if Key = #13 then                          { if it's an enter key }
               begin
                 Key := #0;                                 { eat enter key }
                 Perform(WM_NEXTDLGCTL, 0, 0);             { move to next control }



     if transf.text='' then
        begin
          transf.text:= '0';
          Cheque.SelectAll;
        end;



     if (labande = 1)  then
        begin
           sacatotal1;
           Cheque.SelectAll;
       //    temp_bonos:= bonos.text;
           labande := 1;
       end;

     if (labande = 0) THEN
        begin
       {   tconfig.Open;
          des_bon:= strtoint(tconfig.fieldbyname('des_bonos').asstring);
          bono:=strtofloat(bonos.text);
          tot_bonos:= (bono * des_bon)/100;
          tot_bonos:= bono - tot_bonos;
          bonos.text:= floattostrf(tot_bonos,ffgeneral,10,2); }
          sacatotal1;
          cheque.SelectAll;
       //   temp_bonos:= bonos.text;
       //   fijo:= bonos.text;
          labande := 1;
        end;

   {  if (temp_bonos <> FIJO) then
        begin
          tconfig.Open;
          des_bon:= strtoint(tconfig.fieldbyname('des_bonos').asstring);
          bono:=strtofloat(bonos.text);
          tot_bonos:= (bono * des_bon)/100;
          tot_bonos:= bono - tot_bonos;
          bonos.text:= floattostrf(tot_bonos,ffgeneral,10,2);
          sacatotal1;
          cheque.SelectAll;
          temp_bonos:= bonos.text;
          fijo:= bonos.text;
          labande := 1;
        end;     }

      end

end;

procedure TForm9.chequeExit(Sender: TObject);
var
  fecha: tdate;
  nom_ban, no_cheque: string;
begin

       if cheque.text='' then
        begin
          cheque.text:= '0';
          dolar.SelectAll;
        end;
        if cheque.Text <> '0' then
          begin
             dbbanco.Visible:= true;
             nocheque.Visible:=true;
             banfecha.Visible:= true;
             label18.Visible:= true;
             label19.Visible:= true;
             label20.visible:= true;
             nom_ban:= dbbanco.text;
             BANFECHA.Date := DATE;
             no_cheque:= nocheque.text;
             fecha:= banfecha.Date;
             tbanco.Close;
             tbanco.Open;
          end;

          if (cheque.Text = '0') AND (CHEQPREF.Text = '0') AND (TDEBITO.Text = '0') AND (transf.Text = '0') then
          begin
             dbbanco.Visible:= FALSE;
             nocheque.Visible:=FALSE;
             banfecha.Visible:= FALSE;
             label18.Visible:= FALSE;
             label19.Visible:= FALSE;
             label20.visible:= FALSE;
             tbanco.Close;

          end;

       sacatotal1;
       dolar.selectall;
end;


procedure TForm9.chequeKeyPress(Sender: TObject; var Key: Char);

begin
        if key = '' then
          key:= '0';
if not (key in [chr(0)..chr(31),'0'..'9','.'])then
              key:= '0';

       if Key = #13 then                          { if it's an enter key }
               begin
                 Key := #0;                                 { eat enter key }
                  Perform(WM_NEXTDLGCTL, 0, 0);              { move to next control }
               end
end;

procedure TForm9.dolarKeyPress(Sender: TObject; var Key: Char);
var
   dlls: real;
   des_dol: real;
begin
      if key = '' then
          key:= '0';
if not (key in [chr(0)..chr(31),'0'..'9','.'])then
              key:= '0';

                   if Key = #13 then                          { if it's an enter key }
               begin
                 Key := #0;                                 { eat enter key }
                  Perform(WM_NEXTDLGCTL, 0, 0);             { move to next control }

      if dolar.text='' then
        begin
          dolar.text:= '0';
          cheqpref.SelectAll;
        end;
    tconfig.Open;
    des_dol := strtofloat (tconfig.fieldbyname('cam_dol').asstring);
    dlls:=strtofloat (dolar.text);
    tot_dlls := (des_dol * dlls);
    dolar.Text:= floattostrf(tot_dlls,ffgeneral,10,2);
    sacatotal1;
    cheqpref.SelectAll;

               end
end;

procedure TForm9.cheqprefExit(Sender: TObject);
var
  fecha: tdate;
  nom_ban, no_cheque: string;
begin

       if cheqpref.text='' then
        begin
          cheqpref.text:= '0';
          cheqpref.SelectAll;
        end;
        if cheqpref.Text <> '0' then
          begin
             dbbanco.Visible:= true;
             nocheque.Visible:=true;
             banfecha.Visible:= true;
             label18.Visible:= true;
             label19.Visible:= true;
             label20.visible:= true;
             nom_ban:= dbbanco.text;
             BANFECHA.Date := DATE;
             no_cheque:= nocheque.text;
             fecha:= banfecha.Date;
             tbanco.Close;
             tbanco.Open;
          end;

          if (cheque.Text = '0') AND (CHEQPREF.Text = '0') AND (TDEBITO.Text = '0') AND (transf.Text = '0') then
          begin
             dbbanco.Visible:= FALSE;
             nocheque.Visible:=FALSE;
             banfecha.Visible:= FALSE;
             label18.Visible:= FALSE;
             label19.Visible:= FALSE;
             label20.visible:= FALSE;
             tbanco.Close;

          end;

       sacatotal1;
       tdebito.SelectAll;
end;







procedure TForm9.cheqprefKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '' then
          key:= '0';
if not (key in [chr(0)..chr(31),'0'..'9','.'])then
              key:= '0';

        if Key = #13 then                          { if it's an enter key }
               begin
                 Key := #0;                                 { eat enter key }
                  Perform(WM_NEXTDLGCTL, 0, 0);              { move to next control }
               end
end;

procedure TForm9.nochequeExit(Sender: TObject);
begin
 if nocheque.text='' then
        begin
          nocheque.text:= '0';
          nocheque.SelectAll;
        end;
end;


procedure TForm9.nochequeKeyPress(Sender: TObject; var Key: Char);
begin
 if key = '' then
          key:= '0';
if not (key in [chr(0)..chr(31),'0'..'9','.'])then
              key:= '0';

        if Key = #13 then                          { if it's an enter key }
               begin
                 Key := #0;                                 { eat enter key }
                  Perform(WM_NEXTDLGCTL, 0, 0);              { move to next control }
               end
end;

procedure Tform9.sacatotal1;
var
   otrotot: real;
begin
     acu:= strtofloat(efectivo.Text)+ tot_bonos +strtofloat(dolar.Text) + strtofloat (TRANSF.Text)
          + strtofloat(cheque.text)+ strtofloat (cheqpref.Text)+ strtofloat (tdebito.Text);
     memo2.Text:= floattostrf(acu,ffNUMBER,10,2);


     IF (FLOATTOSTR(TOT) = '') OR (FLOATTOSTR(TOT) = '0.00') OR (FLOATTOSTR(TOT) ='0') THEN
           TOT:= STRTOFLOAT(MEMO1.Text);


     cambalache:= (tot-acu);
     memo3.text:= floattostrf((tot - acu),ffcurrency,10,2);

     if acu >= tot then
          label14.Caption:='Cambio';

    if acu <= tot then
          label14.Caption:='Por Pagar';
end;



procedure TForm9.BitBtn3Click(Sender: TObject);
VAR
     totalito_imp, TOTICK23,hacer_sori, numerito, observa, SUCUFIN, TIPO_PAG, HORA, tipo_envia, fac_tipo, facturin, totaldetot, cosprocaj, FORMA_PA,
     num_corre,  IMP_EXE3, CONIVA3, CONIEPS3, tama_digi, CCADE, numerode, este_finiva, total_folio, TOTAL_IMPORTE, FINAL_IMPORTE, ano, dia, mes, cosprokil, costoventa, kilosvientos, cajasvientos, preciokilos, preciocajas, convkoc: string;
    TOTICK2, IVATOTAL2, CONIVA2, TOTCANTI, IMPORTE_TOTAL, IMPORTE_FINAL, dife_limi, totdescto, cantiempa, ESTEESTOT: real;
    SUBO, YALOGRABE, ICADE, ZCADE, CADENITA, ES_PAPELON, resu, diferencia_dias, numero_dias, LINEA, envia_tipo: integer;
     fecha_real, otra_hora, esta_hora : tdatetime;

begin

      // aqui reviso las vtas cuando vienen de la tablet para ver si no tiene errores
          //  activosalida := 0;


         //   if  edit3.Text <> '' then
              //         revisavtas;

            //      IF ACTIVOSALIDA = 1 THEN
              //          EXIT;

       // aqui se termina de revisar la info de la tablet


      QVENTAS.CLOSE;
      QVENTAS.OPEN;

      IF QVENTAS.FIELDBYNAME('FOLIO').ASSTRING = '' THEN
        BEGIN
             SHOWMESSAGE('REVISA LOS PRODUCTOS');
             EXIT;
        END;

      zcade:= 0;
      num_corre := '0';

      FORMA_PA:= '';
      NUM_EMPRESA.SetFocus;
      ES_PAPELON := 0;

      hacer_sori := '0';
      div_tick := 0;

      CONIVA := 0;
      CONIEPS := 0;
      CONIVA3 := '0';
      CONIEPS3 := '0';

      total_folio := '0';
      TOTICK2 := 0;

       ShortDateFormat := 'dd/mm/yyyy';
       SHORTtimeformat:= 'HH:mm:ss';

      TFECHA1:= DATETOSTR(FECHAVIENTOS.DATE);
      tmpdia:= copy(tfecha1,1,2);
      tmpmes:= copy(tfecha1,4,2);
      tmpano:= copy(tfecha1,7,4);

      IF (TIPO_FAC.ItemIndex = 0) AND (TRFC.Text = '') THEN
        BEGIN
            SHOWMESSAGE('REVISA EL RFC VUELVE A SELECCIONAR EL CTE');
            EXIT;
        END;

      IF EDIT2.TEXT = '' THEN
      BEGIN
          SHOWMESSAGE('REVISA NUM ORDEN ALMACEN');
          EXIT;
      END;



      IF (IMP_REST.ItemIndex = -1)  THEN
        BEGIN
            SHOWMESSAGE('SELECCIONA IMPRIME RESTAURANTE');
            EXIT;
        END;


      IF TIPO_PAGO.ItemIndex = -1 THEN
      BEGIN
          SHOWMESSAGE('SELECCIONA EL TIPO PAGO');
          EXIT;
      END;

      if (pon_usocfdi.text = '') and (tipo_fac.ItemIndex =  0)  then
      begin
           showmessage('Falta poner Uso CFDI');
           pon_usocfdi.setfocus;
           exit;
      end;

      MENSAJE.Mensa.Caption := 'VALIDANDO CREDITO Y VENCIMIENTO';
      MENSAJE.Mensa.Show;


      IF COD_CLI = '' THEN
       BEGIN
          SHOWMESSAGE('REVISA CODIGO CTE');
          EXIT;
       END;

      QSACADIAS.Close;
      QSACADIAS.ParamByName('COD_CLI').AsString := COD_CLI;
      QSACADIAS.Open;
      qsacadias.first;




      IF QSACADIAS.fieldbyname('NUM_DOCTO').AsSTRING <> '' THEN
      BEGIN

      si_debe := 1;
      cod_debe := cod_cli;

      IF BUSFOLIO.TEXT <> '' THEN
         NOM_CAJA := form4.agente1
        ELSE
         nom_caja := form4.agente1;

      NOMBRECTE := NOM_CLI;

      NUMERO_DIAS:= DAYSBETWEEN(FECHAVIENTOS.DATE, QSACADIAS.fieldbyname('fecha').AsDateTime);

      IF PLA_CLIE ='' THEN
            PLA_CLIE :='0';

      diferencia_dias := numero_dias - strtoint(pla_clie);

      //ASI ES COMO ESTABA

      if (numero_dias > strtoint(pla_clie)) AND (COD_CLI <> '9999') then
              begin
                 form5.cvedes.Open;
                 form5.label1.caption:= 'Se paso el limete de dias por :' + inttostr(diferencia_dias);
                 form5.Showmodal;
                 while form5.cvedes.FieldByName('pass').AsString <> form5.edit1.Text do
                       begin
                          form5.edit1.SelectAll;
                          form5.showmodal;
                          NOMBRE.SetFocus;
                    //      FORM5.EDIT1.TEXT := '';
                       end;
                          form5.edit1.text := '';
                          form5.Close;
               end;
     END;


    sal_cli.Close ;
    sal_cli.ParamByName('codigo').AsString := COD_CLI;
    sal_cli.ParamByName('empresa').AsString:= NUM_EMPRESA.TEXT;
    sal_cli.open;
    envia_tipo:= 1;

     //AQUI VOY A VAlIDAR EL TIPO DE PAGO


    IF TIPO_PAGO.ITEMINDEX = 1 THEN
    BEGIN

     END
   // ESTA ES LA CONTINUACION DE REVISAR SI PAGA DE CONTADO O CREDITO
   ELSE

    BEGIN

       //  AQUI VA ALGO
    END;

     storedproc2.close;

  if tipo_fac.ItemIndex = -1 then
      begin
        showmessage('Seleecciona el tipo de Docto');
        exit;
      end;


    // aqui se revisa que el total no este en ceros

    if tipo_pago.ItemIndex = -1 then
          begin
                stop('Selecciona el Tipo Pago');
                exit;
          end;

    IF TIPO_PAGO.ItemIndex = 0 THEN
          ACU:= TOT;



    if (acu <  tot) and (acu <> tot)then
          begin
             stop('Checa tu Pago');
             efectivo.setfocus;
             efectivo.selectall;
          end
       else

         begin
            if question('Esta seguro de grabar')= true then
                begin

                    //aqui voy a poner el set lock to wait


                    qespera.close;
                    qespera.execsql;


                     //  AQUI LO CAMBIO A 04  POR SI ES DE OTRA EMPRESA...


                    IF (num_empresa.text <> '01') and (edit3.text <> '') then
                        begin

                             uptab04.close;
                             uptab04.ParamByName('num_emp').asstring := num_empresa.text;
                             uptab04.ParamByName('folio').asstring := edit3.text;
                             uptab04.ExecSQL;

                             upvtas04.close;
                             upvtas04.ParamByName('num_emp').asstring := num_empresa.text;
                             upvtas04.ParamByName('folio').asstring := edit3.text;
                             upvtas04.ExecSQL;

                        end;





                      if (num_empresa.text = '02') or (num_empresa.Text = '03') OR
                          (num_empresa.text = '05')  then
                      begin
                          showmessage('Selecciona otra empresa');
                          exit;
                      end;


                      if num_empresa.Text <> '01' then
                      begin
                          if num_empresa.Text = '04' then
                            empresita := 'ZEFE';

                          if num_empresa.text = '06' then
                            empresita := 'RAMIRO';


                            if num_empresa.text = '08' then
                            empresita := 'NEZE2';


                          qfolio.Close;
                          qfolio.ParamByName('cajera').AsString:= empresita;
                          qfolio.Open;


                     end
                     else
                     begin

                         IF AGENTE_ORI <> '' THEN
                               FORM4.agente1 := AGENTE_ORI;


                          qfolio.Close;
                          qfolio.ParamByName('cajera').AsString:= form4.agente1;
                          qfolio.Open;
                     end;


                      numerito := factu.text;


                      IF  TIPO_FAC.ItemIndex = 1 THEN
                             FACTU.Text:= FACTU.Text
                           ELSE
                             factu.Text:=  qfolio.FieldByName('serie').Text+qfolio.FieldByName('folio_inicio').Text;




                       //AQUI VOY A BUSCAR ESA FACTURA PARA VER SI YA EXISTE EN COLESA


                       qerror.close;
                       qerror.parambyname('num_doc').asstring := factu.text;
                       qerror.open;

                       if qerror.fieldbyname('num_doc').asstring <> '' then
                        begin
                             showmessage('Revisa la Factura ' + factu.text + ' esta en colesa');
                             MENSAJE.Mensa.CLOSE;
                             exit;
                        end;





                      if papel = 0 then
                            BEGIN
                            factu.text := numerito;
                            ES_PAPELON:= 1;
                            END;




                      IF (COD_CLI = 'S235L')  THEN
                      BEGIN

                           if question('Ya se entrego Mercancia')= true then
                           begin

                                SORIANA.sori.ShowMODAL
                           end
                           else
                           begin

                               HACER_SORI := '1';
                               crear_pdf;
                               inc_fac;
                               ACTU_FOLIO;
                               INICIALIZA;
                               MENSAJE.Mensa.Close;
                           end;


                      end;



                         IF ((COD_CLI = 'D215L') OR  (COD_CLI = 'D81L')) THEN
                      BEGIN

                           if question('Ya se entrego Mercancia')= true then
                           begin

                                FORM19.ShowMODAL
                           end
                           else
                           begin

                               HACER_SORI := '1';
                               crear_pdf2;
                               inc_fac;
                               ACTU_FOLIO;
                               INICIALIZA;
                               MENSAJE.Mensa.Close;
                           end;
                      end;


                      IF (COD_CLI ='C62L') THEN
                          BEGIN
                               HACER_SORI := '1';
                               crear_pdf2;
                               inc_fac;
                               ACTU_FOLIO;
                               INICIALIZA;
                               MENSAJE.Mensa.Close;
                          END;


                     IF HACER_SORI ='0' THEN
                     BEGIN

                    MENSAJE.Mensa.Close;

                    MENSAJE2.Mensa2.Caption := 'MANDANDO INFORMACION';
                    MENSAJE2.Mensa2.Show;

                      seriee:= qfolio.FieldByName('serie').Text;
                      folio_finale := qfolio.FieldByName('folio_final').Text;
                      folio_inicioe:= qfolio.FieldByName('folio_inicio').Text;
                      ano_aprobae := qfolio.FieldByName('ano_aproba').Text;
                      num_aprobae:= qfolio.FieldByName('num_aproba').Text;


                        if (factu.visible = true) and ((factu.Text = '0') or
                           (factu.text ='')) then
                           begin
                              stop('Pon el numero de Factura');
                              factu.SetFocus;
                              EXIT;
                           end;


                      //AQUI GENERO ARCHIVO DE VTAS

                      IF (TIPO_FAC.ItemIndex = 0) AND  (ES_PAPELON = 0)  THEN


                        //grabo en la tabla de lista de facturas a imprimir


                        IF tipo_fac.itemindex = 0 then
                        begin
                        end;

                          if salirtodo = 1 then
                                exit;

                      MENSAJE2.Mensa2.close;

                      MENSAJE3.Mensa3.Caption := 'GUARDANDO INFORMACION VENTAS';
                      MENSAJE3.Mensa3.Show;

                         IF EDIT3.TEXT <> '' THEN
                         BEGIN

                          upvtascom.close;
                          upvtascom.parambyname('folio').asstring := EDIT3.TEXT;
                          upvtascom.parambyname('num_emp').asstring := num_empresa.text;
                          upvtascom.parambyname('folio_col').asstring := tfolio.text;
                          upvtascom.parambyname('nombre').asstring := form4.agente1;
                          upvtascom.execsql;

                         END;


                      // aqui voy a agregar la informacion de la auditoria para ventas en caja afuera




                   {   audita.open;
                      audita.AppendRecord([num_empresa.Text, TFOLIO.TEXT, factu.text, memo1.Text, fechavientos.Date, TIMETOSTR(time), totart.Text, cod_cli, nom_cli, FORM4.AGENTE1 ]);
                      audita.Close;     }





                       //aqui agrego la informacion a la tabla de ventas por si no se ha grabado

             //    if (EDIT3.text = '0') OR  (EDIT3.text = '') then
                      num_corre :=   TFOLIO.TEXT;
               //    else
               //       num_corre :=  EDIT3.TEXT;




              if (busfolio.Text  <> '')  then
                begin




                  qventas.Close;
                  qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                //  qventas.ParamByName('folio').AsString:= sitienefolio;
                qventas.ParamByName('folio').AsString:= NUM_CORRE;
                  qventas.Open;

                  UPDATE_BUSFOLIO.CLOSE;
                  UPDATE_BUSFOLIO.PARAMBYNAME('FOLIO').ASSTRING :=  sitienefolio;
                //  UPDATE_BUSFOLIO.PARAMBYNAME('FOLIONEW').ASSTRING :=  TFOLIO.TEXT;
                   UPDATE_BUSFOLIO.PARAMBYNAME('FOLIONEW').ASSTRING := NUM_CORRE;
                  UPDATE_BUSFOLIO.EXECSQL;





                  while not qventas.Eof do

                  begin

                   //   inserta_ventas.params[0].AsString:= tfolio.Text;
                        inserta_ventas.params[0].AsString:= NUM_CORRE;
                      inserta_ventas.params[1].AsString:= qventas.fieldbyname('descripcion').AsString;
                      inserta_ventas.params[2].AsString:= qventas.fieldbyname('codigo').AsString;
                      inserta_ventas.params[3].AsString:= qventas.fieldbyname('cajas').AsString;
                      inserta_ventas.params[4].AsString:= qventas.fieldbyname('kilos').AsString;
                      inserta_ventas.params[5].AsSTRING:= qventas.fieldbyname('precio').AsString;
                      inserta_ventas.params[6].AsSTRING:= qventas.fieldbyname('total').AsString;
                      inserta_ventas.params[7].AsString:= FORM4.AGENTE1;
                      inserta_ventas.params[8].AsString:= qventas.fieldbyname('iva').AsString;
                      inserta_ventas.params[9].AsString:= qventas.fieldbyname('cos_pro').AsString;
                      inserta_ventas.params[10].AsSTRING:= qventas.fieldbyname('totiva').AsString;
                      inserta_ventas.params[11].AsINTEGER:= qventas.fieldbyname('renglon').Asinteger;
                      inserta_ventas.params[12].AsINTEGER:=qventas.fieldbyname('pagado').asinteger;;
                      inserta_ventas.params[13].AsString:= qventas.fieldbyname('rfc').AsString;
                      inserta_ventas.params[14].AsString:= qventas.fieldbyname('tipo').AsString;
                      inserta_ventas.params[15].AsString:= qventas.fieldbyname('lineaven').AsString;
                      inserta_ventas.params[16].Asstring:= qventas.fieldbyname('descto').AsString;
                      inserta_ventas.params[17].AsString:= qventas.fieldbyname('pedido').AsString;
                      inserta_ventas.params[18].AsString:= qventas.fieldbyname('observacion').AsString;
                      inserta_ventas.params[19].AsString:= qventas.fieldbyname('sucursal').AsString;
                      inserta_ventas.params[20].AsString:= qventas.fieldbyname('num_emp').AsString;
                      inserta_ventas.ExecProc;


                   //    reng:= reng + 1;
                   //    NUM_ARTICULOS:= NUM_ARTICULOS + 1;
                       agregaruno := 1;






                       qventas.next;

                  end;
               end;








       //CHECO QUE SEA TICKET

    IF TIPO_FAC.ItemIndex = 1 THEN
        BEGIN
              //DESDE AQUI LO COMENTO PARA QUITAR LA EMPRESA NEZE
       //REVISO QUE LLEVE AGUACATE EN EL TICKET



       QVENTAS1.CLOSE;
//       QVENTAS1.PARAMBYNAME('FOLIO').ASSTRING :=  TFOLIO.TEXT;
       QVENTAS1.PARAMBYNAME('FOLIO').ASSTRING :=  NUM_CORRE;
       QVENTAS1.PARAMBYNAME('NUM_EMP').ASSTRING := NUM_EMPRESA.TEXT;
       QVENTAS1.OPEN;

  {     QVENTAS4.CLOSE;
     //  QVENTAS4.PARAMBYNAME('FOLIO').ASSTRING :=  TFOLIO.TEXT;
      QVENTAS4.PARAMBYNAME('FOLIO').ASSTRING :=  NUM_CORRE;
      QVENTAS4.PARAMBYNAME('NUM_EMP').ASSTRING := NUM_EMPRESA.TEXT;
      QVENTAS4.OPEN;   }


       IF (QVENTAS1.FIELDBYNAME('NUM_EMP').ASSTRING <> '') {OR (QVENTAS4.FIELDBYNAME('NUM_EMP').ASSTRING <> '')} THEN
       BEGIN
           DIV_TICK := 1;

                     qtotventas.Close;
                     qtotventas.ParamByName('folio').AsString := NUM_CORRE;
                     qtotventas.open;


                   //aqui voy a mandar los aguacates

                       sinsertacot.Params[0].AsString:= '04';
                       sinsertacot.Params[1].AsString:= '04';
                   //    sinsertacot.Params[2].Asinteger:= strtoint(tfolio.text);
                       sinsertacot.Params[2].Asinteger:= strtoint(num_corre);
                       sinsertacot.Params[3].AsString:= cod_cli;

               if (cod_cli = '9999') or (cod_cli ='5555') then
                    sinsertacot.Params[4].AsString:= alias.text
                 else
                    sinsertacot.Params[4].AsString:= nom_cli;

                       sinsertacot.Params[5].AsString:= tdire.text;
                       sinsertacot.Params[6].AsString:= ciu_cli;
                       sinsertacot.Params[7].AsString:= est_cli;
                       sinsertacot.Params[8].AsString:= trfc.Text;
                       sinsertacot.Params[9].Asstring:= form4.cod_agente;


                            ivatotal2 := 0;
                            coniva2:= 0;
                            imp_exe:= qtotventas.fields[0].asfloat;

                       sinsertacot.Params[10].Asfloat:= imp_exe;
                       sinsertacot.Params[11].Asfloat:= coniva2;
                       sinsertacot.Params[12].Asfloat:= ivatotal2;
                       sinsertacot.Params[13].AsDATE := fechavientos.Date;
                       sinsertacot.Params[14].Asfloat:= 0;  //strtofloat(costoventa);     // AQUI VA EL COSTO VENTA INVESTIGAR COMO SE CALC.
                       sinsertacot.Params[15].Asfloat:= ACUDES;
                       sinsertacot.ExecProc;

                      { imp_exe4 := imp_exe;
                       ivatotal4 := coniva2;
                       iepstotal4 := iepstotal;}



      qventas1.Close;
      //  qventas1.ParamByName('folio').AsString:= tfolio.Text;
        qventas1.ParamByName('folio').AsString:= num_corre;
        QVENTAS1.PARAMBYNAME('NUM_EMP').ASSTRING := NUM_EMPRESA.TEXT;
        qventas1.Open;


        while not  qventas1.eof do
         begin

                 convkoc:= qventas1.fieldbyname('tipo').asstring;
                 if convkoc = 'K' then
                   begin
                  qcanemp.Close;
                  qcanemp.ParamByName('cod_Art').asstring:= qventas1.fieldbyname('codigo').AsString;
                  qcanemp.ParamByName('num_emp').asstring:= qventas1.fieldbyname('num_emp').AsString;
                  qcanemp.Open;
                  cantiempa:= strtofloat(floattostrf(qcanemp.fields[6].asFLOAT, ffnumber, 10,2));




          if (qventas1.FieldByName('cajas').asstring ='0') and (qventas1.FieldByName('kilos').asstring <> '0') then
                begin
                  kilosvientos:= floattostrf(qventas1.fieldbyname('kilos').asfloat, ffnumber, 10,2);
                  preciokilos:= floattostrf(qventas1.fieldbyname('precio').asfloat, ffnumber, 10,2);

                  kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);

                 cajasvientos:= floattostrf((strtofloat(kilosvientos)/cantiempa), ffnumber,10,2);
                 preciocajas:=floattostrf((strtofloat(preciokilos) * cantiempa), ffnumber,10,2);

                 cajasvientos:= stripped(',', cajasvientos);
                 preciocajas:= stripped(',', preciocajas);

                end;

         if (qventas1.FieldByName('cajas').asstring <>'0') and (qventas1.FieldByName('kilos').asstring ='0') then
                begin
                  cajasvientos:= floattostrf(qventas1.fieldbyname('cajas').asfloat, ffnumber,10,2);
                  preciocajas:= floattostrf(qventas1.fieldbyname('precio').asfloat, ffnumber,10,2);

                  cajasvientos:= stripped(',', cajasvientos);
                  preciocajas:= stripped(',', preciocajas);


                  kilosvientos:= floattostrf((cantiempa * strtofloat(cajasvientos)),ffnumber,10,2);
                  preciokilos:= floattostrf((strtofloat(preciocajas)/cantiempa), ffnumber,10,2);

                  kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);


                 end;

           if (qventas1.FieldByName('cajas').asstring <>'0') and (qventas1.FieldByName('kilos').asstring <>'0') then
                begin
                  kilosvientos:= floattostrf(qventas1.fieldbyname('kilos').asfloat, ffnumber,10,2);
                  preciokilos:= floattostrf(qventas1.fieldbyname('precio').asfloat, ffnumber,10,2);

                  kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);


                  cajasvientos:= floattostrf(qventas1.fieldbyname('CAJAS').asfloat, ffnumber,10,2);
                  preciocajas:= floattostrf((strtofloat(preciokilos)* cantiempa), ffnumber,10,2);

                  cajasvientos:= stripped(',', cajasvientos);
                  preciocajas:= stripped(',', preciocajas);



                end;

              cosprocaj:= qCANEMP.fieldbyname('cos_pro_caj').asstring;
              cosprokil:=  qCANEMP.fieldbyname('cos_pro_kgs').asstring;
              costoventa:= floattostr(strtofloat(cosprokil) * strtofloat(kilosvientos));
        end;



    if convkoc = 'C' then
      begin
                 qcanemp.Close;
                  qcanemp.ParamByName('cod_Art').asstring:= qventas1.fieldbyname('codigo').AsString;
                  qcanemp.ParamByName('num_emp').asstring:= qventas1.fieldbyname('num_emp').AsString;
                  qcanemp.Open;
                  cantiempa:= strtofloat(floattostrf(qcanemp.fields[6].asFLOAT, ffnumber, 10,2));


         if (qventas1.FieldByName('cajas').asstring <>'0') and (qventas1.FieldByName('kilos').asstring ='0') then
              begin
                cajasvientos:= floattostrf(qventas1.Fieldbyname('cajas').Asfloat, ffnumber,10,2);
                preciocajas:= floattostrf(qventas1.fieldbyname('precio').asfloat, ffnumber,10,2);

                cajasvientos:= stripped(',', cajasvientos);
                  preciocajas:= stripped(',', preciocajas);


                kilosvientos:= floattostrf((cantiempa * strtofloat(cajasvientos)), ffnumber,10,2);
                preciokilos:= floattostrf((strtofloat(preciocajas)/cantiempa), ffnumber,10,2);

                 kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);


              end;

         if (qventas1.FieldByName('cajas').asstring ='0') and (qventas1.FieldByName('kilos').asstring <>'0') then
              begin

                  kilosvientos:= floattostrf(qventas1.Fieldbyname('kilos').Asfloat, ffnumber,10,2);
                  preciokilos:= floattostrf(qventas1.fieldbyname('precio').asfloat, ffnumber,10,2);

                  kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);

                  cajasvientos:=floattostrf((strtofloat(kilosvientos)/(cantiempa)),ffnumber,10,2);
                  preciocajas:= floattostrf((strtofloat(preciokilos)*(cantiempa)), ffnumber,10,2);

                  cajasvientos:= stripped(',', cajasvientos);
                  preciocajas:= stripped(',', preciocajas);
               end;

         if (qventas1.FieldByName('cajas').asstring <>'0') and (qventas1.FieldByName('kilos').asstring <>'0') then
                  begin

                    kilosvientos:= floattostrf(qventas1.Fieldbyname('kilos').Asfloat, ffnumber,10,2);
                    preciokilos:= floattostrf(qventas1.fieldbyname('precio').asfloat, ffnumber,10,2);

                    kilosvientos:= stripped(',', kilosvientos);
                    preciokilos:= stripped(',', preciokilos);


                     cajasvientos:= floattostrf(qventas1.fieldbyname('cajas').asfloat, ffnumber,10,2);
                     TOTALDETOT:= floattostrf((strtofloat(kilosvientos)* strtofloat(preciokilos)), ffnumber,10,2);

                     cajasvientos:= stripped(',', cajasvientos);
                     totaldetot:= stripped(',', totaldetot);

                     preciocajas:= floattostrf((strtofloat(TOTALDETOT)/ strtofloat(CAJASVIENTOS)), ffnumber,10,2);

                     preciocajas:= stripped(',', preciocajas);
              end;

              cosprocaj:= qcanemp.fieldbyname('cos_pro_caj').asstring;
              cosprokil:=  qcanemp.fieldbyname('cos_pro_kgs').asstring;
              costoventa:= floattostr(strtofloat(cosprocaj) * strtofloat(cajasvientos));
      end;


                       sinsertacot1.Params[0].AsString:= '04';
                       sinsertacot1.Params[1].AsString:= '04';
                       sinsertacot1.Params[2].Asinteger:= qventas1.fieldbyname('folio').AsInteger;
                       sinsertacot1.Params[3].AsString:= qventas1.fieldbyname('codigo').Asstring;
                       sinsertacot1.Params[4].AsDATE:= fechavientos.Date;
                       sinsertacot1.Params[5].Asstring:= qventas1.fieldbyname('tipo').asstring;
                       sinsertacot1.Params[6].Asstring:= cod_cli;
                       sinsertacot1.Params[7].Asfloat:= strtofloat(kilosvientos);
                       sinsertacot1.Params[8].Asfloat:= strtofloat(cajasvientos);
                       sinsertacot1.Params[9].Asfloat:= strtofloat(cosprokil);
                       sinsertacot1.Params[10].Asfloat:= strtofloat(cosprocaj);
                       sinsertacot1.Params[11].Asfloat:= strtofloat(preciokilos);
                       sinsertacot1.Params[12].Asfloat:= strtofloat(preciocajas);

                   TDESCTO.Close;
                   TDESCTO.Open;
                   if qventas1.FieldByName('descto').AsFloat <> 0 then
                        totdescto:= TDESCTO.FIELDBYNAME('PORCENTAJE').ASFLOAT
                   else
                        totdescto:= 0;

                       sinsertacot1.Params[13].Asfloat := totdescto;
                       sinsertacot1.Params[14].Asfloat := 0;   // AQUI VA EL FLETE

                       sinsertacot1.Params[15].Asinteger:= qventas1.fieldbyname('renglon').AsInteger;
                       sinsertacot1.Params[16].Asfloat := qventas1.fieldbyname('totiva').AsFLOAT;
                      sinsertacot1.Params[17].Asstring:= form4.cod_agente;
                       sinsertacot1.ExecProc;

              qventas1.next;


              if (strtoFLOAT(kilosvientos) > 1000 ) and (cod_cli ='O14L') then
                      futus := 1;
      end;


      //AQUI PASO EL PLATANO EN EL TICKET

    {    qventas4.Close;
      //  qventas4.ParamByName('folio').AsString:= tfolio.Text;
        qventas4.ParamByName('folio').AsString:= num_corre;
        QVENTAS4.PARAMBYNAME('NUM_EMP').ASSTRING := NUM_EMPRESA.TEXT;
        qventas4.Open;




        while not  qventas4.eof do
         begin

                 convkoc:= qventas4.fieldbyname('tipo').asstring;
             if convkoc = 'K' then
              begin
                  qcanemp.Close;
                  qcanemp.ParamByName('cod_Art').asstring:= qventas4.fieldbyname('codigo').AsString;
                  qcanemp.ParamByName('num_emp').asstring:= qventas4.fieldbyname('num_emp').AsString;
                  qcanemp.Open;
                  cantiempa:= strtofloat(floattostrf(qcanemp.fields[6].asFLOAT, ffnumber, 10,2));




          if (qventas4.FieldByName('cajas').asstring ='0') and (qventas4.FieldByName('kilos').asstring <> '0') then
                begin
                  kilosvientos:= floattostrf(qventas4.fieldbyname('kilos').asfloat, ffnumber, 10,2);
                  preciokilos:= floattostrf(qventas4.fieldbyname('precio').asfloat, ffnumber, 10,2);

                  kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);

                 cajasvientos:= floattostrf((strtofloat(kilosvientos)/cantiempa), ffnumber,10,2);
                 preciocajas:=floattostrf((strtofloat(preciokilos) * cantiempa), ffnumber,10,2);

                 cajasvientos:= stripped(',', cajasvientos);
                 preciocajas:= stripped(',', preciocajas);

                end;

         if (qventas4.FieldByName('cajas').asstring <>'0') and (qventas4.FieldByName('kilos').asstring ='0') then
                begin
                  cajasvientos:= floattostrf(qventas4.fieldbyname('cajas').asfloat, ffnumber,10,2);
                  preciocajas:= floattostrf(qventas4.fieldbyname('precio').asfloat, ffnumber,10,2);

                  cajasvientos:= stripped(',', cajasvientos);
                  preciocajas:= stripped(',', preciocajas);


                  kilosvientos:= floattostrf((cantiempa * strtofloat(cajasvientos)),ffnumber,10,2);
                  preciokilos:= floattostrf((strtofloat(preciocajas)/cantiempa), ffnumber,10,2);

                  kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);


                 end;

           if (qventas4.FieldByName('cajas').asstring <>'0') and (qventas4.FieldByName('kilos').asstring <>'0') then
                begin
                  kilosvientos:= floattostrf(qventas4.fieldbyname('kilos').asfloat, ffnumber,10,2);
                  preciokilos:= floattostrf(qventas4.fieldbyname('precio').asfloat, ffnumber,10,2);

                  kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);


                  cajasvientos:= floattostrf(qventas4.fieldbyname('CAJAS').asfloat, ffnumber,10,2);
                  preciocajas:= floattostrf((strtofloat(preciokilos)* cantiempa), ffnumber,10,2);

                  cajasvientos:= stripped(',', cajasvientos);
                  preciocajas:= stripped(',', preciocajas);



                end;

              cosprocaj:= qCANEMP.fieldbyname('cos_pro_caj').asstring;
              cosprokil:=  qCANEMP.fieldbyname('cos_pro_kgs').asstring;
              costoventa:= floattostr(strtofloat(cosprokil) * strtofloat(kilosvientos));
        end;



    if convkoc = 'C' then
      begin
                 qcanemp.Close;
                  qcanemp.ParamByName('cod_Art').asstring:= qventas4.fieldbyname('codigo').AsString;
                  qcanemp.ParamByName('num_emp').asstring:= qventas4.fieldbyname('num_emp').AsString;
                  qcanemp.Open;
                  cantiempa:= strtofloat(floattostrf(qcanemp.fields[6].asFLOAT, ffnumber, 10,2));


         if (qventas4.FieldByName('cajas').asstring <>'0') and (qventas4.FieldByName('kilos').asstring ='0') then
              begin
                cajasvientos:= floattostrf(qventas4.Fieldbyname('cajas').Asfloat, ffnumber,10,2);
                preciocajas:= floattostrf(qventas4.fieldbyname('precio').asfloat, ffnumber,10,2);

                cajasvientos:= stripped(',', cajasvientos);
                  preciocajas:= stripped(',', preciocajas);


                kilosvientos:= floattostrf((cantiempa * strtofloat(cajasvientos)), ffnumber,10,2);
                preciokilos:= floattostrf((strtofloat(preciocajas)/cantiempa), ffnumber,10,2);

                 kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);


              end;

         if (qventas4.FieldByName('cajas').asstring ='0') and (qventas4.FieldByName('kilos').asstring <>'0') then
              begin

                  kilosvientos:= floattostrf(qventas4.Fieldbyname('kilos').Asfloat, ffnumber,10,2);
                  preciokilos:= floattostrf(qventas4.fieldbyname('precio').asfloat, ffnumber,10,2);

                  kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);

                  cajasvientos:=floattostrf((strtofloat(kilosvientos)/(cantiempa)),ffnumber,10,2);
                  preciocajas:= floattostrf((strtofloat(preciokilos)*(cantiempa)), ffnumber,10,2);

                  cajasvientos:= stripped(',', cajasvientos);
                  preciocajas:= stripped(',', preciocajas);
               end;

         if (qventas4.FieldByName('cajas').asstring <>'0') and (qventas4.FieldByName('kilos').asstring <>'0') then
                  begin

                    kilosvientos:= floattostrf(qventas4.Fieldbyname('kilos').Asfloat, ffnumber,10,2);
                    preciokilos:= floattostrf(qventas4.fieldbyname('precio').asfloat, ffnumber,10,2);

                    kilosvientos:= stripped(',', kilosvientos);
                    preciokilos:= stripped(',', preciokilos);


                     cajasvientos:= floattostrf(qventas4.fieldbyname('cajas').asfloat, ffnumber,10,2);
                     TOTALDETOT:= floattostrf((strtofloat(kilosvientos)* strtofloat(preciokilos)), ffnumber,10,2);

                     cajasvientos:= stripped(',', cajasvientos);
                     totaldetot:= stripped(',', totaldetot);

                     preciocajas:= floattostrf((strtofloat(TOTALDETOT)/ strtofloat(CAJASVIENTOS)), ffnumber,10,2);

                     preciocajas:= stripped(',', preciocajas);
              end;

              cosprocaj:= qcanemp.fieldbyname('cos_pro_caj').asstring;
              cosprokil:=  qcanemp.fieldbyname('cos_pro_kgs').asstring;
              costoventa:= floattostr(strtofloat(cosprocaj) * strtofloat(cajasvientos));
      end;


                       sinsertacot1.Params[0].AsString:= '08';
                       sinsertacot1.Params[1].AsString:= '08';
                       sinsertacot1.Params[2].Asinteger:= qventas4.fieldbyname('folio').AsInteger;
                       sinsertacot1.Params[3].AsString:= qventas4.fieldbyname('codigo').Asstring;
                       sinsertacot1.Params[4].AsDATE:= fechavientos.Date;
                       sinsertacot1.Params[5].Asstring:= qventas4.fieldbyname('tipo').asstring;
                       sinsertacot1.Params[6].Asstring:= cod_cli;
                       sinsertacot1.Params[7].Asfloat:= strtofloat(kilosvientos);
                       sinsertacot1.Params[8].Asfloat:= strtofloat(cajasvientos);
                       sinsertacot1.Params[9].Asfloat:= strtofloat(cosprokil);
                       sinsertacot1.Params[10].Asfloat:= strtofloat(cosprocaj);
                       sinsertacot1.Params[11].Asfloat:= strtofloat(preciokilos);
                       sinsertacot1.Params[12].Asfloat:= strtofloat(preciocajas);

                   TDESCTO.Close;
                   TDESCTO.Open;
                   if qventas4.FieldByName('descto').AsFloat <> 0 then
                        totdescto:= TDESCTO.FIELDBYNAME('PORCENTAJE').ASFLOAT
                   else
                        totdescto:= 0;

                       sinsertacot1.Params[13].Asfloat := totdescto;
                       sinsertacot1.Params[14].Asfloat := 0;   // AQUI VA EL FLETE

                       sinsertacot1.Params[15].Asinteger:= qventas4.fieldbyname('renglon').AsInteger;
                       sinsertacot1.Params[16].Asfloat := qventas4.fieldbyname('totiva').AsFLOAT;
                      sinsertacot1.Params[17].Asstring:= form4.cod_agente;
                       sinsertacot1.ExecProc;

              qventas4.next;


              if (strtoFLOAT(kilosvientos) > 1000 ) and (cod_cli ='O14L') then
                      futus := 1;
      end;    }

       //actualizo si lleva platano y aguacate de la emp 01 a la 08 en la tabla de ventas


       qactuemp8.close;
        qactuemp8.ParamByName('folio').AsString:= tfolio.Text;
        qactuemp8.PARAMBYNAME('NUM_EMP').ASSTRING := NUM_EMPRESA.TEXT;
        qactuemp8.EXECSQL;


       // aqui mando a imprimir el ticket

        if (TIPO_FAC.ItemIndex = 1)  then
                   begin
                             if COD_CLI = '9999' then
                                 facturin:= '9999'
                             ELSE
                                 facturin:= consetick;

                            if COD_CLI = '5555' then
                                 facturin:= '5555';



                       storedproc3.Params[0].AsString:= '04';
                       storedproc3.Params[1].AsString:= '04';
                   //    storedproc3.Params[2].Asinteger:= strtoint(tfolio.text);
                       storedproc3.Params[2].Asinteger:= strtoint(num_corre);
                       storedproc3.Params[3].asdate:= fechavientos.date;
                       storedproc3.Params[4].Asstring:= form4.cod_agente;
                       storedproc3.Params[5].asSTRING:= CONSETICK;
                       storedproc3.params[6].AsString:= cod_CLI;
                       storedproc3.params[7].Asstring:= FACTURIN;
                       storedproc3.params[8].Asstring:= efectivo.text;    // efectivo
                       storedproc3.params[9].Asstring:= transf.text;    // bonos
                       storedproc3.params[10].Asstring:= dolar.text;    // dolares
                       storedproc3.params[11].Asstring:= cheque.text;    // cheque
                       storedproc3.params[12].Asstring:= cheqpref.Text;    // cheque pref.
                       // aqui va la fecha del cheque    CAMBIARLA
                       storedproc3.params[13].AsSTRING:= '';
                       storedproc3.params[14].Asstring:= form4.nombrecaja;
                      //       usuario cajera
                       storedproc3.ExecProc;
                  END;





               if tipo_fac.itemIndex = 1 then
                          begin
                            fac_tipo:= 'Tic';
                            impri_tick2
                          end
                   else
                         fac_tipo:= 'Fac';

                         if (COD_CLI ='S235L') THEN
                              FACTUROTA := SORI.remi
                             ELSE
                              FACTUROTA := FACTU.Text;



                         IF  ((COD_CLI ='D215L') OR (COD_CLI ='D81L')) then
                                 FACTUROTA := form19.remi
                             ELSE
                              FACTUROTA := FACTU.Text;



                    if envia_tipo = 2 then
                    tipo_envia := 'CRE'
                       else
                    tipo_envia:= 'CON';



                   { corte_caja.open;
                    corte_caja.AppendRecord([strtoint(tfolio.text),strtoint(factuRIN),tnombre.text, form4.agente1, tot_efectivo, bonos.text,
                    cheque.text, dolar.text, tot, tipo_envia,  fac_tipo, fechavientos.Date, premp,premp,codigocli,IVAIMPRE]);
                    corte_caja.close;


                     agregar_corte.Close;
                     agregar_corte.ParamByName('folio').asinteger := strtoint(tfolio.text);
                     agregar_corte.ParamByName('factura').asstring := facturota;
                     agregar_corte.ParamByName('nombre').asstring := nom_cli;
                     agregar_corte.ParamByName('agente').asstring := form4.agente1;
                     agregar_corte.ParamByName('efe').asstring := efectivo.text;
                     agregar_corte.ParamByName('tran').asstring := transf.text;
                     agregar_corte.ParamByName('cheq').asstring := cheque.text;
                     agregar_corte.ParamByName('dola').asstring := dolar.text;
                     agregar_corte.ParamByName('exeimp').asstring := floattostr(imp_exe);
                     agregar_corte.ParamByName('enviatipo').asstring := tipo_envia;
                     agregar_corte.ParamByName('tipofac').asstring := fac_tipo;
                     agregar_corte.ParamByName('vientos').asdate := fechavientos.date;
                     agregar_corte.ParamByName('empr').asstring := '08';
                     agregar_corte.ParamByName('sucu').asstring := '08';
                     agregar_corte.ParamByName('clicod').asstring := cod_cli;
                     agregar_corte.ParamByName('impiva').asstring := '0';
                     agregar_corte.ParamByName('pasar').asstring := '0';
                     agregar_corte.ExecSQL;   }



                   { insert into corte_new values (strtoint(tfolio.text), facturota, nom_cli, form4.agente1, efectivo.text, transf.Text, cheque.Text, dolar.Text, imp_exe, tipo_envia, fac_tipo,
                        fechavientos.date, '08', '08', cod_cli, '0');

                       }

                     sinsertacot4.Params[0].Asinteger:= strtoint(tfolio.text);
                    //   sinsertacot4.Params[0].Asinteger:= strtoint(num_corre);
                       sinsertacot4.Params[1].AsString:= facturota;
                       sinsertacot4.Params[2].Asstring:= nom_cli;
                       sinsertacot4.Params[3].AsString:= form4.agente1;
                       sinsertacot4.Params[4].Asstring:= efectivo.Text;
                       sinsertacot4.Params[5].Asstring:= transf.text;
                       sinsertacot4.Params[6].Asstring:= cheque.text;
                       sinsertacot4.Params[7].Asstring:= dolar.text;
                       sinsertacot4.Params[8].Asfloat:= IMP_EXE;
                       sinsertacot4.Params[9].Asstring:= tipo_envia;
                       sinsertacot4.Params[10].Asstring:= fac_tipo;
                       sinsertacot4.Params[11].Asdate:= fechavientos.Date;
                       sinsertacot4.Params[12].Asstring:= '04';
                       sinsertacot4.Params[13].Asstring:= '04';
                       sinsertacot4.Params[14].Asstring:= cod_CLI;
                       sinsertacot4.Params[15].Asstring:= '0';
                       sinsertacot4.ExecProc;


                       IF (CHEQPREF.TEXT <> '0') OR (TDEBITO.TEXT <> '0') THEN
                       BEGIN

                           UPCORTECAJA.CLOSE;
                           UPCORTECAJA.open;
                           upcortecaja.appendrecord([facturota,tdebito.Text, cheqpref.Text, '04']);
                           UPCORTECAJA.CLOSE;



                       END;



       //AQUI TERMINO DE GUARDAR los aguacates

          qventas2.Close;
       //   qventas2.ParamByName('folio').AsString:= tfolio.Text;
         qventas2.ParamByName('folio').AsString:= num_corre;
          qventas2.ParamByName('num_emp').AsString:= num_empresa.Text;
          qventas2.Open;

        IMP_EXE := 0;


        IF QVENTAS2.FIELDBYNAME('NUM_EMP').ASSTRING <> '' THEN
        BEGIN

      //aqui empiezo a guardar los que no son aguacates

                       sinsertacot.Params[0].AsString:= '01';
                       sinsertacot.Params[1].AsString:= '01';
                    //   sinsertacot.Params[2].Asinteger:= strtoint(tfolio.text);
                       sinsertacot.Params[2].Asinteger:= strtoint(num_corre);
                       sinsertacot.Params[3].AsString:= cod_cli;

               if (cod_cli = '9999') or (cod_cli ='5555') then
                    sinsertacot.Params[4].AsString:= alias.text
                 else
                    sinsertacot.Params[4].AsString:= nom_cli;

                       sinsertacot.Params[5].AsString:= tdire.text;
                       sinsertacot.Params[6].AsString:= ciu_cli;
                       sinsertacot.Params[7].AsString:= est_cli;
                       sinsertacot.Params[8].AsString:= trfc.Text;
                       sinsertacot.Params[9].Asstring:= form4.cod_agente;


                           IF IVATOTAL <> 0 THEN
                      BEGIN
                         coniva3:=FLOATTOSTRF((ivatotal / (16/100)),FFNUMBER,10,2);
                         CONIVA3:= STRIPPED(',',CONIVA3);
                         CONIVA:= STRTOFLOAT(CONIVA3);


                      END
                      ELSE
                      BEGIN
                         CONIVA:= 0;
                      END;


                          IF IEPSTOTAL <> 0 THEN
                            BEGIN
                            conieps3:= FLOATTOSTRF((iepstotal / (8/100)),FFNUMBER,10,2);
                            CONIEPS3:= STRIPPED(',', CONIEPS3);
                            CONIEPS:= STRTOFLOAT(CONIEPS3);
                            END
                            ELSE
                            BEGIN
                            CONIEPS:= 0;
                            END;


                            imp_exe3:= FLOATTOSTRF((subtotal  - conieps - CONIVA - qtotventas.fields[0].asfloat ),FFNUMBER,10,2);
                            IMP_EXE3 := STRIPPED(',',IMP_EXE3);
                            IMP_EXE := STRTOFLOAT(IMP_EXE3);

                                 TOTICK23 := FLOATTOSTRF((CONIVA + CONIEPS+ IMP_EXE + IVATOTAL + IEPSTOTAL ),FFNUMBER,10,2);
                                 TOTICK23 := STRIPPED(',', TOTICK23);
                                 TOTICK2:= STRTOFLOAT(TOTICK23);




                      //aqui voy a sacar el ieps  para inarcot


                       sinsertacot.Params[10].Asfloat:= imp_exe;
                       sinsertacot.Params[11].Asfloat:= coniva;
                       sinsertacot.Params[12].Asfloat:= ivatotal;
                       sinsertacot.Params[13].AsDATE := fechavientos.Date;
                       sinsertacot.Params[14].Asfloat:= 0;  //strtofloat(costoventa);     // AQUI VA EL COSTO VENTA INVESTIGAR COMO SE CALC.
                       sinsertacot.Params[15].Asfloat:= ACUDES;
                       sinsertacot.ExecProc;

                     {   imp_exe4 := imp_exe;
                       ivatotal4 := coniva;
                       iepstotal4 := iepstotal;  }

      if conieps <> 0 then
        begin

        //agrego en iva_6 el ieps...

        iepsinarcot.close;
      //  iepsinarcot.parambyname('folio').asstring:= tfolio.text;
      iepsinarcot.parambyname('folio').asstring:= num_corre;
        iepsinarcot.parambyname('ieps').asstring:= floattostr(conieps);
        iepsinarcot.execsql;

        end;


        qventas2.Close;
     //   qventas2.ParamByName('folio').AsString:= tfolio.Text;
        qventas2.ParamByName('folio').AsString:= num_corre;
        qventas2.ParamByName('num_emp').AsString:= num_empresa.Text;
        qventas2.Open;


        while not  qventas2.eof do
         begin

                 convkoc:= qventas2.fieldbyname('tipo').asstring;
        if convkoc = 'K' then
                   begin
                  qcanemp.Close;
                  qcanemp.ParamByName('cod_Art').asstring:= qventas2.fieldbyname('codigo').AsString;
                  qcanemp.ParamByName('num_emp').asstring:= qventas2.fieldbyname('num_emp').AsString;
                  qcanemp.Open;
                  cantiempa:= strtofloat(floattostrf(qcanemp.fields[6].asFLOAT, ffnumber, 10,2));




         if (qventas2.FieldByName('cajas').asstring ='0') and (qventas2.FieldByName('kilos').asstring <> '0') then
                begin
                  kilosvientos:= floattostrf(qventas2.fieldbyname('kilos').asfloat, ffnumber, 10,2);
                  preciokilos:= floattostrf(qventas2.fieldbyname('precio').asfloat, ffnumber, 10,2);

                  kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);

                 cajasvientos:= floattostrf((strtofloat(kilosvientos)/cantiempa), ffnumber,10,2);
                 preciocajas:=floattostrf((strtofloat(preciokilos) * cantiempa), ffnumber,10,2);

                 cajasvientos:= stripped(',', cajasvientos);
                 preciocajas:= stripped(',', preciocajas);

                end;

         if (qventas2.FieldByName('cajas').asstring <>'0') and (qventas2.FieldByName('kilos').asstring ='0') then
                begin
                  cajasvientos:= floattostrf(qventas2.fieldbyname('cajas').asfloat, ffnumber,10,2);
                  preciocajas:= floattostrf(qventas2.fieldbyname('precio').asfloat, ffnumber,10,2);

                  cajasvientos:= stripped(',', cajasvientos);
                  preciocajas:= stripped(',', preciocajas);


                  kilosvientos:= floattostrf((cantiempa * strtofloat(cajasvientos)),ffnumber,10,2);
                  preciokilos:= floattostrf((strtofloat(preciocajas)/cantiempa), ffnumber,10,2);

                  kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);


                 end;

           if (qventas2.FieldByName('cajas').asstring <>'0') and (qventas2.FieldByName('kilos').asstring <>'0') then
                begin
                  kilosvientos:= floattostrf(qventas2.fieldbyname('kilos').asfloat, ffnumber,10,2);
                  preciokilos:= floattostrf(qventas2.fieldbyname('precio').asfloat, ffnumber,10,2);

                  kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);


                  cajasvientos:= floattostrf(qventas2.fieldbyname('CAJAS').asfloat, ffnumber,10,2);
                  preciocajas:= floattostrf((strtofloat(preciokilos)* cantiempa), ffnumber,10,2);

                  cajasvientos:= stripped(',', cajasvientos);
                  preciocajas:= stripped(',', preciocajas);



                end;

              cosprocaj:= qCANEMP.fieldbyname('cos_pro_caj').asstring;
              cosprokil:=  qCANEMP.fieldbyname('cos_pro_kgs').asstring;
              costoventa:= floattostr(strtofloat(cosprokil) * strtofloat(kilosvientos));
        end;



   if convkoc = 'C' then
      begin
                 qcanemp.Close;
                  qcanemp.ParamByName('cod_Art').asstring:= qventas2.fieldbyname('codigo').AsString;
                  qcanemp.ParamByName('num_emp').asstring:= qventas2.fieldbyname('num_emp').AsString;
                  qcanemp.Open;
                  cantiempa:= strtofloat(floattostrf(qcanemp.fields[6].asFLOAT, ffnumber, 10,2));


         if (qventas2.FieldByName('cajas').asstring <>'0') and (qventas2.FieldByName('kilos').asstring ='0') then
              begin
                cajasvientos:= floattostrf(qventas2.Fieldbyname('cajas').Asfloat, ffnumber,10,2);
                preciocajas:= floattostrf(qventas2.fieldbyname('precio').asfloat, ffnumber,10,2);

                cajasvientos:= stripped(',', cajasvientos);
                  preciocajas:= stripped(',', preciocajas);


                kilosvientos:= floattostrf((cantiempa * strtofloat(cajasvientos)), ffnumber,10,2);
                preciokilos:= floattostrf((strtofloat(preciocajas)/cantiempa), ffnumber,10,2);

                 kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);


              end;

         if (qventas2.FieldByName('cajas').asstring ='0') and (qventas2.FieldByName('kilos').asstring <>'0') then
              begin

                  kilosvientos:= floattostrf(qventas2.Fieldbyname('kilos').Asfloat, ffnumber,10,2);
                  preciokilos:= floattostrf(qventas2.fieldbyname('precio').asfloat, ffnumber,10,2);

                  kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);

                  cajasvientos:=floattostrf((strtofloat(kilosvientos)/(cantiempa)),ffnumber,10,2);
                  preciocajas:= floattostrf((strtofloat(preciokilos)*(cantiempa)), ffnumber,10,2);

                  cajasvientos:= stripped(',', cajasvientos);
                  preciocajas:= stripped(',', preciocajas);
               end;

         if (qventas2.FieldByName('cajas').asstring <>'0') and (qventas2.FieldByName('kilos').asstring <>'0') then
                  begin

                    kilosvientos:= floattostrf(qventas2.Fieldbyname('kilos').Asfloat, ffnumber,10,2);

                      IF (COD_CLI ='O14L') AND (CODIGOART.Text = 'C401EC') THEN
                  BEGIN
                     preciokilos:= floattostrf(qventas2.fieldbyname('TOTAL').asfloat / qventas2.fieldbyname('KILOS').asfloat, ffnumber,10,2);
                  END
                   ELSE
                      preciokilos:= floattostrf(qventas2.fieldbyname('precio').asfloat, ffnumber,10,2);

                    kilosvientos:= stripped(',', kilosvientos);
                    preciokilos:= stripped(',', preciokilos);


                     cajasvientos:= floattostrf(qventas2.fieldbyname('cajas').asfloat, ffnumber,10,2);

                      IF (COD_CLI ='O14L') AND (qventas.Fieldbyname('CODIGO').AsSTRING = 'C401EC') THEN
                    BEGIN
                     TOTALDETOT:= floattostrf(qventas2.fieldbyname('TOTAL').asfloat, ffnumber,10,2);
                    END
                    ELSE
                     TOTALDETOT:= floattostrf((strtofloat(kilosvientos)* strtofloat(preciokilos)), ffnumber,10,2);


                     cajasvientos:= stripped(',', cajasvientos);
                     totaldetot:= stripped(',', totaldetot);

                     preciocajas:= floattostrf((strtofloat(TOTALDETOT)/ strtofloat(CAJASVIENTOS)), ffnumber,10,2);

                     preciocajas:= stripped(',', preciocajas);
              end;

              cosprocaj:= qcanemp.fieldbyname('cos_pro_caj').asstring;
              cosprokil:=  qcanemp.fieldbyname('cos_pro_kgs').asstring;
              costoventa:= floattostr(strtofloat(cosprocaj) * strtofloat(cajasvientos));
      end;

                   //busco si tiene ieps...


                    busiepcot.close;
                    busiepcot.parambyname('renglon').asinteger :=  qventas2.FieldByName('renglon').asinteger;
                    busiepcot.parambyname('cod_Art').asstring := qventas2.FieldByName('codigo').asstring;
                    busiepcot.open;



                        IF BUSIEPCOT.FIELDBYNAME('totieps').ASSTRING <> '' THEN
                          BEGIN
                            PRECIOKILOS := FLOATTOSTR(STRTOFLOAT(PRECIOKILOS) / (1+(8/100)));
                            PRECIOCAJAS := FLOATTOSTR(STRTOFLOAT(PRECIOCAJAS) / (1+(8/100)));
                          END;


                       sinsertacot1.Params[0].AsString:= '01';
                       sinsertacot1.Params[1].AsString:= '01';
                       sinsertacot1.Params[2].Asinteger:= qventas2.fieldbyname('folio').AsInteger;
                       sinsertacot1.Params[3].AsString:= qventas2.fieldbyname('codigo').Asstring;
                       sinsertacot1.Params[4].AsDATE:= fechavientos.Date;
                       sinsertacot1.Params[5].Asstring:= qventas2.fieldbyname('tipo').asstring;
                       sinsertacot1.Params[6].Asstring:= cod_cli;
                       sinsertacot1.Params[7].Asfloat:= strtofloat(kilosvientos);
                       sinsertacot1.Params[8].Asfloat:= strtofloat(cajasvientos);
                       sinsertacot1.Params[9].Asfloat:= strtofloat(cosprokil);
                       sinsertacot1.Params[10].Asfloat:= strtofloat(cosprocaj);
                       sinsertacot1.Params[11].Asfloat:= strtofloat(preciokilos);
                       sinsertacot1.Params[12].Asfloat:= strtofloat(preciocajas);

                   TDESCTO.Close;
                   TDESCTO.Open;
                   if qventas2.FieldByName('descto').AsFloat <> 0 then
                        totdescto:= TDESCTO.FIELDBYNAME('PORCENTAJE').ASFLOAT
                   else
                        totdescto:= 0;

                       sinsertacot1.Params[13].Asfloat := totdescto;
                       sinsertacot1.Params[14].Asfloat := 0;   // AQUI VA EL FLETE

                       sinsertacot1.Params[15].Asinteger:= qventas2.fieldbyname('renglon').AsInteger;
                       sinsertacot1.Params[16].Asfloat := qventas2.fieldbyname('totiva').AsFLOAT;
                      sinsertacot1.Params[17].Asstring:= form4.cod_agente;
                       sinsertacot1.ExecProc;





              // agrego el ieps en inarcot1

              if BUSIEPCOT.FIELDBYNAME('totieps').ASSTRING <> '' then
              begin
              iepsinarcot1.close;
              iepsinarcot1.parambyname('num_doc').asstring:= qventas2.fieldbyname('folio').asstring;
              iepsinarcot1.parambyname('cod_art').asstring:= qventas2.fieldbyname('codigo').asstring;
              iepsinarcot1.parambyname('ren_art').asinteger:= qventas2.fieldbyname('renglon').Asinteger;
              iepsinarcot1.parambyname('ieps').asstring:= floattostr(conieps);
              iepsinarcot1.execsql;

              end;


            qventas2.next;



              if (strtoFLOAT(kilosvientos) > 1000 ) and (cod_cli ='O14L') then
                      futus := 1;
       end;   //AQUI TERMINO DE GUARDAR los que no son aguacates



       //AQUI MANDO A IMPRIMIR EL OTRO TICKET

               if (TIPO_FAC.ItemIndex = 1)  then
                       begin
                             if COD_CLI = '9999' then
                                 facturin:= '9999'
                             ELSE
                                 facturin:= consetick;

                            if COD_CLI = '5555' then
                                 facturin:= '5555';



                       storedproc3.Params[0].AsString:= '01';
                       storedproc3.Params[1].AsString:= '01';
                    //   storedproc3.Params[2].Asinteger:= strtoint(tfolio.text);
                       storedproc3.Params[2].Asinteger:= strtoint(num_corre);
                       storedproc3.Params[3].asdate:= fechavientos.date;
                       storedproc3.Params[4].Asstring:= form4.cod_agente;
                       storedproc3.Params[5].asSTRING:= CONSETICK;
                       storedproc3.params[6].AsString:= cod_CLI;
                       storedproc3.params[7].Asstring:= FACTURIN;
                       storedproc3.params[8].Asstring:= efectivo.text;    // efectivo
                       storedproc3.params[9].Asstring:= transf.text;    // bonos
                       storedproc3.params[10].Asstring:= dolar.text;    // dolares
                       storedproc3.params[11].Asstring:= cheque.text;    // cheque
                       storedproc3.params[12].Asstring:= cheqpref.Text;    // cheque pref.
                       // aqui va la fecha del cheque    CAMBIARLA
                       storedproc3.params[13].AsSTRING:= '';
                       storedproc3.params[14].Asstring:= form4.nombrecaja;
                      //       usuario cajera
                       storedproc3.ExecProc;
                  END;


              if iepstotal <> 0 then
              begin
              ins_ieps.close;
              ins_ieps.parambyname('num_doc').asstring:= consetick;
              ins_ieps.parambyname('imp_6').asstring:= floattostr(conieps);
              ins_ieps.parambyname('iva_6').asstring:= floattostr(iepstotal);
              ins_ieps.execsql;

              end;


               if tipo_fac.itemIndex = 1 then
                          begin
                            fac_tipo:= 'Tic';
                            impri_tick
                          end
                   else
                         fac_tipo:= 'Fac';


                     if (COD_CLI ='S235L') THEN
                              FACTUROTA := SORI.remi
                             ELSE
                              FACTUROTA := FACTU.Text;



                         IF  ((COD_CLI ='D215L') OR (COD_CLI ='D81L')) then
                                 FACTUROTA := form19.remi
                             ELSE
                              FACTUROTA := FACTU.Text;


                     if envia_tipo = 2 then
                    tipo_envia := 'CRE'
                       else
                    tipo_envia:= 'CON';

                       sinsertacot4.Params[0].Asinteger:= strtoint(tfolio.text);
                 //   sinsertacot4.Params[0].Asinteger:= strtoint(num_corre);
                       sinsertacot4.Params[1].AsString:= facturota;
                       sinsertacot4.Params[2].Asstring:= nom_cli;
                       sinsertacot4.Params[3].AsString:= form4.agente1;
                       sinsertacot4.Params[4].Asstring:= efectivo.Text;
                       sinsertacot4.Params[5].Asstring:= transf.text;
                       sinsertacot4.Params[6].Asstring:= cheque.text;
                       sinsertacot4.Params[7].Asstring:= dolar.text;
                       sinsertacot4.Params[8].Asfloat:= TOTICK2;
                       sinsertacot4.Params[9].Asstring:= tipo_envia;
                       sinsertacot4.Params[10].Asstring:= fac_tipo;
                       sinsertacot4.Params[11].Asdate:= fechavientos.Date;
                       sinsertacot4.Params[12].Asstring:= '01';
                       sinsertacot4.Params[13].Asstring:= '01';
                       sinsertacot4.Params[14].Asstring:= cod_CLI;
                       sinsertacot4.Params[15].Asstring:= edit10.Text;
                       sinsertacot4.ExecProc;



                            IF (CHEQPREF.TEXT <> '0') OR (TDEBITO.TEXT <> '0') THEN
                       BEGIN

                           UPCORTECAJA.CLOSE;
                           UPCORTECAJA.open;
                           upcortecaja.appendrecord([facturota,tdebito.Text, cheqpref.Text, '01']);
                           UPCORTECAJA.CLOSE;



                       END;



      END;

    END;

  END;

      IF DIV_TICK = 0 THEN
      BEGIN                            //SE COMENTA HASTA AQUI LO DE QUITAR EL TICKET DE NEZE
            //AQUI EMPIEZO EL TICKET SOLO

                     //primero inserto en inarcot e inarcot1

                       sinsertacot.Params[0].AsString:= num_empRESA.text;
                       sinsertacot.Params[1].AsString:= num_empresa.text;
                   //    sinsertacot.Params[2].Asinteger:= strtoint(tfolio.text);
                       sinsertacot.Params[2].Asinteger:= strtoint(num_corre);
                       sinsertacot.Params[3].AsString:= cod_cli;

               if (cod_cli = '9999') or (cod_cli ='5555') then
                    sinsertacot.Params[4].AsString:= alias.text
                 else
                    sinsertacot.Params[4].AsString:= nom_cli;

                       sinsertacot.Params[5].AsString:= tdire.text;
                       sinsertacot.Params[6].AsString:= ciu_cli;
                       sinsertacot.Params[7].AsString:= est_cli;
                       sinsertacot.Params[8].AsString:= trfc.Text;
                       sinsertacot.Params[9].Asstring:= form4.cod_agente;


                      IF IVATOTAL <> 0 THEN
                      BEGIN
                         coniva3:=FLOATTOSTRF((ivatotal / (16/100)),FFNUMBER,10,2);
                         CONIVA3:= STRIPPED(',',CONIVA3);
                         CONIVA:= STRTOFLOAT(CONIVA3);
                      END
                      ELSE
                      BEGIN
                         CONIVA := 0;
                      END;



                            IF IEPSTOTAL <> 0 THEN
                            BEGIN
                            conieps3:= FLOATTOSTRF((iepstotal / (8/100)),FFNUMBER,10,2);
                            CONIEPS3:= STRIPPED(',', CONIEPS3);
                            CONIEPS:= STRTOFLOAT(CONIEPS3);
                            END
                            ELSE
                            BEGIN
                              CONIEPS := 0;
                            END; 


                            imp_exe3:= FLOATTOSTRF((subtotal  - conieps - CONIVA),FFNUMBER,10,2);
                            IMP_EXE3 := STRIPPED(',',IMP_EXE3);
                            IMP_EXE := STRTOFLOAT(IMP_EXE3);


                       sinsertacot.Params[10].Asfloat:= imp_exe;
                       sinsertacot.Params[11].Asfloat:= coniva;
                       sinsertacot.Params[12].Asfloat:= ivatotal;
                       sinsertacot.Params[13].AsDATE := fechavientos.Date;
                       sinsertacot.Params[14].Asfloat:= 0;  //strtofloat(costoventa);     // AQUI VA EL COSTO VENTA INVESTIGAR COMO SE CALC.
                       sinsertacot.Params[15].Asfloat:= ACUDES;
                       sinsertacot.ExecProc;

                    {    imp_exe4 := imp_exe;
                       ivatotal4 := ivatotal;
                       iepstotal4 := iepstotal;  }


       //guardo en inarcot la informacion dela factura

        if conieps <> 0 then
        begin

        //agrego en iva_6 el ieps...

        iepsinarcot.close;
        iepsinarcot.parambyname('folio').asstring:= tfolio.text;
        iepsinarcot.parambyname('ieps').asstring:= floattostr(conieps);
        iepsinarcot.parambyname('IVA_ieps').asstring:= floattostr(iepstotal);
        iepsinarcot.execsql;

        end;



        qventas.Close;
         qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
       // qventas.ParamByName('folio').AsString:= tfolio.Text;
        qventas.ParamByName('folio').AsString:= num_corre;
        qventas.Open;


        while not  qventas.eof do
         begin

                 convkoc:= qventas.fieldbyname('tipo').asstring;
                 if convkoc = 'K' then
                   begin
                  qcanemp.Close;
                  qcanemp.ParamByName('cod_Art').asstring:= qventas.fieldbyname('codigo').AsString;
                  qcanemp.ParamByName('num_emp').asstring:= qventas.fieldbyname('num_emp').AsString;
                  qcanemp.Open;
                  cantiempa:= strtofloat(floattostrf(qcanemp.fields[6].asFLOAT, ffnumber, 10,2));




          if (qventas.FieldByName('cajas').asstring ='0') and (qventas.FieldByName('kilos').asstring <> '0') then
                begin
                  kilosvientos:= floattostrf(qventas.fieldbyname('kilos').asfloat, ffnumber, 10,2);
                  preciokilos:= floattostrf(qventas.fieldbyname('precio').asfloat, ffnumber, 10,2);

                  kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);

                 cajasvientos:= floattostrf((strtofloat(kilosvientos)/cantiempa), ffnumber,10,2);
                 preciocajas:=floattostrf((strtofloat(preciokilos) * cantiempa), ffnumber,10,2);

                 cajasvientos:= stripped(',', cajasvientos);
                 preciocajas:= stripped(',', preciocajas);

                end;

         if (qventas.FieldByName('cajas').asstring <>'0') and (qventas.FieldByName('kilos').asstring ='0') then
                begin
                  cajasvientos:= floattostrf(qventas.fieldbyname('cajas').asfloat, ffnumber,10,2);
                  preciocajas:= floattostrf(qventas.fieldbyname('precio').asfloat, ffnumber,10,2);

                  cajasvientos:= stripped(',', cajasvientos);
                  preciocajas:= stripped(',', preciocajas);


                  kilosvientos:= floattostrf((cantiempa * strtofloat(cajasvientos)),ffnumber,10,2);
                  preciokilos:= floattostrf((strtofloat(preciocajas)/cantiempa), ffnumber,10,2);

                  kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);


                 end;

           if (qventas.FieldByName('cajas').asstring <>'0') and (qventas.FieldByName('kilos').asstring <>'0') then
                begin
                  kilosvientos:= floattostrf(qventas.fieldbyname('kilos').asfloat, ffnumber,10,2);
                  preciokilos:= floattostrf(qventas.fieldbyname('precio').asfloat, ffnumber,10,2);

                  kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);


                  cajasvientos:= floattostrf(qventas.fieldbyname('CAJAS').asfloat, ffnumber,10,2);
                  preciocajas:= floattostrf((strtofloat(preciokilos)* cantiempa), ffnumber,10,2);

                  cajasvientos:= stripped(',', cajasvientos);
                  preciocajas:= stripped(',', preciocajas);



                end;
              cosprocaj:= qCANEMP.fieldbyname('cos_pro_caj').asstring;
              cosprokil:=  qCANEMP.fieldbyname('cos_pro_kgs').asstring;
              costoventa:= floattostr(strtofloat(cosprokil) * strtofloat(kilosvientos));
        end;



    if convkoc = 'C' then
      begin
                 qcanemp.Close;
                  qcanemp.ParamByName('cod_Art').asstring:= qventas.fieldbyname('codigo').AsString;
                  qcanemp.ParamByName('num_emp').asstring:= qventas.fieldbyname('num_emp').AsString;
                  qcanemp.Open;
                  cantiempa:= strtofloat(floattostrf(qcanemp.fields[6].asFLOAT, ffnumber, 10,2));


         if (qventas.FieldByName('cajas').asstring <>'0') and (qventas.FieldByName('kilos').asstring ='0') then
              begin
                cajasvientos:= floattostrf(qventas.Fieldbyname('cajas').Asfloat, ffnumber,10,2);
                preciocajas:= floattostrf(qventas.fieldbyname('precio').asfloat, ffnumber,10,2);

                cajasvientos:= stripped(',', cajasvientos);
                  preciocajas:= stripped(',', preciocajas);


                kilosvientos:= floattostrf((cantiempa * strtofloat(cajasvientos)), ffnumber,10,2);
                preciokilos:= floattostrf((strtofloat(preciocajas)/cantiempa), ffnumber,10,2);

                 kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);


              end;

         if (qventas.FieldByName('cajas').asstring ='0') and (qventas.FieldByName('kilos').asstring <>'0') then
              begin

                  kilosvientos:= floattostrf(qventas.Fieldbyname('kilos').Asfloat, ffnumber,10,2);
                  preciokilos:= floattostrf(qventas.fieldbyname('precio').asfloat, ffnumber,10,2);

                  kilosvientos:= stripped(',', kilosvientos);
                  preciokilos:= stripped(',', preciokilos);

                  cajasvientos:=floattostrf((strtofloat(kilosvientos)/(cantiempa)),ffnumber,10,2);
                  preciocajas:= floattostrf((strtofloat(preciokilos)*(cantiempa)), ffnumber,10,2);

                  cajasvientos:= stripped(',', cajasvientos);
                  preciocajas:= stripped(',', preciocajas);
               end;

         if (qventas.FieldByName('cajas').asstring <>'0') and (qventas.FieldByName('kilos').asstring <>'0') then
                  begin

                    kilosvientos:= floattostrf(qventas.Fieldbyname('kilos').Asfloat, ffnumber,10,2);

                  IF (COD_CLI ='O14L') AND (qventas.Fieldbyname('CODIGO').AsSTRING = 'C401EC') THEN
                  BEGIN
                     preciokilos:= floattostrf(qventas.fieldbyname('TOTAL').asfloat / qventas.fieldbyname('KILOS').asfloat, ffnumber,10,2);
                  END
                   ELSE
                      preciokilos:= floattostrf(qventas.fieldbyname('precio').asfloat, ffnumber,10,2);

                    kilosvientos:= stripped(',', kilosvientos);
                    preciokilos:= stripped(',', preciokilos);


                     cajasvientos:= floattostrf(qventas.fieldbyname('cajas').asfloat, ffnumber,10,2);

                   IF (COD_CLI ='O14L') AND (CODIGOART.Text = 'C401EC') THEN
                    BEGIN
                     TOTALDETOT:= floattostrf(qventas.fieldbyname('TOTAL').asfloat, ffnumber,10,2);
                    END
                    ELSE
                     TOTALDETOT:= floattostrf((strtofloat(kilosvientos)* strtofloat(preciokilos)), ffnumber,10,2);

                     cajasvientos:= stripped(',', cajasvientos);
                     totaldetot:= stripped(',', totaldetot);

                     preciocajas:= floattostrf((strtofloat(TOTALDETOT)/ strtofloat(CAJASVIENTOS)), ffnumber,10,2);

                     preciocajas:= stripped(',', preciocajas);

                 end;

              cosprocaj:= qcanemp.fieldbyname('cos_pro_caj').asstring;
              cosprokil:=  qcanemp.fieldbyname('cos_pro_kgs').asstring;
              costoventa:= floattostr(strtofloat(cosprocaj) * strtofloat(cajasvientos));
      end;



                           //busco si tiene ieps...


                    busiepcot.close;
                    busiepcot.parambyname('renglon').asinteger :=  qventas.FieldByName('renglon').asinteger;
                    busiepcot.parambyname('cod_Art').asstring := qventas.FieldByName('codigo').asstring;
                    busiepcot.open;


                       sinsertacot1.Params[0].AsString:= num_empresa.Text;
                       sinsertacot1.Params[1].AsString:= num_empresa.Text;
                       sinsertacot1.Params[2].Asinteger:= qventas.fieldbyname('folio').AsInteger;
                       sinsertacot1.Params[3].AsString:= qventas.fieldbyname('codigo').Asstring;
                       sinsertacot1.Params[4].AsDATE:= fechavientos.Date;
                       sinsertacot1.Params[5].Asstring:= qventas.fieldbyname('tipo').asstring;
                       sinsertacot1.Params[6].Asstring:= cod_cli;
                       sinsertacot1.Params[7].Asfloat:= strtofloat(kilosvientos);
                       sinsertacot1.Params[8].Asfloat:= strtofloat(cajasvientos);
                       sinsertacot1.Params[9].Asfloat:= strtofloat(cosprokil);
                       sinsertacot1.Params[10].Asfloat:= strtofloat(cosprocaj);
                       sinsertacot1.Params[11].Asfloat:= strtofloat(preciokilos);
                       sinsertacot1.Params[12].Asfloat:= strtofloat(preciocajas);

                   TDESCTO.Close;
                   TDESCTO.Open;
                   if qventas.FieldByName('descto').AsFloat <> 0 then
                        totdescto:= TDESCTO.FIELDBYNAME('PORCENTAJE').ASFLOAT
                   else
                        totdescto:= 0;

                       sinsertacot1.Params[13].Asfloat := totdescto;
                       sinsertacot1.Params[14].Asfloat := 0;   // AQUI VA EL FLETE

                       sinsertacot1.Params[15].Asinteger:= qventas.fieldbyname('renglon').AsInteger;
                       sinsertacot1.Params[16].Asfloat := qventas.fieldbyname('totiva').AsFLOAT;
                      sinsertacot1.Params[17].Asstring:= form4.cod_agente;
                       sinsertacot1.ExecProc;

                // agrego el ieps en inarcot1

              if BUSIEPCOT.FIELDBYNAME('totieps').ASSTRING <> '' then
              begin
              iepsinarcot1.close;
              iepsinarcot1.parambyname('num_doc').asstring:= qventas.fieldbyname('folio').asstring;
              iepsinarcot1.parambyname('cod_art').asstring:= qventas.fieldbyname('codigo').asstring;
              iepsinarcot1.parambyname('ren_art').asinteger:= qventas.fieldbyname('renglon').Asinteger;
              iepsinarcot1.parambyname('ieps').asstring:= floattostr(conieps);
              iepsinarcot1.execsql;

              end;


              qventas.next;



              if (strtoFLOAT(kilosvientos) > 1000 ) and (cod_cli ='O14L') then
                      futus := 1;
      end;   //AQUI TERMINO DE GUARDAR SI SOLO ES UN TICKET


               // AQUI GRABO LO KE ESTA EN INARCOT E INARCOT1

                   if (TIPO_FAC.ItemIndex = 0) and (cod_cli = 'O14L') and (futus = 1) then
                      begin
                            AL_SUPER;
                      END;

                   if (TIPO_FAC.ItemIndex = 0) and (futus = 0)  then
                      begin
                         // MANDA INFO A AFECTAR INVENTARIOS este es el strore  inserta_factinv
                       storedproc1.Params[0].AsString:= NUM_EMPRESA.TEXT;
                       storedproc1.Params[1].AsString:= NUM_eMPRESA.TEXT;
                     //  storedproc1.Params[2].Asinteger:= strtoint(tfolio.text);
                       storedproc1.Params[2].Asinteger:= strtoint(num_corre);
                       storedproc1.Params[3].asdate:= fechavientos.date;
                       storedproc1.Params[4].Asstring:= form4.cod_agente;

                         if (COD_CLI ='S235L') THEN
                              FACTUROTA := SORI.remi
                             ELSE
                              FACTUROTA := FACTU.Text;



                         IF  ((COD_CLI ='D215L') OR (COD_CLI ='D81L')) then
                                 FACTUROTA := form19.remi
                             ELSE
                              FACTUROTA := FACTU.Text;

                       storedproc1.Params[5].asstring:= facturota;
                       storedproc1.params[6].AsString:= cod_CLI;
                       storedproc1.params[7].Asstring:= inttostr(envia_tipo);
                       storedproc1.params[8].Asstring:= form4.nombrecaja;
                       storedproc1.ExecProc;

                         end;


                    if (TIPO_FAC.ItemIndex = 1)  then
                       begin
                             if COD_CLI = '9999' then
                                 facturin:= '9999'
                             ELSE
                                 facturin:= consetick;

                            if COD_CLI = '5555' then
                                 facturin:= '5555';



                       storedproc3.Params[0].AsString:= NUM_EMPRESA.TEXT;
                       storedproc3.Params[1].AsString:= NUM_EMPRESA.TEXT;
                   //    storedproc3.Params[2].Asinteger:= strtoint(tfolio.text);
                       storedproc3.Params[2].Asinteger:= strtoint(num_corre);
                       storedproc3.Params[3].asdate:= fechavientos.date;
                       storedproc3.Params[4].Asstring:= form4.cod_agente;
                       storedproc3.Params[5].asSTRING:= CONSETICK;
                       storedproc3.params[6].AsString:= cod_CLI;
                       storedproc3.params[7].Asstring:= FACTURIN;
                       storedproc3.params[8].Asstring:= efectivo.text;    // efectivo
                       storedproc3.params[9].Asstring:= transf.text;    // bonos
                       storedproc3.params[10].Asstring:= dolar.text;    // dolares
                       storedproc3.params[11].Asstring:= cheque.text;    // cheque
                       storedproc3.params[12].Asstring:= cheqpref.Text;    // cheque pref.  }
                       // aqui va la fecha del cheque    CAMBIARLA
                       storedproc3.params[13].AsSTRING:= '';
                       storedproc3.params[14].Asstring:= form4.nombrecaja;
                      //       usuario cajera
                       storedproc3.ExecProc;


                     //aqui agrego en inarpvt si tiene ieps

              if (iepstotal <> 0) then
              begin

                ins_ieps.close;
                ins_ieps.parambyname('num_doc').asstring:= consetick;
                ins_ieps.parambyname('imp_6').asstring:= floattostr(conieps);
                ins_ieps.parambyname('iva_6').asstring:= floattostr(iepstotal);
                ins_ieps.execsql;

              end;



           END;


               if tipo_fac.itemIndex = 1 then
                          begin
                            fac_tipo:= 'Tic';
                            impri_tick
                          end
                   else
                      begin
                          fac_tipo:= 'Fac';





                      if   (papel = 1)
                      THEN
                             BEGIN


                             cfditxt;
                          //  ESTE ES EL PROCESO PARA EL NUEVO PROVEEDOR      nuevo_prov;
                            copiaryabrir;
                             INC_FAC;

                        END;




                     IF (papel = 0) THEN
                        begin
                           CREAr_PDF;
                        end;
               end;

                         if (COD_CLI ='S235L') THEN
                              FACTUROTA := SORI.remi
                             ELSE
                              FACTUROTA := FACTU.Text;

                         IF  ((COD_CLI ='D215L') OR (COD_CLI ='D81L')) then
                                 FACTUROTA := form19.remi
                             ELSE
                              FACTUROTA := FACTU.Text;

                   if envia_tipo = 2 then
                    tipo_envia := 'CRE'
                       else
                    tipo_envia:= 'CON';

                      sinsertacot4.Params[0].Asinteger:= strtoint(tfolio.text);
                   //    sinsertacot4.Params[0].Asinteger:= strtoint(num_corre);
                       sinsertacot4.Params[1].AsString:= facturota;
                       sinsertacot4.Params[2].Asstring:= nom_cli;
                       sinsertacot4.Params[3].AsString:= form4.agente1;
                       sinsertacot4.Params[4].Asstring:= efectivo.Text;
                       sinsertacot4.Params[5].Asstring:= transf.text;
                       sinsertacot4.Params[6].Asstring:= cheque.text;
                       sinsertacot4.Params[7].Asstring:= dolar.text;
                       sinsertacot4.Params[8].Asfloat:= tot;
                       sinsertacot4.Params[9].Asstring:= tipo_envia;
                       sinsertacot4.Params[10].Asstring:= fac_tipo;
                       sinsertacot4.Params[11].Asdate:= fechavientos.Date;
                       sinsertacot4.Params[12].Asstring:= num_empresa.Text;
                       sinsertacot4.Params[13].Asstring:= num_empresa.text;
                       sinsertacot4.Params[14].Asstring:= cod_CLI;
                       sinsertacot4.Params[15].Asstring:= edit10.Text;
                       sinsertacot4.ExecProc;



                           IF (CHEQPREF.TEXT <> '0') OR (TDEBITO.TEXT <> '0') THEN
                       BEGIN

                           UPCORTECAJA.CLOSE;
                           UPCORTECAJA.open;
                           upcortecaja.appendrecord([facturota,tdebito.Text, cheqpref.Text, num_empresa.text]);
                           UPCORTECAJA.CLOSE;



                       END;



  end;

                    MENSAJE3.Mensa3.CLOSE;
                    MENSAJE4.Mensa4.Caption := 'ENVIAR CORREO Y ACTUALIZANDO INF.';
                    MENSAJE4.Mensa4.Show;

         // AGREGO LA INFO A CORTE CAJA

                             if (COD_CLI ='S235L') THEN
                              FACTUROTA := SORI.remi
                             ELSE
                              FACTUROTA := FACTU.Text;



                         IF  ((COD_CLI ='D215L') OR (COD_CLI ='D81L')) then
                                 FACTUROTA := form19.remi
                             ELSE
                              FACTUROTA := FACTU.Text;

        YALOGRABE := 0;


          // AQUI SE HACE EL PAGO DE LA FACT SI ES A CONTADO
          if (pla_clie = '0') and (tipo_fac.ItemIndex = 0)   then
          begin

               IF EFECTIVO.Text <> '0' THEN
                        FORMA_PA := 'EF';

               IF CHEQUE.Text <> '0' THEN
                        FORMA_PA := 'CH';

               IF CHEQPREF.Text <> '0' THEN
                        FORMA_PA := 'TC';

               IF TDEBITO.Text <> '0' THEN
                        FORMA_PA := 'TD';

               IF TRANSF.Text <> '0' THEN
                        FORMA_PA := 'TR';

               IF DOLAR.Text <> '0' THEN
                        FORMA_PA := 'EF';

               IF FORMA_PA = '' THEN
                        FORMA_PA := 'EF';


               IF TIPO_FAC.ItemIndex = 0 THEN
                      NUMERODE := FACTUrota;

               IF TIPO_FAC.itemindex = 1 then
                      numerode := consetick;

               if nocheque.text = '' then
                    nocheque.Text := '0';

               tmp_pago.Open;
               tmp_pago.AppendRecord([numerode, cod_cli, edit1.Text, edit10.Text, datetostr(fechavientos.date),
               FORMA_PA, dbbanco.Text, nocheque.Text, 'NO', EFECTIVO.Text, transf.Text, cheque.Text, dolar.Text,
               cheqpref.Text, TDEBITO.TEXT, form4.agente1,'0']);
               tmp_pago.Close;


               YALOGRABE:= 1;

          end;

          IF (TIPO_PAGO.ItemIndex = 1) AND  (tipo_fac.ItemIndex = 0)  THEN
          BEGIN

                IF EFECTIVO.Text <> '0' THEN
                        FORMA_PA := 'EF';

               IF CHEQUE.Text <> '0' THEN
                        FORMA_PA := 'CH';

               IF CHEQPREF.Text <> '0' THEN
                        FORMA_PA := 'TC';

               IF TDEBITO.Text <> '0' THEN
                        FORMA_PA := 'TD';

               IF TRANSF.Text <> '0' THEN
                        FORMA_PA := 'TR';

               IF DOLAR.Text <> '0' THEN
                        FORMA_PA := 'EF';

               IF FORMA_PA = '' THEN
                        FORMA_PA := 'EF';


               IF TIPO_FAC.ItemIndex = 0 THEN
                      NUMERODE := FACTUrota;

               IF TIPO_FAC.itemindex = 1 then
                      numerode := consetick;

               if nocheque.text = '' then
                    nocheque.Text := '0';

                IF YALOGRABE = 0 THEN
                BEGIN

               tmp_pago.Open;
               tmp_pago.AppendRecord([numerode, cod_cli, edit1.Text, edit10.Text, datetostr(fechavientos.date),
               FORMA_PA, dbbanco.Text, nocheque.Text, 'NO', EFECTIVO.Text, transf.Text, cheque.Text, dolar.Text,
               cheqpref.Text, tdebito.Text, form4.agente1,'0']);
               tmp_pago.Close;

               END;

          END;


           qespera2.close;
           qespera2.execsql;



           //hacer update en ventas comyleg y en ventas tableta


               IF EDIT3.TEXT <> '' THEN
               BEGIN
                       upvtastab.close;
                       upvtastab.parambyname('folio').asstring := edit3.text;
                       upvtastab.parambyname('num_emp').asstring := num_empresa.text;
                       upvtastab.parambyname('folio_col').asstring := tfolio.text;
                       upvtastab.execsql;

               END;

           

       qcorreo.close;
       qcorreo.parambyname('cod_cli').asstring:= cod_cli;
       qcorreo.parambyname('NUM_EMP').asstring:= NUM_EMPRESA.Text;
       qcorreo.open;

       if qcorreo.FieldByName('email').AsString <> '' then
        begin

         enviar_mail;

        end;


          qsucur.close;
          csucursal.keyvalue:= Null;

          if tipo_fac.ItemIndex = 0 then
           begin
               TIPO_PAG:= 'FA';
           END;

         if tipo_fac.ItemIndex = 1 then
         begin
              TIPO_PAG:= 'TI';
         END;


          BUSFOLIO.TEXT := '';

          IMP_REST.ItemIndex := 1;

          SUCUFIN:= CSUCURSAL.TEXT;

          ENTROFOLIO := 1;

          actu_folio;

           agente_ori := '';

          HORA:= TIMETOSTR(TIME);

          qhora.close;
          qhora.parambyname('factu').asstring := factu.text;
          qhora.parambyname('hora').asstring := hora;
          qhora.execsql;

                      qborra_tmpfa.close;
                      qborra_tmpfa.ParamByName('num_doc').AsString := factu.Text;
                      qborra_tmpfa.ExecSQL;

                           inicializa;
                           FORM5.EDIT1.TEXT := '';
                           form11.Edit1.text := '';
                           MENSAJE4.Mensa4.Close;

         enD;

        END;

      end;



      //AQUI REVISO SI HAY ACTUALIZACION DE PRECIOS Y LOS MANDO...


       subo:= 0;

       qcolesa.close;
      qcolesa.Open;

      qtablet.close;
      qtablet.open;

      if (qcolesa.FieldByName('no_actu').AsString = qtablet.FieldByName('no_actu').AsString) and
         (qcolesa.FieldByName('fecha').AsString = qtablet.FieldByName('fecha').AsString) then
        begin
           exit;
        end
        else
        begin

          if  (qcolesa.FieldByName('fecha').AsString = qtablet.FieldByName('fecha').AsString) and
              (qcolesa.FieldByName('no_actu').AsString <> qtablet.FieldByName('no_actu').AsString) then
                        begin
                              actualiza.close;

                              actualiza.EmptyTable;

                              actualiza.close;
                              actualiza.open;
                              actualiza.AppendRecord([qcolesa.FieldByName('no_actu').AsString, qcolesa.FieldByName('fecha').AsString]);

                              subo := 1;
                        end;

            if  (qcolesa.FieldByName('fecha').AsString <> qtablet.FieldByName('fecha').AsString) then
                        begin
                               actualiza.close;

                              actualiza.EmptyTable;

                              actualiza.close;
                              actualiza.open;
                              actualiza.AppendRecord([qcolesa.FieldByName('no_actu').AsString, qcolesa.FieldByName('fecha').AsString]);

                              subo := 1;
                        end;
        end;


     if subo = 1 then
     begin
       qborrota.Close;
       qborrota.execsql;

       //luego lo subo


       qlistata.Close;
       qlistata.open;

      listaprecios2.Close;

       while not qlistata.eof do
       begin


             listaprecios2.Open;
             listaprecios2.AppendRecord([qlistata.fields[0].asstring, qlistata.fields[1].asstring,qlistata.fields[2].asstring,
             qlistata.fields[3].asstring,qlistata.fields[4].asstring,qlistata.fields[5].asstring,qlistata.fields[6].asstring]);

             qlistata.Next;
       end;



      end;





end;

procedure tform9.UUID;
var
  SomeTxtFile : TextFile;
  nom_factu, Lineau, lineafinu, linea1: String;
  ENTRO, INICIO : INTEGER;
begin
  ENTRO := 0;

  nom_factu := '' ;

  if num_empresa.Text = '01' then
  nom_factu:= 'Z:\XMLs\A_CLE8908119N6_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';
//  nom_factu:= 'C:\PAXConectorGTColesa\XMLGenerado\A_CLE8908119N6_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';

  if num_empresa.Text = '04' then
  nom_factu:= 'Z:\XMLs\A_EIGZ6711088J4_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';


  if num_empresa.Text = '08' then
  nom_factu:= 'Z:\XMLs\A_LNE111123HW3_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';


  AssignFile(SomeTxtFile, nom_factu ) ;
  Reset(SomeTxtFile) ;
  REPEAT
      Readln(SomeTxtFile,Lineau);
      IF LINEAU = '' THEN
      BEGIN
            // AQUI LO GRABO EN TXT Y LO LEO PARA SACAR EL UUID
                    INICIO := POS('UUID', LINEA1);
                    LINEAFINU := COPY(LINEA1, INICIO +6, 36);
                    ENTRO := 1;
                    BREAK;

      END;
      lineau:= trim(lineau);
      LINEA1 := LINEAU;

 UNTIL Copy(Lineau,1,4) = 'UUID';
  CloseFile(SomeTxtFile) ;

  IF ENTRO = 0 THEN
      lineafinu := copy(lineau,7,36);

  qguardau.close;
  qguardau.parambyname('num_doc').asstring := factu.text;
  qguardau.parambyname('uuid').asstring := lineafinu;
  qguardau.execsql;

  lineau := '';



END;




procedure tform9.al_super;
begin

    qinarcot.Close;
    qinarcot.ParamByName('num_doc').AsString:= tfolio.Text;
    qinarcot.open;

    tinartrcl.open;
    tinartrcl.appendrecord([num_empresa.Text, num_empresa.Text, cod_cli, 'FA', FACTU.Text, TOT , tot, qinarcot.FieldByName('iva_15').AsString, datetostr(fechavientos.Date)]);
    tinartrcl.close;


    tdocumento.open;
    tdocumento.appendrecord([num_empresa.Text, num_empresa.text, 'FA', FACTU.Text, TOT, DATETOSTR(FECHAVIENTOS.Date)]);
    tdocumento.close;


    tinarfac.open;
    tinarfac.appendrecord([qinarcot.Fields[0].AsString, qinarcot.Fields[1].AsString, factu.text,
    qinarcot.Fields[3].AsString,qinarcot.Fields[4].AsString,qinarcot.Fields[5].AsString,qinarcot.Fields[6].AsString,
    qinarcot.Fields[7].AsString,qinarcot.Fields[9].AsString,qinarcot.Fields[10].AsString,qinarcot.Fields[11].AsString,
    qinarcot.Fields[12].AsString,qinarcot.Fields[13].AsString,qinarcot.Fields[14].AsString,qinarcot.Fields[15].AsString,
    qinarcot.Fields[16].AsString,qinarcot.Fields[17].AsString,qinarcot.Fields[18].AsString,qinarcot.Fields[19].AsString,
    qinarcot.Fields[20].AsString,qinarcot.Fields[21].AsString,qinarcot.Fields[22].AsString,qinarcot.Fields[23].AsString,
    qinarcot.Fields[24].AsString,qinarcot.Fields[25].AsString,qinarcot.Fields[26].AsString,qinarcot.Fields[27].AsString,
    qinarcot.Fields[28].AsString,qinarcot.Fields[29].AsString,qinarcot.Fields[30].AsString,qinarcot.Fields[31].AsString,
    qinarcot.Fields[32].AsString,qinarcot.Fields[33].AsString,qinarcot.Fields[34].AsString,qinarcot.Fields[35].AsString,
    datetostr(fechavientos.Date),qinarcot.Fields[8].AsString,'2',form4.nombrecaja]);
    tinarfac.close;

    qinarcot1.Close;
    qinarcot1.ParamByName('num_doc').AsString:= tfolio.Text;
    qinarcot1.open;

    tinartrinv.open;

    while not  qinarcot1.Eof do
    begin
    tinartrinv.appendrecord([qinarcot1.Fields[0].AsString, qinarcot1.Fields[1].AsString, qinarcot1.Fields[2].AsString,
    qinarcot1.Fields[3].AsString,'FA' , factu.text,qinarcot1.Fields[6].AsString,
    qinarcot1.Fields[7].AsString,'0','0',
    qinarcot1.Fields[8].AsString,qinarcot1.Fields[9].AsString,qinarcot1.Fields[10].AsString,qinarcot1.Fields[11].AsString,
    qinarcot1.Fields[12].AsString,qinarcot1.Fields[13].AsString,qinarcot1.Fields[14].AsString,'',qinarcot1.Fields[15].AsString,
    '','', qinarcot1.Fields[16].AsString]);

    qinarcot1.Next;

    end;
    tinartrinv.Close;
    qinarcot.Close;
    qinarcot1.Close;

end;

procedure tform9.impri_tick;
var
  adevicemode : thandle;
  adevice, adriver, aport: array [0..255] of char;
  con_col, x,y, I, J, currentport: Integer;
  printerinfo, printCommand, horafinal, canti: string;
 ieps_tick , CONSE, pre_uni,fin_tot,  iva_cal, tot_iva, tot_imp, iva,importe, cantidad: real;
  Device, Driver, Port: array[0..255] of Char;
    hDeviceMode: THandle;
    ENCONTRADA_IMP:  BOOLEAN;
    apunta : string;

begin

     fin_tot:=0;
     cantidad:= 0;
     canti:= '0';
     importe:=0;
     tot_imp := 0;
     iva:= 0;
     tot_iva := 0;
     pre_uni:= 0;
     ven_tot:= 0;
     iva_cal:= 0;

     horafinal:= timetostr(time);

   //AQUI VOY A COMENTAR TODO LO DE LA PRINTER
   {
     currentport:= printer.printerindex;
     for I := 1 to printer.Printers.Count-1  do
         begin
         printer.PrinterIndex:= i;
         printer.GetPrinter(adevice,adriver,aport,adevicemode);
         if (adevice = 'caja') then
          begin
            break;
          end;
         end;   }
    // impresion del encabezado.

   i:=0;
    //buscar printer
    Encontrada_Imp:= False;
    while ((not Encontrada_Imp ) and
    (i <= Printer.Printers.Count-1)) do
    begin
        apunta := UpperCase(Printer.Printers.Strings [i]);

        if Pos('CAJA', UpperCase(Printer.Printers.Strings [i])) <> 0  then
          // Pos(CAJERITA, UpperCase(Printer.Printers.Strings [i])) <> 0 then
          //(Pos('IMPRESTA', UpperCase(Printer.Printers.Strings [i])) <> 0)  then
           begin

              printCommand := 'printto';
              printer.PrinterIndex:= i;
              printer.GetPrinter(device,driver,port,hdevicemode);
              printerInfo := Format('"%s" "%s" "%s"', [Device, Driver, Port]) ;


    printer.begindoc;
  // printer.canvas.font.name :='ms sans serif';
    Printer.Canvas.Font.Name := 'Arial';
     Printer.Canvas.Font.Size := 18;
     Printer.Canvas.Font.Style := [fsBold];
   // printer.canvas.font.size :=9;
    printer.Canvas.textout(1,50,'COMESTIBLES Y LEGUMBRES, SA DE CV');
    printer.canvas.textout(1,150,'CALLE AA BODEGAS 26 Y 28 C. DE ABASTOS');
    printer.canvas.TextOut(1,250,'CHIHUAHUA,CHIH.');


  //  printer.canvas.font.name :='ms sans serif';

  //   Printer.Canvas.Font.Name := 'Arial';
  //   Printer.Canvas.Font.Size := 18;
  //   Printer.Canvas.Font.Style := [fsBold];
     printer.canvas.TextOut(1,450,datetostr(fechavientos.date)+' '+{tfecha.text} horafinal);


 //   printer.canvas.font.name :='ms sans serif';
 //   printer.canvas.font.size :=9;
    printer.canvas.TextOut(1,750,'CLE890811 9N6'+'     CONSECUTIVO '+(CONSETICK));
    printer.canvas.TextOut(1,850,'TEL (614)4200602'+ '    C-'+form4.agente1);

    Printer.canvas.textout(1,950,'----------------------------------------');
    printer.canvas.textout(1,1050,'         DESCRIPCION');
    printer.canvas.textout(1,1150,'CANT.    PRECIO   IMPORTE');
    printer.canvas.textout(1,1250,'----------------------------------------');
    // impresion del cuerpo del ticket


//    IF EDIT3.TEXT <> '' THEN
 //   BEGIN

                       qventas.Close;
                      qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                       qventas.ParamByName('folio').AsString:= TFOLIO.TEXT;
                       qventas.Open;

                        nombre_table:= QVENTAS.FIELDBYNAME('NOMBRE').ASSTRING;


  {    QPPAL.Close;
      qppal.parambyname('folio').asstring:= EDIT3.TEXT;
      qppal.parambyname('nombre').AsString:= nombre_table;
      qppal.ParamByName('num_emp').AsString:= num_empresa.Text;
      qppal.open;
      qppal.First;


    END
    ELSE
    BEGIN  }

      QPPAL.Close;
      qppal.parambyname('folio').asstring:= tfolio.text;
      qppal.parambyname('nombre').AsString:= form4.agente1;
      qppal.ParamByName('num_emp').AsString:= num_empresa.Text;
      qppal.open;
      qppal.First;

  //  END;


    x:= 1;
    y:= 1450;
    con_col:= 0;
    while not qppal.Eof do
    begin
      cantidad:= (strtofloat(qppal.fieldbyname('Total').asstring)) / (strtofloat (qppal.fieldbyname('Precio').asstring));
      canti:= floattostrf(cantidad,ffnumber,10,2);
      importe:= strtofloat(qppal.fieldbyname('Total').AsString);
      tot_imp:= tot_imp + importe;
      iva:= strtofloat(qppal.fieldbyname('Totiva').AsString);
      tot_iva := tot_iva + iva;
      pre_uni:= strtofloat(qppal.fieldbyname('Precio').AsString);

      //SACAR IVA DE IEPS_VTAS

      QIEPSITO.CLOSE;
      qiepsito.ParamByName('folio').asstring := tfolio.text;
      qiepsito.ParamByName('RENGLON').asstring := qppal.fieldbyname('RENGLON').AsString;
      qiepsito.parambyname('codigo').AsString := qppal.fieldbyname('codigo').AsString;
      qiepsito.Open;

      if qiepsito.Fields[0].AsString <> '' then
      begin
          ieps_tick := ieps_tick + qiepsito.fieldbyname('TOTieps').asfloat;
      end;



      printer.Canvas.textout(x,y,qppal.fieldbyname('descripcion').AsString);
      printer.Canvas.textout(x,y+100,canti );
      printer.Canvas.textout(x+600,y+100,floattostrf(pre_uni, ffnumber, 10,2 ));
      printer.Canvas.textout(x+1100,y+100,floattostrf(importe, ffcurrency, 10,2));
      y:= y + 200;
      con_col:= con_col + 1;
      qppal.Next;
     end;

     // impresion del final ticket

     printer.canvas.textout (1,y,'________________________________________');

//     fin_tot:= tot_imp-tot_iva-ieps_tick;
       fin_tot:= tot_imp;
     printer.canvas.textout(750,Y+200, 'IMPORTE         '+floattostrf(fin_tot, ffcurrency, 10,2));

//     ven_tot:= tot_imp-iva_cal;
         ven_tot:= tot_imp+TOT_IVA+IEPS_TICK;

     printer.canvas.textout(750, y+ 300, 'TOTAL A PAGAR   '+floattostrf(VEN_tot, ffcurrency, 10,2));


     printer.canvas.textout(750, y+ 400, 'PAGADO          '+'0');

      qppal.Last;
      Printer.canvas.textout(500,y+600,'TOTAL ARTICULOS ---> '+inttostr(con_col));




      printer.canvas.font.name :='ms sans serif';
      printer.canvas.font.size :=8;
      printer.canvas.TextOut(1,y+800,'POR ESTE PAGARE ME (NOS) OBLIGO (AMOS)');
      printer.canvas.TextOut(1,Y+900,'A PAGAR INCONDICIONALMENTE A LA ORDEN');
      printer.canvas.TextOut(1,Y+1000,'DE COMESTIBLES Y LEGUMBRES, SA DE');
      printer.canvas.TextOut(1,Y+1100,'CV EN SU DOMICILIO LA CANTIDAD DE  ');
      printer.canvas.TextOut(1,y+1200,floattostrf(VEN_tot,ffcurrency,10,2)+'Son  '+ '('+ dineroconletra(VEN_tot)+ ')');
      printer.canvas.TextOut(1,y+1300,'IMPORTE DE MERCANCIA RECIBIDA A NUESTRA');
      printer.canvas.TextOut(1,y+1400,'ENTERA SATISFACCION ');
      printer.canvas.TextOut(1,Y+1500,'ESTE PAGARE CAUSARA INTERESES MORATORIOS');
      printer.canvas.Textout(1,Y+1600,'A RAZON DE ______ % MENSUAL DESPUES DE');
      printer.canvas.textout(1,Y+1700,'SU VENCIMIENTO');
      printer.canvas.textout(1,Y+1800, '___________________________________');
      printer.canvas.textout(1,Y+1900, 'ACEPTO VENTAS DE CONTADO');
      printer.canvas.textout(1,Y+2100, 'ESTA NOTA DE VENTA FORMA PARTE DE LA');
      printer.canvas.textout(1,Y+2200, 'FACTURA GLOBAL QUE POR VENTAS DIARIAS');
      printer.canvas.textout(1,Y+2300, 'PREPARA LA EMPRESA');
      printer.canvas.textout(1,Y+2400, '___________________________________');




    printer.EndDoc;

   Encontrada_Imp:= True
  end
    else
     inc(i);
    end;


end;


procedure tform9.impri_tick2;
var
  adevicemode : thandle;
  adevice, adriver, aport: array [0..255] of char;
  con_col, x,y, I,J, currentport: Integer;
 printerinfo, printCommand, horafinal, canti: string;
 CONSE, pre_uni,fin_tot, iva_cal, tot_iva, tot_imp, iva,importe, cantidad: real;
 Device, Driver, Port: array[0..255] of Char;
    hDeviceMode: THandle;
    ENCONTRADA_IMP:  BOOLEAN;
    apunta : string;

begin

     fin_tot:=0;
     cantidad:= 0;
     canti:= '0';
     importe:=0;
     tot_imp := 0;
     iva:= 0;
     tot_iva := 0;
     pre_uni:= 0;
     ven_tot:= 0;
     iva_cal:= 0;

     horafinal:= timetostr(time);

  {
     currentport:= printer.printerindex;
     for I := 1 to printer.Printers.Count-1  do
         begin
         printer.PrinterIndex:= i;
         printer.GetPrinter(adevice,adriver,aport,adevicemode);
         if (adevice = 'caja') then
          begin
            break;
          end;
         end;
    // impresion del encabezado.          }


    i:=0;
    //buscar printer
    Encontrada_Imp:= False;
    while ((not Encontrada_Imp ) and
    (i <= Printer.Printers.Count-1)) do
    begin
        apunta := UpperCase(Printer.Printers.Strings [i]);

        if Pos('CAJA', UpperCase(Printer.Printers.Strings [i])) <> 0  then
          // Pos(CAJERITA, UpperCase(Printer.Printers.Strings [i])) <> 0 then
          //(Pos('IMPRESTA', UpperCase(Printer.Printers.Strings [i])) <> 0)  then
           begin

              printCommand := 'printto';
              printer.PrinterIndex:= i;
              printer.GetPrinter(device,driver,port,hdevicemode);
              printerInfo := Format('"%s" "%s" "%s"', [Device, Driver, Port]) ;


    printer.canvas.font.name :='ms sans serif';
    printer.canvas.font.size :=9;
    printer.begindoc;
    printer.Canvas.textout(1,50,'ZEFERINO ESPINOZA GOMEZ');
    printer.canvas.textout(1,150,'BLVD J. PABLO II 4701 C. DE ABASTOS CAA B22');
    printer.canvas.TextOut(1,250,'CHIHUAHUA,CHIH. '+datetostr(fechavientos.date)+' '+{tfecha.text} horafinal);
    printer.canvas.TextOut(1,350,'EIGZ6711088J4'+'     CONSECUTIVO '+(CONSETICK));
     printer.canvas.TextOut(1,450,'TEL (614)4200602       '+ '    C-'+form4.agente1);

    Printer.canvas.textout(1,550,'----------------------------------------');
    printer.canvas.textout(1,700,'         DESCRIPCION');
    printer.canvas.textout(1,800,'CANT.    PRECIO   IMPORTE');
    printer.canvas.textout(1,900,'----------------------------------------');
    // impresion del cuerpo del ticket


    {  qppal1.Close;
      qppal1.parambyname('folio').asstring:= tfolio.text;
      qppal1.parambyname('nombre').AsString:= form4.agente1;
      qppal1.ParamByName('num_emp').AsString:= NUM_EMPRESA.TEXT;
      qppal1.open;
      qppal1.First;     }


      
  //  IF EDIT3.TEXT <> '' THEN
  //  BEGIN

                        qventas.Close;
                       qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                       qventas.ParamByName('folio').AsString:= TFOLIO.TEXT;
                       qventas.Open;

                        nombre_table:= QVENTAS.FIELDBYNAME('NOMBRE').ASSTRING;

  {    QPPAL1.Close;
      qppal1.parambyname('folio').asstring:= EDIT3.text;
      qppal1.parambyname('nombre').AsString:= nombre_table;
      qppal1.ParamByName('num_emp').AsString:= num_empresa.Text;
      qppal1.open;
      qppal1.First;


    END
    ELSE
    BEGIN }

      QPPAL1.Close;
      qppal1.parambyname('folio').asstring:= tfolio.text;
      qppal1.parambyname('nombre').AsString:= form4.agente1;
      qppal1.ParamByName('num_emp').AsString:= '04';
      qppal1.open;
      qppal1.First;

  //  END;






    x:= 1;
    y:= 1000;
    con_col:= 0;
    while not qppal1.Eof do
    begin
      cantidad:= (strtofloat(qppal1.fieldbyname('Total').asstring)) / (strtofloat (qppal1.fieldbyname('Precio').asstring));
      canti:= floattostrf(cantidad,ffnumber,10,2);
      importe:= strtofloat(qppal1.fieldbyname('Total').AsString);
      tot_imp:= tot_imp + importe;
      iva:= strtofloat(qppal1.fieldbyname('Totiva').AsString);
      tot_iva := tot_iva + iva;
      pre_uni:= strtofloat(qppal1.fieldbyname('Precio').AsString);

      printer.Canvas.textout(x,y,qppal1.fieldbyname('descripcion').AsString);
      printer.Canvas.textout(x,y+100,canti );
      printer.Canvas.textout(x+600,y+100,floattostrf(pre_uni, ffnumber, 10,2 ));
      printer.Canvas.textout(x+1100,y+100,floattostrf(importe, ffcurrency, 10,2));
      y:= y + 200;
      con_col:= con_col + 1;
      qppal1.Next;
     end;

     // impresion del final ticket

     printer.canvas.textout (1,y,'________________________________________');

     fin_tot:= tot_imp-tot_iva;
     printer.canvas.textout(750,Y+200, 'IMPORTE         '+floattostrf(fin_tot, ffcurrency, 10,2));

     ven_tot:= tot_imp-iva_cal;
  //   fin_tot:= tot_iva+ven_tot+iva_cal;
     printer.canvas.textout(750, y+ 300, 'TOTAL A PAGAR   '+floattostrf(VEN_tot, ffcurrency, 10,2));


     printer.canvas.textout(750, y+ 400, 'PAGADO          '+'0');

      qppal1.Last;
      Printer.canvas.textout(500,y+600,'TOTAL ARTICULOS ---> '+inttostr(con_col));




      printer.canvas.font.name :='ms sans serif';
      printer.canvas.font.size :=8;
      printer.canvas.TextOut(1,y+800,'POR ESTE PAGARE ME (NOS) OBLIGO (AMOS)');
      printer.canvas.TextOut(1,Y+900,'A PAGAR INCONDICIONALMENTE A LA ORDEN');
      printer.canvas.TextOut(1,Y+1000,'DE ZEFERINO ESPINOZA GOMEZ');
      printer.canvas.TextOut(1,Y+1100,'EN SU DOMICILIO LA CANTIDAD DE  ');
      printer.canvas.TextOut(1,y+1200,floattostrf(fin_tot,ffcurrency,10,2)+'Son  '+ '('+ dineroconletra(fin_tot)+ ')');
      printer.canvas.TextOut(1,y+1300,'IMPORTE DE MERCANCIA RECIBIDA A NUESTRA');
      printer.canvas.TextOut(1,y+1400,'ENTERA SATISFACCION ');
      printer.canvas.TextOut(1,Y+1500,'ESTE PAGARE CAUSARA INTERESES MORATORIOS');
      printer.canvas.Textout(1,Y+1600,'A RAZON DE ______ % MENSUAL DESPUES DE');
      printer.canvas.textout(1,Y+1700,'SU VENCIMIENTO');
      printer.canvas.textout(1,Y+1800, '___________________________________');
      printer.canvas.textout(1,Y+1900, 'ACEPTO VENTAS DE CONTADO');
      printer.canvas.textout(1,Y+2100, 'ESTA NOTA DE VENTA FORMA PARTE DE LA');
      printer.canvas.textout(1,Y+2200, 'FACTURA GLOBAL QUE POR VENTAS DIARIAS');
      printer.canvas.textout(1,Y+2300, 'PREPARA LA EMPRESA');
      printer.canvas.textout(1,Y+2400, '___________________________________');




    printer.EndDoc;

   Encontrada_Imp:= True
           end
            else
            inc(i);
    end;



end;


procedure TForm9.impri_fac;
var
  adevicemode : thandle;
  adevice, adriver, aport: array [0..255] of char;
  Imagen: TJpegImage;
  parte1, parte2,firma_digi1, fin_linea, compara, tfecha1,linea, canti: string;
  REPETIR, iva_15p, tot_iva15p, iva_po, tot_ivapo, totaldescto, acudescto, totdesc, subdesc, pre_uni, tot_imp, iva,importe, cantidad: real;
  VECES, g, h, x1, tdescuc, tot_ivac, fin_totc, tamapre, tamaim, ivac, ven_totc, stotc, TAMAC, con_ren, x,y,I, currentport: integer;
begin
    tdescuc:=0;
    tot_ivac:=0;
    fin_totc:=0;
    tamapre:=0;
    tamaim:=0;
    tamac:=0;
    ivac:=0;
    ven_totc:=0;
    stotc:= 0;

     totaldescto:=0;
     fin_tot:=0;
     cantidad:= 0;
     canti:= '0';
     importe:=0;
     tot_imp := 0;
     iva:= 0;
     tot_iva := 0;
     pre_uni:= 0;
     acudescto:= 0;
     iva_15p:= 0;
     tot_iva15p:= 0;
     iva_po:= 0;
     tot_ivapo:= 0;




     horafinal:= timetostr(time);

   currentport:= printer.printerindex;
   for I := 1 to printer.Printers.Count-1  do
         begin
           printer.PrinterIndex:= i;
           printer.GetPrinter(adevice,adriver,aport,adevicemode);
           COMPARA:= copy(adevice,1,4);

   if (COMPARA = 'Fact') OR
       (COMPARA = '\\Ca') OR
       (COMPARA = '\\CA') OR
        (COMPARA = '\\ca') then
      begin

  {    TFECHA1:= DATETOSTR(FECHAVIENTOS.DATE);
      tmpdia:= copy(tfecha1,1,2);
      tmpmes:= copy(tfecha1,4,2);
      tmpano:= copy(tfecha1,7,4);  }

    if (cod_cli ='9999') or (cod_cli ='5555') then
    begin
    nom_cli:= alias.text;
    tdire.text:= alias.text;
    end;

    REPETIR:=4;

    if (cod_cli = 'G477L') OR (COD_CLI ='W21F') THEN
        BEGIN
            repetir:= 5;
        END;



     copiascli.Close;
     copiascli.ParamByName('cod_cli').AsString := cod_cli;
     copiascli.Open;


    if copiascli.FieldByName('cod_cli').AsString <> ''  THEN
        BEGIN
            repetir:= 3;
        END;


    VECES := 0;

    WHILE VECES < REPETIR DO
    BEGIN

    printer.begindoc;
    printer.canvas.font.name :='Arial';
    printer.canvas.font.size :=8;


 //   printer.Canvas.textout(600,51,'FECHA : '+datetostr(fechavientos.date){tfecha.text});
    printer.Canvas.textout(2900,610,'FECHA: '+tmpdia+'/'+tmpmes+'/'+tmpano+'   '+horafinal{tfecha.text});

    printer.canvas.textout(2900,770,'RFC: ' +trfc.Text);
    printer.canvas.textout(4300,850,''+cod_cli);


    printer.canvas.font.name :='Arial';
    printer.canvas.font.size :=9;
    Printer.Canvas.Font.Style := [fsBold];

    printer.canvas.TextOut(4000,510, 'FACTURA: ' + SERIEE + FOLIO_INICIOE);


    printer.canvas.font.name :='Arial';
    printer.canvas.font.size :=8;
    Printer.Canvas.Font.Style := [];

    printer.canvas.TextOut(550,610,'NOMBRE: '+nom_cli);
    printer.canvas.TextOut(550,690,'DOMICILIO: '+tdire.text);
    printer.canvas.TextOut(550,770,''+qdeta.fieldbyname('municipio').AsString + ' '+est_cli+' '+'MEXICO');
    printer.canvas.textout(2000,770,'CAJA: '+form4.agente1);
    printer.canvas.textout(2900,850,'AGENTE: '+form4.cod_agente);
    printer.canvas.textout(3400,850,'REF. : '+FACTU.TEXT);
    printer.canvas.TextOut(550,850,''+csucursal.Text);

    printer.canvas.font.name :='Arial';
    printer.canvas.font.size :=8;
    Printer.Canvas.Font.Style := [fsBold];

    printer.canvas.textout (550,930,'_____________________________________________________________________________________________________________________________________________________________');
    printer.canvas.textout (550,1010,'Codigo');
    printer.canvas.textout (1250,1010,'Cantidad');
    printer.canvas.textout (1750,1010,'Descripcion');
    printer.canvas.textout (3000,1010,'Precio Unitario');
    printer.canvas.textout (4300,1010,'Importe');
    printer.canvas.textout (550,1090,'______________________________________________________________________________________________________________________________________________________________');




    
    IF EDIT3.TEXT <> '' THEN
    BEGIN

      QPPAL.Close;
      qppal.parambyname('folio').asstring:= tfolio.text;
      qppal.parambyname('nombre').AsString:= 'TABLET';
    //  qppal.ParamByName('num_emp').AsString:= num_empresa.Text;
      qppal.open;
      qppal.First;


    END
    ELSE
    BEGIN

      QPPAL.Close;
      qppal.parambyname('folio').asstring:= tfolio.text;
      qppal.parambyname('nombre').AsString:= form4.agente1;
  //    qppal.parambyname('num_emp').AsString:= num_empresa.Text;
      qppal.open;
      qppal.First;

    end;

    x:= 550;
    y:= 1250;
    con_ren:= 0;
    while not qppal.Eof do
    begin

      printer.canvas.font.name :='Arial';
      printer.canvas.font.size :=8;
     // x:= 70;

   //   if ((cod_cli='C21L') OR (COD_CLI='O07F')) THEN
      { if cod_cli='C21L'  THEN
              BEGIN
                 CANTIDAD:= (strtofloat(qppal.fieldbyname('Total').AsString))/(strtofloat (qppal.fieldbyname('Precio').asstring));
                 canti:= floattostrf(cantidad,ffnumber,10,2);
                 importe:= strtofloat(qppal.fieldbyname('Total').AsString);
                 tot_imp:= tot_imp + importe;
              END
              ELSE
              BEGIN  }
                 cantidad:= (strtofloat(qppal.fieldbyname('Total').asstring)) / (strtofloat (qppal.fieldbyname('Precio').asstring));
                 canti:= floattostrf(cantidad,ffnumber,10,2);
                 importe:= strtofloat(qppal.fieldbyname('Total').AsString);
                 tot_imp:= tot_imp + importe;
           //   END;

      if qppal.FieldByName('IVA').asstring = '16' then
        begin
          iva:= strtofloat(qppal.fieldbyname('Totiva').AsString);
          tot_iva := tot_iva + iva;
          iva_15p:= strtofloat(qppal.fieldbyname('Total').AsString);
          tot_iva15p:= tot_iva15p + iva_15p;
        end
        else
         begin
           iva_po:= strtofloat(qppal.fieldbyname('Total').AsString);
           tot_ivapo:= tot_ivapo + iva_po;
         end;

     printer.Canvas.textout(x,y,qppal.fieldbyname('codigo').AsString);

      TAMAC:= LENGTh(CANTI)*10;
      if length(canti) > 6 then
             tamac:=  tamac - 5;

      x1:=x+(800-TAMAC);
      printer.Canvas.textout(x1,y,canti);


      printer.canvas.font.name :='Arial';
      printer.canvas.font.size :=8;
      if qppal.fieldbyname('cajas').AsString = '0' then
              printer.Canvas.textout(x+1250,y,qppal.fieldbyname('descripcion').AsString)
             else
              printer.Canvas.textout(x+1250,y,qppal.fieldbyname('descripcion').AsString+'     '+ qppal.fieldbyname('cajas').AsString+'  CJA');


      printer.canvas.font.name :='Arial';
      printer.canvas.font.size :=9;

      pre_uni:= strtofloat(qppal.fieldbyname('Precio').AsString);

//    tamapre:= length(floattostrf(pre_uni,ffnumber,10,2))*10;
      tamapre:= length(floattostrf(pre_uni,ffnumber,10,2));
    {  if length(floattostrf(pre_uni,ffnumber,10,2)) > 6 then
             tamapre:=  tamapre - 5;}

      printer.Canvas.textout((x+(2700-tamapre)),y,floattostrf(pre_uni, ffnumber, 10,2 ));


      tamaim:= length(floattostrf(importe,ffcurrency,10,2));
     { tamaim:= length(floattostrf(importe,ffcurrency,10,2))*10;
       if length(floattostrf(importe,ffcurrency,10,2)) > 7 then
             tamaim:=  tamaim - 5; }

      printer.Canvas.textout((x+(3800-tamaim)),y,floattostrf(importe, ffcurrency, 10,2));

      tdescto.open;

      if qppal.FieldByName('descto').AsString <> '0' then
         begin
            acudescto := importe * ((tdescto.fieldbyname('porcentaje').asinteger)/100);
            totaldescto:= totaldescto + acudescto;
         end;

      y:= y + 100;
      qppal.Next;
      con_ren:= con_ren + 1;
     end;
     printer.canvas.textout (550,4150,'______________________________________________________________________________________________________________________________________________________________');
     printer.canvas.textout(3000,4350, 'Venta 16% --->');
 //    Iva_cal:= ((tot_iva/15)*100);
     ivac:= length(floattostrf(tot_iva15p,ffcurrency,10,2))*10;
      if length(floattostrf(tot_iva15p,ffnumber,10,2)) > 7 then
             ivac:=  ivac - 5;
     printer.canvas.textout(4300-ivac,4350, floattostrf(TOT_iva15p, ffcurrency, 10,2));


     printer.canvas.textout(3000,4250, 'Venta 0% ---->');
 //   ven_tot:= tot_imp-iva_cal;
     ven_totc:= length(floattostrf(tot_ivapo,ffcurrency,10,2))*10;
     if length(floattostrf(tot_ivapo,ffnumber,10,2)) > 7 then
          ven_totc:=  ven_totc - 5;

     printer.canvas.textout(4300-ven_totc,4250, floattostrf(tot_ivapo, ffcurrency, 10,2));




     printer.canvas.textout(3000, 4450, 'Sub-Total ---->');
      stotc:= length(floattostrf((TOT_iva15p+tot_ivapo),ffcurrency,10,2))*10;
   //  stotc:= length(floattostrf((ven_tot+iva_cal),ffcurrency,10,2))*10;
      if length(floattostrf((TOT_iva15p+tot_ivapo),ffcurrency,10,2)) > 7 then
             stotc:=  stotc - 5;
      subtotale:= floattostrf((tot_iva15p+tot_ivapo),ffnumber,10,2);
     printer.canvas.textout(4300-stotc, 4450, floattostrf((tot_iva15p+tot_ivapo),ffcurrency,10,2));

     //  if ((cod_cli <> 'C21L') OR (COD_CLI <> 'O07F'))  then
         // if cod_cli <> 'C21L'  then
         //       begin
                       printer.canvas.textout(3000, 4550, 'I.V.A. -------->');
                       tot_ivac:= length(floattostrf(tot_iva,ffcurrency,10,2))*10;
                        if length(floattostrf(tot_iva,ffnumber,10,2)) > 7 then
                            tot_ivac:=  tot_ivac - 5;
                       printer.canvas.textout(4300-tot_ivac, 4550, floattostrf(tot_iva, ffcurrency, 10,2));


                       printer.canvas.textout(3000, 4650, 'Total --------->');
                       fin_tot:= tot_iva+TOT_iva15p+tot_ivapo;
                       fin_totc:= length(floattostrf(fin_tot,ffcurrency,10,2))*10;
                        if length(floattostrf(fin_tot,ffnumber,10,2)) > 7 then
                             fin_totc:=  fin_totc - 5;
                       printer.canvas.textout(4300-fin_totc, 4650, floattostrf(fin_tot, ffcurrency, 10,2));


                       printer.canvas.textout(550, 4250, 'Son  '+ '('+ dineroconletra(fin_tot)+ ')');
                       printer.Canvas.TextOut(550, 4350, 'Total de Articulos ---->  '+inttostr(con_ren) );

                        printer.canvas.font.name :='Arial';
                        printer.canvas.font.size :=7;

                       Printer.canvas.textout(550,4450,'ESTE DOCUMENTO ES UNA REPRESENTACION IMPRESA DE UN CFD');

            {     end
                 else
                    begin

                   if (qppal.fieldbyname('descto').AsString <> '') THEN
                   begin
                   printer.canvas.textout(3000, 4550, 'Descto. -------->');
                   tdescuc:= length(floattostrf(totaldescto,ffcurrency,10,2))*10;
                   if length(floattostrf(totaldescto,ffnumber,10,2)) > 7 then
                             tdescuc:=  tdescuc - 5;
                   printer.canvas.textout(4300-tdescuc, 4550, floattostrf(totaldescto, ffcurrency, 10,2));


                   printer.canvas.textout(3000, 4650, 'I.V.A. -------->');
                    tot_ivac:= length(floattostrf(tot_iva,ffcurrency,10,2))*10;
                   if length(floattostrf(tot_iva,ffnumber,10,2)) > 7 then
                            tot_ivac:=  tot_ivac - 5;
                   printer.canvas.textout(4300-tot_ivac, 4650, floattostrf(tot_iva, ffcurrency, 10,2));


                   printer.canvas.textout(3000, 4750, 'Total --------->');
                   fin_tot:= tot_iva+TOT_iva15p+tot_ivapo-totaldescto;
                   fin_totc:= length(floattostrf(fin_tot,ffcurrency,10,2))*10;
                   if length(floattostrf(fin_tot,ffnumber,10,2)) > 7 then
                             fin_totc:=  fin_totc - 5;
                   printer.canvas.textout(4300-fin_totc, 4750, floattostrf(fin_tot, ffcurrency, 10,2));


                   printer.canvas.textout(550, 4250, 'Son  '+ '('+ dineroconletra(fin_tot)+ ')');
                   printer.Canvas.TextOut(550, 4350, 'Total de Articulos ---->  '+inttostr(con_ren) );

                    printer.canvas.font.name :='Arial';
                    printer.canvas.font.size :=7;

                   Printer.canvas.textout(550,4450,'ESTE DOCUMENTO ES UNA REPRESENTACION IMPRESA DE UN CFD');

                   END
                   ELSE
                   BEGIN
                     printer.canvas.textout(3000, 4550, 'I.V.A. -------->');
                       tot_ivac:= length(floattostrf(tot_iva,ffcurrency,10,2))*10;
                        if length(floattostrf(tot_iva,ffnumber,10,2)) > 7 then
                            tot_ivac:=  tot_ivac - 5;
                       printer.canvas.textout(4300-tot_ivac, 4550, floattostrf(tot_iva, ffcurrency, 10,2));


                       printer.canvas.textout(3000, 4650, 'Total --------->');
                       fin_tot:= tot_iva+TOT_iva15p+tot_ivapo;
                       fin_totc:= length(floattostrf(fin_tot,ffcurrency,10,2))*10;
                        if length(floattostrf(fin_tot,ffnumber,10,2)) > 7 then
                             fin_totc:=  fin_totc - 5;
                       printer.canvas.textout(4300-fin_totc, 4650, floattostrf(fin_tot, ffcurrency, 10,2));

                       printer.canvas.textout(550, 4250, 'Son  '+ '('+ dineroconletra(fin_tot)+ ')');
                       printer.Canvas.TextOut(550, 4350, 'Total de Articulos ---->  '+inttostr(con_ren) );

                        printer.canvas.font.name :='Arial';
                        printer.canvas.font.size :=7;

                       Printer.canvas.textout(550,4450,'ESTE DOCUMENTO ES UNA REPRESENTACION IMPRESA DE UN CFD');



                   END;


                    end;  }
      IF NUM_empresa.text = '02' THEN
      BEGIN

      printer.canvas.font.name :='Arial';
      printer.canvas.font.size :=7;
      Printer.Canvas.Font.Style := [];

      dine_letra:= dineroconletra(FIN_tot);
      printer.canvas.TextOut(550,4550,'He(mos) recibido satisfactoriamente la mercancia que ampara el presente documento');
      printer.canvas.TextOut(550,4630,'y tengo autorizada a la persona que lo firma para que me comprometa mercantilmente');
      printer.canvas.TextOut(550,4710,'por lo que debo(emos) y pagare(emos) incondicionalmentea la orden de');
      printer.canvas.TextOut(550,4790,'FRUTAS Y COMESTIBLES CHIHUAHUA SA DE CV en la ciudad de Chihuahua, Chih. el dia');
      printer.canvas.TextOut(550,4870, datetostr((fechavientos.Date+15))+'la cantidad de  '+floattostrf(fin_tot,ffcurrency,10,2)+'. Son '+ '('+ dineroconletra(FIN_tot)+ ')');
      printer.canvas.TextOut(550,4950,'por importe de la mercanc�a recibida a su entera satisfacci�n. Este pagare causara un interes ');
      printer.canvas.TextOut(550,5030,'moratorio del 6% mensual a partir de su vencimiento, seg�n la ley vigente de titulos y ');
      printer.canvas.TextOut(550,5110,'operaciones de cr�dito');
       printer.canvas.TextOut(550,5190,'Chihuahua, Chih., a  '+ datetostr(fechavientos.Date){tfecha.text});
      printer.canvas.Textout(3000,5010,'PAGO EN UNA SOLA EXHIBICION');
      printer.canvas.textout(3000,5090,nom_cli);
      printer.canvas.textout(3000,5170,'______________________');
      printer.canvas.textout(3000,5250,'Firma del Suscriptor');

      END
      ELSE
      BEGIN

      printer.canvas.font.name :='Arial';
      printer.canvas.font.size :=7;
      Printer.Canvas.Font.Style := [];

      printer.canvas.TextOut(550,4550,'He(mos) recibido satisfactoriamente la mercancia que ampara el presente documento');
      printer.canvas.TextOut(550,4630,'y tengo autorizada a la persona que lo firma para que me comprometa mercantilmente');
      printer.canvas.TextOut(550,4710,'por lo que debo(emos) y pagare(emos) incondicionalmentea la orden de');
      printer.canvas.TextOut(550,4790,'COMESTIBLES Y LEGUMBRES SA DE CV en la ciudad de Chihuahua, Chih. el dia');
      printer.canvas.TextOut(550,4870,datetostr((fechavientos.Date+15))+' la cantidad de  '+floattostrf(fin_tot,ffcurrency,10,2)+'. Son '+ '('+ dineroconletra(FIN_tot)+ ')');
      printer.canvas.TextOut(550,4950,'por importe de la mercanc�a recibida a su entera satisfacci�n. Este pagare causara un interes ');
      printer.canvas.TextOut(550,5030,'moratorio del 6% mensual a partir de su vencimiento, seg�n la ley vigente de titulos y ');
      printer.canvas.TextOut(550,5110,'operaciones de cr�dito');
       printer.canvas.TextOut(550,5190,'Chihuahua, Chih., a  '+ datetostr(fechavientos.Date){tfecha.text});
      printer.canvas.Textout(3000,5010,'PAGO EN UNA SOLA EXHIBICION');
      printer.canvas.textout(3000,5090,nom_cli);
      printer.canvas.textout(3000,5170,'______________________');
      printer.canvas.textout(3000,5250,'Firma del Suscriptor');

     end;


     printer.canvas.font.name :='Arial';
     printer.canvas.font.size :=6;
     Printer.Canvas.Font.Style := [fsBold];

     printer.canvas.textout(550,5250,'Cadena Original:');
     printer.canvas.textout(550,5310,'______________________________________________________________________________________________________________________________________________________________');

     printer.canvas.font.name :='Arial';
     printer.canvas.font.size :=6;
     Printer.Canvas.Font.Style := [];

      g:= 1;
      h:= 140;
      y:= 5410;

      FIN_LINEA :='A';

      while (fin_linea <> '||') and (fin_linea <> '|#0') AND (FIN_LINEA <> '')
      do
      begin

            firma_digi1:= copy(cadena,g,140);
            printer.Canvas.TextOut(550, y, firma_digi1);
            fin_linea:= AnsirightStr(firma_digi1, 2 );

            g:= h + 1;
            h:= h + 140;
            y:= y + 70;

      end;

 //     y:=y +70;
       printer.canvas.font.name :='Arial';
      printer.canvas.font.size :=6;
       Printer.Canvas.Font.Style := [fsBold];

     printer.canvas.textout(550,y,'Sello Digital:');
     y:=y + 50;
     printer.canvas.textout(550,y,'______________________________________________________________________________________________________________________________________________________________');


      printer.canvas.font.name :='Arial';
      printer.canvas.font.size :=6;
      Printer.Canvas.Font.Style := [];


      parte1:= copy(firma_digi,1, 123);
      y:=y + 60;
      printer.Canvas.TextOut(550, y, parte1);

      parte2:= copy(firma_digi,124,123);
      y:=y + 60;
      printer.Canvas.TextOut(550, y, parte2);

      printer.enddoc;

      tot_iva15p:= 0;
      tot_ivapo:= 0;
      tot_iva:= 0;
      fin_tot := 0;
      totaldescto:= 0;


      VECES:= VECES+1;
    end;

    END;
  end;
 end;

 procedure Tform9.ticket_conse;
 begin


        // IF (NUM_EMPRESA.TEXT ='04') OR (NUM_EMPRESA.TEXT = '05') OR (NUM_EMPRESA.TEXT = '06') THEN

        IF (NUM_EMPRESA.TEXT ='04') THEN
          BEGIN
              SHOWMESSAGE('CAMBIAR NO. EMPRESA EN ESTA NO PUEDES HACER TICKET');
              EXIT;
          END;


        if num_empresa.text = '08' then
        BEGIN
             num_empresa.keyvalue := '01';

            QCODIGOART.CLOSE;
            qcodigoart.ParamByName('NUM_EMP').AsString:= '01';
            qcodigoart.OpeN;

        END;

        CONSE.Close;
        conse.parambyname('num_emp').asstring:= NUM_EMPRESA.TEXT;
        conse.parambyname('cajera').asstring:= form4.agente1;
        conse.open;

        consetick:=  conse.fieldbyname('num_tik').asstring  ;

        FACTU.Text:= CONSETICK;

        tconse.close;
        tconse.parambyname('numero').Asfloat:= strtofloat(factu.text) + 1;
        tconse.ParamByName('num_emp').asstring:= NUM_EMPRESA.TEXT;
        tconse.ParamByName('cajera').AsString:= form4.AGENTE1;
        tconse.execsql;




 end;







procedure TForm9.PRE_PROExit(Sender: TObject);
begin
       if caj_pro.Text = '' then
          caj_pro.text:= '0';

           IF PRE_PRO.TEXT = '' THEN
            BEGIN
                pre_pro.text := '0';
            end;

       IF KIL_PRO.TEXT = '' THEN
            BEGIN
                 KIL_PRO.TEXT := '0';
            END;


     {  IF (PRE_PRO.TEXT = '0') AND (CAJ_PRO.TEXT ='0') AND (KIL_PRO.Text ='0') THEN
            BEGIN
                SHOWMESSAGE('MODIFICA CANTIDAD');
                pre_PRO.ReadOnly := FALSE;
                caj_PRO.SETFOCUS;
                EXIT;
            END;  }






end;

procedure TForm9.Button1Click(Sender: TObject);
VAR
  EMIL: INTEGER;
begin

    EMIL:= 0;

      IF EDIT3.TEXT <> '' THEN
          BEGIN
              IF QUESTION('ESTA SEGURO DE BORRAR')= TRUE THEN
               begin

                 { QBORRAf.CLOSE;
                  QBORRAf.PARAMBYNAME('FOLIO').ASSTRING := TFOLIO.TEXT;
                  QBORRAf.PARAMBYNAME('NUM_EMP').ASSTRING := NUM_EMPRESA.TEXT;
                  QBORRAf.ExecSQL;}
                  QVENTAS.CLOSE;

                  inicializa;
                  actu_folio;


                  EMIL := 1;
              end;
              EMIL := 1;
          END;

      IF EMIL = 0 THEN
      BEGIN
      if question('Esta Seguro de Cancelar') = true then
              begin

                  QBORRAf.CLOSE;
                  QBORRAf.PARAMBYNAME('FOLIO').ASSTRING := TFOLIO.TEXT;
                  QBORRAf.PARAMBYNAME('NUM_EMP').ASSTRING := NUM_EMPRESA.TEXT;
                  QBORRAf.ExecSQL;

                  inicializa;
                  EMIL := 0;

              end;
      END;
end;






procedure TForm9.aliasKeyPress(Sender: TObject; var Key: Char);
begin
       IF KEY = (#13) THEN
          BEGIN
            QCODIGOART.CLOSE;
          qcodigoart.ParamByName('NUM_EMP').AsString:= FORM9.NUM_EMPRESA.TEXT;
            qcodigoart.OpeN;

            CODIGOART.SetFocus;
          END;
end;

procedure TForm9.NUM_EMPRESAExit(Sender: TObject);
begin
     IF NUM_EMPRESA.TEXT ='02' THEN
       BEGIN
        IF QUESTION('ESTAS EN LA EMPRESA 02 NECESITAS CLAVE') = TRUE THEN
              BEGIN
                   form13.showmodal;
              END;

      END;



end;

procedure TForm9.Edit2KeyPress(Sender: TObject; var Key: Char);

begin

     IF  (NUM_EMPRESA.TEXT = '02')  AND (FORM13.EMP= 1) THEN
        BEGIN
            EDIT2.Text:= '';
            SHOWMESSAGE('CAMBIA LA EMPRESA');
            TIPO_FAC.ItemIndex:= -1;
            EXIT;
        END;





     if key =   (#13) THEN
          BEGIN
               ORDEN := COPY(EDIT2.TEXT,1,1);
               resto := copy(edit2.Text,2,1);

               IF (ORDEN ='1') OR (ORDEN ='2') OR (ORDEN ='3') OR (ORDEN ='4') OR (ORDEN ='5')OR
                   (ORDEN ='6') OR (ORDEN ='7') OR (ORDEN ='8') OR (ORDEN ='9') OR (ORDEN ='0') THEN
                  begin
                    SHOWMESSAGE('DIGITA LETRAS AL PPIO. DE LA ORDEN');
                    key := char(0); //Limpia el EditBox
                    EDIT2.SETFOCUS;
                    EDIT2.SelectAll;
                    EXIT;
                  END;

              if (resto ='')   THEN
                 BEGIN
                  SHOWMESSAGE('REVISA TU ORDEN DE COMPRA');
                  key := char(0); //Limpia el EditBox
                  EDIT2.SETFOCUS;
                  EDIT2.SelectAll;
                  EXIT;
                 END;


           IF BUSFOLIO.TEXT = '' THEN
           BEGIN
              IF TIPO_FAC.ItemIndex = 0 THEN
                 BEGIN

                      //CAMBIOS FACE


                      qfolio.Close;
                      qfolio.ParamByName('cajera').AsString:= form4.agente1;
                      qfolio.Open;



                      NOMBRE.VISIBLE:= TRUE;
                      LABEL3.VISIBLE:= TRUE;
                      NOMBRE.SetFocus;
                   //   TIPO_PAGO.ItemIndex:= 0;
                      TIPOCONSULTA.ItemIndex:= 1;
                      FACTU.ReadOnly:= TRUE;

                      END;





               IF TIPO_FAC.ItemIndex = 1 THEN
                   begin
                    TDIRE.Text:= '';
                    TRFC.Text:= 'VENTAS DE CONTADO';
                    cod_cli:=  '9999';
                    nom_cli:=  'VENTAS DE CONTADO';
                    NOMBRE_CLI.Visible:= TRUE;
                    NOMBRE_CLI.Text:= 'VENTAS DE CONTADO';
                    ciu_cli:= '';
                    est_cli:= '';
                    NOMBRE.VISIBLE:=FALSE;
                    LABEL3.Visible:= TRUE;
                    code.Text:= cod_cli;
                    label6.Visible:= true;
                    alias.Visible:= true;
                    alias.SetFocus;
                 //   tipo_pago.ItemIndex:= 1;
                    tipoconsulta.ItemIndex:= 0;
                  end;    
          END;

       END;


end;

procedure TForm9.QCODIGOI(Sender: TObject; var Key: Char);
VAR
    BANDE : INTEGER;
    dife_limi:real;
begin
    IF KEY =(#13) THEN
    BEGIN
      FALTA_ENVIO := 0;
      BANDE:= 0;
      QSUCUR.CLOSE;
      ENTRA_AZU := 0;


      CODIGO_AZU :=  COPY(QTIPO.FIELDBYNAME('cod_CLI').AsString,1,3);
     IF CODIGO_AZU ='API' THEN
      BEGIN
            QBUSEMP04.CLOSE;
            QBUSEMP04.PARAMBYNAME('COD_CLI').ASSTRING := QTIPO.FIELDBYNAME('cod_CLI').AsString;
            QBUSEMP04.OPEN;

            IF QBUSEMP04.FIELDBYNAME('cod_cli').AsString = '' then
            begin
                 showmessage('DA DE ALTA EL CLIENTE EN LA EMPRESA 04');
                 TRFC.TEXT := '';
                 EXIT;
            end;




            ENTRA_AZU := 1;
      END;


      IF (NUM_EMPRESA.TEXT = '02') AND (FORM13.EMP = 1)THEN
        BEGIN
           showmessage('No se puede capturar en la empresa 2');
           NUM_EMPRESA.SETFOCUS;
           exit;

        END;

     if (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'G75L')   AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'M14L') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'P77F') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'R456L')
                    AND {(QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'S356F')AND} (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'T29F') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'D11F') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'O14L')
                     AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'R23F') AND  (QTIPO.FIELDBYNAME('cod_CLI').AsString <>'F300F') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <>'F55F')  AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <>'E77L')
                    AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'C44L') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'C855L') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'C66L')
                    AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'M102F') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'C1F') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'C01F') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'D3L')
                    and (QTIPO.FIELDBYNAME('cod_CLI').AsString <>'O14L') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <>'E67L') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'P92F') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'G92F')
                    and (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'V199F') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'V9F') AND (ENTRA_AZU <> 1)
                    AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <>'V105L')  AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <>'E941L')
                     then
                     begin
                           NUM_EMPRESA.KEYVALUE := '01';
                     END;


          //OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='C44L')
      // FUTU CAMBIO  (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'D11F')
      IF (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'D11F')  OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'F55F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='F300F')
         OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'E67L') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'M102F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='C1F')
         OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'S29F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'T29F') {OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='S356F') }
         OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'G307F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'R23F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='Z4F')
         OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'C01F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'D3L') // OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'C2L')
          OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'C160L')  OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'S369L')  OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='E77L') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='S356F')
         OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'V199F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'V9F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'E941L')
         OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'V105L') or  (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'P92F') OR(QTIPO.FIELDBYNAME('cod_CLI').AsString = 'G92F') OR (ENTRA_AZU = 1)
          THEN
            BEGIN
                NUM_EMPRESA.KEYVALUE := '04';



            END;


       IF (QTIPO.FIELDBYNAME('cod_CLI').AsString ='C44L')
          THEN
            NUM_EMPRESA.KEYVALUE := '08';


    {  IF (QTIPO.FIELDBYNAME('cod_CLI').AsString ='M14L')
      OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'P77F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='C66L')
      OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'F106F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='R23F')}

      if (QTIPO.FIELDBYNAME('cod_CLI').AsString ='C66L') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'E67L')
        THEN
            BEGIN
                NUM_EMPRESA.KEYVALUE := '06';

            END;

     {  IF (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'R456L') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='S356F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'T29F')
       OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'G75L') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='C855L')THEN
            BEGIN
                NUM_EMPRESA.KEYVALUE := '05';

            END;}




       qdeta.Close;
      qdeta.ParamByName('cod_cli').asstring := QTIPO.FIELDBYNAME('cod_CLI').AsString;
      qdeta.open;

      if qdeta.FieldByName('cod_cli').AsString = '' then
        begin
               SHOWMESSAGE('DATOS DE CLIENTE INCOMPLETOS REVISALOS');
               EXIT;
       end
        else
                tdire.Text:= 'CALLE '+qdeta.FieldByName('calle').AsString + '  NO. EXT '+qdeta.FieldByName('num_ext').AsString+
                              '  NO. INT '+qdeta.FieldByName('num_int').AsString +
                               '  COL. '+ qdeta.FieldByName('colonia').AsString + ' CP. '+ qtipo.fieldbyname('cod_pos').asstring;


      //voy a buscar el usocfdi

      cfdiuso.Close;
      cfdiuso.Open;


      qusocfdi.Close;
      qusocfdi.PARAMBYNAME('cod_cli').asstring := QTIPO.FIELDBYNAME('cod_CLI').AsString;
      qusocfdi.open;

      if (qusocfdi.FIELDBYNAME('uso').asstring = '') or (qusocfdi.FIELDBYNAME('uso').asstring = 'POR DEFINIR') then
      begin

          SHOWMESSAGE('REVISAR USO CFDI');
          NOMBRE.KeyValue := NULL;
          TDIRE.Text := '';
          TRFC.Text := '';
          CODE.Text := '';
          NAME.Text := '';
          NOMBRE_CLI.Text := '';
          EXIT;

      end
      else
      begin
          cod_uso := qusocfdi.fieldbyname('uso').asstring ;
           uso_cfdi:= qusocfdi.fieldbyname('uso_cfdi').asstring ;
           pon_usocfdi.KeyValue := qusocfdi.fieldbyname('uso_cfdi').asstring ;

      end;


      IF qtipo.fieldbyname('cod_pos').asstring = '' THEN
      BEGIN

          SHOWMESSAGE('FAVOR DE PONER CP DEL CLIENTE');
          NOMBRE.KeyValue := NULL;
          TDIRE.Text := '';
          TRFC.Text := '';
          CODE.Text := '';
          NAME.Text := '';
          NOMBRE_CLI.Text := '';
          EXIT;

      END;

      
      busregimen.close;
      busregimen.parambyname('cod_cli').asstring:=  QTIPO.FIELDBYNAME('cod_CLI').AsString;
      busregimen.open;

      if busregimen.fieldbyname('regimen').asstring = '' then
      begin
          showmessage('REVISA REGIMEN CLIENTE');
           NOMBRE.KeyValue := NULL;
           CODIGOCLI.KeyValue := NULL;
           TDIRE.Text := '';
          TRFC.Text := '';
          CODE.Text := '';
          NAME.Text := '';
          NOMBRE_CLI.Text := '';
          PON_USOCFDI.KEYVALUE := NULL;
           EXIT;
      end
      else
          regimen_cli := busregimen.fieldbyname('regimen').asstring;
      




     // TDIRE.Text:= QTIPO.FIELDBYNAME('DOM_CLI').AsString;
      TRFC.Text:= QTIPO.FIELDBYNAME('RFC_CLI').AsString;
      trfc.Text := stripped('-',trfc.Text);
      cod_cli:=  QTIPO.FIELDBYNAME('cod_CLI').AsString;
      nom_cli:=  qtipo.fieldbyname('raz_soc').AsString;
      ciu_cli:= qtipo.fieldbyname('ciu_cli').AsString;
      est_cli:= qtipo.fieldbyname('est_cli').AsString;
      lim_cre:= qtipo.fieldbyname('lim_cre').asfloat;
      pla_clie:= qtipo.fieldbyname('pla_cli').asstring;
      cod_pos:= qtipo.fieldbyname('cod_pos').asstring;
      observa.Text:= qtipo.fieldbyname('observa').AsString;

      if observa.Text <> '' then
                showmessage(observa.Text);


       IF LENGTH(COD_POS) = 4 then
              cod_pos := '0'+cod_pos;


      pla_cliestr:= 'Credito a ' + pla_clie+ ' dias';




       IF COD_CLI = 'O107F' THEN
       BEGIN

          if question('Deseas Hacer Papelon')= true then
             begin
              papel := 0;
              FACTU.ReadOnly:= FALSE;
              FACTU.SetFocus;
             end
             else
             begin
              papel := 1;
             end;


       END;



           //aqui reviso que tenga tipo pago

     qtipo_pago.Close;
     qtipo_pago.ParamByName('cod_cli').AsString := cod_cli;
     qtipo_pago.Open;


     if qtipo_pago.FieldByName('tipo_pago').AsString = '' then
     begin
           QCODIGOART.CLOSE;
          showmessage('Revisa cliente no tiene Tipo de Pago');
          exit;

    end;

    if qtipo_pago.FieldByName('tipo_pago').AsString = 'Efectivo' then
      begin
           if question('Este cliente esta Registrado como pago efectivo te va a pagar con Efectivo?') = true then
           begin



      qdebefac.Close;
      qdebefac.ParamByName('num_emp').AsString:= num_empresa.Text;
      qdebefac.ParamByName('cod_cli').asstring:= cod_cli;
      qdebefac.open;


      ACHI := 0;


    //tot_debe.Text:= qdebefac.Fields[0].AsString;

      tot_debe.Text:= floattostrf( qdebefac.Fields[0].Asfloat,ffnumber, 10,2);





      label17.Visible:= false;
      name.Visible:= false;
      label33.visible:= true;
      code.Visible:= true;


      code.Text:= cod_cli;

      if ya_puse_rfc = 0 then
              rfc_tmp := trfc.text;


      IF COD_CLI <> '9999' THEN
          BEGIN
            label6.Visible:= FALSE;
            alias.Visible:= FALSE;
           end;




      if (cod_cli = '9999') or (cod_cli ='5555') then
           begin
              label6.Visible:= true;
              alias.Visible:= true;
              alias.SetFocus;
           end;




            qsucur.Close;
           qsucur.ParamByName('cod_cli').asstring := cod_cli;
           qsucur.Open;


           if qsucur.FieldByName('sucursal').asstring = '' then
                bande:= 0
            else
                bande:= 1;


       If cod_cli ='O14L' then
        begin
          label37.Visible:= true;
          orden_compra.Visible:= true;
        end;



    IF BANDE= 0 THEN
     BEGIN
        QCODIGOART.CLOSE;
        qcodigoart.ParamByName('NUM_EMP').AsString:= FORM9.NUM_EMPRESA.TEXT;
        qcodigoart.OpeN;
        IF ALIAS.Visible = FALSE THEN
             CODIGOART.SETFOCUS;
      END;

      IF BANDE= 1 THEN
       BEGIN
             IF ALIAS.Visible = FALSE THEN
               CSUCURSAL.SetFocus;
       END;



       end
           else
            begin
                QCODIGOART.CLOSE;
                SHOWMESSAGE('REVISA TIPO PAGO EN MENU DE CLIENTES');
                EXIT
            end;
       END;



  //AQUI ENTRO SI EL TIPO DE PAGO ES DIFERENTE DE EFECTIVO O DE VACIO



     if (qtipo_pago.FieldByName('tipo_pago').AsString <> 'Efectivo') AND (qtipo_pago.FieldByName('tipo_pago').AsString <> '') then
      begin

        qdebefac.Close;
      qdebefac.ParamByName('num_emp').AsString:= num_empresa.Text;
      qdebefac.ParamByName('cod_cli').asstring:= cod_cli;
      qdebefac.open;

        ACHI := 0;



    //tot_debe.Text:= qdebefac.Fields[0].AsString;

      tot_debe.Text:= floattostrf( qdebefac.Fields[0].Asfloat,ffnumber, 10,2);





      label17.Visible:= false;
      name.Visible:= false;
      label33.visible:= true;
      code.Visible:= true;


      code.Text:= cod_cli;

      if ya_puse_rfc = 0 then
              rfc_tmp := trfc.text;


      IF COD_CLI <> '9999' THEN
          BEGIN
            label6.Visible:= FALSE;
            alias.Visible:= FALSE;
           end;




      if (cod_cli = '9999') or (cod_cli ='5555') then
           begin
              label6.Visible:= true;
              alias.Visible:= true;
              alias.SetFocus;
           end;




            qsucur.Close;
           qsucur.ParamByName('cod_cli').asstring := cod_cli;
           qsucur.Open;


           if qsucur.FieldByName('sucursal').asstring = '' then
                bande:= 0
            else
                bande:= 1;


       If cod_cli ='O14L' then
        begin
          label37.Visible:= true;
          orden_compra.Visible:= true;
        end;




    IF BANDE= 0 THEN
     BEGIN
        QCODIGOART.CLOSE;
     //   qcodigoart.ParamByName('NUM_EMP').AsString:= FORM9.NUM_EMPRESA.TEXT;
        qcodigoart.ParamByName('NUM_EMP').AsString:= '01';
        qcodigoart.OpeN;
        IF ALIAS.Visible = FALSE THEN
             CODIGOART.SETFOCUS;
      END;

      IF BANDE= 1 THEN
       BEGIN
             IF ALIAS.Visible = FALSE THEN
               CSUCURSAL.SetFocus;
       END;


       //AQUI SACO EL TOTAL PARA CUANDO BUSCAN POR FOLIO Y NADA MAS CAMBIAN ELNOBRE Y TODO LO DEMAS IGUAL

       if (busfolio.text <> '') THEN
             SACATOTAL;

     END;
  END;



end;




procedure TForm9.csucursalKeyPress(Sender: TObject; var Key: Char);
begin
    IF KEY =(#13) THEN
      BEGIN
     if cod_cli = 'O14L' THEN
        ORDEN_COMPRA.SETFOCUS
     ELSE
     BEGIN

    QCODIGOART.CLOSE;
    qcodigoart.ParamByName('NUM_EMP').AsString:= FORM9.NUM_EMPRESA.TEXT;
    qcodigoart.Open;
    CODIGOART.SETFOCUS;

    END;


    END;
end;


procedure TForm9.CODIGOCLIKeyPress(Sender: TObject; var Key: Char);
var
  dife_limi, lim_cre: real;
begin
      IF KEY =(#13) THEN
        BEGIN

      IF (NUM_EMPRESA.TEXT = '02') AND (FORM13.EMP = 1)
        THEN
            BEGIN
                showmessage('No se puede capturar en la empresa 2');
                NUM_EMPRESA.SETFOCUS;
                exit;
            END;


      CODIGO_AZU :=  COPY(QTIPO.FIELDBYNAME('cod_CLI').AsString,1,3);
     IF CODIGO_AZU ='API' THEN
        BEGIN

            QBUSEMP04.CLOSE;
            QBUSEMP04.PARAMBYNAME('COD_CLI').ASSTRING := QTIPO.FIELDBYNAME('cod_CLI').AsString;
            QBUSEMP04.OPEN;

            IF QBUSEMP04.FIELDBYNAME('cod_cli').AsString = '' then
            begin
                 showmessage('DA DE ALTA EL CLIENTE EN LA EMPRESA 04');
                  TRFC.TEXT := '';
                 EXIT;
            end;




            ENTRA_AZU := 1;

        END;



     if (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'D11F') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'O14L')
     AND  (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'F55F') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <>'F300F')
     AND  (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'G92F') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <>'P92F')
     AND  (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'M102F') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <>'C1F')
     AND  (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'C01F') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <>'D3L')  AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <>'E77L')
     AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'C44L') and (QTIPO.FIELDBYNAME('cod_CLI').AsString <>'O14L') // and (QTIPO.FIELDBYNAME('cod_CLI').AsString <>'S356F')
     AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'V199F') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <> 'V9F') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <>'V105L') AND (QTIPO.FIELDBYNAME('cod_CLI').AsString <>'E941L')
     AND (ENTRA_AZU <> 1)
            then
            begin
                NUM_EMPRESA.KEYVALUE := '01';
            END;

        // CAMBIO FUTU IF (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'D11F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='O14L')
     IF (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'D11F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'F55F')  OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='F300F')  OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='S356F')
     OR {(QTIPO.FIELDBYNAME('cod_CLI').AsString ='C44L')  OR} (QTIPO.FIELDBYNAME('cod_CLI').AsString ='D3L')  OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='E77L')
     OR  (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'M102F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'C1F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='C01F')
     OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'S29F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'T29F') // OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='S356F')  OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='C2L')
     OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'G307F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'R23F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='Z4F')//OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'G92F')
     OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'V199F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'V9F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'E941L')
     OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'V105L') or (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'G92F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'P92F')  OR (entra_azu = 1)

        THEN
            BEGIN
                NUM_EMPRESA.KEYVALUE := '04';
            END;


        IF (QTIPO.FIELDBYNAME('cod_CLI').AsString ='C44L')
          THEN
            NUM_EMPRESA.KEYVALUE := '08';

  {    IF  (QTIPO.FIELDBYNAME('cod_CLI').AsString ='M14L')
      OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'P77F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'C66L')
      OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'F106F') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString ='R23F')}

    IF (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'C66L') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'E67L')
        THEN
            BEGIN
                NUM_EMPRESA.KEYVALUE := '06';
            END;

    IF (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'R456L') OR {(QTIPO.FIELDBYNAME('cod_CLI').AsString ='S356F') OR} (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'T29F')
    OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'G75L') OR (QTIPO.FIELDBYNAME('cod_CLI').AsString = 'C855L')
        THEN
            BEGIN
                NUM_EMPRESA.KEYVALUE := '05';
            END;


      BANDE:= 0;
      QSUCUR.Close;


      qdeta.Close;
      qdeta.ParamByName('cod_cli').asstring := QTIPO.FIELDBYNAME('cod_CLI').AsString;
      qdeta.open;

      if qdeta.FieldByName('cod_cli').AsString = '' then
        begin
                TDIRE.Text:= QTIPO.FIELDBYNAME('DOM_CLI').AsString;
       end
        else
                tdire.Text:= 'CALLE '+qdeta.FieldByName('calle').AsString + '  NO. '+qdeta.FieldByName('num_ext').AsString+
                              '  NO. INT '+qdeta.FieldByName('num_int').AsString +
                               '  COL. '+ qdeta.FieldByName('colonia').AsString + ' CP. '+ qtipo.fieldbyname('cod_pos').asstring;;





      //voy a buscar el usocfdi

      cfdiuso.Close;
      cfdiuso.Open;

      qusocfdi.Close;
      qusocfdi.PARAMBYNAME('cod_cli').asstring := QTIPO.FIELDBYNAME('cod_CLI').AsString;
      qusocfdi.open;

      if (qusocfdi.FIELDBYNAME('uso').asstring = '') or (qusocfdi.FIELDBYNAME('uso').asstring = 'POR DEFINIR') then
      begin

          SHOWMESSAGE('REVISAR USO CFDI');
          CODIGOCLI.KeyValue := NULL;
           TDIRE.Text := '';
          TRFC.Text := '';
          CODE.Text := '';
          NAME.Text := '';
          NOMBRE_CLI.Text := '';
           PON_USOCFDI.KEYVALUE := NULL;
          EXIT;

      end
      else
      begin
          cod_uso := qusocfdi.fieldbyname('uso').asstring ;
           uso_cfdi:= qusocfdi.fieldbyname('uso_cfdi').asstring ;
           pon_usocfdi.KeyValue := qusocfdi.fieldbyname('uso_cfdi').asstring ;

      end;


      IF qtipo.fieldbyname('cod_pos').asstring = '' THEN
      BEGIN

          SHOWMESSAGE('FAVOR DE PONER CP DEL CLIENTE');
          CODIGOCLI.KeyValue := NULL;
          TDIRE.Text := '';
          TRFC.Text := '';
          CODE.Text := '';
          NAME.Text := '';
          NOMBRE_CLI.Text := '';
           PON_USOCFDI.KEYVALUE := NULL;
          EXIT;

      END;


      busregimen.close;
      busregimen.parambyname('cod_cli').asstring:=  QTIPO.FIELDBYNAME('cod_CLI').AsString;
      busregimen.open;

      if busregimen.fieldbyname('regimen').asstring = '' then
      begin
          showmessage('REVISA REGIMEN CLIENTE');
           CODIGOCLI.KeyValue := NULL;
           TDIRE.Text := '';
          TRFC.Text := '';
          CODE.Text := '';
          NAME.Text := '';
          NOMBRE_CLI.Text := '';
           PON_USOCFDI.KEYVALUE := NULL;
           EXIT;
      end
      else
          regimen_cli := busregimen.fieldbyname('regimen').asstring;






      //TDIRE.Text:= QTIPO.FIELDBYNAME('DOM_CLI').AsString;
      TRFC.Text:= QTIPO.FIELDBYNAME('RFC_CLI').AsString;
      trfc.Text := stripped('-',trfc.Text);
      cod_cli := qtipo.fieldbyname('cod_cli').AsString;
      nom_cli:=  qtipo.fieldbyname('RAZ_SOC').AsString;
      ciu_cli:= qtipo.fieldbyname('ciu_cli').AsString;
      est_cli:= qtipo.fieldbyname('est_cli').AsString;
      lim_cre:= qtipo.fieldbyname('lim_cre').asfloat;
      cod_pos:= qtipo.fieldbyname('cod_pos').asstring;
      pla_clie:= qtipo.fieldbyname('pla_cli').asstring;

      label17.Visible:= true;
      name.Visible:= true;
      label33.visible:= false;
      code.Visible:= false;


      IF LENGTH(COD_POS) = 4 then
              cod_pos := '0'+cod_pos;





      name.Text:= nom_cli;

      //aqui reviso que tenga tipo pago

         qtipo_pago.Close;
     qtipo_pago.ParamByName('cod_cli').AsString := cod_cli;
     qtipo_pago.Open;


      if qtipo_pago.FieldByName('tipo_pago').AsString = '' then
     begin
           QCODIGOART.CLOSE;
          showmessage('Revisa cliente no tiene Tipo de Pago');
          exit;

    end;




        if qtipo_pago.FieldByName('tipo_pago').AsString = 'Efectivo' then
        begin
           if question('Este cliente esta Registrado como pago efectivo te va a pagar con Efectivo?') = true then
           begin


      qdebefac.Close;
      qdebefac.ParamByName('num_emp').AsString:= num_empresa.Text;
      qdebefac.ParamByName('cod_cli').asstring:= cod_cli;
      qdebefac.open;

    ACHI := 0;


    //  tot_debe.Text:= qdebefac.Fields[0].AsString;
       tot_debe.Text:= floattostrf( qdebefac.Fields[0].Asfloat,ffnumber, 10,2);



       if ya_puse_rfc = 0 then
              rfc_tmp := trfc.text;

      IF COD_CLI <> '9999' THEN
            BEGIN
              label6.Visible:= FALSE;
              alias.Visible:= FALSE;
           end;


      if (cod_cli = '9999') or (cod_cli ='5555') then
           begin
              label6.Visible:= true;
              alias.Visible:= true;
              alias.SetFocus;
           end;

           qsucur.Close;
           qsucur.ParamByName('cod_cli').asstring := cod_cli;
           qsucur.Open;


           if qsucur.FieldByName('sucursal').asstring = '' then
                bande:= 0
            else
                bande:= 1;


      if cod_cli ='O14L' then
        begin
          label37.Visible:= true;
          orden_compra.Visible:= true;
        end;

           {

      if cod_cli= 'O14L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '1';
                qsucur.Open;
                BANDE:= 1;

             end;

        if cod_cli= 'S235L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '2';
                qsucur.Open;
                 BANDE:= 1;
             end;

        if cod_cli= 'W21F' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '3';
                qsucur.Open;
                 BANDE:= 1;
             end;

         if cod_cli= 'C133L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '5';
                qsucur.Open;
                BANDE:= 1;
             end;

  if cod_cli= 'A291L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '6';
                Qsucur.Open;
                 BANDE:= 1;
             end;

  if cod_cli= 'L200L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '7';
                qsucur.Open;
                 BANDE:= 1;
             end;


  if cod_cli= 'E289L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '8';
                qsucur.Open;
                BANDE:= 1;
             end;

if cod_cli= 'C67L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '9';
                qsucur.Open;
                 BANDE:= 1;
             end;


if cod_cli= 'R891L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '10';
                qsucur.Open;
                BANDE:= 1;
             end;


if cod_cli= 'O107F' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '12';
                qsucur.Open;
                Bande:= 1;
             end;

if cod_cli= 'G2L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '13';
                qsucur.Open;
                Bande:= 1;
             end;

if cod_cli= 'N37L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '14';
                qsucur.Open;
                Bande:= 1;
             end;
                       }



    IF BANDE= 0 THEN
     BEGIN
        QCODIGOART.CLOSE;
        qcodigoart.ParamByName('NUM_EMP').AsString:= FORM9.NUM_EMPRESA.TEXT;
        qcodigoart.OpeN;
        IF ALIAS.Visible = FALSE THEN
               CODIGOART.SetFocus;
      END;

      IF BANDE= 1 THEN
       BEGIN
           IF ALIAS.Visible = FALSE THEN
               CSUCURSAL.SetFocus;
       END;


          end
           else
            begin
                QCODIGOART.CLOSE;
                SHOWMESSAGE('REVISA TIPO PAGO EN MENU DE CLIENTES');
                EXIT
            end;
       end;

        if (qtipo_pago.FieldByName('tipo_pago').AsString <> 'Efectivo') AND (qtipo_pago.FieldByName('tipo_pago').AsString <> '') then
      begin

           

      qdebefac.Close;
      qdebefac.ParamByName('num_emp').AsString:= num_empresa.Text;
      qdebefac.ParamByName('cod_cli').asstring:= cod_cli;
      qdebefac.open;

       ACHI := 0;


    //  tot_debe.Text:= qdebefac.Fields[0].AsString;
       tot_debe.Text:= floattostrf( qdebefac.Fields[0].Asfloat,ffnumber, 10,2);


   
       if ya_puse_rfc = 0 then
              rfc_tmp := trfc.text;

      IF COD_CLI <> '9999' THEN
            BEGIN
              label6.Visible:= FALSE;
              alias.Visible:= FALSE;
           end;


      if (cod_cli = '9999') or (cod_cli ='5555') then
           begin
              label6.Visible:= true;
              alias.Visible:= true;
              alias.SetFocus;
           end;

           qsucur.Close;
           qsucur.ParamByName('cod_cli').asstring := cod_cli;
           qsucur.Open;


           if qsucur.FieldByName('sucursal').asstring = '' then
                bande:= 0
            else
                bande:= 1;


      if cod_cli ='O14L' then
        begin
          label37.Visible:= true;
          orden_compra.Visible:= true;
        end;

           {

      if cod_cli= 'O14L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '1';
                qsucur.Open;
                BANDE:= 1;

             end;

        if cod_cli= 'S235L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '2';
                qsucur.Open;
                 BANDE:= 1;
             end;

        if cod_cli= 'W21F' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '3';
                qsucur.Open;
                 BANDE:= 1;
             end;

         if cod_cli= 'C133L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '5';
                qsucur.Open;
                BANDE:= 1;
             end;

  if cod_cli= 'A291L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '6';
                Qsucur.Open;
                 BANDE:= 1;
             end;

  if cod_cli= 'L200L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '7';
                qsucur.Open;
                 BANDE:= 1;
             end;


  if cod_cli= 'E289L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '8';
                qsucur.Open;
                BANDE:= 1;
             end;

if cod_cli= 'C67L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '9';
                qsucur.Open;
                 BANDE:= 1;
             end;


if cod_cli= 'R891L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '10';
                qsucur.Open;
                BANDE:= 1;
             end;


if cod_cli= 'O107F' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '12';
                qsucur.Open;
                Bande:= 1;
             end;

if cod_cli= 'G2L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '13';
                qsucur.Open;
                Bande:= 1;
             end;

if cod_cli= 'N37L' Then
             begin
                qsucur.Close;
                qsucur.parambyname('grupo').asstring:= '14';
                qsucur.Open;
                Bande:= 1;
             end;
                       }



    IF BANDE= 0 THEN
     BEGIN
        QCODIGOART.CLOSE;
        qcodigoart.ParamByName('NUM_EMP').AsString:= FORM9.NUM_EMPRESA.TEXT;
        qcodigoart.OpeN;
        IF ALIAS.Visible = FALSE THEN
               CODIGOART.SetFocus;
      END;

      IF BANDE= 1 THEN
       BEGIN
           IF ALIAS.Visible = FALSE THEN
               CSUCURSAL.SetFocus;
       END;



      END;
    END;
end;




procedure TForm9.Btsendmail(Sender: TObject);
begin
     FORM11.SHOWMODAL;

     IF SIKEDO = 1 THEN
     BEGIN
       pre_pro.ReadOnly:= false;
       pre_pro.SetFocus;
       sikedo := 0;
     end
     ELSE
       SHOWMESSAGE('CLAVE ERRONEO');
end;





procedure TForm9.Tipo_pagoClick(Sender: TObject);
begin
     IF  (NUM_EMPRESA.TEXT = '02')  AND (FORM13.EMP= 1) THEN
        BEGIN
            SHOWMESSAGE('CAMBIA LA EMPRESA');
            tipo_pago.itemindex:= -1;
            EXIT;
        END;


            IF CODIGOCLI.TEXT = '' THEN
            BEGIN
               IF TIPO_PAGO.ItemIndex = 0 THEN
                 BEGIN

                      //CAMBIOS FACE


                      qfolio.Close;
                      qfolio.ParamByName('cajera').AsString:= form4.agente1;
                      qfolio.Open;



                      NOMBRE.VISIBLE:= TRUE;
                      LABEL3.VISIBLE:= TRUE;
                      NOMBRE.SetFocus;
                    //  TIPO_PAGO.ItemIndex:= 0;
                      TIPOCONSULTA.ItemIndex:= 1;
                      FACTU.ReadOnly:= TRUE;
                      

                      END;





               IF TIPO_PAGO.ItemIndex = 1 THEN
                   begin
                    TDIRE.Text:= '';
                    TRFC.Text:= 'VENTAS DE CONTADO';
                    cod_cli:=  '9999';
                    nom_cli:=  'VENTAS DE CONTADO';
                    NOMBRE_CLI.Visible:= TRUE;
                    NOMBRE_CLI.Text:= 'VENTAS DE CONTADO';
                    ciu_cli:= '';
                    est_cli:= '';
                    NOMBRE.VISIBLE:=FALSE;
                    LABEL3.Visible:= TRUE;
                    code.Text:= cod_cli;
                    label6.Visible:= true;
                    alias.Visible:= true;
                    alias.SetFocus;
                   tipo_pago.ItemIndex:= 1;
                    tipoconsulta.ItemIndex:= 0;
                  end;

          END;




end;

{
procedure tform9.crear_xml;
var
     FAC_ELE1, FAC_ELE : TextFile;
    tipo_fin, banco_fin, num_ctafin, tipo_pagofin, canti_tot, unidad, cant_total, ACUDELE, SUBTOELE, TOTAL_ELE, IVAELE, CONCE_FECHA: STRING;
    ADoc: TNativeXml;
    linea : integer;
begin
 // Create new document with a rootnode called "Root"
 //  adoc:= tnativexml.Create;
   ADoc := TNativeXml.CreateName('Comprobante');
   banco_fin := '';
   num_ctafin:= '';
tipo_pagofin := '';
   QBUSTIPO.CLOSE;
   QBUSTIPO.PARAMBYNAME('COD_CLI').ASSTRING := cod_cli;
   QBUSTIPO.OPEN;

   tipo_pagofin := QBUSTIPO.FIELDBYNAME('tipo_pago').ASSTRING;

   IF (tipo_pagofin = 'Credito') then
          tipo_pagofin := 'No Identificado';


   if tipo_pagofin  = '' then
          tipo_pagofin := 'No Identificado';

   if (tipo_pagofin <>'Efectivo' ) AND (tipo_pagofin <> 'Credito') then
    begin
         banco_fin := QBUSTIPO.FIELDBYNAME('banco').ASSTRING;
         tipo_fin := QBUSTIPO.FIELDBYNAME('tipo_pago').ASSTRING;
         num_ctafin := QBUSTIPO.FIELDBYNAME('num_cta').ASSTRING;
         tipo_pagofin := tipo_fin+ banco_fin;
    end;

  try
    // Add a subnode with name "Customer"

    ShortDateFormat := 'dd/mm/yyyy';
    SHORTtimeformat:= 'HH:mm:ss';

     horafinal:= timetostr(time);


     CONCE_FECHA := TMPANO+'-'+TMPMES+'-'+TMPDIA+'T'+HORAFINAL;
     CONCE_FECHA:= copy(CONCE_FECHA, 1, 19);


      with ADoc.Root do
       begin
 //  with ADoc.Root.NodeNew('Comprobante') do begin

     ACUDELE:= FLOATTOSTRF(ACUDES,FFNUMBER,10,2);
     SUBTOELE:= FLOATTOSTRF(SUBTOTAL,FFNUMBER,10,2);
     TOTAL_ELE:= FLOATTOSTRF(TOTAL_FIN,FFNUMBER,10,2);
     IVAELE:= FLOATTOSTRF(IVATOTAL,FFNUMBER,10,2);

     SUBTOELE:= STRIPPED(',',SUBTOELE);
     TOTAL_ELE:= STRIPPED(',',TOTAL_ELE);
     IVAELE:= STRIPPED(',',IVAELE);
     ACUDELE:= STRIPPED(',',ACUDELE);


      writeattributestring('xmlns', 'http://www.sat.gob.mx/cfd/2');
      writeattributestring('xmlns:xsi', 'http://www.w3.org/2001/XMLSchema-instance');
   //   WriteAttributestring('xmlns:psgecfd', 'http://www.sat.gob.mx/psgecfd');

      if cod_cli ='O14L' THEN
            WriteAttributestring('xmlns:alsuper', 'http://proveedores.alsuper.com/CFD');

      writeattributestring('anoAprobacion', ano_aprobae);
      writeattributestring('certificado', '');
      writeattributestring('condicionesDePago',  pla_cliestr);
      writeattributestring('fecha', CONCE_FECHA);
      writeattributestring('folio', folio_inicioe);
      writeattributestring('formaDePago', 'Pago en una sola exhibicion');
      writeattributestring('noAprobacion', num_aprobae);
      writeattributestring('noCertificado', '');
      writeattributestring('sello', '');
      writeattributestring('serie', seriee);
      writeattributestring('subTotal', SUBTOELE);
      WRITEATTRIBUTESTRING('descuento', ACUDELE);
      writeattributestring('tipoDeComprobante', 'ingreso');
      //aqui agregue cambios 4 enero 2012







      writeattributestring('metodoDePago', tipo_pagofin);
      writeattributestring('LugarExpedicion', '1');

        IF NUM_CTAFIN <> '' THEN
              writeattributestring('NumCtaPago', num_ctafin);

       writeattributestring('anoAprobacion', ano_aprobae);
      writeattributestring('total',TOTAL_ELE);
      writeattributestring('version', '2.2');

      if cod_cli ='O14L' then
            writeattributestring('xsi:schemaLocation', 'http://www.sat.gob.mx/cfd/2 http://www.sat.gob.mx/sitio_internet/cfd/2/cfdv22.xsd http://proveedores.alsuper.com/CFD http://proveedores.alsuper.com/addenda/1.xsd')
      else
            writeattributestring('xsi:schemaLocation', 'http://www.sat.gob.mx/cfd/2 http://www.sat.gob.mx/sitio_internet/cfd/2/cfdv22.xsd');



   //   writeattributefloat('descuento', 561.96);

      { adoc.root.nodenew('emisor').WriteString('nombre','COMESTIBLES Y LEGUMBRES SA DE CV');
     adoc.root.nodenew('emisor').WriteString('rfc','CLE8908119N6'); }

  {  with adoc.root.NodeNew('Emisor') do begin
      writeattributestring('nombre','COMESTIBLES Y LEGUMBRES SA DE CV');
      writeattributestring('rfc','CLE8908119N6');
    with  NodeNew('DomicilioFiscal')  do begin
      writeattributestring('calle','Blvd. Juan Pablo II Int. Central de Abasto');
      writeattributestring('codigoPostal','31384');
      writeattributestring('colonia','Aeropuerto');
      writeattributestring('estado','Chihuahua');
      writeattributestring('localidad','Chihuahua');
      writeattributestring('municipio','Chihuahua');
      writeattributestring('noExterior','4701');
      writeattributestring('noInterior','AA BOD 26');
      writeattributestring('pais','Mexico');
     END;
           // agregue esto el 4 enero 2012

     with NodeNew('RegimenFiscal') do begin
   //    writeattributestring('Cnsc_Regimen','1');
      writeattributestring('Regimen','regimen general de ley');
     end;

   end;


    with adoc.root.NodeNew('Receptor') do begin

      qbus99.Close;
      qbus99.ParamByName('cod_cli').AsString:= cod_cli;
      qbus99.open;


   if qbus99.Fields[0].AsString = '' then
      WRITEATTRIBUTESTRING('nombre', NOM_CLI)
    else
      WRITEATTRIBUTESTRING('nombre', 'VENTAS AL PUBLICO EN GRAL.');

      
      writeattributestring('rfc', trfc.Text);
    with  NodeNew('Domicilio')  do begin
      writeattributestring('calle', qdeta.fieldbyname('calle').AsString);
      writeattributestring('codigoPostal',cod_pos);
      writeattributestring('colonia',  qdeta.fieldbyname('colonia').AsString);
      writeattributestring('estado',EST_CLI);
      writeattributestring('localidad',CIU_CLI);
      writeattributestring('municipio', qdeta.fieldbyname('municipio').AsString);
      writeattributestring('noExterior', qdeta.fieldbyname('num_ext').AsString);
      writeattributestring('noInterior', qdeta.fieldbyname('num_int').AsString);
      writeattributestring('pais','MEXICO');
     end;
    end;

      QPPAL.Close;
      qppal.parambyname('folio').asstring:= tfolio.text;
      qppal.parambyname('nombre').AsString:= form4.agente1;
   //   qppal.parambyname('num_emp').AsString:= num_empresa.Text;
      qppal.open;
      qppal.First;

     with adoc.root.NodeNew('Conceptos') do begin
      WHILE NOT QPPAL.Eof DO
         BEGIN
        with  NodeNew('Concepto')  do
         begin

         if QPPAL.FIELDBYNAME('tipo').ASSTRING ='K' THEN
          BEGIN
            if QPPAL.FIELDBYNAME('Kilos').asstring = '0' then
              begin
                  writeattributestring('cantidad', QPPAL.FIELDBYNAME('cajas').asstring);
                  writeattributestring('unidad','CJA');
                   writeattributestring('valorUnitario',QPPAL.FIELDBYNAME('precio').asstring);


              end
            else
              begin
                  writeattributestring('cantidad', QPPAL.FIELDBYNAME('kilos').asstring);
                  writeattributestring('unidad','KGS');
                  writeattributestring('valorUnitario',QPPAL.FIELDBYNAME('precio').asstring);


              end;


              IF (QPPAL.FIELDBYNAME('Kilos').asstring <>'0') AND
                 (QPPAL.FIELDBYNAME('CAJAS').asstring <>'0') THEN
                 BEGIN

                    cant_TOTAL:= floattostrf((QPPAL.FIELDBYNAME('total').asFLOAT / QPPAL.FIELDBYNAME('KILOS').asFLOAT), ffnumber,10,2);
                    cant_total:= stripped(',', cant_total);
                    writeattributestring('cantidad', QPPAL.FIELDBYNAME('KILOS').asstring);
                    writeattributestring('unidad','KGS');
                    writeattributestring('valorUnitario',CANT_TOTAL);




                 END;


                  writeattributestring('descripcion',QPPAL.FIELDBYNAME('descripcion').asstring);
                  writeattributestring('importe', QPPAL.FIELDBYNAME('total').asstring);
                  writeattributestring('noIdentificacion',QPPAL.FIELDBYNAME('codigo').asstring);

          END;

          if QPPAL.FIELDBYNAME('tipo').ASSTRING ='C' THEN
          BEGIN
            if QPPAL.FIELDBYNAME('cajas').asstring = '0' then
              begin
                  writeattributestring('cantidad', QPPAL.FIELDBYNAME('Kilos').asstring);
                  writeattributestring('unidad','KGS');
                  writeattributestring('valorUnitario',QPPAL.FIELDBYNAME('precio').asstring);


              end
            else
               begin
                  writeattributestring('cantidad', QPPAL.FIELDBYNAME('cajas').asstring);
                  writeattributestring('unidad','CJA');
                  writeattributestring('valorUnitario',QPPAL.FIELDBYNAME('precio').asstring);


               end;


                  IF (QPPAL.FIELDBYNAME('Kilos').asstring <>'0') AND
                 (QPPAL.FIELDBYNAME('CAJAS').asstring <>'0') THEN
                 BEGIN

                    cant_TOTAL:= floattostrf((QPPAL.FIELDBYNAME('total').asFLOAT / QPPAL.FIELDBYNAME('CAJAS').asFLOAT), ffnumber,10,2);
                    cant_total:= stripped(',', cant_total);
                    writeattributestring('cantidad', QPPAL.FIELDBYNAME('CAJAS').asstring);
                    writeattributestring('unidad','CJA');
                    writeattributestring('valorUnitario', CANT_TOTAL);




                 END;


                  writeattributestring('descripcion',QPPAL.FIELDBYNAME('descripcion').asstring);
                  writeattributestring('importe', QPPAL.FIELDBYNAME('total').asstring);
                  writeattributestring('noIdentificacion',QPPAL.FIELDBYNAME('codigo').asstring);

            END;




          QPPAL.Next;
         END;
       end;
     end;



   IF IVAELE = '0.00' THEN BEGIN
    with adoc.root.NodeNew('Impuestos') do begin
     writeattributestring('totalImpuestosTrasladados','0.00');
       with nodenew('Traslados') do begin
         with nodenew('Traslado') do begin
           writeattributestring('importe', '0.00');
           writeattributestring('impuesto','IVA');
           writeattributestring('tasa', '0.00');
        end;
      end;
     end;
    END
     ELSE
     with adoc.root.NodeNew('Impuestos') do begin
     writeattributeSTRING('totalImpuestosTrasladados',IVAELE);
       with nodenew('Traslados') do begin
         with nodenew('Traslado') do begin
           writeattributeSTRING('importe', IVAELE);
           writeattributestring('impuesto','IVA');
           writeattributestring('tasa', '16.00');
        end;
      end;
     end;
  end;

 { IF COD_CLI ='O14L' THEN
    BEGIN
       with adoc.root.NodeNew('Addenda') do begin

        with  NodeNew('alsuper:Alsuper')  do begin

           writeattributeSTRING('version', '1.0');

           if orden_compra.Text <> '' then
             begin
              writeattributeSTRING('ordenDeCompra', orden_compra.text);
             end;

              writeattributeSTRING('sucursal','10017000');
              writeattributestring('email','clientes@colesa.com.mx');
                with nodenew('alsuper:Conceptos')  DO BEGIN
                   with nodenew('alsuper:Concepto') DO BEGIN
                     writeattributeSTRING('noPartida', '1');
                 END;
            END;
           END;
         END;
       END;}



    // Save the XML in readable format (so with indents)
  {  ADoc.XmlFormat := xfReadable;
    // Save results to a file

    ADoc.SaveToFile('C:\ENVIAR\'+folio_inicioe+'.xml');
    finally
   ADoc.Free;
  end;


  if ((cod_cli<> 'S235L') OR (cod_cli<> 'D215L') OR (cod_cli<> 'D81L')) THEN
                     BEGIN


                    CHDIR('C:\FAC ELECTRONICA\');
                    AssignFile(fac_ele1,'UNIF_'+'PIPE'+ '_FACT_'+factu.Text+'.BAN');
                    REWRITE(fac_ele1);
                    CLOSEFILE (FAC_ELE1);

                    CHDIR('C:\FAC ELECTRONICA\');
                    AssignFile(fac_ele,'UNIF_'+'PIPE'+ '_FACT_'+factu.Text+'.TXT');
                    REWRITE(fac_ele);

                    IF (COD_POS = '') OR (COD_POS = '0') THEN
                          COD_POS := '11111';


                    WRITELN(FAC_ELE,  'COMPROBANTE'+'|'+'AAA010101AAA'+'|'+'CFDPRUEBA'+'|'+TRFC.TEXT+'|'+ '2.2'+'|'+'Pago en una sola exhibicion'+ '|'+
                                      '|'+ subtoele+ '|'+'|' + '|' + total_ele + '|'+'|'+'1'+'|'+'MXN'+'|' + folio_inicioe+ '|' + conce_fecha);

                    WRITELN(FAC_ELE, 'EMISOR|AAA010101AAA|COMESTIBLES Y LEGUMBRES SA DE CV|J. PABLO II CENTRAL DE ABASTOS CAA|4701|B26|AEROPUERTO|||CHIHUAHUA|CHIHUAHUA|MEXICO|31384');

                    WRITELN(FAC_ELE, 'EMI_EXP_EN|||||CHIHUAHUA||||MEXICO|31384');
                    WRITELN(FAC_ELE, 'RECEPTOR|'+ trfc.text + '|'+ nom_cli + '|'+ qdeta.fieldbyname('calle').AsString + '|'+
                                      qdeta.fieldbyname('num_ext').AsString + '|'+ qdeta.fieldbyname('num_int').AsString + '|'+
                                      qdeta.fieldbyname('colonia').AsString + '|'+
                                      ciu_cli +'|'+ '|'+ qdeta.fieldbyname('municipio').AsString + '|'+ est_cli + '|'+ 'MEXICO'+ '|'+ COD_POS) ;

                     WRITELN(FAC_ELE, 'REC_LOC_EN|||||'+qdeta.fieldbyname('colonia').AsString+'|||||MEXICO|'+ COD_POS+'|');

                    QPPAL.Close;
                    qppal.parambyname('folio').asstring:= tfolio.text;
                    qppal.parambyname('nombre').AsString:= form4.agente1;
         //           qppal.parambyname('num_emp').AsString:= num_empresa.Text;
                    qppal.open;
                    qppal.First;


                    LINEA:= 0;
                    canti_tot:= '0';

                    WHILE NOT qppal.EOF DO
                    BEGIN

                          if QPPAL.FIELDBYNAME('TIPO').asstring = 'C'THEN
                          BEGIN
                             UNIDAD := 'CAJAS';
                             canti_tot :=  QPPAL.FIELDBYNAME('cajas').asstring;
                             IF CANTI_TOT = '0' THEN
                               BEGIN
                                  UNIDAD := 'KILOS';
                                  canti_tot :=  QPPAL.FIELDBYNAME('kilos').asstring;
                               END;
                           END
                          ELSE
                           BEGIN
                             UNIDAD := 'KILOS';
                             canti_tot :=  QPPAL.FIELDBYNAME('kilos').asstring;
                             IF CANTI_TOT = '0' THEN
                               BEGIN
                                  UNIDAD := 'CAJAS';
                                  canti_tot :=  QPPAL.FIELDBYNAME('CAJAS').asstring;
                               END;
                           END;


                          LINEA:= LINEA + 1;

                          WRITELN(FAC_ELE, 'CONCEPTO|'+ INTTOSTR(LINEA) + '|'+  QPPAL.FIELDBYNAME('descripcion').asstring + '|'+ UNIDAD + '|' +
                                  QPPAL.FIELDBYNAME('PRECIO').asstring + '|' +  QPPAL.FIELDBYNAME('CODIGO').asstring + '|'+ canti_tot + '|'  + QPPAL.FIELDBYNAME('TOTAL').asstring   );



                       qppal.NEXT;

                      END;


                      if ivaele <> '0' then
                      begin
                        WRITELN(FAC_ELE, 'TRASLADOS|1|IVA|16|'+ivaele);
                        WRITELN(FAC_ELE, 'IMPUESTOS_TRASLADADOS|'+ivaele);
                        WRITELN(FAC_ELE, 'ADDENDA|NINGUNA|');
                      end
                      else
                      begin
                        WRITELN(FAC_ELE, 'TRASLADOS|1|IVA|16|0.00');
                        WRITELN(FAC_ELE, 'IMPUESTOS_TRASLADADOS|0.00');
                        WRITELN(FAC_ELE, 'ADDENDA|NINGUNA');
                      end;




                    closefile(fac_ele);

  END;
 end; }
                                                                                                                                                                                          
procedure tform9.crear_pdf;
var
    ARCHIVO, imprime:string;

    REPETIR, con_ren, VECES :INTEGER;

  tipo_pago, digitos, banco, pre_unitario, importe_total, descripcion, parte1, parte2,firma_digi1, fin_linea, compara, tfecha1,linea, canti: string;
  iva_15p, tot_iva15p, iva_po, tot_ivapo, totaldescto, acudescto, totdesc, subdesc, pre_uni, tot_imp, iva,importe, cantidad: real;
  g, h, x1, tdescuc, tot_ivac, fin_totc, tamapre, tamaim, ivac, ven_totc, stotc, TAMAC,  x,y,I, currentport: integer;
begin
    descripcion := '';
    tdescuc:=0;
    tot_ivac:=0;
    fin_totc:=0;
    tamapre:=0;
    tamaim:=0;
    tamac:=0;
    ivac:=0;
    ven_totc:=0;
    stotc:= 0;

     totaldescto:=0;
     fin_tot:=0;

     cantidad:= 0;
     canti:= '0';
     importe:=0;
     tot_imp := 0;
     iva:= 0;
     tot_iva := 0;
     pre_uni:= 0;
     acudescto:= 0;
     iva_15p:= 0;
     tot_iva15p:= 0;
     iva_po:= 0;
     tot_ivapo:= 0;

     ShortDateFormat := 'dd/mm/yyyy';
     shorttimeformat:= 'HH:mm:ss';


   // aqui valido lo de la nueva disposicion fiscal tipo pago/banco/digitos

     qtipo_pago.Close;
     qtipo_pago.ParamByName('cod_cli').AsString := cod_cli;
     qtipo_pago.Open;

{
     if
     digitos := '4598';

     digitos := '4200';

     digitos := '2625';       }

     if qtipo_pago.FieldByName('tipo_pago').AsString = '' then
     begin
          tipo_pago:= 'Efectivo';
          banco := '';
          digitos := ''

     end;


     if qtipo_pago.FieldByName('tipo_pago').AsString = 'Transferencia' then
     begin
          tipo_pago:= 'Transferencia';
          banco :=   qtipo_pago.FieldByName('banco').AsString;
          digitos := qtipo_pago.FieldByName('num_cta').AsString;

     end;

 if qtipo_pago.FieldByName('tipo_pago').AsString = 'Efectivo' then
     begin
          tipo_pago:= 'Efectivo';
          banco := '';
          digitos := ''

     end;

   if qtipo_pago.FieldByName('tipo_pago').AsString = 'Credito' then
     begin
          tipo_pago:= 'Credito';
          banco := 'No Identificado';
          digitos :=  '';

     end;

      if qtipo_pago.FieldByName('tipo_pago').AsString = 'Cheque' then
     begin
          tipo_pago:= 'Cheque';
          banco := qtipo_pago.FieldByName('banco').AsString;
          digitos :=  qtipo_pago.FieldByName('num_cta').AsString;

     end;



      if qtipo_pago.FieldByName('tipo_pago').AsString = 'Tarjeta Credito' then
     begin
          tipo_pago:= 'T. de Credito';
          banco :=  qtipo_pago.FieldByName('banco').AsString;
          digitos := qtipo_pago.FieldByName('num_cta').AsString;

     end;


      if qtipo_pago.FieldByName('tipo_pago').AsString = 'Tarjeta Debito' then
     begin
          tipo_pago:= 'T. de Debito';
          banco :=  qtipo_pago.FieldByName('banco').AsString;
          digitos := qtipo_pago.FieldByName('num_cta').AsString;

     end;



     if (cod_cli ='9999') or (cod_cli ='5555') then
     begin
        nom_cli:= alias.text;
        tdire.text:= alias.text;
     end;

    qempresa.Close;
    qempresa.Open;

    horafinal:= timetostr(time);

    rvproject1.Open;
    RVPROJECT1.SetParam('FECHA',tmpdia+'/'+tmpmes+'/'+tmpano+'   '+horafinal);
    RVPROJECT1.SetParam('RFC',trfc.Text);
    RVPROJECT1.SetParam('COD_CLI',cod_cli);
    RVPROJECT1.SetParam('PAIS','MEXICO');
    RVPROJECT1.SetParam('LOCALIDAD',ciu_cli);
    RVPROJECT1.SetParam('ESTADO',est_cli);
    IF COD_CLI = 'G477L' THEN COD_POS:= '0'+COD_POS;
    RVPROJECT1.SetParam('CODIGOPOSTAL',COD_POS);
    rvproject1.SetParam('calle', qdeta.fieldbyname('calle').AsString);
    rvproject1.SetParam('noExterior', qdeta.fieldbyname('num_ext').AsString);
    rvproject1.setparam('noInterior', qdeta.fieldbyname('num_int').AsString);
    rvproject1.SetParam('colonia',  qdeta.fieldbyname('colonia').AsString);
    rvproject1.SetParam('tipo_pago', tipo_pago);
    rvproject1.setparam('banco', banco);
    rvproject1.SetParam('digitos',  digitos);


    qbus99.Close;
    qbus99.ParamByName('cod_cli').AsString:= cod_cli;
    qbus99.open;

    if NOM_CLI = '' then
         RVPROJECT1.SetParam('nombre', 'VENTAS AL PUBLICO EN GRAL.')
     else
         RVPROJECT1.SetParam('nombre', NOM_CLI);

    rvproject1.SetParam('NUM_DOC', factu.text);
    RVPROJECT1.SetParam('anoaprobae', ano_aprobae);
    rvproject1.SetParam('numaprobae', num_aprobae);
    rvproject1.SetParam('version','2.2');
    rvproject1.SetParam('certi','00001000000104904765');

      QPPALPA.Close;
      qppalPA.parambyname('folio').asstring:= tfolio.text;
      qppalPA.parambyname('nombre').AsString:= form4.agente1;
      qppalPA.parambyname('num_emp').AsString:= num_empresa.Text;
      qppalPA.open;
      qppalPA.First;


     con_ren:= 0;
    while not qppalpa.Eof do
      begin
        // if ((cod_cli='C21L') OR (COD_CLI='O07F')) THEN

       {    if cod_cli='C21L' THEN
              BEGIN
                 CANTIDAD:= (strtofloat(qppalpa.fieldbyname('Total').AsString))/(strtofloat (qppalpa.fieldbyname('Precio').asstring));
                 canti:= floattostrf(cantidad, ffnumber,10,2);
       //         importe:= strtofloat(qppalpa.fieldbyname('Total').AsString);
       //          tot_imp:= tot_imp + importe;
              END
              ELSE
              BEGIN }
                 cantidad:= (strtofloat(qppalpa.fieldbyname('Total').asstring)) / (strtofloat (qppalpa.fieldbyname('Precio').asstring));
                 canti:= floattostrf(cantidad,ffnumber,10,2);
      //           importe:= strtofloat(qppalpa.fieldbyname('Total').AsString);
      //           tot_imp:= tot_imp + importe;
        //      END;

      if qppalpa.FieldByName('IVA').asstring = '16' then
        begin
     {     iva:= strtofloat(qppalpa.fieldbyname('Totiva').AsString);
          tot_iva := tot_iva + iva;
          iva_15p:= strtofloat(qppalpa.fieldbyname('Total').AsString);
          tot_iva15p:= tot_iva15p + iva_15p;  }
        end
        else
         begin
          { iva_po:= strtofloat(qppalpa.fieldbyname('Total').AsString);
           tot_ivapo:= tot_ivapo + iva_po;    }
         end;

    //         pre_uni:= strtofloat(qppalpa.fieldbyname('Precio').AsString);

             if qppalpa.fieldbyname('cajas').AsString = '0' then
                Descripcion:= qppalpa.fieldbyname('descripcion').AsString
             else
                 descripcion:= qppalpa.fieldbyname('descripcion').AsString+'     '+ qppalpa.fieldbyname('cajas').AsString+'  CJA';

        //     pre_unitario:= floattostrf(pre_uni, ffnumber, 10,2);
        //     importe_total:= floattostrf(importe, ffNUMBER, 10,2);

        //     pre_unitario:= stripped(',', pre_unitario);
        //     importe_total:= stripped(',',importe_total);
             canti:= stripped(',',canti);

          temp_ventas.Open;
          temp_ventas.AppendRecord([qppalpa.fieldbyname('codigo').AsString, canti, descripcion,
                                   pre_unitario ,importe_total]);
          temp_ventas.Close;




         if qppalpa.FieldByName('descto').AsString <> '0' then
         begin
      //      acudescto := importe * ((tdescto.fieldbyname('porcentaje').asinteger)/100);
      //      totaldescto:= totaldescto + acudescto;
         end;

        qppalpa.Next;
        con_ren:= con_ren + 1;
     end;

      temp_ventas.close;
      temp_ventas.open;

    //  rvproject1.SetParam('ven_16', floattostrf(TOT_iva15p, ffcurrency, 10,2));
    //  rvproject1.SetParam('ven_cero', floattostrf(tot_ivapo, ffcurrency, 10,2));
    //  rvproject1.SetParam('subtotal', floattostrf((tot_iva15p+tot_ivapo),ffcurrency,10,2));


   //   if ((cod_cli <> 'C21L') OR (COD_CLI <> 'O07F'))  then

     if cod_cli <> 'C21L'  then
                begin
     {               rvproject1.SetParam('descuento', floattostrf(totaldescto, ffcurrency, 10,2));
                   rvproject1.SetParam('iva_tot', floattostrf(tot_iva, ffcurrency, 10,2));
                   fin_tot:= tot_iva+TOT_iva15p+tot_ivapo;
                   rvproject1.SetParam('total', floattostrf(fin_tot, ffcurrency, 10,2));
                  rvproject1.SetParam('dinero', dineroconletra(fin_tot)); }
                  rvproject1.SetParam('Tot_art', inttostr(con_ren) );
                end
                else
                begin
                  if (qppalpa.fieldbyname('descto').AsString <> '') THEN
                   begin
                {    rvproject1.SetParam('descuento', floattostrf(totaldescto, ffcurrency, 10,2));
                    rvproject1.SetParam('iva_tot', floattostrf(tot_iva, ffcurrency, 10,2));
                    fin_tot:= tot_iva+TOT_iva15p+tot_ivapo-totaldescto;
                   rvproject1.SetParam('total', floattostrf(fin_tot, ffcurrency, 10,2));
                   rvproject1.SetParam('dinero', dineroconletra(fin_tot));   }
                 	 rvproject1.SetParam('Tot_art', inttostr(con_ren) );

                   end
                   else
                   begin
             {      rvproject1.SetParam('descuento', floattostrf(totaldescto, ffcurrency, 10,2));
                   rvproject1.SetParam('iva_tot', floattostrf(tot_iva, ffcurrency, 10,2));
                   fin_tot:= tot_iva+TOT_iva15p+tot_ivapo;
                   rvproject1.SetParam('total', floattostrf(fin_tot, ffcurrency, 10,2));
                  rvproject1.SetParam('dinero', dineroconletra(fin_tot));    }
                  rvproject1.SetParam('Tot_art', inttostr(con_ren) );

                   end;


                end;


            rvproject1.SetParam('no_fac', factu.text);
            rvproject1.SetParam('sucursal', csucursal.Text);
            rvproject1.SetParam('cadenaori', cadena);
            rvproject1.setparam('sello', firma_digi);
            rvproject1.Close;


   RVProJect1.open;
   Archivo := 'c:\enviar\'+trfc.Text+'_'+SERIEE + FOLIO_INICIOE+'.pdf';
   RvSystem1.DefaultDest    := rdFile;
   RvSystem1.DoNativeOutput := false;
   RvSystem1.RenderObject   := RvRenderPDF1;
   RvSystem1.SystemSetups   := RvSystem1.SystemSetups - [ssAllowSetup];
   RvSystem1.OutputFileName := Archivo;
   RvProject1.Execute;
   RvProject1.Close;


    if (cod_cli ='9999') or (cod_cli ='5555') then
    begin
    nom_cli:= alias.text;
    tdire.text:= alias.text;
    end;

  REPETIR:=4;

    if (cod_cli = 'G477L') OR (COD_CLI ='W21F') THEN
        BEGIN
            repetir:= 5;
        END;

     copiascli.Close;
     copiascli.ParamByName('cod_cli').AsString := cod_cli;
     copiascli.Open;

    if copiascli.FieldByName('cod_cli').AsString <> ''  THEN
        BEGIN                                                                             

            repetir:= 3;
        END;


   RVProJect1.open;
   RvSystem1.DefaultDest    := rdprinter;
   RvSystem1.SystemSetups   := RvSystem1.SystemSetups - [ssAllowSetup];
   RVSYSTEM1.SystemPrinter.Copies :=REPETIR;
   RVProJect1.ProjectFile :='C:\delphi\reportes\Factura Electronica\FacturaORI.rav';
   RVProJect1.Execute;
   rvproject1.Close;

      tot_iva15p:= 0;
      tot_ivapo:= 0;
      tot_iva:= 0;
      fin_tot := 0;
      totaldescto:= 0;
      acudescto:= 0;
      descripcion := '';
      tipo_pago := '';
      banco:='';
      digitos :='';


   QBORRAR.Close;
   QBORRAR.ExecSQL;

end;




procedure tform9.crear_pdf2;
var
    ARCHIVO, imprime:string;

    REPETIR, con_ren, VECES :INTEGER;

  tipo_pago, digitos, banco, pre_unitario, importe_total, descripcion, parte1, parte2,firma_digi1, fin_linea, compara, tfecha1,linea, canti: string;
  num_ent, num_sal, iva_15p, tot_iva15p, iva_po, tot_ivapo, totaldescto, acudescto, totdesc, subdesc, pre_uni, tot_imp, iva,importe, cantidad: real;
  g, h, x1, tdescuc, tot_ivac, fin_totc, tamapre, tamaim, ivac, ven_totc, stotc, TAMAC,  x,y,I, currentport: integer;
begin
    descripcion := '';
    tdescuc:=0;
    tot_ivac:=0;
    fin_totc:=0;
    tamapre:=0;
    tamaim:=0;
    tamac:=0;
    ivac:=0;
    ven_totc:=0;
    stotc:= 0;

     totaldescto:=0;
     fin_tot:=0;

     cantidad:= 0;
     canti:= '0';
     importe:=0;
     tot_imp := 0;
     iva:= 0;
     tot_iva := 0;
     pre_uni:= 0;
     acudescto:= 0;
     iva_15p:= 0;
     tot_iva15p:= 0;
     iva_po:= 0;
     tot_ivapo:= 0;

     ShortDateFormat := 'dd/mm/yyyy';
     shorttimeformat:= 'HH:mm:ss';


   // aqui valido lo de la nueva disposicion fiscal tipo pago/banco/digitos

     qtipo_pago.Close;
     qtipo_pago.ParamByName('cod_cli').AsString := cod_cli;
     qtipo_pago.Open;

{
     if
     digitos := '4598';

     digitos := '4200';

     digitos := '2625';       }

     if qtipo_pago.FieldByName('tipo_pago').AsString = '' then
     begin
          tipo_pago:= 'Efectivo';
          banco := '';
          digitos := ''

     end;


     IF (COD_CLI ='C62L') THEN
     BEGIN

              //ESTA ES LA ENTRADA

              conent.close;
              conent.parambyname('num_emp').asstring := '10';
              conent.open;

              num_ent := strtofloat(conent.fields[1].asstring) +1;



             storedproc4.Params[0].Asstring := num_empresa.text;
             storedproc4.Params[1].Asstring := num_empresa.text;
             storedproc4.Params[2].AsString:= floattostr(num_ent);  //NUMERO DE ENTRADA
             storedproc4.Params[3].Asdate:= fechavientos.date;
             storedproc4.Params[4].AsString:= edit1.text; //TOTAL
             storedproc4.Params[5].AsString:= 'ENTRADA EN EL TERRENO';  //CONCEPTO DE LA ENTRADA
             storedproc4.ExecProc;


             //ESTA ES LA SALIDA


              consal.close;
              consal.parambyname('num_emp').asstring := '10';
              consal.open;

              num_sal := strtofloat(consal.fields[1].asstring) +1;

              storedproc6.Params[0].Asstring := num_empresa.text;
              storedproc6.Params[1].Asstring := num_empresa.text;
              storedproc6.Params[2].AsString:= floattostr(num_sal); //NUMERO SALIDA
              storedproc6.Params[3].Asdate:= fechavientos.date;
              storedproc6.Params[4].AsString:= edit1.text; //TOTAL
              storedproc6.Params[5].AsString:= 'SALIDA DEL TERRENO'; //CONCEPTO
              storedproc6.ExecProc;

     END;


     if qtipo_pago.FieldByName('tipo_pago').AsString = 'Transferencia' then
     begin
          tipo_pago:= 'Transferencia';
          banco :=   qtipo_pago.FieldByName('banco').AsString;
          digitos := qtipo_pago.FieldByName('num_cta').AsString;

     end;

 if qtipo_pago.FieldByName('tipo_pago').AsString = 'Efectivo' then
     begin
          tipo_pago:= 'Efectivo';
          banco := '';
          digitos := ''

     end;

   if qtipo_pago.FieldByName('tipo_pago').AsString = 'Credito' then
     begin
          tipo_pago:= 'Credito';
          banco := 'No Identificado';
          digitos :=  '';

     end;

      if qtipo_pago.FieldByName('tipo_pago').AsString = 'Cheque' then
     begin
          tipo_pago:= 'Cheque';
          banco := qtipo_pago.FieldByName('banco').AsString;
          digitos :=  qtipo_pago.FieldByName('num_cta').AsString;

     end;



      if qtipo_pago.FieldByName('tipo_pago').AsString = 'Tarjeta Credito' then
     begin
          tipo_pago:= 'T. de Credito';
          banco :=  qtipo_pago.FieldByName('banco').AsString;
          digitos := qtipo_pago.FieldByName('num_cta').AsString;

     end;


      if qtipo_pago.FieldByName('tipo_pago').AsString = 'Tarjeta Debito' then
     begin
          tipo_pago:= 'T. de Debito';
          banco :=  qtipo_pago.FieldByName('banco').AsString;
          digitos := qtipo_pago.FieldByName('num_cta').AsString;

     end;



     if (cod_cli ='9999') or (cod_cli ='5555') then
     begin
        nom_cli:= alias.text;
        tdire.text:= alias.text;
     end;

    qempresa.Close;
    qempresa.Open;

    horafinal:= timetostr(time);

    rvproject1.Open;
    RVPROJECT1.SetParam('FECHA',tmpdia+'/'+tmpmes+'/'+tmpano+'   '+horafinal);
    RVPROJECT1.SetParam('RFC',trfc.Text);
    RVPROJECT1.SetParam('COD_CLI',cod_cli);
    RVPROJECT1.SetParam('PAIS','MEXICO');
    RVPROJECT1.SetParam('LOCALIDAD',ciu_cli);
    RVPROJECT1.SetParam('ESTADO',est_cli);
    IF COD_CLI = 'G477L' THEN COD_POS:= '0'+COD_POS;
    RVPROJECT1.SetParam('CODIGOPOSTAL',COD_POS);
    rvproject1.SetParam('calle', qdeta.fieldbyname('calle').AsString);
    rvproject1.SetParam('noExterior', qdeta.fieldbyname('num_ext').AsString);
    rvproject1.setparam('noInterior', qdeta.fieldbyname('num_int').AsString);
    rvproject1.SetParam('colonia',  qdeta.fieldbyname('colonia').AsString);
    rvproject1.SetParam('tipo_pago', tipo_pago);
    rvproject1.setparam('banco', banco);
    rvproject1.SetParam('digitos',  digitos);


    qbus99.Close;
    qbus99.ParamByName('cod_cli').AsString:= cod_cli;
    qbus99.open;

    if NOM_CLI = '' then
         RVPROJECT1.SetParam('nombre', 'VENTAS AL PUBLICO EN GRAL.')
     else
         RVPROJECT1.SetParam('nombre', NOM_CLI);

    rvproject1.SetParam('NUM_DOC', factu.text);
    RVPROJECT1.SetParam('anoaprobae', ano_aprobae);
    rvproject1.SetParam('numaprobae', num_aprobae);
    rvproject1.SetParam('version','2.2');
    rvproject1.SetParam('certi','00001000000104904765');

      QPPALPA.Close;
      qppalPA.parambyname('folio').asstring:= tfolio.text;
      qppalPA.parambyname('nombre').AsString:= form4.agente1;
      qppalPA.parambyname('num_emp').AsString:= num_empresa.Text;
      qppalPA.open;
      qppalPA.First;


     con_ren:= 0;
    while not qppalpa.Eof do
      begin
        // if ((cod_cli='C21L') OR (COD_CLI='O07F')) THEN

       {  if cod_cli='C21L' THEN
              BEGIN
                 CANTIDAD:= (strtofloat(qppalpa.fieldbyname('Total').AsString))/(strtofloat (qppalpa.fieldbyname('Precio').asstring));
                 canti:= floattostrf(cantidad, ffnumber,10,2);
           //   importe:= strtofloat(qppalpa.fieldbyname('Total').AsString);
           //      tot_imp:= tot_imp + importe;
              END
              ELSE
              BEGIN  }
                 cantidad:= (strtofloat(qppalpa.fieldbyname('Total').asstring)) / (strtofloat (qppalpa.fieldbyname('Precio').asstring));
                 canti:= floattostrf(cantidad,ffnumber,10,2);
           //      importe:= strtofloat(qppalpa.fieldbyname('Total').AsString);
           //      tot_imp:= tot_imp + importe;
           //   END;

      if qppalpa.FieldByName('IVA').asstring = '16' then
        begin
       {    iva:= strtofloat(qppalpa.fieldbyname('Totiva').AsString);
          tot_iva := tot_iva + iva;
          iva_15p:= strtofloat(qppalpa.fieldbyname('Total').AsString);
          tot_iva15p:= tot_iva15p + iva_15p;
        end
        else
         begin
           iva_po:= strtofloat(qppalpa.fieldbyname('Total').AsString);
           tot_ivapo:= tot_ivapo + iva_po;    }
         end;

        //     pre_uni:= strtofloat(qppalpa.fieldbyname('Precio').AsString);

             if qppalpa.fieldbyname('cajas').AsString = '0' then
                Descripcion:= qppalpa.fieldbyname('descripcion').AsString
             else
                 descripcion:= qppalpa.fieldbyname('descripcion').AsString+'     '+ qppalpa.fieldbyname('cajas').AsString+'  CJA';

       //      pre_unitario:= floattostrf(pre_uni, ffnumber, 10,2);
       //      importe_total:= floattostrf(importe, ffNUMBER, 10,2);

       //      pre_unitario:= stripped(',', pre_unitario);
       //      importe_total:= stripped(',',importe_total);
             canti:= stripped(',',canti);

          temp_ventas.Open;
          temp_ventas.AppendRecord([qppalpa.fieldbyname('codigo').AsString, canti, descripcion,
                                   pre_unitario ,importe_total]);
          temp_ventas.Close;




         if qppalpa.FieldByName('descto').AsString <> '0' then
         begin
     //       acudescto := importe * ((tdescto.fieldbyname('porcentaje').asinteger)/100);
     //       totaldescto:= totaldescto + acudescto;
         end;


         IF (COD_CLI ='C62L') THEN
        BEGIN


        qbuscod.Close;
        qbuscod.ParamByName('cod_art').AsString :=  qppalpa.fieldbyname('codigo').AsString;
        qbuscod.ParamByName('num_emp').AsString :=  num_empresa.text;
        qbuscod.Open;


        //ESTA ES LA ENTRADA
            storedproc5.Params[0].Asstring := num_empresa.Text;
        storedproc5.Params[1].Asstring := num_empresa.text;
        storedproc5.Params[2].AsString:= qppalpa.fieldbyname('codigo').AsString+'T';
        storedproc5.Params[3].Asstring:= FLOATTOSTR(NUM_ENT);   //NUMERO DE ENTRADA
        storedproc5.Params[4].Asdate:= fechavientos.date;
        storedproc5.Params[5].AsString:= qppalpa.fieldbyname('kilos').AsString;
        storedproc5.Params[6].Asstring := qppalpa.fieldbyname('cajas').AsString;
        storedproc5.Params[7].Asstring := qbuscod.fieldbyname('cos_pro_kgs').AsString;
        storedproc5.Params[8].AsString:= qbuscod.fieldbyname('cos_pro_caj').AsString;
        storedproc5.Params[9].Asdate:= con_ren;
        storedproc5.ExecProc;


        //ESTA ES LA SALIDA

        storedproc7.Params[0].Asstring := num_empresa.Text;
        storedproc7.Params[1].Asstring := num_empresa.text;
        storedproc7.Params[2].AsString:= qppalpa.fieldbyname('codigo').AsString;
        storedproc7.Params[3].Asstring:= floattostr(num_sal); // NUMERO SALIDA
        storedproc7.Params[4].Asdate:= fechavientos.date;
        storedproc7.Params[5].AsString:= qppalpa.fieldbyname('kilos').AsString;
        storedproc7.Params[6].Asstring :=  qppalpa.fieldbyname('cajas').AsString;
        storedproc7.Params[7].Asstring := qbuscod.fieldbyname('cos_pro_kgs').AsString;
        storedproc7.Params[8].AsString:= qbuscod.fieldbyname('cos_pro_caj').AsString;
        storedproc7.Params[9].Asdate:= con_ren;
        storedproc7.ExecProc;



         END;

        qppalpa.Next;
        con_ren:= con_ren + 1;
     end;




     if cod_cli ='C62L' THEN
     BEGIN
          //AQUI ACTUALIZO LOS CONSECUTIVOS DE ENTRADA Y SALIDA

              qupent.Close;
              qupent.ParamByName('num_emp').AsString := '10';
              qupent.ParamByName('num_ent').AsString :=  FLOATTOSTR(NUM_ENT);
              qupent.ExecSQL;

              qactu.Close;
              qactu.parambyname('num_emp').asstring:= '10';
              qactu.parambyname('num_ent').asstring:=  FLOATTOSTR(NUM_sal);
              qactu.ExecSQL;

     END;

      temp_ventas.close;
      temp_ventas.open;

  //   rvproject1.SetParam('ven_16', floattostrf(TOT_iva15p, ffcurrency, 10,2));
  //   rvproject1.SetParam('ven_cero', floattostrf(tot_ivapo, ffcurrency, 10,2));
  //   rvproject1.SetParam('subtotal', floattostrf((tot_iva15p+tot_ivapo),ffcurrency,10,2));


      //if ((cod_cli <> 'C21L') OR (COD_CLI <> 'O07F'))  then
    //  if cod_cli <> 'C21L'  then
    //            begin
     {               rvproject1.SetParam('descuento', floattostrf(totaldescto, ffcurrency, 10,2));
                   rvproject1.SetParam('iva_tot', floattostrf(tot_iva, ffcurrency, 10,2));
                   fin_tot:= tot_iva+TOT_iva15p+tot_ivapo;
                   rvproject1.SetParam('total', floattostrf(fin_tot, ffcurrency, 10,2));
                  rvproject1.SetParam('dinero', dineroconletra(fin_tot)); }
       rvproject1.SetParam('Tot_art', inttostr(con_ren) );
           {     end
                else
                begin
                  if (qppalpa.fieldbyname('descto').AsString <> '') THEN
                   begin
              {      rvproject1.SetParam('descuento', floattostrf(totaldescto, ffcurrency, 10,2));
                    rvproject1.SetParam('iva_tot', floattostrf(tot_iva, ffcurrency, 10,2));
                    fin_tot:= tot_iva+TOT_iva15p+tot_ivapo-totaldescto;
                   rvproject1.SetParam('total', floattostrf(fin_tot, ffcurrency, 10,2));
                   rvproject1.SetParam('dinero', dineroconletra(fin_tot));   }
                 	 rvproject1.SetParam('Tot_art', inttostr(con_ren) );

               {    end
                   else
                   begin
                {     rvproject1.SetParam('descuento', floattostrf(totaldescto, ffcurrency, 10,2));
                   rvproject1.SetParam('iva_tot', floattostrf(tot_iva, ffcurrency, 10,2));
                   fin_tot:= tot_iva+TOT_iva15p+tot_ivapo;
                   rvproject1.SetParam('total', floattostrf(fin_tot, ffcurrency, 10,2));
                  rvproject1.SetParam('dinero', dineroconletra(fin_tot));    }
            {      rvproject1.SetParam('Tot_art', inttostr(con_ren) );

                   end;


                end;  }
            rvproject1.SetParam('no_fac', factu.text);
            rvproject1.SetParam('sucursal', csucursal.Text);
            rvproject1.SetParam('cadenaori', cadena);
            rvproject1.setparam('sello', firma_digi);
            rvproject1.Close;


   RVProJect1.open;
   Archivo := 'c:\enviar\'+trfc.Text+'_'+SERIEE + FOLIO_INICIOE+'.pdf';
   RvSystem1.DefaultDest    := rdFile;
   RvSystem1.DoNativeOutput := false;
   RvSystem1.RenderObject   := RvRenderPDF1;
   RvSystem1.SystemSetups   := RvSystem1.SystemSetups - [ssAllowSetup];
   RvSystem1.OutputFileName := Archivo;
   RvProject1.Execute;
   RvProject1.Close;


    if (cod_cli ='9999') or (cod_cli ='5555') then
    begin
    nom_cli:= alias.text;
    tdire.text:= alias.text;
    end;

  REPETIR:=4;

    if (cod_cli = 'G477L') OR (COD_CLI ='W21F') THEN
        BEGIN
            repetir:= 5;
        END;

     copiascli.Close;
     copiascli.ParamByName('cod_cli').AsString := cod_cli;
     copiascli.Open;

    if copiascli.FieldByName('cod_cli').AsString <> ''  THEN
        BEGIN
            repetir:= 3;
        END;


   RVProJect1.open;
   RvSystem1.DefaultDest    := rdprinter;
   RvSystem1.SystemSetups   := RvSystem1.SystemSetups - [ssAllowSetup];
   RVSYSTEM1.SystemPrinter.Copies :=REPETIR;
   RVProJect1.ProjectFile :='C:\delphi\reportes\Factura Electronica\FacturaORI.rav';
   RVProJect1.Execute;
   rvproject1.Close;

      tot_iva15p:= 0;
      tot_ivapo:= 0;
      tot_iva:= 0;
      fin_tot := 0;
      totaldescto:= 0;
      acudescto:= 0;
      descripcion := '';
      tipo_pago := '';
      banco:='';
      digitos :='';


   QBORRAR.Close;
   QBORRAR.ExecSQL;

end;

 {
procedure tform9.firma;
var
  ret : Integer;
  nchars : Integer;
  buf : AnsiString;
  buf1 : AnsiString;
  ch  : Char;
  fname : AnsiString;
  newname : AnsiString;
  keyfile : AnsiString;
  certfile : AnsiString;
  password : AnsiString;
  elementName : AnsiString;
  attributeName : AnsiString;
//	digest : Array[0..SAT_MD5_CHARS-1] of AnsiChar;
  digest : Array[0..SAT_MAX_HASH_CHARS-1] of AnsiChar;

 	numstr : Array[Byte] of AnsiChar;
  FILESOURCE, FILEDEST : STRING;

begin
// showmessage('Running ' + ExtractFileName(ParamStr(0)) + ' at ' + DateTimeToStr(Now));

  // Set current working directory to find test files
  ChDir(TEST_DIR);
  if Not RequiredFilesExist(certi, arch_key) then
  begin
    showmessage('No se encuentran los archivos requeridos. Asegurate que esten en el directorio de C:\ENVIAR');
    ReadLn;
    Exit;
  end;


 // showmessage(CRLF + 'SIGN AN XML FILE:');
  fname := folio_inicioe+'.xml';
  newname := TRFC.Text+'_'+factu.Text+'_'+'CLE8908119N6'+'.xml';
  keyfile := arch_key;
  password := pass;   // CAUTION: DO NOT HARD-CODE REAL PASSWORDS!
  certfile := certi;
  ret := SAT_SignXml(newname, fname, keyfile, password, certfile, 0);
//  showmessage('SAT_SignXml("' + string(fname) + '"-->"' + string(newname) + '") returns ' + IntToStr(ret));
  If (ret <> 0) then disp_error(ret);



//  showmessage(CRLF + 'FORM THE PIPESTRING FROM AN XML FILE:');
  fname :=  TRFC.Text+'_'+factu.Text+'_'+'CLE8908119N6'+'.xml';
  nchars := SAT_MakePipeStringFromXml(NIL, 0, fname, 0);
//  showmessage('SAT_MakePipeStringFromXml returns nchars=' + IntToStr(nchars));
  buf := AnsiString(StringOfChar(#0,nchars));
  nchars := SAT_MakePipeStringFromXml(Pointer(buf), nchars, fname, 0);
  cadena:= buf;
//  showmessage('SAT_MakePipeStringFromXml=' + CRLF + buf);
  Assert(nchars > 0);


//  WriteLn(CRLF + 'GET CERTIFICATE AS A BASE64 STRING:');
  fname := certi;
// writeLn('For file ' + string(fname) + '...');
  nchars := SAT_GetCertAsString(NIL, 0, fname, 0);
	if (nchars >= 0) then
    begin
      buf := AnsiString(StringOfChar(#0,nchars));
      nchars := SAT_GetCertAsString(Pointer(buf), nchars, fname, 0);
     // WriteLn('SAT_GetCertAsString(' + string(fname) + ')=' + CRLF + string(buf));
      sello:= buf;
	//	  WriteLn('Length of cert string=' + IntToStr(nchars));
    end
	else
		disp_error(nchars);
  Assert(nchars > 0);


 // WriteLn(CRLF + 'MAKE A SIGNATURE FROM A BASE XML FILE:');
  fname := TRFC.Text+'_'+factu.Text+'_'+'CLE8908119N6'+'.xml';
  keyfile :=ARCH_KEY;
  password := PASS;   // CAUTION: DO NOT HARD-CODE REAL PASSWORDS!
	nchars := SAT_MakeSignatureFromXml(NIL, 0, fname, keyfile, password);
	if (nchars >= 0) then
    begin
      buf := AnsiString(StringOfChar(#0,nchars));
      nchars := SAT_MakeSignatureFromXml(Pointer(buf), nchars, fname, keyfile, password);
      firma_digi:= buf;
	 //	  WriteLn('SAT_MakeSignatureFromXml(' + string(fname) + ', ' + string(keyfile) + ')=' + CRLF + string(buf));
    end
	else
		disp_error(nchars);
  Assert(nchars > 0);

  fileSource := 'C:\ENVIAR\'+FNAME;
  fileDest := 'C:\SORIANA\'+FNAME;
  CopyFile(PChar(fileSource), PChar(fileDest), False);

  DELETEFILE(Folio_inicioe+'.xml')
end;}


procedure tform9.inc_fac;
begin

    if num_empresa.Text <> '01' then
      begin
        if num_empresa.Text = '04' then
          empresita := 'ZEFE';
      {  if num_empresa.text = '05' then
          empresita := 'GISE';
        if num_empresa.text = '06' then
          empresita := 'RAMIRO';  }

        qfolio.Close;
        qfolio.ParamByName('cajera').AsString:= empresita;
        qfolio.Open;

        qupdatefac.Close;
        qupdatefac.ParamByName('inicio').AsString:= inttostr(qfolio.FieldByName('folio_inicio').asinteger+1);
        qupdatefac.parambyname('cajera').AsString:= empresita;
        qupdatefac.execsql;

      end
      else
      begin
        qfolio.Close;
        qfolio.ParamByName('cajera').AsString:= form4.agente1;
        qfolio.Open;

       qupdatefac.Close;
       qupdatefac.ParamByName('inicio').AsString:= inttostr(qfolio.FieldByName('folio_inicio').asinteger+1);
       qupdatefac.parambyname('cajera').AsString:= form4.agente1;
       qupdatefac.execsql;

    end;










end;



procedure TForm9.orden_compraKeyPress(Sender: TObject; var Key: Char);
begin
      IF KEY =(#13) THEN
      BEGIN
    QCODIGOART.CLOSE;
    qcodigoart.ParamByName('NUM_EMP').AsString:= FORM9.NUM_EMPRESA.TEXT;
    qcodigoart.Open;
    CODIGOART.SETFOCUS;

    END;
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
      rpdefine.DataID:= inttostr(application.Handle);
      application.Initialize;


end;



//aqui va el proceso del correo

{procedure Tform9.Rastrear (Dir:string);
   var
      FileSearch:  TSearchRec;
   begin
     Screen.Cursor := crHourGlass;
     ChDir ( Dir );
     if FindFirst ( rfc+'*.*', faDirectory, FileSearch )=0 then
     repeat
       begin
         //Pon aqui lo que quieras hacer con los ficheros encontrados
         //Form1.Memo1.Lines.Add (FileSearch.Name);

         ARCHIVOS.Open;
         ARCHIVOS.AppendRecord([FILESEARCH.Name]);
         ARCHIVOS.Close;
       end;
     until FindNext( FileSearch ) <> 0;
     FindClose( FileSearch );
     Screen.Cursor := crDefault;
  end;     }


procedure TForm9.enviar_mail;
var
  caja, num_fac, cade, ruta_ori, ruta_des:string;
  nume: integer;


begin



  if seriee = 'B' then
      CAJA:='C3';

  if seriee ='C' then
       CAJA:='C1';

   if seriee ='D' then
        CAJA:='C2';

    if seriee ='G' then
         CAJA:='C4';



   {    ruta_ori:= 'z:\Program files\sci\edoccfdi\xmls\A_CLE8908119N6_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';
       ruta_des:= 'C:\enviaRCFDI\A_CLE8908119N6_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';
       //MoveFile(pchar(ruta_ori),pchar(ruta_des));
       copyFile(pchar(ruta_ori),pchar(ruta_des), true);

       ruta_ori:= 'z:\Program files\sci\edoccfdi\pdfs\A_CLE8908119N6_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';
       ruta_des:= 'C:\enviaRCFDI\A_CLE8908119N6_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';
       //MoveFile(pchar(ruta_ori),pchar(ruta_des));
       copyFile(pchar(ruta_ori),pchar(ruta_des), true); }


  //     StatusMemo.Clear;

       config.Close;
       config.open;



  //setup SMTP
  SMTP.Host := config.fieldbyname('host').AsString;
  SMTP.Port := config.fieldbyname('puerto').Asinteger;
  smtp.Username := 'clientes@colesa.com.mx';
  smtp.Password := 'colesacli22';

  //setup mail message
  MailMessage.From.Address := config.fieldbyname('correo').Asstring;

  if cod_cli = 'O14L' then
        MailMessage.Recipients.EMailAddresses :=  qcorreo.fieldbyname('email').asstring+
                                                  ',' + 'noraespinoza@colesa.com.mx'+','+
                                                  'factuxml@colesa.com.mx'
  else
          MailMessage.Recipients.EMailAddresses :=  qcorreo.fieldbyname('email').asstring+','+  qcorreo.fieldbyname('email2').asstring +
                                                ','+'factuxml@colesa.com.mx' +','+ qcorreo.fieldbyname('email3').asstring;

  MailMessage.Subject := 'FACTURAS ' ;
  MailMessage.Body.Text := 'ANEXO FACTURAS DE COMESTIBLES Y LEGUMBRES          '+caja;



   IF NUM_EMPRESA.TEXT ='04' THEN
   BEGIN

         TIdAttachment.Create(MailMessage.MessageParts, 'C:\enviaRCFDI\A_EIGZ6711088J4_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml');
         TIdAttachment.Create(MailMessage.MessageParts, 'C:\enviaRCFDI\A_EIGZ6711088J4_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF');


   END;

  IF NUM_EMPRESA.TEXT ='01' THEN
   BEGIN

    TIdAttachment.Create(MailMessage.MessageParts, 'C:\enviaRCFDI\A_CLE8908119N6_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml');
    TIdAttachment.Create(MailMessage.MessageParts, 'C:\enviaRCFDI\A_CLE8908119N6_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF');

   END;


  {  IF NUM_EMPRESA.TEXT ='05' THEN
   BEGIN

    TIdAttachment.Create(MailMessage.MessageParts, 'C:\enviaRCFDI\A_EIBG940128R27_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml');
    TIdAttachment.Create(MailMessage.MessageParts, 'C:\enviaRCFDI\A_EIBG940128R27_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF');

   END;

    IF NUM_EMPRESA.TEXT ='06' THEN
   BEGIN

    TIdAttachment.Create(MailMessage.MessageParts, 'C:\enviaRCFDI\A_EIBR9412284L7_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml');
    TIdAttachment.Create(MailMessage.MessageParts, 'C:\enviaRCFDI\A_EIBR9412284L7_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF');

   END;  }


  //send mail
  try
    try
      SMTP.Connect(1000);
      SMTP.Send(MailMessage);
    except on E:Exception do
      StatusMemo.Lines.Insert(0, 'ERROR: ' + E.Message);
    end;
  finally
    if SMTP.Connected then SMTP.Disconnect;
  end;




  qborrar.close;
  qborrar.execsql;

  statusmemo.Text:= '';



mailmessage.Clear;

showmessage('CORREO ENVIADO');



end; (* btnSendMail Click *)



procedure Tform9.SMTPStatus(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: String);
begin
  StatusMemo.Lines.Insert(0,'Status: ' + AStatusText);
end; (* SMTP Status *)




procedure tform9.cfditxt;
var
    NUM_CORRE, tot_ieps22, descuentin, totimptras, UNI_SAT, COND_PAGO, tasa1, impues1, tasa, impues, base, METODO_PAGO, DESCTOFIN, CLIENTE_NOM, DESCRIPCION, ruta_ori, ruta_des,canti_ven, pago_tipo, tipo_pago2, banco, digitos, unidad, precio_tot, total_tot, canti_tot, subtotal_fin, total_fin,  tfecha1,  CONCE_FECHA: STRING;
    siceros, DES_YES, si_entro, si_iva,  linea : integer;
begin
 {   qsacainfo.close;
    qsacainfo.ParamByName('num_doc').AsString :=  factu.Text;
    qsacainfo.open;  }
    si_entro := 0;
    si_iva := 0;
    canti_ven := '0';
    siceros := 0;
     TFECHA1:= DATETOSTR(fechavientos.Date);

     NUM_CORRE := '0';

       tmpdia:= copy(tfecha1,1,2);
       tmpmes:= copy(tfecha1,4,2);
       tmpano:= copy(tfecha1,7,4);

     ShortDateFormat := 'dd/mm/yyyy';
    SHORTtimeformat:= 'HH:mm:ss';

     horafinal:= timetostr(time);


     CONCE_FECHA := TMPANO+'-'+TMPMES+'-'+TMPDIA+'T'+HORAFINAL;
     CONCE_FECHA:= copy(CONCE_FECHA, 1, 19);

      // aqui busco el tipo de pago para agregarlo en el archivo txt
      //esto de abajo ya no se hace ya que se revisa antes del pago...


  {    qtipo_pago.Close;
     qtipo_pago.ParamByName('cod_cli').AsString := cod_cli;
     qtipo_pago.Open;


     if qtipo_pago.FieldByName('tipo_pago').AsString = '' then
     begin

          showmessage('Revisa el tipo de pago del cliente');
          exit;


     end;   }


   {  if qtipo_pago.FieldByName('tipo_pago').AsString = 'No Identificado' then
     begin
        //  tipo_pago:= 'No Identificado';
            tipo_pago:= '99';
          banco :=   '';
          digitos := '';

     end; }


     if tipo_pago.ItemIndex = 0 then
     begin
          tipo_pago2:= '99';
          cond_pago := 'CREDITO';
     end
     else
     begin

     cond_pago := 'CONTADO';

     if strtofloat(transf.text) <> 0 then
     begin
       //   tipo_pago:= 'Transferencia';
         tipo_pago2:= '03';
     //     banco :=   qtipo_pago.FieldByName('banco').AsString;
     //     digitos := qtipo_pago.FieldByName('num_cta').AsString;

     end;

 if strtofloat(efectivo.text) <> 0 then
     begin
         // tipo_pago:= 'Efectivo';
           tipo_pago2:= '01';
       //   banco := '';
       //   digitos := ''

     end;



{ if qtipo_pago.FieldByName('tipo_pago').AsString = 'Otros' then
     begin
         // tipo_pago:= 'Efectivo';
           tipo_pago:= '99';
          banco := '';
          digitos := ''

     end;}

 {  if qtipo_pago.FieldByName('tipo_pago').AsString = 'Credito' then
     begin
     //     tipo_pago:= 'Credito';
       tipo_pago:= '98';
          banco := 'No Identificado';
          digitos :=  '';

     end;}

     if strtofloat(cheque.text) <> 0 then
     begin
        //  tipo_pago:= 'Cheque';
          tipo_pago2:= '02';
 //         banco := qtipo_pago.FieldByName('banco').AsString;
 //         digitos :=  qtipo_pago.FieldByName('num_cta').AsString;

     end;



       if strtofloat(cheqpref.text) <> 0 then
     begin
       //   tipo_pago:= 'T. de Credito';
         tipo_pago2:= '04';
       //   banco :=  qtipo_pago.FieldByName('banco').AsString;
       //   digitos := qtipo_pago.FieldByName('num_cta').AsString;

     end;


      if strtofloat(tdebito.text) <> 0 then
     begin
          //tipo_pago:= 'T. de Debito';
            tipo_pago2:= '28';
       //   banco :=  qtipo_pago.FieldByName('banco').AsString;
       //   digitos := qtipo_pago.FieldByName('num_cta').AsString;

     end;

   end;


     //aqui asigno el banco y los digitos
     pago_tipo := tipo_pago2 + ' '+banco  ;
     if tipo_pago2 <> '01' then
     begin
     banco:=  dbbanco.Text;
     digitos:= nocheque.Text;
     end;


     //asigno el metodo de pago


     if tipo_pago.itemindex = 0 then
            metodo_pago:= 'PPD'
         ELSE
            metodo_pago:= 'PUE';

     //ASIGNAR EL IMPUESTO


        impues := '002';
        tasa := '0.16';


       impues1 := '003';
       tasa1:= '0.08';



                   DESCRIPCION := '';


                  //  fac:= qsacainfo.fieldbyname('num_doc_1').asstring;


                         if (COD_CLI ='S235L') THEN
                              FACTUROTA := SORI.remi
                             ELSE
                              FACTUROTA := FACTU.Text;



                         IF  ((COD_CLI ='D215L') OR (COD_CLI ='D81L')) then
                                 FACTUROTA := form19.remi
                             ELSE
                              FACTUROTA := FACTU.Text;

                  fac:= facturota;

                  //voy a poner en inarfac el ieps y lo hago aqui despues de agregar la factura en inarfac y donde tengo el ieps...


                  if ieps.Text <> '0.00' then
                  begin

                   tot_ieps22 := floattostrf((strtofloat(ieps.text)/0.08), ffnumber,10,6);
                   tot_ieps22:= stripped(',', tot_ieps22);


                   upfacieps.close;
                   upfacieps.parambyname('num_doc').asstring := fac;
                   upfacieps.parambyname('ieps').asstring := ieps.text;
                   upfacieps.parambyname('totieps').asstring := tot_ieps22;
                   upfacieps.parambyname('num_emp').asstring := num_empresa.text;
                   upfacieps.execsql;


                   iepstrcl.open;
                   iepstrcl.appendrecord([num_empresa.text, fac, ieps.Text, ieps.text]);
                   iepstrcl.close;

                   //Y EN INARTRCL TAMBIEN TENGO QUE AGREGAR EN EL TOTAL EL IEPS...

                    qtotieps.Close;
                    qtotieps.ParamByName('importe').AsString :=  edit1.text;
                    qtotieps.ParamByName('num_doc').AsString :=  fac;
                    qtotieps.ParamByName('num_emp').AsString :=  num_empresa.text;
                    qtotieps.ExecSQL;



                  end;



                   if (metodo_pago = 'PUE') AND (TIPO_PAGO2 = '99') THEN
                       BEGIN

                            TIMBRAR.OPEN;
                            timbrar.appendrecord([num_empresa.text, fac, 'PUE']);
                            timbrar.close;
                      END;



                   IF metodo_pago = 'PPD'  THEN
                      BEGIN

                            TIMBRAR.OPEN;
                            timbrar.appendrecord([num_empresa.text, fac, 'PPD']);
                            timbrar.close;

                      END;




             {       CHDIR('C:\GENECFDI\');
                    AssignFile(fac_ele1,'UNIF_'+'PIPE'+ '_FACT_'+fac+'.BAN');
                    REWRITE(fac_ele1);
                    CLOSEFILE (FAC_ELE1);  }

                    CHDIR('C:\GENECFDI\');
                    AssignFile(fac_ele,'UNIF_'+'PIPE'+ '_FACT_'+fac+'.TXT');
                    REWRITE(fac_ele);

                    seriee := copy(FAC,1,1);
                    folio_inicioe := copy(FAC,2,length(FAC)-1);

                    //SUBTOTAL_FIN := floattostrf((qsacainfo.fieldbyname('imp_exe').asfloat + qsacainfo.fieldbyname('imp_15').asfloat), ffnumber,10,6);
                    subtotal_fin := edit9.Text;
                    total_fin := edit1.text;
                    //total_fin := floattostrf((qsacainfo.fieldbyname('imp_exe').asfloat + qsacainfo.fieldbyname('imp_15').asfloat +  qsacainfo.fieldbyname('iva_15').asfloat), ffnumber, 10,6);


                           subtotal_Fin:= stripped(',', subtotal_fin);
                           total_fin:= stripped(',', total_fin);


                           IF (FLOATTOSTR(ACUDES) <> '') OR (FLOATTOSTR(ACUDES) <> '0') THEN
                                  DESCTOFIN := FLOATTOSTRF(ACUDES, FFNUMBER,10,6)
                                 ELSE
                                  DESCTOFIN := '';


                                  DESCTOFIN:= stripped(',', DESCTOFIN);


                      //si el descuento es cero se pone en blanco
                   if desctofin = '' then
                          desctofin := '0.00';



                   //VOY A SACAR EL SUBTOTAL Y EL TOTAL

                    TOTAL_FIN:= '0';
                    SUBTOTAL_FIN := '0';
                    IVATOTAL4 :=0;
                    IMP_EXE4 :=0;
                    TOTAL_TOT := '0';




                  //      if (EDIT3.text = '0') OR  (EDIT3.text = '') then
                            num_corre :=   TFOLIO.TEXT;
                   //     else
                   //         num_corre :=  EDIT3.TEXT;



                       qventas.Close;
                      qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                       qventas.ParamByName('folio').AsString:= NUM_CORRE;
                       qventas.Open;



                   WHILE NOT qventas.Eof DO
                    BEGIN

				                     IF qventas.FIELDBYNAME('kilos').asfloat = 0 then
                                begin
                                      UNIDAD := 'CAJAS';
                                      CANTI_TOT := QVENTAS.FIELDBYNAME('CAJAS').AsString;

                                      if canti_tot = '0' then
                                             CANTI_TOT := QVENTAS.FIELDBYNAME('KILOS').AsString;

                                      IF QVENTAS.FIELDBYNAME('IVA').AsString = '0' THEN
                                      BEGIN

                                      precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;

                                      TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                      END
                                      ELSE
                                      BEGIN
                                 
                                       precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                       TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                         si_iva := 1;

                                     END;

                                     If qvtasieps.FieldByName('totieps').asstring = '' then
                                   
                                    BEGIN
                                  

                                      precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;

                                      TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);

                                   END;

                                end
                                else
                                begin
                                      UNIDAD := 'KILOS';
                                      CANTI_TOT := QVENTAS.FIELDBYNAME('KILOS').AsString;

                                      if canti_tot = '0' then
                                               CANTI_TOT := QVENTAS.FIELDBYNAME('CAJAS').AsString;





                                      IF QVENTAS.FIELDBYNAME('IVA').AsString = '0' THEN
                                      BEGIN


                                            precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;

                                            IF (COD_CLI ='O14L') AND (QVENTAS.FIELDBYNAME('CODIGO').AsString = 'C401EC')  THEN
                                              BEGIN
                                                 TOTAL_TOT := QVENTAS.FIELDBYNAME('TOTAL').AsString;
                                              END
                                              ELSE
                                                 TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);




                                      END
                                      ELSE
                                      begin



                                              precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                              TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                              si_iva := 1;
                                      end;

                                      If (qvtasieps.FieldByName('totieps').asstring <> '') and (si_iva = 0)  then
                                      BEGIN

                                        precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;

                                        TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                     END;
                                end;


                             IF EDIT3.Text <> '' THEN
                             BEGIN
                                  IF ROUND(STRTOFLOAT(TOTAL_TOT)) <> ROUND(qventas.FIELDBYNAME('TOTAL').asFLOAT) THEN
                                      BEGIN
                                           CANTI_TOT :=  FLOATTOSTRF(qventas.FIELDBYNAME('TOTAL').asFLOAT / qventas.FIELDBYNAME('PRECIO').asFLOAT, FFFIXED, 10,2);

                                           IF ROUND(STRTOFLOAT(CANTI_TOT)) =   ROUND(qventas.FIELDBYNAME('CAJAS').asFLOAT) THEN
                                             BEGIN

                                                  UNIDAD := 'CAJAS';
                                                  CANTI_TOT := QVENTAS.FIELDBYNAME('CAJAS').AsString;
                                                  PRECIO_TOT :=QVENTAS.FIELDBYNAME('PRECIO').AsString;
                                                  TOTAL_TOT := QVENTAS.FIELDBYNAME('TOTAL').AsString;
                                             END
                                             ELSE
                                             BEGIN

                                                  UNIDAD := 'KILOS';
                                                  CANTI_TOT := QVENTAS.FIELDBYNAME('KILOS').AsString;
                                                  PRECIO_TOT :=QVENTAS.FIELDBYNAME('PRECIO').AsString;
                                                  TOTAL_TOT := QVENTAS.FIELDBYNAME('TOTAL').AsString;


                                             END;



                                      END;

                             END;





                             IF (COD_CLI ='O14L') AND ((qventas.FIELDBYNAME('codigo').asstring ='CHTAJINC') OR (qventas.FIELDBYNAME('codigo').asstring ='C401EC'))
                              THEN
                               BEGIN
                                      UNIDAD := 'CAJAS';
                                      CANTI_TOT := QVENTAS.FIELDBYNAME('CAJAS').AsString;

                                      if canti_tot = '0' then
                                             CANTI_TOT := QVENTAS.FIELDBYNAME('KILOS').AsString;


                                      IF QVENTAS.FIELDBYNAME('IVA').AsString = '0' THEN
                                      BEGIN

                                      precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                      TOTAL_TOT := QVENTAS.FIELDBYNAME('TOTAL').AsString;
                                      //TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                      END
                                      ELSE
                                      BEGIN

                                      precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                      TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                       si_iva := 1;
                                     END;

                                     If qvtasieps.FieldByName('totieps').asstring = '' then

                                    BEGIN
                                      precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                      TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                   END;
                                END;

                               IF (COD_CLI ='O14L') AND ((qventas.FIELDBYNAME('codigo').asstring ='A15PB') OR (qventas.FIELDBYNAME('codigo').asstring ='A15P') OR (qventas.FIELDBYNAME('codigo').asstring ='A15PC')) THEN
                                   begin
                                      UNIDAD := 'PZAS';
                                      CANTI_TOT := QVENTAS.FIELDBYNAME('KILOS').AsString;

                                       if canti_tot = '0' then
                                               CANTI_TOT := QVENTAS.FIELDBYNAME('CAJAS').AsString;

                                      IF QVENTAS.FIELDBYNAME('IVA').AsString = '0' THEN
                                      BEGIN

                                       precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                       TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                      END
                                      ELSE
                                      begin
                                       precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                       TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                      si_iva := 1;
                                      end;

                                      If (qvtasieps.FieldByName('totieps').asstring <> '') and (si_iva = 0)  then
                                      BEGIN

                                     precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                     TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                     END;
                                end;






                             If qventas.FieldByName('totiva').asstring <> '0' then
                          begin

                              IVATOTAL4 := IVATOTAL4 + qventas.FieldByName('totiva').asFLOAT;
                       //       BASE_TOT:=    BASE_TOT   + STRTOFLOAT(BASE);

                          END
                          ELSE
                          BEGIN

                              IMP_EXE4 := IMP_EXE4 + STRTOFLOAT(TOTAL_TOT);
                          END;


	            SUBTOTAL_FIN := FLOATTOSTRF(STRTOFLOAT(SUBTOTAL_FIN) + STRTOFLOAT(TOTAL_TOT), FFFIXED,10,6);



             QVENTAS.Next;


			END;

       total_fin :=   floattostrf(strtofloat(subtotal_fin) + ivatotal4, fffixed, 10,6);



          IF (FLOATTOSTR(ACUDES) <> '') OR (FLOATTOSTR(ACUDES) <> '0') THEN
                                  DESCTOFIN := FLOATTOSTRF(ACUDES, FFNUMBER,10,6)
                                 ELSE
                                  DESCTOFIN := '';


                                  DESCTOFIN:= stripped(',', DESCTOFIN);


                      //si el descuento es cero se pone en blanco
                   if desctofin = '' then
                          desctofin := '0.00';




                   // aqui voy a diferenciar si es una u otra empresa

               {    if  (cod_cli = 'M14L') or (cod_cli = 'P77F') OR
                   (cod_cli = 'F106F') or (cod_cli = 'R23F') or (cod_cli = 'C66L')   }
                   IF (COD_CLI='C66L') OR (cod_cli ='E67L') then
                   begin


                     SUBTOTAL_FIN := FLOATTOSTRF(STRTOFLOAT(SUBTOTAL_FIN),FFFIXED,10,6);
                     TOTAL_FIN:= FLOATTOSTRF(STRTOFLOAT(TOTAL_FIN)- STRTOFLOAT(DESCTOFIN),FFFIXED,10,6);
                     DESCTOFIN := FLOATTOSTRF(STRTOFLOAT(DESCTOFIN),FFFIXED,10,6);

                     IF DESCTOFIN = '' THEN
                     DESCTOFIN := '0';

                    WRITELN(FAC_ELE,  'COMPROBANTE'+'|'+SERIEE+'|'+'4.0'+'|'+tipo_pago2+ '|'+ COND_PAGO+
                                      '|'+ SUBTOTAL_FIN + '|'+ DESCTOFIN + '|' + total_fin + '|'+ metodo_pago +'|'+
                                      '|' + 'MXN'+'|'+folio_inicioe+ '|'+ conce_fecha+'|'+'31384'+'|'+'|'+'01'+'|'+'|'+'|');


                    WRITELN(FAC_ELE, 'EMISOR|EIBR9412284L7|RAMIRO ESPINOZA BARFFUSON|C. 44 Y SIERRA DE ALMOLOYA|SN||AEROPUERTO|||CHIHUAHUA|CHIHUAHUA|MEXICO|31384|621');

                  //  WRITELN(FAC_ELE, 'REGIMEN|1|621');

                    end;


                  IF  (cod_cli ='C44L')
                     THEN
                      BEGIN

                         SUBTOTAL_FIN := FLOATTOSTRF(STRTOFLOAT(SUBTOTAL_FIN),FFFIXED,10,6);
                      TOTAL_FIN:= FLOATTOSTRF(STRTOFLOAT(TOTAL_FIN)- STRTOFLOAT(DESCTOFIN),FFFIXED,10,6);
                     DESCTOFIN := FLOATTOSTRF(STRTOFLOAT(DESCTOFIN),FFFIXED,10,6);

                    WRITELN(FAC_ELE,  'COMPROBANTE'+'|'+SERIEE+'|'+'4.0'+'|'+tipo_pago2+ '|'+ COND_PAGO+
                                      '|'+ SUBTOTAL_FIN + '|'+ DESCTOFIN + '|' + total_fin + '|'+ metodo_pago +'|'+
                                      '|' + 'MXN'+'|'+folio_inicioe+ '|'+ conce_fecha+'|'+'31384'+'|'+'|'+'01'+'|'+'|'+'|');


                  WRITELN(FAC_ELE, 'EMISOR|LNE111123HW3|LEGUMBRES NEZE|BLVD J. PABLO II CENTRAL DE ABASTOS CBE|4701|B21|AEROPUERTO|||CHIHUAHUA|CHIHUAHUA|MEXICO|31384|601');



                  END;

                  //OR (cod_cli ='C44L')
                  IF ((cod_cli = 'D11F') OR (cod_cli = 'F55F') or (cod_cli = 'F300F') OR  (cod_cli = 'E77L')  OR (cod_cli = 'G92F') OR  (cod_cli = 'P92F') OR
                       (cod_cli = 'S29F') OR (cod_cli = 'T29F')  or (cod_cli = 'S356F')   OR (cod_cli = 'G307F') OR (cod_cli = 'R23F') OR  (cod_cli = 'Z4F')  OR  (entra_azu = 1)   or  (COD_CLI='E941L') OR
                       (cod_cli = 'M102F') OR (cod_cli = 'C1F') or (cod_cli = 'C01F') OR (cod_cli = 'D3L') OR (cod_cli = 'S369L') OR (cod_cli = 'C160L') OR (COD_CLI='V199F') OR (COD_CLI='V9F') OR (COD_CLI ='V105L' ))
                        AND  (NUM_EMPRESA.TEXT = '04')
                     then
                   begin


                  {  WRITELN(FAC_ELE,  'COMPROBANTE'+'|'+SERIEE+'|'+'3.3'+'|'+tipo_pago2+ '|'+ COND_PAGO+
                                      '|'+ SUBTOTAL_FIN + '|'+ DESCTOFIN + '|' + total_fin + '|'+ metodo_pago +'|'+'1'+
                                      '|' + 'MXN'+'|'+folio_inicioe+ '|'+ conce_fecha+'|'+'31384'+'|');}

                    SUBTOTAL_FIN := FLOATTOSTRF(STRTOFLOAT(SUBTOTAL_FIN),FFFIXED,10,6);
                      TOTAL_FIN:= FLOATTOSTRF(STRTOFLOAT(TOTAL_FIN)- STRTOFLOAT(DESCTOFIN),FFFIXED,10,6);
                     DESCTOFIN := FLOATTOSTRF(STRTOFLOAT(DESCTOFIN),FFFIXED,10,6);

                    WRITELN(FAC_ELE,  'COMPROBANTE'+'|'+SERIEE+'|'+'4.0'+'|'+tipo_pago2+ '|'+ COND_PAGO+
                                      '|'+ SUBTOTAL_FIN + '|'+ DESCTOFIN + '|' + total_fin + '|'+ metodo_pago +'|'+
                                      '|' + 'MXN'+'|'+folio_inicioe+ '|'+ conce_fecha+'|'+'31384'+'|'+'|'+'01'+'|'+'|'+'|');


                    WRITELN(FAC_ELE, 'EMISOR|EIGZ6711088J4|ZEFERINO ESPINOZA GOMEZ|BLVD J. PABLO II CENTRAL DE ABASTOS CAA|4701|B22|AEROPUERTO|||CHIHUAHUA|CHIHUAHUA|MEXICO|31384|612');

               //     WRITELN(FAC_ELE, 'REGIMEN|1|612');

                    end;

//      CAMBIAR CON FUTU if (cod_cli <> 'F55F') AND (cod_cli <> 'G210F') AND (cod_cli <> 'L78L') AND (cod_cli <> 'M14L') AND (cod_cli <> 'P77F') AND (cod_cli <> 'R456L') AND (cod_cli <> 'S356F') AND (cod_cli <> 'T29F') AND (cod_cli <> 'D11F') AND (cod_cli <> 'O14L') then
                    if (cod_cli <> 'D11F') AND (cod_cli <> 'G92F') AND (cod_cli <> 'P92F')
                    AND (cod_cli <> 'F55F') AND (cod_cli <> 'F300F') AND (cod_cli <> 'C66L')
                     AND (cod_cli <> 'M102F') AND (cod_cli <> 'C1F') AND (cod_cli <> 'C01F')   AND (cod_cli <> 'S356F')   and (entra_azu <> 1)
                    AND (cod_cli <> 'D3L') AND (cod_cli <> 'C44L') AND (COD_CLI <> 'E67L') AND (COD_CLI <> 'E77L')  AND (cod_cli <> 'V199F') AND (COD_CLI <> 'V9F') AND (COD_CLI <> 'V105L') AND (COD_CLI <> 'E941L')
                    AND (NUM_EMPRESA.TEXT ='01')then
                     begin


                     {   WRITELN(FAC_ELE,  'COMPROBANTE'+'|'+SERIEE+'|'+'3.3'+'|'+tipo_pago2+ '|'+ COND_PAGO +
                                      '|'+ SUBTOTAL_FIN + '|'+ DESCTOFIN + '|' + total_fin + '|'+ metodo_pago +'|'+'1'+
                                      '|' + 'MXN'+'|'+folio_inicioe+ '|'+ conce_fecha+'|'+'31384'+'|');}

                     SUBTOTAL_FIN := FLOATTOSTRF(STRTOFLOAT(SUBTOTAL_FIN),FFFIXED,10,6);
                       TOTAL_FIN:= FLOATTOSTRF(STRTOFLOAT(TOTAL_FIN)- STRTOFLOAT(DESCTOFIN),FFFIXED,10,6);
                     DESCTOFIN := FLOATTOSTRF(STRTOFLOAT(DESCTOFIN),FFFIXED,10,6);


                        WRITELN(FAC_ELE,  'COMPROBANTE'+'|'+SERIEE+'|'+'4.0'+'|'+tipo_pago2+ '|'+ COND_PAGO+
                                      '|'+ SUBTOTAL_FIN + '|'+ DESCTOFIN + '|' + total_fin + '|'+ metodo_pago +'|'+
                                      '|' + 'MXN'+'|'+folio_inicioe+ '|'+ conce_fecha+'|'+'31384'+'|'+'|'+'01'+'|'+'|'+'|');


                        WRITELN(FAC_ELE, 'EMISOR|CLE8908119N6|COMESTIBLES Y LEGUMBRES |BLVD J. PABLO II C DE ABASTOS CAA|4701|B26|AEROPUERTO|||CHIHUAHUA|CHIHUAHUA|MEXICO|31384|601');

                   //     WRITELN(FAC_ELE, 'REGIMEN|1|601');

                     end;



               //     WRITELN(FAC_ELE, 'EMI_EXP_EN|||||||CHIHUAHUA|CHIHUAHUA|MEXICO|31384');

                    if (trfc.Text = 'XAXX010101000')  THEN
                       BEGIN
                        //  CLIENTE_NOM := 'VENTAS AL PUBLICO EN GENERAL' ;
                           CLIENTE_NOM := NOM_CLI +'   '+COD_CLI;

                          WRITELN(FAC_ELE, 'RECEPTOR|'+ trfc.text +'|'+ CLIENTE_NOM  +'|' + 'SIN NOMBRE' + '|' + 'SN' +'|'+
                          'SN' +'|'+ 'SIN COLONIA' +'|' +'|'  + '|' +
                          CIU_CLI +'|'+ EST_CLI +'|MEXICO|'+ '31384'+'|'+'|'+ '|'+'S01' + '|' + '616' )
                       END
                     ELSE
                     BEGIN
                        CLIENTE_NOM := NOM_CLI  ;
                        WRITELN(FAC_ELE, 'RECEPTOR|'+ trfc.text +'|'+ CLIENTE_NOM +'|' + qdeta.fieldbyname('calle').asstring + '|' + qdeta.fieldbyname('num_ext').asstring +'|'+
                        qdeta.fieldbyname('num_int').asstring+'|'+ qdeta.fieldbyname('colonia').asstring +'|' + '|' + COD_CLI + '|'+   qdeta.fieldbyname('municipio').asstring + '|'
                        + EST_CLI +'|MEXICO|'+ COD_POS+'|'+'|'+'|'+cod_uso + '|' + regimen_cli );
                    END;

                   // WRITELN(FAC_ELE, 'RECEPTOR|CLE8908119N6|COMESTIBLES Y LEGUMBRES SA DE CV|BLVD J. PABLO II CENTRAL DE ABASTOS CAA|4701|B26|AEROPUERTO|CHIHUAHUA||CHIHUAHUA|CHIHUAHUA|MEXICO|31384') ;

                //      WRITELN(FAC_ELE, 'REC_LOC_ENV|||||'+qdeta.fieldbyname('colonia').asstring+'|||||MEXICO|'+ COD_POS +'|');
                 //     writeln(fac_ele, 'ETIQUETAPLANTILLA|SUCURSAL|'+ csucursal.text);

                   //  WRITELN(FAC_ELE, 'REC_LOC_ENV|||||AEROPUERTO|||||MEXICO|31384|');


                    TOTAL_FIN:= '0';
                    SUBTOTAL_FIN := '0';
                    IVATOTAL4 :=0;
                    IMP_EXE4 :=0;
                    TOTAL_TOT := '0';




                       qventas.Close;
                      qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                       qventas.ParamByName('folio').AsString:= NUM_CORRE;
                       qventas.Open;






                    LINEA:= 0;
                    canti_tot:= '0';

                    WHILE NOT qventas.Eof DO
                    BEGIN


                         qvtasieps.Close;
                         QVTASIEPS.PARAMBYNAME('RENglon').ASINTEGER := QVENTAS.FIELDBYNAME('RENGLON').ASINTEGER;
                         qvtasieps.ParamByName('folio').AsString:= tfolio.Text;
                         qvtasieps.Open;

                         QCANEMP.Close;
                         qCANEMP.ParamByName('num_emp').asstring:= num_empresa.Text;
                         qCANEMP.ParamByName('COD_ART').AsString:= QVENTAS.FIELDBYNAME('CODIGO').ASstring;
                         qCANEMP.Open;


                          qbusat.close;
                          qbusat.parambyname('cod_colesa').asstring := qventas.FIELDBYNAME('codigo').asstring;
                          qbusat.open;

                          cod_sat:= qbusat.fieldbyname('cod_sat').asstring;






                          IF qventas.FIELDBYNAME('kilos').asfloat = 0 then
                                begin
                                      UNIDAD := 'CAJAS';
                                      CANTI_TOT := QVENTAS.FIELDBYNAME('CAJAS').AsString;

                                      if canti_tot = '0' then
                                             CANTI_TOT := QVENTAS.FIELDBYNAME('KILOS').AsString;

                                      IF QVENTAS.FIELDBYNAME('IVA').AsString = '0' THEN
                                      BEGIN

                                      precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                      TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);

                                      END
                                      ELSE
                                      BEGIN
                                    // PRECIO_TOT := FLOATTOSTRF(QVENTAS.FIELDBYNAME('precio').AsFLOAT / (1+ 16/100), FFNUMBER,10,6);
                                    // TOTAL_TOT:= FLOATTOSTRF(QVENTAS.FIELDBYNAME('TOTAL').AsFLOAT - QVENTAS.FIELDBYNAME('TOTIVA').AsFLOAT , FFNUMBER,10,6);

                                       precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                       TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                        si_iva := 1;
                                     END;

                                     If qvtasieps.FieldByName('totieps').asstring = '' then
                                   //   precio_tot := QVENTAS.FIELDBYNAME('precio').AsString
                                    //  ELSE
                                    BEGIN
                                  // PRECIO_TOT := FLOATTOSTRF(QVENTAS.FIELDBYNAME('precio').AsFLOAT / (1+ 8/100), FFNUMBER,10,6);
                                  // TOTAL_TOT :=  FLOATTOSTRF(QVENTAS.FIELDBYNAME('TOTAL').AsFLOAT - qvtasieps.FieldByName('totieps').asFLOAT , FFNUMBER,10,6);

                                      precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                      TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);

                                   END;

                                end
                                else
                                begin
                                      UNIDAD := 'KILOS';
                                      CANTI_TOT := QVENTAS.FIELDBYNAME('KILOS').AsString;

                                      if canti_tot = '0' then
                                               CANTI_TOT := QVENTAS.FIELDBYNAME('CAJAS').AsString;

                                      IF QVENTAS.FIELDBYNAME('IVA').AsString = '0' THEN
                                      BEGIN

                                      precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                      TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);

                                      END
                                      ELSE
                                      begin
                                    // PRECIO_TOT := FLOATTOSTRF(QVENTAS.FIELDBYNAME('precio').AsFLOAT / (1+ 16/100), FFNUMBER,10,6);
                                    // TOTAL_TOT := FLOATTOSTRF(QVENTAS.FIELDBYNAME('TOTAL').AsFLOAT - QVENTAS.FIELDBYNAME('TOTIVA').AsFLOAT , FFNUMBER,10,6);

                                     precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                     TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                      si_iva := 1;
                                      end;

                                      If (qvtasieps.FieldByName('totieps').asstring <> '') and (si_iva = 0)  then
//                                      precio_tot := QVENTAS.FIELDBYNAME('precio').AsString
//                                      ELSE
                                      BEGIN
                                   //  PRECIO_TOT := FLOATTOSTRF(QVENTAS.FIELDBYNAME('precio').AsFLOAT / (1+ 8/100), FFNUMBER,10,6);
                                   //  TOTAL_TOT :=  FLOATTOSTRF(QVENTAS.FIELDBYNAME('TOTAL').AsFLOAT - qvtasieps.FieldByName('totieps').asFLOAT , FFNUMBER,10,6);

                                     precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                     TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                     END;
                                end;



                             IF EDIT3.Text <> '' THEN
                             BEGIN
                                  IF ROUND(STRTOFLOAT(TOTAL_TOT)) <> ROUND(qventas.FIELDBYNAME('TOTAL').asFLOAT) THEN
                                      BEGIN
                                           CANTI_TOT :=  FLOATTOSTRF(qventas.FIELDBYNAME('TOTAL').asFLOAT / qventas.FIELDBYNAME('PRECIO').asFLOAT, FFFIXED, 10,2);

                                          IF ROUND(STRTOFLOAT(CANTI_TOT)) =   ROUND(qventas.FIELDBYNAME('CAJAS').asFLOAT) THEN
                                             BEGIN

                                                  UNIDAD := 'CAJAS';
                                                  CANTI_TOT := QVENTAS.FIELDBYNAME('CAJAS').AsString;
                                                  PRECIO_TOT :=QVENTAS.FIELDBYNAME('PRECIO').AsString;
                                                  TOTAL_TOT := QVENTAS.FIELDBYNAME('TOTAL').AsString;
                                             END
                                             ELSE
                                             BEGIN

                                                  UNIDAD := 'KILOS';
                                                  CANTI_TOT := QVENTAS.FIELDBYNAME('KILOS').AsString;
                                                  PRECIO_TOT :=QVENTAS.FIELDBYNAME('PRECIO').AsString;
                                                  TOTAL_TOT := QVENTAS.FIELDBYNAME('TOTAL').AsString;


                                             END;



                                      END;

                             END;





                             IF (COD_CLI ='O14L') AND ((qventas.FIELDBYNAME('codigo').asstring ='CHTAJINC') OR (qventas.FIELDBYNAME('codigo').asstring ='C401EC'))
                              THEN
                               BEGIN
                                   UNIDAD := 'CAJAS';
                                      CANTI_TOT := QVENTAS.FIELDBYNAME('CAJAS').AsString;

                                      if canti_tot = '0' then
                                             CANTI_TOT := QVENTAS.FIELDBYNAME('KILOS').AsString;


                                      IF QVENTAS.FIELDBYNAME('IVA').AsString = '0' THEN
                                      BEGIN

                                      precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                      TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                      END
                                      ELSE
                                      BEGIN
                                    // PRECIO_TOT := FLOATTOSTRF(QVENTAS.FIELDBYNAME('precio').AsFLOAT / (1+ 16/100), FFNUMBER,10,6);
                                    // TOTAL_TOT:= FLOATTOSTRF(QVENTAS.FIELDBYNAME('TOTAL').AsFLOAT - QVENTAS.FIELDBYNAME('TOTIVA').AsFLOAT , FFNUMBER,10,6);

                                      precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                      TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                      si_iva := 1;
                                     END;

                                     If qvtasieps.FieldByName('totieps').asstring = '' then
                                   //   precio_tot := QVENTAS.FIELDBYNAME('precio').AsString
                                    //  ELSE
                                    BEGIN
                                  // PRECIO_TOT := FLOATTOSTRF(QVENTAS.FIELDBYNAME('precio').AsFLOAT / (1+ 8/100), FFNUMBER,10,6);
                                  // TOTAL_TOT :=  FLOATTOSTRF(QVENTAS.FIELDBYNAME('TOTAL').AsFLOAT - qvtasieps.FieldByName('totieps').asFLOAT , FFNUMBER,10,6);

                                      precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                      TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                   END;
                                END;

                               IF (COD_CLI ='O14L') AND ((qventas.FIELDBYNAME('codigo').asstring ='A15PB') OR (qventas.FIELDBYNAME('codigo').asstring ='A15P') OR (qventas.FIELDBYNAME('codigo').asstring ='A15PC')
                                                         OR (qventas.FIELDBYNAME('codigo').asstring ='F680E')OR (qventas.FIELDBYNAME('codigo').asstring ='C401EC100')) THEN
                                   begin
                                      UNIDAD := 'PZAS';
                                      CANTI_TOT := QVENTAS.FIELDBYNAME('KILOS').AsString;

                                       if canti_tot = '0' then
                                               CANTI_TOT := QVENTAS.FIELDBYNAME('CAJAS').AsString;

                                      IF QVENTAS.FIELDBYNAME('IVA').AsString = '0' THEN
                                      BEGIN

                                       precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                       TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                      END
                                      ELSE
                                      begin
                                    // PRECIO_TOT := FLOATTOSTRF(QVENTAS.FIELDBYNAME('precio').AsFLOAT / (1+ 16/100), FFNUMBER,10,6);
                                    // TOTAL_TOT := FLOATTOSTRF(QVENTAS.FIELDBYNAME('TOTAL').AsFLOAT - QVENTAS.FIELDBYNAME('TOTIVA').AsFLOAT , FFNUMBER,10,6);

                                       precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                       TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                      si_iva := 1;
                                      end;

                                      If (qvtasieps.FieldByName('totieps').asstring <> '') and (si_iva = 0)  then
//                                      precio_tot := QVENTAS.FIELDBYNAME('precio').AsString
//                                      ELSE
                                      BEGIN
                                   //  PRECIO_TOT := FLOATTOSTRF(QVENTAS.FIELDBYNAME('precio').AsFLOAT / (1+ 8/100), FFNUMBER,10,6);
                                   //  TOTAL_TOT :=  FLOATTOSTRF(QVENTAS.FIELDBYNAME('TOTAL').AsFLOAT - qvtasieps.FieldByName('totieps').asFLOAT , FFNUMBER,10,6);

                                     precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                     TOTAL_TOT := floattostrf(strtofloat(precio_tot) * strtofloat(canti_tot), fffixed,10,6);
                                     END;
                                end;





                          canti_tot := floattostrf(strtofloat(canti_tot), ffnumber,10,6);


                          canti_tot:= stripped(',', canti_tot);
                          precio_tot := stripped(',', precio_tot);
                          si_iva := 0;




                         LINEA:= LINEA + 1;



                       //  total_tot:= floattostrf((strtofloat(precio_tot) * strtofloat(canti_tot)), ffnumber,10,6);

                         precio_tot:= floattostrf(strtofloat(precio_tot), ffnumber,10,6);

                         total_tot:= stripped(',', total_tot);
                         precio_tot:= stripped(',', precio_tot);

                         IF  QVENTAS.FIELDBYNAME('KILOS').AsFLOAT <>  QVENTAS.FIELDBYNAME('CAJAS').AsFLOAT THEN
                         BEGIN

                         DES_YES := 0;


                         if (unidad = 'KILOS') AND (QVENTAS.FIELDBYNAME('CAJAS').AsFLOAT <> 0)  THEN
                            BEGIN
                             IF QCANEMP.FieldByName('CAN_EMP').ASSTRING <> '1' THEN
                                 begin
                                   descripcion :=   qventas.FIELDBYNAME('descripcion').asstring + '  ' +  QVENTAS.FIELDBYNAME('CAJAS').AsSTRING + ' ' + 'CAJAS';
                                   DES_YES := 1;
                                 end
                                else
                                 begin
                                    descripcion := qventas.FIELDBYNAME('descripcion').asstring ;
                                    DES_YES := 1;
                                 end;
                             END
                           ELSE
                            BEGIN
                             descripcion := qventas.FIELDBYNAME('descripcion').asstring ;
                             DES_YES := 1;
                            END;

                         IF (UNIDAD = 'CAJAS') AND (QVENTAS.FIELDBYNAME('KILOS').AsFLOAT <> 0)  THEN
                             BEGIN
                               IF QCANEMP.FieldByName('CAN_EMP').ASSTRING <> '1' THEN
                                 begin
                                    descripcion :=  qventas.FIELDBYNAME('descripcion').asstring + '  ' + QVENTAS.FIELDBYNAME('KILOS').AsSTRING + ' ' + 'KILOS';
                                    DES_YES := 1;
                                 end
                                 else
                                 begin
                                    descripcion := qventas.FIELDBYNAME('descripcion').asstring ;
                                    DES_YES := 1;
                                 end;
                              END
                            else
                              BEGIN
                                   IF DES_YES = 0 THEN
                                        descripcion := qventas.FIELDBYNAME('descripcion').asstring ;
                              END;

                         end
                         else
                         begin
                             IF QCANEMP.FieldByName('CAN_EMP').ASSTRING <> '1' THEN
                                 begin
                                    DESCRIPCION := qventas.FIELDBYNAME('descripcion').asstring + '  ' +  QVENTAS.FIELDBYNAME('CAJAS').AsSTRING + ' ' + 'CAJAS';
                                    UNIDAD := 'PZAS';
                                 end
                                 else
                                 begin
                                    DESCRIPCION := qventas.FIELDBYNAME('descripcion').asstring;
                                    UNIDAD := 'PZAS';
                                 end;
                         end;



                          if  unidad = 'PZAS' THEN
                            BEGIN
                               IF QCANEMP.FieldByName('CAN_EMP').ASSTRING <> '1' THEN
                                 begin
                                   DESCRIPCION := qventas.FIELDBYNAME('descripcion').asstring + '  ' +  QVENTAS.FIELDBYNAME('CAJAS').AsSTRING + ' ' + 'CAJAS';
                                   UNI_SAT := 'H87';
                                 end
                                 else
                                 begin
                                     DESCRIPCION := qventas.FIELDBYNAME('descripcion').asstring;
                                   UNI_SAT := 'H87';
                                 end;

                            END;

                           if unidad = 'KILOS' THEN
                              UNI_SAT := 'KGM';


                            if unidad = 'CAJAS' THEN
                              UNI_SAT := 'NMP';

                          if  qventas.FIELDBYNAME('descto').asstring = '0' then
                              descuentin := ''
                          else
                              descuentin := qventas.FIELDBYNAME('descto').asstring;


                          OBJETOIMP := '02';

                          if descuentin = '' then
                             descuentin := '0';



                          WRITELN(FAC_ELE, 'CONCEPTO|'+ INTTOSTR(LINEA) + '|'+  descripcion + '|'+ UNIDAD + '|' +
                                CANTI_tot  + '|' +  qventas.FIELDBYNAME('codigo').asstring
                                  + '|'+ PRECIO_tot+ '|'  +
                                  total_tot+'|'+cod_sat+'|'+UNI_SAT+'|'+descuentin+'|'+ OBJETOIMP);




                          If qventas.FieldByName('totiva').asstring <> '0' then
                          begin
                            {   base := floattostrF((qventas.FieldByName('total').asfloat - qventas.FieldByName('totiva').asfloat), FFNUMBER,10,6);
                               BASE:= stripped(',', base); }

                               if descuentin <> '' then
                                   begin
                                      base := floattostrF((strtofloat(total_tot) - strtofloat(descuentin)), FFNUMBER,10,6);
                                      BASE:= stripped(',', base);
                                   end
                                   else
                                      BASE:= TOTAL_TOT;

                               writeln(FAC_ELE, 'CONCEPTO_IMPTRASLADADOS|'+ INTTOSTR(LINEA) + '|'+ '1'+ '|'+ base + '|'+ IMPUES +  '|'+ 'Tasa' +'|'+ tasa +'|'+  qventas.FieldByName('totiva').asstring);


                          end;

                          If qvtasieps.FieldByName('totieps').asstring <> '' then
                          begin
                             {  base := floattostrf((qventas.FieldByName('total').asfloat - qvtasieps.FieldByName('totieps').asfloat), ffnumber,10,6);
                               BASE:= stripped(',', base);   }
                               BASE:= TOTAL_TOT;
                               writeln(FAC_ELE, 'CONCEPTO_IMPTRASLADADOS|'+ INTTOSTR(LINEA) + '|'+ '1'+ '|'+ base + '|'+ IMPUES1 +  '|'+ 'Tasa' +'|'+ tasa1 +'|'+  qvtasieps.FieldByName('totieps').asstring);

                          end;

                           //este lo voy a comentar ya que si lo pongo en ceros no pasa la factura ver con proveedor
                         If (qvtasieps.FieldByName('totieps').asstring = '') and (qventas.FieldByName('totiva').asstring = '0') then
                         begin
                               writeln(FAC_ELE, 'CONCEPTO_IMPTRASLADADOS|'+ INTTOSTR(LINEA) + '|'+ '1'+ '|'+ TOTAL_TOT +'|' + '002'+ '|'+ 'Tasa' + '|' + '0.00'+ '|'+ '0');
                               siceros:= 1;
                         end;




                             If qventas.FieldByName('totiva').asstring <> '0' then
                          begin

                              IVATOTAL4 := IVATOTAL4 + qventas.FieldByName('totiva').asFLOAT;
                              BASE_TOT:=    BASE_TOT   + STRTOFLOAT(BASE);

                          END
                          ELSE
                          BEGIN

                              IMP_EXE4 := IMP_EXE4 + STRTOFLOAT(TOTAL_TOT);
                          END;





                       qVENTAS.NEXT;

                       END;

                      if siceros = 1 then
                            WRITELN(FAC_ELE, 'TRASLADOS|1|002|'+ '0.00' +'|'+ 'Tasa|0.00'+'|'+floattostr(imp_exe4));


                     IF EDIT10.TEXT = '0' THEN
                        EDIT10.TEXT := '0.00' ;

                      if (edit10.text <> '0.00')  then
                    {  begin
                        WRITELN(FAC_ELE, 'TRASLADOS|1|002|'+edit10.text+'|'+ 'Tasa|0.00');

                      end
                      else             }
                      begin
                        WRITELN(FAC_ELE, 'TRASLADOS|1|002|'+ floattostr(ivatotal4) +'|'+ 'Tasa|0.16'+'|'+ FLOATTOSTR(BASE_TOT) );
                      //  WRITELN(FAC_ELE, 'IMPUESTOS_TRASLADADOS|0.00');
                      end;


                      IF IEPS.TEXT = '0' THEN
                            IEPS.TEXT := '0.00';


                     if (ieps.Text <> '0.00') then
                     begin
                        WRITELN(FAC_ELE, 'TRASLADOS|1|003|'+ieps.text+'|'+ 'Tasa|0.08'+'|'+floattostr(iepstotal4));

                      end;
                   {   else
                      begin
                      ieps.Text := '0.00';
                      //  WRITELN(FAC_ELE, 'TRASLADOS|1|003|'+ieps.text+'|'+ 'Tasa|0.08');
                      //  WRITELN(FAC_ELE, 'IMPUESTOS_TRASLADADOS|0.00');
                      end;  }

                      totimptras := floattostrf((strtofloat(edit10.text) + strtofloat(ieps.text)),ffnumber,10,6);

                      totimptras := stripped(',',totimptras);

                      WRITELN(FAC_ELE, 'IMPUESTOS_TRASLADADOS|'+ totimptras);

                 //      WRITELN(FAC_ELE, 'CFDiRELACIONADO|'+ 'D142E889-240D-4DF1-A62B-E98A7B859736|04');


                      WRITELN(FAC_ELE,'ETIQUETAPLANTILLA|COD_CLIENTE|'+'COD CTE: '+COD_CLI);

                      if cod_cli ='S235L' THEN
                      BEGIN


                            IF sori.no_tienda = '5533' THEN
                                       WRITELN(FAC_ELE, 'ADDENDA|REVERSE')
                                   ELSE
                                      WRITELN(FAC_ELE, 'ADDENDA|PIECAMION');


                                   qtotkil.Close;
                                   qtotkil.ParamByName('num_emp').asstring:= num_empresa.Text;
                                   qtotkil.ParamByName('folio').AsString:=NUM_CORRE;
                                   qtotkil.Open;



                             writeln(fac_ele, 'REMISION|10405|'+ sori.remi +'|0|'+  TMPANO+'-'+TMPMES+'-'+TMPDIA +'|'+ sori.no_tienda +'|1|1|3|true|'
                             + qtotkil.fields[1].asstring +'|' + edit9.text + '|0.00|0.00|' + edit10.text + '|0.00|'+ edit1.text + '|1|'
                             +  datetostr(sori.fecha_ci) + '|'+ sori.pedi +'|'+ sori.pedi);




                            IF sori.no_tienda = '5533' THEN
                             writeln(fac_ele, 'PEDIDOS|10405|'+ sori.remi + '|' + sori.pedi + '|' + sori.no_tienda + '|' + inttostr(linea))
                            ELSE
                             writeln(fac_ele, 'PEDIDOS|10405|'+ sori.remi + '|' +sori.pedi + '|' + sori.no_tienda + '|' + inttostr(linea) + '|SI');



                              qventas.Close;
                            qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                              qventas.ParamByName('folio').AsString:= NUM_CORRE;
                              qventas.Open;

                             while not qVENTAS.Eof do
                             begin

                                 QSORINUM.CLOSE;
                                 qsorinum.parambyname('colesa').asstring :=  qventas.fieldbyname('codigo').asstring;
                                 qsorinum.open;

                                 if qsorinum.fieldbyname('soriana').asstring = '' then
                                      begin
                                          showmessage('Revisa el codigo  '+ qventas.fieldbyname('codigo').asstring+ 'no esta dado de alta');
                                          exit;
                                          salirtodo:= 1;

                                      end;

                                 if qventas.fieldbyname('kilos').asfloat = 0 then
                                    canti_ven :=   qventas.fieldbyname('cajas').asstring
                                  else
                                    canti_ven :=   qventas.fieldbyname('kilos').asstring;

                                  writeln(fac_ele, 'ARTICULOS|10405|'+ sori.remi+'|'+ sori.pedi +'|'+  sori.no_tienda +'|' + qsorinum.fieldbyname('soriana').asstring+
                                  '|'+ canti_ven + '|' + qventas.fieldbyname('precio').asstring +'|0.00|0.00');

                             qventas.Next;
                            end;

                      END
                      ELSE
                      BEGIN
                         //  WRITELN(FAC_ELE, 'CORREO_RECEPTOR|');
                           WRITELN(FAC_ELE, 'ADDENDA|NINGUNA');

                      END;

                        //  WRITELN(FAC_ELE,'ETIQUETAPLANTILLA|%COD_CLIENTE%|'+'COD CTE: '+COD_CLI);

                     closefile(fac_ele);


            TOTAL_FIN := '0';
   //         SUBTOTAL_FIN  := '0';
            CANTI_TOT  := '0';
            PRECIO_TOT  := '0';
            TOTAL_TOT  := '0';
            si_entro := 0;
            siceros := 0;


            ruta_des:= 'Z:\Dlls\Entrada\UNIF_PIPE_FACT_'+fac+'.TXT';
             ruta_ori:= 'C:\GENECFDI\UNIF_PIPE_FACT_'+fac+'.TXT';
             //MoveFile(pchar(ruta_ori),pchar(ruta_des));
            copyFile(pchar(ruta_ori),pchar(ruta_des), true);





end;

procedure tform9.copiaryabrir;
var
    t1, t2, dife : tdatetime;
    cajerita, printerinfo, printCommand, ruta_ori, ruta_des, NOM_PDF : STRING;
    j, i, currentport: Integer;
    Device, Driver, Port: array[0..255] of Char;
    hDeviceMode: THandle;
    ENCONTRADA_IMP:  BOOLEAN;
    apunta : string;

begin
                   i := 2;

                   //        AQUI PONGO SI ES TAL  O CUAL EMPRESA
                   //CAMBIO FUTU    if (cod_cli <> 'F55F') AND (cod_cli <> 'G210F') AND (cod_cli <> 'L78L') AND (cod_cli <> 'M14L') AND (cod_cli <> 'P77F') AND (cod_cli <> 'R456L') AND (cod_cli <> 'S356F') AND (cod_cli <> 'T29F') AND (cod_cli <> 'D11F') AND (cod_cli <> 'O14L') then


                 if  (cod_cli <> 'D11F') //AND (cod_cli <> 'O14L')
                 and (cod_cli <> 'F55F') AND (cod_cli <> 'F300F') AND (COD_CLI <> 'C66L')
                  and (cod_cli <> 'M102F') AND (cod_cli <> 'C1F') AND (COD_CLI <> 'C01F')
                  and (cod_cli <> 'D3L') AND (COD_CLI <> 'E77L')  AND (COD_CLI <> 'S356F')
                 AND (cod_cli <> 'C44L') AND (COD_CLI <> 'E67L')  and (entra_azu <> 1)  AND (COD_cLI <> 'G92F') AND (COD_cLI <> 'P92F')
                 AND (cod_cli <> 'S29F') AND (COD_CLI <> 'T29F')   AND (COD_cLI <> 'S356F')  AND (COD_cLI <> 'G307F')
                 AND (cod_cli <> 'R23F') AND (COD_CLI <> 'Z4F') AND (COD_cLI <> 'C160L') AND (COD_cLI <> 'S369L')
                 AND (cod_cli <> 'V199F') AND (COD_CLI <> 'V9F') AND (COD_cLI <> 'V105L') AND (COD_cLI <> 'E941L')
                 then
                  begin

                  repeat

                      if (fileexists('Z:\PDFs\A_CLE8908119N6_'+SERIEE+'_'+ FOLIO_INICIOE+'.PDF')) OR
                         (fileexists('Z:\PDFs\C_CLE8908119N6_'+SERIEE+'_'+ FOLIO_INICIOE+'.PDF'))

                       //   (fileexists('z:\Program Files\sci\edocCFDi\pdfs\C_CLE8908119N6_'+SERIEE+'_'+ FOLIO_INICIOE+'.PDF'))
                            THEN
                              i := 1
                          else
                              i := i + 1;

                   until (i= 1) or (i= 170000);



                  if i = 170000 then
                        begin
                            showmessage('Revisa el Envio');
                            exit;
                        end;


       UUID;

       ruta_ori:= 'Z:\XMLs\A_CLE8908119N6_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';
       ruta_des:= 'C:\enviaRCFDI\A_CLE8908119N6_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';
       //MoveFile(pchar(ruta_ori),pchar(ruta_des));
       copyFile(pchar(ruta_ori),pchar(ruta_des), true);

       ruta_ori:= 'Z:\PDFs\A_CLE8908119N6_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';
       ruta_des:= 'C:\enviaRCFDI\A_CLE8908119N6_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';
       //MoveFile(pchar(ruta_ori),pchar(ruta_des));
       copyFile(pchar(ruta_ori),pchar(ruta_des), true);

       nom_pdf := 'C:\enviaRCFDI\A_CLE8908119N6_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';

      END;



                {  if  (cod_cli = 'M14L') or (cod_cli = 'P77F') OR
                  (cod_cli = 'F106F') or (cod_cli = 'R23F') or (cod_cli = 'C66L')}
                  IF (COD_CLI ='C66L') OR (COD_CLI ='E67L') then
                  begin

                  repeat

                       if (fileexists('Z:\PDFs\A_EIBR9412284L7_'+SERIEE+'_'+ FOLIO_INICIOE+'.PDF')) OR
                          (fileexists('Z:\PDFs\C_EIBR9412284L7_'+SERIEE+'_'+ FOLIO_INICIOE+'.PDF'))

                            THEN
                              i := 1
                          else
                              i := i + 1;

                   until (i= 1) or (i= 170000);



                  if i = 170000 then
                        begin
                            showmessage('Revisa el Envio');
                            exit;
                        end;

       UUID;

       ruta_ori:= 'Z:\XMLs\A_EIBR9412284L7_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';
       ruta_des:= 'C:\enviaRCFDI\A_EIBR9412284L7_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';
       //MoveFile(pchar(ruta_ori),pchar(ruta_des));
       copyFile(pchar(ruta_ori),pchar(ruta_des), true);

       ruta_ori:= 'Z:\PDFs\A_EIBR9412284L7_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';
       ruta_des:= 'C:\enviaRCFDI\A_EIBR9412284L7_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';
       //MoveFile(pchar(ruta_ori),pchar(ruta_des));
       copyFile(pchar(ruta_ori),pchar(ruta_des), true);

       nom_pdf := 'C:\enviaRCFDI\A_EIBR9412284L7_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';

      END;





                {  if (cod_cli = 'R456L') or (cod_cli = 'S356F') or (cod_cli = 'T29F') or (cod_cli = 'G75L') or (cod_cli = 'C855L') then
                  begin

                  repeat

                       if (fileexists('z:\Program Files\sci\edocCFDi\pdfs\A_EIBG940128R27_'+SERIEE+'_'+ FOLIO_INICIOE+'.PDF')) OR
                          (fileexists('z:\Program Files\sci\edocCFDi\pdfs\C_EIBG940128R27_'+SERIEE+'_'+ FOLIO_INICIOE+'.PDF'))
                            THEN
                              i := 1
                          else
                              i := i + 1;

                   until (i= 1) or (i= 170000);



                  if i = 170000 then
                        begin
                            showmessage('Revisa el Envio');
                            exit;
                        end;


       ruta_ori:= 'z:\Program files\sci\edoccfdi\xmls\A_EIBG940128R27_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';
       ruta_des:= 'C:\enviaRCFDI\A_EIBG940128R27_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';
       //MoveFile(pchar(ruta_ori),pchar(ruta_des));
       copyFile(pchar(ruta_ori),pchar(ruta_des), true);

       ruta_ori:= 'z:\Program files\sci\edoccfdi\pdfs\A_EIBG940128R27_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';
       ruta_des:= 'C:\enviaRCFDI\A_EIBG940128R27_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';
       //MoveFile(pchar(ruta_ori),pchar(ruta_des));
       copyFile(pchar(ruta_ori),pchar(ruta_des), true);

       nom_pdf := 'C:\enviaRCFDI\A_EIBG940128R27_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';

      END;       }


           //AQUI PONGO LO DE PEDRO GAMA

                  IF ((COD_CLI ='G92F') OR (COD_CLI ='P92F')) AND (NUM_eMPRESA.Text ='01') then
                  begin

                  repeat

                      if (fileexists('Z:\PDFs\A_CLE8908119N6_'+SERIEE+'_'+ FOLIO_INICIOE+'.PDF')) OR
                          (fileexists('Z:\PDFs\C_CLE8908119N6_'+SERIEE+'_'+ FOLIO_INICIOE+'.PDF'))
                       //   (fileexists('z:\Program Files\sci\edocCFDi\pdfs\C_CLE8908119N6_'+SERIEE+'_'+ FOLIO_INICIOE+'.PDF'))
                            THEN
                              i := 1
                          else
                              i := i + 1;

                   until (i= 1) or (i= 170000);



                  if i = 170000 then
                        begin
                            showmessage('Revisa el Envio');
                            exit;
                        end;


       UUID;

       ruta_ori:= 'Z:\XMLs\A_CLE8908119N6_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';
       ruta_des:= 'C:\enviaRCFDI\A_CLE8908119N6_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';
       //MoveFile(pchar(ruta_ori),pchar(ruta_des));
       copyFile(pchar(ruta_ori),pchar(ruta_des), true);

       ruta_ori:= 'Z:\PDFs\A_CLE8908119N6_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';
       ruta_des:= 'C:\enviaRCFDI\A_CLE8908119N6_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';
       //MoveFile(pchar(ruta_ori),pchar(ruta_des));
       copyFile(pchar(ruta_ori),pchar(ruta_des), true);

       nom_pdf := 'C:\enviaRCFDI\A_CLE8908119N6_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';

      END;


      {  IF ((COD_CLI ='G92F') OR (COD_CLI ='P92F')) AND (NUM_eMPRESA.Text ='04') then
        begin

                  repeat

                       if (fileexists('Z:\PDFs\A_EIGZ6711088J4_'+SERIEE+'_'+ FOLIO_INICIOE+'.PDF')) OR
                          (fileexists('Z:\PDFs\C_EIGZ6711088J4_'+SERIEE+'_'+ FOLIO_INICIOE+'.PDF'))
                            THEN
                              i := 1
                          else
                              i := i + 1;

                   until (i= 1) or (i= 170000);



                  if i = 170000 then
                        begin
                            showmessage('Revisa el Envio');
                            exit;
                        end;

       UUID;

       ruta_ori:= 'Z:\XMLs\A_EIGZ6711088J4_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';
       ruta_des:= 'C:\enviaRCFDI\A_EIGZ6711088J4_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';
       //MoveFile(pchar(ruta_ori),pchar(ruta_des));
       copyFile(pchar(ruta_ori),pchar(ruta_des), true);

       ruta_ori:= 'Z:\PDFs\A_EIGZ6711088J4_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';
       ruta_des:= 'C:\enviaRCFDI\A_EIGZ6711088J4_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';
       //MoveFile(pchar(ruta_ori),pchar(ruta_des));
       copyFile(pchar(ruta_ori),pchar(ruta_des), true);

       nom_pdf := 'C:\enviaRCFDI\A_EIGZ6711088J4_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';

      END; }


                 //  or (cod_cli = 'C44L')
                  if (cod_cli = 'D11F') OR (cod_cli = 'F55F') or (cod_cli = 'F300F') OR (cod_cli = 'G92F') or (cod_cli = 'P92F') OR
                     (cod_cli = 'M102F') OR (cod_cli = 'C1F') or (cod_cli = 'C01F') OR (cod_cli = 'D3L') OR
                      (cod_cli = 'S29F') OR (cod_cli = 'T29F') or (cod_cli = 'S256F') OR (cod_cli = 'G307F') OR
                      (cod_cli = 'R23F') OR (cod_cli = 'Z4F') OR (COD_CLI ='C160L') OR (COD_CLI ='S369L') OR (COD_CLI ='E77L') OR (COD_CLI ='E941L')
                      OR (COD_CLI ='V199F') OR (COD_CLI ='V9F') OR (COD_CLI ='V105L')  OR (entra_azu = 1)
                      THEN
                  begin

                  repeat

                       if (fileexists('Z:\PDFs\A_EIGZ6711088J4_'+SERIEE+'_'+ FOLIO_INICIOE+'.PDF')) OR
                          (fileexists('Z:\PDFs\C_EIGZ6711088J4_'+SERIEE+'_'+ FOLIO_INICIOE+'.PDF'))
                            THEN
                              i := 1
                          else
                              i := i + 1;

                   until (i= 1) or (i= 170000);



                  if i = 170000 then
                        begin
                            showmessage('Revisa el Envio');
                            exit;
                        end;

       UUID;

       ruta_ori:= 'Z:\XMLs\A_EIGZ6711088J4_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';
       ruta_des:= 'C:\enviaRCFDI\A_EIGZ6711088J4_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';
       //MoveFile(pchar(ruta_ori),pchar(ruta_des));
       copyFile(pchar(ruta_ori),pchar(ruta_des), true);

       ruta_ori:= 'Z:\PDFs\A_EIGZ6711088J4_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';
       ruta_des:= 'C:\enviaRCFDI\A_EIGZ6711088J4_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';
       //MoveFile(pchar(ruta_ori),pchar(ruta_des));
       copyFile(pchar(ruta_ori),pchar(ruta_des), true);

       nom_pdf := 'C:\enviaRCFDI\A_EIGZ6711088J4_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';

      END;


                   if  (cod_cli = 'C44L')
                     THEN
                    begin

                    repeat

                       if (fileexists('Z:\PDFs\A_LNE111123HW3_'+SERIEE+'_'+ FOLIO_INICIOE+'.PDF')) OR
                          (fileexists('Z:\PDFs\C_LNE111123HW3_'+SERIEE+'_'+ FOLIO_INICIOE+'.PDF'))
                            THEN
                              i := 1
                          else
                              i := i + 1;

                   until (i= 1) or (i= 170000);



                  if i = 170000 then
                        begin
                            showmessage('Revisa el Envio');
                            exit;
                        end;

       UUID;

       ruta_ori:= 'Z:\XMLs\A_LNE111123HW3_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';
       ruta_des:= 'C:\enviaRCFDI\A_LNE111123HW3_'+SERIEE + '_'+ FOLIO_INICIOE+'.xml';
       //MoveFile(pchar(ruta_ori),pchar(ruta_des));
       copyFile(pchar(ruta_ori),pchar(ruta_des), true);

       ruta_ori:= 'Z:\PDFs\A_LNE111123HW3_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';
       ruta_des:= 'C:\enviaRCFDI\A_LNE111123HW3_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';
       //MoveFile(pchar(ruta_ori),pchar(ruta_des));
       copyFile(pchar(ruta_ori),pchar(ruta_des), true);

       nom_pdf := 'C:\enviaRCFDI\A_LNE111123HW3_'+SERIEE + '_'+ FOLIO_INICIOE+'.PDF';

      END;

             {       CHDIR('C:\CFDICOLE\');
                    AssignFile(REmueve, 'REmueve.BAT');


                    REWRITE(REmueve);

                    WRITELN(REmueve, 'copy  Z:\cfdi\prueba\'+'UNIF_'+'PIPE'+ '_FACT_'+fac+'.PDF'+ ' C:\GENECFDI\'+'UNIF_'+'PIPE'+ '_FACT_'+FAC+'.PDF');

                    closefile(REmueve);

                    ShellExecute (0, 'open', 'c:\cfdiCOLE\REMUEVE.bat', '', '', SW_SHOWNORMAL);

                    NOM_PDF:= 'C:\GENECFDI\'+'UNIF_'+'PIPE'+ '_FACT_'+fac+'.PDF';  }

                 //   ShellExecute(FORM9.Handle,nil,PChar(NOM_PDF),'','',SW_SHOWNORMAL);


                  copiascli.Close;
                  copiascli.ParamByName('cod_cli').AsString := cod_cli;
                  copiascli.Open;



  if imp_rest.ItemIndex =  0  then
    begin


    //aqui voy a asignar a que impresora se va

      qbusimp.Close;
      qbusimp.ParamByName('fecha').Asdate := fechavientos.Date;
      qbusimp.Open;

      CAJERITA:= qbusimp.FieldByName('caja').AsString;




    i:=0;
    //buscar printer
    Encontrada_Imp:= False;
    while ((not Encontrada_Imp ) and
    (i <= Printer.Printers.Count-1)) do
    begin
        apunta := UpperCase(Printer.Printers.Strings [i]);

        if Pos('FACTURA', UpperCase(Printer.Printers.Strings [i])) <> 0  then
          // Pos(CAJERITA, UpperCase(Printer.Printers.Strings [i])) <> 0 then
          //(Pos('IMPRESTA', UpperCase(Printer.Printers.Strings [i])) <> 0)  then
           begin
              printCommand := 'printto';
              printer.PrinterIndex:= i;
              printer.GetPrinter(device,driver,port,hdevicemode);
              printerInfo := Format('"%s" "%s" "%s"', [Device, Driver, Port]) ;
              ShellExecute(Application.Handle, PChar(printCommand), PChar(nom_pdf), PChar(printerInfo), nil, SW_HIDE) ;
          //    ShellExecute(Application.Handle, PChar(printCommand), PChar(nom_pdf), PChar(printerInfo), nil, SW_HIDE) ;
              Encontrada_Imp:= True
           end
            else
            inc(i);
    end;


     i:=0;
    //buscar printer
    Encontrada_Imp:= False;
    while ((not Encontrada_Imp ) and
    (i <= Printer.Printers.Count-1)) do
    begin
        apunta := UpperCase(Printer.Printers.Strings [i]);
        if Pos('RESTAURANT', UpperCase(Printer.Printers.Strings [i])) <> 0 then
           begin
              printCommand := 'printto';
              printer.PrinterIndex:= i;
              printer.GetPrinter(device,driver,port,hdevicemode);
              printerInfo := Format('"%s" "%s" "%s"', [Device, Driver, Port]) ;
              ShellExecute(Application.Handle, PChar(printCommand), PChar(nom_pdf), PChar(printerInfo), nil, SW_HIDE) ;
              ShellExecute(Application.Handle, PChar(printCommand), PChar(nom_pdf), PChar(printerInfo), nil, SW_HIDE) ;
              Encontrada_Imp:= True
           end
            else
            inc(i);
    end;




    end

    else
   begin
    if (cod_Cli = 'S235L')THEN
          BEGIN
              ShellExecute(Self.Handle,'print',PChar(nom_pdf),NIL,NIL,0);
          END
          ELSE
    BEGIN
    if (copiascli.FieldByName('cod_cli').AsString <> '') or (strtofloat(pla_clie) = 0 )  THEN
        BEGIN
                   ShellExecute(Self.Handle,'print',PChar(nom_pdf),NIL,NIL,0);

                   ShellExecute(Self.Handle,'print',PChar(nom_pdf),NIL,NIL,0);

         //          ShellExecute(Self.Handle,'print',PChar(nom_pdf),NIL,NIL,0);
        END
        ELSE
        BEGIN

                   ShellExecute(Self.Handle,'print',PChar(nom_pdf),NIL,NIL,0);

                   ShellExecute(Self.Handle,'print',PChar(nom_pdf),NIL,NIL,0);

           //        ShellExecute(Self.Handle,'print',PChar(nom_pdf),NIL,NIL,0);

              
        END;

        if (cod_cli ='O71L') OR (COD_CLI='A142L') OR (COD_CLI='O14L') OR (COD_CLI='C21L') OR (COD_CLI ='E80L') THEN
        BEGIN
              ShellExecute(Self.Handle,'print',PChar(nom_pdf),NIL,NIL,0);
        END;


        IF (COD_CLI = 'M277L') OR (COD_CLI ='M905L') THEN
             BEGIN
                   ShellExecute(Self.Handle,'print',PChar(nom_pdf),NIL,NIL,0);

                   ShellExecute(Self.Handle,'print',PChar(nom_pdf),NIL,NIL,0);
              END;

  end;
  END; 


end;


procedure tform9.notaremision;
begin
        crear_pdf;
end;



procedure TForm9.tdebitoExit(Sender: TObject);
var
  fecha: tdate;
  nom_ban, no_cheque: string;
begin

       if tdebito.text='' then
        begin
          tdebito.text:= '0';
          tdebito.SelectAll;
        end;
        if tdebito.Text <> '0' then
          begin
             dbbanco.Visible:= true;
             nocheque.Visible:=true;
             banfecha.Visible:= true;
             label18.Visible:= true;
             label19.Visible:= true;
             label20.visible:= true;
             nom_ban:= dbbanco.text;
             BANFECHA.Date := DATE;
             no_cheque:= nocheque.text;
             fecha:= banfecha.Date;
             tbanco.Close;
             tbanco.Open;
          end;

           if (cheque.Text = '0') AND (CHEQPREF.Text = '0') AND (TDEBITO.Text = '0') AND (transf.Text = '0') then
          begin
             dbbanco.Visible:= FALSE;
             nocheque.Visible:=FALSE;
             banfecha.Visible:= FALSE;
             label18.Visible:= FALSE;
             label19.Visible:= FALSE;
             label20.visible:= FALSE;
             tbanco.Close;

          end;
       sacatotal1;
end;

procedure tform9.nuevo_prov;
var

    IVITOT,  DESCTOFIN, CLIENTE_NOM, DESCRIPCION, ruta_ori, ruta_des,canti_ven, pago_tipo, tipo_pago, banco, digitos, unidad,
    precio_totnoiva, precio_totsiiva, precio_tot, total_tot, canti_tot, subtotal_fin, total_fin,  tfecha1,  CONCE_FECHA: STRING;
    DES_YES, si_entro, linea : integer;

begin
       precio_totnoiva:= '0';
       precio_totsiiva:= '0';

      TFECHA1:= DATETOSTR(fechavientos.Date);

       tmpdia:= copy(tfecha1,1,2);
       tmpmes:= copy(tfecha1,4,2);
       tmpano:= copy(tfecha1,7,4);

     ShortDateFormat := 'dd/mm/yyyy';
    SHORTtimeformat:= 'HH:mm:ss';

     horafinal:= timetostr(time);


     CONCE_FECHA := TMPANO+'-'+TMPMES+'-'+TMPDIA+'T'+HORAFINAL;
     CONCE_FECHA:= copy(CONCE_FECHA, 1, 19);

           // aqui busco el tipo de pago para agregarlo en el archivo txt

     qtipo_pago.Close;
     qtipo_pago.ParamByName('cod_cli').AsString := cod_cli;
     qtipo_pago.Open;


     if qtipo_pago.FieldByName('tipo_pago').AsString = '' then
     begin

          if cheqpref.Text <> '0' then
              begin
                  tipo_pago:= 'T. de credito';
                  banco := dbbanco.Text;
                  digitos := nocheque.Text;
                  si_entro := 1;
              end;

          if tdebito.Text <> '0' then
              begin
                  tipo_pago:= 'T. de debito';
                  banco := dbbanco.Text;
                  digitos := nocheque.Text;
                  si_entro := 1;
              end;

         if si_entro = 0 then
          begin
          tipo_pago:= 'Efectivo';
          banco := '';
          digitos := ''
          end;

     end;


      if qtipo_pago.FieldByName('tipo_pago').AsString = 'No Identificado' then
     begin
          tipo_pago:= 'No Identificado';
          banco :=   '';
          digitos := '';

     end;


     if qtipo_pago.FieldByName('tipo_pago').AsString = 'Transferencia' then
     begin
          tipo_pago:= 'Transferencia';
          banco :=   qtipo_pago.FieldByName('banco').AsString;
          digitos := qtipo_pago.FieldByName('num_cta').AsString;

     end;

 if qtipo_pago.FieldByName('tipo_pago').AsString = 'Efectivo' then
     begin
          tipo_pago:= 'Efectivo';
          banco := '';
          digitos := ''

     end;

   if qtipo_pago.FieldByName('tipo_pago').AsString = 'Credito' then
     begin
          tipo_pago:= 'Credito';
          banco := 'No Identificado';
          digitos :=  '';

     end;

      if qtipo_pago.FieldByName('tipo_pago').AsString = 'Cheque' then
     begin
          tipo_pago:= 'Cheque';
          banco := qtipo_pago.FieldByName('banco').AsString;
          digitos :=  qtipo_pago.FieldByName('num_cta').AsString;

     end;



      if qtipo_pago.FieldByName('tipo_pago').AsString = 'Tarjeta Credito' then
     begin
          tipo_pago:= 'T. de Credito';
          banco :=  qtipo_pago.FieldByName('banco').AsString;
          digitos := qtipo_pago.FieldByName('num_cta').AsString;

     end;


      if qtipo_pago.FieldByName('tipo_pago').AsString = 'Tarjeta Debito' then
     begin
          tipo_pago:= 'T. de Debito';
          banco :=  qtipo_pago.FieldByName('banco').AsString;
          digitos := qtipo_pago.FieldByName('num_cta').AsString;

     end;

     pago_tipo := tipo_pago + ' '+banco  ;

                    FAC:= FACTU.Text;

                    CHDIR('C:\GENECFDI\');
                    AssignFile(fac_ele,'UNIF_'+'PIPE'+ '_FACT_'+fac+'.TXT');
                    REWRITE(fac_ele);


                    WRITELN(FAC_ELE,  'H00000'+'|'+'CLE8908119N6'+'|'+'1'+'|'+conce_fecha+'|');

                    WRITELN(FAC_ELE,  'OPE001'+'|'+'1'+'|'+'1'+'|'+'1'+'|');

                    WRITELN(FAC_ELE,  'C00000'+'|'+'ES'+'|'+'1'+'|'+''+'|');

                    WRITELN(FAC_ELE,  'C10001'+'|'+'3.3'+'|'+SERIEE+'|'+folio_inicioe+'|'+ conce_fecha +'|'+ 'Pago en una sola exhibicion'+'|'+ ''+'|');

                    WRITELN(FAC_ELE,  'C20002'+ '|' + ''+'|'+''+'|');


                    subtotal_fin := edit9.Text;
                    total_fin := edit1.text;

                    subtotal_Fin:= stripped(',', subtotal_fin);
                    total_fin:= stripped(',', total_fin);

                    IF (FLOATTOSTR(ACUDES) <> '') OR (FLOATTOSTR(ACUDES) <> '0') THEN
                                  DESCTOFIN := FLOATTOSTRF(ACUDES, FFNUMBER,10,2)
                                 ELSE
                                  DESCTOFIN := '';

                                   DESCTOFIN:= stripped(',', DESCTOFIN);


                    WRITELN(FAC_ELE,  'C30003'+ '|' + ''+'|'+subtotal_fin+'|'+ '|'+''+'|' + '|'+''+'|' + '|'+''+'|' + '|'+''+'|' + '|'+''+'|' + '|'+''+'|' + total_fin+'|' + tipo_pago +
                                      '|'+''+'|'+ 'Chihuahua'+'|'+''+'|'+ '|'+''+'|'+ '|'+''+'|'+ '|'+''+'|'+ '|'+''+'|'+ 'Factura' + '|' );


                    WRITELN(FAC_ELE, 'E00001'+ '|' + 'CLE8908119N6' +'|' +'COMESTIBLES Y LEGUMBRES '+'|');

                    WRITELN(FAC_ELE, 'F00001'+ '|' + 'BLVD J PABLO II CENTRAL DE ABASTOS C AA' +'|'+ '4701'+'|' + 'B26' +'|' + 'AEROPUERTO' + '|'+''+'|' +'|'+''+'|'+ 'CHIHUAHUA' +'|' + 'CHIHUAHUA'+ '|' +
                            'MEXICO'+ '|' + '31384'  +'|' + ''+'|' +  '' + '|' +  '' + '|' +'' + '|');


                    WRITELN(FAC_ELE, 'X00001'+ '|' + '' +'|'+ ''  +'|' + '' +'|' + '' + '|'+''+'|' + '' + '|'+''+'|'+ '' +'|' + 'MEXICO'+ '|' +
                            ''+ '|' + ''  +'|');

                    WRITELN(FAC_ELE, 'RF0001'+ '|' + 'REGIMEN GENERAL DE LEY' +'|');

                    WRITELN(FAC_ELE, 'R00001'+ '|' + 'BLVD J PABLO II CENTRAL DE ABASTOS C AA' +'|'+ '4701'+'|' + 'B26' +'|' + 'AEROPUERTO' + '|'+''+'|' +'|'+''+'|'+ 'CHIHUAHUA' +'|' + 'CHIHUAHUA'+ '|' +
                            'MEXICO'+ '|' + '31384'  +'|' + ''+'|' +  '' + '|' +  '' + '|' +'' + '|');




                     if trfc.Text = 'XAXX010101000' THEN
                       BEGIN
                          CLIENTE_NOM := 'VENTAS AL PUBLICO EN GENERAL' + '   ' + COD_CLI;

                           WRITELN(FAC_ELE, 'R00001'+ '|'+ trfc.text +'|'+ CLIENTE_NOM  +'|');

                          WRITELN(FAC_ELE, 'D00001'+ '|'+ 'SIN NOMBRE' + '|' + 'SN' +'|'+
                          'SN' +'|'+ 'SIN COLONIA' +'|' + CIU_CLI+ '|' + ''+ '|' + qdeta.fieldbyname('municipio').asstring +'|' +
                          EST_CLI +'|MEXICO|'+ '11111'+'|'+''+ '|'+ '' + '|' +''+'|')
                       END
                     ELSE
                     BEGIN
                        CLIENTE_NOM := NOM_CLI + '   ' + COD_CLI;

                        WRITELN(FAC_ELE, 'R00001'+ '|'+ trfc.text +'|'+ CLIENTE_NOM  +'|');

                        WRITELN(FAC_ELE, 'D00001' + '|'+ trfc.text +'|'+ CLIENTE_NOM +'|' + qdeta.fieldbyname('calle').asstring + '|' + qdeta.fieldbyname('num_ext').asstring +'|'+
                        qdeta.fieldbyname('num_int').asstring+'|'+ qdeta.fieldbyname('colonia').asstring +'|' + CIU_CLI+ '|'+ '' +'|' + qdeta.fieldbyname('municipio').asstring +'|' +
                         EST_CLI + '|' + 'MEXICO'  + '|'+ COD_POS+ '|'+''+'|'+ ''+'|'+''+'|' );
                    END;


                     WRITELN(FAC_ELE, 'R00002'+ '|'+ ''+'|'+ ''  +'|' +  '|'+ ''+'|'+ ''  +'|' +'|'+ ''  +'|');



                       qventas.Close;
                        qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                       qventas.ParamByName('folio').AsString:= tfolio.Text;
                       qventas.Open;


                    LINEA:= 0;
                    canti_tot:= '0';

                    WHILE NOT qventas.Eof DO
                    BEGIN

                          IF qventas.FIELDBYNAME('kilos').asfloat = 0 then
                                begin
                                      UNIDAD := 'CAJAS';
                                      CANTI_TOT := QVENTAS.FIELDBYNAME('CAJAS').AsString;
                                      IF QVENTAS.FIELDBYNAME('IVA').AsString = '0' THEN
                                      begin
                                        precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                        precio_totnoiva :=  floattostrf((strtofloat(precio_totnoiva) + strtofloat(precio_tot)), ffnumber, 10,2);
                                      end
                                      ELSE
                                      begin
                                        PRECIO_TOT := FLOATTOSTRF(QVENTAS.FIELDBYNAME('precio').AsFLOAT / (1+ 16/100), FFNUMBER,10,2);
                                        precio_totsiiva := floattostrf((strtofloat(precio_totsiiva) + strtofloat(precio_tot)), ffnumber, 10,2);
                                      end
                                end
                                else
                                begin
                                      UNIDAD := 'KILOS';
                                      CANTI_TOT := QVENTAS.FIELDBYNAME('KILOS').AsString;
                                    IF QVENTAS.FIELDBYNAME('IVA').AsString = '0' THEN
                                       begin
                                        precio_tot := QVENTAS.FIELDBYNAME('precio').AsString;
                                        precio_totnoiva :=  floattostrf((strtofloat(precio_totnoiva) + strtofloat(precio_tot)), ffnumber, 10,2);
                                       end
                                      ELSE
                                       begin
                                         PRECIO_TOT := FLOATTOSTRF(QVENTAS.FIELDBYNAME('precio').AsFLOAT / (1+ 16/100), FFNUMBER,10,2);
                                         precio_totsiiva := floattostrf((strtofloat(precio_totsiiva) + strtofloat(precio_tot)), ffnumber, 10,2);
                                      end
                                end;




                           canti_tot := floattostrf(strtofloat(canti_tot), ffnumber,10,2);


                          canti_tot:= stripped(',', canti_tot);


                         LINEA:= LINEA + 1;


                         precio_tot := stripped(',', precio_tot);


                         total_tot:= floattostrf((strtofloat(precio_tot) * strtofloat(canti_tot)), ffnumber,10,2);

                         precio_tot:= floattostrf(strtofloat(precio_tot), ffnumber,10,2);




                         total_tot:= stripped(',', total_tot);
                         precio_tot:= stripped(',', precio_tot);

                         IF  QVENTAS.FIELDBYNAME('KILOS').AsFLOAT <>  QVENTAS.FIELDBYNAME('CAJAS').AsFLOAT THEN
                         BEGIN

                         DES_YES := 0;


                         if (unidad = 'KILOS') AND (QVENTAS.FIELDBYNAME('CAJAS').AsFLOAT <> 0)  THEN
                            BEGIN
                             descripcion :=   qventas.FIELDBYNAME('descripcion').asstring + '  ' +  QVENTAS.FIELDBYNAME('CAJAS').AsSTRING + ' ' + 'CAJAS';
                              DES_YES := 1;
                             END
                           ELSE
                            BEGIN
                             descripcion := qventas.FIELDBYNAME('descripcion').asstring ;
                             DES_YES := 1;
                            END;

                         IF (UNIDAD = 'CAJAS') AND (QVENTAS.FIELDBYNAME('KILOS').AsFLOAT <> 0)  THEN
                             BEGIN
                               descripcion :=  qventas.FIELDBYNAME('descripcion').asstring + '  ' + QVENTAS.FIELDBYNAME('KILOS').AsSTRING + ' ' + 'KILOS';
                               DES_YES := 1;
                              END
                            else
                              BEGIN
                                   IF DES_YES = 0 THEN
                                        descripcion := qventas.FIELDBYNAME('descripcion').asstring ;
                              END;

                         end
                         else
                         begin
                              DESCRIPCION := qventas.FIELDBYNAME('descripcion').asstring ;
                              UNIDAD := 'PZAS';
                         end;



                          IF QVENTAS.FIELDBYNAME('IVA').AsString = '0' then
                                ivitot := '1'
                             else
                                ivitot := '3';



                    {      WRITELN(FAC_ELE, 'CONCEPTO|'+ INTTOSTR(LINEA) + '|'+  descripcion + '|'+ UNIDAD + '|' +
                                CANTI_tot  + '|' +  qventas.FIELDBYNAME('codigo').asstring
                                  + '|'+ PRECIO_tot+ '|'  +
                                  total_tot);     }


                               WRITELN(FAC_ELE, 'I00001'+ '|'+CANTI_TOT +'|' + UNIDAD +'|' +  qventas.FIELDBYNAME('codigo').asstring +'|' +
                               DESCRIPCION +'|' + PRECIO_TOT +'|' + '' + '|' +  '' + '|' + TOTAL_TOT + '|' + ivitot + '|' + '' +'|' +  '' +'|');





                       qVENTAS.NEXT;

                       END;



                     WRITELN(FAC_ELE, 'DES001' + '|' + ''+'|'+''+'|');
                     WRITELN(FAC_ELE, 'IA0001' +'|' +'' +'|' +'' + '|' + '' + '|' );
                     WRITELN(FAC_ELE, 'IP0001' + '|' +''+'|');
                     WRITELN(FAC_ELE, 'IC0001' +'|'+ '' + '|' );
                     WRITELN(FAC_ELE, 'IR0001' +'|'+''+'|' + '' +'|'+ '' +'|' + '' + '|' + '' + '|' + '' + '|');
                     WRITELN(FAC_ELE, 'IU0001'+'|'+''+'|' + '' +'|'+ '' +'|');
                     WRITELN(FAC_ELE, 'P-----'+'|'+''+'|');


                     IF DESCTOFIN  = '' THEN
                     writeln(fac_ele, 'DG0001' + '|' + '' +'|' + '' + '|' )
                     ELSE
                      writeln(fac_ele, 'DG0001' + '|' + 'DESCUENTO' +'|' + DESCTOFIN + '|' );


                     WRITELN(FAC_ELE, 'T10001' + '|' + ''+'|'+''+'|');

                     WRITELN(FAC_ELE, 'T20001' +'|' +'IVA' +'|' +'0' + '|'  );

                      if edit10.text <> '0' then
                     WRITELN(FAC_ELE, 'T30001' +'|' +'IVA' +'|' + '16'+'|' +EDIT10.TEXT + '|'  )
                      ELSE
                     WRITELN(FAC_ELE, 'T30001' +'|' +'IVA' +'|' +'0' + '|' + '0'+ '|' );


                     WRITELN(FAC_ELE, 'B0001' +'|'+''+'|' + '' +'|'+ '' +'|' + '' + '|' + '' + '|' + '' + '|');
                     WRITELN(FAC_ELE, 'CM0001'+'|'+'CM000'+'|' );
                     WRITELN(FAC_ELE, 'A0001'+'|'+'AD000'+'|');
                     WRITELN(FAC_ELE, 'N0001'+'|'+''+'|' +'|'+''+'|');
                     WRITELN(FAC_ELE, 'N0002'+'|'+''+'|' +'|'+''+'|');
                     WRITELN(FAC_ELE, 'N0003'+'|'+''+'|' +'|'+''+'|');
                     WRITELN(FAC_ELE, 'N0004'+'|'+''+'|' +'|'+''+'|');
                     WRITELN(FAC_ELE, 'N0005'+'|'+''+'|' +'|'+''+'|');

                     WRITELN(FAC_ELE, 'OPEEND' + '|' );
                     WRITELN(FAC_ELE, 'TRAILE' +'|' +precio_totsiiva +'|' +precio_totnoiva + '|' + '' + '|' );




         closefile(fac_ele);


            TOTAL_FIN := '0';
   //         SUBTOTAL_FIN  := '0';
            CANTI_TOT  := '0';
            PRECIO_TOT  := '0';
            TOTAL_TOT  := '0';
            si_entro := 0;
            precio_totnoiva := '0';
            precio_totsiiva := '0';



end;



procedure TForm9.nombreClick(Sender: TObject);
begin
              //aqui reviso que tenga tipo pago

         qtipo_pago.Close;
     qtipo_pago.ParamByName('cod_cli').AsString := cod_cli;
     qtipo_pago.Open;


     if qtipo_pago.FieldByName('tipo_pago').AsString = '' then
     begin

          showmessage('Revisa cliente no tiene Tipo de Pago');
          exit;

    end;
end;

procedure TForm9.CODIGOCLIClick(Sender: TObject);
begin
          //aqui reviso que tenga tipo pago

         qtipo_pago.Close;
     qtipo_pago.ParamByName('cod_cli').AsString := cod_cli;
     qtipo_pago.Open;


     if qtipo_pago.FieldByName('tipo_pago').AsString = '' then
     begin

          showmessage('Revisa cliente no tiene Tipo de Pago');
          exit;

    end;
end;

procedure TForm9.NUM_EMPRESAClick(Sender: TObject);
begin
      TIPO_FAC.ItemIndex := -1;
      EDIT2.Text := '';
      TIPO_PAGO.ItemIndex:= -1;
        TIPOCONSULTA.ItemIndex:= -1;

      QTIPO.Close;

end;

procedure TForm9.transfExit(Sender: TObject);
var
  fecha: tdate;
  nom_ban, no_cheque: string;
begin
        if transf.text='' then
        begin
          transf.text:= '0';
          transf.SelectAll;
        end;
        if transf.Text <> '0' then
          begin
             dbbanco.Visible:= true;
             nocheque.Visible:=true;
             banfecha.Visible:= true;
             label18.Visible:= true;
             label19.Visible:= true;
             label20.visible:= true;
             nom_ban:= dbbanco.text;
             BANFECHA.Date := DATE;
             no_cheque:= nocheque.text;
             fecha:= banfecha.Date;
             tbanco.Close;
             tbanco.Open;
          end;

          if (cheque.Text = '0') AND (CHEQPREF.Text = '0') AND (TDEBITO.Text = '0') AND (transf.Text = '0') then
          begin
             dbbanco.Visible:= FALSE;
             nocheque.Visible:=FALSE;
             banfecha.Visible:= FALSE;
             label18.Visible:= FALSE;
             label19.Visible:= FALSE;
             label20.visible:= FALSE;
             tbanco.Close;

          end;

       sacatotal1;
       cheque.SelectAll;
end;

procedure TForm9.pon_usocfdiClick(Sender: TObject);
begin
           cod_uso := cfdiuso.fieldbyname('codigo').asstring ;
           uso_cfdi:= cfdiuso.fieldbyname('descrip').AsString;
           pon_usocfdi.KeyValue := cfdiuso.fieldbyname('descrip').asstring ;
end;

procedure TForm9.BitBtn1Click(Sender: TObject);
begin

       if busfolio.Text  = '' then
       begin
            showmessage('Poner folio');
            busfolio.SetFocus;
            exit;
       end;

       if tipo_fac.ItemIndex = -1 then
          begin
              showmessage('Selecciona si es Fact o Tick');
              busfolio.SetFocus;
              exit;
          end;

       QBUSFOLIOCORTE.CLOSE;
       QBUSFOLIOCORTE.PARAMBYNAME('FACTURA').ASSTRING := busfolio.text;
       qbusfoliocorte.open;

     //  busfolio.text := qbusfoliocorte.fieldbyname('folio').asstring;


       //aqui actualizo la emp a 08 en ventas


        qbusfolio.close;
       qbusfolio.parambyname('folio').asstring := qbusfoliocorte.fieldbyname('folio').asstring;
    //   qbusfolio.parambyname('num_emp').asstring := '01';
       qbusfolio.open;

       if qbusfolio.fieldbyname('folio').asstring = '' then
          begin
               showmessage('El folio no existe revisalo');
               busfolio.SetFocus;
               exit;
          end;


      { if tipo_fac.ItemIndex = 1 then
       begin

             busemp.Close;
             busemp.ParamByName('factura').AsString := busfolio.Text;
             busemp.OPEN;

             if busemp.Fields[0].Asstring <> '' then
                begin

                        busemp08.close;
                        busemp08.parambyname('num_doc').asstring := qbusfoliocorte.fieldbyname('folio').asstring;
                        busemp08.parambyname('num_emp').asstring := '08';
                        busemp08.open;

                        while not busemp08.eof do
                        begin

                              actuemp.close;
                              actuemp.parambyname('num_emp').asstring := '08';
                              actuemp.parambyname('codigo').asstring := busemp08.fieldbyname('cod_art').asstring;
                              actuemp.parambyname('folio').asstring := qbusfoliocorte.fieldbyname('folio').asstring;
                              actuemp.execsql;

                              busemp08.Next;

                        end;

                end;

       end;   }


       sitienefolio :=  qbusfoliocorte.fieldbyname('folio').asstring;



       qbusinarcot.close;
       qbusinarcot.parambyname('folio').asstring := qbusfoliocorte.fieldbyname('folio').asstring;
     //  qbusinarcot.parambyname('num_emp').asstring := num_empresa.text;
       qbusinarcot.open;

        if qbusinarcot.fieldbyname('cod_cli').AsString = '' then
          begin
               showmessage('El cliente no existe revisalo');
               busfolio.SetFocus;
               exit;
          end;

       edit9.text := floattostrf(qbusinarcot.fields[0].asfloat + qbusinarcot.fields[1].asfloat + qbusinarcot.fields[3].asfloat, fffixed,10,2);
       ieps.text :=  qbusinarcot.fields[4].asstring;
       edit10.text :=  qbusinarcot.fields[2].asstring;
       memo4.text :=  qbusinarcot.fields[5].asstring;


      EDIT1.TEXT := floattostrf(strtofloat(edit9.text) + strtofloat(ieps.text) + strtofloat(edit10.text) - strtofloat(memo4.text), fffixed,10,2);

      if edit1.text = '0' then
            begin
                showmessage('REVISA TOTAL');
                EXIT;
            END;

       if edit1.text = '0.00' then
            begin
                showmessage('REVISA TOTAL');
                EXIT;
            END;



     //  tfolio.Text := busfolio.Text;

      agregaruno := 0;

     //aqui pongo los datas del cliente

     entrofolio := 0;

       QTIPO.Close;
    QTIPO.ParamByName('NUM_EMP').AsString:= NUM_EMPRESA.TEXT;
    QTIPO.Open;

    TIPOCONSULTA.ItemIndex := 0;

    codigocli.keyvalue:= qbusinarcot.fieldbyname('cod_cli').AsString;


      BANDE:= 0;
      QSUCUR.Close;


       qdeta.Close;
      qdeta.ParamByName('cod_cli').asstring := qbusinarcot.fieldbyname('cod_cli').AsString;
      qdeta.open;

      if qdeta.FieldByName('cod_cli').AsString = '' then
        begin
                TDIRE.Text:= QTIPO.FIELDBYNAME('DOM_CLI').AsString;
       end
        else
                tdire.Text:= 'CALLE '+qdeta.FieldByName('calle').AsString + '  NO. '+qdeta.FieldByName('num_ext').AsString+
                              '  NO. INT '+qdeta.FieldByName('num_int').AsString +
                               '  COL. '+ qdeta.FieldByName('colonia').AsString + ' CP. '+ qtipo.fieldbyname('cod_pos').asstring;;





      //voy a buscar el usocfdi

      cfdiuso.Close;
      cfdiuso.Open;

      qusocfdi.Close;
      qusocfdi.PARAMBYNAME('cod_cli').asstring := QTIPO.FIELDBYNAME('cod_CLI').AsString;
      qusocfdi.open;

      if qusocfdi.FIELDBYNAME('uso').asstring = '' then
      begin
           cod_uso := 'P01';
           uso_cfdi:= 'Por definir';
           pon_usocfdi.KeyValue := 'POR DEFINIR' ;
      end
      else
      begin
          cod_uso := qusocfdi.fieldbyname('uso').asstring ;
           uso_cfdi:= qusocfdi.fieldbyname('uso_cfdi').asstring ;
           pon_usocfdi.KeyValue := qusocfdi.fieldbyname('uso_cfdi').asstring ;

      end;


      //TDIRE.Text:= QTIPO.FIELDBYNAME('DOM_CLI').AsString;
      TRFC.Text:= QTIPO.FIELDBYNAME('RFC_CLI').AsString;
      trfc.Text := stripped('-',trfc.Text);
      cod_cli := qtipo.fieldbyname('cod_cli').AsString;
      nom_cli:=  qtipo.fieldbyname('RAZ_SOC').AsString;
      ciu_cli:= qtipo.fieldbyname('ciu_cli').AsString;
      est_cli:= qtipo.fieldbyname('est_cli').AsString;
      lim_cre:= qtipo.fieldbyname('lim_cre').asfloat;
      cod_pos:= qtipo.fieldbyname('cod_pos').asstring;
      pla_clie:= qtipo.fieldbyname('pla_cli').asstring;

      label17.Visible:= true;
      name.Visible:= true;
      label33.visible:= false;
      code.Visible:= false;


      name.Text:= nom_cli;

      //aqui reviso que tenga tipo pago

         qtipo_pago.Close;
     qtipo_pago.ParamByName('cod_cli').AsString := cod_cli;
     qtipo_pago.Open;


      if qtipo_pago.FieldByName('tipo_pago').AsString = '' then
     begin
           QCODIGOART.CLOSE;
          showmessage('Revisa cliente no tiene Tipo de Pago');
          exit;

    end;




        if qtipo_pago.FieldByName('tipo_pago').AsString = 'Efectivo' then
        begin
           if question('Este cliente esta Registrado como pago efectivo te va a pagar con Efectivo?') = true then
           begin


      qdebefac.Close;
      qdebefac.ParamByName('num_emp').AsString:= num_empresa.Text;
      qdebefac.ParamByName('cod_cli').asstring:= cod_cli;
      qdebefac.open;

    ACHI := 0;


    //  tot_debe.Text:= qdebefac.Fields[0].AsString;
       tot_debe.Text:= floattostrf( qdebefac.Fields[0].Asfloat,ffnumber, 10,2);



       if ya_puse_rfc = 0 then
              rfc_tmp := trfc.text;

      IF COD_CLI <> '9999' THEN
            BEGIN
              label6.Visible:= FALSE;
              alias.Visible:= FALSE;
           end;


      if (cod_cli = '9999') or (cod_cli ='5555') then
           begin
              label6.Visible:= true;
              alias.Visible:= true;
              alias.SetFocus;
           end;

           qsucur.Close;
           qsucur.ParamByName('cod_cli').asstring := cod_cli;
           qsucur.Open;


           if qsucur.FieldByName('sucursal').asstring = '' then
                bande:= 0
            else
                bande:= 1;


      if cod_cli ='O14L' then
        begin
          label37.Visible:= true;
          orden_compra.Visible:= true;
        end;





    IF BANDE= 0 THEN
     BEGIN
        QCODIGOART.CLOSE;
        qcodigoart.ParamByName('NUM_EMP').AsString:= FORM9.NUM_EMPRESA.TEXT;
        qcodigoart.OpeN;
        IF ALIAS.Visible = FALSE THEN
               CODIGOART.SetFocus;
      END;

      IF BANDE= 1 THEN
       BEGIN
           IF ALIAS.Visible = FALSE THEN
               CSUCURSAL.SetFocus;
       END;


          end
           else
            begin
                QCODIGOART.CLOSE;
                SHOWMESSAGE('REVISA TIPO PAGO EN MENU DE CLIENTES');
                EXIT
            end;
       end;

        if (qtipo_pago.FieldByName('tipo_pago').AsString <> 'Efectivo') AND (qtipo_pago.FieldByName('tipo_pago').AsString <> '') then
      begin



      qdebefac.Close;
      qdebefac.ParamByName('num_emp').AsString:= num_empresa.Text;
      qdebefac.ParamByName('cod_cli').asstring:= cod_cli;
      qdebefac.open;

       ACHI := 0;


    //  tot_debe.Text:= qdebefac.Fields[0].AsString;
       tot_debe.Text:= floattostrf( qdebefac.Fields[0].Asfloat,ffnumber, 10,2);



       if ya_puse_rfc = 0 then
              rfc_tmp := trfc.text;

      IF COD_CLI <> '9999' THEN
            BEGIN
              label6.Visible:= FALSE;
              alias.Visible:= FALSE;
           end;


      if (cod_cli = '9999') or (cod_cli ='5555') then
           begin
              label6.Visible:= true;
              alias.Visible:= true;
              alias.SetFocus;
           end;

           qsucur.Close;
           qsucur.ParamByName('cod_cli').asstring := cod_cli;
           qsucur.Open;


           if qsucur.FieldByName('sucursal').asstring = '' then
                bande:= 0
            else
                bande:= 1;


      if cod_cli ='O14L' then
        begin
          label37.Visible:= true;
          orden_compra.Visible:= true;
        end;



    IF BANDE= 0 THEN
     BEGIN
        QCODIGOART.CLOSE;
        qcodigoart.ParamByName('NUM_EMP').AsString:= FORM9.NUM_EMPRESA.TEXT;
        qcodigoart.OpeN;
        IF ALIAS.Visible = FALSE THEN
               CODIGOART.SetFocus;
      END;

      IF BANDE= 1 THEN
       BEGIN
           IF ALIAS.Visible = FALSE THEN
               CSUCURSAL.SetFocus;
       END;



      END;

    //terminamos de validar los datos




             {          qventas.Close;
                       qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                       qventas.ParamByName('folio').AsString:= qbusfoliocorte.fieldbyname('folio').asstring;;
                       qventas.Open;


                  while not qventas.Eof do
                  begin

                      inserta_ventas.params[0].AsString:= tfolio.Text;
                      inserta_ventas.params[1].AsString:= qventas.fieldbyname('descripcion').AsString;
                      inserta_ventas.params[2].AsString:= qventas.fieldbyname('codigo').AsString;
                      inserta_ventas.params[3].AsString:= qventas.fieldbyname('cajas').AsString;
                      inserta_ventas.params[4].AsString:= qventas.fieldbyname('kilos').AsString;
                      inserta_ventas.params[5].AsSTRING:= qventas.fieldbyname('precio').AsString;
                      inserta_ventas.params[6].AsSTRING:= qventas.fieldbyname('total').AsString;
                      inserta_ventas.params[7].AsString:= qventas.fieldbyname('nombre').AsString;
                      inserta_ventas.params[8].AsString:= qventas.fieldbyname('iva').AsString;
                      inserta_ventas.params[9].AsString:= qventas.fieldbyname('cos_pro').AsString;
                      inserta_ventas.params[10].AsSTRING:= qventas.fieldbyname('totiva').AsString;
                      inserta_ventas.params[11].AsINTEGER:= qventas.fieldbyname('renglon').Asinteger;
                      inserta_ventas.params[12].AsINTEGER:=qventas.fieldbyname('pagado').asinteger;;
                      inserta_ventas.params[13].AsString:= qventas.fieldbyname('rfc').AsString;
                      inserta_ventas.params[14].AsString:= qventas.fieldbyname('tipo').AsString;
                      inserta_ventas.params[15].AsString:= qventas.fieldbyname('lineaven').AsString;
                      inserta_ventas.params[16].Asstring:= qventas.fieldbyname('descto').AsString;
                      inserta_ventas.params[17].AsString:= qventas.fieldbyname('pedido').AsString;
                      inserta_ventas.params[18].AsString:= qventas.fieldbyname('observacion').AsString;
                      inserta_ventas.params[19].AsString:= qventas.fieldbyname('sucursal').AsString;
                      inserta_ventas.params[20].AsString:= qventas.fieldbyname('num_emp').AsString;
                      inserta_ventas.ExecProc;




                       qventas.next;

                  end;     }


                 //       reng:= reng + 1;
                 //      NUM_ARTICULOS:= NUM_ARTICULOS + 1;
                       agregaruno := 1;


                       qventas.Close;
                       qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                       qventas.ParamByName('folio').AsString:= sitienefolio;
                       qventas.Open;


                       PEDIDO_CAM := qventas.fieldbyname('pedido').asstring;
                       RFC_CAM := qventas.fieldbyname('rfc').asstring;

                       IF RFC_CAM = 'XAXX010101000' THEN
                            RFC_CAM :='VENTAS DE CONTADO';

                       NOMBRE_CAM:= qventas.fieldbyname('nombre').asstring;




                       cueqventas.Close;
                       cueqventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                       cueqventas.ParamByName('folio').AsString:=sitienefolio;
                       cueqventas.Open;

                       totart.text := cueqventas.fields[0].asstring;
                       num_articulos := strtoint(cueqventas.fields[0].asstring);
                       reng := strtoint(cueqventas.fields[0].asstring);


    END;


procedure TForm9.Edit3KeyPress(Sender: TObject; var Key: Char);
var
    rentab, alinear, ENTRO : integer;
    LETRA, totivatab, preciotab, ivatab: string;
    MIN, MAX, cantiempa, saco_canti: real;

begin
      ENTRO := 0;

      alinear := 0;
      IF KEY = (#13) THEN
      BEGIN

                       //REVISO LAS CANTIDADES PARA VER SI PUSIERON KGS Y CAJAS

                       qventas.Close;
                        qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                       qventas.ParamByName('folio').AsString:= EDIT3.TEXT;
                       qventas.Open;


                       While not qventas.eof do
                       begin

                            if (qventas.FieldByName('cajas').AsFloat <> 0) and (qventas.FieldByName('kilos').AsFloat <> 0) then
                            begin

                                    qcanemp.Close;
                                    qcanemp.ParamByName('cod_Art').asstring:= qventas.fieldbyname('codigo').AsString;
                                    qcanemp.ParamByName('num_emp').asstring:= '01';
                                    qcanemp.Open;
                                    cantiempa:= strtofloat(floattostrf(qcanemp.fields[6].asFLOAT, ffnumber, 10,2));


                                    saco_canti:= qventas.FieldByName('KILOS').AsFloat /  qventas.FieldByName('CAJAS').AsFloat;

                                    MIN := saco_canti-5;
                                    MAX := saco_canti+5;

                                    if (CANTIEMPA > MIN) AND (CANTIEMPA < MAX) then
                                           begin                                   
                                                ENTRO := 0;
                                           end
                                           ELSE
                                           BEGIN

                                              qbuserror.close;
                                              qbuserror.parambyname('folio').asstring :=  EDIT3.TEXT;
                                              qbuserror.parambyname('cod_art').asstring :=  qventas.fieldbyname('codigo').AsString;
                                              qbuserror.parambyname('can_kgs').asstring :=  qventas.fieldbyname('kilos').AsString;
                                              qbuserror.parambyname('total').asstring :=  qventas.fieldbyname('total').AsString;
                                              qbuserror.open;

                                              if qbuserror.fieldbyname('cod_art').asstring = '' then

                                               begin

                                                   AUTORIZA.Close;
                                                   AUTORIZA.Open;
                                                   AUTORIZA.AppendRecord([EDIT3.TEXT, qventas.fieldbyname('codigo').AsString, qventas.fieldbyname('KILOS').AsString, qventas.fieldbyname('CAJAS').AsString, qventas.fieldbyname('PRECIO').AsString,
                                                   qventas.fieldbyname('PRECIO').AsString, qventas.fieldbyname('TOTAL').AsString, COD_CLI , DATETOSTR(DATE), '0', FORM4.AGENTE1]);

                                                end;

                                               ENTRO := 0;

                                           END;


                            end;

                            IF ENTRO = 0 THEN
                                QVENTAS.NEXT;

                       end;



                     //AQUI VALIDO LOS CODIGOS QUE SE AUTORIZARON EN CAMBIO PRECIO

                     QBUSAUTO.CLOSE;
                     QBUSAUTO.PARAMBYNAME('FOLIO').ASSTRING := EDIT3.TEXT;
                     QBUSAUTO.OPEN;

                     IF QBUSAUTO.FIELDBYNAME('COD_aRT').ASSTRING <> '' THEN
                     BEGIN
                          FORM22.SHOWMODAL;
                     END;


                     INICIALIZA2;


             //        QVENTAS.RequestLive := TRUE;

                    renTAB := 1;

                   //  EDIT2.TEXT := 'TAB01';

                     qbusal.Close;
                     qbusal.parambyname('folio').AsString := edit3.text;
                     qbusal.Open;

                     //AQUI PONGO EL NUMERO DE SALIDA ALMACEN
                     LETRA:= COPY(QBUSAL.FIELDBYNAME('VENDEDOR').ASSTRING ,1,1);
                     EDIT2.TEXT := LETRA + QBUSAL.FIELDBYNAME('FOLIO').ASSTRING;
                     NUM_EMPRESA.KeyValue := QBUSAL.FIELDBYNAME('NUM_EMP').ASSTRING;


                     IF QBUSAL.FieldByName('FOLIO').ASSTRING = '' THEN
                     BEGIN
                            SHOWMESSAGE('NO ESTA EL FOLIO');
                            EXIT;
                     END;

                     IF QBUSAL.FieldByName('FOLIO_COL').ASSTRING <> '' THEN
                     BEGIN
                            SHOWMESSAGE('ESTE FOLIO YA SE MARCO CON ESTE # '+ QBUSAL.FieldByName('FOLIO_COL').ASSTRING );
                            EXIT;
                     END;


                     LETRA:= COPY(QBUSAL.FIELDBYNAME('VENDEDOR').ASSTRING ,1,1);

                     EDIT2.TEXT := LETRA + QBUSAL.FIELDBYNAME('FOLIO').ASSTRING;

                     NUM_EMPRESA.KeyValue := QBUSAL.FIELDBYNAME('NUM_EMP').ASSTRING;



             //aqui reviso que no tenga errores la informacion que viene de la tableta


         //         revisavtas;

                  IF ACTIVOSALIDA = 1 THEN
                        EXIT;


                      //hasta aqui se termina la revision de la informaicon de la tableta


   //  QVENTAS.RequestLive := FALSE;

     qtableta.close;
     qtableta.ParamByName('num_emp').asstring:= num_empresa.Text;
     qtableta.ParamByName('folio').AsString:= EDIT3.TEXT;
     qtableta.Open;


     IF qtableta.FieldByName('num_emp').asstring = '' THEN
        BEGIN
             qtableta.close;
             qtableta.ParamByName('num_emp').asstring:= '04';
             qtableta.ParamByName('folio').AsString:= EDIT3.TEXT;
             qtableta.Open;

             IF qtableta.FieldByName('num_emp').asstring <> '' THEN
             BEGIN
                showmessage('Este cliente es de la emp. 4');
                num_empresa.SetFocus;
                exit;
             END;

        END;




      busregimen.close;
      busregimen.parambyname('cod_cli').asstring:=  qtableta.fieldbyname('cod_cli').AsString;
      busregimen.open;


      if busregimen.fieldbyname('regimen').asstring = '' then
      begin
          showmessage('REVISA REGIMEN CLIENTE');
           NOMBRE.KeyValue := NULL;
           CODIGOCLI.KeyValue := NULL;
           TDIRE.Text := '';
          TRFC.Text := '';
          CODE.Text := '';
          NAME.Text := '';
          NOMBRE_CLI.Text := '';
          PON_USOCFDI.KEYVALUE := NULL;
        //  EDIT3.TEXT := '';
       //    EXIT;
      end
      else
          regimen_cli := busregimen.fieldbyname('regimen').asstring;



                      //PRIMERO LO AGREGO A VENTAS





                   {  qdetab.close;
                     qdetab.parambyname('folio').AsString := edit3.text;
                     qdetab.Open;

                     while not qdetab.eof do
                     begin


                      inserta_ventas.params[0].AsString:= qdetab.fieldbyname('folio').AsString;
                      inserta_ventas.params[1].AsString:= qdetab.fieldbyname('des_Art').AsString;
                      inserta_ventas.params[2].AsString:= qdetab.fieldbyname('cod_art').AsString;
                      inserta_ventas.params[3].AsString:= qdetab.fieldbyname('cajas').AsString;
                      inserta_ventas.params[4].AsString:= qdetab.fieldbyname('kgs').AsString;

                      if qdetab.fieldbyname('kgs').AsString <> '0' then
                                            preciotab := floattostrf((qdetab.fieldbyname('TOTAL').Asfloat / qdetab.fieldbyname('KGS').Asfloat), fffixed, 10,2);


                      inserta_ventas.params[5].AsSTRING:= preciotab;
                      inserta_ventas.params[6].AsSTRING:= qdetab.fieldbyname('total').AsString;
                      inserta_ventas.params[7].AsString:= qbusal.fieldbyname('vendedor').AsString;;

                      if qdetab.FieldByName('iva').AsString <> '0' then
                          begin
                                 totiVAtab:= FLOATTOSTRF(qdetab.FieldByName('total').Asfloat * 0.16,FFNUMBER,10,2);
                                 totivatab:= stripped (',', totivatab);
                                // totiva:= strtofloat(totiva);
                                 ivatab:= '16';
                          end
                             else
                              begin
                                ivatab := '0';
                                 totivatab := '0';
                              end;

                      inserta_ventas.params[8].AsString:= ivatab;
                      inserta_ventas.params[9].AsString:= '0';
                      inserta_ventas.params[10].AsSTRING:= totivatab;
                      inserta_ventas.params[11].AsINTEGER:= RENtab;
                      inserta_ventas.params[12].AsINTEGER:= 1;
                      inserta_ventas.params[13].AsString:= qbusal.fieldbyname('rfc').AsString;
                      inserta_ventas.params[14].AsString:= qdetab.fieldbyname('tip_art').AsString;
                      inserta_ventas.params[15].AsString:= qdetab.fieldbyname('lin_ven').AsString;
                      inserta_ventas.params[16].Asstring:= '0';
                      inserta_ventas.params[17].AsString:= qdetab.fieldbyname('folio').AsString;
                      inserta_ventas.params[18].AsString:= qdetab.fieldbyname('observa').AsString;
                      inserta_ventas.params[19].AsString:= '';
                      inserta_ventas.params[20].AsString:= '01';
                      inserta_ventas.ExecProc;


                          rentab:= rentab + 1;

                          qdetab.next;


                  end;   }




                       qventas.Close;
                        qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                       qventas.ParamByName('folio').AsString:= EDIT3.TEXT;
                       qventas.Open;

                       nombre_table:= QVENTAS.FIELDBYNAME('NOMBRE').ASSTRING;

                       if qventas.fieldbyname('num_emp').asstring = '' then
                       begin

                              qtableta2.close;
                              qtableta2.ParamByName('num_emp').asstring:= num_empresa.Text;
                              qtableta2.ParamByName('folio').AsString:= EDIT3.TEXT;
                              qtableta2.Open;

                              qventas.close;
                              qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                              qventas.ParamByName('folio').AsString:= qtableta2.fieldbyname('folio_col').asstring;
                              qventas.Open;


                              alinear := 1;
                       end;

                       if alinear = 0 then
                            sitienefolio := qventas.fieldbyname('folio').asstring
                            else
                            sitienefolio := qtableta2.fieldbyname('folio_col').asstring;



                       qtableta.close;
                       qtableta.ParamByName('num_emp').asstring:= num_empresa.Text;
                       qtableta.ParamByName('folio').AsString:= EDIT3.TEXT;
                       qtableta.Open;


                       if qventas.FieldByName('pagado').Asinteger = 0 then
                                      tipo_fac.ItemIndex := 0
                                   else
                                      tipo_fac.ItemIndex := 1;


                       edit9.text := qtableta.fieldbyname('subtotal').AsString;
                       ieps.text :=  '0';
                       edit10.text :=  qtableta.fieldbyname('iva').AsString;
                       memo4.text :=  '0';


                       EDIT1.TEXT := qtableta.fieldbyname('total').AsString;

                       MEMO1.Text := EDIT1.Text;


                        if edit1.text = '0' then
                           begin
                              showmessage('REVISA TOTAL');
                              EXIT;
                            END;

                       if edit1.text = '0.00' then
                          begin
                             showmessage('REVISA TOTAL');
                             EXIT;
                          END;


                       agregaruno := 0;
                       entrofolio := 0;

                       QTIPO.Close;
                       QTIPO.ParamByName('NUM_EMP').AsString:= NUM_EMPRESA.TEXT;
                       QTIPO.Open;





                //       TIPO_FAC.ItemIndex := 1;

                       TIPO_PAGO.ItemIndex := 1;

                       TIPOCONSULTA.ITEMINDEX:= 0;


                       codigocli.keyvalue:=  qtableta.fieldbyname('cod_cli').AsString;



                      BANDE:= 0;
                      QSUCUR.Close;



                      qdeta.Close;
                      qdeta.ParamByName('cod_cli').asstring := qtableta.fieldbyname('cod_cli').AsString;
                      qdeta.open;


                     if qdeta.FieldByName('cod_cli').AsString = '' then
                        begin
                             TDIRE.Text:= QTIPO.FIELDBYNAME('DOM_CLI').AsString;
                        end
                     else
                             tdire.Text:= 'CALLE '+qdeta.FieldByName('calle').AsString + '  NO. '+qdeta.FieldByName('num_ext').AsString+
                              '  NO. INT '+qdeta.FieldByName('num_int').AsString +
                               '  COL. '+ qdeta.FieldByName('colonia').AsString + ' CP. '+ qtipo.fieldbyname('cod_pos').asstring;;



                      cfdiuso.Close;
      cfdiuso.Open;

      qusocfdi.Close;
      qusocfdi.PARAMBYNAME('cod_cli').asstring := qtableta.fieldbyname('cod_cli').AsString;
      qusocfdi.open;

      if qusocfdi.FIELDBYNAME('uso').asstring = '' then
      begin
           cod_uso := 'P01';
           uso_cfdi:= 'Por definir';
           pon_usocfdi.KeyValue := 'POR DEFINIR' ;
      end
      else
      begin
          cod_uso := qusocfdi.fieldbyname('uso').asstring ;
           uso_cfdi:= qusocfdi.fieldbyname('uso_cfdi').asstring ;
           pon_usocfdi.KeyValue := qusocfdi.fieldbyname('uso_cfdi').asstring ;

      end;



      //TDIRE.Text:= QTIPO.FIELDBYNAME('DOM_CLI').AsString;
      TRFC.Text:= QTIPO.FIELDBYNAME('RFC_CLI').AsString;
      trfc.Text := stripped('-',trfc.Text);
      cod_cli := qtipo.fieldbyname('cod_cli').AsString;
      nom_cli:=  qtipo.fieldbyname('RAZ_SOC').AsString;
      ciu_cli:= qtipo.fieldbyname('ciu_cli').AsString;
      est_cli:= qtipo.fieldbyname('est_cli').AsString;
      lim_cre:= qtipo.fieldbyname('lim_cre').asfloat;
      cod_pos:= qtipo.fieldbyname('cod_pos').asstring;
      pla_clie:= qtipo.fieldbyname('pla_cli').asstring;



        label17.Visible:= true;
      name.Visible:= true;
      label33.visible:= false;
      code.Visible:= false;


      name.Text:= nom_cli;

       qtipo_pago.Close;
     qtipo_pago.ParamByName('cod_cli').AsString := cod_cli;
     qtipo_pago.Open;


      if qtipo_pago.FieldByName('tipo_pago').AsString = '' then
     begin
           QCODIGOART.CLOSE;
          showmessage('Revisa cliente no tiene Tipo de Pago');
          exit;

    end;

        if qtipo_pago.FieldByName('tipo_pago').AsString = 'Efectivo' then
        begin
           if question('Este cliente esta Registrado como pago efectivo te va a pagar con Efectivo?') = true then
           begin


      qdebefac.Close;
      qdebefac.ParamByName('num_emp').AsString:= num_empresa.Text;
      qdebefac.ParamByName('cod_cli').asstring:= cod_cli;
      qdebefac.open;

    ACHI := 0;


    //  tot_debe.Text:= qdebefac.Fields[0].AsString;
       tot_debe.Text:= floattostrf( qdebefac.Fields[0].Asfloat,ffnumber, 10,2);



       if ya_puse_rfc = 0 then
              rfc_tmp := trfc.text;

      IF COD_CLI <> '9999' THEN
            BEGIN
              label6.Visible:= FALSE;
              alias.Visible:= FALSE;
           end;


      if (cod_cli = '9999') or (cod_cli ='5555') then
           begin
              label6.Visible:= true;
              alias.Visible:= true;
              alias.SetFocus;
           end;

           qsucur.Close;
           qsucur.ParamByName('cod_cli').asstring := cod_cli;
           qsucur.Open;


           if qsucur.FieldByName('sucursal').asstring = '' then
                bande:= 0
            else
                bande:= 1;


      if cod_cli ='O14L' then
        begin
          label37.Visible:= true;
          orden_compra.Visible:= true;
        end;





    IF BANDE= 0 THEN
     BEGIN
        QCODIGOART.CLOSE;
        qcodigoart.ParamByName('NUM_EMP').AsString:= FORM9.NUM_EMPRESA.TEXT;
        qcodigoart.OpeN;
        IF ALIAS.Visible = FALSE THEN
               CODIGOART.SetFocus;
      END;

      IF BANDE= 1 THEN
       BEGIN
           IF ALIAS.Visible = FALSE THEN
               CSUCURSAL.SetFocus;
       END;


          end
           else
            begin
                QCODIGOART.CLOSE;
                SHOWMESSAGE('REVISA TIPO PAGO EN MENU DE CLIENTES');
                EXIT
            end;
       end;

        if (qtipo_pago.FieldByName('tipo_pago').AsString <> 'Efectivo') AND (qtipo_pago.FieldByName('tipo_pago').AsString <> '') then
      begin



      qdebefac.Close;
      qdebefac.ParamByName('num_emp').AsString:= num_empresa.Text;
      qdebefac.ParamByName('cod_cli').asstring:= cod_cli;
      qdebefac.open;

       ACHI := 0;

       tot_debe.Text:= floattostrf( qdebefac.Fields[0].Asfloat,ffnumber, 10,2);



       if ya_puse_rfc = 0 then
              rfc_tmp := trfc.text;

      IF COD_CLI <> '9999' THEN
            BEGIN
              label6.Visible:= FALSE;
              alias.Visible:= FALSE;
           end;


      if (cod_cli = '9999') or (cod_cli ='5555') then
           begin
              label6.Visible:= true;
              alias.Visible:= true;
              alias.SetFocus;
           end;





            {
                            totart.Text:= inttostr(NUM_ARTICULOS);

                       SIKEDO := 0;

                       DESCRIPART.Text:= '';
                       CAJ_PRO.Text:= '';
                       KIL_PRO.Text:= '';
                       PRE_PRO.Text:= '';
                    //   OBSERVA.Text:= '';

                       pre_pro.ReadOnly:= false;
                       CODIGOART.SetFocus;



                       YA_PUSE_RFC := 1;
                       TOT:= STRTOFLOAT(MEMO1.Text);   }



      END;

                       agregaruno := 1;


                       qventas.Close;
                      qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                       qventas.ParamByName('folio').AsString:= sitienefolio;
                       qventas.Open;


                       //CAMBIO EL NOMBRE PARA QUE APAREZCA EL QUE LA COBRO

                       UPCAMNOMVTAS.CLOSE;
                       UPCAMNOMVTAS.PARAMBYNAME('NOMBRE').ASSTRING := FORM4.AGENTE1;
                       UPCAMNOMVTAS.PARAMBYNAME('FOLIO').ASSTRING :=  SITIENEFOLIO;
                       UPCAMNOMVTAS.EXECSQL;




                       PEDIDO_CAM := qventas.fieldbyname('pedido').asstring;
                       RFC_CAM := qventas.fieldbyname('rfc').asstring;
                       NOMBRE_CAM:= qventas.fieldbyname('nombre').asstring;




                       cueqventas.Close;
                       cueqventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                       cueqventas.ParamByName('folio').AsString:=sitienefolio;
                       cueqventas.Open;

                       totart.text := cueqventas.fields[0].asstring;
                       num_articulos := strtoint(cueqventas.fields[0].asstring);
                       reng := strtoint(cueqventas.fields[0].asstring);
                       TOT:= STRTOFLOAT(MEMO1.Text);

                       SITIENEFOLIO := TFOLIO.Text;


                       SUBTOTAL := STRTOFLOAT(edit9.Text); // := floattostrf(subtotal,ffnumber,10,2);
                       IVATOTAL := STRTOFLOAT(edit10.text); // := floattostrf(ivatotal,ffnumber,10,2);
                       TOTAL_FIN := STRTOFLOAT(edit1.Text); // := floattostrf(total_fin,ffnumber,10,2);
                       IEPSTOTAL := STRTOFLOAT(ieps.text);  //:= floattostrf(iepstotal,ffnumber,10,2);
                       ACUDES := STRTOFLOAT(MEMO4.TEXT); //:= floattostrf(ACUDES,ffnumber,10,2);

                       NUM_ARTICULOS := STRTOINT(totart.Text);


                       IF ALIAS.Text = '' THEN
                              ALIAS.TEXT := 'PUBLICO GRAL';

                    QVENTAS.RequestLive := TRUE;

    end;



 end;


procedure tform9.revisavtas;
var
PRECIO, can_cajas, CAJCOSPROmin, CAJCOSPROmax,kgscospromin, kgscospromax, PRECIOKG, cajasconve, precio_vta, por_emp, caj_tot, kil_tot: real;
min,max: string;
ESTABIENPRECIO : INTEGER;

begin

                      ESTABIENPRECIO:= 0;

                       ACTIVOSALIDA := 0;
                       qventas.Close;
                       qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                       qventas.ParamByName('folio').AsString:= EDIT3.TEXT;
                       qventas.Open;


	      	       while not qventas.eof do
                 begin



                       QCODIGO.close;
                       QCODIGO.parambyname('cod_art').AsString:= qventas.fieldbyname('codigo').asstring;
                       qcodigo.parambyname('num_Emp').asstring:= num_empresa.text;
                       QCODIGO.Open;



                 if(strtofloat(qventas.fieldbyname('cajas').asstring) <> 0) and (strtofloat(qventas.fieldbyname('kilos').asstring) <> 0) then
                 begin
                 por_emp := (strtofloat(qventas.fieldbyname('kilos').asstring)) / (strtofloat(qventas.fieldbyname('cajas').asstring));

                if ((por_emp) < strtofloat(qcodigo.FieldByName('min_emp').asstring)) or ((por_emp) > strtofloat(qcodigo.FieldByName('mAX_emp').AsString)) then
                          begin

                              FORM12.boton1.caption:= 'Revisa KGs o CAJ';
                              FORM12.showmodal;
                              showmessage('El Minimo Empaque es: '+ qcodigo.FieldByName('min_emp').asstring+'el Maximo es: '+qcodigo.FieldByName('max_emp').asstring);
                              SHOWMESSAGE('El codigo que esta mal es: '+ qventas.fieldbyname('codigo').asstring);
                            ACTIVOSALIDA := 1;
                     //       exit;
                           end;


                 IF strtofloat(qcodigo.fieldbyname('cos_pro_kgs').asstring) = 0 THEN
                      BEGIN
                          SHOWMESSAGE('REVISA EL COSTO PROMEDIO');
                          SHOWMESSAGE('El codigo que esta mal es: '+ qventas.fieldbyname('codigo').asstring);
                          ACTIVOSALIDA := 1;
                   //       EXIT;
                      END;

                  END;


                  if qventas.fieldbyname('PRECIO').asFLOAT  < 100 then
                  begin

                  MIN:= floattostrf(qventas.fieldbyname('PRECIO').asFLOAT - 30, fffixed, 10,2);
                  MAX:= floattostrf(qventas.fieldbyname('PRECIO').asfloat + 30, fffixed, 10,2);

                  end
                  else
                  begin

                  MIN:= floattostrf(qventas.fieldbyname('PRECIO').asFLOAT - 200, fffixed, 10,2);
                  MAX:= floattostrf(qventas.fieldbyname('PRECIO').asfloat + 200, fffixed, 10,2);

                  end;


                  if(strtofloat(qventas.fieldbyname('cajas').asstring) <> 0) and (strtofloat(qventas.fieldbyname('kilos').asstring) <> 0) then
                       BEGIN

                               PRECIO := QCODIGO.FIELDBYNAME('COS_PRO_KGS').ASfloat;


                               if  (PRECIO > strtofloat(min)) and  (PRECIO < strtofloat(max)) then
                                begin
                                    ESTABIENPRECIO:= 1;
                             //       BREAK;
                                end;



                              PRECIO := QCODIGO.FIELDBYNAME('COS_PRO_cAJ').ASfloat;

                               if  (PRECIO > strtofloat(min)) and  (PRECIO < strtofloat(max)) then
                                begin
                                    ESTABIENPRECIO:= 1;
                             //       BREAK;
                                end;
                       END;


                      if(strtofloat(qventas.fieldbyname('cajas').asstring) <> 0) and (strtofloat(qventas.fieldbyname('kilos').asstring) = 0) then
                       BEGIN
                            PRECIO := QCODIGO.FIELDBYNAME('COS_PRO_CAJ').Asfloat;

                               if  (PRECIO > strtofloat(min)) and  (PRECIO < strtofloat(max)) then
                                begin
                                    ESTABIENPRECIO:= 1;
                               //     BREAK;
                                end;


                       END;



                    if(strtofloat(qventas.fieldbyname('cajas').asstring) = 0) and (strtofloat(qventas.fieldbyname('kilos').asstring) <> 0) then
                       BEGIN
                            PRECIO := QCODIGO.FIELDBYNAME('COS_PRO_KGS').ASfloat;

                               if  (PRECIO > strtofloat(min)) and  (PRECIO < strtofloat(max)) then
                                begin
                                    ESTABIENPRECIO:= 1;
                               //     BREAK;
                                end;

                       END;


                {    IF ESTABIENPRECIO = 0 THEN
                       BEGIN
                          //SACO POR SI HAY DIFERENCIA ENTRE LOS PRECIOS Y SI ES MENOS DE 5 LO PASO



                          IF PRECIO > STRTOFLOAT(MIN) THEN
                                BEGIN
                                       IF STRTOFLOAT(MIN) < 0 THEN
                                              MIN:= '0';

                                       IF (PRECIO -(STRTOFLOAT(MIN)) < 5) OR  (PRECIO - (STRTOFLOAT(MAX)) < 5) THEN
                                                  ESTABIENPRECIO:= 1;

                                END
                                ELSE
                                BEGIN
                                       IF ((STRTOFLOAT(MIN) - PRECIO) < 5) OR ((STRTOFLOAT(MAX) - PRECIO) < 5) THEN
                                                  ESTABIENPRECIO:= 1;

                                END;




                       END;  }


                    IF ESTABIENPRECIO = 0 THEN
                       BEGIN
                          SHOWMESSAGE('REVISA EL PRECIO');
                          SHOWMESSAGE('El Precio que esta mal es: '+ qventas.fieldbyname('codigo').asstring);
                      //    SHOWMESSAGE('El Precio debe estar entre: '+ MIN + ' y ' + MAX);
                          ACTIVOSALIDA := 1;
                      //    EXIT;

                       END;

                      ESTABIENPRECIO:= 0;

                      QVENTAS.NEXT;

              END;



end;


procedure TForm9.sKeyPress(Sender: TObject; var Key: Char);
var
       num_corre, tip_artb, canti_kgsb, canti_cajb, preciob, totalb, ivab, renb, cod_artb, iva_totb: string;
       rengral: integer;
begin
      IF KEY = #13 THEN
   BEGIN

       RENGRAL:=  QVENTAS.FIELDBYNAME('renglon').Asinteger;


      tip_artb:= QVENTAS.FIELDBYNAME('TIPO').AsString ;   //KGS
      canti_kgsb:= s.fields[3].asstring;   //CAJ
      canti_cajb:= s.fields[2].asstring;   //PRE_KGS
      preciob:= s.fields[4].asstring;     //PRE CAJ
     // pre_cajb:=dbgrid4.fields[5].asstring;
      totalb := s.fields[5].asstring;
      ivab := QVENTAS.FIELDBYNAME('IVA').AsString;
      renb := QVENTAS.FIELDBYNAME('renglon').AsString;
      cod_artb :=  s.fields[0].asstring;


                  qcanemp.Close;
                  qcanemp.ParamByName('cod_Art').asstring:= COD_ARTB;
                  qcanemp.ParamByName('num_emp').asstring:= '01';
                  qcanemp.Open;


       if tip_artb ='K' THEN
                BEGIN
                    TOTALb:= floattostrf((STRTOFLOAT(CANTI_KGSb) * STRTOFLOAT(PREciob)),ffnumber,10,6);
                    totalb := stripped(',',totalb);
               //     MULTI := CANTI_KGS;
                END;

               if (tip_artb ='C' ) AND (STRTOFLOAT(CANTI_CAJb) = 0 ) THEN
                BEGIN
                     TOTALb:= floattostrf((STRTOFLOAT(CANTI_KGSb) * STRTOFLOAT(PREciob)),ffnumber,10,6);
                    totalb := stripped(',',totalb);
                 //   MULTI := CANTI_KGS;
                END;


              if (tip_artb ='C') AND (STRTOFLOAT(CANTI_CAJb) <> 0)  THEN
                BEGIN
                    TOTALb:= floattostrf((STRTOFLOAT(CANTI_CAJb) * STRTOFLOAT(PREciob)),ffnumber,10,6);
                    totalb := stripped(',',totalb);
                //    MULTI := CANTI_CAJ;
                END;


              if (tip_artb ='C') and (STRTOFLOAT(CANTI_KGSb) <> 0) then
               begin
                    TOTALb:= floattostrf((STRTOFLOAT(CANTI_KGSb) * STRTOFLOAT(PREciob)),ffnumber,10,6);
                    totalb := stripped(',',totalb);
                //   MULTI := CANTI_KGS;
               end;


               if  totalb = '0.000000' then
                begin
                     TOTALb:= floattostrf((STRTOFLOAT(CANTI_CAJb) * STRTOFLOAT(PREciob)),ffnumber,10,6);
                    totalb := stripped(',',totalb);
                end;


               if ivab   <> '0' then
                    begin
                      iva_totb := floattostrf(strtofloat(totalb)* 0.16, fffixed, 10,2);
                      iva_totb := stripped(',', iva_totb);
                      IVA:= 16;
                    end
                    else
                     begin
                      iva_totb := '0';
                      IVA:= 0; 
                     end;

            

               if qcanemp.FieldByName('can_emp').AsString = '1' then
                  begin
                      if canti_kgsb <> canti_cajb then

                          IF CANTI_KGSB <> '0' THEN
                            canti_cajb := canti_kgsb
                           ELSE
                            CANTI_KGSB := CANTI_CAJB;



                  end;


               if (EDIT3.TEXT = '0') OR  (EDIT3.text = '') then
                      num_corre :=   TFOLIO.TEXT
                   else
                      num_corre :=  EDIT3.TEXT;



               upventas.CLOSE;
               upventas.parambyname('total').AsString := totalb;
               upventas.parambyname('totiva').AsString := iva_totb;
               upventas.parambyname('ren').AsString := renb;
               upventas.parambyname('cod_Art').AsString := cod_artb;
               upventas.parambyname('folio').AsString := num_corre;
               upventas.parambyname('KGS').AsString := CANTI_KGSB;
               upventas.parambyname('CAJAS').AsString := CANTI_CAJB;
               upventas.parambyname('PRECIO').AsString := preciob;
               upventas.parambyname('iva').AsString := inttostr(iva);
               upventas.ExecSQL;


                //SACO EL TOTAL PARA QUE SE PONGA EN TABLETA....


                qsumvtas.close;
                qsumvtas.parambyname('folio').asstring := num_corre;
                qsumvtas.open;


                uptableta.close;
                uptableta.ParamByName('subtotal').AsString := qsumvtas.Fields[0].AsString;
                uptableta.ParamByName('iva').AsString := qsumvtas.Fields[1].AsString;
                uptableta.ParamByName('total').AsString := qsumvtas.Fields[2].AsString;
                uptableta.ParamByName('FOLIO').AsString := num_corre;
                uptableta.ExecSQL;



            //    sacatotal;

               qventas.Close;
                qventas.ParamByName('num_emp').asstring:= '01';
               qventas.ParamByName('folio').AsString:= num_corre;
               qventas.Open;



      {           if (FACTU.text = '0') OR  (FACTU.text = '') then
                      SITIENEFOLIO :=   edit3.text
                   else
                      SITIENEFOLIO := TFOLIO.Text;   }

            //      SITIENEFOLIO := TFOLIO.Text;

                      EDIT9.TEXT := QSUMVTAS.FIELDS[0].ASSTRING;
                      EDIT10.TEXT := QSUMVTAS.FIELDS[1].ASSTRING;
                      EDIT1.TEXT := QSUMVTAS.FIELDS[2].ASSTRING;
                      IEPS.TEXT := '0';
                      MEMO4.TEXT:= '0';
                      MEMO1.TEXT := EDIT1.TEXT;


                       SUBTOTAL := STRTOFLOAT(edit9.Text); // := floattostrf(subtotal,ffnumber,10,2);
                       IVATOTAL := STRTOFLOAT(edit10.text); // := floattostrf(ivatotal,ffnumber,10,2);
                       TOTAL_FIN := STRTOFLOAT(edit1.Text); // := floattostrf(total_fin,ffnumber,10,2);
                       IEPSTOTAL := STRTOFLOAT(ieps.text);  //:= floattostrf(iepstotal,ffnumber,10,2);
                       ACUDES := STRTOFLOAT(MEMO4.TEXT); //:= floattostrf(ACUDES,ffnumber,10,2);

                       NUM_ARTICULOS := STRTOINT(totart.Text);


                       IF ALIAS.Text = '' THEN
                              ALIAS.TEXT := 'PUBLICO GRAL';





  end;
end;

procedure TForm9.BitBtn4Click(Sender: TObject);
var
     rentab, alinear: integer;
    totivatab, preciotab, ivatab: string;
begin
    if question ('Estas seguro pasar ticket')= true then
    begin

   //  QVENTAS.RequestLive := FALSE;
    
     qtableta.close;
     qtableta.ParamByName('num_emp').asstring:= num_empresa.Text;
     qtableta.ParamByName('folio').AsString:= EDIT3.TEXT;
     qtableta.Open;


     IF qtableta.FieldByName('num_emp').asstring = '' THEN
        BEGIN
             qtableta.close;
             qtableta.ParamByName('num_emp').asstring:= '04';
             qtableta.ParamByName('folio').AsString:= EDIT3.TEXT;
             qtableta.Open;

             IF qtableta.FieldByName('num_emp').asstring <> '' THEN
             BEGIN
                showmessage('Este cliente es de la emp. 4');
                num_empresa.SetFocus;
                exit;
             END;

        END;




      busregimen.close;
      busregimen.parambyname('cod_cli').asstring:=  qtableta.fieldbyname('cod_cli').AsString;
      busregimen.open;


      if busregimen.fieldbyname('regimen').asstring = '' then
      begin
          showmessage('REVISA REGIMEN CLIENTE');
           NOMBRE.KeyValue := NULL;
           CODIGOCLI.KeyValue := NULL;
           TDIRE.Text := '';
          TRFC.Text := '';
          CODE.Text := '';
          NAME.Text := '';
          NOMBRE_CLI.Text := '';
          PON_USOCFDI.KEYVALUE := NULL;
        //  EDIT3.TEXT := '';
       //    EXIT;
      end
      else
          regimen_cli := busregimen.fieldbyname('regimen').asstring;



                      //PRIMERO LO AGREGO A VENTAS





                   {  qdetab.close;
                     qdetab.parambyname('folio').AsString := edit3.text;
                     qdetab.Open;

                     while not qdetab.eof do
                     begin


                      inserta_ventas.params[0].AsString:= qdetab.fieldbyname('folio').AsString;
                      inserta_ventas.params[1].AsString:= qdetab.fieldbyname('des_Art').AsString;
                      inserta_ventas.params[2].AsString:= qdetab.fieldbyname('cod_art').AsString;
                      inserta_ventas.params[3].AsString:= qdetab.fieldbyname('cajas').AsString;
                      inserta_ventas.params[4].AsString:= qdetab.fieldbyname('kgs').AsString;

                      if qdetab.fieldbyname('kgs').AsString <> '0' then
                                            preciotab := floattostrf((qdetab.fieldbyname('TOTAL').Asfloat / qdetab.fieldbyname('KGS').Asfloat), fffixed, 10,2);


                      inserta_ventas.params[5].AsSTRING:= preciotab;
                      inserta_ventas.params[6].AsSTRING:= qdetab.fieldbyname('total').AsString;
                      inserta_ventas.params[7].AsString:= qbusal.fieldbyname('vendedor').AsString;;

                      if qdetab.FieldByName('iva').AsString <> '0' then
                          begin
                                 totiVAtab:= FLOATTOSTRF(qdetab.FieldByName('total').Asfloat * 0.16,FFNUMBER,10,2);
                                 totivatab:= stripped (',', totivatab);
                                // totiva:= strtofloat(totiva);
                                 ivatab:= '16';
                          end
                             else
                              begin
                                ivatab := '0';
                                 totivatab := '0';
                              end;

                      inserta_ventas.params[8].AsString:= ivatab;
                      inserta_ventas.params[9].AsString:= '0';
                      inserta_ventas.params[10].AsSTRING:= totivatab;
                      inserta_ventas.params[11].AsINTEGER:= RENtab;
                      inserta_ventas.params[12].AsINTEGER:= 1;
                      inserta_ventas.params[13].AsString:= qbusal.fieldbyname('rfc').AsString;
                      inserta_ventas.params[14].AsString:= qdetab.fieldbyname('tip_art').AsString;
                      inserta_ventas.params[15].AsString:= qdetab.fieldbyname('lin_ven').AsString;
                      inserta_ventas.params[16].Asstring:= '0';
                      inserta_ventas.params[17].AsString:= qdetab.fieldbyname('folio').AsString;
                      inserta_ventas.params[18].AsString:= qdetab.fieldbyname('observa').AsString;
                      inserta_ventas.params[19].AsString:= '';
                      inserta_ventas.params[20].AsString:= '01';
                      inserta_ventas.ExecProc;


                          rentab:= rentab + 1;

                          qdetab.next;


                  end;   }




                       qventas.Close;
                     qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                       qventas.ParamByName('folio').AsString:= EDIT3.TEXT;
                       qventas.Open;

                       nombre_table:= QVENTAS.FIELDBYNAME('NOMBRE').ASSTRING;

                       if qventas.fieldbyname('num_emp').asstring = '' then
                       begin

                              qtableta2.close;
                              qtableta2.ParamByName('num_emp').asstring:= num_empresa.Text;
                              qtableta2.ParamByName('folio').AsString:= EDIT3.TEXT;
                              qtableta2.Open;

                              qventas.close;
                             qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                              qventas.ParamByName('folio').AsString:= qtableta2.fieldbyname('folio_col').asstring;
                              qventas.Open;


                              alinear := 1;
                       end;

                       if alinear = 0 then
                            sitienefolio := qventas.fieldbyname('folio').asstring
                            else
                            sitienefolio := qtableta2.fieldbyname('folio_col').asstring;



                       qtableta.close;
                       qtableta.ParamByName('num_emp').asstring:= num_empresa.Text;
                       qtableta.ParamByName('folio').AsString:= EDIT3.TEXT;
                       qtableta.Open;


                       if qventas.FieldByName('pagado').Asinteger = 0 then
                                      tipo_fac.ItemIndex := 0
                                   else
                                      tipo_fac.ItemIndex := 1;


                       edit9.text := qtableta.fieldbyname('subtotal').AsString;
                       ieps.text :=  '0';
                       edit10.text :=  qtableta.fieldbyname('iva').AsString;
                       memo4.text :=  '0';


                       EDIT1.TEXT := qtableta.fieldbyname('total').AsString;

                       MEMO1.Text := EDIT1.Text;


                        if edit1.text = '0' then
                           begin
                              showmessage('REVISA TOTAL');
                              EXIT;
                            END;

                       if edit1.text = '0.00' then
                          begin
                             showmessage('REVISA TOTAL');
                             EXIT;
                          END;


                       agregaruno := 0;
                       entrofolio := 0;

                       QTIPO.Close;
                       QTIPO.ParamByName('NUM_EMP').AsString:= NUM_EMPRESA.TEXT;
                       QTIPO.Open;





                //       TIPO_FAC.ItemIndex := 1;

                       TIPO_PAGO.ItemIndex := 1;

                       TIPOCONSULTA.ITEMINDEX:= 0;


                       codigocli.keyvalue:=  qtableta.fieldbyname('cod_cli').AsString;



                      BANDE:= 0;
                      QSUCUR.Close;



                      qdeta.Close;
                      qdeta.ParamByName('cod_cli').asstring := qtableta.fieldbyname('cod_cli').AsString;
                      qdeta.open;


                     if qdeta.FieldByName('cod_cli').AsString = '' then
                        begin
                             TDIRE.Text:= QTIPO.FIELDBYNAME('DOM_CLI').AsString;
                        end
                     else
                             tdire.Text:= 'CALLE '+qdeta.FieldByName('calle').AsString + '  NO. '+qdeta.FieldByName('num_ext').AsString+
                              '  NO. INT '+qdeta.FieldByName('num_int').AsString +
                               '  COL. '+ qdeta.FieldByName('colonia').AsString + ' CP. '+ qtipo.fieldbyname('cod_pos').asstring;;



                      cfdiuso.Close;
      cfdiuso.Open;

      qusocfdi.Close;
      qusocfdi.PARAMBYNAME('cod_cli').asstring := qtableta.fieldbyname('cod_cli').AsString;
      qusocfdi.open;

      if qusocfdi.FIELDBYNAME('uso').asstring = '' then
      begin
           cod_uso := 'P01';
           uso_cfdi:= 'Por definir';
           pon_usocfdi.KeyValue := 'POR DEFINIR' ;
      end
      else
      begin
          cod_uso := qusocfdi.fieldbyname('uso').asstring ;
           uso_cfdi:= qusocfdi.fieldbyname('uso_cfdi').asstring ;
           pon_usocfdi.KeyValue := qusocfdi.fieldbyname('uso_cfdi').asstring ;

      end;



      //TDIRE.Text:= QTIPO.FIELDBYNAME('DOM_CLI').AsString;
      TRFC.Text:= QTIPO.FIELDBYNAME('RFC_CLI').AsString;
      trfc.Text := stripped('-',trfc.Text);
      cod_cli := qtipo.fieldbyname('cod_cli').AsString;
      nom_cli:=  qtipo.fieldbyname('RAZ_SOC').AsString;
      ciu_cli:= qtipo.fieldbyname('ciu_cli').AsString;
      est_cli:= qtipo.fieldbyname('est_cli').AsString;
      lim_cre:= qtipo.fieldbyname('lim_cre').asfloat;
      cod_pos:= qtipo.fieldbyname('cod_pos').asstring;
      pla_clie:= qtipo.fieldbyname('pla_cli').asstring;

        label17.Visible:= true;
      name.Visible:= true;
      label33.visible:= false;
      code.Visible:= false;


      name.Text:= nom_cli;

       qtipo_pago.Close;
     qtipo_pago.ParamByName('cod_cli').AsString := cod_cli;
     qtipo_pago.Open;


      if qtipo_pago.FieldByName('tipo_pago').AsString = '' then
     begin
           QCODIGOART.CLOSE;
          showmessage('Revisa cliente no tiene Tipo de Pago');
          exit;

    end;

        if qtipo_pago.FieldByName('tipo_pago').AsString = 'Efectivo' then
        begin
           if question('Este cliente esta Registrado como pago efectivo te va a pagar con Efectivo?') = true then
           begin


      qdebefac.Close;
      qdebefac.ParamByName('num_emp').AsString:= num_empresa.Text;
      qdebefac.ParamByName('cod_cli').asstring:= cod_cli;
      qdebefac.open;

    ACHI := 0;


    //  tot_debe.Text:= qdebefac.Fields[0].AsString;
       tot_debe.Text:= floattostrf( qdebefac.Fields[0].Asfloat,ffnumber, 10,2);



       if ya_puse_rfc = 0 then
              rfc_tmp := trfc.text;

      IF COD_CLI <> '9999' THEN
            BEGIN
              label6.Visible:= FALSE;
              alias.Visible:= FALSE;
           end;


      if (cod_cli = '9999') or (cod_cli ='5555') then
           begin
              label6.Visible:= true;
              alias.Visible:= true;
              alias.SetFocus;
           end;

           qsucur.Close;
           qsucur.ParamByName('cod_cli').asstring := cod_cli;
           qsucur.Open;


           if qsucur.FieldByName('sucursal').asstring = '' then
                bande:= 0
            else
                bande:= 1;


      if cod_cli ='O14L' then
        begin
          label37.Visible:= true;
          orden_compra.Visible:= true;
        end;





    IF BANDE= 0 THEN
     BEGIN
        QCODIGOART.CLOSE;
        qcodigoart.ParamByName('NUM_EMP').AsString:= FORM9.NUM_EMPRESA.TEXT;
        qcodigoart.OpeN;
        IF ALIAS.Visible = FALSE THEN
               CODIGOART.SetFocus;
      END;

      IF BANDE= 1 THEN
       BEGIN
           IF ALIAS.Visible = FALSE THEN
               CSUCURSAL.SetFocus;
       END;


          end
           else
            begin
                QCODIGOART.CLOSE;
                SHOWMESSAGE('REVISA TIPO PAGO EN MENU DE CLIENTES');
                EXIT
            end;
       end;

        if (qtipo_pago.FieldByName('tipo_pago').AsString <> 'Efectivo') AND (qtipo_pago.FieldByName('tipo_pago').AsString <> '') then
      begin



      qdebefac.Close;
      qdebefac.ParamByName('num_emp').AsString:= num_empresa.Text;
      qdebefac.ParamByName('cod_cli').asstring:= cod_cli;
      qdebefac.open;

       ACHI := 0;

       tot_debe.Text:= floattostrf( qdebefac.Fields[0].Asfloat,ffnumber, 10,2);



       if ya_puse_rfc = 0 then
              rfc_tmp := trfc.text;

      IF COD_CLI <> '9999' THEN
            BEGIN
              label6.Visible:= FALSE;
              alias.Visible:= FALSE;
           end;


      if (cod_cli = '9999') or (cod_cli ='5555') then
           begin
              label6.Visible:= true;
              alias.Visible:= true;
              alias.SetFocus;
           end;





            {
                            totart.Text:= inttostr(NUM_ARTICULOS);

                       SIKEDO := 0;

                       DESCRIPART.Text:= '';
                       CAJ_PRO.Text:= '';
                       KIL_PRO.Text:= '';
                       PRE_PRO.Text:= '';
                    //   OBSERVA.Text:= '';

                       pre_pro.ReadOnly:= false;
                       CODIGOART.SetFocus;



                       YA_PUSE_RFC := 1;
                       TOT:= STRTOFLOAT(MEMO1.Text);   }



            END;

                       agregaruno := 1;


                       qventas.Close;
                       qventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                       qventas.ParamByName('folio').AsString:= sitienefolio;
                       qventas.Open;






                       PEDIDO_CAM := qventas.fieldbyname('pedido').asstring;
                       RFC_CAM := qventas.fieldbyname('rfc').asstring;
                       NOMBRE_CAM:= qventas.fieldbyname('nombre').asstring;




                       cueqventas.Close;
                       cueqventas.ParamByName('num_emp').asstring:= num_empresa.Text;
                       cueqventas.ParamByName('folio').AsString:=sitienefolio;
                       cueqventas.Open;

                       totart.text := cueqventas.fields[0].asstring;
                       num_articulos := strtoint(cueqventas.fields[0].asstring);
                       reng := strtoint(cueqventas.fields[0].asstring);
                       TOT:= STRTOFLOAT(MEMO1.Text);

                       //hacer update en ventas comyleg y en ventas tableta

                     {  upvtascom.close;
                       upvtascom.parambyname('folio').asstring := SITIENEFOLIO;
                       upvtascom.parambyname('num_emp').asstring := num_empresa.text;
                       upvtascom.parambyname('folio_col').asstring := tfolio.text;
                       upvtascom.parambyname('nombre').asstring := form4.agente1;
                       upvtascom.execsql;



                       upvtastab.close;
                       upvtastab.parambyname('folio').asstring := edit3.text;
                       upvtastab.parambyname('num_emp').asstring := num_empresa.text;
                       upvtastab.parambyname('folio_col').asstring := tfolio.text;
                       upvtastab.execsql;  }

                        //CAMBIO EL NOMBRE PARA QUE APAREZCA EL QUE LA COBRO

                       UPCAMNOMVTAS.CLOSE;
                       UPCAMNOMVTAS.PARAMBYNAME('NOMBRE').ASSTRING := FORM4.AGENTE1;
                       UPCAMNOMVTAS.PARAMBYNAME('FOLIO').ASSTRING :=  SITIENEFOLIO;
                       UPCAMNOMVTAS.EXECSQL;


                       SITIENEFOLIO := TFOLIO.Text;


                       SUBTOTAL := STRTOFLOAT(edit9.Text); // := floattostrf(subtotal,ffnumber,10,2);
                       IVATOTAL := STRTOFLOAT(edit10.text); // := floattostrf(ivatotal,ffnumber,10,2);
                       TOTAL_FIN := STRTOFLOAT(edit1.Text); // := floattostrf(total_fin,ffnumber,10,2);
                       IEPSTOTAL := STRTOFLOAT(ieps.text);  //:= floattostrf(iepstotal,ffnumber,10,2);
                       ACUDES := STRTOFLOAT(MEMO4.TEXT); //:= floattostrf(ACUDES,ffnumber,10,2);

                       NUM_ARTICULOS := STRTOINT(totart.Text);


                       IF ALIAS.Text = '' THEN
                              ALIAS.TEXT := 'PUBLICO GRAL';



    end;




end;

end.


