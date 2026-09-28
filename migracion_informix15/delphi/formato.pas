unit formato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBTables, DB, Grids, DBGrids, DBCtrls, StdCtrls, jpeg,
  Buttons, RpCon, RpConDS, RpDefine, RpRave, RpSystem, personal, Menus, Mask,
  ComCtrls;

type
  TForm1 = class(TForm)
    Image13: TImage;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    Image25: TImage;
    Image26: TImage;
    Image27: TImage;
    Panel4: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    gbHedaer: TGroupBox;
    Label1: TLabel;
    Domicilio: TLabel;
    Ciudad: TLabel;
    Label5: TLabel;
    Nombre: TLabel;
    nom_pro: TDBLookupComboBox;
    tel_pro: TEdit;
    dir_pro: TEdit;
    ciu_pro: TEdit;
    Panel6: TPanel;
    Label8: TLabel;
    edTotal: TEdit;
    DBGrid1: TDBGrid;
    maot: TEdit;
    importe: TEdit;
    btFacturar: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    qnompro: TQuery;
    qart: TQuery;
    DataSource2: TDataSource;
    qproduc: TQuery;
    DataSource4: TDataSource;
    qproduccod_art: TStringField;
    qproducdes_art: TStringField;
    qproduciva: TFloatField;
    qproductip_art: TStringField;
    DataSource5: TDataSource;
    ttrans: TTable;
    tiva: TQuery;
    DataSource6: TDataSource;
    tivaiva: TFloatField;
    tpedido: TTable;
    DataSource7: TDataSource;
    qtempo: TQuery;
    DataSource8: TDataSource;
    Database1: TDatabase;
    qtempocod_art: TStringField;
    qtempodes_art: TStringField;
    qtempocan_caj: TFloatField;
    qtempocan_kgs: TFloatField;
    qtempocos_uni: TFloatField;
    qtempopre_vta: TFloatField;
    qtempodes_vta: TFloatField;
    Panel2: TPanel;
    Label12: TLabel;
    lb1: TLabel;
    Label7: TLabel;
    name_pro: TEdit;
    Tran_prov: TTable;
    DataSource9: TDataSource;
    qsaca: TQuery;
    DataSource10: TDataSource;
    Edit1: TEdit;
    raz_soc: TDBLookupComboBox;
    qnompronum_emp: TStringField;
    qnomprocod_pro: TStringField;
    qnomproraz_soc: TStringField;
    qnomprodom_pro: TStringField;
    qnomprociu_pro: TStringField;
    qnomproest_pro: TStringField;
    qnomprotel_1: TStringField;
    qnomprorfc_pro: TStringField;
    qnomprocod_pos: TIntegerField;
    qnomproage_pro: TSmallintField;
    qnomprocon_pro: TStringField;
    qnompropla_pro: TSmallintField;
    qnomprosta_pro: TStringField;
    qnomprolim_cre: TFloatField;
    qnomprosal_act: TFloatField;
    qnomprosal_ant: TFloatField;
    qnomprocom_mes: TFloatField;
    qnomprocos_mes: TFloatField;
    qnomprocom_acu: TFloatField;
    qnomprocos_acu: TFloatField;
    qnomprofech_com: TDateField;
    qnomprocan_com: TFloatField;
    qnomprofech_pag: TDateField;
    qnomproimp_pag: TFloatField;
    qnomprocurp: TStringField;
    tpedidonum_emp: TStringField;
    tpedidonum_suc: TStringField;
    tpedidonum_ped: TIntegerField;
    tpedidocod_pro: TStringField;
    tpedidonum_fac: TIntegerField;
    tpedidofech_ped: TDateField;
    tpedidofech_fac: TDateField;
    tpedidocon_pro: TStringField;
    tpedidoimp_exe: TFloatField;
    tpedidoimp_15: TFloatField;
    tpedidodes_exe: TFloatField;
    tpedidodes_15: TFloatField;
    tpedidoiva_15: TFloatField;
    tpedidoflete: TFloatField;
    tpedidoiva_fle: TFloatField;
    DataSource3: TDataSource;
    DataSource11: TDataSource;
    pedido: TStoredProc;
    tr_pedido: TStoredProc;
    RvProject1: TRvProject;
    Orden: TRvDataSetConnection;
    RvSystem1: TRvSystem;
    btImprimir: TBitBtn;
    procedure btImprimirClick(Sender: TObject);
    mx: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    kil_pro: TEdit;
    pre_pro: TEdit;
    Tot_pro: TEdit;
    BitBtn3: TBitBtn;
    caj_pro: TEdit;
    des_pro: TEdit;
    cod_Art: TDBLookupComboBox;
    des_pro22: TDBLookupComboBox;
    cod_Art22: TEdit;
    qcodpro: TQuery;
    DataSource12: TDataSource;
    qcodpronum_emp: TStringField;
    qcodprocod_pro: TStringField;
    qcodproraz_soc: TStringField;
    qcodprodom_pro: TStringField;
    qcodprociu_pro: TStringField;
    qcodproest_pro: TStringField;
    qcodprotel_1: TStringField;
    qcodprorfc_pro: TStringField;
    qcodprocod_pos: TIntegerField;
    qcodproage_pro: TSmallintField;
    qcodprocon_pro: TStringField;
    qcodpropla_pro: TSmallintField;
    qcodprosta_pro: TStringField;
    qcodprolim_cre: TFloatField;
    qcodprosal_act: TFloatField;
    qcodprosal_ant: TFloatField;
    qcodprocom_mes: TFloatField;
    qcodprocos_mes: TFloatField;
    qcodprocom_acu: TFloatField;
    qcodprocos_acu: TFloatField;
    qcodprofech_com: TDateField;
    qcodprocan_com: TFloatField;
    qcodprofech_pag: TDateField;
    qcodproimp_pag: TFloatField;
    qcodprocurp: TStringField;
    PopupMenu1: TPopupMenu;
    BitBtn4: TBitBtn;
    DataSource13: TDataSource;
    qrevisa: TQuery;
    Button1: TButton;
    opcion2: TRadioGroup;
    Codigob: TDBLookupComboBox;
    qcodi: TQuery;
    DataSource14: TDataSource;
    desarti: TEdit;
    Label11: TLabel;
    fechauno: TDateTimePicker;
    Label13: TLabel;
    Edit2: TEdit;
    ttransnum_emp: TStringField;
    ttranscod_art: TStringField;
    ttransnum_suc: TStringField;
    ttransfech_doc: TDateField;
    ttranstip_doc: TStringField;
    ttransnum_doc: TIntegerField;
    ttranscan_kgs: TFloatField;
    ttranscan_caj: TFloatField;
    ttranscos_uni_kgs: TFloatField;
    ttranscos_uni_caj: TFloatField;
    ttranscos_pro_kgs: TFloatField;
    ttranscos_pro_caj: TFloatField;
    ttranspre_vta_kgs: TFloatField;
    ttranspre_vta_caj: TFloatField;
    ttransdes_vta: TFloatField;
    ttransfle_art: TFloatField;
    ttransren_art: TSmallintField;
    ttranscod_pro: TStringField;
    ttranscod_cli: TStringField;
    ttransnum_ent: TIntegerField;
    ttransfech_ent: TDateField;
    ttransiva_art: TFloatField;
    Label14: TLabel;
    Label17: TLabel;
    numempresa: TDBLookupComboBox;
    qnumemp: TQuery;
    DataSource15: TDataSource;
    Label18: TLabel;
    DataSource18: TDataSource;
    qminemp: TQuery;
    DataSource19: TDataSource;
    Qminemp2: TQuery;
    QSACANEG: TQuery;
    DataSource17: TDataSource;
    qinven: TQuery;
    DataSource16: TDataSource;
    Tran_provnum_emp: TStringField;
    Tran_provnum_suc: TStringField;
    Tran_provno_pedido: TStringField;
    Tran_provcod_pro: TStringField;
    Tran_provtelefono: TStringField;
    Tran_provnombre: TStringField;
    Tran_provdireccion: TStringField;
    Tran_provciudad: TStringField;
    Tran_provcod_art: TStringField;
    Tran_provdescripcion: TStringField;
    Tran_provcajas: TFloatField;
    Tran_provkilos: TFloatField;
    Tran_provprecio: TFloatField;
    Tran_provtotal: TFloatField;
    Tran_provrenglon: TIntegerField;
    Tran_provcancelado: TIntegerField;
    Tran_provimp_exe: TFloatField;
    Tran_proviva: TFloatField;
    Tran_provcosto_pro: TFloatField;
    QBUSARTI: TQuery;
    DataSource20: TDataSource;
    Query2: TQuery;
    Query2num_emp: TStringField;
    Query2cod_pro: TStringField;
    Query2raz_soc: TStringField;
    Query2dom_pro: TStringField;
    Query2ciu_pro: TStringField;
    Query2est_pro: TStringField;
    Query2tel_1: TStringField;
    Query2rfc_pro: TStringField;
    Query2cod_pos: TIntegerField;
    Query2age_pro: TSmallintField;
    Query2con_pro: TStringField;
    Query2pla_pro: TSmallintField;
    Query2sta_pro: TStringField;
    Query2lim_cre: TFloatField;
    Query2sal_act: TFloatField;
    Query2sal_ant: TFloatField;
    Query2com_mes: TFloatField;
    Query2cos_mes: TFloatField;
    Query2com_acu: TFloatField;
    Query2cos_acu: TFloatField;
    Query2fech_com: TDateField;
    Query2can_com: TFloatField;
    Query2fech_pag: TDateField;
    Query2imp_pag: TFloatField;
    Query2curp: TStringField;
    DataSource34: TDataSource;
    Label19: TLabel;
    IEPS: TEdit;
    QIEPS: TQuery;
    QIEPScodigo: TStringField;
    DataSource37: TDataSource;
    Tran_provieps: TFloatField;
    qsacanum_emp: TStringField;
    qsacanum_suc: TStringField;
    qsacano_pedido: TStringField;
    qsacacod_pro: TStringField;
    qsacatelefono: TStringField;
    qsacanombre: TStringField;
    qsacadireccion: TStringField;
    qsacaciudad: TStringField;
    qsacacod_art: TStringField;
    qsacadescripcion: TStringField;
    qsacacajas: TFloatField;
    qsacakilos: TFloatField;
    qsacaprecio: TFloatField;
    qsacatotal: TFloatField;
    qsacarenglon: TIntegerField;
    qsacacancelado: TIntegerField;
    qsacaimp_exe: TFloatField;
    qsacaiva: TFloatField;
    qsacacosto_pro: TFloatField;
    qsacaieps: TFloatField;
    deta_ieps: TTable;
    DataSource21: TDataSource;
    deta_iepsnum_emp: TStringField;
    deta_iepsnum_suc: TStringField;
    deta_iepsnum_doc: TStringField;
    deta_iepscod_art: TStringField;
    deta_iepsieps: TFloatField;
    deta_iepsdebe: TFloatField;
    deta_iepsfecha: TDateField;
    deta_iepstip_doc: TStringField;
    deta_iepscod_cli: TStringField;
    deta_iepscod_pro: TStringField;
    QUPINARPED: TQuery;
    DataSource22: TDataSource;
    conent: TQuery;
    conentnum_emp: TStringField;
    conentnum_ent: TIntegerField;
    DataSource81: TDataSource;
    consal: TQuery;
    consalnum_emp: TStringField;
    consalnum_sal: TIntegerField;
    DataSource82: TDataSource;
    StoredProc4: TStoredProc;
    DataSource83: TDataSource;
    StoredProc5: TStoredProc;
    DataSource84: TDataSource;
    StoredProc7: TStoredProc;
    DataSource90: TDataSource;
    DataSource89: TDataSource;
    StoredProc6: TStoredProc;
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
    qbuscod: TQuery;
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
    DataSource85: TDataSource;
    DataSource86: TDataSource;
    Qactu: TQuery;
    DataSource88: TDataSource;
    QBUSARTInum_emp: TStringField;
    QBUSARTIcod_art: TStringField;
    QBUSARTIcod_art1: TStringField;
    QBUSARTIdes_art: TStringField;
    QBUSARTIuni_art: TStringField;
    QBUSARTIemp_art: TStringField;
    QBUSARTIcan_emp: TFloatField;
    QBUSARTIprecio_1: TFloatField;
    QBUSARTIprecio_2: TFloatField;
    QBUSARTIprecio_3: TFloatField;
    QBUSARTIprecio_4: TFloatField;
    QBUSARTIprecio_5: TFloatField;
    QBUSARTIsal_val: TFloatField;
    QBUSARTIsal_ant: TFloatField;
    QBUSARTIult_cos_kgs: TFloatField;
    QBUSARTIcos_pro_kgs: TFloatField;
    QBUSARTIcos_ant_kgs: TFloatField;
    QBUSARTIven_mes_kgs: TFloatField;
    QBUSARTIcos_mes_kgs: TFloatField;
    QBUSARTIven_acu_kgs: TFloatField;
    QBUSARTIcos_acu_kgs: TFloatField;
    QBUSARTIexi_cor_kgs: TFloatField;
    QBUSARTIexi_ant_kgs: TFloatField;
    QBUSARTIexi_fis_kgs: TFloatField;
    QBUSARTIcan_acu_kgs: TFloatField;
    QBUSARTIcan_mes_kgs: TFloatField;
    QBUSARTIult_cos_caj: TFloatField;
    QBUSARTIcos_pro_caj: TFloatField;
    QBUSARTIcos_ant_caj: TFloatField;
    QBUSARTIven_mes_caj: TFloatField;
    QBUSARTIcos_mes_caj: TFloatField;
    QBUSARTIven_acu_caj: TFloatField;
    QBUSARTIcos_acu_caj: TFloatField;
    QBUSARTIexi_cor_caj: TFloatField;
    QBUSARTIexi_ant_caj: TFloatField;
    QBUSARTIexi_fis_caj: TFloatField;
    QBUSARTIcan_acu_caj: TFloatField;
    QBUSARTIcan_mes_caj: TFloatField;
    QBUSARTIback_cli: TFloatField;
    QBUSARTIback_pro: TFloatField;
    QBUSARTImin_emp: TFloatField;
    QBUSARTImax_emp: TFloatField;
    QBUSARTIiva: TFloatField;
    QBUSARTIlin_ven: TSmallintField;
    QBUSARTIcod_pro: TStringField;
    QBUSARTItip_art: TStringField;
    QBUSARTIedo_pro: TStringField;
    QBUSARTIban_rep: TStringField;
    QBUSARTImin_pre: TFloatField;
    QBUSARTImax_pre: TFloatField;
    QBUSARTIobserva: TStringField;
    qbusieps: TQuery;
    DataSource23: TDataSource;
    qbusiepscodigo: TStringField;
    qupinarent: TQuery;
    DataSource42: TDataSource;
    iepstrpr: TTable;
    iepstrprnum_emp: TStringField;
    iepstrprnum_ent: TStringField;
    iepstrprieps: TFloatField;
    iepstrprsal_ieps: TFloatField;
    DataSource49: TDataSource;
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
    vtasieps: TQuery;
    StringField64: TStringField;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    IntegerField19: TIntegerField;
    StringField65: TStringField;
    IntegerField20: TIntegerField;
    DataSource95: TDataSource;
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
    qinvennum_emp: TStringField;
    qinvencod_art: TStringField;
    qinvencod_art1: TStringField;
    qinvendes_art: TStringField;
    qinvenuni_art: TStringField;
    qinvenemp_art: TStringField;
    qinvencan_emp: TFloatField;
    qinvenprecio_1: TFloatField;
    qinvenprecio_2: TFloatField;
    qinvenprecio_3: TFloatField;
    qinvenprecio_4: TFloatField;
    qinvenprecio_5: TFloatField;
    qinvensal_val: TFloatField;
    qinvensal_ant: TFloatField;
    qinvenult_cos_kgs: TFloatField;
    qinvencos_pro_kgs: TFloatField;
    qinvencos_ant_kgs: TFloatField;
    qinvenven_mes_kgs: TFloatField;
    qinvencos_mes_kgs: TFloatField;
    qinvenven_acu_kgs: TFloatField;
    qinvencos_acu_kgs: TFloatField;
    qinvenexi_cor_kgs: TFloatField;
    qinvenexi_ant_kgs: TFloatField;
    qinvenexi_fis_kgs: TFloatField;
    qinvencan_acu_kgs: TFloatField;
    qinvencan_mes_kgs: TFloatField;
    qinvenult_cos_caj: TFloatField;
    qinvencos_pro_caj: TFloatField;
    qinvencos_ant_caj: TFloatField;
    qinvenven_mes_caj: TFloatField;
    qinvencos_mes_caj: TFloatField;
    qinvenven_acu_caj: TFloatField;
    qinvencos_acu_caj: TFloatField;
    qinvenexi_cor_caj: TFloatField;
    qinvenexi_ant_caj: TFloatField;
    qinvenexi_fis_caj: TFloatField;
    qinvencan_acu_caj: TFloatField;
    qinvencan_mes_caj: TFloatField;
    qinvenback_cli: TFloatField;
    qinvenback_pro: TFloatField;
    qinvenmin_emp: TFloatField;
    qinvenmax_emp: TFloatField;
    qinveniva: TFloatField;
    qinvenlin_ven: TSmallintField;
    qinvencod_pro: TStringField;
    qinventip_art: TStringField;
    qinvenedo_pro: TStringField;
    qinvenban_rep: TStringField;
    qinvenmin_pre: TFloatField;
    qinvenmax_pre: TFloatField;
    qinvenobserva: TStringField;
    opcion: TRadioGroup;
    qBuscaCanEmp: TQuery;
    qInsOCDetalle: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure nom_proClick(Sender: TObject);
    procedure cod_ArtClick(Sender: TObject);
    procedure caj_proChange(Sender: TObject);
    procedure caj_proExit(Sender: TObject);
    procedure caj_proKeyPress(Sender: TObject; var Key: Char);
    procedure kil_proChange(Sender: TObject);
    procedure kil_proKeyPress(Sender: TObject; var Key: Char);
    procedure pre_proChange(Sender: TObject);
    procedure pre_proKeyPress(Sender: TObject; var Key: Char);
    procedure pre_proExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btFacturarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
       procedure opcionClick(Sender: TObject);
    procedure raz_socClick(Sender: TObject);
    procedure des_pro22Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure nom_proKeyPress(Sender: TObject; var Key: Char);
    procedure raz_socKeyPress(Sender: TObject; var Key: Char);
    procedure des_pro22KeyPress(Sender: TObject; var Key: Char);
    procedure Tot_proKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure opcion2Click(Sender: TObject);
    procedure CodigobClick(Sender: TObject);
    procedure CodigobExit(Sender: TObject);
    procedure des_pro22Exit(Sender: TObject);
    procedure CodigobKeyPress(Sender: TObject; var Key: Char);
    procedure numempresaClick(Sender: TObject);
    procedure numempresaKeyPress(Sender: TObject; var Key: Char);
    function  stripped(stripchar : char; str : string) : string;
     private
    { Private declarations }
  public
    totieps, tot_ieps, precio_pro, cajas_pro, sacariva, finiva, kilos_pro, costofin, total,kilo, precio, caja: real;
   elieps, iepsilon, num_emp, codigobien, codigobn, descripci, codigoprove, codraz, numero_emp,  no_pedido, fecha, costo_prom, tipo: string;
    cancelado, renglon, num_ped, solouno: integer;
    FIdPresentacionSel: Integer;
    FCodArtResuelto: string;
    FFactorPresentacion: Double;
    FPrecioDerivadoSel: Boolean;
    FTaraSel: Double;
    FEsVariableSel: Boolean;
    procedure sacain;
    procedure ResuelvePresentacion;
    function BuscaCanEmp(const CodArt: string): Double;
    function ConvierteCantidad(Cantidad, Factor, Tara: Double; EsVariable: Boolean): Double;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses MENSA2, convertir, cankgs, UFormPresentacion;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);

