object FormCierreDiario: TFormCierreDiario
  Left = 150
  Top = 110
  Caption = 'Cierre Diario'
  ClientHeight = 560
  ClientWidth = 700
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 8
    Top = 8
    Width = 684
    Height = 544
    BevelOuter = bvNone
    object lblEmpresa: TLabel
      Left = 0
      Top = 2
      Width = 40
      Height = 13
      Caption = 'Empresa'
    end
    object lblFecha: TLabel
      Left = 130
      Top = 2
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object lblNegativosHoy: TLabel
      Left = 0
      Top = 220
      Width = 260
      Height = 13
      Caption = 'Articulos con existencia negativa en este cierre'
    end
    object lblLogCierre: TLabel
      Left = 0
      Top = 400
      Width = 220
      Height = 13
      Caption = 'Bitacora del ultimo recalculo (hist_log_cierre)'
    end
    object edtEmpresa: TEdit
      Left = 70
      Top = 0
      Width = 40
      Height = 21
    end
    object dtFecha: TDateTimePicker
      Left = 166
      Top = 0
      Width = 120
      Height = 21
    end
    object btnDetectaNegativos: TButton
      Left = 300
      Top = -1
      Width = 220
      Height = 23
      Caption = 'Cerrar el dia (detectar negativos)'
      TabOrder = 2
      OnClick = btnDetectaNegativosClick
    end
    object gbRecalculo: TGroupBox
      Left = 0
      Top = 36
      Width = 684
      Height = 170
      Caption = 'Recalculo completo de Kardex (opcional, no es rutina diaria)'
      object lblFechaIni: TLabel
        Left = 16
        Top = 28
        Width = 130
        Height = 13
        Caption = 'Desde (foto en inventario)'
      end
      object lblRecalculoNota: TLabel
        Left = 16
        Top = 80
        Width = 620
        Height = 52
        AutoSize = False
        WordWrap = True
        Caption =
          'Recorre inartrinv completo entre esta fecha y la fecha del cie' +
          'rre de arriba, y SOBRESCRIBE costo promedio, can_emp y existen' +
          'cias en inarinv/inartrinv. Usalo solo si sospechas que algo se' +
          ' desfaso (por ejemplo despues de un problema detectado), no co' +
          'mo parte de la rutina de todos los dias.'
      end
      object dtFechaIniRecalculo: TDateTimePicker
        Left = 16
        Top = 46
        Width = 150
        Height = 21
      end
      object btnRecalcula: TButton
        Left = 200
        Top = 45
        Width = 220
        Height = 23
        Caption = 'Recalcular Kardex completo'
        TabOrder = 1
        OnClick = btnRecalculaClick
      end
    end
    object dbgNegativosHoy: TDBGrid
      Left = 0
      Top = 238
      Width = 684
      Height = 150
      DataSource = dsNegativosHoy
      TabOrder = 3
    end
    object dbgLogCierre: TDBGrid
      Left = 0
      Top = 418
      Width = 684
      Height = 100
      DataSource = dsLogCierre
      TabOrder = 4
    end
    object btnVerTendencias: TButton
      Left = 0
      Top = 520
      Width = 220
      Height = 23
      Caption = 'Ver reporte de tendencias...'
      TabOrder = 5
      OnClick = btnVerTendenciasClick
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
    Left = 616
    Top = 8
  end
  object qNegativosHoy: TQuery
    DatabaseName = 'comyleg'
    Left = 616
    Top = 48
  end
  object dsNegativosHoy: TDataSource
    DataSet = qNegativosHoy
    Left = 616
    Top = 88
  end
  object qLogCierre: TQuery
    DatabaseName = 'comyleg'
    Left = 616
    Top = 128
  end
  object dsLogCierre: TDataSource
    DataSet = qLogCierre
    Left = 616
    Top = 168
  end
  object qOper: TQuery
    DatabaseName = 'comyleg'
    Left = 616
    Top = 208
  end
  object spDetectaNegativos: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'sp_cierre_detecta_negativos'
    Left = 616
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'emp'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fecha'
        ParamType = ptInput
      end>
  end
  object spRecalculaKardex: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'sp_cierre_recalcula_kardex'
    Left = 616
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'emp'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fech_ini'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fech_fin'
        ParamType = ptInput
      end>
  end
end
