object FormMantChoferes: TFormMantChoferes
  Left = 150
  Top = 120
  Caption = 'Mantenimiento de Choferes'
  ClientHeight = 420
  ClientWidth = 760
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlIzq: TPanel
    Left = 8
    Top = 8
    Width = 380
    Height = 404
    BevelOuter = bvNone
    object lblEmpresa: TLabel
      Left = 0
      Top = 0
      Width = 40
      Height = 13
      Caption = 'Empresa'
    end
    object edtEmpresa: TEdit
      Left = 70
      Top = 0
      Width = 40
      Height = 21
    end
    object lblBuscaChofer: TLabel
      Left = 0
      Top = 30
      Width = 140
      Height = 13
      Caption = 'Buscar (nombre o clave)'
    end
    object edtBuscaChofer: TEdit
      Left = 0
      Top = 48
      Width = 260
      Height = 21
    end
    object btnBuscarChofer: TButton
      Left = 268
      Top = 47
      Width = 100
      Height = 23
      Caption = 'Buscar'
      OnClick = btnBuscarChoferClick
    end
    object dbgChoferes: TDBGrid
      Left = 0
      Top = 76
      Width = 372
      Height = 320
      DataSource = dsChoferes
      TabOrder = 2
      OnDblClick = dbgChoferesDblClick
    end
  end
  object pnlDer: TPanel
    Left = 400
    Top = 8
    Width = 352
    Height = 404
    BevelOuter = bvNone
    object lblClave: TLabel
      Left = 0
      Top = 0
      Width = 24
      Height = 13
      Caption = 'Clave'
    end
    object edtClave: TEdit
      Left = 0
      Top = 18
      Width = 120
      Height = 21
      TabOrder = 0
    end
    object lblNombre: TLabel
      Left = 0
      Top = 56
      Width = 36
      Height = 13
      Caption = 'Nombre'
    end
    object edtNombre: TEdit
      Left = 0
      Top = 74
      Width = 340
      Height = 21
      TabOrder = 1
    end
    object lblLicencia: TLabel
      Left = 0
      Top = 112
      Width = 80
      Height = 13
      Caption = 'No. de licencia'
    end
    object edtLicencia: TEdit
      Left = 0
      Top = 130
      Width = 160
      Height = 21
      TabOrder = 2
    end
    object lblVigenciaLicencia: TLabel
      Left = 180
      Top = 112
      Width = 120
      Height = 13
      Caption = 'Vigencia (dd/mm/aaaa)'
    end
    object edtVigenciaLicencia: TEdit
      Left = 180
      Top = 130
      Width = 120
      Height = 21
      TabOrder = 3
    end
    object lblTelefono: TLabel
      Left = 0
      Top = 168
      Width = 46
      Height = 13
      Caption = 'Telefono'
    end
    object edtTelefono: TEdit
      Left = 0
      Top = 186
      Width = 160
      Height = 21
      TabOrder = 4
    end
    object chkChoferActivo: TCheckBox
      Left = 0
      Top = 216
      Width = 100
      Height = 17
      Caption = 'Activo'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object btnNuevoChofer: TButton
      Left = 0
      Top = 248
      Width = 110
      Height = 25
      Caption = 'Nuevo'
      TabOrder = 6
      OnClick = btnNuevoChoferClick
    end
    object btnGuardarChofer: TButton
      Left = 118
      Top = 248
      Width = 110
      Height = 25
      Caption = 'Guardar'
      TabOrder = 7
      OnClick = btnGuardarChoferClick
    end
    object btnEliminarChofer: TButton
      Left = 236
      Top = 248
      Width = 110
      Height = 25
      Caption = 'Eliminar'
      TabOrder = 8
      OnClick = btnEliminarChoferClick
    end
  end
  object Database1: TDatabase
    AliasName = 'comyleg'
    Connected = True
    DatabaseName = 'comyleg'
    LoginPrompt = False
    Params.Strings = (
      'user name=informix'
      'password=infocol'
      '=')
    SessionName = 'Default'
    Left = 692
    Top = 8
  end
  object qChoferes: TQuery
    DatabaseName = 'comyleg'
    Left = 692
    Top = 48
  end
  object dsChoferes: TDataSource
    DataSet = qChoferes
    Left = 692
    Top = 88
  end
end
