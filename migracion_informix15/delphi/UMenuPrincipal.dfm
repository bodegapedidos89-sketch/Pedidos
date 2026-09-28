object FormMenuPrincipal: TFormMenuPrincipal
  Left = 300
  Top = 200
  BorderStyle = bsDialog
  Caption = 'Menu de mantenimiento'
  ClientHeight = 240
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
    Height = 180
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
    object btnSalir: TButton
      Left = 0
      Top = 130
      Width = 268
      Height = 30
      Caption = 'Salir'
      TabOrder = 2
      OnClick = btnSalirClick
    end
  end
end
