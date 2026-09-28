object FormMantBundles: TFormMantBundles
  Left = 140
  Top = 110
  Caption = 'Mantenimiento de Bundles (Combos)'
  ClientHeight = 560
  ClientWidth = 840
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
    object lblBundles: TLabel
      Left = 0
      Top = 0
      Caption = 'Bundles'
    end
    object edtBuscaBundle: TEdit
      Left = 0
      Top = 20
      Width = 260
      Height = 21
    end
    object btnBuscarBundle: TButton
      Left = 268
      Top = 19
      Width = 100
      Height = 23
      Caption = 'Buscar'
      OnClick = btnBuscarBundleClick
    end
    object dbgBundles: TDBGrid
      Left = 0
      Top = 48
      Width = 372
      Height = 150
      DataSource = dsBundles
      OnDblClick = dbgBundlesDblClick
    end
    object lblEmpresa: TLabel
      Left = 0
      Top = 210
      Caption = 'Empresa'
    end
    object edtEmpresa: TEdit
      Left = 70
      Top = 206
      Width = 40
      Height = 21
    end
    object lblCodBundle: TLabel
      Left = 0
      Top = 236
      Width = 340
      Height = 13
      Caption = 'Codigo del bundle (debe existir en inarinv, aunque sea placeholder)'
    end
    object edtCodBundle: TEdit
      Left = 0
      Top = 254
      Width = 200
      Height = 21
      OnExit = edtCodBundleExit
    end
    object lblDescBundle: TLabel
      Left = 0
      Top = 280
      Caption = 'Descripcion'
    end
    object edtDescBundle: TEdit
      Left = 0
      Top = 298
      Width = 372
      Height = 21
    end
    object btnNuevoBundle: TButton
      Left = 0
      Top = 330
      Width = 118
      Height = 25
      Caption = 'Nuevo'
      OnClick = btnNuevoBundleClick
    end
    object btnGuardarBundle: TButton
      Left = 126
      Top = 330
      Width = 118
      Height = 25
      Caption = 'Guardar'
      OnClick = btnGuardarBundleClick
    end
    object btnEliminarBundle: TButton
      Left = 252
      Top = 330
      Width = 118
      Height = 25
      Caption = 'Eliminar'
      OnClick = btnEliminarBundleClick
    end
  end
  object pnlDer: TPanel
    Left = 400
    Top = 8
    Width = 432
    Height = 544
    BevelOuter = bvNone
    object lblBuscaProducto: TLabel
      Left = 0
      Top = 0
      Caption = 'Buscar producto (codigo ancla)'
    end
    object edtBuscaProducto: TEdit
      Left = 0
      Top = 18
      Width = 260
      Height = 21
    end
    object btnBuscarPresentaciones: TButton
      Left = 268
      Top = 17
      Width = 140
      Height = 23
      Caption = 'Buscar presentaciones'
      OnClick = btnBuscarPresentacionesClick
    end
    object dbgPresentacionesDisp: TDBGrid
      Left = 0
      Top = 44
      Width = 424
      Height = 110
      DataSource = dsPresentacionesDisp
      OnDblClick = dbgPresentacionesDispDblClick
    end
    object lblCantidadXBundle: TLabel
      Left = 0
      Top = 162
      Caption = 'Cantidad por bundle'
    end
    object edtCantidadXBundle: TEdit
      Left = 0
      Top = 180
      Width = 100
      Height = 21
    end
    object lblOrden: TLabel
      Left = 110
      Top = 162
      Caption = 'Orden'
    end
    object edtOrden: TEdit
      Left = 110
      Top = 180
      Width = 60
      Height = 21
    end
    object btnAgregarComponente: TButton
      Left = 184
      Top = 178
      Width = 140
      Height = 25
      Caption = 'Agregar componente'
      OnClick = btnAgregarComponenteClick
    end
    object lblComponentes: TLabel
      Left = 0
      Top = 214
      Caption = 'Componentes del bundle'
    end
    object dbgComponentes: TDBGrid
      Left = 0
      Top = 232
      Width = 424
      Height = 150
      DataSource = dsComponentes
    end
    object btnEliminarComponente: TButton
      Left = 0
      Top = 390
      Width = 150
      Height = 25
      Caption = 'Eliminar componente'
      OnClick = btnEliminarComponenteClick
    end
  end
  object Database1: TDatabase
    DatabaseName = 'TU_ALIAS_BDE'
    Left = 760
    Top = 8
  end
  object qBundles: TQuery
    DatabaseName = 'TU_ALIAS_BDE'
    Left = 760
    Top = 48
  end
  object dsBundles: TDataSource
    DataSet = qBundles
    Left = 760
    Top = 88
  end
  object qComponentes: TQuery
    DatabaseName = 'TU_ALIAS_BDE'
    Left = 760
    Top = 128
  end
  object dsComponentes: TDataSource
    DataSet = qComponentes
    Left = 760
    Top = 168
  end
  object qPresentacionesDisp: TQuery
    DatabaseName = 'TU_ALIAS_BDE'
    Left = 760
    Top = 208
  end
  object dsPresentacionesDisp: TDataSource
    DataSet = qPresentacionesDisp
    Left = 760
    Top = 248
  end
  object qBuscaArt: TQuery
    DatabaseName = 'TU_ALIAS_BDE'
    Left = 760
    Top = 288
  end
end
