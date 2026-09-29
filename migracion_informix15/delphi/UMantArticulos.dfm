object FormMantArticulos: TFormMantArticulos
  Left = 130
  Top = 100
  Caption = 'Mantenimiento de Productos y Presentaciones'
  ClientHeight = 560
  ClientWidth = 860
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlIzq: TPanel
    Left = 8
    Top = 8
    Width = 380
    Height = 544
    BevelOuter = bvNone
    object lblEmpresa: TLabel
      Left = 0
      Top = 0
      Width = 40
      Height = 13
      Caption = 'Empresa'
    end
    object lblBuscaProducto: TLabel
      Left = 0
      Top = 30
      Width = 138
      Height = 13
      Caption = 'Buscar producto (codigo o desc)'
    end
    object lblCodAncla: TLabel
      Left = 0
      Top = 210
      Width = 130
      Height = 13
      Caption = 'Codigo ancla (el que teclea el cajero)'
    end
    object lblDescProducto: TLabel
      Left = 0
      Top = 258
      Width = 58
      Height = 13
      Caption = 'Descripcion'
    end
    object edtEmpresa: TEdit
      Left = 70
      Top = 0
      Width = 40
      Height = 21
    end
    object edtBuscaProducto: TEdit
      Left = 0
      Top = 48
      Width = 260
      Height = 21
    end
    object btnBuscarProducto: TButton
      Left = 268
      Top = 47
      Width = 100
      Height = 23
      Caption = 'Buscar'
      OnClick = btnBuscarProductoClick
    end
    object dbgProductos: TDBGrid
      Left = 0
      Top = 76
      Width = 372
      Height = 128
      DataSource = dsProductos
      TabOrder = 2
      OnDblClick = dbgProductosDblClick
    end
    object edtCodAncla: TEdit
      Left = 0
      Top = 228
      Width = 200
      Height = 21
      TabOrder = 3
    end
    object edtDescProducto: TEdit
      Left = 0
      Top = 276
      Width = 372
      Height = 21
      TabOrder = 4
    end
    object chkProductoActivo: TCheckBox
      Left = 0
      Top = 304
      Width = 100
      Height = 17
      Caption = 'Activo'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object btnNuevoProducto: TButton
      Left = 0
      Top = 330
      Width = 118
      Height = 25
      Caption = 'Nuevo'
      TabOrder = 6
      OnClick = btnNuevoProductoClick
    end
    object btnGuardarProducto: TButton
      Left = 126
      Top = 330
      Width = 118
      Height = 25
      Caption = 'Guardar'
      TabOrder = 7
      OnClick = btnGuardarProductoClick
    end
    object btnEliminarProducto: TButton
      Left = 252
      Top = 330
      Width = 118
      Height = 25
      Caption = 'Eliminar'
      TabOrder = 8
      OnClick = btnEliminarProductoClick
    end
  end
  object pnlDer: TPanel
    Left = 400
    Top = 8
    Width = 452
    Height = 544
    BevelOuter = bvNone
    object lblPresentaciones: TLabel
      Left = 0
      Top = 0
      Width = 220
      Height = 13
      Caption = 'Presentaciones del producto seleccionado'
    end
    object lblCodLegacy: TLabel
      Left = 0
      Top = 160
      Width = 210
      Height = 13
      Caption = 'Codigo legacy real (el que ya esta en inarinv)'
    end
    object lblEtiqueta: TLabel
      Left = 0
      Top = 208
      Width = 42
      Height = 13
      Caption = 'Etiqueta'
    end
    object lblFactor: TLabel
      Left = 150
      Top = 208
      Width = 108
      Height = 13
      Caption = 'Factor a unidad base'
    end
    object lblTara: TLabel
      Left = 320
      Top = 208
      Width = 21
      Height = 13
      Caption = 'Tara'
    end
    object dbgPresentaciones: TDBGrid
      Left = 0
      Top = 18
      Width = 444
      Height = 138
      DataSource = dsPresentaciones
      TabOrder = 0
      OnDblClick = dbgPresentacionesDblClick
    end
    object edtCodLegacy: TEdit
      Left = 0
      Top = 178
      Width = 260
      Height = 21
      TabOrder = 1
    end
    object edtEtiqueta: TEdit
      Left = 0
      Top = 226
      Width = 140
      Height = 21
      TabOrder = 2
    end
    object edtFactor: TEdit
      Left = 150
      Top = 226
      Width = 100
      Height = 21
      TabOrder = 3
      Text = '1'
    end
    object edtTara: TEdit
      Left = 320
      Top = 226
      Width = 100
      Height = 21
      TabOrder = 4
      Text = '0'
    end
    object chkEsVariable: TCheckBox
      Left = 0
      Top = 256
      Width = 220
      Height = 17
      Caption = 'Es variable (peso en bascula, se resta tara)'
      TabOrder = 5
    end
    object chkPrecioDerivado: TCheckBox
      Left = 0
      Top = 280
      Width = 300
      Height = 17
      Caption = 'Precio derivado (se calcula desde otra presentacion)'
      TabOrder = 6
    end
    object rgUso: TRadioGroup
      Left = 0
      Top = 304
      Width = 260
      Height = 40
      Caption = 'Uso'
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        'Compra'
        'Venta'
        'Ambos')
      TabOrder = 7
    end
    object chkPresentacionActiva: TCheckBox
      Left = 0
      Top = 352
      Width = 100
      Height = 17
      Caption = 'Activa'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object btnNuevaPresentacion: TButton
      Left = 0
      Top = 380
      Width = 140
      Height = 25
      Caption = 'Nueva presentacion'
      TabOrder = 9
      OnClick = btnNuevaPresentacionClick
    end
    object btnGuardarPresentacion: TButton
      Left = 146
      Top = 380
      Width = 140
      Height = 25
      Caption = 'Guardar presentacion'
      TabOrder = 10
      OnClick = btnGuardarPresentacionClick
    end
    object btnEliminarPresentacion: TButton
      Left = 292
      Top = 380
      Width = 140
      Height = 25
      Caption = 'Eliminar presentacion'
      TabOrder = 11
      OnClick = btnEliminarPresentacionClick
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
  object qProductos: TQuery
    DatabaseName = 'comyleg'
    Left = 792
    Top = 48
  end
  object dsProductos: TDataSource
    DataSet = qProductos
    Left = 792
    Top = 88
  end
  object qPresentaciones: TQuery
    DatabaseName = 'comyleg'
    Left = 792
    Top = 128
  end
  object dsPresentaciones: TDataSource
    DataSet = qPresentaciones
    Left = 792
    Top = 168
  end
  object qOper: TQuery
    DatabaseName = 'comyleg'
    Left = 792
    Top = 208
  end
end
