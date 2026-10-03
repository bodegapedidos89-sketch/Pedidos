object FormRepartoMonitor: TFormRepartoMonitor
  Left = 120
  Top = 90
  Caption = 'Monitor de Reparto (estatus en tiempo real)'
  ClientHeight = 480
  ClientWidth = 820
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl: TPanel
    Left = 8
    Top = 8
    Width = 804
    Height = 464
    BevelOuter = bvNone
    object lblEmpresa: TLabel
      Left = 0
      Top = 0
      Width = 40
      Height = 13
      Caption = 'Empresa'
    end
    object edtEmpresa: TEdit
      Left = 60
      Top = 0
      Width = 40
      Height = 21
    end
    object lblFecha: TLabel
      Left = 110
      Top = 0
      Width = 70
      Height = 13
      Caption = 'Fecha (dd/mm/aaaa)'
    end
    object edtFecha: TEdit
      Left = 110
      Top = 18
      Width = 100
      Height = 21
    end
    object btnActualizar: TButton
      Left = 220
      Top = 17
      Width = 100
      Height = 23
      Caption = 'Actualizar'
      OnClick = btnActualizarClick
    end
    object chkAutoRefresh: TCheckBox
      Left = 330
      Top = 20
      Width = 130
      Height = 17
      Caption = 'Auto-actualizar cada'
      OnClick = chkAutoRefreshClick
    end
    object edtIntervaloSeg: TEdit
      Left = 462
      Top = 17
      Width = 40
      Height = 21
      Text = '30'
      OnExit = edtIntervaloSegExit
    end
    object lblIntervalo: TLabel
      Left = 506
      Top = 20
      Width = 45
      Height = 13
      Caption = 'segundos'
    end
    object lblUltimaActualizacion: TLabel
      Left = 0
      Top = 46
      Width = 200
      Height = 13
      Caption = 'Ultima actualizacion: --'
    end
    object lblLeyenda: TLabel
      Left = 0
      Top = 68
      Width = 700
      Height = 13
      Caption =
        'Pendiente = gris | Cargado = amarillo | En ruta = azul claro |' +
        ' Entregado = verde | No entregado = rojo'
    end
    object dbgMonitor: TDBGrid
      Left = 0
      Top = 92
      Width = 800
      Height = 360
      DataSource = dsMonitor
      TabOrder = 6
      OnDrawColumnCell = dbgMonitorDrawColumnCell
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
    Left = 750
    Top = 8
  end
  object qMonitor: TQuery
    DatabaseName = 'comyleg'
    Left = 750
    Top = 48
  end
  object dsMonitor: TDataSource
    DataSet = qMonitor
    Left = 750
    Top = 88
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = Timer1Timer
    Left = 750
    Top = 128
  end
end
