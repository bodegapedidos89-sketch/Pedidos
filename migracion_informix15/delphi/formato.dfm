object Form1: TForm1
  Left = 372
  Top = 145
  Width = 926
  Height = 735
  Caption = 'Ordenes Compra Locales'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image13: TImage
    Left = 8
    Top = 280
    Width = 65
    Height = 49
  end
  object Image20: TImage
    Left = 80
    Top = 280
    Width = 65
    Height = 49
  end
  object Image21: TImage
    Left = 152
    Top = 280
    Width = 65
    Height = 49
  end
  object Image22: TImage
    Left = 224
    Top = 280
    Width = 65
    Height = 49
  end
  object Image23: TImage
    Left = 296
    Top = 280
    Width = 65
    Height = 49
  end
  object Image24: TImage
    Left = 368
    Top = 280
    Width = 65
    Height = 49
  end
  object Image25: TImage
    Left = 440
    Top = 280
    Width = 65
    Height = 49
  end
  object Image26: TImage
    Left = 512
    Top = 280
    Width = 65
    Height = 49
  end
  object Image27: TImage
    Left = 584
    Top = 280
    Width = 65
    Height = 49
  end
  object Panel4: TPanel
    Left = 0
    Top = 33
    Width = 910
    Height = 663
    Align = alClient
    TabOrder = 0
    object Label15: TLabel
      Left = 24
      Top = 608
      Width = 53
      Height = 16
      Caption = 'Importe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 136
      Top = 608
      Width = 37
      Height = 16
      Caption = 'I.V.A.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 584
      Top = 640
      Width = 49
      Height = 13
      Caption = 'V. 2.03.22'
    end
    object Label19: TLabel
      Left = 248
      Top = 608
      Width = 47
      Height = 16
      Caption = 'I.E.P.S'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object gbHedaer: TGroupBox
      Left = 15
      Top = 8
      Width = 754
      Height = 169
      Caption = 'Datos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 2
      object Label1: TLabel
        Left = 16
        Top = 22
        Width = 44
        Height = 16
        Caption = 'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Domicilio: TLabel
        Left = 16
        Top = 96
        Width = 57
        Height = 16
        Caption = 'Direcci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Ciudad: TLabel
        Left = 13
        Top = 128
        Width = 43
        Height = 16
        Caption = 'Ciudad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 560
        Top = 22
        Width = 54
        Height = 16
        Caption = 'Tel'#233'fono'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Nombre: TLabel
        Left = 336
        Top = 24
        Width = 78
        Height = 16
        Caption = 'Codigo Prov.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 472
        Top = 96
        Width = 52
        Height = 17
        Caption = 'Nombre'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label11: TLabel
        Left = 16
        Top = 56
        Width = 38
        Height = 16
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 376
        Top = 56
        Width = 78
        Height = 16
        Caption = 'Codigo Prov.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 272
        Top = 56
        Width = 49
        Height = 16
        Caption = 'Nombre'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object nom_pro: TDBLookupComboBox
        Left = 432
        Top = 16
        Width = 121
        Height = 25
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        KeyField = 'cod_pro'
        ListField = 'cod_pro'
        ListSource = DataSource1
        ParentFont = False
        TabOrder = 1
        OnClick = nom_proClick
        OnKeyPress = nom_proKeyPress
      end
      object tel_pro: TEdit
        Left = 624
        Top = 16
        Width = 121
        Height = 25
        TabStop = False
        ReadOnly = True
        TabOrder = 3
      end
      object dir_pro: TEdit
        Left = 112
        Top = 96
        Width = 497
        Height = 25
        TabStop = False
        ReadOnly = True
        TabOrder = 5
      end
      object ciu_pro: TEdit
        Left = 112
        Top = 136
        Width = 497
        Height = 25
        ReadOnly = True
        TabOrder = 6
      end
      object name_pro: TEdit
        Left = 352
        Top = 48
        Width = 265
        Height = 26
        TabStop = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = ' '
      end
      object Edit1: TEdit
        Left = 64
        Top = 16
        Width = 113
        Height = 25
        TabOrder = 0
        OnExit = Edit1Exit
        OnKeyPress = Edit1KeyPress
      end
      object raz_soc: TDBLookupComboBox
        Left = 432
        Top = 16
        Width = 329
        Height = 25
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        KeyField = 'raz_soc'
        ListField = 'raz_soc'
        ListSource = DataSource12
        ParentFont = False
        TabOrder = 2
        Visible = False
        OnClick = raz_socClick
        OnKeyPress = raz_socKeyPress
      end
      object fechauno: TDateTimePicker
        Left = 112
        Top = 56
        Width = 121
        Height = 25
        Date = 39405.606136562500000000
        Time = 39405.606136562500000000
        TabOrder = 7
        TabStop = False
      end
      object Edit2: TEdit
        Left = 496
        Top = 48
        Width = 121
        Height = 25
        TabOrder = 8
        Visible = False
      end
      object opcion: TRadioGroup
        Left = 184
        Top = 8
        Width = 153
        Height = 41
        Columns = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Codigo'
          'Nombre')
        ParentFont = False
        TabOrder = 9
        Visible = False
        OnClick = opcionClick
      end
    end
    object Panel6: TPanel
      Left = 322
      Top = 593
      Width = 143
      Height = 80
      TabOrder = 3
      object Label8: TLabel
        Left = 16
        Top = 8
        Width = 96
        Height = 16
        Caption = 'Total a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edTotal: TEdit
        Left = 8
        Top = 32
        Width = 121
        Height = 28
        TabStop = False
        BiDiMode = bdRightToLeftReadingOnly
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object DBGrid1: TDBGrid
      Left = 4
      Top = 257
      Width = 493
      Height = 328
      DataSource = DataSource10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -16
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_art'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Codigo'
          Title.Color = clGreen
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = 'Comic Sans MS'
          Title.Font.Style = []
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descripcion'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Color = clGreen
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = 'Comic Sans MS'
          Title.Font.Style = []
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cajas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Color = clGreen
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = 'Comic Sans MS'
          Title.Font.Style = []
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kilos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Color = clGreen
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = 'Comic Sans MS'
          Title.Font.Style = []
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'precio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Color = clGreen
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = 'Comic Sans MS'
          Title.Font.Style = []
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Color = clGreen
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -16
          Title.Font.Name = 'Comic Sans MS'
          Title.Font.Style = []
          Width = 61
          Visible = True
        end>
    end
    object maot: TEdit
      Left = 112
      Top = 632
      Width = 89
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Text = ' '
    end
    object importe: TEdit
      Left = 8
      Top = 632
      Width = 89
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = ' '
    end
    object btFacturar: TBitBtn
      Left = 520
      Top = 416
      Width = 137
      Height = 33
      Caption = 'Guardar Orden '
      TabOrder = 5
      OnClick = btFacturarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 520
      Top = 360
      Width = 137
      Height = 33
      Caption = '&Cancelar'
      TabOrder = 6
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
    end
    object btImprimir: TBitBtn
      Left = 520
      Top = 452
      Width = 137
      Height = 33
      Caption = 'Imprimir Orden'
      TabOrder = 12
      OnClick = btImprimirClick
    end
    object BitBtn2: TBitBtn
      Left = 520
      Top = 496
      Width = 137
      Height = 33
      Caption = '&Salir'
      TabOrder = 7
      OnClick = BitBtn2Click
      Kind = bkClose
    end
    object mx: TPanel
      Left = 16
      Top = 168
      Width = 753
      Height = 65
      Caption = ' '
      TabOrder = 8
      object Label2: TLabel
        Left = 40
        Top = 8
        Width = 41
        Height = 19
        Caption = 'Codigo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 184
        Top = 8
        Width = 71
        Height = 19
        Caption = 'Descripcion'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 400
        Top = 8
        Width = 29
        Height = 19
        Caption = 'Kilos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 472
        Top = 8
        Width = 38
        Height = 19
        Caption = 'Precio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 568
        Top = 8
        Width = 33
        Height = 19
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 320
        Top = 8
        Width = 33
        Height = 19
        Caption = 'Cantidad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object kil_pro: TEdit
        Left = 376
        Top = 24
        Width = 73
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnChange = kil_proChange
        OnKeyPress = kil_proKeyPress
      end
      object pre_pro: TEdit
        Left = 456
        Top = 24
        Width = 65
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        Text = ' '
        OnChange = pre_proChange
        OnExit = pre_proExit
        OnKeyPress = pre_proKeyPress
      end
      object Tot_pro: TEdit
        Left = 528
        Top = 24
        Width = 105
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        Text = ' '
        OnKeyPress = Tot_proKeyPress
      end
      object BitBtn3: TBitBtn
        Left = 552
        Top = 56
        Width = 75
        Height = 25
        Caption = '&Agregar'
        DragCursor = crMultiDrag
        TabOrder = 2
        Visible = False
        OnClick = BitBtn3Click
      end
      object caj_pro: TEdit
        Left = 304
        Top = 24
        Width = 65
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnChange = caj_proChange
        OnExit = caj_proExit
        OnKeyPress = caj_proKeyPress
      end
      object des_pro: TEdit
        Left = 200
        Top = 0
        Width = 177
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Visible = False
      end
      object cod_Art: TDBLookupComboBox
        Left = 312
        Top = 56
        Width = 105
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyField = 'cod_art'
        ListField = 'cod_art'
        ListSource = DataSource2
        ParentFont = False
        TabOrder = 0
        Visible = False
        OnClick = cod_ArtClick
      end
      object des_pro22: TDBLookupComboBox
        Left = 8
        Top = 24
        Width = 185
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'des_art'
        ListField = 'des_art'
        ListSource = DataSource2
        ParentFont = False
        TabOrder = 3
        Visible = False
        OnClick = des_pro22Click
        OnExit = des_pro22Exit
        OnKeyPress = des_pro22KeyPress
      end
      object cod_Art22: TEdit
        Left = 184
        Top = 24
        Width = 105
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        Visible = False
      end
      object Button1: TButton
        Left = 440
        Top = 64
        Width = 81
        Height = 25
        Caption = 'Convertir'
        TabOrder = 11
        OnClick = Button1Click
      end
      object opcion2: TRadioGroup
        Left = 0
        Top = 56
        Width = 129
        Height = 33
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Codigo'
          'Descrip')
        TabOrder = 12
        Visible = False
        OnClick = opcion2Click
      end
      object Codigob: TDBLookupComboBox
        Left = 8
        Top = 24
        Width = 105
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'cod_art'
        ListField = 'cod_art'
        ListSource = DataSource14
        ParentFont = False
        TabOrder = 4
        OnClick = CodigobClick
        OnExit = CodigobExit
        OnKeyPress = CodigobKeyPress
      end
      object desarti: TEdit
        Left = 120
        Top = 24
        Width = 169
        Height = 28
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
    end
    object BitBtn4: TBitBtn
      Left = 520
      Top = 304
      Width = 137
      Height = 33
      Caption = '&Borrar Producto'
      TabOrder = 9
      OnClick = BitBtn4Click
      Kind = bkAbort
    end
    object IEPS: TEdit
      Left = 224
      Top = 632
      Width = 89
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      Text = ' '
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 910
    Height = 33
    Align = alTop
    TabOrder = 1
    object Label12: TLabel
      Left = 172
      Top = 118
      Width = 442
      Height = 38
      Caption = 'Carnes Selectas Baeza S.A. de C.V.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -27
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lb1: TLabel
      Left = 121
      Top = 59
      Width = 480
      Height = 26
      Alignment = taCenter
      AutoSize = False
      Caption = '   NOMBRE DE LA EMPRESA S.A. de C.V.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label17: TLabel
      Left = 24
      Top = 8
      Width = 106
      Height = 16
      Caption = 'Numero Empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object numempresa: TDBLookupComboBox
      Left = 136
      Top = 8
      Width = 89
      Height = 21
      KeyField = 'num_emp'
      ListField = 'num_emp'
      ListSource = DataSource15
      TabOrder = 0
      OnClick = numempresaClick
      OnKeyPress = numempresaKeyPress
    end
  end
  object DataSource1: TDataSource
    DataSet = qnompro
    Left = 376
  end
  object qnompro: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarprov'
      'where num_emp= :num_emp and raz_soc <> '#39#39' and cod_pro <> '#39#39
      'and raz_soc <> '#39'00'#39' and cod_pro <> '#39'12345678'#39
      'order by cod_pro')
    Left = 400
    ParamData = <
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
    object qnompronum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inarprov.num_emp'
      FixedChar = True
      Size = 2
    end
    object qnomprocod_pro: TStringField
      FieldName = 'cod_pro'
      Origin = 'COMYLEG.inarprov.cod_pro'
      FixedChar = True
      Size = 8
    end
    object qnomproraz_soc: TStringField
      FieldName = 'raz_soc'
      Origin = 'COMYLEG.inarprov.raz_soc'
      FixedChar = True
      Size = 50
    end
    object qnomprodom_pro: TStringField
      FieldName = 'dom_pro'
      Origin = 'COMYLEG.inarprov.dom_pro'
      FixedChar = True
      Size = 50
    end
    object qnomprociu_pro: TStringField
      FieldName = 'ciu_pro'
      Origin = 'COMYLEG.inarprov.ciu_pro'
      FixedChar = True
    end
    object qnomproest_pro: TStringField
      FieldName = 'est_pro'
      Origin = 'COMYLEG.inarprov.est_pro'
      FixedChar = True
      Size = 10
    end
    object qnomprotel_1: TStringField
      FieldName = 'tel_1'
      Origin = 'COMYLEG.inarprov.tel_1'
      FixedChar = True
      Size = 30
    end
    object qnomprorfc_pro: TStringField
      FieldName = 'rfc_pro'
      Origin = 'COMYLEG.inarprov.rfc_pro'
      FixedChar = True
    end
    object qnomprocod_pos: TIntegerField
      FieldName = 'cod_pos'
      Origin = 'COMYLEG.inarprov.cod_pos'
    end
    object qnomproage_pro: TSmallintField
      FieldName = 'age_pro'
      Origin = 'COMYLEG.inarprov.age_pro'
    end
    object qnomprocon_pro: TStringField
      FieldName = 'con_pro'
      Origin = 'COMYLEG.inarprov.con_pro'
      FixedChar = True
      Size = 1
    end
    object qnompropla_pro: TSmallintField
      FieldName = 'pla_pro'
      Origin = 'COMYLEG.inarprov.pla_pro'
    end
    object qnomprosta_pro: TStringField
      FieldName = 'sta_pro'
      Origin = 'COMYLEG.inarprov.sta_pro'
      FixedChar = True
      Size = 1
    end
    object qnomprolim_cre: TFloatField
      FieldName = 'lim_cre'
      Origin = 'COMYLEG.inarprov.lim_cre'
    end
    object qnomprosal_act: TFloatField
      FieldName = 'sal_act'
      Origin = 'COMYLEG.inarprov.sal_act'
    end
    object qnomprosal_ant: TFloatField
      FieldName = 'sal_ant'
      Origin = 'COMYLEG.inarprov.sal_ant'
    end
    object qnomprocom_mes: TFloatField
      FieldName = 'com_mes'
      Origin = 'COMYLEG.inarprov.com_mes'
    end
    object qnomprocos_mes: TFloatField
      FieldName = 'cos_mes'
      Origin = 'COMYLEG.inarprov.cos_mes'
    end
    object qnomprocom_acu: TFloatField
      FieldName = 'com_acu'
      Origin = 'COMYLEG.inarprov.com_acu'
    end
    object qnomprocos_acu: TFloatField
      FieldName = 'cos_acu'
      Origin = 'COMYLEG.inarprov.cos_acu'
    end
    object qnomprofech_com: TDateField
      FieldName = 'fech_com'
      Origin = 'COMYLEG.inarprov.fech_com'
    end
    object qnomprocan_com: TFloatField
      FieldName = 'can_com'
      Origin = 'COMYLEG.inarprov.can_com'
    end
    object qnomprofech_pag: TDateField
      FieldName = 'fech_pag'
      Origin = 'COMYLEG.inarprov.fech_pag'
    end
    object qnomproimp_pag: TFloatField
      FieldName = 'imp_pag'
      Origin = 'COMYLEG.inarprov.imp_pag'
    end
    object qnomprocurp: TStringField
      FieldName = 'curp'
      Origin = 'COMYLEG.inarprov.curp'
      FixedChar = True
      Size = 18
    end
  end
  object qart: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarinv'
      'where num_emp = :num_emp  and (tip_art = '#39'K'#39' OR tip_art ='#39'C'#39')'
      'order by DES_aRT')
    Left = 24
    Top = 165
    ParamData = <
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
  end
  object DataSource2: TDataSource
    DataSet = qart
    Left = 56
    Top = 165
  end
  object qproduc: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select cod_art, des_art, iva, tip_art'
      'from inarinv m'
      'where m.cod_art = :cod_art and m.num_emp = :num_emp')
    Left = 632
    Top = 277
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_art'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'num_emp'
        ParamType = ptUnknown
      end>
    object qproduccod_art: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.inarinv.cod_art'
      FixedChar = True
      Size = 14
    end
    object qproducdes_art: TStringField
      FieldName = 'des_art'
      Origin = 'COMYLEG.inarinv.des_art'
      FixedChar = True
      Size = 40
    end
    object qproduciva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.inarinv.iva'
    end
    object qproductip_art: TStringField
      FieldName = 'tip_art'
      Origin = 'COMYLEG.inarinv.tip_art'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource4: TDataSource
    DataSet = qproduc
    Left = 656
    Top = 269
  end
  object DataSource5: TDataSource
    DataSet = ttrans
    Left = 71
    Top = 333
  end
  object ttrans: TTable
    DatabaseName = 'comyleg'
    TableName = 'inartrinv'
    Left = 112
    Top = 333
    object ttransnum_emp: TStringField
      FieldName = 'num_emp'
      FixedChar = True
      Size = 2
    end
    object ttranscod_art: TStringField
      FieldName = 'cod_art'
      FixedChar = True
      Size = 14
    end
    object ttransnum_suc: TStringField
      FieldName = 'num_suc'
      FixedChar = True
      Size = 2
    end
    object ttransfech_doc: TDateField
      FieldName = 'fech_doc'
    end
    object ttranstip_doc: TStringField
      FieldName = 'tip_doc'
      FixedChar = True
      Size = 2
    end
    object ttransnum_doc: TIntegerField
      FieldName = 'num_doc'
    end
    object ttranscan_kgs: TFloatField
      FieldName = 'can_kgs'
    end
    object ttranscan_caj: TFloatField
      FieldName = 'can_caj'
    end
    object ttranscos_uni_kgs: TFloatField
      FieldName = 'cos_uni_kgs'
    end
    object ttranscos_uni_caj: TFloatField
      FieldName = 'cos_uni_caj'
    end
    object ttranscos_pro_kgs: TFloatField
      FieldName = 'cos_pro_kgs'
    end
    object ttranscos_pro_caj: TFloatField
      FieldName = 'cos_pro_caj'
    end
    object ttranspre_vta_kgs: TFloatField
      FieldName = 'pre_vta_kgs'
    end
    object ttranspre_vta_caj: TFloatField
      FieldName = 'pre_vta_caj'
    end
    object ttransdes_vta: TFloatField
      FieldName = 'des_vta'
    end
    object ttransfle_art: TFloatField
      FieldName = 'fle_art'
    end
    object ttransren_art: TSmallintField
      FieldName = 'ren_art'
    end
    object ttranscod_pro: TStringField
      FieldName = 'cod_pro'
      FixedChar = True
      Size = 8
    end
    object ttranscod_cli: TStringField
      FieldName = 'cod_cli'
      FixedChar = True
      Size = 8
    end
    object ttransnum_ent: TIntegerField
      FieldName = 'num_ent'
    end
    object ttransfech_ent: TDateField
      FieldName = 'fech_ent'
    end
    object ttransiva_art: TFloatField
      FieldName = 'iva_art'
    end
  end
  object tiva: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select iva'
      'from inarinv'
      'where cod_art= :IVA and num_emp= :NUM_EMP')
    Left = 600
    Top = 301
    ParamData = <
      item
        DataType = ftString
        Name = 'IVA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUM_EMP'
        ParamType = ptInput
      end>
    object tivaiva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.inarinv.iva'
    end
  end
  object DataSource6: TDataSource
    DataSet = tiva
    Left = 632
    Top = 301
  end
  object tpedido: TTable
    DatabaseName = 'comyleg'
    TableName = 'inarped'
    Left = 272
    Top = 325
    object tpedidonum_emp: TStringField
      FieldName = 'num_emp'
      FixedChar = True
      Size = 2
    end
    object tpedidonum_suc: TStringField
      FieldName = 'num_suc'
      FixedChar = True
      Size = 2
    end
    object tpedidonum_ped: TIntegerField
      FieldName = 'num_ped'
    end
    object tpedidocod_pro: TStringField
      FieldName = 'cod_pro'
      FixedChar = True
      Size = 8
    end
    object tpedidonum_fac: TIntegerField
      FieldName = 'num_fac'
    end
    object tpedidofech_ped: TDateField
      FieldName = 'fech_ped'
    end
    object tpedidofech_fac: TDateField
      FieldName = 'fech_fac'
    end
    object tpedidocon_pro: TStringField
      FieldName = 'con_pro'
      FixedChar = True
      Size = 1
    end
    object tpedidoimp_exe: TFloatField
      FieldName = 'imp_exe'
    end
    object tpedidoimp_15: TFloatField
      FieldName = 'imp_15'
    end
    object tpedidodes_exe: TFloatField
      FieldName = 'des_exe'
    end
    object tpedidodes_15: TFloatField
      FieldName = 'des_15'
    end
    object tpedidoiva_15: TFloatField
      FieldName = 'iva_15'
    end
    object tpedidoflete: TFloatField
      FieldName = 'flete'
    end
    object tpedidoiva_fle: TFloatField
      FieldName = 'iva_fle'
    end
  end
  object DataSource7: TDataSource
    DataSet = tpedido
    Left = 304
    Top = 325
  end
  object qtempo: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      
        'select a.cod_art, b.des_art, a.can_caj, a.can_kgs, a.cos_uni, a.' +
        'pre_vta,a.des_vta'
      'from inartrinv a, inarinv b'
      
        'where (a.num_emp = b.num_emp) and (a.cod_art = b.cod_art)  and (' +
        'a.tipo =0) and (a.documento= :num_doc)'
      '')
    Left = 384
    Top = 445
    ParamData = <
      item
        DataType = ftString
        Name = 'num_doc'
        ParamType = ptInput
      end>
    object qtempocod_art: TStringField
      FieldName = 'cod_art'
      KeyFields = 'cod_art'
      Origin = 'COMYLEG.inartrinv.cod_art'
      FixedChar = True
      Size = 14
    end
    object qtempodes_art: TStringField
      FieldName = 'des_art'
      KeyFields = 'des_art'
      Origin = 'COMYLEG.inarinv.des_art'
      FixedChar = True
      Size = 40
    end
    object qtempocan_caj: TFloatField
      FieldName = 'can_caj'
      KeyFields = 'can_caj'
      Origin = 'COMYLEG.inartrinv.can_caj'
    end
    object qtempocan_kgs: TFloatField
      FieldName = 'can_kgs'
      KeyFields = 'can_kgs'
      Origin = 'COMYLEG.inartrinv.can_kgs'
    end
    object qtempocos_uni: TFloatField
      FieldName = 'cos_uni'
      KeyFields = 'cos_uni'
      Origin = 'COMYLEG.inartrinv.cos_uni'
    end
    object qtempopre_vta: TFloatField
      FieldName = 'pre_vta'
      KeyFields = 'pre_vta'
      Origin = 'COMYLEG.inartrinv.pre_vta'
    end
    object qtempodes_vta: TFloatField
      FieldName = 'des_vta'
      Origin = 'COMYLEG.inartrinv.des_vta'
    end
  end
  object DataSource8: TDataSource
    DataSet = qtempo
    Left = 416
    Top = 445
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
    Left = 536
    Top = 8
  end
  object Tran_prov: TTable
    DatabaseName = 'comyleg'
    TableName = 'tran_prov'
    Left = 24
    Top = 401
    object Tran_provnum_emp: TStringField
      FieldName = 'num_emp'
      FixedChar = True
      Size = 2
    end
    object Tran_provnum_suc: TStringField
      FieldName = 'num_suc'
      FixedChar = True
      Size = 2
    end
    object Tran_provno_pedido: TStringField
      FieldName = 'no_pedido'
      FixedChar = True
      Size = 10
    end
    object Tran_provcod_pro: TStringField
      FieldName = 'cod_pro'
      FixedChar = True
      Size = 8
    end
    object Tran_provtelefono: TStringField
      FieldName = 'telefono'
      FixedChar = True
      Size = 12
    end
    object Tran_provnombre: TStringField
      FieldName = 'nombre'
      FixedChar = True
      Size = 50
    end
    object Tran_provdireccion: TStringField
      FieldName = 'direccion'
      FixedChar = True
      Size = 60
    end
    object Tran_provciudad: TStringField
      FieldName = 'ciudad'
      FixedChar = True
    end
    object Tran_provcod_art: TStringField
      FieldName = 'cod_art'
      FixedChar = True
      Size = 14
    end
    object Tran_provdescripcion: TStringField
      FieldName = 'descripcion'
      FixedChar = True
      Size = 40
    end
    object Tran_provcajas: TFloatField
      FieldName = 'cajas'
    end
    object Tran_provkilos: TFloatField
      FieldName = 'kilos'
    end
    object Tran_provprecio: TFloatField
      FieldName = 'precio'
    end
    object Tran_provtotal: TFloatField
      FieldName = 'total'
    end
    object Tran_provrenglon: TIntegerField
      FieldName = 'renglon'
    end
    object Tran_provcancelado: TIntegerField
      FieldName = 'cancelado'
    end
    object Tran_provimp_exe: TFloatField
      FieldName = 'imp_exe'
    end
    object Tran_proviva: TFloatField
      FieldName = 'iva'
    end
    object Tran_provcosto_pro: TFloatField
      FieldName = 'costo_pro'
    end
    object Tran_provieps: TFloatField
      FieldName = 'ieps'
    end
  end
  object DataSource9: TDataSource
    DataSet = Tran_prov
    Left = 56
    Top = 401
  end
  object qsaca: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from tran_prov'
      'where no_pedido = :no_pedido')
    Left = 384
    Top = 489
    ParamData = <
      item
        DataType = ftString
        Name = 'no_pedido'
        ParamType = ptInput
      end>
    object qsacanum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.tran_prov.num_emp'
      FixedChar = True
      Size = 2
    end
    object qsacanum_suc: TStringField
      FieldName = 'num_suc'
      Origin = 'COMYLEG.tran_prov.num_suc'
      FixedChar = True
      Size = 2
    end
    object qsacano_pedido: TStringField
      FieldName = 'no_pedido'
      Origin = 'COMYLEG.tran_prov.no_pedido'
      FixedChar = True
      Size = 10
    end
    object qsacacod_pro: TStringField
      FieldName = 'cod_pro'
      Origin = 'COMYLEG.tran_prov.cod_pro'
      FixedChar = True
      Size = 8
    end
    object qsacatelefono: TStringField
      FieldName = 'telefono'
      Origin = 'COMYLEG.tran_prov.telefono'
      FixedChar = True
      Size = 12
    end
    object qsacanombre: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.tran_prov.nombre'
      FixedChar = True
      Size = 50
    end
    object qsacadireccion: TStringField
      FieldName = 'direccion'
      Origin = 'COMYLEG.tran_prov.direccion'
      FixedChar = True
      Size = 60
    end
    object qsacaciudad: TStringField
      FieldName = 'ciudad'
      Origin = 'COMYLEG.tran_prov.ciudad'
      FixedChar = True
    end
    object qsacacod_art: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.tran_prov.cod_art'
      FixedChar = True
      Size = 14
    end
    object qsacadescripcion: TStringField
      FieldName = 'descripcion'
      Origin = 'COMYLEG.tran_prov.descripcion'
      FixedChar = True
      Size = 40
    end
    object qsacacajas: TFloatField
      FieldName = 'cajas'
      Origin = 'COMYLEG.tran_prov.cajas'
    end
    object qsacakilos: TFloatField
      FieldName = 'kilos'
      Origin = 'COMYLEG.tran_prov.kilos'
    end
    object qsacaprecio: TFloatField
      FieldName = 'precio'
      Origin = 'COMYLEG.tran_prov.precio'
    end
    object qsacatotal: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.tran_prov.total'
    end
    object qsacarenglon: TIntegerField
      FieldName = 'renglon'
      Origin = 'COMYLEG.tran_prov.renglon'
    end
    object qsacacancelado: TIntegerField
      FieldName = 'cancelado'
      Origin = 'COMYLEG.tran_prov.cancelado'
    end
    object qsacaimp_exe: TFloatField
      FieldName = 'imp_exe'
      Origin = 'COMYLEG.tran_prov.imp_exe'
    end
    object qsacaiva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.tran_prov.iva'
    end
    object qsacacosto_pro: TFloatField
      FieldName = 'costo_pro'
      Origin = 'COMYLEG.tran_prov.costo_pro'
    end
    object qsacaieps: TFloatField
      FieldName = 'ieps'
      Origin = 'COMYLEG.tran_prov.ieps'
    end
  end
  object DataSource10: TDataSource
    DataSet = qsaca
    Left = 416
    Top = 489
  end
  object DataSource3: TDataSource
    Left = 40
    Top = 473
  end
  object DataSource11: TDataSource
    Left = 40
    Top = 513
  end
  object pedido: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'inserta_ped'
    Left = 72
    Top = 473
    ParamData = <
      item
        DataType = ftUnknown
        Name = '1'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '2'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '3'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '4'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '5'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '6'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '7'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '8'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '9'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '10'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '11'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '12'
        ParamType = ptInput
      end>
  end
  object tr_pedido: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'inserta_tr_ped'
    Left = 72
    Top = 513
    ParamData = <
      item
        DataType = ftUnknown
        Name = '1'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '2'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '3'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '4'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '5'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '6'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '7'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '8'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '9'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '10'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '11'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '12'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '13'
        ParamType = ptInput
      end>
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    ProjectFile = 'C:\delphi\reportes\pruebas\reporte oc.rav'
    Left = 352
    Top = 489
  end
  object Orden: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = qsaca
    Left = 352
    Top = 521
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    DefaultDest = rdPreview
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 384
    Top = 489
  end
  object qcodpro: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarprov'
      'where num_emp= :num_emp and raz_soc <> '#39#39' and cod_pro <> '#39#39
      'and raz_soc <> '#39'00'#39' and cod_pro <> '#39'12345678'#39
      'order by raz_soc')
    Left = 488
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
    object qcodpronum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inarprov.num_emp'
      FixedChar = True
      Size = 2
    end
    object qcodprocod_pro: TStringField
      FieldName = 'cod_pro'
      Origin = 'COMYLEG.inarprov.cod_pro'
      FixedChar = True
      Size = 8
    end
    object qcodproraz_soc: TStringField
      FieldName = 'raz_soc'
      Origin = 'COMYLEG.inarprov.raz_soc'
      FixedChar = True
      Size = 50
    end
    object qcodprodom_pro: TStringField
      FieldName = 'dom_pro'
      Origin = 'COMYLEG.inarprov.dom_pro'
      FixedChar = True
      Size = 50
    end
    object qcodprociu_pro: TStringField
      FieldName = 'ciu_pro'
      Origin = 'COMYLEG.inarprov.ciu_pro'
      FixedChar = True
    end
    object qcodproest_pro: TStringField
      FieldName = 'est_pro'
      Origin = 'COMYLEG.inarprov.est_pro'
      FixedChar = True
      Size = 10
    end
    object qcodprotel_1: TStringField
      FieldName = 'tel_1'
      Origin = 'COMYLEG.inarprov.tel_1'
      FixedChar = True
      Size = 30
    end
    object qcodprorfc_pro: TStringField
      FieldName = 'rfc_pro'
      Origin = 'COMYLEG.inarprov.rfc_pro'
      FixedChar = True
    end
    object qcodprocod_pos: TIntegerField
      FieldName = 'cod_pos'
      Origin = 'COMYLEG.inarprov.cod_pos'
    end
    object qcodproage_pro: TSmallintField
      FieldName = 'age_pro'
      Origin = 'COMYLEG.inarprov.age_pro'
    end
    object qcodprocon_pro: TStringField
      FieldName = 'con_pro'
      Origin = 'COMYLEG.inarprov.con_pro'
      FixedChar = True
      Size = 1
    end
    object qcodpropla_pro: TSmallintField
      FieldName = 'pla_pro'
      Origin = 'COMYLEG.inarprov.pla_pro'
    end
    object qcodprosta_pro: TStringField
      FieldName = 'sta_pro'
      Origin = 'COMYLEG.inarprov.sta_pro'
      FixedChar = True
      Size = 1
    end
    object qcodprolim_cre: TFloatField
      FieldName = 'lim_cre'
      Origin = 'COMYLEG.inarprov.lim_cre'
    end
    object qcodprosal_act: TFloatField
      FieldName = 'sal_act'
      Origin = 'COMYLEG.inarprov.sal_act'
    end
    object qcodprosal_ant: TFloatField
      FieldName = 'sal_ant'
      Origin = 'COMYLEG.inarprov.sal_ant'
    end
    object qcodprocom_mes: TFloatField
      FieldName = 'com_mes'
      Origin = 'COMYLEG.inarprov.com_mes'
    end
    object qcodprocos_mes: TFloatField
      FieldName = 'cos_mes'
      Origin = 'COMYLEG.inarprov.cos_mes'
    end
    object qcodprocom_acu: TFloatField
      FieldName = 'com_acu'
      Origin = 'COMYLEG.inarprov.com_acu'
    end
    object qcodprocos_acu: TFloatField
      FieldName = 'cos_acu'
      Origin = 'COMYLEG.inarprov.cos_acu'
    end
    object qcodprofech_com: TDateField
      FieldName = 'fech_com'
      Origin = 'COMYLEG.inarprov.fech_com'
    end
    object qcodprocan_com: TFloatField
      FieldName = 'can_com'
      Origin = 'COMYLEG.inarprov.can_com'
    end
    object qcodprofech_pag: TDateField
      FieldName = 'fech_pag'
      Origin = 'COMYLEG.inarprov.fech_pag'
    end
    object qcodproimp_pag: TFloatField
      FieldName = 'imp_pag'
      Origin = 'COMYLEG.inarprov.imp_pag'
    end
    object qcodprocurp: TStringField
      FieldName = 'curp'
      Origin = 'COMYLEG.inarprov.curp'
      FixedChar = True
      Size = 18
    end
  end
  object DataSource12: TDataSource
    DataSet = qcodpro
    Left = 456
    Top = 16
  end
  object PopupMenu1: TPopupMenu
    Left = 752
    Top = 265
  end
  object DataSource13: TDataSource
    DataSet = qrevisa
    Left = 112
    Top = 73
  end
  object qrevisa: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select num_ped'
      'from inarped'
      'where num_ped= :num_ped and num_emp = :num_emp')
    Left = 80
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'num_ped'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
  end
  object qcodi: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarinv'
      'where num_emp = :codicli  and (tip_art = '#39'K'#39' OR tip_art ='#39'C'#39')'
      'order by cod_Art')
    Left = 103
    Top = 169
    ParamData = <
      item
        DataType = ftString
        Name = 'codicli'
        ParamType = ptInput
      end>
  end
  object DataSource14: TDataSource
    DataSet = qcodi
    Left = 135
    Top = 169
  end
  object qnumemp: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select num_emp'
      'from consent'
      ' ')
    Left = 184
    Top = 24
  end
  object DataSource15: TDataSource
    DataSet = qnumemp
    Left = 216
    Top = 25
  end
  object DataSource18: TDataSource
    DataSet = qminemp
    Left = 208
    Top = 401
  end
  object qminemp: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select min_emp, max_emp'
      'from inarinv'
      'where cod_Art = :cod_art and num_emp = :num_emp')
    Left = 176
    Top = 401
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_art'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
  end
  object DataSource19: TDataSource
    DataSet = Qminemp2
    Left = 208
    Top = 433
  end
  object Qminemp2: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select min_emp, max_emp'
      'from inarinv'
      'where des_Art = :des_Art and num_emp = :num_emp')
    Left = 176
    Top = 433
    ParamData = <
      item
        DataType = ftString
        Name = 'des_Art'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
  end
  object QSACANEG: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarinv'
      
        'where COD_aRT = :COD_ART  AND (EXI_COR_KGS < 0 OR EXI_COR_CAJ < ' +
        '0)'
      '          AND NUM_EMP = :NUM_EMP')
    Left = 392
    Top = 585
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_ART'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUM_EMP'
        ParamType = ptInput
      end>
  end
  object DataSource17: TDataSource
    DataSet = QSACANEG
    Left = 424
    Top = 585
  end
  object qinven: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarinv'
      'where num_emp = :num_emp and cod_art = :cod_art')
    Left = 536
    Top = 577
    ParamData = <
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cod_art'
        ParamType = ptInput
      end>
    object qinvennum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inarinv.num_emp'
      FixedChar = True
      Size = 2
    end
    object qinvencod_art: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.inarinv.cod_art'
      FixedChar = True
      Size = 14
    end
    object qinvencod_art1: TStringField
      FieldName = 'cod_art1'
      Origin = 'COMYLEG.inarinv.cod_art1'
      FixedChar = True
      Size = 14
    end
    object qinvendes_art: TStringField
      FieldName = 'des_art'
      Origin = 'COMYLEG.inarinv.des_art'
      FixedChar = True
      Size = 40
    end
    object qinvenuni_art: TStringField
      FieldName = 'uni_art'
      Origin = 'COMYLEG.inarinv.uni_art'
      FixedChar = True
      Size = 4
    end
    object qinvenemp_art: TStringField
      FieldName = 'emp_art'
      Origin = 'COMYLEG.inarinv.emp_art'
      FixedChar = True
      Size = 4
    end
    object qinvencan_emp: TFloatField
      FieldName = 'can_emp'
      Origin = 'COMYLEG.inarinv.can_emp'
    end
    object qinvenprecio_1: TFloatField
      FieldName = 'precio_1'
      Origin = 'COMYLEG.inarinv.precio_1'
    end
    object qinvenprecio_2: TFloatField
      FieldName = 'precio_2'
      Origin = 'COMYLEG.inarinv.precio_2'
    end
    object qinvenprecio_3: TFloatField
      FieldName = 'precio_3'
      Origin = 'COMYLEG.inarinv.precio_3'
    end
    object qinvenprecio_4: TFloatField
      FieldName = 'precio_4'
      Origin = 'COMYLEG.inarinv.precio_4'
    end
    object qinvenprecio_5: TFloatField
      FieldName = 'precio_5'
      Origin = 'COMYLEG.inarinv.precio_5'
    end
    object qinvensal_val: TFloatField
      FieldName = 'sal_val'
      Origin = 'COMYLEG.inarinv.sal_val'
    end
    object qinvensal_ant: TFloatField
      FieldName = 'sal_ant'
      Origin = 'COMYLEG.inarinv.sal_ant'
    end
    object qinvenult_cos_kgs: TFloatField
      FieldName = 'ult_cos_kgs'
      Origin = 'COMYLEG.inarinv.ult_cos_kgs'
    end
    object qinvencos_pro_kgs: TFloatField
      FieldName = 'cos_pro_kgs'
      Origin = 'COMYLEG.inarinv.cos_pro_kgs'
    end
    object qinvencos_ant_kgs: TFloatField
      FieldName = 'cos_ant_kgs'
      Origin = 'COMYLEG.inarinv.cos_ant_kgs'
    end
    object qinvenven_mes_kgs: TFloatField
      FieldName = 'ven_mes_kgs'
      Origin = 'COMYLEG.inarinv.ven_mes_kgs'
    end
    object qinvencos_mes_kgs: TFloatField
      FieldName = 'cos_mes_kgs'
      Origin = 'COMYLEG.inarinv.cos_mes_kgs'
    end
    object qinvenven_acu_kgs: TFloatField
      FieldName = 'ven_acu_kgs'
      Origin = 'COMYLEG.inarinv.ven_acu_kgs'
    end
    object qinvencos_acu_kgs: TFloatField
      FieldName = 'cos_acu_kgs'
      Origin = 'COMYLEG.inarinv.cos_acu_kgs'
    end
    object qinvenexi_cor_kgs: TFloatField
      FieldName = 'exi_cor_kgs'
      Origin = 'COMYLEG.inarinv.exi_cor_kgs'
    end
    object qinvenexi_ant_kgs: TFloatField
      FieldName = 'exi_ant_kgs'
      Origin = 'COMYLEG.inarinv.exi_ant_kgs'
    end
    object qinvenexi_fis_kgs: TFloatField
      FieldName = 'exi_fis_kgs'
      Origin = 'COMYLEG.inarinv.exi_fis_kgs'
    end
    object qinvencan_acu_kgs: TFloatField
      FieldName = 'can_acu_kgs'
      Origin = 'COMYLEG.inarinv.can_acu_kgs'
    end
    object qinvencan_mes_kgs: TFloatField
      FieldName = 'can_mes_kgs'
      Origin = 'COMYLEG.inarinv.can_mes_kgs'
    end
    object qinvenult_cos_caj: TFloatField
      FieldName = 'ult_cos_caj'
      Origin = 'COMYLEG.inarinv.ult_cos_caj'
    end
    object qinvencos_pro_caj: TFloatField
      FieldName = 'cos_pro_caj'
      Origin = 'COMYLEG.inarinv.cos_pro_caj'
    end
    object qinvencos_ant_caj: TFloatField
      FieldName = 'cos_ant_caj'
      Origin = 'COMYLEG.inarinv.cos_ant_caj'
    end
    object qinvenven_mes_caj: TFloatField
      FieldName = 'ven_mes_caj'
      Origin = 'COMYLEG.inarinv.ven_mes_caj'
    end
    object qinvencos_mes_caj: TFloatField
      FieldName = 'cos_mes_caj'
      Origin = 'COMYLEG.inarinv.cos_mes_caj'
    end
    object qinvenven_acu_caj: TFloatField
      FieldName = 'ven_acu_caj'
      Origin = 'COMYLEG.inarinv.ven_acu_caj'
    end
    object qinvencos_acu_caj: TFloatField
      FieldName = 'cos_acu_caj'
      Origin = 'COMYLEG.inarinv.cos_acu_caj'
    end
    object qinvenexi_cor_caj: TFloatField
      FieldName = 'exi_cor_caj'
      Origin = 'COMYLEG.inarinv.exi_cor_caj'
    end
    object qinvenexi_ant_caj: TFloatField
      FieldName = 'exi_ant_caj'
      Origin = 'COMYLEG.inarinv.exi_ant_caj'
    end
    object qinvenexi_fis_caj: TFloatField
      FieldName = 'exi_fis_caj'
      Origin = 'COMYLEG.inarinv.exi_fis_caj'
    end
    object qinvencan_acu_caj: TFloatField
      FieldName = 'can_acu_caj'
      Origin = 'COMYLEG.inarinv.can_acu_caj'
    end
    object qinvencan_mes_caj: TFloatField
      FieldName = 'can_mes_caj'
      Origin = 'COMYLEG.inarinv.can_mes_caj'
    end
    object qinvenback_cli: TFloatField
      FieldName = 'back_cli'
      Origin = 'COMYLEG.inarinv.back_cli'
    end
    object qinvenback_pro: TFloatField
      FieldName = 'back_pro'
      Origin = 'COMYLEG.inarinv.back_pro'
    end
    object qinvenmin_emp: TFloatField
      FieldName = 'min_emp'
      Origin = 'COMYLEG.inarinv.min_emp'
    end
    object qinvenmax_emp: TFloatField
      FieldName = 'max_emp'
      Origin = 'COMYLEG.inarinv.max_emp'
    end
    object qinveniva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.inarinv.iva'
    end
    object qinvenlin_ven: TSmallintField
      FieldName = 'lin_ven'
      Origin = 'COMYLEG.inarinv.lin_ven'
    end
    object qinvencod_pro: TStringField
      FieldName = 'cod_pro'
      Origin = 'COMYLEG.inarinv.cod_pro'
      FixedChar = True
      Size = 8
    end
    object qinventip_art: TStringField
      FieldName = 'tip_art'
      Origin = 'COMYLEG.inarinv.tip_art'
      FixedChar = True
      Size = 1
    end
    object qinvenedo_pro: TStringField
      FieldName = 'edo_pro'
      Origin = 'COMYLEG.inarinv.edo_pro'
      FixedChar = True
      Size = 2
    end
    object qinvenban_rep: TStringField
      FieldName = 'ban_rep'
      Origin = 'COMYLEG.inarinv.ban_rep'
      FixedChar = True
      Size = 1
    end
    object qinvenmin_pre: TFloatField
      FieldName = 'min_pre'
      Origin = 'COMYLEG.inarinv.min_pre'
    end
    object qinvenmax_pre: TFloatField
      FieldName = 'max_pre'
      Origin = 'COMYLEG.inarinv.max_pre'
    end
    object qinvenobserva: TStringField
      FieldName = 'observa'
      Origin = 'COMYLEG.inarinv.observa'
      FixedChar = True
      Size = 50
    end
  end
  object DataSource16: TDataSource
    DataSet = qinven
    Left = 568
    Top = 577
  end
  object QBUSARTI: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarinv'
      'where num_emp = :NUM_EMP AND COD_ART = :COD_ART'
      'order by cod_Art')
    Left = 175
    Top = 489
    ParamData = <
      item
        DataType = ftString
        Name = 'NUM_EMP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COD_ART'
        ParamType = ptInput
      end>
    object QBUSARTInum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inarinv.num_emp'
      FixedChar = True
      Size = 2
    end
    object QBUSARTIcod_art: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.inarinv.cod_art'
      FixedChar = True
      Size = 14
    end
    object QBUSARTIcod_art1: TStringField
      FieldName = 'cod_art1'
      Origin = 'COMYLEG.inarinv.cod_art1'
      FixedChar = True
      Size = 14
    end
    object QBUSARTIdes_art: TStringField
      FieldName = 'des_art'
      Origin = 'COMYLEG.inarinv.des_art'
      FixedChar = True
      Size = 40
    end
    object QBUSARTIuni_art: TStringField
      FieldName = 'uni_art'
      Origin = 'COMYLEG.inarinv.uni_art'
      FixedChar = True
      Size = 4
    end
    object QBUSARTIemp_art: TStringField
      FieldName = 'emp_art'
      Origin = 'COMYLEG.inarinv.emp_art'
      FixedChar = True
      Size = 4
    end
    object QBUSARTIcan_emp: TFloatField
      FieldName = 'can_emp'
      Origin = 'COMYLEG.inarinv.can_emp'
    end
    object QBUSARTIprecio_1: TFloatField
      FieldName = 'precio_1'
      Origin = 'COMYLEG.inarinv.precio_1'
    end
    object QBUSARTIprecio_2: TFloatField
      FieldName = 'precio_2'
      Origin = 'COMYLEG.inarinv.precio_2'
    end
    object QBUSARTIprecio_3: TFloatField
      FieldName = 'precio_3'
      Origin = 'COMYLEG.inarinv.precio_3'
    end
    object QBUSARTIprecio_4: TFloatField
      FieldName = 'precio_4'
      Origin = 'COMYLEG.inarinv.precio_4'
    end
    object QBUSARTIprecio_5: TFloatField
      FieldName = 'precio_5'
      Origin = 'COMYLEG.inarinv.precio_5'
    end
    object QBUSARTIsal_val: TFloatField
      FieldName = 'sal_val'
      Origin = 'COMYLEG.inarinv.sal_val'
    end
    object QBUSARTIsal_ant: TFloatField
      FieldName = 'sal_ant'
      Origin = 'COMYLEG.inarinv.sal_ant'
    end
    object QBUSARTIult_cos_kgs: TFloatField
      FieldName = 'ult_cos_kgs'
      Origin = 'COMYLEG.inarinv.ult_cos_kgs'
    end
    object QBUSARTIcos_pro_kgs: TFloatField
      FieldName = 'cos_pro_kgs'
      Origin = 'COMYLEG.inarinv.cos_pro_kgs'
    end
    object QBUSARTIcos_ant_kgs: TFloatField
      FieldName = 'cos_ant_kgs'
      Origin = 'COMYLEG.inarinv.cos_ant_kgs'
    end
    object QBUSARTIven_mes_kgs: TFloatField
      FieldName = 'ven_mes_kgs'
      Origin = 'COMYLEG.inarinv.ven_mes_kgs'
    end
    object QBUSARTIcos_mes_kgs: TFloatField
      FieldName = 'cos_mes_kgs'
      Origin = 'COMYLEG.inarinv.cos_mes_kgs'
    end
    object QBUSARTIven_acu_kgs: TFloatField
      FieldName = 'ven_acu_kgs'
      Origin = 'COMYLEG.inarinv.ven_acu_kgs'
    end
    object QBUSARTIcos_acu_kgs: TFloatField
      FieldName = 'cos_acu_kgs'
      Origin = 'COMYLEG.inarinv.cos_acu_kgs'
    end
    object QBUSARTIexi_cor_kgs: TFloatField
      FieldName = 'exi_cor_kgs'
      Origin = 'COMYLEG.inarinv.exi_cor_kgs'
    end
    object QBUSARTIexi_ant_kgs: TFloatField
      FieldName = 'exi_ant_kgs'
      Origin = 'COMYLEG.inarinv.exi_ant_kgs'
    end
    object QBUSARTIexi_fis_kgs: TFloatField
      FieldName = 'exi_fis_kgs'
      Origin = 'COMYLEG.inarinv.exi_fis_kgs'
    end
    object QBUSARTIcan_acu_kgs: TFloatField
      FieldName = 'can_acu_kgs'
      Origin = 'COMYLEG.inarinv.can_acu_kgs'
    end
    object QBUSARTIcan_mes_kgs: TFloatField
      FieldName = 'can_mes_kgs'
      Origin = 'COMYLEG.inarinv.can_mes_kgs'
    end
    object QBUSARTIult_cos_caj: TFloatField
      FieldName = 'ult_cos_caj'
      Origin = 'COMYLEG.inarinv.ult_cos_caj'
    end
    object QBUSARTIcos_pro_caj: TFloatField
      FieldName = 'cos_pro_caj'
      Origin = 'COMYLEG.inarinv.cos_pro_caj'
    end
    object QBUSARTIcos_ant_caj: TFloatField
      FieldName = 'cos_ant_caj'
      Origin = 'COMYLEG.inarinv.cos_ant_caj'
    end
    object QBUSARTIven_mes_caj: TFloatField
      FieldName = 'ven_mes_caj'
      Origin = 'COMYLEG.inarinv.ven_mes_caj'
    end
    object QBUSARTIcos_mes_caj: TFloatField
      FieldName = 'cos_mes_caj'
      Origin = 'COMYLEG.inarinv.cos_mes_caj'
    end
    object QBUSARTIven_acu_caj: TFloatField
      FieldName = 'ven_acu_caj'
      Origin = 'COMYLEG.inarinv.ven_acu_caj'
    end
    object QBUSARTIcos_acu_caj: TFloatField
      FieldName = 'cos_acu_caj'
      Origin = 'COMYLEG.inarinv.cos_acu_caj'
    end
    object QBUSARTIexi_cor_caj: TFloatField
      FieldName = 'exi_cor_caj'
      Origin = 'COMYLEG.inarinv.exi_cor_caj'
    end
    object QBUSARTIexi_ant_caj: TFloatField
      FieldName = 'exi_ant_caj'
      Origin = 'COMYLEG.inarinv.exi_ant_caj'
    end
    object QBUSARTIexi_fis_caj: TFloatField
      FieldName = 'exi_fis_caj'
      Origin = 'COMYLEG.inarinv.exi_fis_caj'
    end
    object QBUSARTIcan_acu_caj: TFloatField
      FieldName = 'can_acu_caj'
      Origin = 'COMYLEG.inarinv.can_acu_caj'
    end
    object QBUSARTIcan_mes_caj: TFloatField
      FieldName = 'can_mes_caj'
      Origin = 'COMYLEG.inarinv.can_mes_caj'
    end
    object QBUSARTIback_cli: TFloatField
      FieldName = 'back_cli'
      Origin = 'COMYLEG.inarinv.back_cli'
    end
    object QBUSARTIback_pro: TFloatField
      FieldName = 'back_pro'
      Origin = 'COMYLEG.inarinv.back_pro'
    end
    object QBUSARTImin_emp: TFloatField
      FieldName = 'min_emp'
      Origin = 'COMYLEG.inarinv.min_emp'
    end
    object QBUSARTImax_emp: TFloatField
      FieldName = 'max_emp'
      Origin = 'COMYLEG.inarinv.max_emp'
    end
    object QBUSARTIiva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.inarinv.iva'
    end
    object QBUSARTIlin_ven: TSmallintField
      FieldName = 'lin_ven'
      Origin = 'COMYLEG.inarinv.lin_ven'
    end
    object QBUSARTIcod_pro: TStringField
      FieldName = 'cod_pro'
      Origin = 'COMYLEG.inarinv.cod_pro'
      FixedChar = True
      Size = 8
    end
    object QBUSARTItip_art: TStringField
      FieldName = 'tip_art'
      Origin = 'COMYLEG.inarinv.tip_art'
      FixedChar = True
      Size = 1
    end
    object QBUSARTIedo_pro: TStringField
      FieldName = 'edo_pro'
      Origin = 'COMYLEG.inarinv.edo_pro'
      FixedChar = True
      Size = 2
    end
    object QBUSARTIban_rep: TStringField
      FieldName = 'ban_rep'
      Origin = 'COMYLEG.inarinv.ban_rep'
      FixedChar = True
      Size = 1
    end
    object QBUSARTImin_pre: TFloatField
      FieldName = 'min_pre'
      Origin = 'COMYLEG.inarinv.min_pre'
    end
    object QBUSARTImax_pre: TFloatField
      FieldName = 'max_pre'
      Origin = 'COMYLEG.inarinv.max_pre'
    end
    object QBUSARTIobserva: TStringField
      FieldName = 'observa'
      Origin = 'COMYLEG.inarinv.observa'
      FixedChar = True
      Size = 50
    end
  end
  object DataSource20: TDataSource
    DataSet = QBUSARTI
    Left = 207
    Top = 489
  end
  object Query2: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarprov'
      'where cod_pro = :cod_pro and num_emp ='#39'03'#39)
    Left = 520
    Top = 304
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_pro'
        ParamType = ptInput
      end>
    object Query2num_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inarprov.num_emp'
      FixedChar = True
      Size = 2
    end
    object Query2cod_pro: TStringField
      FieldName = 'cod_pro'
      Origin = 'COMYLEG.inarprov.cod_pro'
      FixedChar = True
      Size = 8
    end
    object Query2raz_soc: TStringField
      FieldName = 'raz_soc'
      Origin = 'COMYLEG.inarprov.raz_soc'
      FixedChar = True
      Size = 50
    end
    object Query2dom_pro: TStringField
      FieldName = 'dom_pro'
      Origin = 'COMYLEG.inarprov.dom_pro'
      FixedChar = True
      Size = 50
    end
    object Query2ciu_pro: TStringField
      FieldName = 'ciu_pro'
      Origin = 'COMYLEG.inarprov.ciu_pro'
      FixedChar = True
    end
    object Query2est_pro: TStringField
      FieldName = 'est_pro'
      Origin = 'COMYLEG.inarprov.est_pro'
      FixedChar = True
      Size = 10
    end
    object Query2tel_1: TStringField
      FieldName = 'tel_1'
      Origin = 'COMYLEG.inarprov.tel_1'
      FixedChar = True
      Size = 30
    end
    object Query2rfc_pro: TStringField
      FieldName = 'rfc_pro'
      Origin = 'COMYLEG.inarprov.rfc_pro'
      FixedChar = True
    end
    object Query2cod_pos: TIntegerField
      FieldName = 'cod_pos'
      Origin = 'COMYLEG.inarprov.cod_pos'
    end
    object Query2age_pro: TSmallintField
      FieldName = 'age_pro'
      Origin = 'COMYLEG.inarprov.age_pro'
    end
    object Query2con_pro: TStringField
      FieldName = 'con_pro'
      Origin = 'COMYLEG.inarprov.con_pro'
      FixedChar = True
      Size = 1
    end
    object Query2pla_pro: TSmallintField
      FieldName = 'pla_pro'
      Origin = 'COMYLEG.inarprov.pla_pro'
    end
    object Query2sta_pro: TStringField
      FieldName = 'sta_pro'
      Origin = 'COMYLEG.inarprov.sta_pro'
      FixedChar = True
      Size = 1
    end
    object Query2lim_cre: TFloatField
      FieldName = 'lim_cre'
      Origin = 'COMYLEG.inarprov.lim_cre'
    end
    object Query2sal_act: TFloatField
      FieldName = 'sal_act'
      Origin = 'COMYLEG.inarprov.sal_act'
    end
    object Query2sal_ant: TFloatField
      FieldName = 'sal_ant'
      Origin = 'COMYLEG.inarprov.sal_ant'
    end
    object Query2com_mes: TFloatField
      FieldName = 'com_mes'
      Origin = 'COMYLEG.inarprov.com_mes'
    end
    object Query2cos_mes: TFloatField
      FieldName = 'cos_mes'
      Origin = 'COMYLEG.inarprov.cos_mes'
    end
    object Query2com_acu: TFloatField
      FieldName = 'com_acu'
      Origin = 'COMYLEG.inarprov.com_acu'
    end
    object Query2cos_acu: TFloatField
      FieldName = 'cos_acu'
      Origin = 'COMYLEG.inarprov.cos_acu'
    end
    object Query2fech_com: TDateField
      FieldName = 'fech_com'
      Origin = 'COMYLEG.inarprov.fech_com'
    end
    object Query2can_com: TFloatField
      FieldName = 'can_com'
      Origin = 'COMYLEG.inarprov.can_com'
    end
    object Query2fech_pag: TDateField
      FieldName = 'fech_pag'
      Origin = 'COMYLEG.inarprov.fech_pag'
    end
    object Query2imp_pag: TFloatField
      FieldName = 'imp_pag'
      Origin = 'COMYLEG.inarprov.imp_pag'
    end
    object Query2curp: TStringField
      FieldName = 'curp'
      Origin = 'COMYLEG.inarprov.curp'
      FixedChar = True
      Size = 18
    end
  end
  object DataSource34: TDataSource
    DataSet = Query2
    Left = 552
    Top = 304
  end
  object QIEPS: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from IEPS'
      'WHERE CODIGO = :CODIGO')
    Left = 392
    Top = 377
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    object QIEPScodigo: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.ieps.codigo'
      FixedChar = True
      Size = 40
    end
  end
  object DataSource37: TDataSource
    DataSet = QIEPS
    Left = 424
    Top = 377
  end
  object deta_ieps: TTable
    DatabaseName = 'comyleg'
    TableName = 'deta_ieps'
    Left = 24
    Top = 369
    object deta_iepsnum_emp: TStringField
      FieldName = 'num_emp'
      FixedChar = True
      Size = 2
    end
    object deta_iepsnum_suc: TStringField
      FieldName = 'num_suc'
      FixedChar = True
      Size = 2
    end
    object deta_iepsnum_doc: TStringField
      FieldName = 'num_doc'
      FixedChar = True
      Size = 10
    end
    object deta_iepscod_art: TStringField
      FieldName = 'cod_art'
      FixedChar = True
      Size = 8
    end
    object deta_iepsieps: TFloatField
      FieldName = 'ieps'
    end
    object deta_iepsdebe: TFloatField
      FieldName = 'debe'
    end
    object deta_iepsfecha: TDateField
      FieldName = 'fecha'
    end
    object deta_iepstip_doc: TStringField
      FieldName = 'tip_doc'
      FixedChar = True
      Size = 4
    end
    object deta_iepscod_cli: TStringField
      FieldName = 'cod_cli'
      FixedChar = True
      Size = 10
    end
    object deta_iepscod_pro: TStringField
      FieldName = 'cod_pro'
      FixedChar = True
      Size = 10
    end
  end
  object DataSource21: TDataSource
    DataSet = deta_ieps
    Left = 56
    Top = 369
  end
  object QUPINARPED: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update inarped'
      'set des_15 = :tot_ieps, des_exe = :acuieps'
      'where num_ped = :num_ped and num_emp = :num_emp')
    Left = 160
    Top = 561
    ParamData = <
      item
        DataType = ftString
        Name = 'tot_ieps'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'acuieps'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_ped'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
  end
  object DataSource22: TDataSource
    DataSet = QUPINARPED
    Left = 192
    Top = 561
  end
  object conent: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from consendiv'
      'where num_emp = :num_emp')
    Left = 680
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
    object conentnum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.consendiv.num_emp'
      FixedChar = True
      Size = 2
    end
    object conentnum_ent: TIntegerField
      FieldName = 'num_ent'
      Origin = 'COMYLEG.consendiv.num_ent'
    end
  end
  object DataSource81: TDataSource
    DataSet = conent
    Left = 712
    Top = 64
  end
  object consal: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from conssadiv'
      'where num_emp = :num_emp')
    Left = 680
    Top = 96
    ParamData = <
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
    object consalnum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.conssadiv.num_emp'
      FixedChar = True
      Size = 2
    end
    object consalnum_sal: TIntegerField
      FieldName = 'num_sal'
      Origin = 'COMYLEG.conssadiv.num_sal'
    end
  end
  object DataSource82: TDataSource
    DataSet = consal
    Left = 712
    Top = 96
  end
  object StoredProc4: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'inserta_entdiv'
    Left = 680
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = '1'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '2'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '3'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '4'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '5'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '6'
        ParamType = ptInput
      end>
  end
  object DataSource83: TDataSource
    DataSet = StoredProc4
    Left = 712
    Top = 136
  end
  object StoredProc5: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'inserta_tr_entdiv'
    Left = 680
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = '1'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '2'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '3'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '4'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '5'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '6'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '7'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '8'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '9'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '10'
        ParamType = ptInput
      end>
  end
  object DataSource84: TDataSource
    DataSet = StoredProc5
    Left = 712
    Top = 168
  end
  object StoredProc7: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'inserta_tr_saldiv'
    Left = 760
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = '1'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '2'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '3'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '4'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '5'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '6'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '7'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '8'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '9'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '10'
        ParamType = ptInput
      end>
  end
  object DataSource90: TDataSource
    DataSet = StoredProc7
    Left = 792
    Top = 168
  end
  object DataSource89: TDataSource
    DataSet = StoredProc6
    Left = 792
    Top = 136
  end
  object StoredProc6: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'inserta_saldiv'
    Left = 760
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = '1'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '2'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '3'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '4'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '5'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '6'
        ParamType = ptInput
      end>
  end
  object QUPENT: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'UPDATE CONSENDIV'
      'SET NUM_ENT = :NUM_ENT'
      'WHERE NUM_EMP = :NUM_EMP')
    Left = 752
    Top = 96
    ParamData = <
      item
        DataType = ftString
        Name = 'NUM_ENT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
    object StringField47: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inarinv.num_emp'
      FixedChar = True
      Size = 2
    end
    object StringField48: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.inarinv.cod_art'
      FixedChar = True
      Size = 14
    end
    object StringField49: TStringField
      FieldName = 'cod_art1'
      Origin = 'COMYLEG.inarinv.cod_art1'
      FixedChar = True
      Size = 14
    end
    object StringField50: TStringField
      FieldName = 'des_art'
      Origin = 'COMYLEG.inarinv.des_art'
      FixedChar = True
      Size = 40
    end
    object StringField51: TStringField
      FieldName = 'uni_art'
      Origin = 'COMYLEG.inarinv.uni_art'
      FixedChar = True
      Size = 4
    end
    object StringField52: TStringField
      FieldName = 'emp_art'
      Origin = 'COMYLEG.inarinv.emp_art'
      FixedChar = True
      Size = 4
    end
    object FloatField37: TFloatField
      FieldName = 'can_emp'
      Origin = 'COMYLEG.inarinv.can_emp'
    end
    object FloatField38: TFloatField
      FieldName = 'precio_1'
      Origin = 'COMYLEG.inarinv.precio_1'
    end
    object FloatField39: TFloatField
      FieldName = 'precio_2'
      Origin = 'COMYLEG.inarinv.precio_2'
    end
    object FloatField40: TFloatField
      FieldName = 'precio_3'
      Origin = 'COMYLEG.inarinv.precio_3'
    end
    object FloatField41: TFloatField
      FieldName = 'precio_4'
      Origin = 'COMYLEG.inarinv.precio_4'
    end
    object FloatField42: TFloatField
      FieldName = 'precio_5'
      Origin = 'COMYLEG.inarinv.precio_5'
    end
    object FloatField43: TFloatField
      FieldName = 'sal_val'
      Origin = 'COMYLEG.inarinv.sal_val'
    end
    object FloatField44: TFloatField
      FieldName = 'sal_ant'
      Origin = 'COMYLEG.inarinv.sal_ant'
    end
    object FloatField45: TFloatField
      FieldName = 'ult_cos_kgs'
      Origin = 'COMYLEG.inarinv.ult_cos_kgs'
    end
    object FloatField46: TFloatField
      FieldName = 'cos_pro_kgs'
      Origin = 'COMYLEG.inarinv.cos_pro_kgs'
    end
    object FloatField47: TFloatField
      FieldName = 'cos_ant_kgs'
      Origin = 'COMYLEG.inarinv.cos_ant_kgs'
    end
    object FloatField48: TFloatField
      FieldName = 'ven_mes_kgs'
      Origin = 'COMYLEG.inarinv.ven_mes_kgs'
    end
    object FloatField49: TFloatField
      FieldName = 'cos_mes_kgs'
      Origin = 'COMYLEG.inarinv.cos_mes_kgs'
    end
    object FloatField50: TFloatField
      FieldName = 'ven_acu_kgs'
      Origin = 'COMYLEG.inarinv.ven_acu_kgs'
    end
    object FloatField51: TFloatField
      FieldName = 'cos_acu_kgs'
      Origin = 'COMYLEG.inarinv.cos_acu_kgs'
    end
    object FloatField52: TFloatField
      FieldName = 'exi_cor_kgs'
      Origin = 'COMYLEG.inarinv.exi_cor_kgs'
    end
    object FloatField53: TFloatField
      FieldName = 'exi_ant_kgs'
      Origin = 'COMYLEG.inarinv.exi_ant_kgs'
    end
    object FloatField54: TFloatField
      FieldName = 'exi_fis_kgs'
      Origin = 'COMYLEG.inarinv.exi_fis_kgs'
    end
    object FloatField55: TFloatField
      FieldName = 'can_acu_kgs'
      Origin = 'COMYLEG.inarinv.can_acu_kgs'
    end
    object FloatField56: TFloatField
      FieldName = 'can_mes_kgs'
      Origin = 'COMYLEG.inarinv.can_mes_kgs'
    end
    object FloatField57: TFloatField
      FieldName = 'ult_cos_caj'
      Origin = 'COMYLEG.inarinv.ult_cos_caj'
    end
    object FloatField58: TFloatField
      FieldName = 'cos_pro_caj'
      Origin = 'COMYLEG.inarinv.cos_pro_caj'
    end
    object FloatField59: TFloatField
      FieldName = 'cos_ant_caj'
      Origin = 'COMYLEG.inarinv.cos_ant_caj'
    end
    object FloatField60: TFloatField
      FieldName = 'ven_mes_caj'
      Origin = 'COMYLEG.inarinv.ven_mes_caj'
    end
    object FloatField61: TFloatField
      FieldName = 'cos_mes_caj'
      Origin = 'COMYLEG.inarinv.cos_mes_caj'
    end
    object FloatField62: TFloatField
      FieldName = 'ven_acu_caj'
      Origin = 'COMYLEG.inarinv.ven_acu_caj'
    end
    object FloatField63: TFloatField
      FieldName = 'cos_acu_caj'
      Origin = 'COMYLEG.inarinv.cos_acu_caj'
    end
    object FloatField64: TFloatField
      FieldName = 'exi_cor_caj'
      Origin = 'COMYLEG.inarinv.exi_cor_caj'
    end
    object FloatField65: TFloatField
      FieldName = 'exi_ant_caj'
      Origin = 'COMYLEG.inarinv.exi_ant_caj'
    end
    object FloatField66: TFloatField
      FieldName = 'exi_fis_caj'
      Origin = 'COMYLEG.inarinv.exi_fis_caj'
    end
    object FloatField67: TFloatField
      FieldName = 'can_acu_caj'
      Origin = 'COMYLEG.inarinv.can_acu_caj'
    end
    object FloatField68: TFloatField
      FieldName = 'can_mes_caj'
      Origin = 'COMYLEG.inarinv.can_mes_caj'
    end
    object FloatField69: TFloatField
      FieldName = 'back_cli'
      Origin = 'COMYLEG.inarinv.back_cli'
    end
    object FloatField70: TFloatField
      FieldName = 'back_pro'
      Origin = 'COMYLEG.inarinv.back_pro'
    end
    object FloatField71: TFloatField
      FieldName = 'min_emp'
      Origin = 'COMYLEG.inarinv.min_emp'
    end
    object FloatField72: TFloatField
      FieldName = 'max_emp'
      Origin = 'COMYLEG.inarinv.max_emp'
    end
    object FloatField73: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.inarinv.iva'
    end
    object SmallintField9: TSmallintField
      FieldName = 'lin_ven'
      Origin = 'COMYLEG.inarinv.lin_ven'
    end
    object StringField53: TStringField
      FieldName = 'cod_pro'
      Origin = 'COMYLEG.inarinv.cod_pro'
      FixedChar = True
      Size = 8
    end
    object StringField54: TStringField
      FieldName = 'tip_art'
      Origin = 'COMYLEG.inarinv.tip_art'
      FixedChar = True
      Size = 1
    end
    object StringField55: TStringField
      FieldName = 'edo_pro'
      Origin = 'COMYLEG.inarinv.edo_pro'
      FixedChar = True
      Size = 2
    end
    object StringField56: TStringField
      FieldName = 'ban_rep'
      Origin = 'COMYLEG.inarinv.ban_rep'
      FixedChar = True
      Size = 1
    end
    object FloatField74: TFloatField
      FieldName = 'min_pre'
      Origin = 'COMYLEG.inarinv.min_pre'
    end
    object FloatField75: TFloatField
      FieldName = 'max_pre'
      Origin = 'COMYLEG.inarinv.max_pre'
    end
    object StringField57: TStringField
      FieldName = 'observa'
      Origin = 'COMYLEG.inarinv.observa'
      FixedChar = True
      Size = 50
    end
  end
  object qbuscod: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarinv'
      
        'where num_emp = :num_emp and lin_ven <> '#39'0'#39' and cod_art = :cod_a' +
        'rt')
    Left = 752
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cod_art'
        ParamType = ptInput
      end>
    object qbuscodnum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inarinv.num_emp'
      FixedChar = True
      Size = 2
    end
    object qbuscodcod_art: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.inarinv.cod_art'
      FixedChar = True
      Size = 14
    end
    object qbuscodcod_art1: TStringField
      FieldName = 'cod_art1'
      Origin = 'COMYLEG.inarinv.cod_art1'
      FixedChar = True
      Size = 14
    end
    object qbuscoddes_art: TStringField
      FieldName = 'des_art'
      Origin = 'COMYLEG.inarinv.des_art'
      FixedChar = True
      Size = 40
    end
    object qbuscoduni_art: TStringField
      FieldName = 'uni_art'
      Origin = 'COMYLEG.inarinv.uni_art'
      FixedChar = True
      Size = 4
    end
    object qbuscodemp_art: TStringField
      FieldName = 'emp_art'
      Origin = 'COMYLEG.inarinv.emp_art'
      FixedChar = True
      Size = 4
    end
    object qbuscodcan_emp: TFloatField
      FieldName = 'can_emp'
      Origin = 'COMYLEG.inarinv.can_emp'
    end
    object qbuscodprecio_1: TFloatField
      FieldName = 'precio_1'
      Origin = 'COMYLEG.inarinv.precio_1'
    end
    object qbuscodprecio_2: TFloatField
      FieldName = 'precio_2'
      Origin = 'COMYLEG.inarinv.precio_2'
    end
    object qbuscodprecio_3: TFloatField
      FieldName = 'precio_3'
      Origin = 'COMYLEG.inarinv.precio_3'
    end
    object qbuscodprecio_4: TFloatField
      FieldName = 'precio_4'
      Origin = 'COMYLEG.inarinv.precio_4'
    end
    object qbuscodprecio_5: TFloatField
      FieldName = 'precio_5'
      Origin = 'COMYLEG.inarinv.precio_5'
    end
    object qbuscodsal_val: TFloatField
      FieldName = 'sal_val'
      Origin = 'COMYLEG.inarinv.sal_val'
    end
    object qbuscodsal_ant: TFloatField
      FieldName = 'sal_ant'
      Origin = 'COMYLEG.inarinv.sal_ant'
    end
    object qbuscodult_cos_kgs: TFloatField
      FieldName = 'ult_cos_kgs'
      Origin = 'COMYLEG.inarinv.ult_cos_kgs'
    end
    object qbuscodcos_pro_kgs: TFloatField
      FieldName = 'cos_pro_kgs'
      Origin = 'COMYLEG.inarinv.cos_pro_kgs'
    end
    object qbuscodcos_ant_kgs: TFloatField
      FieldName = 'cos_ant_kgs'
      Origin = 'COMYLEG.inarinv.cos_ant_kgs'
    end
    object qbuscodven_mes_kgs: TFloatField
      FieldName = 'ven_mes_kgs'
      Origin = 'COMYLEG.inarinv.ven_mes_kgs'
    end
    object qbuscodcos_mes_kgs: TFloatField
      FieldName = 'cos_mes_kgs'
      Origin = 'COMYLEG.inarinv.cos_mes_kgs'
    end
    object qbuscodven_acu_kgs: TFloatField
      FieldName = 'ven_acu_kgs'
      Origin = 'COMYLEG.inarinv.ven_acu_kgs'
    end
    object qbuscodcos_acu_kgs: TFloatField
      FieldName = 'cos_acu_kgs'
      Origin = 'COMYLEG.inarinv.cos_acu_kgs'
    end
    object qbuscodexi_cor_kgs: TFloatField
      FieldName = 'exi_cor_kgs'
      Origin = 'COMYLEG.inarinv.exi_cor_kgs'
    end
    object qbuscodexi_ant_kgs: TFloatField
      FieldName = 'exi_ant_kgs'
      Origin = 'COMYLEG.inarinv.exi_ant_kgs'
    end
    object qbuscodexi_fis_kgs: TFloatField
      FieldName = 'exi_fis_kgs'
      Origin = 'COMYLEG.inarinv.exi_fis_kgs'
    end
    object qbuscodcan_acu_kgs: TFloatField
      FieldName = 'can_acu_kgs'
      Origin = 'COMYLEG.inarinv.can_acu_kgs'
    end
    object qbuscodcan_mes_kgs: TFloatField
      FieldName = 'can_mes_kgs'
      Origin = 'COMYLEG.inarinv.can_mes_kgs'
    end
    object qbuscodult_cos_caj: TFloatField
      FieldName = 'ult_cos_caj'
      Origin = 'COMYLEG.inarinv.ult_cos_caj'
    end
    object qbuscodcos_pro_caj: TFloatField
      FieldName = 'cos_pro_caj'
      Origin = 'COMYLEG.inarinv.cos_pro_caj'
    end
    object qbuscodcos_ant_caj: TFloatField
      FieldName = 'cos_ant_caj'
      Origin = 'COMYLEG.inarinv.cos_ant_caj'
    end
    object qbuscodven_mes_caj: TFloatField
      FieldName = 'ven_mes_caj'
      Origin = 'COMYLEG.inarinv.ven_mes_caj'
    end
    object qbuscodcos_mes_caj: TFloatField
      FieldName = 'cos_mes_caj'
      Origin = 'COMYLEG.inarinv.cos_mes_caj'
    end
    object qbuscodven_acu_caj: TFloatField
      FieldName = 'ven_acu_caj'
      Origin = 'COMYLEG.inarinv.ven_acu_caj'
    end
    object qbuscodcos_acu_caj: TFloatField
      FieldName = 'cos_acu_caj'
      Origin = 'COMYLEG.inarinv.cos_acu_caj'
    end
    object qbuscodexi_cor_caj: TFloatField
      FieldName = 'exi_cor_caj'
      Origin = 'COMYLEG.inarinv.exi_cor_caj'
    end
    object qbuscodexi_ant_caj: TFloatField
      FieldName = 'exi_ant_caj'
      Origin = 'COMYLEG.inarinv.exi_ant_caj'
    end
    object qbuscodexi_fis_caj: TFloatField
      FieldName = 'exi_fis_caj'
      Origin = 'COMYLEG.inarinv.exi_fis_caj'
    end
    object qbuscodcan_acu_caj: TFloatField
      FieldName = 'can_acu_caj'
      Origin = 'COMYLEG.inarinv.can_acu_caj'
    end
    object qbuscodcan_mes_caj: TFloatField
      FieldName = 'can_mes_caj'
      Origin = 'COMYLEG.inarinv.can_mes_caj'
    end
    object qbuscodback_cli: TFloatField
      FieldName = 'back_cli'
      Origin = 'COMYLEG.inarinv.back_cli'
    end
    object qbuscodback_pro: TFloatField
      FieldName = 'back_pro'
      Origin = 'COMYLEG.inarinv.back_pro'
    end
    object qbuscodmin_emp: TFloatField
      FieldName = 'min_emp'
      Origin = 'COMYLEG.inarinv.min_emp'
    end
    object qbuscodmax_emp: TFloatField
      FieldName = 'max_emp'
      Origin = 'COMYLEG.inarinv.max_emp'
    end
    object qbuscodiva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.inarinv.iva'
    end
    object qbuscodlin_ven: TSmallintField
      FieldName = 'lin_ven'
      Origin = 'COMYLEG.inarinv.lin_ven'
    end
    object qbuscodcod_pro: TStringField
      FieldName = 'cod_pro'
      Origin = 'COMYLEG.inarinv.cod_pro'
      FixedChar = True
      Size = 8
    end
    object qbuscodtip_art: TStringField
      FieldName = 'tip_art'
      Origin = 'COMYLEG.inarinv.tip_art'
      FixedChar = True
      Size = 1
    end
    object qbuscodedo_pro: TStringField
      FieldName = 'edo_pro'
      Origin = 'COMYLEG.inarinv.edo_pro'
      FixedChar = True
      Size = 2
    end
    object qbuscodban_rep: TStringField
      FieldName = 'ban_rep'
      Origin = 'COMYLEG.inarinv.ban_rep'
      FixedChar = True
      Size = 1
    end
    object qbuscodmin_pre: TFloatField
      FieldName = 'min_pre'
      Origin = 'COMYLEG.inarinv.min_pre'
    end
    object qbuscodmax_pre: TFloatField
      FieldName = 'max_pre'
      Origin = 'COMYLEG.inarinv.max_pre'
    end
    object qbuscodobserva: TStringField
      FieldName = 'observa'
      Origin = 'COMYLEG.inarinv.observa'
      FixedChar = True
      Size = 50
    end
  end
  object DataSource85: TDataSource
    DataSet = qbuscod
    Left = 784
    Top = 64
  end
  object DataSource86: TDataSource
    DataSet = QUPENT
    Left = 784
    Top = 96
  end
  object Qactu: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update consSADIV'
      'set num_SAL = :num_ent'
      'where num_emp = :num_emp')
    Left = 832
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'num_ent'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
  end
  object DataSource88: TDataSource
    DataSet = Qactu
    Left = 864
    Top = 184
  end
  object qbusieps: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from ieps'
      'where codigo = :CODIGO')
    Left = 712
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    object qbusiepscodigo: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.ieps.codigo'
      FixedChar = True
      Size = 40
    end
  end
  object DataSource23: TDataSource
    DataSet = qbusieps
    Left = 744
    Top = 232
  end
  object qupinarent: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update inarent'
      'set iva_6 = :tot_ieps, imp_6 = :acu'
      'where num_ent = :num_ent and num_Emp= :num_emp')
    Left = 127
    Top = 521
    ParamData = <
      item
        DataType = ftString
        Name = 'tot_ieps'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'acu'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_ent'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
  end
  object DataSource42: TDataSource
    DataSet = qupinarent
    Left = 159
    Top = 521
  end
  object iepstrpr: TTable
    DatabaseName = 'comyleg'
    TableName = 'iepstrpr'
    Left = 712
    Top = 328
    object iepstrprnum_emp: TStringField
      FieldName = 'num_emp'
      FixedChar = True
      Size = 2
    end
    object iepstrprnum_ent: TStringField
      FieldName = 'num_ent'
      FixedChar = True
      Size = 30
    end
    object iepstrprieps: TFloatField
      FieldName = 'ieps'
    end
    object iepstrprsal_ieps: TFloatField
      FieldName = 'sal_ieps'
    end
  end
  object DataSource49: TDataSource
    DataSet = iepstrpr
    Left = 744
    Top = 321
  end
  object qtotieps: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'UPDATE INARTRpr'
      'SET IMP_ent = :IMPORTE, SAL_ent = :IMPORTE'
      'WHERE NUM_ent = :num_ent and num_emp = :num_emp')
    Left = 776
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'IMPORTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IMPORTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_ent'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
    object IntegerField26: TIntegerField
      FieldName = 'folio'
      Origin = 'COMYLEG.ventas.folio'
    end
    object StringField78: TStringField
      FieldName = 'descripcion'
      Origin = 'COMYLEG.ventas.descripcion'
      FixedChar = True
      Size = 50
    end
    object StringField79: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.ventas.codigo'
      FixedChar = True
      Size = 14
    end
    object FloatField84: TFloatField
      FieldName = 'cajas'
      Origin = 'COMYLEG.ventas.cajas'
    end
    object FloatField85: TFloatField
      FieldName = 'kilos'
      Origin = 'COMYLEG.ventas.kilos'
    end
    object FloatField86: TFloatField
      FieldName = 'precio'
      Origin = 'COMYLEG.ventas.precio'
    end
    object FloatField87: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.ventas.total'
    end
    object StringField80: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.ventas.nombre'
      FixedChar = True
      Size = 50
    end
    object FloatField88: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.ventas.iva'
    end
    object FloatField89: TFloatField
      FieldName = 'cos_pro'
      Origin = 'COMYLEG.ventas.cos_pro'
    end
    object FloatField90: TFloatField
      FieldName = 'totiva'
      Origin = 'COMYLEG.ventas.totiva'
    end
    object SmallintField12: TSmallintField
      FieldName = 'renglon'
      Origin = 'COMYLEG.ventas.renglon'
    end
    object SmallintField13: TSmallintField
      FieldName = 'pagado'
      Origin = 'COMYLEG.ventas.pagado'
    end
    object StringField81: TStringField
      FieldName = 'rfc'
      Origin = 'COMYLEG.ventas.rfc'
      FixedChar = True
    end
    object StringField82: TStringField
      FieldName = 'tipo'
      Origin = 'COMYLEG.ventas.tipo'
      FixedChar = True
      Size = 2
    end
    object StringField83: TStringField
      FieldName = 'lineaven'
      Origin = 'COMYLEG.ventas.lineaven'
      FixedChar = True
    end
    object FloatField91: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.ventas.descto'
    end
    object StringField84: TStringField
      FieldName = 'pedido'
      Origin = 'COMYLEG.ventas.pedido'
      FixedChar = True
    end
    object StringField85: TStringField
      FieldName = 'observacion'
      Origin = 'COMYLEG.ventas.observacion'
      FixedChar = True
    end
    object StringField86: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.ventas.sucursal'
      FixedChar = True
    end
    object StringField87: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.ventas.num_emp'
      FixedChar = True
      Size = 2
    end
  end
  object DataSource106: TDataSource
    DataSet = qtotieps
    Left = 808
    Top = 344
  end
  object vtasieps: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      
        'insert into ieps_vtapro (num_emp, folio, codigo, totieps, renglo' +
        'n)'
      'values (:num_emp, :folio, :codigo, :totieps, :renglon)')
    Left = 712
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'num_emp'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'totieps'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'renglon'
        ParamType = ptInput
      end>
    object StringField64: TStringField
      FieldName = 'serie'
      Origin = 'COMYLEG.folios.serie'
      FixedChar = True
      Size = 15
    end
    object IntegerField17: TIntegerField
      FieldName = 'folio_final'
      Origin = 'COMYLEG.folios.folio_final'
    end
    object IntegerField18: TIntegerField
      FieldName = 'ano_aproba'
      Origin = 'COMYLEG.folios.ano_aproba'
    end
    object IntegerField19: TIntegerField
      FieldName = 'num_aproba'
      Origin = 'COMYLEG.folios.num_aproba'
    end
    object StringField65: TStringField
      FieldName = 'cajera'
      Origin = 'COMYLEG.folios.cajera'
      FixedChar = True
      Size = 25
    end
    object IntegerField20: TIntegerField
      FieldName = 'folio_inicio'
      Origin = 'COMYLEG.folios.folio_inicio'
    end
  end
  object DataSource95: TDataSource
    DataSet = vtasieps
    Left = 744
    Top = 360
  end
  object upfacieps: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update inarfac'
      'set iva_6 = :ieps , imp_6 = :totieps'
      'where num_doc = :num_doc and num_emp = :num_emp')
    Left = 776
    Top = 304
    ParamData = <
      item
        DataType = ftString
        Name = 'ieps'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'totieps'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'num_doc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
    object IntegerField25: TIntegerField
      FieldName = 'folio'
      Origin = 'COMYLEG.ventas.folio'
    end
    object StringField68: TStringField
      FieldName = 'descripcion'
      Origin = 'COMYLEG.ventas.descripcion'
      FixedChar = True
      Size = 50
    end
    object StringField69: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.ventas.codigo'
      FixedChar = True
      Size = 14
    end
    object FloatField76: TFloatField
      FieldName = 'cajas'
      Origin = 'COMYLEG.ventas.cajas'
    end
    object FloatField77: TFloatField
      FieldName = 'kilos'
      Origin = 'COMYLEG.ventas.kilos'
    end
    object FloatField78: TFloatField
      FieldName = 'precio'
      Origin = 'COMYLEG.ventas.precio'
    end
    object FloatField79: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.ventas.total'
    end
    object StringField70: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.ventas.nombre'
      FixedChar = True
      Size = 50
    end
    object FloatField80: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.ventas.iva'
    end
    object FloatField81: TFloatField
      FieldName = 'cos_pro'
      Origin = 'COMYLEG.ventas.cos_pro'
    end
    object FloatField82: TFloatField
      FieldName = 'totiva'
      Origin = 'COMYLEG.ventas.totiva'
    end
    object SmallintField10: TSmallintField
      FieldName = 'renglon'
      Origin = 'COMYLEG.ventas.renglon'
    end
    object SmallintField11: TSmallintField
      FieldName = 'pagado'
      Origin = 'COMYLEG.ventas.pagado'
    end
    object StringField71: TStringField
      FieldName = 'rfc'
      Origin = 'COMYLEG.ventas.rfc'
      FixedChar = True
    end
    object StringField72: TStringField
      FieldName = 'tipo'
      Origin = 'COMYLEG.ventas.tipo'
      FixedChar = True
      Size = 2
    end
    object StringField73: TStringField
      FieldName = 'lineaven'
      Origin = 'COMYLEG.ventas.lineaven'
      FixedChar = True
    end
    object FloatField83: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.ventas.descto'
    end
    object StringField74: TStringField
      FieldName = 'pedido'
      Origin = 'COMYLEG.ventas.pedido'
      FixedChar = True
    end
    object StringField75: TStringField
      FieldName = 'observacion'
      Origin = 'COMYLEG.ventas.observacion'
      FixedChar = True
    end
    object StringField76: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.ventas.sucursal'
      FixedChar = True
    end
    object StringField77: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.ventas.num_emp'
      FixedChar = True
      Size = 2
    end
  end
  object DataSource102: TDataSource
    DataSet = upfacieps
    Left = 808
    Top = 304
  end
  object qBuscaCanEmp: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'SELECT can_emp FROM inarinv WHERE num_emp = :emp AND cod_art = :cod')
    Left = 840
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'emp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cod'
        ParamType = ptInput
      end>
  end
  object qInsOCDetalle: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'INSERT INTO oc_pedido_detalle'
      '(num_emp, num_suc, num_ped, renglon, cod_art, cod_pro,'
      ' cantidad_ped_cajas, cantidad_ped_kilos, cos_uni, iva, fech_ped, estado)'
      'VALUES'
      '(:num_emp, :num_suc, :num_ped, :renglon, :cod_art, :cod_pro,'
      ' :cant_caj, :cant_kil, :cos_uni, :iva, :fech_ped, '#39'P'#39')')
    Left = 872
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_suc'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'num_ped'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'renglon'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cod_art'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cod_pro'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'cant_caj'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'cant_kil'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'cos_uni'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'iva'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'fech_ped'
        ParamType = ptInput
      end>
  end
end
