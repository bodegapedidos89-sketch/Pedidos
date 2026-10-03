object FormMenuPrincipal: TFormMenuPrincipal
  Left = 300
  Top = 200
  BorderStyle = bsDialog
  Caption = 'Menu de mantenimiento'
  ClientHeight = 650
  ClientWidth = 300
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitulo: TLabel
    Left = 16
    Top = 12
    Width = 268
    Height = 19
    Caption = 'Selecciona un programa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnlBotones: TPanel
    Left = 16
    Top = 44
    Width = 268
    Height = 590
    BevelOuter = bvNone
    object btnArticulos: TButton
      Left = 0
      Top = 0
      Width = 268
      Height = 40
      Caption = 'Productos, Unidades y Tara'
      TabOrder = 0
      OnClick = btnArticulosClick
    end
    object btnBundles: TButton
      Left = 0
      Top = 50
      Width = 268
      Height = 40
      Caption = 'Bundles (Combos)'
      TabOrder = 1
      OnClick = btnBundlesClick
    end
    object btnCompras: TButton
      Left = 0
      Top = 100
      Width = 268
      Height = 40
      Caption = 'Ordenes de Compra'
      TabOrder = 2
      OnClick = btnComprasClick
    end
    object btnRecepcion: TButton
      Left = 0
      Top = 150
      Width = 268
      Height = 40
      Caption = 'Recepcion de Almacen'
      TabOrder = 3
      OnClick = btnRecepcionClick
    end
    object btnCierre: TButton
      Left = 0
      Top = 200
      Width = 268
      Height = 40
      Caption = 'Cierre Diario'
      TabOrder = 4
      OnClick = btnCierreClick
    end
    object btnTendencias: TButton
      Left = 0
      Top = 250
      Width = 268
      Height = 40
      Caption = 'Tendencias de Existencia Negativa'
      TabOrder = 5
      OnClick = btnTendenciasClick
    end
    object btnFlotilla: TButton
      Left = 0
      Top = 300
      Width = 268
      Height = 40
      Caption = 'Flotilla de Reparto'
      TabOrder = 6
      OnClick = btnFlotillaClick
    end
    object btnChoferes: TButton
      Left = 0
      Top = 350
      Width = 268
      Height = 40
      Caption = 'Choferes'
      TabOrder = 7
      OnClick = btnChoferesClick
    end
    object btnBitacoraFlotilla: TButton
      Left = 0
      Top = 400
      Width = 268
      Height = 40
      Caption = 'Bitacora de Flotilla (Combustible/Mantenimiento)'
      TabOrder = 8
      OnClick = btnBitacoraFlotillaClick
    end
    object btnReparto: TButton
      Left = 0
      Top = 450
      Width = 268
      Height = 40
      Caption = 'Pedidos a Ruta de Reparto'
      TabOrder = 9
      OnClick = btnRepartoClick
    end
    object btnRepartoMonitor: TButton
      Left = 0
      Top = 500
      Width = 268
      Height = 40
      Caption = 'Monitor de Reparto'
      TabOrder = 10
      OnClick = btnRepartoMonitorClick
    end
    object btnSalir: TButton
      Left = 0
      Top = 550
      Width = 268
      Height = 30
      Caption = 'Salir'
      TabOrder = 11
      OnClick = btnSalirClick
    end
  end
end
