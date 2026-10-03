object FormMantBitacoraFlotilla: TFormMantBitacoraFlotilla
  Left = 140
  Top = 110
  Caption = 'Bitacora de Combustible y Mantenimiento'
  ClientHeight = 520
  ClientWidth = 860
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlIzq: TPanel
    Left = 8
    Top = 8
    Width = 380
    Height = 504
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
      Width = 170
      Height = 13
      Caption = 'Buscar vehiculo (economico o placas)'
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
      Height = 200
      DataSource = dsVehiculos
      TabOrder = 2
      OnDblClick = dbgVehiculosDblClick
    end
    object lblVehiculoSel: TLabel
      Left = 0
      Top = 286
      Width = 200
      Height = 13
      Caption = 'Vehiculo: (ninguno seleccionado)'
    end
    object lblBitacora: TLabel
      Left = 0
      Top = 310
      Width = 160
      Height = 13
      Caption = 'Bitacora de este vehiculo'
    end
    object dbgBitacora: TDBGrid
      Left = 0
      Top = 328
      Width = 372
      Height = 140
      DataSource = dsBitacora
      TabOrder = 3
    end
    object btnEliminarBitacora: TButton
      Left = 0
      Top = 474
      Width = 160
      Height = 25
      Caption = 'Eliminar registro'
      TabOrder = 4
      OnClick = btnEliminarBitacoraClick
    end
  end
  object pnlDer: TPanel
    Left = 400
    Top = 8
    Width = 452
    Height = 504
    BevelOuter = bvNone
    object rgTipoEvento: TRadioGroup
      Left = 0
      Top = 0
      Width = 220
      Height = 40
      Caption = 'Tipo de evento'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Combustible'
        'Mantenimiento')
      TabOrder = 0
    end
    object lblFecha: TLabel
      Left = 240
      Top = 0
      Width = 90
      Height = 13
      Caption = 'Fecha (dd/mm/aaaa)'
    end
    object edtFecha: TEdit
      Left = 240
      Top = 18
      Width = 120
      Height = 21
      TabOrder = 1
    end
    object lblKilometraje: TLabel
      Left = 0
      Top = 56
      Width = 90
      Height = 13
      Caption = 'Kilometraje (odometro)'
    end
    object edtKilometraje: TEdit
      Left = 0
      Top = 74
      Width = 120
      Height = 21
      TabOrder = 2
    end
    object lblLitros: TLabel
      Left = 140
      Top = 56
      Width = 85
      Height = 13
      Caption = 'Litros (combustible)'
    end
    object edtLitros: TEdit
      Left = 140
      Top = 74
      Width = 100
      Height = 21
      TabOrder = 3
    end
    object lblCosto: TLabel
      Left = 260
      Top = 56
      Width = 30
      Height = 13
      Caption = 'Costo'
    end
    object edtCosto: TEdit
      Left = 260
      Top = 74
      Width = 100
      Height = 21
      TabOrder = 4
    end
    object lblTallerProveedor: TLabel
      Left = 0
      Top = 112
      Width = 150
      Height = 13
      Caption = 'Gasolinera o taller/proveedor'
    end
    object edtTallerProveedor: TEdit
      Left = 0
      Top = 130
      Width = 360
      Height = 21
      TabOrder = 5
    end
    object lblDescripcion: TLabel
      Left = 0
      Top = 168
      Width = 220
      Height = 13
      Caption = 'Descripcion (ej. Diesel, Cambio de aceite)'
    end
    object edtDescripcion: TEdit
      Left = 0
      Top = 186
      Width = 360
      Height = 21
      TabOrder = 6
    end
    object lblObservaciones: TLabel
      Left = 0
      Top = 224
      Width = 90
      Height = 13
      Caption = 'Observaciones'
    end
    object edtObservaciones: TEdit
      Left = 0
      Top = 242
      Width = 440
      Height = 21
      TabOrder = 7
    end
    object btnAgregarBitacora: TButton
      Left = 0
      Top = 274
      Width = 160
      Height = 25
      Caption = 'Agregar a bitacora'
      TabOrder = 8
      OnClick = btnAgregarBitacoraClick
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
    Left = 792
    Top = 8
  end
  object qVehiculos: TQuery
    DatabaseName = 'comyleg'
    Left = 792
    Top = 48
  end
  object dsVehiculos: TDataSource
    DataSet = qVehiculos
    Left = 792
    Top = 88
  end
  object qBitacora: TQuery
    DatabaseName = 'comyleg'
    Left = 792
    Top = 128
  end
  object dsBitacora: TDataSource
    DataSet = qBitacora
    Left = 792
    Top = 168
  end
end
