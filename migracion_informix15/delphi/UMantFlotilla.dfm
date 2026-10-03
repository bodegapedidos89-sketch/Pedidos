object FormMantFlotilla: TFormMantFlotilla
  Left = 140
  Top = 110
  Caption = 'Mantenimiento de Flotilla de Reparto'
  ClientHeight = 460
  ClientWidth = 820
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlIzq: TPanel
    Left = 8
    Top = 8
    Width = 380
    Height = 444
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
    object lblBuscaVehiculo: TLabel
      Left = 0
      Top = 30
      Width = 220
      Height = 13
      Caption = 'Buscar (numero economico, placas o marca)'
    end
    object edtBuscaVehiculo: TEdit
      Left = 0
      Top = 48
      Width = 260
      Height = 21
    end
    object btnBuscarVehiculo: TButton
      Left = 268
      Top = 47
      Width = 100
      Height = 23
      Caption = 'Buscar'
      OnClick = btnBuscarVehiculoClick
    end
    object dbgVehiculos: TDBGrid
      Left = 0
      Top = 76
      Width = 372
      Height = 360
      DataSource = dsVehiculos
      TabOrder = 2
      OnDblClick = dbgVehiculosDblClick
    end
  end
  object pnlDer: TPanel
    Left = 400
    Top = 8
    Width = 412
    Height = 444
    BevelOuter = bvNone
    object lblNumEconomico: TLabel
      Left = 0
      Top = 0
      Width = 98
      Height = 13
      Caption = 'Numero economico'
    end
    object edtNumEconomico: TEdit
      Left = 0
      Top = 18
      Width = 160
      Height = 21
      TabOrder = 0
    end
    object rgTipoVehiculo: TRadioGroup
      Left = 180
      Top = 0
      Width = 220
      Height = 40
      Caption = 'Tipo'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Camioneta'
        'Camion')
      TabOrder = 1
    end
    object lblPlacas: TLabel
      Left = 0
      Top = 56
      Width = 30
      Height = 13
      Caption = 'Placas'
    end
    object edtPlacas: TEdit
      Left = 0
      Top = 74
      Width = 160
      Height = 21
      TabOrder = 2
    end
    object lblMarca: TLabel
      Left = 180
      Top = 56
      Width = 30
      Height = 13
      Caption = 'Marca'
    end
    object edtMarca: TEdit
      Left = 180
      Top = 74
      Width = 220
      Height = 21
      TabOrder = 3
    end
    object lblModelo: TLabel
      Left = 0
      Top = 112
      Width = 35
      Height = 13
      Caption = 'Modelo'
    end
    object edtModelo: TEdit
      Left = 0
      Top = 130
      Width = 160
      Height = 21
      TabOrder = 4
    end
    object lblAnio: TLabel
      Left = 180
      Top = 112
      Width = 22
      Height = 13
      Caption = 'Año'
    end
    object edtAnio: TEdit
      Left = 180
      Top = 130
      Width = 80
      Height = 21
      TabOrder = 5
    end
    object lblCapacidadKg: TLabel
      Left = 0
      Top = 168
      Width = 112
      Height = 13
      Caption = 'Capacidad util (kg)'
    end
    object edtCapacidadKg: TEdit
      Left = 0
      Top = 186
      Width = 160
      Height = 21
      TabOrder = 6
    end
    object lblChofer: TLabel
      Left = 0
      Top = 224
      Width = 92
      Height = 13
      Caption = 'Chofer habitual'
    end
    object edtChofer: TEdit
      Left = 0
      Top = 242
      Width = 400
      Height = 21
      TabOrder = 7
    end
    object chkVehiculoActivo: TCheckBox
      Left = 0
      Top = 272
      Width = 100
      Height = 17
      Caption = 'Activo'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object btnNuevoVehiculo: TButton
      Left = 0
      Top = 304
      Width = 130
      Height = 25
      Caption = 'Nuevo'
      TabOrder = 9
      OnClick = btnNuevoVehiculoClick
    end
    object btnGuardarVehiculo: TButton
      Left = 138
      Top = 304
      Width = 130
      Height = 25
      Caption = 'Guardar'
      TabOrder = 10
      OnClick = btnGuardarVehiculoClick
    end
    object btnEliminarVehiculo: TButton
      Left = 276
      Top = 304
      Width = 130
      Height = 25
      Caption = 'Eliminar'
      TabOrder = 11
      OnClick = btnEliminarVehiculoClick
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
    Left = 752
    Top = 8
  end
  object qVehiculos: TQuery
    DatabaseName = 'comyleg'
    Left = 752
    Top = 48
  end
  object dsVehiculos: TDataSource
    DataSet = qVehiculos
    Left = 752
    Top = 88
  end
end
