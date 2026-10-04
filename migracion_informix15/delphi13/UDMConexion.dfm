object DMConexion: TDMConexion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 272
  Width = 390
  object FDConnection1: TFDConnection
    Params.DriverID = 'Infx'
    LoginPrompt = False
    Left = 96
    Top = 48
  end
  object FDPhysInfxDriverLink1: TFDPhysInfxDriverLink
    Left = 96
    Top = 112
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 96
    Top = 176
  end
end