begin
    qnompro.Open;
 //   qart.Open;
    solouno:= 0;
    renglon:= 0;
    cancelado := 0;
    OPCION.ItemIndex := -1;
    FIdPresentacionSel := 0;


end;

procedure TForm1.nom_proClick(Sender: TObject);
var
    key: char;
begin
    name_pro.text:= qnompro.fieldbyname('raz_soc').asstring;
    tel_pro.text:= qnompro.fieldbyname('tel_1').asstring;
    dir_pro.text:= qnompro.fieldbyname('dom_pro').asstring;
    ciu_pro.text:= qnompro.fieldbyname('ciu_pro').asstring;
    numero_emp:= qnompro.fieldbyname('num_emp').asstring;
    CODIGOBIEN:= qnompro.fieldbyname('cod_pro').asstring;
    edit2.text:= codigobien;
    name_pro.Text:= qnompro.fieldbyname('raz_soc').AsString;
    fechauno.Date:= now;

  {    query2.Close;
    query2.ParamByName('cod_pro').AsString := codigobien;
    query2.Open;

    if query2.FieldByName('cod_pro').AsString = '' then
       begin
         showmessage('Da de alta el Prov. en la Emp 03');
          name_pro.text:= '';
    tel_pro.text:= '';
    dir_pro.text:= '';
    ciu_pro.text:= '';
    numero_emp:= '';
    codigobien:= '';
    fechauno.Date:= now;
         exit
       end;}


    if   (key= #13) then
         edit1.SetFocus;

end;

procedure TForm1.cod_ArtClick(Sender: TObject);
begin
    caj_pro.text:= '0';
    kil_pro.text:= '0';
    pre_pro.text:= '0';
    tot_pro.text:= '0';

//    des_pro.text:= qart.fieldbyname('des_Art').AsString;
end;

procedure TForm1.caj_proChange(Sender: TObject);
begin
      caja:= 0;
      if caj_pro.text='' then
        begin
          caj_pro.text:= '0';
          caj_pro.SelectAll;
        end;
       caja:= strtofloat(caj_pro.Text);
end;

procedure TForm1.caj_proExit(Sender: TObject);
var
  cantidad, kilos: Double;
begin
  // articulo con presentacion resuelta: caj_pro es la "Cantidad" que teclea
  // el usuario, y aqui se calcula el equivalente en kilos (factor y tara
  // aplicados segun la presentacion elegida). Para articulos no migrados
  // (FIdPresentacionSel = 0) no se toca nada, se sigue capturando kil_pro
  // a mano como siempre.
  if FIdPresentacionSel > 0 then
  begin
    if caj_pro.Text = '' then
      caj_pro.Text := '0';
    cantidad := strtofloat(caj_pro.Text);
    kilos := ConvierteCantidad(cantidad, FFactorPresentacion, FTaraSel, FEsVariableSel);
    kil_pro.Text := FloatToStrF(kilos, ffNumber, 10, 3);
  end;
end;

procedure TForm1.caj_proKeyPress(Sender: TObject; var Key: Char);

begin
    if key = '' then
          key:= '0'
        else
           if not (key in [chr(0)..chr(31),'0'..'9','.'])then
              key:= '0'
              else
                 if (KEY = #13) then
                           begin

                             if FIdPresentacionSel > 0 then
                               begin
                                 // articulo con presentacion: caj_pro es la
                                 // "Cantidad" capturada; el Kilos se calcula
                                 // solo al salir del campo (caj_proExit)
                                 pre_pro.SetFocus;
                               end
                             else
                             begin

                             if codigob.Visible = true then
                               begin
                                  qminemp.Close;
                                  qminemp.ParamByName('cod_Art').AsString:= codigob.text;
                                  qminemp.parambyname('num_emp').asstring:= '01';
                                  qminemp.Open;


                                   if (qminemp.fieldbyname('min_emp').asstring = '1') and
                                      (qminemp.fieldbyname('max_emp').asstring = '1') then
                                       begin
                                         kil_pro.text:= caj_pro.text;
                                         pre_pro.SetFocus;
                                       end
                                       else
                                        begin
                                          kil_pro.setfocus;            { move to next control }
                                        end;

                               end;

                                  if des_pro22.Visible = true then
                                  begin
                                  qminemp2.Close;
                                  qminemp2.ParamByName('des_Art').AsString:= des_pro22.text;
                                  qminemp2.parambyname('num_emp').asstring:= '01';
                                  qminemp2.Open;


                                   if (qminemp2.fieldbyname('min_emp').asstring = '1') and
                                      (qminemp2.fieldbyname('max_emp').asstring = '1') then
                                       begin
                                         kil_pro.text:= caj_pro.text;
                                         pre_pro.SetFocus;
                                       end
                                       else
                                        begin
                                          kil_pro.SetFocus;            { move to next control }
                                        end;

                                  end;

                             end;

                           end



end;



procedure TForm1.kil_proChange(Sender: TObject);
begin
      kilo:= 0;
      if kil_pro.text='' then
        begin
          kil_pro.text:= '0';
          kil_pro.SelectAll;
        end;
        kilo:= STRTOFLOAT(kil_pro.Text);


end;

procedure TForm1.kil_proKeyPress(Sender: TObject; var Key: Char);
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

procedure TForm1.pre_proChange(Sender: TObject);
begin
      precio:= 0;
      if pre_pro.text='' then
        begin
          pre_pro.text:= '0';
          pre_pro.SelectAll;
        end;
       precio:= strtofloat(pre_pro.Text);
end;

procedure TForm1.pre_proKeyPress(Sender: TObject; var Key: Char);
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

procedure TForm1.pre_proExit(Sender: TObject);
var
  costo_pro : real;
begin
     qproduc.Close;
     qproduc.parambyname('cod_art').asstring:= codigobn;
     qproduc.ParamByName('num_emp').AsString:= '01';
     qproduc.open;
     Precio_pro:=0;
     kilos_pro:=0;
     total:= 0;
     costo_pro:= 0;
     costofin:= 0;
     if qproduc.FieldByName('tip_art').AsString = 'K'    then
            begin
            precio_pro:= strtofloat(pre_pro.text);
            IF kil_pro.text = '' then
                   kil_pro.text := '0';
            kilos_pro:=strtofloat(kil_pro.text);
            total := precio_pro * kilos_pro;
            tipo:= 'K';
            end
         else
          begin
            precio_pro:= strtofloat(pre_pro.text);
            IF caj_pro.text = '' then
                   caj_pro.text := '0';
            cajas_pro:=strtofloat(caj_pro.text);
            total := precio_pro * cajas_pro;
            tipo:='C';
          end;
     if FIdPresentacionSel > 0 then
       begin
         // articulo con presentacion: el importe siempre es
         // Cantidad (caj_pro) x Precio, sin importar tip_art
         precio_pro:= strtofloat(pre_pro.text);
         IF caj_pro.text = '' then
                caj_pro.text := '0';
         total := precio_pro * strtofloat(caj_pro.text);
       end;
     total:= strtofloat(format('%10.2f',[total]));
     tot_pro.Text:=floattostrf(total,ffcurrency,10,2);
end;


procedure TForm1.BitBtn3Click(Sender: TObject);
var
  totdes, descto, ultiva, imp_gravado, gravado, saca, mul : real;
 sitiene, totiva, iva, codigo:string;
  pagado:integer;
begin
      sitiene:= '0';
      renglon:= renglon + 1;
      fecha:= datetostr(date);
      pagado:= 0;
      tiva.Close;

     {   QBUSARTI.Close;
        QBUSARTI.ParamByName('NUM_EMP').AsString := '03';
        QBUSARTI.ParamByName('COD_aRT').AsString := codigob.Text;
        QBUSARTI.Open;


        if qbusarti.FieldByName('num_emp').AsString = '' then
        begin
            showmessage('NO existe este codigo en la empresa 03 darlo de alta');
            codigob.SetFocus;
            exit;

        end; }



      if caj_pro.text > kil_pro.Text then
        begin
             FORM2.Label1.Caption:='Checa las Cantidades en Cajas y Kgs ';
            if FORM2.ShowModal = mrOK then
            caj_pro.SetFocus;
             caj_pro.SelectAll;
              FORM2.Close;
        end
        else


      if edit1.text='' then
        begin
             FORM2.Label1.Caption:='  Favor de Poner No. Pedido ';
            if FORM2.ShowModal = mrOK then
            edit1.SetFocus;
              edit1.SelectAll;
              FORM2.Close;
        end
        else
      IF (NOM_pro.text = '') and (codraz ='') THEN
         begin
            FORM2.Label1.Caption:='  Favor de Seleccionar Proveedor  ';
            if FORM2.ShowModal = mrOK then
            nom_pro.SetFocus;
            FORM2.Close;
        end
       ELSE
       if descripci = '' then
        begin
            FORM2.Label1.Caption:='  Favor de Poner el Codigo  ';
            if FORM2.ShowModal = mrOK then
            cod_art.SetFocus;
            FORM2.Close;
        end
     else
       if (kilo =0) or ( precio=0) or (caja=0) then
          begin
            FORM2.Label1.Caption:='  Revisa Cantidad en Caja/Kilos/Precio  ';
            if FORM2.ShowModal = mrOK then
              kil_pro.SetFocus;
              kil_pro.SelectAll;
              FORM2.Close;
            end
          ELSE
      begin

        codigo:= codigobn;
        tiva.parambyname('IVA').asstring:=CODIGO;
        TIVA.PARAMBYNAME('NUM_EMP').ASSTRING:= '01';
        tiva.Open;
        totiva:= tiva.fieldbyname('iva').asstring;

        qbusieps.close;
        qbusieps.parambyname('codigo').asstring := codigo;
        qbusieps.open;

        if qbusieps.fieldbyname('codigo').asstring <> '' then
                  elieps := '8'
            else
                  elieps := '0';

        if totiva <> '0' then
          begin
            mul:= strtofloat(totiva);
            mul:= (mul/100) + 1;
            saca:= total * mul;
            ULTIVA:= saca - total;
            finiva:= finiva + ultiva;
          //  sitiene:= '16'
          END;


        IF ELIEPS <> '0' THEN
        BEGIN
            mul:= strtofloat(totiva);
            mul:= (8/100) + 1;
            saca:= total * mul;
            ULTIVA:= saca - total;
            ELIEPS:= floattostrf((strtofloat(ELIEPS) + ultiva),ffnumber,10,2);
            elieps:= stripped(',', elieps);


        END;

        if nom_pro.Text = '' then
                codigoprove:= codraz
            else
                codigoprove:= nom_pro.text;


        tran_prov.Close;
        tran_prov.open;
        tran_prov.AppendRecord([numEMPRESA.Text, numEMPRESA.Text, edit1.text, codigoprove, tel_pro.text, name_pro.text, dir_pro.text,
                  ciu_pro.text, codigobn, descripci, caj_pro.text, kil_pro.text, pre_pro.text,
                  total, renglon, cancelado, total, finiva, elieps] );

      SACAIN;
   END;

END;



procedure TForm1.sacain;
var

    pon_ieps, iva_calcu,  total1, impotot, pagar1 : real;
begin
      no_pedido:= edit1.text;
      qsaca.Close;
      qsaca.ParamByName('no_pedido').asinteger:= strtoint(no_pedido);
      qsaca.Open;
      qsaca.first;
      pagar1:= 0;
      sacariva:= 0;
      total1:= 0;
      finiva:= 0;
      pon_ieps := 0;

      // despliega la informacion del ticket.

      while not qsaca.eof do
          begin
         pagar1:=qsaca.fieldbyname('total').Asfloat;

        //  iva_calcu:= (pagar1 * (qsaca.fieldbyname('iva').AsFloat));
          sacariva:=sacariva + qsaca.fieldbyname('iva').AsFloat; // AQUI ES LO DEL IVA AUNQUE DIGA DES_VTA

           pon_ieps := pon_ieps + qsaca.fieldbyname('ieps').AsFloat;

          total1:= total1 + pagar1;

          qsaca.next;
          end;

          impotot := total1 + sacariva +  pon_ieps;
          importe.text := floattostrf(total1,ffcurrency,10,2);
          maot.text := floattostrf(sacariva,ffcurrency,10,2);
          edtotal.text:= floattostrf(impotot,ffcurrency,10,2);
          ieps.Text := floattostrf(pon_ieps, ffcurrency ,10,2);





    if (kil_pro.text<> '0') and  (pre_pro.text <> '0') and
      (tot_pro.text<> '0') and (caj_pro.Text<> '0') and (DES_PRO.TEXT<>'')
     and (COD_art.TEXT <> '') AND (NOM_pro.TEXT <> '') then
     begin
      kil_pro.text:='0';
      pre_pro.text:= '0';
      tot_pro.text:= '0';
      caj_pro.Text:= '0';
      DES_PRO.TEXT:='';
     end;
      FIdPresentacionSel := 0;
      kil_pro.ReadOnly := False;
      caj_pro.SetFocus;
      kil_pro.selectall;
      caj_pro.ReadOnly:=false;
end;









procedure TForm1.btFacturarClick(Sender: TObject);
var
    NUM_ENT, NUM_SAL, totiva, tot_exe, tot_siva, tot_15: real;
    acuiepsilon, acuiepsilon2, totiepsilon, IEPSPOR, fechapoli, tmpdia, tmpmes, tmpano, fechaac: string;
begin

      tot_15 := 0;
      totiva := 0;
      totieps := 0;
      tot_exe := 0;
      tot_siva := 0;



      no_pedido:= edit1.text;

      qsaca.Close;
      qsaca.ParamByName('no_pedido').asinteger:= strtoint(no_pedido);
      qsaca.Open;

      if qsaca.Fields[1].AsString= '' then
        begin
          showmessage('Revisa tus productos');
          exit;
        end;


    if edit1.text = '' then
        begin
           showmessage('Revisa el numero de pedido');
           edit1.text;
            exit;
        end;



    if edtotal.Text = '' then
        begin
            showmessage('Revisa que tu total no este en Ceros');
            tot_pro.SetFocus;
            exit;
        end;


  if question('Esta Seguro de Guardar')= true then
  begin


    qsaca.close;
    qsaca.ParamByName('no_pedido').asinteger:= strtoint(no_pedido);
    qsaca.open;



     WHILE NOT QSACA.EOF DO
     BEGIN

      QSACANEG.CLOSE;
      QSACANEG.ParamByName('COD_aRT').AsString:= Qsaca.FIELDBYNAME('COD_aRT').ASSTRING ;
      QSACANEG.ParamByName('NUM_EMP').AsString:= numempresa.text;
      QSACANEG.Open;


      IF QSACANEG.FieldByName('COD_aRT').AsString <> '' THEN
          BEGIN
              SHOWMESSAGE('REVISA NEGATIVO DEL CODIGO '+QSACANEG.FIELDBYNAME('COD_ART').ASSTRING+ ' DE LA EMP01');
              EXIT;
          END;


  {     QSACANEG.CLOSE;
      QSACANEG.ParamByName('COD_aRT').AsString:= Qsaca.FIELDBYNAME('COD_aRT').ASSTRING ;
      QSACANEG.ParamByName('NUM_EMP').AsString:= '07';
      QSACANEG.Open;


      IF QSACANEG.FieldByName('COD_aRT').AsString <> '' THEN
          BEGIN
              SHOWMESSAGE('REVISA NEGATIVO DEL CODIGO '+QSACANEG.FIELDBYNAME('COD_ART').ASSTRING+ ' DE LA EMP07');
              EXIT;
          END; }


      QSACA.Next;

     END;

        qtempo.close;
     //   qart.Close;
        name_pro.text:= '';
        dir_pro.Text := '';
        ciu_pro.Text := '';
        tel_pro.Text:= '';
        caj_pro.text:= '';
        kil_pro.Text:= '';
        pre_pro.Text:= '';
        tot_pro.text:='';
        importe.text:='';
        maot.Text:='';

        nom_pro.SetFocus;
        renglon:= 0;
        totiepsilon := '0';

    qsaca.close;
    qsaca.ParamByName('no_pedido').asinteger:= strtoint(no_pedido);
    qsaca.open;
    QSACA.FIRST;

    fechapoli:= datetostr(fechauno.date);

      tmpdia:= copy(fechapoli,1,2);
      tmpmes:= copy(fechapoli,4,2);
      tmpano:= copy(fechapoli,7,4);

      fechaac:= tmpmes + '/'+ tmpdia + '/' + tmpano;

      EDTOTAL.TEXT := stripped('$', edtotal.text);
      edtotal.text := stripped(',', edtotal.text);


    //esta es la cabecera para la entrada y salida del terreno

     IF (CODIGOBIEN ='C62T') THEN
     BEGIN

              //ESTA ES LA ENTRADA

              conent.close;
              conent.parambyname('num_emp').asstring := '10';
              conent.open;

              num_ent := strtofloat(conent.fields[1].asstring) +1;



             storedproc4.Params[0].Asstring := numempresa.text;
             storedproc4.Params[1].Asstring := numempresa.text;
             storedproc4.Params[2].AsString:= floattostr(num_ent);  //NUMERO DE ENTRADA
             storedproc4.Params[3].Asdate:= fechauno.date;
             storedproc4.Params[4].AsString:= edtotal.text; //TOTAL
             storedproc4.Params[5].AsString:= 'ENTRADA EN EL TERRENO';  //CONCEPTO DE LA ENTRADA
             storedproc4.ExecProc;


             //ESTA ES LA SALIDA


              consal.close;
              consal.parambyname('num_emp').asstring := '10';
              consal.open;

              num_sal := strtofloat(consal.fields[1].asstring) +1;

              storedproc6.Params[0].Asstring := numempresa.text;
              storedproc6.Params[1].Asstring := numempresa.text;
              storedproc6.Params[2].AsString:= floattostr(num_sal); //NUMERO SALIDA
              storedproc6.Params[3].Asdate:= fechauno.date;
              storedproc6.Params[4].AsString:= edtotal.text; //TOTAL
              storedproc6.Params[5].AsString:= 'SALIDA DEL TERRENO'; //CONCEPTO
              storedproc6.ExecProc;

     END;


      IF (CODIGOBIEN ='C7BL') THEN
     BEGIN

              //ESTA ES LA ENTRADA

              conent.close;
              conent.parambyname('num_emp').asstring := '14';
              conent.open;

              num_ent := strtofloat(conent.fields[1].asstring) +1;



             storedproc4.Params[0].Asstring := numempresa.text;
             storedproc4.Params[1].Asstring := numempresa.text;
             storedproc4.Params[2].AsString:= floattostr(num_ent);  //NUMERO DE ENTRADA
             storedproc4.Params[3].Asdate:= fechauno.date;
             storedproc4.Params[4].AsString:= edtotal.text; //TOTAL
             storedproc4.Params[5].AsString:= 'ENTRADA EN EL TERRENO';  //CONCEPTO DE LA ENTRADA
             storedproc4.ExecProc;


             //ESTA ES LA SALIDA


              consal.close;
              consal.parambyname('num_emp').asstring := '14';
              consal.open;

              num_sal := strtofloat(consal.fields[1].asstring) +1;

              storedproc6.Params[0].Asstring := numempresa.text;
              storedproc6.Params[1].Asstring := numempresa.text;
              storedproc6.Params[2].AsString:= floattostr(num_sal); //NUMERO SALIDA
              storedproc6.Params[3].Asdate:= fechauno.date;
              storedproc6.Params[4].AsString:= edtotal.text; //TOTAL
              storedproc6.Params[5].AsString:= 'SALIDA DEL TERRENO'; //CONCEPTO
              storedproc6.ExecProc;

     END;





    while not qsaca.eof do
    begin

              QBUSARTI.Close;
              QBUSARTI.ParamByName('NUM_EMP').AsString := numempresa.text;
              QBUSARTI.ParamByName('COD_aRT').AsString := qsaca.fieldbyname('cod_art').AsString;
              QBUSARTI.Open;



             if qsaca.fieldbyname('iva').AsString <> '0' then
              begin
                  tot_15:= tot_15 + strtofloat(qsaca.fieldbyname('total').AsString);
                  totiva:= totiva + strtofloat(qsaca.fieldbyname('iva').AsString);
              end;
              // else
              //    tot_exe:= tot_exe +  strtofloat(qsaca.fieldbyname('total').AsString);


                if qsaca.FieldByName('ieps').AsString <> '0' then
                 begin
                    totieps := totieps + qsaca.fieldbyname('ieps').asfloat;

                 end;


                 if qsaca.FieldByName('total').AsString <> '0' then
                      tot_exe:= tot_exe +  strtofloat(qsaca.fieldbyname('total').AsString);

                  if qsaca.FieldByName('imp_exe').AsString <> '0' then
                      tot_siva:= tot_siva +  strtofloat(qsaca.fieldbyname('imp_exe').AsString);


              {   else
                    tot_exe:= tot_exe +  strtofloat(qsaca.fieldbyname('total').AsString);    }


                  // ya NO se llama tr_pedido (inserta_tr_ped): eso subia
                  // el Kardex (inartrinv/inarinv) en el momento de
                  // Guardar. Ahora solo se dejan los renglones como
                  // "pedidos" (oc_pedido_detalle, estado='P'); el Kardex
                  // se afecta hasta que almacen confirma la recepcion
                  // (ver UOCRecepcion.pas / sp_recibe_renglon_oc).
                  qInsOCDetalle.Close;
                  qInsOCDetalle.ParamByName('num_emp').AsString := numempresa.text;
                  qInsOCDetalle.ParamByName('num_suc').AsString := numempresa.text;
                  qInsOCDetalle.ParamByName('num_ped').AsInteger := strtoint(edit1.text);
                  qInsOCDetalle.ParamByName('renglon').AsInteger := qsaca.FieldByName('renglon').AsInteger;
                  qInsOCDetalle.ParamByName('cod_art').AsString := qsaca.fieldbyname('cod_art').AsString;
                  qInsOCDetalle.ParamByName('cod_pro').AsString := CODIGOBIEN;
                  qInsOCDetalle.ParamByName('cant_caj').AsFloat := strtofloat(qsaca.fieldbyname('cajas').AsString);
                  qInsOCDetalle.ParamByName('cant_kil').AsFloat := strtofloat(qsaca.fieldbyname('kilos').AsString);
                  qInsOCDetalle.ParamByName('cos_uni').AsFloat := strtofloat(qsaca.fieldbyname('precio').AsString);
                  qInsOCDetalle.ParamByName('iva').AsFloat := qsaca.fieldbyname('iva').Asfloat;
                  qInsOCDetalle.ParamByName('fech_ped').AsDate := fechauno.Date;
                  qInsOCDetalle.ExecSQL;


            {       if codigobien <> 'C62T' then
                   begin

                  tr_pedido.params[0].AsString:= '07';       //num empresa
                  tr_pedido.params[1].asstring:= '07';       //num_sucursal
                  tr_pedido.params[2].AsString:= qsaca.fieldbyname('cod_art').AsString;   //codigo articulo
                  tr_pedido.params[3].AsString:= edit1.text;  //pedido.
                  tr_pedido.params[4].asstring:= fechaac;    //fecha
                  tr_pedido.params[5].asfloat:= qsaca.fieldbyname('kilos').AsFLOAT ;
                  tr_pedido.params[6].Asfloat:= qsaca.fieldbyname('cajas').Asfloat;
                  tr_pedido.params[7].AsString:=  '0';                         // FLETE
                  tr_pedido.params[8].Asfloat:=  strtofloat(qsaca.fieldbyname('precio').AsString);  //COS UNI
                  tr_pedido.params[9].AsString:=    // CODIGO PROVEEDOR
                  tr_pedido.params[10].Asfloat:=  qsaca.fieldbyname('iva').Asfloat;
                  tr_pedido.params[11].AsString:=  '0';                         // descuento
                  tr_pedido.params[12].Asfloat:= strtofloat(qsaca.FieldByName('renglon').AsString);
                  tr_pedido.execproc;

                  end;  }




                  // aqui agrego los datos de entrada y salida para el terrreno

      IF (CODIGOBIEN ='C62T') THEN
        BEGIN


      {  qbuscod.Close;
        qbuscod.ParamByName('cod_art').AsString :=  qppalpa.fieldbyname('codigo').AsString;
        qbuscod.ParamByName('num_emp').AsString :=  num_empresa.text;
        qbuscod.Open;     }


        //ESTA ES LA ENTRADA
            storedproc5.Params[0].Asstring := numempresa.Text;
        storedproc5.Params[1].Asstring := numempresa.text;
        storedproc5.Params[2].AsString:= qsaca.fieldbyname('cod_art').AsString;
        storedproc5.Params[3].Asstring:= FLOATTOSTR(NUM_ENT);   //NUMERO DE ENTRADA
        storedproc5.Params[4].Asdate:= fechaUNO.date;
        storedproc5.Params[5].AsString:= qSACA.fieldbyname('kilos').AsString;
        storedproc5.Params[6].Asstring := qSACA.fieldbyname('cajas').AsString;
        storedproc5.Params[7].Asstring := qbusARTI.fieldbyname('cos_pro_kgs').AsString;
        storedproc5.Params[8].AsString:= qbusARTI.fieldbyname('cos_pro_caj').AsString;
        storedproc5.Params[9].Asdate:= strtofloat(qsaca.FieldByName('renglon').AsString);
        storedproc5.ExecProc;


        //ESTA ES LA SALIDA

        storedproc7.Params[0].Asstring := numempresa.Text;
        storedproc7.Params[1].Asstring := numempresa.text;
        storedproc7.Params[2].AsString:= qsaca.fieldbyname('cod_Art').AsString+'T';
        storedproc7.Params[3].Asstring:= floattostr(num_sal); // NUMERO SALIDA
        storedproc7.Params[4].Asdate:= fechauno.date;
        storedproc7.Params[5].AsString:= qsaca.fieldbyname('kilos').AsString;
        storedproc7.Params[6].Asstring :=  qsaca.fieldbyname('cajas').AsString;
        storedproc7.Params[7].Asstring := qbuSARTI.fieldbyname('cos_pro_kgs').AsString;
        storedproc7.Params[8].AsString:= qbusARTI.fieldbyname('cos_pro_caj').AsString;
        storedproc7.Params[9].Asdate:= strtofloat(qsaca.FieldByName('renglon').AsString);
        storedproc7.ExecProc;



         END;


       IF (CODIGOBIEN ='C7BL') THEN
        BEGIN


      {  qbuscod.Close;
        qbuscod.ParamByName('cod_art').AsString :=  qppalpa.fieldbyname('codigo').AsString;
        qbuscod.ParamByName('num_emp').AsString :=  num_empresa.text;
        qbuscod.Open;     }


        //ESTA ES LA ENTRADA
            storedproc5.Params[0].Asstring := numempresa.Text;
        storedproc5.Params[1].Asstring := numempresa.text;
        storedproc5.Params[2].AsString:= qsaca.fieldbyname('cod_art').AsString;
        storedproc5.Params[3].Asstring:= FLOATTOSTR(NUM_ENT);   //NUMERO DE ENTRADA
        storedproc5.Params[4].Asdate:= fechaUNO.date;
        storedproc5.Params[5].AsString:= qSACA.fieldbyname('kilos').AsString;
        storedproc5.Params[6].Asstring := qSACA.fieldbyname('cajas').AsString;
        storedproc5.Params[7].Asstring := qbusARTI.fieldbyname('cos_pro_kgs').AsString;
        storedproc5.Params[8].AsString:= qbusARTI.fieldbyname('cos_pro_caj').AsString;
        storedproc5.Params[9].Asdate:= strtofloat(qsaca.FieldByName('renglon').AsString);
        storedproc5.ExecProc;


        //ESTA ES LA SALIDA

        storedproc7.Params[0].Asstring := numempresa.Text;
        storedproc7.Params[1].Asstring := numempresa.text;
        storedproc7.Params[2].AsString:= qsaca.fieldbyname('cod_Art').AsString+'B7';
        storedproc7.Params[3].Asstring:= floattostr(num_sal); // NUMERO SALIDA
        storedproc7.Params[4].Asdate:= fechauno.date;
        storedproc7.Params[5].AsString:= qsaca.fieldbyname('kilos').AsString;
        storedproc7.Params[6].Asstring :=  qsaca.fieldbyname('cajas').AsString;
        storedproc7.Params[7].Asstring := qbuSARTI.fieldbyname('cos_pro_kgs').AsString;
        storedproc7.Params[8].AsString:= qbusARTI.fieldbyname('cos_pro_caj').AsString;
        storedproc7.Params[9].Asdate:= strtofloat(qsaca.FieldByName('renglon').AsString);
        storedproc7.ExecProc;



         END;




                    iepsilon := stripped(',', qsaca.fieldbyname('ieps').Asstring);

                    IEPSPOR:= FLOATTOSTRF((qsaca.fieldbyname('IEPS').Asfloat +(qsaca.fieldbyname('IEPS').Asfloat *  (qBUSARTI.fieldbyname('PRECIO_4').Asfloat/100))), FFNUMBER,10,2);
                    IEPSPOR:= STRIPPED(',',IEPSPOR);

                   if (strtofloat(iepspor) <> 0.00) OR (strtofloat(IEPSPOR) <> 0 )then
                    begin

                     vtasieps.close;
                   vtasieps.parambyname('folio').asstring := edit1.text;
                   vtasieps.parambyname('codigo').asstring := qsaca.fieldbyname('cod_Art').Asstring;
                   vtasieps.parambyname('renglon').asinteger := qsaca.fieldbyname('renglon').Asinteger;
                   vtasieps.parambyname('num_emp').asstring := numero_emp;
                   vtasieps.parambyname('totieps').asstring := iepsilon;  //iepspor;
                   vtasieps.execsql;


                  { vtasieps.close;
                   vtasieps.parambyname('folio').asstring := edit1.text;
                   vtasieps.parambyname('codigo').asstring := qsaca.fieldbyname('cod_Art').Asstring;
                   vtasieps.parambyname('renglon').asinteger := qsaca.fieldbyname('renglon').Asinteger;
                   vtasieps.parambyname('num_emp').asstring := '07';
                   vtasieps.parambyname('totieps').asstring := iepsilon;
                   vtasieps.execsql;  }


                  {  deta_ieps.open;
                    deta_ieps.AppendRecord([numero_emp, numero_emp, edit1.Text, qsaca.fieldbyname('cod_Art').Asstring,
                    IEPSPOR, IEPSPOR, datetostr(fechauno.Date),
                    'PE', '', qsaca.fieldbyname('cod_pro').Asstring]);
                    deta_ieps.Close;


                    deta_ieps.open;
                    deta_ieps.AppendRecord(['07', '07', edit1.Text, qsaca.fieldbyname('cod_Art').Asstring,
                    qsaca.fieldbyname('ieps').Asstring, qsaca.fieldbyname('ieps').Asstring, datetostr(fechauno.Date),
                    'PE', '', qsaca.fieldbyname('cod_pro').Asstring]);
                    deta_ieps.Close;    }
                  end;



                  qsaca.Next;

   end;

                    pedido.params[0].AsString:= numempresa.text;        //num empresa
                    pedido.params[1].asstring:= numempresa.text;      //num_sucursal
                    pedido.params[2].AsString:= edit1.Text;                 //no. pedido
                    pedido.params[3].AsString:=  CODIGOBIEN; //'L70L'; //codigo prov.
                    pedido.params[4].asstring:= fechaac;    //fecha
                    pedido.params[5].AsString:= floattostr(tot_siva); // FLOATTOSTR(tot_exe + (tot_exe *  (qBUSARTI.fieldbyname('pRECIO_4').Asfloat/100)));          // total

                    pedido.params[6].AsString:=  floattostr(tot_15);
                   // FLOATTOSTR(tot_15 + (tot_15 *  (qBUSARTI.fieldbyname('pRECIO_4').Asfloat/100)));           // total con iva
                     pedido.params[7].AsString:=  '0';                         // descuento al total
                     pedido.params[8].AsString:=  '0';                         // descuento al tot 15
                     pedido.params[9].AsString:=   FLOATTOSTR(sacariva);
                    // floattostr(sacariva + (sacariva *  (qBUSARTI.fieldbyname('PRECIO_4').Asfloat/100)));        // iva
                     pedido.params[10].AsString:=  '0';                         // flete
                     pedido.params[11].AsString:=  '0';                         // iva del flete
                     pedido.execproc;



                            //aqui va lo de NEZE

             {       if codigobien <> 'C62T' then
                    begin

                    pedido.params[0].AsString:= '07';         //num empresa
                    pedido.params[1].asstring:= '07';     //num_sucursal
                    pedido.params[2].AsString:= edit1.Text;                 //no. pedido
                    pedido.params[3].AsString:=   CODIGOBIEN;  //codigo prov.
                    pedido.params[4].asstring:= fechaac;    //fecha
                    pedido.params[5].AsSTRING:=   floattostr(tot_exe);          // total
                    pedido.params[6].AsSTRING:=   floattostr(tot_15);           // total con iva
                    pedido.params[7].AsSTRING:=  '0';                         // descuento al total
                    pedido.params[8].AsSTRING:=  '0';                         // descuento al tot 15
                    pedido.params[9].AsSTRING:=  FLOATTOSTR(sacariva);
                    pedido.params[10].AsSTRING:= '0';                   // flete
                    pedido.params[11].AsSTRING:=  '0';                         // iva del flete
                  {  pedido.Params[12].AsString:= '0';
                    pedido.params[13].asstring:= '0';
                    pedido.Params[14].asstring:= '';   }
             //       pedido.execproc;

              //      end;





                       //actualizo consecutivo de entradas y salidas del terreno

                        if CODIGOBIEN ='C62T' THEN
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



                              if CODIGOBIEN ='C7BL' THEN
                        BEGIN
                            //AQUI ACTUALIZO LOS CONSECUTIVOS DE ENTRADA Y SALIDA

                                qupent.Close;
                                qupent.ParamByName('num_emp').AsString := '14';
                                qupent.ParamByName('num_ent').AsString :=  FLOATTOSTR(NUM_ENT);
                                qupent.ExecSQL;

                                qactu.Close;
                                qactu.parambyname('num_emp').asstring:= '14';
                                qactu.parambyname('num_ent').asstring:=  FLOATTOSTR(NUM_sal);
                                qactu.ExecSQL;

                         END;



                   //    totieps := strtofloat(floattostrf(totieps, ffnumber, 10,2));
                       iepsilon:= stripped(',', floattostr(totieps));
                  //     totiepsilon := floattostrf(strtofloat(iepsilon) +(strtofloat(iepsilon) * (qBUSARTI.fieldbyname('PRECIO_4').Asfloat/100)), ffnumber, 10,2);
                  //     totiepsilon := stripped(',', totiepsilon);

                     //ACTUALIZO EL IEPS EN INARPED


                    IF (TOTIEPS <> 0.00) OR (TOTIEPS <> 0) THEN
                    BEGIN

                  {  acuiepsilon := floattostrf((strtofloat(totiepsilon)/(8/100)), ffnumber, 10,2);
                    acuiepsilon := stripped(',', acuiepsilon); }

                    acuiepsilon2 := floattostrf((strtofloat(iepsilon)/(8/100)), ffnumber, 10,2);
                    acuiepsilon2 := stripped(',', acuiepsilon2);

                    qupinarped.CLOSE;
                    qupinarped.ParamByName('tot_ieps').AsString := iepsilon;      //totiepsilon;
                    qupinarped.ParamByName('acuieps').AsString :=  acuiepsilon2; //acuiepsilon;
                    qupinarped.parambyname('num_ped').AsString := edit1.Text;
                    qupinarped.parambyname('num_emp').AsString :=NUMEMPRESA.TEXT;
                    qupinarped.EXECSQL;

                   { acuiepsilon2 := floattostrf((strtofloat(iepsilon)/(8/100)), ffnumber, 10,2);
                    acuiepsilon2 := stripped(',', acuiepsilon2);


                    qupinarped.close;
                    qupinarped.ParamByName('tot_ieps').AsString := iepsilon;
                    qupinarped.ParamByName('acuieps').AsString := acuiepsilon2;
                    qupinarped.parambyname('num_ped').AsString := edit1.Text;
                    qupinarped.parambyname('num_emp').AsString := '07';
                    qupinarped.execsql; }

                    END;




    qsaca.close;
    edit1.text :='';
    edit1.SetFocus;

    edtotal.Text:= '';
    ieps.text := '';

    tran_prov.Close;
    tran_prov.EmptyTable;
    codigob.keyvalue:= null;
    opcion.itemindex := -1;
    nom_pro.keyvalue:= null;
    raz_soc.keyvalue:= null;
    edit2.Text := '';
    opcion.Visible := false;

  end; 

end;



procedure TForm1.BitBtn1Click(Sender: TObject);
begin
     edit1.text :='';
     FIdPresentacionSel := 0;
     kil_pro.ReadOnly := False;
     caj_pro.text:= '0';
     kil_pro.text:= '0';
     pre_pro.text:= '0';
     tot_pro.text:= '0';
     cod_art22.Text:='';
     name_pro.Text:='';
     dir_pro.Text:= '';
     ciu_pro.Text:='';
     qsaca.Close;
     cancelado:= 1;

     opcion.visible := false; 

     nom_pro.KeyValue := null;
     raz_soc.KeyValue := null;
     tel_pro.Text := '';

     codigob.KeyValue := null;
     maot.Text := '0';
     importe.Text := '0';
     ieps.Text := '0';
     edtotal.Text := '0';
     importe.Text := '0';
     opcion.Visible := false;
     edit2.text:= '';

    tran_prov.Close;
    tran_prov.EmptyTable;


end;




procedure TForm1.opcionClick(Sender: TObject);
begin
      if opcion.ItemIndex = 0 then
        begin
            qcodpro.close;

            qnompro.Close;
            qnompro.parambyname('num_emp').asstring:= numempresa.text;
            qnompro.open;

            raz_soc.Visible:= false;
            nombre.Caption:='Codigo Prov. ';
            name_pro.Visible:= true;
            label14.Visible:= true;
            edit2.visible:= false;
            label14.caption:= 'Nombre';


                  qcodi.close;
                  qcodi.ParamByName('codicli').asstring:= numempresa.text;
                  qcodi.Open;


              //   IF OPCION.ItemIndex = 0 then
              //        begin

                      qcodpro.close;
                      qnompro.Close;
                      qnompro.parambyname('num_emp').asstring:= numempresa.text;
                      qnompro.open;

                      raz_soc.Visible:= false;
                      nombre.Caption:='Codigo Prov. ';
                      name_pro.Visible:= true;
                      label14.Visible:= true;
                      edit2.visible:= false;
                      label14.caption:= 'Nombre';

                      nom_pro.SetFocus;
               //       end;


         end;

      if opcion.itemindex = 1 then
          begin
            qnompro.close;

            qcodpro.close;
            qcodpro.ParamByName('num_emp').asstring:= numempresa.text;
            qcodpro.open;

            nombre.Caption:='Nombre ';
            label5.Visible:= false;
            raz_soc.Visible:= true;
            tel_pro.Visible:= false;
            edit2.Visible:= true;
            name_pro.visible:= false;
            label14.visible:= false;

           // if opcion.ItemIndex = 1 then
           //           begin
                       qnompro.close;
                       qcodpro.Close;
                       qcodpro.ParamByName('num_emp').asstring:=numempresa.text;
                       qcodpro.open;

                        nombre.Caption:='Nombre ';
                        label5.Visible:= false;
                        raz_soc.Visible:= true;
                        tel_pro.Visible:= false;
                        edit2.Visible:= true;
                        name_pro.visible:= false;
                        label14.visible:= false;

                        raz_soc.SetFocus;
             //         end;

           end;
end;

procedure TForm1.raz_socClick(Sender: TObject);
var
  key : char;
begin
    name_pro.text:= qcodpro.fieldbyname('raz_soc').asstring;
    tel_pro.text:= qcodpro.fieldbyname('tel_1').asstring;
    dir_pro.text:= qcodpro.fieldbyname('dom_pro').asstring;
    ciu_pro.text:= qcodpro.fieldbyname('ciu_pro').asstring;
    numero_emp:= qcodpro.fieldbyname('num_emp').asstring;
    codigobien:= qcodpro.fieldbyname('cod_pro').asstring;
    fechauno.Date:= now;

 {     query2.Close;
    query2.ParamByName('cod_pro').AsString := codigobien;
    query2.Open;

    if query2.FieldByName('cod_pro').AsString = '' then
       begin
         showmessage('Da de alta el Prov. en la Emp 03');
          name_pro.text:= '';
    tel_pro.text:= '';
    dir_pro.text:= '';
    ciu_pro.text:= '';
    numero_emp:= '';
    codigobien:= '';
    fechauno.Date:= now;
         exit
       end; }



    edit2.text:= codigobien;

    if   (key= #13) then
        begin
          if codigob.visible = true then
                 codigob.SetFocus
              else
                 des_pro22.setfocus;
        end;

end;




procedure TForm1.des_pro22Click(Sender: TObject);
begin
    caj_pro.text:= '0';
    kil_pro.text:= '0';
    pre_pro.text:= '0';
    tot_pro.text:= '0';

    cod_Art22.text:= qart.fieldbyname('cod_Art').AsString;

end;



procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin

       if (KEY = #13) then
             begin
                   qrevisa.Close;
                   qrevisa.ParamByName('num_ped').asstring:= edit1.text;
                   qrevisa.ParamByName('num_emp').asstring:= numempresa.text;
                   qrevisa.Open;

                  if  qrevisa.FieldByName('num_ped').asstring <> '' then
                  begin
                        stop('Este pedido ya existe Revisalo');
                        edit1.text:= '';
                        edit1.SetFocus;
                  end;


                  opcion.Visible := true;

                  opcion.ItemIndex := 0;

                  nom_pro.SetFocus;

                
                end;
end;

procedure TForm1.FormShow(Sender: TObject);
var

    fechabien: string;

begin
     fechabien:= datetostr(date);
     fechauno.Date:= strtodate(fechabien);
     qnumemp.open;
     numempresa.SetFocus;
end;

procedure TForm1.nom_proKeyPress(Sender: TObject; var Key: Char);
begin
     if (KEY = #13) then
        begin
          if codigob.visible = true then
                 codigob.SetFocus
              else
                 des_pro22.setfocus;
        end;
end;

procedure TForm1.raz_socKeyPress(Sender: TObject; var Key: Char);
begin
if (KEY = #13) then
        begin
          if codigob.visible = true then
                 codigob.SetFocus
              else
                 des_pro22.setfocus;
        end;
end;

procedure TForm1.des_pro22KeyPress(Sender: TObject; var Key: Char);
begin
                       if (KEY = #13) then
                            begin
                               caj_pro.SetFocus;
                            end

end;

procedure TForm1.Tot_proKeyPress(Sender: TObject; var Key: Char);
var
  totalin, totalkil, porccaj, totalcaj, porckil, totdes, descto, ultiva, imp_gravado, gravado, saca, mul : real;
  cantiem, lineaven, sitiene, totiva, iva, codigo:string;
  pagado:integer;
begin

if (KEY = #13) then
     begin
      sitiene:= '0';
      renglon:= renglon + 1;
      fecha:= datetostr(date);
      pagado:= 0;
      tiva.Close;

   {     QBUSARTI.Close;
        QBUSARTI.ParamByName('NUM_EMP').AsString := '03';
        QBUSARTI.ParamByName('COD_aRT').AsString := codigob.Text;
        QBUSARTI.Open;


        if qbusarti.FieldByName('num_emp').AsString = '' then
        begin
            showmessage('NO existe este codigo en la empresa 03 darlo de alta');
            codigob.SetFocus;
            exit;

        end; }



      if (FIdPresentacionSel = 0) and (strtofloat(caj_pro.text)> strtofloat(kil_pro.Text)) then
        begin
             FORM2.Label1.Caption:='Checa las Cantidades en Cajas y Kgs ';
             if FORM2.ShowModal = mrOK then
                 caj_pro.SetFocus;
              caj_pro.SelectAll;
              FORM2.Close;
        end
        else

          if edit1.text='' then
              begin
               FORM2.Label1.Caption:='  Favor de Poner No. Pedido ';
               if FORM2.ShowModal = mrOK then
                  edit1.SetFocus;
              edit1.SelectAll;
              FORM2.Close;
        end
        else
      IF (Name_pro.text = '') THEN
         begin
            FORM2.Label1.Caption:='  Favor de Seleccionar Proveedor  ';
            if FORM2.ShowModal = mrOK then
            nom_pro.SetFocus;
            FORM2.Close;
        end
       ELSE
      if descripci = '' then
        begin
            FORM2.Label1.Caption:='  Favor de Poner el Codigo  ';
            if FORM2.ShowModal = mrOK then
            cod_art.SetFocus;
            FORM2.Close;
        end
     else
       if (kilo =0) or ( precio=0) or (caja=0) then
          begin
            FORM2.Label1.Caption:='  Revisa Cantidad en Caja/Kilos/Precio  ';
            if FORM2.ShowModal = mrOK then
              kil_pro.SetFocus;
              kil_pro.SelectAll;
              FORM2.Close;
            end
          ELSE
      begin
        codigo:= codigobn;
        tiva.parambyname('IVA').asstring:=CODIGO;
        TIVA.PARAMBYNAME('NUM_EMP').ASSTRING:= NUMEMPRESA.TEXT;
        tiva.Open;
        totiva:= tiva.fieldbyname('iva').asstring;

        if totiva <> '0' then
          begin
            mul:= strtofloat(totiva);
            mul:= (mul/100) + 1;
            saca:= total * mul;
            ULTIVA:= saca - total;
            finiva:= finiva + ultiva;
          //  sitiene:= '16'
          END;



 {

if (KEY = #13) then
     begin
      sitiene:= '0';
      renglon:= renglon + 1;
      fecha:= datetostr(date);
      pagado:= 0;
      if (strtofloat(caj_pro.text) > strtofloat(kil_pro.Text)) then
        begin
             FORM2.Label1.Caption:='Checa las Cantidades en Cajas y Kgs ';
            if FORM2.ShowModal = mrOK then
            caj_pro.SetFocus;
             caj_pro.SelectAll;
              FORM2.Close;
        end
        else




      if edit1.text='' then
        begin
             FORM2.Label1.Caption:='  Favor de Poner No. Pedido ';
            if FORM2.ShowModal = mrOK then
            edit1.SetFocus;
              edit1.SelectAll;
              FORM2.Close;
        end
        else
      IF (Name_pro.text = '') THEN
         begin
            FORM2.Label1.Caption:='  Favor de Seleccionar Proveedor  ';
            if FORM2.ShowModal = mrOK then
            nom_pro.SetFocus;
            FORM2.Close;
        end
       ELSE
      if descripci = '' then
        begin
            FORM2.Label1.Caption:='  Favor de Poner el Codigo  ';
            if FORM2.ShowModal = mrOK then
            cod_art.SetFocus;
            FORM2.Close;
        end
     else
       if (kilo =0) or ( precio=0) or (caja=0) then
          begin
            FORM2.Label1.Caption:='  Revisa Cantidad en Caja/Kilos/Precio  ';
            if FORM2.ShowModal = mrOK then
              kil_pro.SetFocus;
              kil_pro.SelectAll;
              FORM2.Close;
            end
          ELSE
      begin

        codigo:= codigobn;
        tiva.close;
        tiva.parambyname('num_emp').asstring:= numempresa.text;
        tiva.parambyname('IVA').asstring:=CODIGO;
        tiva.Open;
        totiva:= tiva.fieldbyname('iva').asstring;

        if totiva <> '0' then
          begin
            mul:= strtofloat(totiva);
            mul:= (mul/100) + 1;
            saca:= total * mul;
            ULTIVA:= saca - total;
            finiva:= finiva + ultiva;
            // sitiene:= '16'
          END;      }



      IF (CODIGOBIEN ='C62T') THEN
      begin

          qinven.Close;
          qinven.ParamByName('cod_art').AsString := codigob.Text+'T';
          qinven.parambyname('num_emp').asstring := numempresa.text;
          qinven.Open;

          if qinven.fieldbyname('cod_art').asstring = '' then
          begin
               showmessage ('Codigo no esta dado de Alta');
               exit;
          end;



      end;



        IF (CODIGOBIEN ='C7BL') THEN
      begin

          qinven.Close;
          qinven.ParamByName('cod_art').AsString := codigob.Text+'B7';
          qinven.parambyname('num_emp').asstring := numempresa.text;
          qinven.Open;

          if qinven.fieldbyname('cod_art').asstring = '' then
          begin
               showmessage ('Codigo no esta dado de Alta');
               exit;
          end;



      end;



      if FIdPresentacionSel = 0 then
      begin
      // articulo no migrado a presentaciones: se conserva integro el
      // chequeo cruzado de cajas/kilos contra el can_emp de siempre.
      // Para articulos con presentacion, kil_pro ya viene calculado
      // desde Cantidad+factor+tara (caj_proExit) y este chequeo no aplica.
      qinven.Close;
      qinven.ParamByName('cod_art').AsString := codigob.Text;
      qinven.parambyname('num_emp').asstring := numempresa.text;
      qinven.Open;

      cantiem:= qinven.fieldbyname('can_emp').asstring;

      IF CANTIEM = '0' THEN
            BEGIN
              SHOWMESSAGE ('REVISA EL CANEMP DE ESTE CODIGO');
              EXIT;
            END;


      lineaven:= qinven.fieldbyname('tip_art').asstring;

      FORM4.Edit1.TEXT:='HOLA';
      FORM4.Edit1.SelectAll;

      if lineaven ='C' then
          begin
            totalcaj:= strtofloat(caj_pro.Text)* strtofloat(cantiem);
             PORCKIL:= (totalcaj / strtofloat(kil_pro.text));

                 IF ((porckil < 0.50) OR (porckil > 1.50)) then
                    begin
                    if question('Estan bien tus cantidades en Kilos y Cajas') = true then
                    begin
                     form4.cvedes.Open;
                     form4.Showmodal;
                     WHile form4.cvedes.FieldByName('pass').AsString <> form4.edit1.Text do
                       begin
                          form4.edit1.SelectAll;
                          form4.showmodal;
                       end;
                       form4.Close;
                    end
                    else
                    exit;


                    end;
            end;



     if lineaven ='K' then
          begin
             totalkil:= strtofloat(kil_pro.text) /  strtofloat(cantiem);
             PORCCAJ:= (totalkil /strtofloat(caj_pro.text));


             IF (porccaj < 0.50) OR (porccaj > 1.50) then
                 begin
                 if question('Estan bien tus cantidades en Kilos y Cajas') = true then
                    begin
                     form4.cvedes.Open;
                     form4.Showmodal;
                     WHile form4.cvedes.FieldByName('pass').AsString <> form4.edit1.Text do
                       begin
                          form4.edit1.SelectAll;
                          form4.showmodal;
                       end;
                       form4.Close;
                     END
                      ELSE
                      EXIT;



                 end;
             end;
      end;




 if  question('Estas seguro de agregar') = true then
      begin


        qieps.Close;
        qieps.parambyname('codigo').AsString := codigob.Text;
        qieps.Open;



        if qieps.FieldByName('codigo').AsString <> '' then
                  //     if question('Lleva IEPS ?') = true then
                tot_ieps := total * (8/100)
             else
                tot_ieps := 0;


        if (tot_ieps <> 0) or (finiva <> 0) then
                  totalin := 0
               else
                  totalin := total;



        tran_prov.Close;
        tran_prov.open;
        tran_prov.AppendRecord([numero_emp, numero_emp, edit1.text, codigobien, tel_pro.text, name_pro.text, dir_pro.text,
                  ciu_pro.text, codigobn, descripci, caj_pro.text, kil_pro.text, pre_pro.text,
                  total, renglon, cancelado, totalin, finiva, '0', floattostr(tot_ieps)] );



      cod_art22.Text:='';
      desarti.text:='';
      caj_pro.Text:='0';
      kil_pro.Text:= '0';
      pre_pro.text:= '0';
      tot_pro.text:='0';
      TOT_IEPS := 0;
      


      SACAIN;
      end;

   if codigob.visible = true then
         codigob.setfocus
       else
          des_pro22.setfocus;

   END;
END;
END;

//END;
//END;


procedure TForm1.BitBtn4Click(Sender: TObject);
var
    no_pedido: string;
begin
     if question ('� Estas seguro borrar'+ qsaca.fieldbyname('cod_art').asstring )= true then
      begin
         tran_prov.close;
         tran_prov.open;
         tran_prov.first;

         while not tran_prov.eof do
         begin
         if (tran_prov.FieldByName('no_pedido').AsString = qsaca.fieldbyname('no_pedido').asstring) and
            (tran_prov.FieldByName('cod_art').AsString = qsaca.fieldbyname('cod_art').asstring) and
            (tran_prov.FieldByName('renglon').AsString = qsaca.fieldbyname('renglon').AsString) then
              begin
                tran_prov.Edit;
                tran_prov.Delete;
              end;

          tran_prov.Next;
          end;
       end;

       qsaca.close;
       qsaca.open;
       sacain;

end;


procedure TForm1.Edit1Exit(Sender: TObject);
begin
     qrevisa.Close;
     qrevisa.ParamByName('num_ped').asstring:= edit1.text;
     qrevisa.ParamByName('num_EMP').asstring:= numempresa.text;
     qrevisa.Open;

    if  qrevisa.FieldByName('num_ped').asstring <> '' then
         begin
          stop('Este pedido ya existe Revisalo');
          edit1.text:= '';
          edit1.SetFocus;
         end;

             qcodi.close;
            qcodi.ParamByName('codicli').asstring:= num_emp;
            qcodi.Open;
end;


procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  //   EXIT;
end;

procedure TForm1.btImprimirClick(Sender: TObject);
begin
  if Trim(edit1.text) = '' then
  begin
    showmessage('Primero captura o selecciona el numero de pedido');
    edit1.SetFocus;
    exit;
  end;

  qsaca.Close;
  qsaca.ParamByName('no_pedido').AsInteger := strtoint(edit1.text);
  qsaca.Open;

  if qsaca.Eof then
  begin
    showmessage('Este pedido no tiene productos capturados');
    exit;
  end;

  // datos generales de la orden; el .rav debe traer un objeto de texto
  // ligado a la variable global CODBARRAS con una fuente de codigo de
  // barras (Code 39) instalada -- el * al inicio/fin lo exige ese
  // formato de barra. El detalle (cod_art, cantidades, precio) ya
  // viaja por el dataset qsaca via el componente Orden (TRvDataSetConnection).
  RvProject1.SetParam('NUM_PEDIDO', edit1.text);
  RvProject1.SetParam('CODBARRAS', '*' + Trim(edit1.text) + '*');
  RvProject1.SetParam('PROVEEDOR', name_pro.Text);
  RvProject1.SetParam('FECHA', datetostr(fechauno.Date));
  RvProject1.SetParam('TOTAL', edtotal.Text);

  RvSystem1.DefaultDest := rdPreview;
  RvSystem1.SystemSetups := RvSystem1.SystemSetups - [ssAllowSetup];

  RvProject1.Open;
  RvProject1.Execute;
  RvProject1.Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
     form3.show;
end;

procedure TForm1.opcion2Click(Sender: TObject);
begin
      if opcion2.ItemIndex = 0 then
        begin
   //         qart.close;
            qcodi.Close;
            qcodi.ParamByName('codicli').AsString:= numempresa.Text;
            qcodi.open;

            des_pro22.Visible:= false;
            cod_art22.visible:= false;
            codigob.Visible:=true;
            desarti.Visible:=true;
            label2.Caption:= 'Codigo';
            label3.caption:= 'Descripcion';


         end;

      if opcion2.itemindex = 1 then
          begin
            qart.Close;
            qart.parambyname('num_emp').AsString:= numempresa.text;
            qart.open;

            qcodi.close;
            des_pro22.Visible:= true;
            cod_art22.visible:= true;
            codigob.Visible:=false;
            desarti.Visible:=false;
            label2.Caption:= 'Descripcion';
            label3.caption:= 'Codigo';
          end;
end;

procedure TForm1.CodigobClick(Sender: TObject);
var
    key: char;
begin
      caj_pro.text:= '0';
    kil_pro.text:= '0';
    pre_pro.text:= '0';
    tot_pro.text:= '0';

    desarti.Text:= qcodi.fieldbyname('des_Art').AsString;

    if   (key= #13) then
           caj_pro.SetFocus;

end;

procedure TForm1.CodigobExit(Sender: TObject);
begin
      if cod_art22.Text= '' then
   begin
    codigobn:=  codigob.text;
    descripci:= desarti.text;
   end
   else
   begin
    codigobn:=  cod_art22.text;
    descripci:= des_pro22.text;
   end;
   ResuelvePresentacion;
end;

procedure TForm1.des_pro22Exit(Sender: TObject);
begin
    if cod_art22.Text= '' then
   begin
    codigobn:=  codigob.text;
    descripci:= desarti.text;
   end
   else
   begin
    codigobn:=  cod_art22.text;
    descripci:= des_pro22.text;
   end;
   ResuelvePresentacion;
end;



procedure TForm1.CodigobKeyPress(Sender: TObject; var Key: Char);
begin
if (KEY = #13) then
                       begin
                             caj_pro.SetFocus;
                        end
end;

procedure TForm1.numempresaClick(Sender: TObject);
begin
     num_emp:= numempresa.text;
end;

procedure TForm1.numempresaKeyPress(Sender: TObject; var Key: Char);
begin
       IF KEY = (#13) THEN
            BEGIN
                EDIT1.SetFocus;
            END;
end;


procedure TForm1.ResuelvePresentacion;
begin
  // se reinicia en cada articulo: si el siguiente codigo no tiene
  // presentaciones capturadas, se sigue exactamente igual que hoy
  FIdPresentacionSel := 0;
  FCodArtResuelto := codigobn;
  FFactorPresentacion := 1;
  FPrecioDerivadoSel := False;
  FTaraSel := 0;
  FEsVariableSel := False;
  kil_pro.ReadOnly := False;

  if Trim(codigobn) = '' then
    Exit;

  TFormPresentacion.Seleccionar(Database1, codigobn, 'C', FIdPresentacionSel,
    FCodArtResuelto, FFactorPresentacion, FPrecioDerivadoSel, FTaraSel,
    FEsVariableSel);

  if FIdPresentacionSel > 0 then
  begin
    if FCodArtResuelto <> '' then
      codigobn := FCodArtResuelto;
    kil_pro.ReadOnly := True;
  end;
end;

function TForm1.BuscaCanEmp(const CodArt: string): Double;
begin
  Result := 0;
  qBuscaCanEmp.Close;
  qBuscaCanEmp.ParamByName('emp').AsString := numempresa.Text;
  qBuscaCanEmp.ParamByName('cod').AsString := Trim(CodArt);
  qBuscaCanEmp.Open;
  if not qBuscaCanEmp.Eof then
    Result := qBuscaCanEmp.FieldByName('can_emp').AsFloat;
  qBuscaCanEmp.Close;
end;

function TForm1.ConvierteCantidad(Cantidad, Factor, Tara: Double;
  EsVariable: Boolean): Double;
begin
  if EsVariable then
    // peso variable: 'Cantidad' ya es el peso bruto leido en bascula,
    // se resta la tara una sola vez (la del envase que se peso)
    Result := Cantidad - Tara
  else
    // cantidad contada (no se pesa): se resta la tara de CADA unidad
    Result := (Cantidad * Factor) - (Cantidad * Tara);
end;

function Tform1.stripped(stripchar : char; str : string) : string;
 var
   tmpstr : string;
 begin
   tmpstr := str;
   while pos(stripchar, tmpstr) > 0 do
     delete(tmpstr, pos(stripchar, tmpstr), 1);
   stripped := tmpstr;
 end;


end.
