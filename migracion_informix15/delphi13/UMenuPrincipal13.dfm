object FormMenuPrincipal13: TFormMenuPrincipal13
  Left = 300
  Top = 200
  BorderStyle = bsDialog
  Caption = 'Menu de mantenimiento (Delphi 13)'
  ClientHeight = 160
  ClientWidth = 300
  Position = poScreenCenter
  OnCreate = FormCreate
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
    Height = 100
    BevelOuter = bvNone
    object btnChoferes: TButton
      Left = 0
      Top = 0
      Width = 268
      Height = 40
      Caption = 'Choferes'
      TabOrder = 0
      OnClick = btnChoferesClick
    end
    object btnSalir: TButton
      Left = 0
      Top = 50
      Width = 268
      Height = 30
      Caption = 'Salir'
      TabOrder = 1
      OnClick = btnSalirClick
    end
  end
end
