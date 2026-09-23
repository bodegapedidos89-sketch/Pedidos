object FormPresentacion: TFormPresentacion
  Left = 300
  Top = 200
  BorderStyle = bsDialog
  Caption = 'Seleccione presentaci'#243'n'
  ClientHeight = 180
  ClientWidth = 260
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitulo: TLabel
    Left = 16
    Top = 8
    Width = 228
    Height = 13
    Caption = '¿En qu'#233' presentaci'#243'n se captur'#243' este art'#237'culo?'
  end
  object pnlBotones: TPanel
    Left = 8
    Top = 28
    Width = 244
    Height = 100
    BevelOuter = bvNone
    TabOrder = 0
  end
  object btnCancelar: TButton
    Left = 84
    Top = 132
    Width = 92
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = btnCancelarClick
  end
end
