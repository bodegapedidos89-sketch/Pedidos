object FormReporteNegativos: TFormReporteNegativos
  Left = 160
  Top = 120
  Caption = 'Tendencia de Existencias Negativas'
  ClientHeight = 600
  ClientWidth = 820
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 8
    Top = 8
    Width = 804
    Height = 584
    BevelOuter = bvNone
    object lblEmpresa: TLabel
      Left = 0
      Top = 2
      Width = 40
      Height = 13
      Caption = 'Empresa'
    end
    object lblDesde: TLabel
      Left = 130
      Top = 2
      Width = 32
      Height = 13
      Caption = 'Desde'
    end
    object lblHasta: TLabel
      Left = 300
      Top = 2
      Width = 27
      Height = 13
      Caption = 'Hasta'
    end
    object lblRanking: TLabel
      Left = 0
      Top = 34
      Width = 260
      Height = 13
      Caption = 'Codigos con mas recurrencia (doble clic para graficar)'
    end
    object lblGrafica: TLabel
      Left = 0
      Top = 210
      Width = 60
      Height = 13
      Caption = 'Tendencia'
    end
    object edtEmpresa: TEdit
      Left = 70
      Top = 0
      Width = 40
      Height = 21
    end
    object dtDesde: TDateTimePicker
      Left = 166
      Top = 0
      Width = 120
      Height = 21
    end
    object dtHasta: TDateTimePicker
      Left = 332
      Top = 0
      Width = 120
      Height = 21
    end
    object btnBuscar: TButton
      Left = 464
      Top = -1
      Width = 100
      Height = 23
      Caption = 'Buscar'
      TabOrder = 3
      OnClick = btnBuscarClick
    end
    object dbgRanking: TDBGrid
      Left = 0
      Top = 50
      Width = 796
      Height = 150
      DataSource = dsRanking
      TabOrder = 4
      OnDblClick = dbgRankingDblClick
    end
    object Chart1: TChart
      Left = 0
      Top = 228
      Width = 796
      Height = 350
      Title.Text.Strings = (
        'Tendencia de existencia')
      TabOrder = 5
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
    Left = 736
    Top = 8
  end
  object qRanking: TQuery
    DatabaseName = 'comyleg'
    Left = 736
    Top = 48
  end
  object dsRanking: TDataSource
    DataSet = qRanking
    Left = 736
    Top = 88
  end
  object qTendencia: TQuery
    DatabaseName = 'comyleg'
    Left = 736
    Top = 128
  end
end
