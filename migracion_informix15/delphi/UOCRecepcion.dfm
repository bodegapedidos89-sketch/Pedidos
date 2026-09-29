object FormOCRecepcion: TFormOCRecepcion
  Left = 130
  Top = 100
  Caption = 'Recepcion de Almacen - Ordenes de Compra'
  ClientHeight = 560
  ClientWidth = 900
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
      Top = 2
      Width = 40
      Height = 13
      Caption = 'Empresa'
    end
    object lblUsuario: TLabel
      Left = 130
      Top = 2
      Width = 38
      Height = 13
      Caption = 'Capturo'
    end
    object lblBuscaPedido: TLabel
      Left = 0
      Top = 32
      Width = 62
      Height = 13
      Caption = 'Num. Pedido'
    end
    object lblRenglones: TLabel
      Left = 0
      Top = 240
      Width = 220
      Height = 13
      Caption = 'Renglones pendientes de este pedido'
    end
    object edtEmpresa: TEdit
      Left = 70
      Top = 0
      Width = 40
      Height = 21
    end
    object edtUsuario: TEdit
      Left = 180
      Top = 0
      Width = 190
      Height = 21
    end
    object edtBuscaPedido: TEdit
      Left = 0
      Top = 48
      Width = 150
      Height = 21
    end
    object btnBuscarPedido: TButton
      Left = 160
      Top = 47
      Width = 100
      Height = 23
      Caption = 'Buscar'
      OnClick = btnBuscarPedidoClick
    end
    object dbgPedidos: TDBGrid
      Left = 0
      Top = 80
      Width = 372
      Height = 150
      DataSource = dsPedidosPend
      TabOrder = 4
      OnDblClick = dbgPedidosDblClick
    end
    object dbgRenglones: TDBGrid
      Left = 0
      Top = 258
      Width = 372
      Height = 280
      DataSource = dsRenglonesPend
      TabOrder = 5
      OnDblClick = dbgRenglonesDblClick
    end
  end
  object pnlDer: TPanel
    Left = 396
    Top = 8
    Width = 460
    Height = 544
    BevelOuter = bvNone
    object gbRecepcion: TGroupBox
      Left = 0
      Top = 0
      Width = 452
      Height = 280
      Caption = 'Recepcion del renglon seleccionado'
      object lblArticuloSel: TLabel
        Left = 16
        Top = 24
        Width = 420
        Height = 13
        Caption = '(doble clic en un renglon de arriba)'
      end
      object lblCantidadRecibida: TLabel
        Left = 16
        Top = 56
        Width = 92
        Height = 13
        Caption = 'Cantidad Recibida'
      end
      object lblCantidadXEmpaque: TLabel
        Left = 150
        Top = 56
        Width = 106
        Height = 13
        Caption = 'Cantidad x Empaque'
      end
      object lblTara: TLabel
        Left = 284
        Top = 56
        Width = 21
        Height = 13
        Caption = 'Tara'
      end
      object lblObservaciones: TLabel
        Left = 16
        Top = 170
        Width = 240
        Height = 13
        Caption = 'Observaciones (motivo si no se recibio)'
      end
      object edtCantidadRecibida: TEdit
        Left = 16
        Top = 74
        Width = 120
        Height = 21
      end
      object edtCantidadXEmpaque: TEdit
        Left = 150
        Top = 74
        Width = 120
        Height = 21
      end
      object edtTara: TEdit
        Left = 284
        Top = 74
        Width = 100
        Height = 21
      end
      object rgRecibido: TRadioGroup
        Left = 16
        Top = 110
        Width = 200
        Height = 50
        Caption = 'Recibido'
        ItemIndex = 0
        Items.Strings = (
          'Si se recibio'
          'No se recibio')
        TabOrder = 3
        OnClick = rgRecibidoClick
      end
      object edtObservaciones: TEdit
        Left = 16
        Top = 188
        Width = 420
        Height = 21
        Enabled = False
        TabOrder = 4
      end
      object btnGuardarRecepcion: TButton
        Left = 16
        Top = 230
        Width = 240
        Height = 30
        Caption = 'Guardar recepcion de este renglon'
        TabOrder = 5
        OnClick = btnGuardarRecepcionClick
      end
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
    Left = 520
    Top = 8
  end
  object qPedidosPend: TQuery
    DatabaseName = 'comyleg'
    Left = 520
    Top = 48
  end
  object dsPedidosPend: TDataSource
    DataSet = qPedidosPend
    Left = 520
    Top = 88
  end
  object qRenglonesPend: TQuery
    DatabaseName = 'comyleg'
    Left = 520
    Top = 128
  end
  object dsRenglonesPend: TDataSource
    DataSet = qRenglonesPend
    Left = 520
    Top = 168
  end
  object qOper: TQuery
    DatabaseName = 'comyleg'
    Left = 520
    Top = 208
  end
  object spRecibeRenglon: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'sp_recibe_renglon_oc'
    Left = 520
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'emp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'suc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'art'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ped'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ren'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fech'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'kgs'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'caj'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'cosuni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'codpro'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'iva'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'des'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'fle'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'canempreal'
        ParamType = ptInput
      end>
  end
  object spAplicaMovKardex: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'sp_aplica_mov_kardex'
    Left = 552
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'emp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'suc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'codart'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fech'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipdoc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'numdoc'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ren'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'cantcap'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'costouni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'esentrada'
        ParamType = ptInput
      end>
  end
end
