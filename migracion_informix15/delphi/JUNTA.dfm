object Form9: TForm9
  Left = 176
  Top = 42
  Width = 1044
  Height = 785
  Caption = 'COBRANZA'
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
  object Label47: TLabel
    Left = 464
    Top = 720
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
  object Label42: TLabel
    Left = 879
    Top = 78
    Width = 23
    Height = 17
    Caption = 'IVA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 520
    Top = 720
    Width = 153
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    KeyField = 'Cod_art'
    ListField = 'Cod_art'
    ListSource = DataSource22
    ParentFont = False
    TabOrder = 7
    OnClick = CODIGOARTClick
    OnKeyPress = CODIGOARTKeyPress
  end
  object Panel6: TPanel
    Left = 728
    Top = 296
    Width = 305
    Height = 449
    Caption = 'Panel6'
    TabOrder = 5
    object Label38: TLabel
      Left = 24
      Top = 64
      Width = 49
      Height = 19
      Caption = 'Nombre'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label39: TLabel
      Left = 24
      Top = 32
      Width = 85
      Height = 19
      Caption = 'Num Empresa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label40: TLabel
      Left = 24
      Top = 96
      Width = 47
      Height = 19
      Caption = 'Correo '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 64
      Top = 64
      Width = 241
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'raz_soc'
      ListField = 'raz_soc'
      ListSource = DataSource56
      ParentFont = False
      TabOrder = 0
    end
    object btnSendMail: TBitBtn
      Left = 128
      Top = 139
      Width = 113
      Height = 37
      Caption = 'Mandar Correo'
      TabOrder = 1
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        000037777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
        FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF7777BBF
        FFF07F333777777F3FF70FFFFFFFB9BF1CC07F3FFF337F7377770F777FFFB99B
        C1C07F7773337F377F370FFFFFFFB9BBC1C07FFFFFFF7F337FF700000077B999
        B000777777777F33777733337377B9999B33333F733373F337FF3377377B99BB
        9BB33377F337F377377F3737377B9B79B9B737F73337F7F7F37F33733777BB7B
        BBB73373333377F37F3737333777BB777B9B3733333377F337F7333333777B77
        77BB3333333337333377333333333777337B3333333333333337}
      NumGlyphs = 2
    end
    object StatusMemo: TMemo
      Left = 1
      Top = 308
      Width = 303
      Height = 140
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      Lines.Strings = (
        'Status...'
        '')
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 120
      Top = 32
      Width = 145
      Height = 21
      KeyField = 'num_emp'
      ListField = 'num_emp'
      ListSource = DataSource59
      TabOrder = 3
    end
    object co_cli: TEdit
      Left = 64
      Top = 96
      Width = 241
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 832
    Top = 8
    Width = 201
    Height = 497
    TabOrder = 0
    object Label8: TLabel
      Left = 16
      Top = 280
      Width = 39
      Height = 15
      Caption = 'Dolares'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 16
      Top = 248
      Width = 37
      Height = 15
      Caption = 'Cheque'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 8
      Top = 312
      Width = 51
      Height = 15
      Caption = 'T. Cr'#233'dito'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 16
      Top = 184
      Width = 45
      Height = 15
      Caption = 'Efectivo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 16
      Top = 216
      Width = 38
      Height = 15
      Caption = 'Transf.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 16
      Top = 400
      Width = 31
      Height = 15
      Caption = 'Banco'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label19: TLabel
      Left = 16
      Top = 432
      Width = 37
      Height = 15
      Caption = 'Digitos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label20: TLabel
      Left = 0
      Top = 472
      Width = 57
      Height = 15
      Caption = 'Fecha Pago'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label41: TLabel
      Left = 8
      Top = 344
      Width = 47
      Height = 15
      Caption = 'T. D'#233'bito'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object efectivo: TMemo
      Left = 64
      Top = 176
      Width = 121
      Height = 25
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Lines.Strings = (
        'efectivo')
      ParentFont = False
      TabOrder = 0
      OnExit = efectivoExit
      OnKeyPress = efectivoKeyPress
    end
    object transf: TMemo
      Left = 64
      Top = 210
      Width = 121
      Height = 25
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Lines.Strings = (
        'transf')
      ParentFont = False
      TabOrder = 1
      OnExit = transfExit
      OnKeyPress = transfKeyPress
    end
    object cheque: TMemo
      Left = 64
      Top = 244
      Width = 121
      Height = 25
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Lines.Strings = (
        'cheque')
      ParentFont = False
      TabOrder = 2
      OnExit = chequeExit
      OnKeyPress = chequeKeyPress
    end
    object dolar: TMemo
      Left = 64
      Top = 278
      Width = 121
      Height = 25
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Lines.Strings = (
        'dolar')
      ParentFont = False
      TabOrder = 3
      OnKeyPress = dolarKeyPress
    end
    object cheqpref: TMemo
      Left = 64
      Top = 312
      Width = 121
      Height = 25
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      TabOrder = 4
      OnExit = cheqprefExit
      OnKeyPress = cheqprefKeyPress
    end
    object nocheque: TMemo
      Left = 64
      Top = 424
      Width = 121
      Height = 25
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Lines.Strings = (
        'cheqpref')
      ParentFont = False
      TabOrder = 5
      Visible = False
      OnExit = nochequeExit
      OnKeyPress = nochequeKeyPress
    end
    object dbbanco: TDBLookupComboBox
      Left = 64
      Top = 392
      Width = 121
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      KeyField = 'banco'
      ListField = 'banco'
      ListSource = DataSource8
      ParentFont = False
      TabOrder = 6
      Visible = False
    end
    object banfecha: TDateTimePicker
      Left = 64
      Top = 464
      Width = 121
      Height = 26
      Date = 39200.536722256950000000
      Time = 39200.536722256950000000
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      Visible = False
    end
    object tdebito: TMemo
      Left = 64
      Top = 344
      Width = 121
      Height = 25
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      TabOrder = 8
      OnExit = tdebitoExit
      OnKeyPress = cheqprefKeyPress
    end
  end
  object Panel3: TPanel
    Left = 832
    Top = 506
    Width = 201
    Height = 239
    Caption = 'u '
    TabOrder = 1
    object Label13: TLabel
      Left = 24
      Top = 52
      Width = 41
      Height = 15
      Caption = 'Su Pago'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 0
      Top = 20
      Width = 67
      Height = 15
      Caption = 'Total a Pagar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 16
      Top = 80
      Width = 49
      Height = 15
      Caption = 'Por Pagar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object BitBtn3: TBitBtn
      Left = 72
      Top = 112
      Width = 75
      Height = 33
      Caption = '&Pagar'
      TabOrder = 0
      OnClick = BitBtn3Click
    end
    object Memo1: TMemo
      Left = 72
      Top = 8
      Width = 121
      Height = 25
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Lines.Strings = (
        'Memo1')
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object Memo2: TMemo
      Left = 72
      Top = 40
      Width = 121
      Height = 25
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Lines.Strings = (
        'Memo2')
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object Memo3: TMemo
      Left = 72
      Top = 80
      Width = 121
      Height = 25
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Lines.Strings = (
        'Memo3')
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object Panel4: TPanel
    Left = 344
    Top = 0
    Width = 489
    Height = 745
    Caption = 'Panel4'
    TabOrder = 2
    object Label16: TLabel
      Left = 248
      Top = 656
      Width = 96
      Height = 19
      Caption = 'Total Articulos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label36: TLabel
      Left = 8
      Top = 656
      Width = 82
      Height = 19
      Caption = 'Total Debe: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object s: TDBGrid
      Left = 8
      Top = 0
      Width = 481
      Height = 649
      DataSource = DataSource4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnDblClick = sDblClick
      OnKeyPress = sKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Caption = 'CODIGO'
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descripcion'
          Title.Caption = 'DECRIPCION'
          Width = 145
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cajas'
          Title.Alignment = taCenter
          Title.Caption = 'CAJAS'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kilos'
          Title.Alignment = taCenter
          Title.Caption = 'KILOS'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'precio'
          Title.Alignment = taCenter
          Title.Caption = 'PRECIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total'
          Title.Alignment = taCenter
          Title.Caption = 'TOTAL'
          Visible = True
        end>
    end
    object totart: TMemo
      Left = 352
      Top = 656
      Width = 121
      Height = 25
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '')
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object tot_debe: TEdit
      Left = 96
      Top = 656
      Width = 121
      Height = 21
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 353
    Height = 745
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 232
      Width = 30
      Height = 19
      Caption = 'Folio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 168
      Top = 232
      Width = 37
      Height = 19
      Caption = 'Fecha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 328
      Width = 49
      Height = 19
      Caption = 'Nombre'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 0
      Top = 360
      Width = 58
      Height = 19
      Caption = 'Direccion'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 32
      Top = 392
      Width = 24
      Height = 19
      Caption = 'RFC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 8
      Top = 264
      Width = 48
      Height = 19
      Caption = 'Factura'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 168
      Top = 264
      Width = 53
      Height = 19
      Caption = 'Sucursal'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 8
      Top = 720
      Width = 55
      Height = 13
      Caption = 'Ver 4.10.30'
    end
    object Label23: TLabel
      Left = 16
      Top = 488
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
    object Label24: TLabel
      Left = 16
      Top = 520
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
    object Label25: TLabel
      Left = 24
      Top = 8
      Width = 91
      Height = 19
      Caption = 'Num. Empresa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 56
      Top = 560
      Width = 62
      Height = 19
      Caption = 'Cantidad'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label27: TLabel
      Left = 16
      Top = 680
      Width = 75
      Height = 19
      Caption = 'Observacion'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label28: TLabel
      Left = 56
      Top = 640
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
    object Label29: TLabel
      Left = 56
      Top = 600
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
    object Label6: TLabel
      Left = 24
      Top = 424
      Width = 31
      Height = 19
      Caption = 'Alias'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label17: TLabel
      Left = 8
      Top = 296
      Width = 49
      Height = 19
      Caption = 'Nombre'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label33: TLabel
      Left = 8
      Top = 296
      Width = 41
      Height = 19
      Caption = 'Codigo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label30: TLabel
      Left = 200
      Top = 8
      Width = 114
      Height = 19
      Caption = 'Num. Orden Alm.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label37: TLabel
      Left = 208
      Top = 424
      Width = 51
      Height = 19
      Caption = 'OC futu'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label44: TLabel
      Left = 0
      Top = 456
      Width = 61
      Height = 19
      Caption = 'Uso CFDI'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label45: TLabel
      Left = 8
      Top = 32
      Width = 36
      Height = 19
      Caption = 'Folio:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label46: TLabel
      Left = 8
      Top = 72
      Width = 70
      Height = 19
      Caption = 'No Ticket:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Tfolio: TEdit
      Left = 48
      Top = 232
      Width = 97
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      Text = 'tfolio'
    end
    object Tdire: TEdit
      Left = 64
      Top = 360
      Width = 273
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      Text = 'tdire'
    end
    object trfc: TEdit
      Left = 64
      Top = 392
      Width = 249
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      Text = 'trfc'
    end
    object tipo_fac: TRadioGroup
      Left = 32
      Top = 112
      Width = 145
      Height = 57
      Items.Strings = (
        'FACTURA                    '
        'TICKET')
      TabOrder = 1
      OnClick = tipo_facClick
    end
    object Tipo_pago: TRadioGroup
      Left = 32
      Top = 168
      Width = 145
      Height = 57
      Caption = 'Tipo pago'
      Items.Strings = (
        'CREDITO'
        'CONTADO')
      TabOrder = 2
      OnClick = Tipo_pagoClick
    end
    object nombre: TDBLookupComboBox
      Left = 64
      Top = 296
      Width = 241
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'raz_soc'
      ListField = 'raz_soc'
      ListSource = DataSource3
      ParentFont = False
      TabOrder = 4
      Visible = False
      OnKeyPress = QCODIGOI
    end
    object csucursal: TDBLookupComboBox
      Left = 224
      Top = 264
      Width = 113
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'sucursal'
      ListField = 'sucursal'
      ListSource = DataSource19
      ParentFont = False
      TabOrder = 9
      OnKeyPress = csucursalKeyPress
    end
    object FECHAVIENTOS: TDateTimePicker
      Left = 216
      Top = 232
      Width = 121
      Height = 21
      Date = 39461.710196886580000000
      Time = 39461.710196886580000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    object CODIGOART: TDBLookupComboBox
      Left = 64
      Top = 488
      Width = 153
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'Cod_art'
      ListField = 'Cod_art'
      ListSource = DataSource22
      ParentFont = False
      TabOrder = 11
      OnClick = CODIGOARTClick
      OnKeyPress = CODIGOARTKeyPress
    end
    object DESCRIPART: TEdit
      Left = 104
      Top = 520
      Width = 233
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
    end
    object tipoconsulta: TRadioGroup
      Left = 184
      Top = 168
      Width = 145
      Height = 57
      Items.Strings = (
        'CODIGO'
        'NOMBRE')
      TabOrder = 3
      OnClick = tipoconsultaClick
    end
    object NUM_EMPRESA: TDBLookupComboBox
      Left = 128
      Top = 8
      Width = 57
      Height = 21
      KeyField = 'num_emp'
      ListField = 'num_emp'
      ListSource = DataSource2
      TabOrder = 0
      OnClick = NUM_EMPRESAClick
      OnExit = NUM_EMPRESAExit
    end
    object CODIGOCLI: TDBLookupComboBox
      Left = 64
      Top = 296
      Width = 145
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'cod_cli'
      ListField = 'cod_cli'
      ListSource = DataSource3
      ParentFont = False
      TabOrder = 5
      OnKeyPress = CODIGOCLIKeyPress
    end
    object BitBtn5: TBitBtn
      Left = 264
      Top = 456
      Width = 75
      Height = 25
      Caption = '&Consulta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
      OnClick = BitBtn5Click
    end
    object nombre_cli: TEdit
      Left = 64
      Top = 328
      Width = 273
      Height = 21
      TabOrder = 14
    end
    object PRE_PRO: TEdit
      Left = 104
      Top = 640
      Width = 121
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 17
      OnExit = PRE_PROExit
      OnKeyPress = PRE_PROKeyPress
    end
    object CAJ_PRO: TEdit
      Left = 104
      Top = 560
      Width = 121
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 15
      OnExit = CAJ_PROExit
      OnKeyPress = CAJ_PROKeyPress
    end
    object KIL_PRO: TEdit
      Left = 104
      Top = 600
      Width = 121
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 16
      OnExit = KIL_PROExit
      OnKeyPress = KIL_PROKeyPress
    end
    object OBSERVA: TEdit
      Left = 104
      Top = 680
      Width = 233
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 18
    end
    object alias: TEdit
      Left = 64
      Top = 424
      Width = 145
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 19
      Visible = False
      OnKeyPress = aliasKeyPress
    end
    object name: TEdit
      Left = 64
      Top = 328
      Width = 201
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 20
      Visible = False
    end
    object code: TEdit
      Left = 64
      Top = 328
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 21
      Visible = False
    end
    object BitBtn2: TBitBtn
      Left = 248
      Top = 640
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 22
      Kind = bkClose
    end
    object Button1: TButton
      Left = 248
      Top = 608
      Width = 75
      Height = 25
      Caption = 'Cancelar Folio'
      TabOrder = 23
      OnClick = Button1Click
    end
    object Edit2: TEdit
      Left = 200
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 24
      OnKeyPress = Edit2KeyPress
    end
    object FACTU: TEdit
      Left = 64
      Top = 264
      Width = 97
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 25
      OnExit = factuExit
      OnKeyPress = factuKeyPress
    end
    object BitBtn7: TBitBtn
      Left = 248
      Top = 560
      Width = 75
      Height = 25
      Caption = '&Modificar'
      TabOrder = 26
      OnClick = Btsendmail
    end
    object orden_compra: TEdit
      Left = 264
      Top = 424
      Width = 73
      Height = 21
      TabOrder = 27
      Visible = False
      OnKeyPress = orden_compraKeyPress
    end
    object pon_usocfdi: TDBLookupComboBox
      Left = 64
      Top = 456
      Width = 145
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'descrip'
      ListField = 'descrip'
      ListSource = DataSource109
      ParentFont = False
      TabOrder = 28
      OnClick = pon_usocfdiClick
    end
    object IMP_REST: TRadioGroup
      Left = 184
      Top = 112
      Width = 145
      Height = 57
      Caption = 'IMPRIME RESTAURANTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Items.Strings = (
        'SI       '
        'NO')
      ParentFont = False
      TabOrder = 29
    end
    object busfolio: TEdit
      Left = 48
      Top = 32
      Width = 89
      Height = 21
      TabOrder = 30
      Visible = False
    end
    object BitBtn1: TBitBtn
      Left = 144
      Top = 32
      Width = 49
      Height = 25
      Caption = '&Buscar'
      TabOrder = 31
      Visible = False
      OnClick = BitBtn1Click
    end
    object Edit3: TEdit
      Left = 88
      Top = 72
      Width = 113
      Height = 21
      TabOrder = 32
      OnKeyPress = Edit3KeyPress
    end
    object BitBtn4: TBitBtn
      Left = 240
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Autorizar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 33
      Visible = False
      OnClick = BitBtn4Click
    end
  end
  object Panel5: TPanel
    Left = 832
    Top = 0
    Width = 201
    Height = 177
    TabOrder = 4
    object Label35: TLabel
      Left = 16
      Top = 22
      Width = 55
      Height = 17
      Caption = 'Sub-Total'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label31: TLabel
      Left = 47
      Top = 54
      Width = 23
      Height = 17
      Caption = 'IVA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label34: TLabel
      Left = 18
      Top = 118
      Width = 57
      Height = 17
      Caption = 'Descuento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label32: TLabel
      Left = 28
      Top = 150
      Width = 41
      Height = 17
      Caption = 'TOTAL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label43: TLabel
      Left = 32
      Top = 88
      Width = 29
      Height = 17
      Caption = 'IEPS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object edit9: TMemo
      Left = 80
      Top = 16
      Width = 97
      Height = 25
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Lines.Strings = (
        'edit9')
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edit10: TMemo
      Left = 80
      Top = 48
      Width = 97
      Height = 25
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Lines.Strings = (
        'edit10')
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object Memo4: TMemo
      Left = 80
      Top = 112
      Width = 97
      Height = 25
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edit1: TMemo
      Left = 80
      Top = 144
      Width = 97
      Height = 25
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      Lines.Strings = (
        'edit1')
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object IEPS: TMemo
    Left = 912
    Top = 80
    Width = 97
    Height = 25
    Alignment = taRightJustify
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object DataSource43: TDataSource
    DataSet = QSACA
    Left = 1400
    Top = 429
  end
  object QSACA: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'SELECT FOLIO'
      'FROM INARAG'
      'WHERE NOM_AG = :NOMBRE')
    Left = 1368
    Top = 429
    ParamData = <
      item
        DataType = ftString
        Name = 'NOMBRE'
        ParamType = ptInput
      end>
  end
  object DataSource42: TDataSource
    DataSet = sacadup2
    Left = 288
    Top = 144
  end
  object sacadup2: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'SELECT *'
      'FROM INARFAC'
      'WHERE NUM_DOC = :factura and num_emp = :num_emp')
    Left = 264
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'factura'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
  end
  object sacadup: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inartrinv'
      
        'where num_emp = :num_emp and num_doc = :factura and tip_doc ='#39'FA' +
        #39' ')
    Left = 296
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'factura'
        ParamType = ptInput
      end>
  end
  object DataSource27: TDataSource
    DataSet = sacadup
    Left = 328
    Top = 8
  end
  object QTIPO: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarcl'
      
        'where NUM_EMP = :num_emp AND raz_soc not like '#39'%*%'#39' and (RAZ_SOC' +
        ' <> '#39#39')AND (COD_CLI <> '#39'A15L'#39') AND (COD_CLI <> '#39'V1L'#39') AND (COD_C' +
        'LI <> '#39'Q1F'#39')'
      
        'and (cod_cli <> '#39'P56L'#39') AND (COD_CLI <> '#39'H1F'#39') AND (COD_CLI <> '#39 +
        'O11L'#39') AND (COD_CLI <> '#39'A36L'#39') AND (COD_CLI <> '#39'R13L'#39')'
      
        'AND (COD_CLI <> '#39'Z2L'#39') AND (COD_CLI <> '#39'L20F'#39') AND (COD_CLI <> '#39 +
        'N1L'#39') AND (COD_CLI <> '#39'V2F'#39') AND (COD_CLI <> '#39'M2L'#39')'
      
        'AND (COD_CLI <> '#39'S3F'#39') AND (COD_CLI <> '#39'B1F'#39') AND (COD_CLI <> '#39'G' +
        '124L'#39') AND (COD_CLI <> '#39'B22L'#39') AND (COD_CLI <> '#39'C8F'#39')'
      
        'AND (COD_CLI <> '#39'C58L'#39') AND (COD_CLI <> '#39'A6F'#39') AND (COD_CLI <> '#39 +
        'D29L'#39') AND (COD_CLI <> '#39'M5F'#39') AND (COD_CLI <> '#39'S16L'#39')'
      
        'AND (COD_CLI <> '#39'C36F'#39')  AND (COD_CLI <> '#39'7777'#39') AND (COD_CLI <>' +
        ' '#39'3'#39') AND (COD_CLI <> '#39'4'#39')'
      
        'AND (COD_CLI <> '#39'V277L'#39')  AND (COD_CLI <> '#39'V8F'#39') AND (COD_CLI <>' +
        ' '#39'B199L'#39') AND (COD_CLI <> '#39'PRUEBA'#39') AND (COD_CLI <> '#39'R2L'#39')'
      'AND (COD_CLI <> '#39'*M260L'#39') AND (COD_CLI<> '#39'*M288F'#39')'
      
        'OR (cod_cli= '#39'O14L'#39' OR COD_CLI = '#39'C21L'#39' OR cod_cli='#39'W21F'#39' OR COD' +
        '_CLI= '#39'S235L'#39') AND NUM_EMP = :NUM_EMP'
      '  '
      'ORDER BY RAZ_SOC')
    Left = 1360
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUM_EMP'
        ParamType = ptInput
      end>
    object QTIPOnum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inarcl.num_emp'
      FixedChar = True
      Size = 2
    end
    object QTIPOcod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.inarcl.cod_cli'
      FixedChar = True
      Size = 8
    end
    object QTIPOraz_soc: TStringField
      FieldName = 'raz_soc'
      Origin = 'COMYLEG.inarcl.raz_soc'
      FixedChar = True
      Size = 50
    end
    object QTIPOdom_cli: TStringField
      FieldName = 'dom_cli'
      Origin = 'COMYLEG.inarcl.dom_cli'
      FixedChar = True
      Size = 60
    end
    object QTIPOciu_cli: TStringField
      FieldName = 'ciu_cli'
      Origin = 'COMYLEG.inarcl.ciu_cli'
      FixedChar = True
    end
    object QTIPOest_cli: TStringField
      FieldName = 'est_cli'
      Origin = 'COMYLEG.inarcl.est_cli'
      FixedChar = True
      Size = 10
    end
    object QTIPOtel_cli: TStringField
      FieldName = 'tel_cli'
      Origin = 'COMYLEG.inarcl.tel_cli'
      FixedChar = True
      Size = 12
    end
    object QTIPOrfc_cli: TStringField
      FieldName = 'rfc_cli'
      Origin = 'COMYLEG.inarcl.rfc_cli'
      FixedChar = True
    end
    object QTIPOcod_pos: TIntegerField
      FieldName = 'cod_pos'
      Origin = 'COMYLEG.inarcl.cod_pos'
    end
    object QTIPOage_cli: TSmallintField
      FieldName = 'age_cli'
      Origin = 'COMYLEG.inarcl.age_cli'
    end
    object QTIPOcon_cli: TStringField
      FieldName = 'con_cli'
      Origin = 'COMYLEG.inarcl.con_cli'
      FixedChar = True
      Size = 1
    end
    object QTIPOpla_cli: TSmallintField
      FieldName = 'pla_cli'
      Origin = 'COMYLEG.inarcl.pla_cli'
    end
    object QTIPOsta_cli: TStringField
      FieldName = 'sta_cli'
      Origin = 'COMYLEG.inarcl.sta_cli'
      FixedChar = True
      Size = 1
    end
    object QTIPOlim_cre: TFloatField
      FieldName = 'lim_cre'
      Origin = 'COMYLEG.inarcl.lim_cre'
    end
    object QTIPOsal_act: TFloatField
      FieldName = 'sal_act'
      Origin = 'COMYLEG.inarcl.sal_act'
    end
    object QTIPOsal_ant: TFloatField
      FieldName = 'sal_ant'
      Origin = 'COMYLEG.inarcl.sal_ant'
    end
    object QTIPOcom_mes: TFloatField
      FieldName = 'com_mes'
      Origin = 'COMYLEG.inarcl.com_mes'
    end
    object QTIPOcos_mes: TFloatField
      FieldName = 'cos_mes'
      Origin = 'COMYLEG.inarcl.cos_mes'
    end
    object QTIPOcom_acu: TFloatField
      FieldName = 'com_acu'
      Origin = 'COMYLEG.inarcl.com_acu'
    end
    object QTIPOcos_acu: TFloatField
      FieldName = 'cos_acu'
      Origin = 'COMYLEG.inarcl.cos_acu'
    end
    object QTIPOfech_com: TDateField
      FieldName = 'fech_com'
      Origin = 'COMYLEG.inarcl.fech_com'
    end
    object QTIPOcan_com: TFloatField
      FieldName = 'can_com'
      Origin = 'COMYLEG.inarcl.can_com'
    end
    object QTIPOfech_pag: TDateField
      FieldName = 'fech_pag'
      Origin = 'COMYLEG.inarcl.fech_pag'
    end
    object QTIPOimp_pag: TFloatField
      FieldName = 'imp_pag'
      Origin = 'COMYLEG.inarcl.imp_pag'
    end
    object QTIPOcurp: TStringField
      FieldName = 'curp'
      Origin = 'COMYLEG.inarcl.curp'
      FixedChar = True
      Size = 18
    end
    object QTIPOapodo: TStringField
      FieldName = 'apodo'
      Origin = 'COMYLEG.inarcl.apodo'
      FixedChar = True
      Size = 40
    end
    object QTIPOobserva: TStringField
      FieldName = 'observa'
      Origin = 'COMYLEG.inarcl.observa'
      FixedChar = True
      Size = 50
    end
  end
  object DataSource3: TDataSource
    DataSet = QTIPO
    Left = 1392
    Top = 8
  end
  object qnumemp: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select num_emp'
      'from  consent')
    Left = 288
    Top = 88
    object qnumempnum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.consent.num_emp'
      FixedChar = True
      Size = 2
    end
  end
  object DataSource2: TDataSource
    DataSet = qnumemp
    Left = 320
    Top = 80
  end
  object DataSource23: TDataSource
    DataSet = conse
    Left = 1752
    Top = 320
  end
  object conse: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from consecutivo'
      'where num_emp= :num_emp and cajera= :cajera')
    Left = 1720
    Top = 320
    ParamData = <
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cajera'
        ParamType = ptInput
      end>
  end
  object DataSource19: TDataSource
    DataSet = qsucur
    Left = 1400
    Top = 72
  end
  object qcodigoart: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarinv'
      'where num_emp = :NUM_EMP and lin_ven <> '#39'0'#39'  and ban_rep ='#39'0'#39
      'order by cod_art')
    Left = 1368
    Top = 229
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NUM_EMP'
        ParamType = ptUnknown
      end>
  end
  object DataSource22: TDataSource
    DataSet = qcodigoart
    Left = 1400
    Top = 229
  end
  object TVENTAS: TTable
    DatabaseName = 'comyleg'
    TableName = 'ventas'
    Left = 1368
    Top = 296
    object TVENTASfolio: TIntegerField
      FieldName = 'folio'
    end
    object TVENTASdescripcion: TStringField
      FieldName = 'descripcion'
      FixedChar = True
      Size = 50
    end
    object TVENTAScodigo: TStringField
      FieldName = 'codigo'
      FixedChar = True
      Size = 14
    end
    object TVENTAScajas: TFloatField
      FieldName = 'cajas'
    end
    object TVENTASkilos: TFloatField
      FieldName = 'kilos'
    end
    object TVENTASprecio: TFloatField
      FieldName = 'precio'
    end
    object TVENTAStotal: TFloatField
      FieldName = 'total'
    end
    object TVENTASnombre: TStringField
      FieldName = 'nombre'
      FixedChar = True
      Size = 50
    end
    object TVENTASiva: TFloatField
      FieldName = 'iva'
    end
    object TVENTAScos_pro: TFloatField
      FieldName = 'cos_pro'
    end
    object TVENTAStotiva: TFloatField
      FieldName = 'totiva'
    end
    object TVENTASrenglon: TSmallintField
      FieldName = 'renglon'
    end
    object TVENTASpagado: TSmallintField
      FieldName = 'pagado'
    end
    object TVENTASrfc: TStringField
      FieldName = 'rfc'
      FixedChar = True
    end
    object TVENTAStipo: TStringField
      FieldName = 'tipo'
      FixedChar = True
      Size = 2
    end
    object TVENTASlineaven: TStringField
      FieldName = 'lineaven'
      FixedChar = True
    end
    object TVENTASdescto: TFloatField
      FieldName = 'descto'
    end
    object TVENTASpedido: TStringField
      FieldName = 'pedido'
      FixedChar = True
      Size = 2
    end
    object TVENTASobservacion: TStringField
      FieldName = 'observacion'
      FixedChar = True
    end
    object TVENTASsucursal: TStringField
      FieldName = 'sucursal'
      FixedChar = True
    end
    object TVENTASnum_emp: TStringField
      FieldName = 'num_emp'
      FixedChar = True
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = TVENTAS
    Left = 1400
    Top = 296
  end
  object inserta_ventas: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'inserta_ventas'
    Left = 1448
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = '1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '3'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '4'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '5'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '6'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '7'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '8'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '9'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '10'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '11'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '12'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '13'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '14'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '15'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '16'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '17'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '18'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '19'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '20'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '21'
        ParamType = ptInput
      end>
  end
  object DataSource4: TDataSource
    DataSet = qventas
    Left = 1400
    Top = 392
  end
  object qventas: TQuery
    DatabaseName = 'comyleg'
    RequestLive = True
    SQL.Strings = (
      'select a.* '
      'from ventas a '
      'where  a.folio = :folio AND A.NUM_EMP = :NUM_EMP  '
      'ORDER BY A.DESCRIPCION')
    Left = 1368
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUM_EMP'
        ParamType = ptInput
      end>
    object qventasfolio: TIntegerField
      FieldName = 'folio'
      Origin = 'COMYLEG.ventas.folio'
    end
    object qventasdescripcion: TStringField
      FieldName = 'descripcion'
      Origin = 'COMYLEG.ventas.descripcion'
      FixedChar = True
      Size = 50
    end
    object qventascodigo: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.ventas.codigo'
      FixedChar = True
      Size = 14
    end
    object qventascajas: TFloatField
      FieldName = 'cajas'
      Origin = 'COMYLEG.ventas.cajas'
    end
    object qventaskilos: TFloatField
      FieldName = 'kilos'
      Origin = 'COMYLEG.ventas.kilos'
    end
    object qventasprecio: TFloatField
      FieldName = 'precio'
      Origin = 'COMYLEG.ventas.precio'
    end
    object qventastotal: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.ventas.total'
    end
    object qventasnombre: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.ventas.nombre'
      FixedChar = True
      Size = 50
    end
    object qventasiva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.ventas.iva'
    end
    object qventascos_pro: TFloatField
      FieldName = 'cos_pro'
      Origin = 'COMYLEG.ventas.cos_pro'
    end
    object qventastotiva: TFloatField
      FieldName = 'totiva'
      Origin = 'COMYLEG.ventas.totiva'
    end
    object qventasrenglon: TSmallintField
      FieldName = 'renglon'
      Origin = 'COMYLEG.ventas.renglon'
    end
    object qventaspagado: TSmallintField
      FieldName = 'pagado'
      Origin = 'COMYLEG.ventas.pagado'
    end
    object qventasrfc: TStringField
      FieldName = 'rfc'
      Origin = 'COMYLEG.ventas.rfc'
      FixedChar = True
    end
    object qventastipo: TStringField
      FieldName = 'tipo'
      Origin = 'COMYLEG.ventas.tipo'
      FixedChar = True
      Size = 2
    end
    object qventaslineaven: TStringField
      FieldName = 'lineaven'
      Origin = 'COMYLEG.ventas.lineaven'
      FixedChar = True
    end
    object qventasdescto: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.ventas.descto'
    end
    object qventaspedido: TStringField
      FieldName = 'pedido'
      Origin = 'COMYLEG.ventas.pedido'
      FixedChar = True
    end
    object qventasobservacion: TStringField
      FieldName = 'observacion'
      Origin = 'COMYLEG.ventas.observacion'
      FixedChar = True
    end
    object qventassucursal: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.ventas.sucursal'
      FixedChar = True
    end
    object qventasnum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.ventas.num_emp'
      FixedChar = True
      Size = 2
    end
  end
  object DataSource5: TDataSource
    DataSet = QBORRA
    Left = 1552
    Top = 72
  end
  object QBORRA: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'DELETE'
      'FROM VENTAS'
      
        'WHERE FOLIO = :FOLIO AND NUM_EMP = :NUM_EMP AND CODIGO = :CODIGO' +
        ' AND RENGLON = :REN')
    Left = 1520
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'FOLIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUM_EMP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'REN'
        ParamType = ptInput
      end>
  end
  object qcodigo: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarinv'
      
        'where num_emp = :NUM_EMP and lin_ven <> '#39'0'#39' and cod_art = :cod_A' +
        'rt'
      'order by cod_art')
    Left = 1520
    Top = 205
    ParamData = <
      item
        DataType = ftString
        Name = 'NUM_EMP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cod_Art'
        ParamType = ptInput
      end>
    object qcodigonum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inarinv.num_emp'
      FixedChar = True
      Size = 2
    end
    object qcodigocod_art: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.inarinv.cod_art'
      FixedChar = True
      Size = 14
    end
    object qcodigocod_art1: TStringField
      FieldName = 'cod_art1'
      Origin = 'COMYLEG.inarinv.cod_art1'
      FixedChar = True
      Size = 14
    end
    object qcodigodes_art: TStringField
      FieldName = 'des_art'
      Origin = 'COMYLEG.inarinv.des_art'
      FixedChar = True
      Size = 40
    end
    object qcodigouni_art: TStringField
      FieldName = 'uni_art'
      Origin = 'COMYLEG.inarinv.uni_art'
      FixedChar = True
      Size = 4
    end
    object qcodigoemp_art: TStringField
      FieldName = 'emp_art'
      Origin = 'COMYLEG.inarinv.emp_art'
      FixedChar = True
      Size = 4
    end
    object qcodigocan_emp: TFloatField
      FieldName = 'can_emp'
      Origin = 'COMYLEG.inarinv.can_emp'
    end
    object qcodigoprecio_1: TFloatField
      FieldName = 'precio_1'
      Origin = 'COMYLEG.inarinv.precio_1'
    end
    object qcodigoprecio_2: TFloatField
      FieldName = 'precio_2'
      Origin = 'COMYLEG.inarinv.precio_2'
    end
    object qcodigoprecio_3: TFloatField
      FieldName = 'precio_3'
      Origin = 'COMYLEG.inarinv.precio_3'
    end
    object qcodigoprecio_4: TFloatField
      FieldName = 'precio_4'
      Origin = 'COMYLEG.inarinv.precio_4'
    end
    object qcodigoprecio_5: TFloatField
      FieldName = 'precio_5'
      Origin = 'COMYLEG.inarinv.precio_5'
    end
    object qcodigosal_val: TFloatField
      FieldName = 'sal_val'
      Origin = 'COMYLEG.inarinv.sal_val'
    end
    object qcodigosal_ant: TFloatField
      FieldName = 'sal_ant'
      Origin = 'COMYLEG.inarinv.sal_ant'
    end
    object qcodigoult_cos_kgs: TFloatField
      FieldName = 'ult_cos_kgs'
      Origin = 'COMYLEG.inarinv.ult_cos_kgs'
    end
    object qcodigocos_pro_kgs: TFloatField
      FieldName = 'cos_pro_kgs'
      Origin = 'COMYLEG.inarinv.cos_pro_kgs'
    end
    object qcodigocos_ant_kgs: TFloatField
      FieldName = 'cos_ant_kgs'
      Origin = 'COMYLEG.inarinv.cos_ant_kgs'
    end
    object qcodigoven_mes_kgs: TFloatField
      FieldName = 'ven_mes_kgs'
      Origin = 'COMYLEG.inarinv.ven_mes_kgs'
    end
    object qcodigocos_mes_kgs: TFloatField
      FieldName = 'cos_mes_kgs'
      Origin = 'COMYLEG.inarinv.cos_mes_kgs'
    end
    object qcodigoven_acu_kgs: TFloatField
      FieldName = 'ven_acu_kgs'
      Origin = 'COMYLEG.inarinv.ven_acu_kgs'
    end
    object qcodigocos_acu_kgs: TFloatField
      FieldName = 'cos_acu_kgs'
      Origin = 'COMYLEG.inarinv.cos_acu_kgs'
    end
    object qcodigoexi_cor_kgs: TFloatField
      FieldName = 'exi_cor_kgs'
      Origin = 'COMYLEG.inarinv.exi_cor_kgs'
    end
    object qcodigoexi_ant_kgs: TFloatField
      FieldName = 'exi_ant_kgs'
      Origin = 'COMYLEG.inarinv.exi_ant_kgs'
    end
    object qcodigoexi_fis_kgs: TFloatField
      FieldName = 'exi_fis_kgs'
      Origin = 'COMYLEG.inarinv.exi_fis_kgs'
    end
    object qcodigocan_acu_kgs: TFloatField
      FieldName = 'can_acu_kgs'
      Origin = 'COMYLEG.inarinv.can_acu_kgs'
    end
    object qcodigocan_mes_kgs: TFloatField
      FieldName = 'can_mes_kgs'
      Origin = 'COMYLEG.inarinv.can_mes_kgs'
    end
    object qcodigoult_cos_caj: TFloatField
      FieldName = 'ult_cos_caj'
      Origin = 'COMYLEG.inarinv.ult_cos_caj'
    end
    object qcodigocos_pro_caj: TFloatField
      FieldName = 'cos_pro_caj'
      Origin = 'COMYLEG.inarinv.cos_pro_caj'
    end
    object qcodigocos_ant_caj: TFloatField
      FieldName = 'cos_ant_caj'
      Origin = 'COMYLEG.inarinv.cos_ant_caj'
    end
    object qcodigoven_mes_caj: TFloatField
      FieldName = 'ven_mes_caj'
      Origin = 'COMYLEG.inarinv.ven_mes_caj'
    end
    object qcodigocos_mes_caj: TFloatField
      FieldName = 'cos_mes_caj'
      Origin = 'COMYLEG.inarinv.cos_mes_caj'
    end
    object qcodigoven_acu_caj: TFloatField
      FieldName = 'ven_acu_caj'
      Origin = 'COMYLEG.inarinv.ven_acu_caj'
    end
    object qcodigocos_acu_caj: TFloatField
      FieldName = 'cos_acu_caj'
      Origin = 'COMYLEG.inarinv.cos_acu_caj'
    end
    object qcodigoexi_cor_caj: TFloatField
      FieldName = 'exi_cor_caj'
      Origin = 'COMYLEG.inarinv.exi_cor_caj'
    end
    object qcodigoexi_ant_caj: TFloatField
      FieldName = 'exi_ant_caj'
      Origin = 'COMYLEG.inarinv.exi_ant_caj'
    end
    object qcodigoexi_fis_caj: TFloatField
      FieldName = 'exi_fis_caj'
      Origin = 'COMYLEG.inarinv.exi_fis_caj'
    end
    object qcodigocan_acu_caj: TFloatField
      FieldName = 'can_acu_caj'
      Origin = 'COMYLEG.inarinv.can_acu_caj'
    end
    object qcodigocan_mes_caj: TFloatField
      FieldName = 'can_mes_caj'
      Origin = 'COMYLEG.inarinv.can_mes_caj'
    end
    object qcodigoback_cli: TFloatField
      FieldName = 'back_cli'
      Origin = 'COMYLEG.inarinv.back_cli'
    end
    object qcodigoback_pro: TFloatField
      FieldName = 'back_pro'
      Origin = 'COMYLEG.inarinv.back_pro'
    end
    object qcodigomin_emp: TFloatField
      FieldName = 'min_emp'
      Origin = 'COMYLEG.inarinv.min_emp'
    end
    object qcodigomax_emp: TFloatField
      FieldName = 'max_emp'
      Origin = 'COMYLEG.inarinv.max_emp'
    end
    object qcodigoiva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.inarinv.iva'
    end
    object qcodigolin_ven: TSmallintField
      FieldName = 'lin_ven'
      Origin = 'COMYLEG.inarinv.lin_ven'
    end
    object qcodigocod_pro: TStringField
      FieldName = 'cod_pro'
      Origin = 'COMYLEG.inarinv.cod_pro'
      FixedChar = True
      Size = 8
    end
    object qcodigotip_art: TStringField
      FieldName = 'tip_art'
      Origin = 'COMYLEG.inarinv.tip_art'
      FixedChar = True
      Size = 1
    end
    object qcodigoedo_pro: TStringField
      FieldName = 'edo_pro'
      Origin = 'COMYLEG.inarinv.edo_pro'
      FixedChar = True
      Size = 2
    end
    object qcodigoban_rep: TStringField
      FieldName = 'ban_rep'
      Origin = 'COMYLEG.inarinv.ban_rep'
      FixedChar = True
      Size = 1
    end
    object qcodigomin_pre: TFloatField
      FieldName = 'min_pre'
      Origin = 'COMYLEG.inarinv.min_pre'
    end
    object qcodigomax_pre: TFloatField
      FieldName = 'max_pre'
      Origin = 'COMYLEG.inarinv.max_pre'
    end
    object qcodigoobserva: TStringField
      FieldName = 'observa'
      Origin = 'COMYLEG.inarinv.observa'
      FixedChar = True
      Size = 50
    end
  end
  object DataSource6: TDataSource
    DataSet = qcodigo
    Left = 1552
    Top = 205
  end
  object DataSource20: TDataSource
    DataSet = Actufolio
    Left = 320
    Top = 53
  end
  object Actufolio: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update inarag'
      'set folio = :folio'
      'where nom_ag = :nombre ')
    Left = 280
    Top = 53
    ParamData = <
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end>
  end
  object tbanco: TTable
    DatabaseName = 'comyleg'
    TableName = 'bancos'
    Left = 1616
    Top = 8
  end
  object DataSource8: TDataSource
    DataSet = tbanco
    Left = 1584
    Top = 8
  end
  object tconfig: TTable
    DatabaseName = 'comyleg'
    TableName = 'config'
    Left = 912
    Top = 232
  end
  object StoredProc2: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'saldo_cli'
    Left = 1584
    Top = 520
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
      end>
  end
  object sal_cli: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarcl'
      'where cod_cli = :codigo and num_emp = :empresa ')
    Left = 1584
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'empresa'
        ParamType = ptInput
      end>
    object sal_clinum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inarcl.num_emp'
      FixedChar = True
      Size = 2
    end
    object sal_clicod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.inarcl.cod_cli'
      FixedChar = True
      Size = 8
    end
    object sal_cliraz_soc: TStringField
      FieldName = 'raz_soc'
      Origin = 'COMYLEG.inarcl.raz_soc'
      FixedChar = True
      Size = 50
    end
    object sal_clidom_cli: TStringField
      FieldName = 'dom_cli'
      Origin = 'COMYLEG.inarcl.dom_cli'
      FixedChar = True
      Size = 60
    end
    object sal_cliciu_cli: TStringField
      FieldName = 'ciu_cli'
      Origin = 'COMYLEG.inarcl.ciu_cli'
      FixedChar = True
    end
    object sal_cliest_cli: TStringField
      FieldName = 'est_cli'
      Origin = 'COMYLEG.inarcl.est_cli'
      FixedChar = True
      Size = 10
    end
    object sal_clitel_cli: TStringField
      FieldName = 'tel_cli'
      Origin = 'COMYLEG.inarcl.tel_cli'
      FixedChar = True
      Size = 12
    end
    object sal_clirfc_cli: TStringField
      FieldName = 'rfc_cli'
      Origin = 'COMYLEG.inarcl.rfc_cli'
      FixedChar = True
    end
    object sal_clicod_pos: TIntegerField
      FieldName = 'cod_pos'
      Origin = 'COMYLEG.inarcl.cod_pos'
    end
    object sal_cliage_cli: TSmallintField
      FieldName = 'age_cli'
      Origin = 'COMYLEG.inarcl.age_cli'
    end
    object sal_clicon_cli: TStringField
      FieldName = 'con_cli'
      Origin = 'COMYLEG.inarcl.con_cli'
      FixedChar = True
      Size = 1
    end
    object sal_clipla_cli: TSmallintField
      FieldName = 'pla_cli'
      Origin = 'COMYLEG.inarcl.pla_cli'
    end
    object sal_clista_cli: TStringField
      FieldName = 'sta_cli'
      Origin = 'COMYLEG.inarcl.sta_cli'
      FixedChar = True
      Size = 1
    end
    object sal_clilim_cre: TFloatField
      FieldName = 'lim_cre'
      Origin = 'COMYLEG.inarcl.lim_cre'
    end
    object sal_clisal_act: TFloatField
      FieldName = 'sal_act'
      Origin = 'COMYLEG.inarcl.sal_act'
    end
    object sal_clisal_ant: TFloatField
      FieldName = 'sal_ant'
      Origin = 'COMYLEG.inarcl.sal_ant'
    end
    object sal_clicom_mes: TFloatField
      FieldName = 'com_mes'
      Origin = 'COMYLEG.inarcl.com_mes'
    end
    object sal_clicos_mes: TFloatField
      FieldName = 'cos_mes'
      Origin = 'COMYLEG.inarcl.cos_mes'
    end
    object sal_clicom_acu: TFloatField
      FieldName = 'com_acu'
      Origin = 'COMYLEG.inarcl.com_acu'
    end
    object sal_clicos_acu: TFloatField
      FieldName = 'cos_acu'
      Origin = 'COMYLEG.inarcl.cos_acu'
    end
    object sal_clifech_com: TDateField
      FieldName = 'fech_com'
      Origin = 'COMYLEG.inarcl.fech_com'
    end
    object sal_clican_com: TFloatField
      FieldName = 'can_com'
      Origin = 'COMYLEG.inarcl.can_com'
    end
    object sal_clifech_pag: TDateField
      FieldName = 'fech_pag'
      Origin = 'COMYLEG.inarcl.fech_pag'
    end
    object sal_cliimp_pag: TFloatField
      FieldName = 'imp_pag'
      Origin = 'COMYLEG.inarcl.imp_pag'
    end
    object sal_clicurp: TStringField
      FieldName = 'curp'
      Origin = 'COMYLEG.inarcl.curp'
      FixedChar = True
      Size = 18
    end
    object sal_cliapodo: TStringField
      FieldName = 'apodo'
      Origin = 'COMYLEG.inarcl.apodo'
      FixedChar = True
    end
  end
  object DataSource9: TDataSource
    DataSet = sal_cli
    Left = 1616
    Top = 72
  end
  object DataSource40: TDataSource
    DataSet = QBUSBOR
    Left = 920
    Top = 480
  end
  object QBUSBOR: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from ventas'
      'where folio = :FOLIO AND TOTAL ='#39'0'#39
      'order by codigo')
    Left = 888
    Top = 480
    ParamData = <
      item
        DataType = ftString
        Name = 'FOLIO'
        ParamType = ptInput
      end>
  end
  object TDataSource
    Left = 1752
    Top = 352
  end
  object sinsertacot: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'inserta_cot'
    Left = 1584
    Top = 229
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
      end
      item
        DataType = ftUnknown
        Name = '14'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '15'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '16'
        ParamType = ptInput
      end>
  end
  object DataSource11: TDataSource
    DataSet = Sinsertacot1
    Left = 1616
    Top = 261
  end
  object Sinsertacot1: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'inserta_cot1'
    Left = 1584
    Top = 261
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
      end
      item
        DataType = ftUnknown
        Name = '14'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '15'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '16'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '17'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '18'
        ParamType = ptInput
      end>
  end
  object DataSource10: TDataSource
    DataSet = sinsertacot
    Left = 1616
    Top = 229
  end
  object DataSource18: TDataSource
    DataSet = qcanemp
    Left = 1616
    Top = 389
  end
  object qcanemp: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarinv'
      'where cod_art= :cod_Art and num_emp = :num_emp'
      ' ')
    Left = 1584
    Top = 389
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_Art'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
    object qcanempnum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inarinv.num_emp'
      FixedChar = True
      Size = 2
    end
    object qcanempcod_art: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.inarinv.cod_art'
      FixedChar = True
      Size = 14
    end
    object qcanempcod_art1: TStringField
      FieldName = 'cod_art1'
      Origin = 'COMYLEG.inarinv.cod_art1'
      FixedChar = True
      Size = 14
    end
    object qcanempdes_art: TStringField
      FieldName = 'des_art'
      Origin = 'COMYLEG.inarinv.des_art'
      FixedChar = True
      Size = 40
    end
    object qcanempuni_art: TStringField
      FieldName = 'uni_art'
      Origin = 'COMYLEG.inarinv.uni_art'
      FixedChar = True
      Size = 4
    end
    object qcanempemp_art: TStringField
      FieldName = 'emp_art'
      Origin = 'COMYLEG.inarinv.emp_art'
      FixedChar = True
      Size = 4
    end
    object qcanempcan_emp: TFloatField
      FieldName = 'can_emp'
      Origin = 'COMYLEG.inarinv.can_emp'
    end
    object qcanempprecio_1: TFloatField
      FieldName = 'precio_1'
      Origin = 'COMYLEG.inarinv.precio_1'
    end
    object qcanempprecio_2: TFloatField
      FieldName = 'precio_2'
      Origin = 'COMYLEG.inarinv.precio_2'
    end
    object qcanempprecio_3: TFloatField
      FieldName = 'precio_3'
      Origin = 'COMYLEG.inarinv.precio_3'
    end
    object qcanempprecio_4: TFloatField
      FieldName = 'precio_4'
      Origin = 'COMYLEG.inarinv.precio_4'
    end
    object qcanempprecio_5: TFloatField
      FieldName = 'precio_5'
      Origin = 'COMYLEG.inarinv.precio_5'
    end
    object qcanempsal_val: TFloatField
      FieldName = 'sal_val'
      Origin = 'COMYLEG.inarinv.sal_val'
    end
    object qcanempsal_ant: TFloatField
      FieldName = 'sal_ant'
      Origin = 'COMYLEG.inarinv.sal_ant'
    end
    object qcanempult_cos_kgs: TFloatField
      FieldName = 'ult_cos_kgs'
      Origin = 'COMYLEG.inarinv.ult_cos_kgs'
    end
    object qcanempcos_pro_kgs: TFloatField
      FieldName = 'cos_pro_kgs'
      Origin = 'COMYLEG.inarinv.cos_pro_kgs'
    end
    object qcanempcos_ant_kgs: TFloatField
      FieldName = 'cos_ant_kgs'
      Origin = 'COMYLEG.inarinv.cos_ant_kgs'
    end
    object qcanempven_mes_kgs: TFloatField
      FieldName = 'ven_mes_kgs'
      Origin = 'COMYLEG.inarinv.ven_mes_kgs'
    end
    object qcanempcos_mes_kgs: TFloatField
      FieldName = 'cos_mes_kgs'
      Origin = 'COMYLEG.inarinv.cos_mes_kgs'
    end
    object qcanempven_acu_kgs: TFloatField
      FieldName = 'ven_acu_kgs'
      Origin = 'COMYLEG.inarinv.ven_acu_kgs'
    end
    object qcanempcos_acu_kgs: TFloatField
      FieldName = 'cos_acu_kgs'
      Origin = 'COMYLEG.inarinv.cos_acu_kgs'
    end
    object qcanempexi_cor_kgs: TFloatField
      FieldName = 'exi_cor_kgs'
      Origin = 'COMYLEG.inarinv.exi_cor_kgs'
    end
    object qcanempexi_ant_kgs: TFloatField
      FieldName = 'exi_ant_kgs'
      Origin = 'COMYLEG.inarinv.exi_ant_kgs'
    end
    object qcanempexi_fis_kgs: TFloatField
      FieldName = 'exi_fis_kgs'
      Origin = 'COMYLEG.inarinv.exi_fis_kgs'
    end
    object qcanempcan_acu_kgs: TFloatField
      FieldName = 'can_acu_kgs'
      Origin = 'COMYLEG.inarinv.can_acu_kgs'
    end
    object qcanempcan_mes_kgs: TFloatField
      FieldName = 'can_mes_kgs'
      Origin = 'COMYLEG.inarinv.can_mes_kgs'
    end
    object qcanempult_cos_caj: TFloatField
      FieldName = 'ult_cos_caj'
      Origin = 'COMYLEG.inarinv.ult_cos_caj'
    end
    object qcanempcos_pro_caj: TFloatField
      FieldName = 'cos_pro_caj'
      Origin = 'COMYLEG.inarinv.cos_pro_caj'
    end
    object qcanempcos_ant_caj: TFloatField
      FieldName = 'cos_ant_caj'
      Origin = 'COMYLEG.inarinv.cos_ant_caj'
    end
    object qcanempven_mes_caj: TFloatField
      FieldName = 'ven_mes_caj'
      Origin = 'COMYLEG.inarinv.ven_mes_caj'
    end
    object qcanempcos_mes_caj: TFloatField
      FieldName = 'cos_mes_caj'
      Origin = 'COMYLEG.inarinv.cos_mes_caj'
    end
    object qcanempven_acu_caj: TFloatField
      FieldName = 'ven_acu_caj'
      Origin = 'COMYLEG.inarinv.ven_acu_caj'
    end
    object qcanempcos_acu_caj: TFloatField
      FieldName = 'cos_acu_caj'
      Origin = 'COMYLEG.inarinv.cos_acu_caj'
    end
    object qcanempexi_cor_caj: TFloatField
      FieldName = 'exi_cor_caj'
      Origin = 'COMYLEG.inarinv.exi_cor_caj'
    end
    object qcanempexi_ant_caj: TFloatField
      FieldName = 'exi_ant_caj'
      Origin = 'COMYLEG.inarinv.exi_ant_caj'
    end
    object qcanempexi_fis_caj: TFloatField
      FieldName = 'exi_fis_caj'
      Origin = 'COMYLEG.inarinv.exi_fis_caj'
    end
    object qcanempcan_acu_caj: TFloatField
      FieldName = 'can_acu_caj'
      Origin = 'COMYLEG.inarinv.can_acu_caj'
    end
    object qcanempcan_mes_caj: TFloatField
      FieldName = 'can_mes_caj'
      Origin = 'COMYLEG.inarinv.can_mes_caj'
    end
    object qcanempback_cli: TFloatField
      FieldName = 'back_cli'
      Origin = 'COMYLEG.inarinv.back_cli'
    end
    object qcanempback_pro: TFloatField
      FieldName = 'back_pro'
      Origin = 'COMYLEG.inarinv.back_pro'
    end
    object qcanempmin_emp: TFloatField
      FieldName = 'min_emp'
      Origin = 'COMYLEG.inarinv.min_emp'
    end
    object qcanempmax_emp: TFloatField
      FieldName = 'max_emp'
      Origin = 'COMYLEG.inarinv.max_emp'
    end
    object qcanempiva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.inarinv.iva'
    end
    object qcanemplin_ven: TSmallintField
      FieldName = 'lin_ven'
      Origin = 'COMYLEG.inarinv.lin_ven'
    end
    object qcanempcod_pro: TStringField
      FieldName = 'cod_pro'
      Origin = 'COMYLEG.inarinv.cod_pro'
      FixedChar = True
      Size = 8
    end
    object qcanemptip_art: TStringField
      FieldName = 'tip_art'
      Origin = 'COMYLEG.inarinv.tip_art'
      FixedChar = True
      Size = 1
    end
    object qcanempedo_pro: TStringField
      FieldName = 'edo_pro'
      Origin = 'COMYLEG.inarinv.edo_pro'
      FixedChar = True
      Size = 2
    end
    object qcanempban_rep: TStringField
      FieldName = 'ban_rep'
      Origin = 'COMYLEG.inarinv.ban_rep'
      FixedChar = True
      Size = 1
    end
    object qcanempmin_pre: TFloatField
      FieldName = 'min_pre'
      Origin = 'COMYLEG.inarinv.min_pre'
    end
    object qcanempmax_pre: TFloatField
      FieldName = 'max_pre'
      Origin = 'COMYLEG.inarinv.max_pre'
    end
  end
  object DataSource12: TDataSource
    DataSet = StoredProc1
    Left = 1616
    Top = 328
  end
  object StoredProc1: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'inserta_factinv'
    Left = 1584
    Top = 328
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
        DataType = ftString
        Name = '9'
        ParamType = ptInput
      end>
  end
  object StoredProc3: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'inserta_ticket'
    Left = 1584
    Top = 296
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
      end
      item
        DataType = ftUnknown
        Name = '14'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '15'
        ParamType = ptInput
      end>
  end
  object DataSource13: TDataSource
    DataSet = StoredProc3
    Left = 1616
    Top = 296
  end
  object tconse: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update consecutivo'
      'set num_tik = :numero'
      'where num_emp = :num_emp and cajera = :cajera')
    Left = 1720
    Top = 352
    ParamData = <
      item
        DataType = ftString
        Name = 'numero'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cajera'
        ParamType = ptInput
      end>
  end
  object DataSource17: TDataSource
    DataSet = Corte_caja
    Left = 1400
    Top = 328
  end
  object Corte_caja: TTable
    DatabaseName = 'comyleg'
    TableName = 'corte_caja'
    Left = 1368
    Top = 328
    object Corte_cajafolio: TIntegerField
      FieldName = 'folio'
    end
    object Corte_cajafactura: TStringField
      FieldName = 'factura'
      FixedChar = True
      Size = 10
    end
    object Corte_cajanombre: TStringField
      FieldName = 'nombre'
      FixedChar = True
      Size = 50
    end
    object Corte_cajacaja: TStringField
      FieldName = 'caja'
      FixedChar = True
      Size = 12
    end
    object Corte_cajaefectivo: TFloatField
      FieldName = 'efectivo'
    end
    object Corte_cajabonos: TFloatField
      FieldName = 'bonos'
    end
    object Corte_cajacheque: TFloatField
      FieldName = 'cheque'
    end
    object Corte_cajadolar: TFloatField
      FieldName = 'dolar'
    end
    object Corte_cajatotal: TFloatField
      FieldName = 'total'
    end
    object Corte_cajatipo_pago: TStringField
      FieldName = 'tipo_pago'
      FixedChar = True
      Size = 10
    end
    object Corte_cajatipo_fac: TStringField
      FieldName = 'tipo_fac'
      FixedChar = True
      Size = 10
    end
    object Corte_cajafecha: TDateField
      FieldName = 'fecha'
    end
    object Corte_cajanum_emp: TStringField
      FieldName = 'num_emp'
      FixedChar = True
      Size = 2
    end
    object Corte_cajanum_suc: TStringField
      FieldName = 'num_suc'
      FixedChar = True
      Size = 2
    end
    object Corte_cajacod_cli: TStringField
      FieldName = 'cod_cli'
      FixedChar = True
      Size = 6
    end
    object Corte_cajaiva: TFloatField
      FieldName = 'iva'
    end
  end
  object sacafac: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'SELECT *'
      'from ventas'
      'where folio= :folio ')
    Left = 440
    Top = 456
    ParamData = <
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end>
  end
  object DataSource25: TDataSource
    DataSet = sacafac
    Left = 472
    Top = 456
  end
  object DataSource26: TDataSource
    DataSet = agregafac
    Left = 472
    Top = 496
  end
  object agregafac: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update inartrinv'
      'set iva_Art = :ivaart'
      
        'where num_doc  = :facturin and cod_art = :codigo and ren_art = :' +
        'renglon')
    Left = 440
    Top = 496
    ParamData = <
      item
        DataType = ftString
        Name = 'ivaart'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'facturin'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'renglon'
        ParamType = ptInput
      end>
  end
  object QPPAL: TQuery
    DatabaseName = 'comyleg'
    SessionName = 'Default'
    SQL.Strings = (
      'select *'
      'from ventas'
      
        'where folio = :folio and nombre = :nombre  AND NUM_EMP= :num_emp' +
        ' '
      'order by codigo')
    Left = 1720
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
    object QPPALfolio: TIntegerField
      FieldName = 'folio'
      Origin = 'COMYLEG.ventas.folio'
    end
    object QPPALdescripcion: TStringField
      FieldName = 'descripcion'
      Origin = 'COMYLEG.ventas.descripcion'
      FixedChar = True
      Size = 50
    end
    object QPPALcodigo: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.ventas.codigo'
      FixedChar = True
      Size = 14
    end
    object QPPALcajas: TFloatField
      FieldName = 'cajas'
      Origin = 'COMYLEG.ventas.cajas'
    end
    object QPPALkilos: TFloatField
      FieldName = 'kilos'
      Origin = 'COMYLEG.ventas.kilos'
    end
    object QPPALprecio: TFloatField
      FieldName = 'precio'
      Origin = 'COMYLEG.ventas.precio'
    end
    object QPPALtotal: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.ventas.total'
    end
    object QPPALnombre: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.ventas.nombre'
      FixedChar = True
      Size = 50
    end
    object QPPALiva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.ventas.iva'
    end
    object QPPALcos_pro: TFloatField
      FieldName = 'cos_pro'
      Origin = 'COMYLEG.ventas.cos_pro'
    end
    object QPPALtotiva: TFloatField
      FieldName = 'totiva'
      Origin = 'COMYLEG.ventas.totiva'
    end
    object QPPALrenglon: TSmallintField
      FieldName = 'renglon'
      Origin = 'COMYLEG.ventas.renglon'
    end
    object QPPALpagado: TSmallintField
      FieldName = 'pagado'
      Origin = 'COMYLEG.ventas.pagado'
    end
    object QPPALrfc: TStringField
      FieldName = 'rfc'
      Origin = 'COMYLEG.ventas.rfc'
      FixedChar = True
    end
    object QPPALtipo: TStringField
      FieldName = 'tipo'
      Origin = 'COMYLEG.ventas.tipo'
      FixedChar = True
      Size = 2
    end
    object QPPALlineaven: TStringField
      FieldName = 'lineaven'
      Origin = 'COMYLEG.ventas.lineaven'
      FixedChar = True
    end
    object QPPALdescto: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.ventas.descto'
    end
    object QPPALpedido: TStringField
      FieldName = 'pedido'
      Origin = 'COMYLEG.ventas.pedido'
      FixedChar = True
    end
    object QPPALobservacion: TStringField
      FieldName = 'observacion'
      Origin = 'COMYLEG.ventas.observacion'
      FixedChar = True
    end
    object QPPALsucursal: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.ventas.sucursal'
      FixedChar = True
    end
    object QPPALnum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.ventas.num_emp'
      FixedChar = True
      Size = 2
    end
  end
  object DataSource14: TDataSource
    DataSet = QPPAL
    Left = 1752
    Top = 208
  end
  object DataSource15: TDataSource
    DataSet = tdescto
    Left = 1400
    Top = 360
  end
  object tdescto: TTable
    DatabaseName = 'ventas'
    TableName = 'descto.db'
    Left = 1368
    Top = 360
  end
  object qborraf: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'DELETE'
      'FROM VENTAS'
      'WHERE FOLIO = :FOLIO AND NUM_EMP = :NUM_EMP'
      '')
    Left = 1520
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'FOLIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUM_EMP'
        ParamType = ptInput
      end>
  end
  object DataSource7: TDataSource
    DataSet = qborraf
    Left = 1552
    Top = 104
  end
  object qcambiarfc: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update ventas'
      'set rfc = :rfc'
      'where folio = :folio  and num_emp = :num_emp')
    Left = 1520
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'rfc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
  end
  object DataSource16: TDataSource
    DataSet = qcambiarfc
    Left = 1552
    Top = 8
  end
  object QACTCOT: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'UPDATE INARCOT'
      'SET ESTADO ='#39'N'#39
      'WHERE NUM_DOC = :FOLIO AND NUM_EMP = :NUM_EMP')
    Left = 440
    Top = 616
    ParamData = <
      item
        DataType = ftString
        Name = 'FOLIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUM_EMP'
        ParamType = ptInput
      end>
  end
  object DataSource21: TDataSource
    DataSet = QACTCOT
    Left = 472
    Top = 616
  end
  object DataSource24: TDataSource
    DataSet = qcotiza
    Left = 1440
    Top = 101
  end
  object qcotiza: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from cotiza'
      
        'where cod_cli = :COD_CLI  AND COD_ART = :COD_aRT AND :FECHA BETW' +
        'EEN FECHA_INI AND FECHA_FIN')
    Left = 1472
    Top = 101
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_CLI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COD_aRT'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FECHA'
        ParamType = ptInput
      end>
    object qcotizanum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.cotiza.num_emp'
      FixedChar = True
      Size = 2
    end
    object qcotizacod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.cotiza.cod_cli'
      FixedChar = True
      Size = 8
    end
    object qcotizacod_art: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.cotiza.cod_art'
      FixedChar = True
      Size = 14
    end
    object qcotizades_art: TStringField
      FieldName = 'des_art'
      Origin = 'COMYLEG.cotiza.des_art'
      FixedChar = True
      Size = 40
    end
    object qcotizaprecio: TFloatField
      FieldName = 'precio'
      Origin = 'COMYLEG.cotiza.precio'
    end
    object qcotizafecha_ini: TDateField
      FieldName = 'fecha_ini'
      Origin = 'COMYLEG.cotiza.fecha_ini'
    end
    object qcotizafecha_fin: TDateField
      FieldName = 'fecha_fin'
      Origin = 'COMYLEG.cotiza.fecha_fin'
    end
  end
  object qdupli: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select count(PRECIO)'
      'from cotiza'
      
        'where cod_cli = :COD_CLI  AND COD_ART = :COD_aRT AND :FECHA BETW' +
        'EEN FECHA_INI AND FECHA_FIN'
      '')
    Left = 1552
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_CLI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COD_aRT'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'FECHA'
        ParamType = ptInput
      end>
    object qduplicount: TFloatField
      FieldName = '(count)'
    end
  end
  object DataSource28: TDataSource
    DataSet = qdupli
    Left = 1520
    Top = 40
  end
  object qsucur: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select sucursal'
      'from sucunew'
      'where  GRUPO= :cod_cli')
    Left = 1368
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_cli'
        ParamType = ptInput
      end>
  end
  object QBUSCACO: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select cod_cli'
      'from cotiza'
      'where cod_cli = :COD_CLI'
      'group by cod_cli')
    Left = 1440
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_CLI'
        ParamType = ptInput
      end>
  end
  object DataSource29: TDataSource
    DataSet = QBUSCACO
    Left = 1472
    Top = 72
  end
  object QDEBEFAC: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select SUM(a.IMPORTE)'
      'from inartrcl a, inarcl b'
      
        'where (a.num_emp = b.num_emp) and (a.cod_cli = b.cod_cli) and (a' +
        '.sal_fac <>'
      
        ' '#39'0'#39' or a.sal_iva <> '#39'0'#39') and a.cod_cli = :cod_cli and a.num_emp' +
        ' = :num_emp')
    Left = 1368
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_cli'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
  end
  object DataSource30: TDataSource
    DataSet = QDEBEFAC
    Left = 1400
    Top = 264
  end
  object thora: TTable
    DatabaseName = 'comyleg'
    TableName = 'inarhora'
    Left = 360
    Top = 456
  end
  object DataSource31: TDataSource
    DataSet = thora
    Left = 392
    Top = 456
  end
  object BUS_ART: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select a.*, b.des_Art'
      'from inartrinv a, inarinv b'
      
        'where (a.num_emp=b.num_emp) and (a.cod_art= b.cod_art) and  a.nu' +
        'm_doc= :num_doc'
      ' and a.tip_doc = :tipo')
    Left = 368
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'NUM_DOC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptInput
      end>
  end
  object DataSource32: TDataSource
    DataSet = BUS_ART
    Left = 400
    Top = 208
  end
  object ACTUFAC: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'UPDATE inarfac'
      'SET EMB_POB = :NUM_CORRE'
      
        'where num_emp = :NUM_EMP and num_doc = :NUM_FAC and cod_cli = :C' +
        'OD_CLI')
    Left = 368
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'NUM_CORRE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUM_EMP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUM_FAC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'COD_CLI'
        ParamType = ptInput
      end>
  end
  object DataSource33: TDataSource
    DataSet = ACTUFAC
    Left = 400
    Top = 176
  end
  object qsacafael: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from confacele'
      '')
    Left = 368
    Top = 248
  end
  object DataSource34: TDataSource
    DataSet = qsacafael
    Left = 400
    Top = 256
  end
  object qactfae: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update confacele'
      'set num_doc = :num_doc')
    Left = 368
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'num_doc'
        ParamType = ptInput
      end>
  end
  object DataSource35: TDataSource
    Left = 400
    Top = 288
  end
  object qfolio: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'SELECT *'
      'FROM FOLIOS'
      'WHERE CAJERA = :CAJERA')
    Left = 1368
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'CAJERA'
        ParamType = ptInput
      end>
    object qfolioserie: TStringField
      FieldName = 'serie'
      Origin = 'COMYLEG.folios.serie'
      FixedChar = True
      Size = 15
    end
    object qfoliofolio_final: TIntegerField
      FieldName = 'folio_final'
      Origin = 'COMYLEG.folios.folio_final'
    end
    object qfolioano_aproba: TIntegerField
      FieldName = 'ano_aproba'
      Origin = 'COMYLEG.folios.ano_aproba'
    end
    object qfolionum_aproba: TIntegerField
      FieldName = 'num_aproba'
      Origin = 'COMYLEG.folios.num_aproba'
    end
    object qfoliocajera: TStringField
      FieldName = 'cajera'
      Origin = 'COMYLEG.folios.cajera'
      FixedChar = True
      Size = 25
    end
    object qfoliofolio_inicio: TIntegerField
      FieldName = 'folio_inicio'
      Origin = 'COMYLEG.folios.folio_inicio'
    end
  end
  object DataSource36: TDataSource
    DataSet = qfolio
    Left = 1400
    Top = 40
  end
  object qdeta: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from deta_cte'
      'where cod_cli = :cod_cli')
    Left = 1368
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_cli'
        ParamType = ptInput
      end>
    object qdetanum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.deta_cte.num_emp'
      FixedChar = True
      Size = 10
    end
    object qdetacod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.deta_cte.cod_cli'
      FixedChar = True
      Size = 40
    end
    object qdetacalle: TStringField
      FieldName = 'calle'
      Origin = 'COMYLEG.deta_cte.calle'
      FixedChar = True
      Size = 50
    end
    object qdetanum_int: TStringField
      FieldName = 'num_int'
      Origin = 'COMYLEG.deta_cte.num_int'
      FixedChar = True
    end
    object qdetanum_ext: TStringField
      FieldName = 'num_ext'
      Origin = 'COMYLEG.deta_cte.num_ext'
      FixedChar = True
      Size = 40
    end
    object qdetacolonia: TStringField
      FieldName = 'colonia'
      Origin = 'COMYLEG.deta_cte.colonia'
      FixedChar = True
      Size = 40
    end
    object qdetaemail: TStringField
      FieldName = 'email'
      Origin = 'COMYLEG.deta_cte.email'
      FixedChar = True
      Size = 50
    end
    object qdetamunicipio: TStringField
      FieldName = 'municipio'
      Origin = 'COMYLEG.deta_cte.municipio'
      FixedChar = True
      Size = 50
    end
    object qdetapais: TStringField
      FieldName = 'pais'
      Origin = 'COMYLEG.deta_cte.pais'
      FixedChar = True
    end
  end
  object DataSource37: TDataSource
    DataSet = qdeta
    Left = 1400
    Top = 104
  end
  object DataSource38: TDataSource
    DataSet = qupdatefac
    Left = 1688
    Top = 232
  end
  object qupdatefac: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update folios'
      'set folio_inicio = :inicio'
      'where cajera = :cajera')
    Left = 1656
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'inicio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cajera'
        ParamType = ptInput
      end>
  end
  object DataSource39: TDataSource
    DataSet = QBUS99
    Left = 1688
    Top = 392
  end
  object QBUS99: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarcl99'
      'where cod_cli = :cod_cli')
    Left = 1656
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_cli'
        ParamType = ptInput
      end>
    object QBUS99cod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.inarcl99.cod_cli'
      FixedChar = True
      Size = 10
    end
  end
  object copiascli: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from copiascli'
      'where cod_cli = :cod_cli')
    Left = 1656
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_cli'
        ParamType = ptInput
      end>
    object copiasclicod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.copiascli.cod_cli'
      FixedChar = True
    end
  end
  object DataSource41: TDataSource
    DataSet = copiascli
    Left = 1688
    Top = 200
  end
  object DataSource44: TDataSource
    DataSet = QEMPRESA
    Left = 1656
    Top = 264
  end
  object QEMPRESA: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      
        'select A.RAZ_SOC, A.CIU_CLI, A.EST_CLI, A.COD_POS, A.RFC_CLI, B.' +
        'MUNICIPIO, B.PAIS, B.COLONIA, B.CALLE, B.NUM_EXT, B.NUM_INT'
      'from inarCL A, DETA_CTE B'
      
        'where (A.COD_CLI = B.COD_CLI) AND A.cod_cli='#39'C61L'#39' AND A.NUM_EMP' +
        ' ='#39'01'#39)
    Left = 1688
    Top = 264
    object QEMPRESAraz_soc: TStringField
      FieldName = 'raz_soc'
      FixedChar = True
      Size = 50
    end
    object QEMPRESAciu_cli: TStringField
      FieldName = 'ciu_cli'
      FixedChar = True
    end
    object QEMPRESAest_cli: TStringField
      FieldName = 'est_cli'
      FixedChar = True
      Size = 10
    end
    object QEMPRESAcod_pos: TIntegerField
      FieldName = 'cod_pos'
    end
    object QEMPRESArfc_cli: TStringField
      FieldName = 'rfc_cli'
      FixedChar = True
    end
    object QEMPRESAmunicipio: TStringField
      FieldName = 'municipio'
      FixedChar = True
      Size = 50
    end
    object QEMPRESApais: TStringField
      FieldName = 'pais'
      FixedChar = True
    end
    object QEMPRESAcolonia: TStringField
      FieldName = 'colonia'
      FixedChar = True
      Size = 40
    end
    object QEMPRESAcalle: TStringField
      FieldName = 'calle'
      FixedChar = True
      Size = 50
    end
    object QEMPRESAnum_ext: TStringField
      FieldName = 'num_ext'
      FixedChar = True
      Size = 40
    end
    object QEMPRESAnum_int: TStringField
      FieldName = 'num_int'
      FixedChar = True
    end
  end
  object RvProject1: TRvProject
    Engine = RvSystem1
    ProjectFile = 'C:\delphi\reportes\Factura Electronica\FacturaORI.rav'
    Left = 1688
    Top = 296
  end
  object RvDataSetConnection1: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = QEMPRESA
    Left = 1688
    Top = 328
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    DefaultDest = rdPrinter
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 1656
    Top = 328
  end
  object RvRenderPDF1: TRvRenderPDF
    DisplayName = 'Adobe Acrobat (PDF)'
    FileExtension = '*.pdf'
    EmbedFonts = False
    ImageQuality = 90
    MetafileDPI = 300
    FontEncoding = feWinAnsiEncoding
    DocInfo.Creator = 'Rave (http://www.nevrona.com/rave)'
    DocInfo.Producer = 'Nevrona Designs'
    Left = 1656
    Top = 296
  end
  object RvDataSetConnection2: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = temp_ventas
    Left = 1656
    Top = 360
  end
  object temp_ventas: TTable
    DatabaseName = 'ventas'
    TableName = 'tmp_imprime.db'
    Left = 1600
    Top = 576
    object temp_ventasCodigo: TStringField
      FieldName = 'Codigo'
    end
    object temp_ventasCantidad: TFloatField
      FieldName = 'Cantidad'
    end
    object temp_ventasDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 40
    end
    object temp_ventasPre_uni: TFloatField
      FieldName = 'Pre_uni'
    end
    object temp_ventasImporte: TFloatField
      FieldName = 'Importe'
    end
  end
  object DataSource45: TDataSource
    DataSet = temp_ventas
    Left = 1632
    Top = 576
  end
  object QBORRAR: TQuery
    DatabaseName = 'ventas'
    SQL.Strings = (
      'DELETE'
      'FROM TMP_IMPRIME')
    Left = 1656
    Top = 456
  end
  object DataSource46: TDataSource
    Left = 1688
    Top = 456
  end
  object qnvoserie: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from folios'
      'where serie = :serie')
    Left = 720
    Top = 440
    ParamData = <
      item
        DataType = ftString
        Name = 'serie'
        ParamType = ptInput
      end>
    object qnvoserieserie: TStringField
      FieldName = 'serie'
      Origin = 'COMYLEG.folios.serie'
      FixedChar = True
      Size = 15
    end
    object qnvoseriefolio_final: TIntegerField
      FieldName = 'folio_final'
      Origin = 'COMYLEG.folios.folio_final'
    end
    object qnvoserieano_aproba: TIntegerField
      FieldName = 'ano_aproba'
      Origin = 'COMYLEG.folios.ano_aproba'
    end
    object qnvoserienum_aproba: TIntegerField
      FieldName = 'num_aproba'
      Origin = 'COMYLEG.folios.num_aproba'
    end
    object qnvoseriecajera: TStringField
      FieldName = 'cajera'
      Origin = 'COMYLEG.folios.cajera'
      FixedChar = True
      Size = 25
    end
    object qnvoseriefolio_inicio: TIntegerField
      FieldName = 'folio_inicio'
      Origin = 'COMYLEG.folios.folio_inicio'
    end
  end
  object DataSource47: TDataSource
    DataSet = qnvoserie
    Left = 752
    Top = 440
  end
  object qupdafol: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update folios'
      
        'set folio_final = :final,  ano_aproba = :ano, num_aproba= :numer' +
        'o, folio_inicio = :inicio'
      'where serie = :serie')
    Left = 720
    Top = 480
    ParamData = <
      item
        DataType = ftString
        Name = 'final'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ano'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'numero'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'inicio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'serie'
        ParamType = ptInput
      end>
  end
  object DataSource48: TDataSource
    DataSet = qupdafol
    Left = 752
    Top = 480
  end
  object qinarcot: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarcot'
      'where num_doc = :num_doc')
    Left = 1664
    Top = 536
    ParamData = <
      item
        DataType = ftString
        Name = 'num_doc'
        ParamType = ptInput
      end>
    object qinarcotnum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inarcot.num_emp'
      FixedChar = True
      Size = 2
    end
    object qinarcotnum_suc: TStringField
      FieldName = 'num_suc'
      Origin = 'COMYLEG.inarcot.num_suc'
      FixedChar = True
      Size = 2
    end
    object qinarcotnum_doc: TIntegerField
      FieldName = 'num_doc'
      Origin = 'COMYLEG.inarcot.num_doc'
    end
    object qinarcotcod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.inarcot.cod_cli'
      FixedChar = True
      Size = 8
    end
    object qinarcotraz_soc: TStringField
      FieldName = 'raz_soc'
      Origin = 'COMYLEG.inarcot.raz_soc'
      FixedChar = True
      Size = 50
    end
    object qinarcotdom_cli: TStringField
      FieldName = 'dom_cli'
      Origin = 'COMYLEG.inarcot.dom_cli'
      FixedChar = True
      Size = 60
    end
    object qinarcotciu_cli: TStringField
      FieldName = 'ciu_cli'
      Origin = 'COMYLEG.inarcot.ciu_cli'
      FixedChar = True
    end
    object qinarcotest_cli: TStringField
      FieldName = 'est_cli'
      Origin = 'COMYLEG.inarcot.est_cli'
      FixedChar = True
      Size = 10
    end
    object qinarcotrfc_cli: TStringField
      FieldName = 'rfc_cli'
      Origin = 'COMYLEG.inarcot.rfc_cli'
      FixedChar = True
    end
    object qinarcotemb_nom: TStringField
      FieldName = 'emb_nom'
      Origin = 'COMYLEG.inarcot.emb_nom'
      FixedChar = True
      Size = 40
    end
    object qinarcotemb_dom: TStringField
      FieldName = 'emb_dom'
      Origin = 'COMYLEG.inarcot.emb_dom'
      FixedChar = True
      Size = 40
    end
    object qinarcotemb_pob: TStringField
      FieldName = 'emb_pob'
      Origin = 'COMYLEG.inarcot.emb_pob'
      FixedChar = True
      Size = 30
    end
    object qinarcotnum_ped: TIntegerField
      FieldName = 'num_ped'
      Origin = 'COMYLEG.inarcot.num_ped'
    end
    object qinarcotfech_ped: TDateField
      FieldName = 'fech_ped'
      Origin = 'COMYLEG.inarcot.fech_ped'
    end
    object qinarcotnum_ord: TIntegerField
      FieldName = 'num_ord'
      Origin = 'COMYLEG.inarcot.num_ord'
    end
    object qinarcotfech_emb: TDateField
      FieldName = 'fech_emb'
      Origin = 'COMYLEG.inarcot.fech_emb'
    end
    object qinarcotcon_cli: TStringField
      FieldName = 'con_cli'
      Origin = 'COMYLEG.inarcot.con_cli'
      FixedChar = True
      Size = 1
    end
    object qinarcotcod_ag: TSmallintField
      FieldName = 'cod_ag'
      Origin = 'COMYLEG.inarcot.cod_ag'
    end
    object qinarcotimp_exe: TFloatField
      FieldName = 'imp_exe'
      Origin = 'COMYLEG.inarcot.imp_exe'
    end
    object qinarcotimp_6: TFloatField
      FieldName = 'imp_6'
      Origin = 'COMYLEG.inarcot.imp_6'
    end
    object qinarcotimp_15: TFloatField
      FieldName = 'imp_15'
      Origin = 'COMYLEG.inarcot.imp_15'
    end
    object qinarcotimp_20: TFloatField
      FieldName = 'imp_20'
      Origin = 'COMYLEG.inarcot.imp_20'
    end
    object qinarcotdes_exe: TFloatField
      FieldName = 'des_exe'
      Origin = 'COMYLEG.inarcot.des_exe'
    end
    object qinarcotdes_6: TFloatField
      FieldName = 'des_6'
      Origin = 'COMYLEG.inarcot.des_6'
    end
    object qinarcotdes_15: TFloatField
      FieldName = 'des_15'
      Origin = 'COMYLEG.inarcot.des_15'
    end
    object qinarcotdes_20: TFloatField
      FieldName = 'des_20'
      Origin = 'COMYLEG.inarcot.des_20'
    end
    object qinarcotiva_6: TFloatField
      FieldName = 'iva_6'
      Origin = 'COMYLEG.inarcot.iva_6'
    end
    object qinarcotiva_15: TFloatField
      FieldName = 'iva_15'
      Origin = 'COMYLEG.inarcot.iva_15'
    end
    object qinarcotiva_20: TFloatField
      FieldName = 'iva_20'
      Origin = 'COMYLEG.inarcot.iva_20'
    end
    object qinarcotcos_vta: TFloatField
      FieldName = 'cos_vta'
      Origin = 'COMYLEG.inarcot.cos_vta'
    end
    object qinarcotflete: TFloatField
      FieldName = 'flete'
      Origin = 'COMYLEG.inarcot.flete'
    end
    object qinarcotiva_fle: TFloatField
      FieldName = 'iva_fle'
      Origin = 'COMYLEG.inarcot.iva_fle'
    end
    object qinarcotcar_1: TFloatField
      FieldName = 'car_1'
      Origin = 'COMYLEG.inarcot.car_1'
    end
    object qinarcotiva_1: TFloatField
      FieldName = 'iva_1'
      Origin = 'COMYLEG.inarcot.iva_1'
    end
    object qinarcotcar_2: TFloatField
      FieldName = 'car_2'
      Origin = 'COMYLEG.inarcot.car_2'
    end
    object qinarcotiva_2: TFloatField
      FieldName = 'iva_2'
      Origin = 'COMYLEG.inarcot.iva_2'
    end
    object qinarcotestado: TStringField
      FieldName = 'estado'
      Origin = 'COMYLEG.inarcot.estado'
      FixedChar = True
      Size = 1
    end
  end
  object qinarcot1: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarcot1'
      'where num_doc = :num_doc')
    Left = 1664
    Top = 696
    ParamData = <
      item
        DataType = ftString
        Name = 'num_doc'
        ParamType = ptInput
      end>
    object qinarcot1num_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inarcot1.num_emp'
      FixedChar = True
      Size = 2
    end
    object qinarcot1cod_art: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.inarcot1.cod_art'
      FixedChar = True
      Size = 14
    end
    object qinarcot1num_suc: TStringField
      FieldName = 'num_suc'
      Origin = 'COMYLEG.inarcot1.num_suc'
      FixedChar = True
      Size = 2
    end
    object qinarcot1fech_doc: TDateField
      FieldName = 'fech_doc'
      Origin = 'COMYLEG.inarcot1.fech_doc'
    end
    object qinarcot1tip_doc: TStringField
      FieldName = 'tip_doc'
      Origin = 'COMYLEG.inarcot1.tip_doc'
      FixedChar = True
      Size = 2
    end
    object qinarcot1num_doc: TIntegerField
      FieldName = 'num_doc'
      Origin = 'COMYLEG.inarcot1.num_doc'
    end
    object qinarcot1can_kgs: TFloatField
      FieldName = 'can_kgs'
      Origin = 'COMYLEG.inarcot1.can_kgs'
    end
    object qinarcot1can_caj: TFloatField
      FieldName = 'can_caj'
      Origin = 'COMYLEG.inarcot1.can_caj'
    end
    object qinarcot1cos_pro_kgs: TFloatField
      FieldName = 'cos_pro_kgs'
      Origin = 'COMYLEG.inarcot1.cos_pro_kgs'
    end
    object qinarcot1cos_pro_caj: TFloatField
      FieldName = 'cos_pro_caj'
      Origin = 'COMYLEG.inarcot1.cos_pro_caj'
    end
    object qinarcot1pre_vta_kgs: TFloatField
      FieldName = 'pre_vta_kgs'
      Origin = 'COMYLEG.inarcot1.pre_vta_kgs'
    end
    object qinarcot1pre_vta_caj: TFloatField
      FieldName = 'pre_vta_caj'
      Origin = 'COMYLEG.inarcot1.pre_vta_caj'
    end
    object qinarcot1des_vta: TFloatField
      FieldName = 'des_vta'
      Origin = 'COMYLEG.inarcot1.des_vta'
    end
    object qinarcot1fle_art: TFloatField
      FieldName = 'fle_art'
      Origin = 'COMYLEG.inarcot1.fle_art'
    end
    object qinarcot1ren_art: TSmallintField
      FieldName = 'ren_art'
      Origin = 'COMYLEG.inarcot1.ren_art'
    end
    object qinarcot1cod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.inarcot1.cod_cli'
      FixedChar = True
      Size = 8
    end
    object qinarcot1iva_art: TFloatField
      FieldName = 'iva_art'
      Origin = 'COMYLEG.inarcot1.iva_art'
    end
    object qinarcot1cod_ag: TSmallintField
      FieldName = 'cod_ag'
      Origin = 'COMYLEG.inarcot1.cod_ag'
    end
  end
  object DataSource49: TDataSource
    DataSet = qinarcot
    Left = 1696
    Top = 536
  end
  object DataSource50: TDataSource
    DataSet = qinarcot1
    Left = 1696
    Top = 696
  end
  object tinarfac: TTable
    DatabaseName = 'comyleg'
    TableName = 'inarfac'
    Left = 1696
    Top = 568
    object tinarfacnum_emp: TStringField
      FieldName = 'num_emp'
      FixedChar = True
      Size = 2
    end
    object tinarfacnum_suc: TStringField
      FieldName = 'num_suc'
      FixedChar = True
      Size = 2
    end
    object tinarfacnum_doc: TStringField
      FieldName = 'num_doc'
      FixedChar = True
      Size = 10
    end
    object tinarfaccod_cli: TStringField
      FieldName = 'cod_cli'
      FixedChar = True
      Size = 8
    end
    object tinarfacraz_soc: TStringField
      FieldName = 'raz_soc'
      FixedChar = True
      Size = 50
    end
    object tinarfacdom_cli: TStringField
      FieldName = 'dom_cli'
      FixedChar = True
      Size = 60
    end
    object tinarfacciu_cli: TStringField
      FieldName = 'ciu_cli'
      FixedChar = True
    end
    object tinarfacest_cli: TStringField
      FieldName = 'est_cli'
      FixedChar = True
      Size = 10
    end
    object tinarfacemb_nom: TStringField
      FieldName = 'emb_nom'
      FixedChar = True
      Size = 40
    end
    object tinarfacemb_dom: TStringField
      FieldName = 'emb_dom'
      FixedChar = True
      Size = 40
    end
    object tinarfacemb_pob: TStringField
      FieldName = 'emb_pob'
      FixedChar = True
      Size = 30
    end
    object tinarfacnum_ped: TIntegerField
      FieldName = 'num_ped'
    end
    object tinarfacfech_ped: TDateField
      FieldName = 'fech_ped'
    end
    object tinarfacnum_ord: TIntegerField
      FieldName = 'num_ord'
    end
    object tinarfacfech_emb: TDateField
      FieldName = 'fech_emb'
    end
    object tinarfaccon_cli: TStringField
      FieldName = 'con_cli'
      FixedChar = True
      Size = 1
    end
    object tinarfacag_fac: TSmallintField
      FieldName = 'ag_fac'
    end
    object tinarfacimp_exe: TFloatField
      FieldName = 'imp_exe'
    end
    object tinarfacimp_6: TFloatField
      FieldName = 'imp_6'
    end
    object tinarfacimp_15: TFloatField
      FieldName = 'imp_15'
    end
    object tinarfacimp_20: TFloatField
      FieldName = 'imp_20'
    end
    object tinarfacdes_exe: TFloatField
      FieldName = 'des_exe'
    end
    object tinarfacdes_6: TFloatField
      FieldName = 'des_6'
    end
    object tinarfacdes_15: TFloatField
      FieldName = 'des_15'
    end
    object tinarfacdes_20: TFloatField
      FieldName = 'des_20'
    end
    object tinarfaciva_6: TFloatField
      FieldName = 'iva_6'
    end
    object tinarfaciva_15: TFloatField
      FieldName = 'iva_15'
    end
    object tinarfaciva_20: TFloatField
      FieldName = 'iva_20'
    end
    object tinarfaccos_vta: TFloatField
      FieldName = 'cos_vta'
    end
    object tinarfacflete: TFloatField
      FieldName = 'flete'
    end
    object tinarfaciva_fle: TFloatField
      FieldName = 'iva_fle'
    end
    object tinarfaccar_1: TFloatField
      FieldName = 'car_1'
    end
    object tinarfaciva_1: TFloatField
      FieldName = 'iva_1'
    end
    object tinarfaccar_2: TFloatField
      FieldName = 'car_2'
    end
    object tinarfaciva_2: TFloatField
      FieldName = 'iva_2'
    end
    object tinarfacfecha: TDateField
      FieldName = 'fecha'
    end
    object tinarfacreg_fed: TStringField
      FieldName = 'reg_fed'
      FixedChar = True
    end
    object tinarfactip_fac: TStringField
      FieldName = 'tip_fac'
      FixedChar = True
      Size = 1
    end
    object tinarfaccajera: TStringField
      FieldName = 'cajera'
      FixedChar = True
      Size = 12
    end
  end
  object tinartrinv: TTable
    DatabaseName = 'comyleg'
    TableName = 'inartrinv'
    Left = 1696
    Top = 600
    object tinartrinvnum_emp: TStringField
      FieldName = 'num_emp'
      FixedChar = True
      Size = 2
    end
    object tinartrinvcod_art: TStringField
      FieldName = 'cod_art'
      FixedChar = True
      Size = 14
    end
    object tinartrinvnum_suc: TStringField
      FieldName = 'num_suc'
      FixedChar = True
      Size = 2
    end
    object tinartrinvfech_doc: TDateField
      FieldName = 'fech_doc'
    end
    object tinartrinvtip_doc: TStringField
      FieldName = 'tip_doc'
      FixedChar = True
      Size = 2
    end
    object tinartrinvnum_doc: TStringField
      FieldName = 'num_doc'
      FixedChar = True
      Size = 10
    end
    object tinartrinvcan_kgs: TFloatField
      FieldName = 'can_kgs'
    end
    object tinartrinvcan_caj: TFloatField
      FieldName = 'can_caj'
    end
    object tinartrinvcos_uni_kgs: TFloatField
      FieldName = 'cos_uni_kgs'
    end
    object tinartrinvcos_uni_caj: TFloatField
      FieldName = 'cos_uni_caj'
    end
    object tinartrinvcos_pro_kgs: TFloatField
      FieldName = 'cos_pro_kgs'
    end
    object tinartrinvcos_pro_caj: TFloatField
      FieldName = 'cos_pro_caj'
    end
    object tinartrinvpre_vta_kgs: TFloatField
      FieldName = 'pre_vta_kgs'
    end
    object tinartrinvpre_vta_caj: TFloatField
      FieldName = 'pre_vta_caj'
    end
    object tinartrinvdes_vta: TFloatField
      FieldName = 'des_vta'
    end
    object tinartrinvfle_art: TFloatField
      FieldName = 'fle_art'
    end
    object tinartrinvren_art: TSmallintField
      FieldName = 'ren_art'
    end
    object tinartrinvcod_pro: TStringField
      FieldName = 'cod_pro'
      FixedChar = True
      Size = 8
    end
    object tinartrinvcod_cli: TStringField
      FieldName = 'cod_cli'
      FixedChar = True
      Size = 8
    end
    object tinartrinvnum_ent: TIntegerField
      FieldName = 'num_ent'
    end
    object tinartrinvfech_ent: TDateField
      FieldName = 'fech_ent'
    end
    object tinartrinviva_art: TFloatField
      FieldName = 'iva_art'
    end
  end
  object tdocumento: TTable
    DatabaseName = 'comyleg'
    TableName = 'documento'
    Left = 1696
    Top = 632
  end
  object tinartrcl: TTable
    DatabaseName = 'comyleg'
    TableName = 'inartrcl'
    Left = 1696
    Top = 664
  end
  object DataSource51: TDataSource
    DataSet = tinarfac
    Left = 1664
    Top = 568
  end
  object DataSource52: TDataSource
    DataSet = tinartrinv
    Left = 1664
    Top = 600
  end
  object DataSource53: TDataSource
    DataSet = tdocumento
    Left = 1664
    Top = 632
  end
  object DataSource54: TDataSource
    DataSet = tinartrcl
    Left = 1664
    Top = 664
  end
  object QSACADIAS: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inartrcl'
      'where cod_cli = :COD_CLI AND SAL_FAC <> '#39'0'#39
      'ORDER BY FECHA')
    Left = 1584
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_CLI'
        ParamType = ptInput
      end>
    object QSACADIASnum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inartrcl.num_emp'
      FixedChar = True
      Size = 2
    end
    object QSACADIASnum_suc: TStringField
      FieldName = 'num_suc'
      Origin = 'COMYLEG.inartrcl.num_suc'
      FixedChar = True
      Size = 2
    end
    object QSACADIAScod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.inartrcl.cod_cli'
      FixedChar = True
      Size = 8
    end
    object QSACADIAStipo: TStringField
      FieldName = 'tipo'
      Origin = 'COMYLEG.inartrcl.tipo'
      FixedChar = True
      Size = 2
    end
    object QSACADIASnum_docto: TStringField
      FieldName = 'num_docto'
      Origin = 'COMYLEG.inartrcl.num_docto'
      FixedChar = True
      Size = 10
    end
    object QSACADIASimporte: TFloatField
      FieldName = 'importe'
      Origin = 'COMYLEG.inartrcl.importe'
    end
    object QSACADIASsal_fac: TFloatField
      FieldName = 'sal_fac'
      Origin = 'COMYLEG.inartrcl.sal_fac'
    end
    object QSACADIASsal_iva: TFloatField
      FieldName = 'sal_iva'
      Origin = 'COMYLEG.inartrcl.sal_iva'
    end
    object QSACADIASfecha: TDateField
      FieldName = 'fecha'
      Origin = 'COMYLEG.inartrcl.fecha'
    end
  end
  object DataSource55: TDataSource
    DataSet = QSACADIAS
    Left = 1616
    Top = 40
  end
  object Query1: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarcl'
      
        'where NUM_EMP = :num_emp AND (RAZ_SOC <> '#39#39')AND (COD_CLI <> '#39'A15' +
        'L'#39') AND (COD_CLI <> '#39'V1L'#39') AND (COD_CLI <> '#39'Q1F'#39')'
      
        'and (cod_cli <> '#39'P56L'#39') AND (COD_CLI <> '#39'H1F'#39') AND (COD_CLI <> '#39 +
        'O11L'#39') AND (COD_CLI <> '#39'A36L'#39') AND (COD_CLI <> '#39'R13L'#39')'
      
        'AND (COD_CLI <> '#39'Z2L'#39') AND (COD_CLI <> '#39'L20F'#39') AND (COD_CLI <> '#39 +
        'N1L'#39') AND (COD_CLI <> '#39'V2F'#39') AND (COD_CLI <> '#39'M2L'#39')'
      
        'AND (COD_CLI <> '#39'S3F'#39') AND (COD_CLI <> '#39'B1F'#39') AND (COD_CLI <> '#39'G' +
        '124L'#39') AND (COD_CLI <> '#39'B22L'#39') AND (COD_CLI <> '#39'C8F'#39')'
      
        'AND (COD_CLI <> '#39'C58L'#39') AND (COD_CLI <> '#39'A6F'#39') AND (COD_CLI <> '#39 +
        'D29L'#39') AND (COD_CLI <> '#39'M5F'#39') AND (COD_CLI <> '#39'S16L'#39')'
      
        'AND (COD_CLI <> '#39'C36F'#39')  AND (COD_CLI <> '#39'7777'#39') AND (COD_CLI <>' +
        ' '#39'3'#39') AND (COD_CLI <> '#39'4'#39')'
      'AND (COD_CLI <> '#39'*M260L'#39') AND (COD_CLI<> '#39'*M288F'#39')'
      
        'OR (cod_cli= '#39'O14L'#39' OR COD_CLI = '#39'C21L'#39' OR cod_cli='#39'W21F'#39' OR COD' +
        '_CLI= '#39'S235L'#39') AND NUM_EMP = :NUM_EMP'
      '  '
      'ORDER BY RAZ_SOC')
    Left = 1280
    Top = 472
    ParamData = <
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUM_EMP'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inarcl.num_emp'
      FixedChar = True
      Size = 2
    end
    object StringField2: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.inarcl.cod_cli'
      FixedChar = True
      Size = 8
    end
    object StringField3: TStringField
      FieldName = 'raz_soc'
      Origin = 'COMYLEG.inarcl.raz_soc'
      FixedChar = True
      Size = 50
    end
    object StringField4: TStringField
      FieldName = 'dom_cli'
      Origin = 'COMYLEG.inarcl.dom_cli'
      FixedChar = True
      Size = 60
    end
    object StringField5: TStringField
      FieldName = 'ciu_cli'
      Origin = 'COMYLEG.inarcl.ciu_cli'
      FixedChar = True
    end
    object StringField6: TStringField
      FieldName = 'est_cli'
      Origin = 'COMYLEG.inarcl.est_cli'
      FixedChar = True
      Size = 10
    end
    object StringField7: TStringField
      FieldName = 'tel_cli'
      Origin = 'COMYLEG.inarcl.tel_cli'
      FixedChar = True
      Size = 12
    end
    object StringField8: TStringField
      FieldName = 'rfc_cli'
      Origin = 'COMYLEG.inarcl.rfc_cli'
      FixedChar = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'cod_pos'
      Origin = 'COMYLEG.inarcl.cod_pos'
    end
    object SmallintField1: TSmallintField
      FieldName = 'age_cli'
      Origin = 'COMYLEG.inarcl.age_cli'
    end
    object StringField9: TStringField
      FieldName = 'con_cli'
      Origin = 'COMYLEG.inarcl.con_cli'
      FixedChar = True
      Size = 1
    end
    object SmallintField2: TSmallintField
      FieldName = 'pla_cli'
      Origin = 'COMYLEG.inarcl.pla_cli'
    end
    object StringField10: TStringField
      FieldName = 'sta_cli'
      Origin = 'COMYLEG.inarcl.sta_cli'
      FixedChar = True
      Size = 1
    end
    object FloatField1: TFloatField
      FieldName = 'lim_cre'
      Origin = 'COMYLEG.inarcl.lim_cre'
    end
    object FloatField2: TFloatField
      FieldName = 'sal_act'
      Origin = 'COMYLEG.inarcl.sal_act'
    end
    object FloatField3: TFloatField
      FieldName = 'sal_ant'
      Origin = 'COMYLEG.inarcl.sal_ant'
    end
    object FloatField4: TFloatField
      FieldName = 'com_mes'
      Origin = 'COMYLEG.inarcl.com_mes'
    end
    object FloatField5: TFloatField
      FieldName = 'cos_mes'
      Origin = 'COMYLEG.inarcl.cos_mes'
    end
    object FloatField6: TFloatField
      FieldName = 'com_acu'
      Origin = 'COMYLEG.inarcl.com_acu'
    end
    object FloatField7: TFloatField
      FieldName = 'cos_acu'
      Origin = 'COMYLEG.inarcl.cos_acu'
    end
    object DateField1: TDateField
      FieldName = 'fech_com'
      Origin = 'COMYLEG.inarcl.fech_com'
    end
    object FloatField8: TFloatField
      FieldName = 'can_com'
      Origin = 'COMYLEG.inarcl.can_com'
    end
    object DateField2: TDateField
      FieldName = 'fech_pag'
      Origin = 'COMYLEG.inarcl.fech_pag'
    end
    object FloatField9: TFloatField
      FieldName = 'imp_pag'
      Origin = 'COMYLEG.inarcl.imp_pag'
    end
    object StringField11: TStringField
      FieldName = 'curp'
      Origin = 'COMYLEG.inarcl.curp'
      FixedChar = True
      Size = 18
    end
    object StringField12: TStringField
      FieldName = 'apodo'
      Origin = 'COMYLEG.inarcl.apodo'
      FixedChar = True
    end
  end
  object DataSource56: TDataSource
    DataSet = Query1
    Left = 1312
    Top = 472
  end
  object Database1: TDatabase
    AliasName = 'comyleg'
    Connected = True
    DatabaseName = 'comyleg'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=informix'
      'password=infocol'
      '=')
    SessionName = 'Default'
    Left = 1336
    Top = 96
  end
  object MailMessage: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 1720
    Top = 136
  end
  object SMTP: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atLogin
    Left = 1720
    Top = 172
  end
  object AttachmentDialog: TOpenDialog
    Options = [ofReadOnly, ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 1745
    Top = 140
  end
  object ARCHIVOS: TTable
    DatabaseName = 'ventas'
    TableName = 'ARCHIVOS.db'
    Left = 1224
    Top = 80
  end
  object DataSource57: TDataSource
    DataSet = ARCHIVOS
    Left = 1256
    Top = 80
  end
  object config: TTable
    DatabaseName = 'comyleg'
    TableName = 'con_correo'
    Left = 1600
    Top = 608
    object confighost: TStringField
      FieldName = 'host'
      FixedChar = True
      Size = 40
    end
    object configcorreo: TStringField
      FieldName = 'correo'
      FixedChar = True
      Size = 40
    end
    object configpuerto: TIntegerField
      FieldName = 'puerto'
    end
  end
  object DataSource58: TDataSource
    DataSet = config
    Left = 1632
    Top = 608
  end
  object Query2: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select num_emp'
      'from  consent')
    Left = 1056
    Top = 632
    object StringField13: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.consent.num_emp'
      FixedChar = True
      Size = 2
    end
  end
  object DataSource59: TDataSource
    DataSet = Query2
    Left = 1088
    Top = 632
  end
  object qcorreo: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from deta_cte'
      'where cod_cli = :cod_cli and num_emp = :num_emp')
    Left = 1712
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_cli'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
    object qcorreonum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.deta_cte.num_emp'
      FixedChar = True
      Size = 10
    end
    object qcorreocod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.deta_cte.cod_cli'
      FixedChar = True
      Size = 40
    end
    object qcorreocalle: TStringField
      FieldName = 'calle'
      Origin = 'COMYLEG.deta_cte.calle'
      FixedChar = True
      Size = 50
    end
    object qcorreonum_int: TStringField
      FieldName = 'num_int'
      Origin = 'COMYLEG.deta_cte.num_int'
      FixedChar = True
    end
    object qcorreonum_ext: TStringField
      FieldName = 'num_ext'
      Origin = 'COMYLEG.deta_cte.num_ext'
      FixedChar = True
      Size = 40
    end
    object qcorreocolonia: TStringField
      FieldName = 'colonia'
      Origin = 'COMYLEG.deta_cte.colonia'
      FixedChar = True
      Size = 40
    end
    object qcorreoemail: TStringField
      FieldName = 'email'
      Origin = 'COMYLEG.deta_cte.email'
      FixedChar = True
      Size = 50
    end
    object qcorreomunicipio: TStringField
      FieldName = 'municipio'
      Origin = 'COMYLEG.deta_cte.municipio'
      FixedChar = True
      Size = 50
    end
    object qcorreopais: TStringField
      FieldName = 'pais'
      Origin = 'COMYLEG.deta_cte.pais'
      FixedChar = True
    end
    object qcorreoemail2: TStringField
      FieldName = 'email2'
      Origin = 'COMYLEG.deta_cte.email2'
      FixedChar = True
      Size = 50
    end
    object qcorreoemail3: TStringField
      FieldName = 'email3'
      Origin = 'COMYLEG.deta_cte.email3'
      FixedChar = True
      Size = 50
    end
  end
  object DataSource60: TDataSource
    DataSet = qcorreo
    Left = 1744
    Top = 40
  end
  object qarchivos: TQuery
    DatabaseName = 'ventas'
    SQL.Strings = (
      'select *'
      'from archivos')
    Left = 1168
    Top = 152
    object qarchivosNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Origin = 'VENTAS."ARCHIVOS.DB".NOMBRE'
      Size = 40
    end
  end
  object DataSource61: TDataSource
    DataSet = qarchivos
    Left = 1200
    Top = 152
  end
  object Query3: TQuery
    DatabaseName = 'ventas'
    SQL.Strings = (
      'delete'
      'from archivos'
      '')
    Left = 1288
    Top = 552
  end
  object DataSource62: TDataSource
    DataSet = Query3
    Left = 1320
    Top = 552
  end
  object sat: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from sat')
    Left = 32
    Top = 104
    object satcer: TStringField
      FieldName = 'cer'
      Origin = 'COMYLEG.sat.cer'
      FixedChar = True
      Size = 40
    end
    object satkey: TStringField
      FieldName = 'key'
      Origin = 'COMYLEG.sat.key'
      FixedChar = True
      Size = 40
    end
    object satpass: TStringField
      FieldName = 'pass'
      Origin = 'COMYLEG.sat.pass'
      FixedChar = True
      Size = 40
    end
  end
  object DataSource63: TDataSource
    DataSet = sat
    Left = 64
    Top = 104
  end
  object qtipo_pago: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from rel_tipo_pago'
      'where cod_cli = :cod_cli')
    Left = 1368
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_cli'
        ParamType = ptInput
      end>
    object qtipo_pagocod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.rel_tipo_pago.cod_cli'
      FixedChar = True
      Size = 40
    end
    object qtipo_pagotipo_pago: TStringField
      FieldName = 'tipo_pago'
      Origin = 'COMYLEG.rel_tipo_pago.tipo_pago'
      FixedChar = True
      Size = 40
    end
    object qtipo_pagobanco: TStringField
      FieldName = 'banco'
      Origin = 'COMYLEG.rel_tipo_pago.banco'
      FixedChar = True
    end
    object qtipo_pagonum_cta: TStringField
      FieldName = 'num_cta'
      Origin = 'COMYLEG.rel_tipo_pago.num_cta'
      FixedChar = True
      Size = 4
    end
  end
  object DataSource64: TDataSource
    DataSet = qtipo_pago
    Left = 1400
    Top = 200
  end
  object qbustipo: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'SELECT *'
      'FROM REL_TIPO_PAGO'
      'WHERE COD_CLI = :cod_cli')
    Left = 728
    Top = 584
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_cli'
        ParamType = ptInput
      end>
    object qbustipocod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.rel_tipo_pago.cod_cli'
      FixedChar = True
      Size = 40
    end
    object qbustipotipo_pago: TStringField
      FieldName = 'tipo_pago'
      Origin = 'COMYLEG.rel_tipo_pago.tipo_pago'
      FixedChar = True
      Size = 40
    end
    object qbustipobanco: TStringField
      FieldName = 'banco'
      Origin = 'COMYLEG.rel_tipo_pago.banco'
      FixedChar = True
    end
    object qbustiponum_cta: TStringField
      FieldName = 'num_cta'
      Origin = 'COMYLEG.rel_tipo_pago.num_cta'
      FixedChar = True
      Size = 4
    end
  end
  object DataSource65: TDataSource
    DataSet = qbustipo
    Left = 760
    Top = 584
  end
  object tmp_pago: TTable
    DatabaseName = 'comyleg'
    TableName = 'tmp_pago'
    Left = 1664
    Top = 728
    object tmp_pagonum_doc: TStringField
      FieldName = 'num_doc'
      FixedChar = True
      Size = 40
    end
    object tmp_pagocod_cli: TStringField
      FieldName = 'cod_cli'
      FixedChar = True
      Size = 80
    end
    object tmp_pagototal_pago: TFloatField
      FieldName = 'total_pago'
    end
    object tmp_pagoiva: TFloatField
      FieldName = 'iva'
    end
    object tmp_pagofecha: TDateField
      FieldName = 'fecha'
    end
    object tmp_pagoformapago: TStringField
      FieldName = 'formapago'
      FixedChar = True
      Size = 2
    end
    object tmp_pagobanco: TStringField
      FieldName = 'banco'
      FixedChar = True
      Size = 30
    end
    object tmp_pagono_cheque: TFloatField
      FieldName = 'no_cheque'
    end
    object tmp_pagotipo_cheque: TStringField
      FieldName = 'tipo_cheque'
      FixedChar = True
      Size = 2
    end
    object tmp_pagoefectivo: TFloatField
      FieldName = 'efectivo'
    end
    object tmp_pagobonos: TFloatField
      FieldName = 'bonos'
    end
    object tmp_pagocheque: TFloatField
      FieldName = 'cheque'
    end
    object tmp_pagodolar: TFloatField
      FieldName = 'dolar'
    end
    object tmp_pagocheq_pref: TFloatField
      FieldName = 'cheq_pref'
    end
    object tmp_pagotipo_cli: TStringField
      FieldName = 'tipo_cli'
      FixedChar = True
      Size = 12
    end
    object tmp_pagocajera: TStringField
      FieldName = 'cajera'
      FixedChar = True
    end
    object tmp_pagobandera: TIntegerField
      FieldName = 'bandera'
    end
  end
  object DataSource66: TDataSource
    DataSet = tmp_pago
    Left = 1696
    Top = 728
  end
  object qsacainfo: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select b.*, a.*'
      'from inarfac a, inartrinv b'
      
        'where (a.num_emp = b.num_emp)and (a.num_doc = b.num_DOC) and a.n' +
        'um_emp ='#39'01'#39' AND'
      ' (a.num_doc = :num_doc)'
      'order by b.num_ent')
    Left = 664
    Top = 552
    ParamData = <
      item
        DataType = ftString
        Name = 'num_doc'
        ParamType = ptInput
      end>
    object qsacainfonum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inarfac.num_emp'
      FixedChar = True
      Size = 2
    end
    object qsacainfocod_art: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.inarfac.num_suc'
      FixedChar = True
      Size = 14
    end
    object qsacainfonum_suc: TStringField
      FieldName = 'num_suc'
      Origin = 'COMYLEG.inarfac.num_doc'
      FixedChar = True
      Size = 2
    end
    object qsacainfofech_doc: TDateField
      FieldName = 'fech_doc'
      Origin = 'COMYLEG.inarfac.cod_cli'
    end
    object qsacainfotip_doc: TStringField
      FieldName = 'tip_doc'
      Origin = 'COMYLEG.inarfac.raz_soc'
      FixedChar = True
      Size = 2
    end
    object qsacainfonum_doc: TStringField
      FieldName = 'num_doc'
      Origin = 'COMYLEG.inarfac.dom_cli'
      FixedChar = True
      Size = 10
    end
    object qsacainfocan_kgs: TFloatField
      FieldName = 'can_kgs'
      Origin = 'COMYLEG.inarfac.ciu_cli'
    end
    object qsacainfocan_caj: TFloatField
      FieldName = 'can_caj'
      Origin = 'COMYLEG.inarfac.est_cli'
    end
    object qsacainfocos_uni_kgs: TFloatField
      FieldName = 'cos_uni_kgs'
      Origin = 'COMYLEG.inarfac.emb_nom'
    end
    object qsacainfocos_uni_caj: TFloatField
      FieldName = 'cos_uni_caj'
      Origin = 'COMYLEG.inarfac.emb_dom'
    end
    object qsacainfocos_pro_kgs: TFloatField
      FieldName = 'cos_pro_kgs'
      Origin = 'COMYLEG.inarfac.emb_pob'
    end
    object qsacainfocos_pro_caj: TFloatField
      FieldName = 'cos_pro_caj'
      Origin = 'COMYLEG.inarfac.num_ped'
    end
    object qsacainfopre_vta_kgs: TFloatField
      FieldName = 'pre_vta_kgs'
      Origin = 'COMYLEG.inarfac.fech_ped'
    end
    object qsacainfopre_vta_caj: TFloatField
      FieldName = 'pre_vta_caj'
      Origin = 'COMYLEG.inarfac.num_ord'
    end
    object qsacainfodes_vta: TFloatField
      FieldName = 'des_vta'
      Origin = 'COMYLEG.inarfac.fech_emb'
    end
    object qsacainfofle_art: TFloatField
      FieldName = 'fle_art'
      Origin = 'COMYLEG.inarfac.con_cli'
    end
    object qsacainforen_art: TSmallintField
      FieldName = 'ren_art'
      Origin = 'COMYLEG.inarfac.ag_fac'
    end
    object qsacainfocod_pro: TStringField
      FieldName = 'cod_pro'
      Origin = 'COMYLEG.inarfac.imp_exe'
      FixedChar = True
      Size = 8
    end
    object qsacainfocod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.inarfac.imp_6'
      FixedChar = True
      Size = 8
    end
    object qsacainfonum_ent: TIntegerField
      FieldName = 'num_ent'
      Origin = 'COMYLEG.inarfac.imp_15'
    end
    object qsacainfofech_ent: TDateField
      FieldName = 'fech_ent'
      Origin = 'COMYLEG.inarfac.imp_20'
    end
    object qsacainfoiva_art: TFloatField
      FieldName = 'iva_art'
      Origin = 'COMYLEG.inarfac.des_exe'
    end
    object qsacainfonum_emp_1: TStringField
      FieldName = 'num_emp_1'
      Origin = 'COMYLEG.inarfac.des_6'
      FixedChar = True
      Size = 2
    end
    object qsacainfonum_suc_1: TStringField
      FieldName = 'num_suc_1'
      Origin = 'COMYLEG.inarfac.des_15'
      FixedChar = True
      Size = 2
    end
    object qsacainfonum_doc_1: TStringField
      FieldName = 'num_doc_1'
      Origin = 'COMYLEG.inarfac.des_20'
      FixedChar = True
      Size = 10
    end
    object qsacainfocod_cli_1: TStringField
      FieldName = 'cod_cli_1'
      Origin = 'COMYLEG.inarfac.iva_6'
      FixedChar = True
      Size = 8
    end
    object qsacainforaz_soc: TStringField
      FieldName = 'raz_soc'
      Origin = 'COMYLEG.inarfac.iva_15'
      FixedChar = True
      Size = 50
    end
    object qsacainfodom_cli: TStringField
      FieldName = 'dom_cli'
      Origin = 'COMYLEG.inarfac.iva_20'
      FixedChar = True
      Size = 60
    end
    object qsacainfociu_cli: TStringField
      FieldName = 'ciu_cli'
      Origin = 'COMYLEG.inarfac.cos_vta'
      FixedChar = True
    end
    object qsacainfoest_cli: TStringField
      FieldName = 'est_cli'
      Origin = 'COMYLEG.inarfac.flete'
      FixedChar = True
      Size = 10
    end
    object qsacainfoemb_nom: TStringField
      FieldName = 'emb_nom'
      Origin = 'COMYLEG.inarfac.iva_fle'
      FixedChar = True
      Size = 40
    end
    object qsacainfoemb_dom: TStringField
      FieldName = 'emb_dom'
      Origin = 'COMYLEG.inarfac.car_1'
      FixedChar = True
      Size = 40
    end
    object qsacainfoemb_pob: TStringField
      FieldName = 'emb_pob'
      Origin = 'COMYLEG.inarfac.iva_1'
      FixedChar = True
      Size = 30
    end
    object qsacainfonum_ped: TIntegerField
      FieldName = 'num_ped'
      Origin = 'COMYLEG.inarfac.car_2'
    end
    object qsacainfofech_ped: TDateField
      FieldName = 'fech_ped'
      Origin = 'COMYLEG.inarfac.iva_2'
    end
    object qsacainfonum_ord: TIntegerField
      FieldName = 'num_ord'
      Origin = 'COMYLEG.inarfac.fecha'
    end
    object qsacainfofech_emb: TDateField
      FieldName = 'fech_emb'
      Origin = 'COMYLEG.inarfac.reg_fed'
    end
    object qsacainfocon_cli: TStringField
      FieldName = 'con_cli'
      Origin = 'COMYLEG.inarfac.tip_fac'
      FixedChar = True
      Size = 1
    end
    object qsacainfoag_fac: TSmallintField
      FieldName = 'ag_fac'
      Origin = 'COMYLEG.inarfac.cajera'
    end
    object qsacainfoimp_exe: TFloatField
      FieldName = 'imp_exe'
      Origin = 'COMYLEG.inartrinv.num_emp'
    end
    object qsacainfoimp_6: TFloatField
      FieldName = 'imp_6'
      Origin = 'COMYLEG.inartrinv.cod_art'
    end
    object qsacainfoimp_15: TFloatField
      FieldName = 'imp_15'
      Origin = 'COMYLEG.inartrinv.num_suc'
    end
    object qsacainfoimp_20: TFloatField
      FieldName = 'imp_20'
      Origin = 'COMYLEG.inartrinv.fech_doc'
    end
    object qsacainfodes_exe: TFloatField
      FieldName = 'des_exe'
      Origin = 'COMYLEG.inartrinv.tip_doc'
    end
    object qsacainfodes_6: TFloatField
      FieldName = 'des_6'
      Origin = 'COMYLEG.inartrinv.num_doc'
    end
    object qsacainfodes_15: TFloatField
      FieldName = 'des_15'
      Origin = 'COMYLEG.inartrinv.can_kgs'
    end
    object qsacainfodes_20: TFloatField
      FieldName = 'des_20'
      Origin = 'COMYLEG.inartrinv.can_caj'
    end
    object qsacainfoiva_6: TFloatField
      FieldName = 'iva_6'
      Origin = 'COMYLEG.inartrinv.cos_uni_kgs'
    end
    object qsacainfoiva_15: TFloatField
      FieldName = 'iva_15'
      Origin = 'COMYLEG.inartrinv.cos_uni_caj'
    end
    object qsacainfoiva_20: TFloatField
      FieldName = 'iva_20'
      Origin = 'COMYLEG.inartrinv.cos_pro_kgs'
    end
    object qsacainfocos_vta: TFloatField
      FieldName = 'cos_vta'
      Origin = 'COMYLEG.inartrinv.cos_pro_caj'
    end
    object qsacainfoflete: TFloatField
      FieldName = 'flete'
      Origin = 'COMYLEG.inartrinv.pre_vta_kgs'
    end
    object qsacainfoiva_fle: TFloatField
      FieldName = 'iva_fle'
      Origin = 'COMYLEG.inartrinv.pre_vta_caj'
    end
    object qsacainfocar_1: TFloatField
      FieldName = 'car_1'
      Origin = 'COMYLEG.inartrinv.des_vta'
    end
    object qsacainfoiva_1: TFloatField
      FieldName = 'iva_1'
      Origin = 'COMYLEG.inartrinv.fle_art'
    end
    object qsacainfocar_2: TFloatField
      FieldName = 'car_2'
      Origin = 'COMYLEG.inartrinv.ren_art'
    end
    object qsacainfoiva_2: TFloatField
      FieldName = 'iva_2'
      Origin = 'COMYLEG.inartrinv.cod_pro'
    end
    object qsacainfofecha: TDateField
      FieldName = 'fecha'
      Origin = 'COMYLEG.inartrinv.cod_cli'
    end
    object qsacainforeg_fed: TStringField
      FieldName = 'reg_fed'
      Origin = 'COMYLEG.inartrinv.num_ent'
      FixedChar = True
    end
    object qsacainfotip_fac: TStringField
      FieldName = 'tip_fac'
      Origin = 'COMYLEG.inartrinv.fech_ent'
      FixedChar = True
      Size = 1
    end
    object qsacainfocajera: TStringField
      FieldName = 'cajera'
      Origin = 'COMYLEG.inartrinv.iva_art'
      FixedChar = True
      Size = 12
    end
  end
  object DataSource67: TDataSource
    DataSet = qsacainfo
    Left = 696
    Top = 552
  end
  object qartibus: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select a.*, B.TIP_ART, B.DES_aRT'
      'from inartrinv a, inarinv b'
      
        'where (A.NUM_EMP = B.NUM_EMP) AND (A.COD_ART = B.COD_ART) AND  A' +
        '.NUM_EMP ='#39'01'#39' and A.num_DOC = :NUM_DOC')
    Left = 664
    Top = 584
    ParamData = <
      item
        DataType = ftString
        Name = 'num_doc'
        ParamType = ptInput
      end>
    object qartibusnum_emp: TStringField
      FieldName = 'num_emp'
      FixedChar = True
      Size = 2
    end
    object qartibuscod_art: TStringField
      FieldName = 'cod_art'
      FixedChar = True
      Size = 14
    end
    object qartibusnum_suc: TStringField
      FieldName = 'num_suc'
      FixedChar = True
      Size = 2
    end
    object qartibusfech_doc: TDateField
      FieldName = 'fech_doc'
    end
    object qartibustip_doc: TStringField
      FieldName = 'tip_doc'
      FixedChar = True
      Size = 2
    end
    object qartibusnum_doc: TStringField
      FieldName = 'num_doc'
      FixedChar = True
      Size = 10
    end
    object qartibuscan_kgs: TFloatField
      FieldName = 'can_kgs'
    end
    object qartibuscan_caj: TFloatField
      FieldName = 'can_caj'
    end
    object qartibuscos_uni_kgs: TFloatField
      FieldName = 'cos_uni_kgs'
    end
    object qartibuscos_uni_caj: TFloatField
      FieldName = 'cos_uni_caj'
    end
    object qartibuscos_pro_kgs: TFloatField
      FieldName = 'cos_pro_kgs'
    end
    object qartibuscos_pro_caj: TFloatField
      FieldName = 'cos_pro_caj'
    end
    object qartibuspre_vta_kgs: TFloatField
      FieldName = 'pre_vta_kgs'
    end
    object qartibuspre_vta_caj: TFloatField
      FieldName = 'pre_vta_caj'
    end
    object qartibusdes_vta: TFloatField
      FieldName = 'des_vta'
    end
    object qartibusfle_art: TFloatField
      FieldName = 'fle_art'
    end
    object qartibusren_art: TSmallintField
      FieldName = 'ren_art'
    end
    object qartibuscod_pro: TStringField
      FieldName = 'cod_pro'
      FixedChar = True
      Size = 8
    end
    object qartibuscod_cli: TStringField
      FieldName = 'cod_cli'
      FixedChar = True
      Size = 8
    end
    object qartibusnum_ent: TIntegerField
      FieldName = 'num_ent'
    end
    object qartibusfech_ent: TDateField
      FieldName = 'fech_ent'
    end
    object qartibusiva_art: TFloatField
      FieldName = 'iva_art'
    end
    object qartibustip_art: TStringField
      FieldName = 'tip_art'
      FixedChar = True
      Size = 1
    end
    object qartibusdes_art: TStringField
      FieldName = 'des_art'
      FixedChar = True
      Size = 40
    end
  end
  object DataSource68: TDataSource
    DataSet = qartibus
    Left = 696
    Top = 584
  end
  object RvSystem2: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    DefaultDest = rdPrinter
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 640
    Top = 520
  end
  object RvDataSetConnection3: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = QEMPRESA
    Left = 672
    Top = 520
  end
  object RvProject2: TRvProject
    Engine = RvSystem2
    ProjectFile = 'C:\delphi\reportes\Factura Electronica\FacturaORI.rav'
    Left = 704
    Top = 520
  end
  object DataSource69: TDataSource
    DataSet = qtotkil
    Left = 1688
    Top = 136
  end
  object qtotkil: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select sum(cajas), sum(kilos)'
      'from ventas'
      'where folio = :folio and num_emp = :num_Emp'
      ' ')
    Left = 1648
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_Emp'
        ParamType = ptInput
      end>
    object qtotkilsum: TFloatField
      FieldName = '(sum)'
      Origin = 'COMYLEG.ventas.cajas'
    end
    object qtotkilsum_1: TFloatField
      FieldName = '(sum)_1'
      Origin = 'COMYLEG.ventas.kilos'
    end
  end
  object qsorinum: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from cod_sori'
      'where colesa = :colesa')
    Left = 1656
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'colesa'
        ParamType = ptInput
      end>
    object qsorinumsoriana: TIntegerField
      FieldName = 'soriana'
      Origin = 'COMYLEG.cod_sori.soriana'
    end
    object qsorinumcolesa: TStringField
      FieldName = 'colesa'
      Origin = 'COMYLEG.cod_sori.colesa'
      FixedChar = True
      Size = 40
    end
  end
  object DataSource70: TDataSource
    DataSet = qsorinum
    Left = 1688
    Top = 168
  end
  object temp: TTable
    DatabaseName = 'ventas'
    TableName = 'tmp_imprime.db'
    Left = 360
    Top = 496
    object StringField14: TStringField
      FieldName = 'Codigo'
    end
    object FloatField10: TFloatField
      FieldName = 'Cantidad'
    end
    object StringField15: TStringField
      FieldName = 'Descripcion'
      Size = 40
    end
    object FloatField11: TFloatField
      FieldName = 'Pre_uni'
    end
    object FloatField12: TFloatField
      FieldName = 'Importe'
    end
  end
  object DataSource71: TDataSource
    DataSet = temp
    Left = 392
    Top = 496
  end
  object temp_fact: TTable
    DatabaseName = 'comyleg'
    TableName = 'temp_impre'
    Left = 576
    Top = 496
    object temp_factbande: TIntegerField
      FieldName = 'bande'
    end
    object temp_factfactura: TStringField
      FieldName = 'factura'
      FixedChar = True
      Size = 40
    end
    object temp_factcajera: TStringField
      FieldName = 'cajera'
      FixedChar = True
      Size = 40
    end
  end
  object DataSource72: TDataSource
    DataSet = temp_fact
    Left = 608
    Top = 496
  end
  object qborra_tmpfa: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'delete'
      'from temp_impre'
      'where factura = :num_doc'
      '')
    Left = 1712
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'num_doc'
        ParamType = ptInput
      end>
    object StringField16: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.copiascli.cod_cli'
      FixedChar = True
    end
  end
  object DataSource73: TDataSource
    DataSet = qborra_tmpfa
    Left = 1744
    Top = 104
  end
  object sinsertacot4: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'inserta_corte_caja'
    Left = 1584
    Top = 200
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
      end
      item
        DataType = ftUnknown
        Name = '14'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '15'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = '16'
        ParamType = ptInput
      end>
  end
  object DataSource74: TDataSource
    DataSet = sinsertacot4
    Left = 1616
    Top = 200
  end
  object qtotventas: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select sum(total)'
      'FROM VENTAS'
      'WHERE FOLIO = :FOLIO AND CODIGO ='#39'A155CH'#39'  AND NUM_EMP ='#39'01'#39
      ''
      '')
    Left = 1584
    Top = 360
    ParamData = <
      item
        DataType = ftString
        Name = 'FOLIO'
        ParamType = ptInput
      end>
    object qtotventassum: TFloatField
      FieldName = '(sum)'
      Origin = 'COMYLEG.ventas.total'
    end
  end
  object DataSource75: TDataSource
    DataSet = qtotventas
    Left = 1616
    Top = 360
  end
  object qventas1: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'FROM VENTAS'
      'WHERE FOLIO = :FOLIO AND CODIGO='#39'A155CH'#39'  AND NUM_EMP = :NUM_EMP'
      '')
    Left = 1584
    Top = 488
    ParamData = <
      item
        DataType = ftString
        Name = 'FOLIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUM_EMP'
        ParamType = ptInput
      end>
    object qventas1folio: TIntegerField
      FieldName = 'folio'
      Origin = 'COMYLEG.ventas.folio'
    end
    object qventas1descripcion: TStringField
      FieldName = 'descripcion'
      Origin = 'COMYLEG.ventas.descripcion'
      FixedChar = True
      Size = 50
    end
    object qventas1codigo: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.ventas.codigo'
      FixedChar = True
      Size = 14
    end
    object qventas1cajas: TFloatField
      FieldName = 'cajas'
      Origin = 'COMYLEG.ventas.cajas'
    end
    object qventas1kilos: TFloatField
      FieldName = 'kilos'
      Origin = 'COMYLEG.ventas.kilos'
    end
    object qventas1precio: TFloatField
      FieldName = 'precio'
      Origin = 'COMYLEG.ventas.precio'
    end
    object qventas1total: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.ventas.total'
    end
    object qventas1nombre: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.ventas.nombre'
      FixedChar = True
      Size = 50
    end
    object qventas1iva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.ventas.iva'
    end
    object qventas1cos_pro: TFloatField
      FieldName = 'cos_pro'
      Origin = 'COMYLEG.ventas.cos_pro'
    end
    object qventas1totiva: TFloatField
      FieldName = 'totiva'
      Origin = 'COMYLEG.ventas.totiva'
    end
    object qventas1renglon: TSmallintField
      FieldName = 'renglon'
      Origin = 'COMYLEG.ventas.renglon'
    end
    object qventas1pagado: TSmallintField
      FieldName = 'pagado'
      Origin = 'COMYLEG.ventas.pagado'
    end
    object qventas1rfc: TStringField
      FieldName = 'rfc'
      Origin = 'COMYLEG.ventas.rfc'
      FixedChar = True
    end
    object qventas1tipo: TStringField
      FieldName = 'tipo'
      Origin = 'COMYLEG.ventas.tipo'
      FixedChar = True
      Size = 2
    end
    object qventas1lineaven: TStringField
      FieldName = 'lineaven'
      Origin = 'COMYLEG.ventas.lineaven'
      FixedChar = True
    end
    object qventas1descto: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.ventas.descto'
    end
    object qventas1pedido: TStringField
      FieldName = 'pedido'
      Origin = 'COMYLEG.ventas.pedido'
      FixedChar = True
    end
    object qventas1observacion: TStringField
      FieldName = 'observacion'
      Origin = 'COMYLEG.ventas.observacion'
      FixedChar = True
    end
    object qventas1sucursal: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.ventas.sucursal'
      FixedChar = True
    end
    object qventas1num_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.ventas.num_emp'
      FixedChar = True
      Size = 2
    end
  end
  object DataSource76: TDataSource
    DataSet = qventas1
    Left = 1616
    Top = 488
  end
  object qppal1: TQuery
    DatabaseName = 'comyleg'
    SessionName = 'Default'
    SQL.Strings = (
      'select *'
      'from ventas'
      'where folio = :folio and nombre = :nombre AND NUM_EMP = :NUM_EMP'
      'AND (CODIGO = '#39'A155CH'#39')'
      'order by codigo')
    Left = 1720
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NUM_EMP'
        ParamType = ptUnknown
      end>
    object qppal1folio: TIntegerField
      FieldName = 'folio'
      Origin = 'COMYLEG.ventas.folio'
    end
    object qppal1descripcion: TStringField
      FieldName = 'descripcion'
      Origin = 'COMYLEG.ventas.descripcion'
      FixedChar = True
      Size = 50
    end
    object qppal1codigo: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.ventas.codigo'
      FixedChar = True
      Size = 14
    end
    object qppal1cajas: TFloatField
      FieldName = 'cajas'
      Origin = 'COMYLEG.ventas.cajas'
    end
    object qppal1kilos: TFloatField
      FieldName = 'kilos'
      Origin = 'COMYLEG.ventas.kilos'
    end
    object qppal1precio: TFloatField
      FieldName = 'precio'
      Origin = 'COMYLEG.ventas.precio'
    end
    object qppal1total: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.ventas.total'
    end
    object qppal1nombre: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.ventas.nombre'
      FixedChar = True
      Size = 50
    end
    object qppal1iva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.ventas.iva'
    end
    object qppal1cos_pro: TFloatField
      FieldName = 'cos_pro'
      Origin = 'COMYLEG.ventas.cos_pro'
    end
    object qppal1totiva: TFloatField
      FieldName = 'totiva'
      Origin = 'COMYLEG.ventas.totiva'
    end
    object qppal1renglon: TSmallintField
      FieldName = 'renglon'
      Origin = 'COMYLEG.ventas.renglon'
    end
    object qppal1pagado: TSmallintField
      FieldName = 'pagado'
      Origin = 'COMYLEG.ventas.pagado'
    end
    object qppal1rfc: TStringField
      FieldName = 'rfc'
      Origin = 'COMYLEG.ventas.rfc'
      FixedChar = True
    end
    object qppal1tipo: TStringField
      FieldName = 'tipo'
      Origin = 'COMYLEG.ventas.tipo'
      FixedChar = True
      Size = 2
    end
    object qppal1lineaven: TStringField
      FieldName = 'lineaven'
      Origin = 'COMYLEG.ventas.lineaven'
      FixedChar = True
    end
    object qppal1descto: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.ventas.descto'
    end
    object qppal1pedido: TStringField
      FieldName = 'pedido'
      Origin = 'COMYLEG.ventas.pedido'
      FixedChar = True
    end
    object qppal1observacion: TStringField
      FieldName = 'observacion'
      Origin = 'COMYLEG.ventas.observacion'
      FixedChar = True
    end
    object qppal1sucursal: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.ventas.sucursal'
      FixedChar = True
    end
    object qppal1num_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.ventas.num_emp'
      FixedChar = True
      Size = 2
    end
  end
  object DataSource77: TDataSource
    DataSet = qppal1
    Left = 1752
    Top = 272
  end
  object DataSource78: TDataSource
    DataSet = QVENTAS2
    Left = 1616
    Top = 424
  end
  object QVENTAS2: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'FROM VENTAS'
      'WHERE FOLIO = :FOLIO AND NUM_EMP = :num_emp'
      'AND CODIGO <> '#39'A155CH'#39
      '')
    Left = 1584
    Top = 424
    ParamData = <
      item
        DataType = ftString
        Name = 'FOLIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
    object IntegerField2: TIntegerField
      FieldName = 'folio'
      Origin = 'COMYLEG.ventas.folio'
    end
    object StringField17: TStringField
      FieldName = 'descripcion'
      Origin = 'COMYLEG.ventas.descripcion'
      FixedChar = True
      Size = 50
    end
    object StringField18: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.ventas.codigo'
      FixedChar = True
      Size = 14
    end
    object FloatField13: TFloatField
      FieldName = 'cajas'
      Origin = 'COMYLEG.ventas.cajas'
    end
    object FloatField14: TFloatField
      FieldName = 'kilos'
      Origin = 'COMYLEG.ventas.kilos'
    end
    object FloatField15: TFloatField
      FieldName = 'precio'
      Origin = 'COMYLEG.ventas.precio'
    end
    object FloatField16: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.ventas.total'
    end
    object StringField19: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.ventas.nombre'
      FixedChar = True
      Size = 50
    end
    object FloatField17: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.ventas.iva'
    end
    object FloatField18: TFloatField
      FieldName = 'cos_pro'
      Origin = 'COMYLEG.ventas.cos_pro'
    end
    object FloatField19: TFloatField
      FieldName = 'totiva'
      Origin = 'COMYLEG.ventas.totiva'
    end
    object SmallintField3: TSmallintField
      FieldName = 'renglon'
      Origin = 'COMYLEG.ventas.renglon'
    end
    object SmallintField4: TSmallintField
      FieldName = 'pagado'
      Origin = 'COMYLEG.ventas.pagado'
    end
    object StringField20: TStringField
      FieldName = 'rfc'
      Origin = 'COMYLEG.ventas.rfc'
      FixedChar = True
    end
    object StringField21: TStringField
      FieldName = 'tipo'
      Origin = 'COMYLEG.ventas.tipo'
      FixedChar = True
      Size = 2
    end
    object StringField22: TStringField
      FieldName = 'lineaven'
      Origin = 'COMYLEG.ventas.lineaven'
      FixedChar = True
    end
    object FloatField20: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.ventas.descto'
    end
    object StringField23: TStringField
      FieldName = 'pedido'
      Origin = 'COMYLEG.ventas.pedido'
      FixedChar = True
    end
    object StringField24: TStringField
      FieldName = 'observacion'
      Origin = 'COMYLEG.ventas.observacion'
      FixedChar = True
    end
    object StringField25: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.ventas.sucursal'
      FixedChar = True
    end
    object StringField26: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.ventas.num_emp'
      FixedChar = True
      Size = 2
    end
  end
  object DataSource79: TDataSource
    DataSet = qventas3
    Left = 320
    Top = 552
  end
  object qventas3: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'FROM VENTAS'
      'WHERE FOLIO = :FOLIO  ')
    Left = 288
    Top = 552
    ParamData = <
      item
        DataType = ftString
        Name = 'FOLIO'
        ParamType = ptInput
      end>
    object IntegerField3: TIntegerField
      FieldName = 'folio'
      Origin = 'COMYLEG.ventas.folio'
    end
    object StringField27: TStringField
      FieldName = 'descripcion'
      Origin = 'COMYLEG.ventas.descripcion'
      FixedChar = True
      Size = 50
    end
    object StringField28: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.ventas.codigo'
      FixedChar = True
      Size = 14
    end
    object FloatField21: TFloatField
      FieldName = 'cajas'
      Origin = 'COMYLEG.ventas.cajas'
    end
    object FloatField22: TFloatField
      FieldName = 'kilos'
      Origin = 'COMYLEG.ventas.kilos'
    end
    object FloatField23: TFloatField
      FieldName = 'precio'
      Origin = 'COMYLEG.ventas.precio'
    end
    object FloatField24: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.ventas.total'
    end
    object StringField29: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.ventas.nombre'
      FixedChar = True
      Size = 50
    end
    object FloatField25: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.ventas.iva'
    end
    object FloatField26: TFloatField
      FieldName = 'cos_pro'
      Origin = 'COMYLEG.ventas.cos_pro'
    end
    object FloatField27: TFloatField
      FieldName = 'totiva'
      Origin = 'COMYLEG.ventas.totiva'
    end
    object SmallintField5: TSmallintField
      FieldName = 'renglon'
      Origin = 'COMYLEG.ventas.renglon'
    end
    object SmallintField6: TSmallintField
      FieldName = 'pagado'
      Origin = 'COMYLEG.ventas.pagado'
    end
    object StringField30: TStringField
      FieldName = 'rfc'
      Origin = 'COMYLEG.ventas.rfc'
      FixedChar = True
    end
    object StringField31: TStringField
      FieldName = 'tipo'
      Origin = 'COMYLEG.ventas.tipo'
      FixedChar = True
      Size = 2
    end
    object StringField32: TStringField
      FieldName = 'lineaven'
      Origin = 'COMYLEG.ventas.lineaven'
      FixedChar = True
    end
    object FloatField28: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.ventas.descto'
    end
    object StringField33: TStringField
      FieldName = 'pedido'
      Origin = 'COMYLEG.ventas.pedido'
      FixedChar = True
    end
    object StringField34: TStringField
      FieldName = 'observacion'
      Origin = 'COMYLEG.ventas.observacion'
      FixedChar = True
    end
    object StringField35: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.ventas.sucursal'
      FixedChar = True
    end
    object StringField36: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.ventas.num_emp'
      FixedChar = True
      Size = 2
    end
  end
  object DataSource80: TDataSource
    DataSet = QPPALPA
    Left = 1688
    Top = 424
  end
  object QPPALPA: TQuery
    DatabaseName = 'comyleg'
    SessionName = 'Default'
    SQL.Strings = (
      'select *'
      'from ventas'
      'where folio = :folio and nombre = :nombre AND NUM_EMP= :NUM_EMP'
      'order by codigo')
    Left = 1656
    Top = 424
    ParamData = <
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUM_EMP'
        ParamType = ptInput
      end>
    object IntegerField4: TIntegerField
      FieldName = 'folio'
      Origin = 'COMYLEG.ventas.folio'
    end
    object StringField37: TStringField
      FieldName = 'descripcion'
      Origin = 'COMYLEG.ventas.descripcion'
      FixedChar = True
      Size = 50
    end
    object StringField38: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.ventas.codigo'
      FixedChar = True
      Size = 14
    end
    object FloatField29: TFloatField
      FieldName = 'cajas'
      Origin = 'COMYLEG.ventas.cajas'
    end
    object FloatField30: TFloatField
      FieldName = 'kilos'
      Origin = 'COMYLEG.ventas.kilos'
    end
    object FloatField31: TFloatField
      FieldName = 'precio'
      Origin = 'COMYLEG.ventas.precio'
    end
    object FloatField32: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.ventas.total'
    end
    object StringField39: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.ventas.nombre'
      FixedChar = True
      Size = 50
    end
    object FloatField33: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.ventas.iva'
    end
    object FloatField34: TFloatField
      FieldName = 'cos_pro'
      Origin = 'COMYLEG.ventas.cos_pro'
    end
    object FloatField35: TFloatField
      FieldName = 'totiva'
      Origin = 'COMYLEG.ventas.totiva'
    end
    object SmallintField7: TSmallintField
      FieldName = 'renglon'
      Origin = 'COMYLEG.ventas.renglon'
    end
    object SmallintField8: TSmallintField
      FieldName = 'pagado'
      Origin = 'COMYLEG.ventas.pagado'
    end
    object StringField40: TStringField
      FieldName = 'rfc'
      Origin = 'COMYLEG.ventas.rfc'
      FixedChar = True
    end
    object StringField41: TStringField
      FieldName = 'tipo'
      Origin = 'COMYLEG.ventas.tipo'
      FixedChar = True
      Size = 2
    end
    object StringField42: TStringField
      FieldName = 'lineaven'
      Origin = 'COMYLEG.ventas.lineaven'
      FixedChar = True
    end
    object FloatField36: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.ventas.descto'
    end
    object StringField43: TStringField
      FieldName = 'pedido'
      Origin = 'COMYLEG.ventas.pedido'
      FixedChar = True
      Size = 2
    end
    object StringField44: TStringField
      FieldName = 'observacion'
      Origin = 'COMYLEG.ventas.observacion'
      FixedChar = True
    end
    object StringField45: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.ventas.sucursal'
      FixedChar = True
    end
    object StringField46: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.ventas.num_emp'
      FixedChar = True
      Size = 2
    end
  end
  object conent: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from consendiv'
      'where num_emp = :num_emp')
    Left = 1056
    Top = 496
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
    Left = 1088
    Top = 496
  end
  object consal: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from conssadiv'
      'where num_emp = :num_emp')
    Left = 1056
    Top = 528
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
    Left = 1088
    Top = 528
  end
  object StoredProc4: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'inserta_entdiv'
    Left = 1056
    Top = 568
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
    Left = 1088
    Top = 568
  end
  object StoredProc5: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'inserta_tr_entdiv'
    Left = 1056
    Top = 600
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
    Left = 1088
    Top = 600
  end
  object qbuscod: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarinv'
      
        'where num_emp = :num_emp and lin_ven <> '#39'0'#39' and cod_art = :cod_a' +
        'rt')
    Left = 1128
    Top = 496
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
    Left = 1160
    Top = 496
  end
  object QUPENT: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'UPDATE CONSENDIV'
      'SET NUM_ENT = :NUM_ENT'
      'WHERE NUM_EMP = :NUM_EMP')
    Left = 1128
    Top = 528
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
  object DataSource86: TDataSource
    DataSet = QUPENT
    Left = 1160
    Top = 528
  end
  object Qactu: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update consSADIV'
      'set num_SAL = :num_ent'
      'where num_emp = :num_emp')
    Left = 1208
    Top = 616
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
    Left = 1240
    Top = 616
  end
  object DataSource89: TDataSource
    DataSet = StoredProc6
    Left = 1168
    Top = 568
  end
  object DataSource90: TDataSource
    DataSet = StoredProc7
    Left = 1168
    Top = 600
  end
  object StoredProc6: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'inserta_saldiv'
    Left = 1136
    Top = 568
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
  object StoredProc7: TStoredProc
    DatabaseName = 'comyleg'
    StoredProcName = 'inserta_tr_saldiv'
    Left = 1136
    Top = 600
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
  object qhora: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'insert into inarhora(num_doc, hora)'
      'values (:factu, :hora)')
    Left = 1712
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'factu'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'hora'
        ParamType = ptInput
      end>
    object StringField58: TStringField
      FieldName = 'serie'
      Origin = 'COMYLEG.folios.serie'
      FixedChar = True
      Size = 15
    end
    object IntegerField5: TIntegerField
      FieldName = 'folio_final'
      Origin = 'COMYLEG.folios.folio_final'
    end
    object IntegerField6: TIntegerField
      FieldName = 'ano_aproba'
      Origin = 'COMYLEG.folios.ano_aproba'
    end
    object IntegerField7: TIntegerField
      FieldName = 'num_aproba'
      Origin = 'COMYLEG.folios.num_aproba'
    end
    object StringField59: TStringField
      FieldName = 'cajera'
      Origin = 'COMYLEG.folios.cajera'
      FixedChar = True
      Size = 25
    end
    object IntegerField8: TIntegerField
      FieldName = 'folio_inicio'
      Origin = 'COMYLEG.folios.folio_inicio'
    end
  end
  object DataSource87: TDataSource
    DataSet = qhora
    Left = 1744
    Top = 72
  end
  object qguardau: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'insert into uuid(num_doc, uuid)'
      'values (:num_doc, :uuid)')
    Left = 1712
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'num_doc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'uuid'
        ParamType = ptInput
      end>
    object StringField60: TStringField
      FieldName = 'serie'
      Origin = 'COMYLEG.folios.serie'
      FixedChar = True
      Size = 15
    end
    object IntegerField9: TIntegerField
      FieldName = 'folio_final'
      Origin = 'COMYLEG.folios.folio_final'
    end
    object IntegerField10: TIntegerField
      FieldName = 'ano_aproba'
      Origin = 'COMYLEG.folios.ano_aproba'
    end
    object IntegerField11: TIntegerField
      FieldName = 'num_aproba'
      Origin = 'COMYLEG.folios.num_aproba'
    end
    object StringField61: TStringField
      FieldName = 'cajera'
      Origin = 'COMYLEG.folios.cajera'
      FixedChar = True
      Size = 25
    end
    object IntegerField12: TIntegerField
      FieldName = 'folio_inicio'
      Origin = 'COMYLEG.folios.folio_inicio'
    end
  end
  object DataSource91: TDataSource
    DataSet = qguardau
    Left = 1744
    Top = 8
  end
  object qbustipago: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from rel_tipo_pago'
      'WHERE COD_CLI= :cod_cli')
    Left = 736
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_cli'
        ParamType = ptInput
      end>
    object qbustipagocod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.rel_tipo_pago.cod_cli'
      FixedChar = True
      Size = 40
    end
    object qbustipagotipo_pago: TStringField
      FieldName = 'tipo_pago'
      Origin = 'COMYLEG.rel_tipo_pago.tipo_pago'
      FixedChar = True
      Size = 40
    end
    object qbustipagobanco: TStringField
      FieldName = 'banco'
      Origin = 'COMYLEG.rel_tipo_pago.banco'
      FixedChar = True
    end
    object qbustipagonum_cta: TStringField
      FieldName = 'num_cta'
      Origin = 'COMYLEG.rel_tipo_pago.num_cta'
      FixedChar = True
      Size = 4
    end
  end
  object DataSource92: TDataSource
    DataSet = qbustipago
    Left = 768
    Top = 192
  end
  object qieps: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from ieps'
      'where codigo = :codigo'
      '')
    Left = 1440
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptInput
      end>
    object qiepscodigo: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.ieps.codigo'
      FixedChar = True
      Size = 40
    end
  end
  object DataSource93: TDataSource
    DataSet = qieps
    Left = 1472
    Top = 8
  end
  object iepsinarcot: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update inarcot'
      'set iva_6 = :iva_ieps, imp_6 = :ieps'
      'where num_doc = :folio'
      '')
    Left = 1584
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'iva_ieps'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ieps'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end>
    object StringField62: TStringField
      FieldName = 'serie'
      Origin = 'COMYLEG.folios.serie'
      FixedChar = True
      Size = 15
    end
    object IntegerField13: TIntegerField
      FieldName = 'folio_final'
      Origin = 'COMYLEG.folios.folio_final'
    end
    object IntegerField14: TIntegerField
      FieldName = 'ano_aproba'
      Origin = 'COMYLEG.folios.ano_aproba'
    end
    object IntegerField15: TIntegerField
      FieldName = 'num_aproba'
      Origin = 'COMYLEG.folios.num_aproba'
    end
    object StringField63: TStringField
      FieldName = 'cajera'
      Origin = 'COMYLEG.folios.cajera'
      FixedChar = True
      Size = 25
    end
    object IntegerField16: TIntegerField
      FieldName = 'folio_inicio'
      Origin = 'COMYLEG.folios.folio_inicio'
    end
  end
  object DataSource94: TDataSource
    DataSet = iepsinarcot
    Left = 1616
    Top = 136
  end
  object vtasieps: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'insert into ieps_vtas (folio, codigo, totieps, renglon)'
      'values (:folio, :codigo, :totieps, :renglon)')
    Left = 1448
    Top = 424
    ParamData = <
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
    Left = 1480
    Top = 424
  end
  object iepsinarcot1: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'insert into ieps_inarcot1(num_doc, cod_art, ieps, renglon)'
      'values (:num_doc, :cod_art, :ieps, :ren_art)'
      '')
    Left = 1584
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'num_doc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cod_art'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ieps'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ren_Art'
        ParamType = ptInput
      end>
    object StringField66: TStringField
      FieldName = 'serie'
      Origin = 'COMYLEG.folios.serie'
      FixedChar = True
      Size = 15
    end
    object IntegerField21: TIntegerField
      FieldName = 'folio_final'
      Origin = 'COMYLEG.folios.folio_final'
    end
    object IntegerField22: TIntegerField
      FieldName = 'ano_aproba'
      Origin = 'COMYLEG.folios.ano_aproba'
    end
    object IntegerField23: TIntegerField
      FieldName = 'num_aproba'
      Origin = 'COMYLEG.folios.num_aproba'
    end
    object StringField67: TStringField
      FieldName = 'cajera'
      Origin = 'COMYLEG.folios.cajera'
      FixedChar = True
      Size = 25
    end
    object IntegerField24: TIntegerField
      FieldName = 'folio_inicio'
      Origin = 'COMYLEG.folios.folio_inicio'
    end
  end
  object DataSource96: TDataSource
    DataSet = iepsinarcot1
    Left = 1616
    Top = 168
  end
  object DataSource97: TDataSource
    DataSet = IEPSBORRA
    Left = 1552
    Top = 168
  end
  object IEPSBORRA: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'DELETE'
      'FROM ieps_vtas'
      'WHERE FOLIO = :FOLIO AND CODIGO = :CODIGO AND RENGLON = :REN')
    Left = 1520
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'FOLIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'REN'
        ParamType = ptInput
      end>
  end
  object qvtasieps: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from ieps_vtas'
      'where folio = :folio AND renglon = :renglon')
    Left = 1520
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'renglon'
        ParamType = ptInput
      end>
    object qvtasiepsfolio: TStringField
      FieldName = 'folio'
      Origin = 'COMYLEG.ieps_vtas.folio'
      FixedChar = True
    end
    object qvtasiepscodigo: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.ieps_vtas.codigo'
      FixedChar = True
    end
    object qvtasiepstotieps: TFloatField
      FieldName = 'totieps'
      Origin = 'COMYLEG.ieps_vtas.totieps'
    end
    object qvtasiepsrenglon: TIntegerField
      FieldName = 'renglon'
      Origin = 'COMYLEG.ieps_vtas.renglon'
    end
  end
  object DataSource98: TDataSource
    DataSet = qvtasieps
    Left = 1552
    Top = 136
  end
  object busiepcot: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'FROM ieps_vtas'
      'WHERE codigo = :cod_Art AND  renglon = :renglon')
    Left = 1584
    Top = 456
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_Art'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'renglon'
        ParamType = ptInput
      end>
    object busiepcotfolio: TStringField
      FieldName = 'folio'
      Origin = 'COMYLEG.ieps_vtas.folio'
      FixedChar = True
    end
    object busiepcotcodigo: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.ieps_vtas.codigo'
      FixedChar = True
    end
    object busiepcottotieps: TFloatField
      FieldName = 'totieps'
      Origin = 'COMYLEG.ieps_vtas.totieps'
    end
    object busiepcotrenglon: TIntegerField
      FieldName = 'renglon'
      Origin = 'COMYLEG.ieps_vtas.renglon'
    end
  end
  object DataSource99: TDataSource
    DataSet = busiepcot
    Left = 1616
    Top = 456
  end
  object qusocfdi: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from uso_ctes_cfdi'
      'where cod_cli = :COD_CLI')
    Left = 1368
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_CLI'
        ParamType = ptInput
      end>
    object qusocfdicod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.uso_ctes_cfdi.cod_cli'
      FixedChar = True
      Size = 30
    end
    object qusocfdiuso: TStringField
      FieldName = 'uso'
      Origin = 'COMYLEG.uso_ctes_cfdi.uso'
      FixedChar = True
      Size = 5
    end
    object qusocfdiuso_cfdi: TStringField
      FieldName = 'uso_cfdi'
      Origin = 'COMYLEG.uso_ctes_cfdi.uso_cfdi'
      FixedChar = True
      Size = 100
    end
  end
  object DataSource100: TDataSource
    DataSet = qusocfdi
    Left = 1392
    Top = 168
  end
  object qbusat: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from cod_sat'
      'where cod_colesa  = :cod_colesa')
    Left = 1440
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_colesa'
        ParamType = ptInput
      end>
    object qbusatcod_colesa: TStringField
      FieldName = 'cod_colesa'
      Origin = 'COMYLEG.cod_sat.cod_colesa'
      FixedChar = True
      Size = 10
    end
    object qbusatcod_sat: TStringField
      FieldName = 'cod_sat'
      Origin = 'COMYLEG.cod_sat.cod_sat'
      FixedChar = True
    end
  end
  object DataSource101: TDataSource
    DataSet = qbusat
    Left = 1472
    Top = 40
  end
  object upfacieps: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update inarfac'
      'set iva_6 = :ieps , imp_6 = :totieps'
      'where num_doc = :num_doc and num_emp = :num_emp')
    Left = 1648
    Top = 8
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
    Left = 1680
    Top = 8
  end
  object QIEPSITO: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from IEPS_VTAS'
      
        'where FOLIO = :FOLIO AND CODIGO = :CODIGO AND RENGLON = :RENGLON' +
        ' ')
    Left = 1720
    Top = 240
    ParamData = <
      item
        DataType = ftString
        Name = 'FOLIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RENGLON'
        ParamType = ptInput
      end>
    object QIEPSITOfolio: TStringField
      FieldName = 'folio'
      Origin = 'COMYLEG.ieps_vtas.folio'
      FixedChar = True
    end
    object QIEPSITOcodigo: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.ieps_vtas.codigo'
      FixedChar = True
    end
    object QIEPSITOtotieps: TFloatField
      FieldName = 'totieps'
      Origin = 'COMYLEG.ieps_vtas.totieps'
    end
    object QIEPSITOrenglon: TIntegerField
      FieldName = 'renglon'
      Origin = 'COMYLEG.ieps_vtas.renglon'
    end
  end
  object DataSource103: TDataSource
    DataSet = QIEPSITO
    Left = 1752
    Top = 240
  end
  object ins_ieps: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update inarpvt'
      'set iva_6 = :iva_6, imp_6 = :imp_6'
      'where num_doc = :num_doc AND NUM_EMP ='#39'01'#39
      '')
    Left = 1584
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'iva_6'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'imp_6'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_doc'
        ParamType = ptInput
      end>
  end
  object DataSource104: TDataSource
    DataSet = ins_ieps
    Left = 1616
    Top = 104
  end
  object iepstrcl: TTable
    DatabaseName = 'comyleg'
    TableName = 'iepstrcl'
    Left = 1648
    Top = 40
    object iepstrclnum_emp: TStringField
      FieldName = 'num_emp'
      FixedChar = True
      Size = 2
    end
    object iepstrclnum_doc: TStringField
      FieldName = 'num_doc'
      FixedChar = True
      Size = 30
    end
    object iepstrclieps: TFloatField
      FieldName = 'ieps'
    end
    object iepstrclsal_ieps: TFloatField
      FieldName = 'sal_ieps'
    end
  end
  object DataSource105: TDataSource
    DataSet = iepstrcl
    Left = 1680
    Top = 40
  end
  object qtotieps: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'UPDATE INARTRCL'
      'SET IMPORTE = :IMPORTE, SAL_FAC = :IMPORTE'
      'WHERE NUM_DOCTO  = :num_doc and num_emp = :num_emp')
    Left = 1648
    Top = 72
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
        Name = 'num_doc'
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
    Left = 1680
    Top = 72
  end
  object qtotcl: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      ' select *'
      '  from inartrcl'
      '  where num_docto = :num_doc and num_emp = :num_emp'
      '')
    Left = 8
    Top = 560
    ParamData = <
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
    object qtotclnum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inartrcl.num_emp'
      FixedChar = True
      Size = 2
    end
    object qtotclnum_suc: TStringField
      FieldName = 'num_suc'
      Origin = 'COMYLEG.inartrcl.num_suc'
      FixedChar = True
      Size = 2
    end
    object qtotclcod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.inartrcl.cod_cli'
      FixedChar = True
      Size = 8
    end
    object qtotcltipo: TStringField
      FieldName = 'tipo'
      Origin = 'COMYLEG.inartrcl.tipo'
      FixedChar = True
      Size = 2
    end
    object qtotclnum_docto: TStringField
      FieldName = 'num_docto'
      Origin = 'COMYLEG.inartrcl.num_docto'
      FixedChar = True
      Size = 10
    end
    object qtotclimporte: TFloatField
      FieldName = 'importe'
      Origin = 'COMYLEG.inartrcl.importe'
    end
    object qtotclsal_fac: TFloatField
      FieldName = 'sal_fac'
      Origin = 'COMYLEG.inartrcl.sal_fac'
    end
    object qtotclsal_iva: TFloatField
      FieldName = 'sal_iva'
      Origin = 'COMYLEG.inartrcl.sal_iva'
    end
    object qtotclfecha: TDateField
      FieldName = 'fecha'
      Origin = 'COMYLEG.inartrcl.fecha'
    end
  end
  object DataSource107: TDataSource
    DataSet = qtotcl
    Left = 40
    Top = 560
  end
  object ins_inartrcl: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update inartrcl'
      'set importe = :importe, sal_fac = :importe'
      'where num_docto = :num_doc and num_emp= :num_emp'
      '')
    Left = 8
    Top = 600
    ParamData = <
      item
        DataType = ftString
        Name = 'importe'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'importe'
        ParamType = ptInput
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
  end
  object DataSource108: TDataSource
    DataSet = ins_inartrcl
    Left = 40
    Top = 600
  end
  object cfdiuso: TQuery
    DatabaseName = 'comyleg'
    SessionName = 'Default'
    SQL.Strings = (
      'select *'
      'from usocfdi')
    Left = 1368
    Top = 136
    object cfdiusocodigo: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.usocfdi.codigo'
      FixedChar = True
      Size = 3
    end
    object cfdiusodescrip: TStringField
      FieldName = 'descrip'
      Origin = 'COMYLEG.usocfdi.descrip'
      FixedChar = True
      Size = 100
    end
  end
  object DataSource109: TDataSource
    DataSet = cfdiuso
    Left = 1400
    Top = 136
  end
  object qresta: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from cod_rest_may '
      'where cod_cli = :cod_cli')
    Left = 1440
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_cli'
        ParamType = ptInput
      end>
    object qrestacod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.cod_rest_may.cod_cli'
      FixedChar = True
      Size = 10
    end
    object qrestaraz_soc: TStringField
      FieldName = 'raz_soc'
      Origin = 'COMYLEG.cod_rest_may.raz_soc'
      FixedChar = True
      Size = 80
    end
  end
  object DataSource110: TDataSource
    DataSet = qresta
    Left = 1472
    Top = 136
  end
  object qrestpre: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from mayoreo'
      'where cod_art = :cod_art')
    Left = 1440
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_art'
        ParamType = ptInput
      end>
    object qrestprecod_art: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.mayoreo.cod_art'
      FixedChar = True
      Size = 10
    end
    object qrestpreprecio: TFloatField
      FieldName = 'precio'
      Origin = 'COMYLEG.mayoreo.precio'
    end
    object qrestpredes_art: TStringField
      FieldName = 'des_art'
      Origin = 'COMYLEG.mayoreo.des_art'
      FixedChar = True
      Size = 50
    end
  end
  object DataSource111: TDataSource
    DataSet = qrestpre
    Left = 1472
    Top = 168
  end
  object QRESTPREMEN: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from menudeo'
      'where cod_art = :cod_art')
    Left = 1440
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_art'
        ParamType = ptInput
      end>
    object QRESTPREMENcod_art: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.menudeo.cod_art'
      FixedChar = True
      Size = 10
    end
    object QRESTPREMENprecio: TFloatField
      FieldName = 'precio'
      Origin = 'COMYLEG.menudeo.precio'
    end
    object QRESTPREMENdes_art: TStringField
      FieldName = 'des_art'
      Origin = 'COMYLEG.menudeo.des_art'
      FixedChar = True
      Size = 50
    end
  end
  object QRESTAMEN: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from cod_rest_men'
      'where cod_cli = :cod_cli')
    Left = 1440
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_cli'
        ParamType = ptInput
      end>
    object QRESTAMENcod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.cod_rest_men.cod_cli'
      FixedChar = True
      Size = 10
    end
    object QRESTAMENraz_soc: TStringField
      FieldName = 'raz_soc'
      Origin = 'COMYLEG.cod_rest_men.raz_soc'
      FixedChar = True
      Size = 80
    end
  end
  object DataSource112: TDataSource
    DataSet = QRESTAMEN
    Left = 1472
    Top = 200
  end
  object DataSource113: TDataSource
    DataSet = QRESTPREMEN
    Left = 1472
    Top = 232
  end
  object dupmay: TQuery
    DatabaseName = 'comyleg'
    SessionName = 'Default'
    SQL.Strings = (
      'select count(*)'
      'from mayoreo'
      'where cod_art = :cod_Art')
    Left = 1440
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_Art'
        ParamType = ptInput
      end>
    object dupmaycount: TFloatField
      FieldName = '(count(*))'
    end
  end
  object DataSource114: TDataSource
    DataSet = dupmay
    Left = 1472
    Top = 264
  end
  object dupmen: TQuery
    DatabaseName = 'comyleg'
    SessionName = 'Default'
    SQL.Strings = (
      'select count(*)'
      'from menudeo'
      'where cod_art = :cod_Art')
    Left = 1440
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_Art'
        ParamType = ptInput
      end>
  end
  object DataSource115: TDataSource
    DataSet = dupmen
    Left = 1472
    Top = 296
  end
  object timbrar: TTable
    DatabaseName = 'comyleg'
    TableName = 'timbrar'
    Left = 1648
    Top = 104
    object timbrarnum_emp: TStringField
      FieldName = 'num_emp'
      FixedChar = True
      Size = 5
    end
    object timbrarnum_doc: TStringField
      FieldName = 'num_doc'
      Required = True
      FixedChar = True
    end
    object timbrartipo: TStringField
      FieldName = 'tipo'
      FixedChar = True
      Size = 3
    end
  end
  object DataSource116: TDataSource
    DataSet = timbrar
    Left = 1680
    Top = 104
  end
  object qrestaura: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from cod_rest'
      'where cod_cli = :cod_cli')
    Left = 1440
    Top = 328
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_cli'
        ParamType = ptInput
      end>
    object qrestauracod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.cod_rest.cod_cli'
      FixedChar = True
      Size = 10
    end
    object qrestauraraz_soc: TStringField
      FieldName = 'raz_soc'
      Origin = 'COMYLEG.cod_rest.raz_soc'
      FixedChar = True
      Size = 80
    end
  end
  object DataSource117: TDataSource
    DataSet = qrestaura
    Left = 1472
    Top = 328
  end
  object qrestaupre: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from restaurant'
      'where cod_art = :cod_art')
    Left = 1440
    Top = 360
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_art'
        ParamType = ptInput
      end>
    object qrestauprecod_art: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.restaurant.cod_art'
      FixedChar = True
    end
    object qrestaupreprecio: TFloatField
      FieldName = 'precio'
      Origin = 'COMYLEG.restaurant.precio'
    end
    object qrestaupredes_art: TStringField
      FieldName = 'des_art'
      Origin = 'COMYLEG.restaurant.des_art'
      FixedChar = True
      Size = 50
    end
  end
  object DataSource118: TDataSource
    DataSet = qrestaupre
    Left = 1472
    Top = 360
  end
  object duprest: TQuery
    DatabaseName = 'comyleg'
    SessionName = 'Default'
    SQL.Strings = (
      'select count(*)'
      'from restaurant'
      'where cod_art = :cod_Art')
    Left = 1448
    Top = 456
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_Art'
        ParamType = ptInput
      end>
    object FloatField92: TFloatField
      FieldName = '(count(*))'
    end
  end
  object DataSource119: TDataSource
    DataSet = duprest
    Left = 1480
    Top = 456
  end
  object qbusimp: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from imp_rela'
      'where :fecha between fecha_ini and fecha_fin')
    Left = 1448
    Top = 496
    ParamData = <
      item
        DataType = ftDate
        Name = 'fecha'
        ParamType = ptInput
      end>
    object qbusimpnombre: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.imp_rela.nombre'
      FixedChar = True
    end
    object qbusimpcaja: TStringField
      FieldName = 'caja'
      Origin = 'COMYLEG.imp_rela.caja'
      FixedChar = True
      Size = 100
    end
    object qbusimpfecha_ini: TDateField
      FieldName = 'fecha_ini'
      Origin = 'COMYLEG.imp_rela.fecha_ini'
    end
    object qbusimpfecha_fin: TDateField
      FieldName = 'fecha_fin'
      Origin = 'COMYLEG.imp_rela.fecha_fin'
    end
  end
  object DataSource120: TDataSource
    DataSet = qbusimp
    Left = 1480
    Top = 496
  end
  object qventas4: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'FROM VENTAS'
      'WHERE FOLIO = :FOLIO AND CODIGO ='#39'P1281'#39' AND NUM_EMP = :NUM_EMP'
      '')
    Left = 1592
    Top = 648
    ParamData = <
      item
        DataType = ftString
        Name = 'FOLIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUM_EMP'
        ParamType = ptInput
      end>
    object qventas4folio: TIntegerField
      FieldName = 'folio'
      Origin = 'COMYLEG.ventas.folio'
    end
    object qventas4descripcion: TStringField
      FieldName = 'descripcion'
      Origin = 'COMYLEG.ventas.descripcion'
      FixedChar = True
      Size = 50
    end
    object qventas4codigo: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.ventas.codigo'
      FixedChar = True
      Size = 14
    end
    object qventas4cajas: TFloatField
      FieldName = 'cajas'
      Origin = 'COMYLEG.ventas.cajas'
    end
    object qventas4kilos: TFloatField
      FieldName = 'kilos'
      Origin = 'COMYLEG.ventas.kilos'
    end
    object qventas4precio: TFloatField
      FieldName = 'precio'
      Origin = 'COMYLEG.ventas.precio'
    end
    object qventas4total: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.ventas.total'
    end
    object qventas4nombre: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.ventas.nombre'
      FixedChar = True
      Size = 50
    end
    object qventas4iva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.ventas.iva'
    end
    object qventas4cos_pro: TFloatField
      FieldName = 'cos_pro'
      Origin = 'COMYLEG.ventas.cos_pro'
    end
    object qventas4totiva: TFloatField
      FieldName = 'totiva'
      Origin = 'COMYLEG.ventas.totiva'
    end
    object qventas4renglon: TSmallintField
      FieldName = 'renglon'
      Origin = 'COMYLEG.ventas.renglon'
    end
    object qventas4pagado: TSmallintField
      FieldName = 'pagado'
      Origin = 'COMYLEG.ventas.pagado'
    end
    object qventas4rfc: TStringField
      FieldName = 'rfc'
      Origin = 'COMYLEG.ventas.rfc'
      FixedChar = True
    end
    object qventas4tipo: TStringField
      FieldName = 'tipo'
      Origin = 'COMYLEG.ventas.tipo'
      FixedChar = True
      Size = 2
    end
    object qventas4lineaven: TStringField
      FieldName = 'lineaven'
      Origin = 'COMYLEG.ventas.lineaven'
      FixedChar = True
    end
    object qventas4descto: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.ventas.descto'
    end
    object qventas4pedido: TStringField
      FieldName = 'pedido'
      Origin = 'COMYLEG.ventas.pedido'
      FixedChar = True
    end
    object qventas4observacion: TStringField
      FieldName = 'observacion'
      Origin = 'COMYLEG.ventas.observacion'
      FixedChar = True
    end
    object qventas4sucursal: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.ventas.sucursal'
      FixedChar = True
    end
    object qventas4num_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.ventas.num_emp'
      FixedChar = True
      Size = 2
    end
  end
  object DataSource121: TDataSource
    DataSet = qventas4
    Left = 1624
    Top = 648
  end
  object qsacades: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from descto_ctes'
      'where cod_cli = :cod_cli and sucursal = :sucursal'
      '')
    Left = 368
    Top = 320
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_cli'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'sucursal'
        ParamType = ptInput
      end>
    object qsacadescod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.descto_ctes.cod_cli'
      FixedChar = True
    end
    object qsacadessucursal: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.descto_ctes.sucursal'
      FixedChar = True
      Size = 200
    end
    object qsacadesdescto: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.descto_ctes.descto'
    end
  end
  object DataSource122: TDataSource
    Left = 400
    Top = 320
  end
  object qespera: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'SET LOCK MODE TO WAIT')
    Left = 480
    Top = 176
    object StringField88: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.descto_ctes.cod_cli'
      FixedChar = True
    end
    object StringField89: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.descto_ctes.sucursal'
      FixedChar = True
      Size = 200
    end
    object FloatField93: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.descto_ctes.descto'
    end
  end
  object DataSource123: TDataSource
    Left = 512
    Top = 176
  end
  object qespera2: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'SET LOCK MODE TO NOT WAIT'
      '')
    Left = 480
    Top = 208
    object StringField90: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.descto_ctes.cod_cli'
      FixedChar = True
    end
    object StringField91: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.descto_ctes.sucursal'
      FixedChar = True
      Size = 200
    end
    object FloatField94: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.descto_ctes.descto'
    end
  end
  object DataSource124: TDataSource
    Left = 512
    Top = 208
  end
  object qbusfolio: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from ventas'
      'where folio = :folio  ')
    Left = 368
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end>
    object qbusfoliofolio: TIntegerField
      FieldName = 'folio'
      Origin = 'COMYLEG.ventas.folio'
    end
    object qbusfoliodescripcion: TStringField
      FieldName = 'descripcion'
      Origin = 'COMYLEG.ventas.descripcion'
      FixedChar = True
      Size = 50
    end
    object qbusfoliocodigo: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.ventas.codigo'
      FixedChar = True
      Size = 14
    end
    object qbusfoliocajas: TFloatField
      FieldName = 'cajas'
      Origin = 'COMYLEG.ventas.cajas'
    end
    object qbusfoliokilos: TFloatField
      FieldName = 'kilos'
      Origin = 'COMYLEG.ventas.kilos'
    end
    object qbusfolioprecio: TFloatField
      FieldName = 'precio'
      Origin = 'COMYLEG.ventas.precio'
    end
    object qbusfoliototal: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.ventas.total'
    end
    object qbusfolionombre: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.ventas.nombre'
      FixedChar = True
      Size = 50
    end
    object qbusfolioiva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.ventas.iva'
    end
    object qbusfoliocos_pro: TFloatField
      FieldName = 'cos_pro'
      Origin = 'COMYLEG.ventas.cos_pro'
    end
    object qbusfoliototiva: TFloatField
      FieldName = 'totiva'
      Origin = 'COMYLEG.ventas.totiva'
    end
    object qbusfoliorenglon: TSmallintField
      FieldName = 'renglon'
      Origin = 'COMYLEG.ventas.renglon'
    end
    object qbusfoliopagado: TSmallintField
      FieldName = 'pagado'
      Origin = 'COMYLEG.ventas.pagado'
    end
    object qbusfoliorfc: TStringField
      FieldName = 'rfc'
      Origin = 'COMYLEG.ventas.rfc'
      FixedChar = True
    end
    object qbusfoliotipo: TStringField
      FieldName = 'tipo'
      Origin = 'COMYLEG.ventas.tipo'
      FixedChar = True
      Size = 2
    end
    object qbusfoliolineaven: TStringField
      FieldName = 'lineaven'
      Origin = 'COMYLEG.ventas.lineaven'
      FixedChar = True
    end
    object qbusfoliodescto: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.ventas.descto'
    end
    object qbusfoliopedido: TStringField
      FieldName = 'pedido'
      Origin = 'COMYLEG.ventas.pedido'
      FixedChar = True
    end
    object qbusfolioobservacion: TStringField
      FieldName = 'observacion'
      Origin = 'COMYLEG.ventas.observacion'
      FixedChar = True
    end
    object qbusfoliosucursal: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.ventas.sucursal'
      FixedChar = True
    end
    object qbusfolionum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.ventas.num_emp'
      FixedChar = True
      Size = 2
    end
  end
  object DataSource125: TDataSource
    DataSet = qbusfolio
    Left = 400
    Top = 144
  end
  object DataSource126: TDataSource
    DataSet = qbusinarcot
    Left = 400
    Top = 112
  end
  object qbusinarcot: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      
        'select cod_cli, SUM(IMP_EXE), SUM(IMP_15), SUM(IVA_15), SUM(IMP_' +
        '6), SUM(IVA_6), SUM(DES_EXE)'
      'from inarcot'
      'where num_doc = :folio '
      'group by 1')
    Left = 368
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end>
    object qbusinarcotsum: TFloatField
      FieldName = '(sum)'
    end
    object qbusinarcotsum_1: TFloatField
      FieldName = '(sum)_1'
    end
    object qbusinarcotsum_2: TFloatField
      FieldName = '(sum)_2'
    end
    object qbusinarcotsum_3: TFloatField
      FieldName = '(sum)_3'
    end
    object qbusinarcotsum_4: TFloatField
      FieldName = '(sum)_4'
    end
    object qbusinarcotsum_5: TFloatField
      FieldName = '(sum)_5'
    end
    object qbusinarcotcod_cli: TStringField
      FieldName = 'cod_cli'
      FixedChar = True
      Size = 8
    end
  end
  object cueqventas: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select count(*)'
      'from ventas '
      'where  folio = :folio  AND NUM_EMP = :NUM_EMP')
    Left = 1368
    Top = 464
    ParamData = <
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NUM_EMP'
        ParamType = ptInput
      end>
    object cueqventascount: TFloatField
      FieldName = '(count(*))'
    end
  end
  object DataSource127: TDataSource
    DataSet = cueqventas
    Left = 1400
    Top = 464
  end
  object qactuemp8: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update ventas'
      'set num_emp ='#39'04'#39
      'WHeRE folio = :folio and NUM_EMP =:NUM_EMP AND codigo ='#39'A155CH'#39)
    Left = 1592
    Top = 680
    ParamData = <
      item
        DataType = ftString
        Name = 'FOLIO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NUM_EMP'
        ParamType = ptUnknown
      end>
    object IntegerField27: TIntegerField
      FieldName = 'folio'
      Origin = 'COMYLEG.ventas.folio'
    end
    object StringField92: TStringField
      FieldName = 'descripcion'
      Origin = 'COMYLEG.ventas.descripcion'
      FixedChar = True
      Size = 50
    end
    object StringField93: TStringField
      FieldName = 'codigo'
      Origin = 'COMYLEG.ventas.codigo'
      FixedChar = True
      Size = 14
    end
    object FloatField95: TFloatField
      FieldName = 'cajas'
      Origin = 'COMYLEG.ventas.cajas'
    end
    object FloatField96: TFloatField
      FieldName = 'kilos'
      Origin = 'COMYLEG.ventas.kilos'
    end
    object FloatField97: TFloatField
      FieldName = 'precio'
      Origin = 'COMYLEG.ventas.precio'
    end
    object FloatField98: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.ventas.total'
    end
    object StringField94: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.ventas.nombre'
      FixedChar = True
      Size = 50
    end
    object FloatField99: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.ventas.iva'
    end
    object FloatField100: TFloatField
      FieldName = 'cos_pro'
      Origin = 'COMYLEG.ventas.cos_pro'
    end
    object FloatField101: TFloatField
      FieldName = 'totiva'
      Origin = 'COMYLEG.ventas.totiva'
    end
    object SmallintField14: TSmallintField
      FieldName = 'renglon'
      Origin = 'COMYLEG.ventas.renglon'
    end
    object SmallintField15: TSmallintField
      FieldName = 'pagado'
      Origin = 'COMYLEG.ventas.pagado'
    end
    object StringField95: TStringField
      FieldName = 'rfc'
      Origin = 'COMYLEG.ventas.rfc'
      FixedChar = True
    end
    object StringField96: TStringField
      FieldName = 'tipo'
      Origin = 'COMYLEG.ventas.tipo'
      FixedChar = True
      Size = 2
    end
    object StringField97: TStringField
      FieldName = 'lineaven'
      Origin = 'COMYLEG.ventas.lineaven'
      FixedChar = True
    end
    object FloatField102: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.ventas.descto'
    end
    object StringField98: TStringField
      FieldName = 'pedido'
      Origin = 'COMYLEG.ventas.pedido'
      FixedChar = True
    end
    object StringField99: TStringField
      FieldName = 'observacion'
      Origin = 'COMYLEG.ventas.observacion'
      FixedChar = True
    end
    object StringField100: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.ventas.sucursal'
      FixedChar = True
    end
    object StringField101: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.ventas.num_emp'
      FixedChar = True
      Size = 2
    end
  end
  object DataSource128: TDataSource
    DataSet = qactuemp8
    Left = 1624
    Top = 680
  end
  object qbusfoliocorte: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'SELECT *'
      'FROM CORTE_CAJA '
      'WHERE FACTURA =  :factura')
    Left = 368
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'factura'
        ParamType = ptInput
      end>
    object qbusfoliocortefolio: TIntegerField
      FieldName = 'folio'
      Origin = 'COMYLEG.corte_caja.folio'
    end
    object qbusfoliocortefactura: TStringField
      FieldName = 'factura'
      Origin = 'COMYLEG.corte_caja.factura'
      FixedChar = True
      Size = 10
    end
    object qbusfoliocortenombre: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.corte_caja.nombre'
      FixedChar = True
      Size = 50
    end
    object qbusfoliocortecaja: TStringField
      FieldName = 'caja'
      Origin = 'COMYLEG.corte_caja.caja'
      FixedChar = True
      Size = 12
    end
    object qbusfoliocorteefectivo: TFloatField
      FieldName = 'efectivo'
      Origin = 'COMYLEG.corte_caja.efectivo'
    end
    object qbusfoliocortebonos: TFloatField
      FieldName = 'bonos'
      Origin = 'COMYLEG.corte_caja.bonos'
    end
    object qbusfoliocortecheque: TFloatField
      FieldName = 'cheque'
      Origin = 'COMYLEG.corte_caja.cheque'
    end
    object qbusfoliocortedolar: TFloatField
      FieldName = 'dolar'
      Origin = 'COMYLEG.corte_caja.dolar'
    end
    object qbusfoliocortetotal: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.corte_caja.total'
    end
    object qbusfoliocortetipo_pago: TStringField
      FieldName = 'tipo_pago'
      Origin = 'COMYLEG.corte_caja.tipo_pago'
      FixedChar = True
      Size = 10
    end
    object qbusfoliocortetipo_fac: TStringField
      FieldName = 'tipo_fac'
      Origin = 'COMYLEG.corte_caja.tipo_fac'
      FixedChar = True
      Size = 10
    end
    object qbusfoliocortefecha: TDateField
      FieldName = 'fecha'
      Origin = 'COMYLEG.corte_caja.fecha'
    end
    object qbusfoliocortenum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.corte_caja.num_emp'
      FixedChar = True
      Size = 2
    end
    object qbusfoliocortenum_suc: TStringField
      FieldName = 'num_suc'
      Origin = 'COMYLEG.corte_caja.num_suc'
      FixedChar = True
      Size = 2
    end
    object qbusfoliocortecod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.corte_caja.cod_cli'
      FixedChar = True
      Size = 6
    end
    object qbusfoliocorteiva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.corte_caja.iva'
    end
  end
  object DataSource129: TDataSource
    DataSet = qbusfoliocorte
    Left = 400
    Top = 80
  end
  object UPDATE_BUSFOLIO: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'UPDATE IEPS_VTAS'
      'SET FOLIO = :FOLIONEW'
      'WHERE FOLIO = :FOLIO')
    Left = 480
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FOLIONEW'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FOLIO'
        ParamType = ptUnknown
      end>
    object StringField102: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.descto_ctes.cod_cli'
      FixedChar = True
    end
    object StringField103: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.descto_ctes.sucursal'
      FixedChar = True
      Size = 200
    end
    object FloatField103: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.descto_ctes.descto'
    end
  end
  object DataSource130: TDataSource
    Left = 512
    Top = 240
  end
  object busemp: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from corte_caja'
      'where factura= :factura and num_emp ='#39'08'#39)
    Left = 552
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'factura'
        ParamType = ptInput
      end>
    object busempfolio: TIntegerField
      FieldName = 'folio'
      Origin = 'COMYLEG.corte_caja.folio'
    end
    object busempfactura: TStringField
      FieldName = 'factura'
      Origin = 'COMYLEG.corte_caja.factura'
      FixedChar = True
      Size = 10
    end
    object busempnombre: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.corte_caja.nombre'
      FixedChar = True
      Size = 50
    end
    object busempcaja: TStringField
      FieldName = 'caja'
      Origin = 'COMYLEG.corte_caja.caja'
      FixedChar = True
      Size = 12
    end
    object busempefectivo: TFloatField
      FieldName = 'efectivo'
      Origin = 'COMYLEG.corte_caja.efectivo'
    end
    object busempbonos: TFloatField
      FieldName = 'bonos'
      Origin = 'COMYLEG.corte_caja.bonos'
    end
    object busempcheque: TFloatField
      FieldName = 'cheque'
      Origin = 'COMYLEG.corte_caja.cheque'
    end
    object busempdolar: TFloatField
      FieldName = 'dolar'
      Origin = 'COMYLEG.corte_caja.dolar'
    end
    object busemptotal: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.corte_caja.total'
    end
    object busemptipo_pago: TStringField
      FieldName = 'tipo_pago'
      Origin = 'COMYLEG.corte_caja.tipo_pago'
      FixedChar = True
      Size = 10
    end
    object busemptipo_fac: TStringField
      FieldName = 'tipo_fac'
      Origin = 'COMYLEG.corte_caja.tipo_fac'
      FixedChar = True
      Size = 10
    end
    object busempfecha: TDateField
      FieldName = 'fecha'
      Origin = 'COMYLEG.corte_caja.fecha'
    end
    object busempnum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.corte_caja.num_emp'
      FixedChar = True
      Size = 2
    end
    object busempnum_suc: TStringField
      FieldName = 'num_suc'
      Origin = 'COMYLEG.corte_caja.num_suc'
      FixedChar = True
      Size = 2
    end
    object busempcod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.corte_caja.cod_cli'
      FixedChar = True
      Size = 6
    end
    object busempiva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.corte_caja.iva'
    end
  end
  object DataSource131: TDataSource
    Left = 584
    Top = 176
  end
  object busemp08: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from inarcot1'
      'where num_doc = :num_doc and num_emp = :num_emp')
    Left = 552
    Top = 208
    ParamData = <
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
    object busemp08num_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inarcot1.num_emp'
      FixedChar = True
      Size = 2
    end
    object busemp08cod_art: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.inarcot1.cod_art'
      FixedChar = True
      Size = 14
    end
    object busemp08num_suc: TStringField
      FieldName = 'num_suc'
      Origin = 'COMYLEG.inarcot1.num_suc'
      FixedChar = True
      Size = 2
    end
    object busemp08fech_doc: TDateField
      FieldName = 'fech_doc'
      Origin = 'COMYLEG.inarcot1.fech_doc'
    end
    object busemp08tip_doc: TStringField
      FieldName = 'tip_doc'
      Origin = 'COMYLEG.inarcot1.tip_doc'
      FixedChar = True
      Size = 2
    end
    object busemp08num_doc: TIntegerField
      FieldName = 'num_doc'
      Origin = 'COMYLEG.inarcot1.num_doc'
    end
    object busemp08can_kgs: TFloatField
      FieldName = 'can_kgs'
      Origin = 'COMYLEG.inarcot1.can_kgs'
    end
    object busemp08can_caj: TFloatField
      FieldName = 'can_caj'
      Origin = 'COMYLEG.inarcot1.can_caj'
    end
    object busemp08cos_pro_kgs: TFloatField
      FieldName = 'cos_pro_kgs'
      Origin = 'COMYLEG.inarcot1.cos_pro_kgs'
    end
    object busemp08cos_pro_caj: TFloatField
      FieldName = 'cos_pro_caj'
      Origin = 'COMYLEG.inarcot1.cos_pro_caj'
    end
    object busemp08pre_vta_kgs: TFloatField
      FieldName = 'pre_vta_kgs'
      Origin = 'COMYLEG.inarcot1.pre_vta_kgs'
    end
    object busemp08pre_vta_caj: TFloatField
      FieldName = 'pre_vta_caj'
      Origin = 'COMYLEG.inarcot1.pre_vta_caj'
    end
    object busemp08des_vta: TFloatField
      FieldName = 'des_vta'
      Origin = 'COMYLEG.inarcot1.des_vta'
    end
    object busemp08fle_art: TFloatField
      FieldName = 'fle_art'
      Origin = 'COMYLEG.inarcot1.fle_art'
    end
    object busemp08ren_art: TSmallintField
      FieldName = 'ren_art'
      Origin = 'COMYLEG.inarcot1.ren_art'
    end
    object busemp08cod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.inarcot1.cod_cli'
      FixedChar = True
      Size = 8
    end
    object busemp08iva_art: TFloatField
      FieldName = 'iva_art'
      Origin = 'COMYLEG.inarcot1.iva_art'
    end
    object busemp08cod_ag: TSmallintField
      FieldName = 'cod_ag'
      Origin = 'COMYLEG.inarcot1.cod_ag'
    end
  end
  object DataSource132: TDataSource
    Left = 584
    Top = 208
  end
  object actuemp: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update ventas'
      'set num_emp = :num_emp'
      'where codigo = :codigo and folio = :folio')
    Left = 552
    Top = 240
    ParamData = <
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'folio'
        ParamType = ptUnknown
      end>
  end
  object DataSource133: TDataSource
    Left = 584
    Top = 240
  end
  object corte_new: TTable
    DatabaseName = 'ventas'
    TableName = 'corte_new.db'
    Left = 360
    Top = 408
    object corte_newFolio: TIntegerField
      FieldName = 'Folio'
    end
    object corte_newFactura: TStringField
      FieldName = 'Factura'
      Size = 10
    end
    object corte_newNombre: TStringField
      FieldName = 'Nombre'
      Size = 50
    end
    object corte_newCaja: TStringField
      FieldName = 'Caja'
      Size = 12
    end
    object corte_newEfectivo: TFloatField
      FieldName = 'Efectivo'
    end
    object corte_newBonos: TFloatField
      FieldName = 'Bonos'
    end
    object corte_newCheque: TFloatField
      FieldName = 'Cheque'
    end
    object corte_newDolar: TFloatField
      FieldName = 'Dolar'
    end
    object corte_newTotal: TFloatField
      FieldName = 'Total'
    end
    object corte_newTipo_pago: TStringField
      FieldName = 'Tipo_pago'
      Size = 10
    end
    object corte_newTipo_fac: TStringField
      FieldName = 'Tipo_fac'
      Size = 10
    end
    object corte_newFecha: TDateField
      FieldName = 'Fecha'
    end
    object corte_newNum_emp: TStringField
      FieldName = 'Num_emp'
      Size = 2
    end
    object corte_newNum_suc: TStringField
      FieldName = 'Num_suc'
      Size = 2
    end
    object corte_newCod_cli: TStringField
      FieldName = 'Cod_cli'
      Size = 6
    end
    object corte_newIva: TFloatField
      FieldName = 'Iva'
    end
    object corte_newPase: TIntegerField
      FieldName = 'Pase'
    end
  end
  object DataSource134: TDataSource
    DataSet = corte_new
    Left = 392
    Top = 408
  end
  object agregar_corte: TQuery
    DatabaseName = 'ventas'
    SQL.Strings = (
      
        'insert into corte_new values (:folio, :factura, :nombre, :agente' +
        ', :efe, :tran, :cheq, :dola, :exeimp, :enviatipo, :tipofac,'
      
        '                      :vientos, :empr, :sucu, :clicod, :impiva, ' +
        ':pasar);')
    Left = 360
    Top = 376
    ParamData = <
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'factura'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'agente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'efe'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tran'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cheq'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dola'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'exeimp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'enviatipo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'tipofac'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'vientos'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'empr'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'sucu'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'clicod'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'impiva'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pasar'
        ParamType = ptInput
      end>
  end
  object DataSource135: TDataSource
    Left = 392
    Top = 376
  end
  object busregimen: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from deta_cte '
      'where cod_cli = :cod_cli'
      '')
    Left = 432
    Top = 376
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_cli'
        ParamType = ptInput
      end>
    object busregimennum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.deta_cte.num_emp'
      FixedChar = True
      Size = 10
    end
    object busregimencod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.deta_cte.cod_cli'
      FixedChar = True
      Size = 40
    end
    object busregimencalle: TStringField
      FieldName = 'calle'
      Origin = 'COMYLEG.deta_cte.calle'
      FixedChar = True
      Size = 50
    end
    object busregimennum_int: TStringField
      FieldName = 'num_int'
      Origin = 'COMYLEG.deta_cte.num_int'
      FixedChar = True
    end
    object busregimennum_ext: TStringField
      FieldName = 'num_ext'
      Origin = 'COMYLEG.deta_cte.num_ext'
      FixedChar = True
      Size = 40
    end
    object busregimencolonia: TStringField
      FieldName = 'colonia'
      Origin = 'COMYLEG.deta_cte.colonia'
      FixedChar = True
      Size = 40
    end
    object busregimenemail: TStringField
      FieldName = 'email'
      Origin = 'COMYLEG.deta_cte.email'
      FixedChar = True
      Size = 50
    end
    object busregimenmunicipio: TStringField
      FieldName = 'municipio'
      Origin = 'COMYLEG.deta_cte.municipio'
      FixedChar = True
      Size = 50
    end
    object busregimenpais: TStringField
      FieldName = 'pais'
      Origin = 'COMYLEG.deta_cte.pais'
      FixedChar = True
    end
    object busregimenemail2: TStringField
      FieldName = 'email2'
      Origin = 'COMYLEG.deta_cte.email2'
      FixedChar = True
      Size = 50
    end
    object busregimenemail3: TStringField
      FieldName = 'email3'
      Origin = 'COMYLEG.deta_cte.email3'
      FixedChar = True
      Size = 50
    end
    object busregimenregimen: TStringField
      FieldName = 'regimen'
      Origin = 'COMYLEG.deta_cte.regimen'
      FixedChar = True
      Size = 45
    end
  end
  object DataSource136: TDataSource
    Left = 464
    Top = 376
  end
  object audita: TTable
    DatabaseName = 'comyleg'
    TableName = 'audita'
    Left = 368
    Top = 48
    object auditano_emp: TStringField
      FieldName = 'no_emp'
      FixedChar = True
      Size = 2
    end
    object auditano_folio: TIntegerField
      FieldName = 'no_folio'
    end
    object auditano_doc: TStringField
      FieldName = 'no_doc'
      FixedChar = True
      Size = 10
    end
    object auditatotal: TFloatField
      FieldName = 'total'
    end
    object auditafecha: TDateField
      FieldName = 'fecha'
    end
    object auditahora: TDateTimeField
      FieldName = 'hora'
    end
    object auditacan_art: TIntegerField
      FieldName = 'can_art'
    end
    object auditacod_cli: TStringField
      FieldName = 'cod_cli'
      FixedChar = True
      Size = 6
    end
    object auditanombre: TStringField
      FieldName = 'nombre'
      FixedChar = True
      Size = 50
    end
    object auditaagente: TStringField
      FieldName = 'agente'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource137: TDataSource
    DataSet = audita
    Left = 400
    Top = 48
  end
  object Query4: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from descto_ctes'
      'where cod_cli = :cod_cli and sucursal = :sucursal'
      '')
    Left = 1288
    Top = 504
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_cli'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'sucursal'
        ParamType = ptInput
      end>
    object StringField104: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.descto_ctes.cod_cli'
      FixedChar = True
    end
    object StringField105: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.descto_ctes.sucursal'
      FixedChar = True
      Size = 200
    end
    object FloatField104: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.descto_ctes.descto'
    end
  end
  object DataSource138: TDataSource
    Left = 1320
    Top = 504
  end
  object qtableta: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from tableta'
      'where folio = :folio and num_emp = :num_emp')
    Left = 1368
    Top = 496
    ParamData = <
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
    object qtabletanum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.tableta.num_emp'
      FixedChar = True
      Size = 2
    end
    object qtabletafolio: TStringField
      FieldName = 'folio'
      Origin = 'COMYLEG.tableta.folio'
      FixedChar = True
    end
    object qtabletacod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.tableta.cod_cli'
      FixedChar = True
      Size = 50
    end
    object qtabletanombre: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.tableta.nombre'
      FixedChar = True
      Size = 100
    end
    object qtabletafecha: TDateField
      FieldName = 'fecha'
      Origin = 'COMYLEG.tableta.fecha'
    end
    object qtabletasubtotal: TFloatField
      FieldName = 'subtotal'
      Origin = 'COMYLEG.tableta.subtotal'
    end
    object qtabletaiva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.tableta.iva'
    end
    object qtabletatotal: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.tableta.total'
    end
    object qtabletabande: TStringField
      FieldName = 'bande'
      Origin = 'COMYLEG.tableta.bande'
      FixedChar = True
      Size = 2
    end
    object qtabletarfc: TStringField
      FieldName = 'rfc'
      Origin = 'COMYLEG.tableta.rfc'
      FixedChar = True
      Size = 50
    end
    object qtabletafolio_col: TStringField
      FieldName = 'folio_col'
      Origin = 'COMYLEG.tableta.folio_col'
      FixedChar = True
      Size = 50
    end
    object qtabletavendedor: TStringField
      FieldName = 'vendedor'
      Origin = 'COMYLEG.tableta.vendedor'
      FixedChar = True
      Size = 30
    end
    object qtabletadiableros: TStringField
      FieldName = 'diableros'
      Origin = 'COMYLEG.tableta.diableros'
      FixedChar = True
      Size = 30
    end
    object qtabletaestatus: TStringField
      FieldName = 'estatus'
      Origin = 'COMYLEG.tableta.estatus'
      FixedChar = True
      Size = 15
    end
  end
  object DataSource139: TDataSource
    DataSet = qtableta
    Left = 1400
    Top = 496
  end
  object upvtascom: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update ventas'
      'set folio = :folio_col, nombre = :nombre'
      'where folio = :folio and num_emp = :num_emp'
      '')
    Left = 480
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'folio_col'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
    object StringField106: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.descto_ctes.cod_cli'
      FixedChar = True
    end
    object StringField107: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.descto_ctes.sucursal'
      FixedChar = True
      Size = 200
    end
    object FloatField105: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.descto_ctes.descto'
    end
  end
  object DataSource140: TDataSource
    Left = 512
    Top = 40
  end
  object DataSource141: TDataSource
    Left = 512
    Top = 72
  end
  object upvtastab: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update tableta'
      'set folio_col = :folio_col'
      'where folio = :folio and num_emp = :num_emp')
    Left = 480
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'folio_col'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
    object StringField108: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.descto_ctes.cod_cli'
      FixedChar = True
    end
    object StringField109: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.descto_ctes.sucursal'
      FixedChar = True
      Size = 200
    end
    object FloatField106: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.descto_ctes.descto'
    end
  end
  object qtableta2: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from tableta'
      'where folio = :folio and num_emp = :num_emp')
    Left = 480
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
    object qtableta2num_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.tableta.num_emp'
      FixedChar = True
      Size = 2
    end
    object qtableta2folio: TStringField
      FieldName = 'folio'
      Origin = 'COMYLEG.tableta.folio'
      FixedChar = True
    end
    object qtableta2cod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.tableta.cod_cli'
      FixedChar = True
      Size = 50
    end
    object qtableta2nombre: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.tableta.nombre'
      FixedChar = True
      Size = 100
    end
    object qtableta2fecha: TDateField
      FieldName = 'fecha'
      Origin = 'COMYLEG.tableta.fecha'
    end
    object qtableta2subtotal: TFloatField
      FieldName = 'subtotal'
      Origin = 'COMYLEG.tableta.subtotal'
    end
    object qtableta2iva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.tableta.iva'
    end
    object qtableta2total: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.tableta.total'
    end
    object qtableta2bande: TStringField
      FieldName = 'bande'
      Origin = 'COMYLEG.tableta.bande'
      FixedChar = True
      Size = 2
    end
    object qtableta2rfc: TStringField
      FieldName = 'rfc'
      Origin = 'COMYLEG.tableta.rfc'
      FixedChar = True
      Size = 50
    end
    object qtableta2folio_col: TStringField
      FieldName = 'folio_col'
      Origin = 'COMYLEG.tableta.folio_col'
      FixedChar = True
      Size = 50
    end
  end
  object DataSource142: TDataSource
    Left = 512
    Top = 112
  end
  object UPDATABLE: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'UPDATE tableta'
      'SET subtotal = :subtotal, iva = :iva, total = :total'
      'where folio = :folio and num_emp = :num_emp')
    Left = 568
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'subtotal'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'iva'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'total'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end>
    object StringField110: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.tableta.num_emp'
      FixedChar = True
      Size = 2
    end
    object StringField111: TStringField
      FieldName = 'folio'
      Origin = 'COMYLEG.tableta.folio'
      FixedChar = True
    end
    object StringField112: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.tableta.cod_cli'
      FixedChar = True
      Size = 50
    end
    object StringField113: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.tableta.nombre'
      FixedChar = True
      Size = 100
    end
    object DateField3: TDateField
      FieldName = 'fecha'
      Origin = 'COMYLEG.tableta.fecha'
    end
    object FloatField107: TFloatField
      FieldName = 'subtotal'
      Origin = 'COMYLEG.tableta.subtotal'
    end
    object FloatField108: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.tableta.iva'
    end
    object FloatField109: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.tableta.total'
    end
    object StringField114: TStringField
      FieldName = 'bande'
      Origin = 'COMYLEG.tableta.bande'
      FixedChar = True
      Size = 2
    end
    object StringField115: TStringField
      FieldName = 'rfc'
      Origin = 'COMYLEG.tableta.rfc'
      FixedChar = True
      Size = 50
    end
    object StringField116: TStringField
      FieldName = 'folio_col'
      Origin = 'COMYLEG.tableta.folio_col'
      FixedChar = True
      Size = 50
    end
  end
  object DataSource143: TDataSource
    Left = 600
    Top = 56
  end
  object qdetab: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from DETA_TABLETA'
      'where folio = :folio  ')
    Left = 784
    Top = 69
    ParamData = <
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end>
    object qdetabfolio: TIntegerField
      FieldName = 'folio'
      Origin = 'COMYLEG.deta_tableta.folio'
    end
    object qdetabcod_art: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.deta_tableta.cod_art'
      FixedChar = True
      Size = 30
    end
    object qdetabdes_art: TStringField
      FieldName = 'des_art'
      Origin = 'COMYLEG.deta_tableta.des_art'
      FixedChar = True
      Size = 200
    end
    object qdetabkgs: TFloatField
      FieldName = 'kgs'
      Origin = 'COMYLEG.deta_tableta.kgs'
    end
    object qdetabcajas: TFloatField
      FieldName = 'cajas'
      Origin = 'COMYLEG.deta_tableta.cajas'
    end
    object qdetabpre_kgs: TFloatField
      FieldName = 'pre_kgs'
      Origin = 'COMYLEG.deta_tableta.pre_kgs'
    end
    object qdetabpre_caj: TFloatField
      FieldName = 'pre_caj'
      Origin = 'COMYLEG.deta_tableta.pre_caj'
    end
    object qdetabvendedor: TStringField
      FieldName = 'vendedor'
      Origin = 'COMYLEG.deta_tableta.vendedor'
      FixedChar = True
      Size = 30
    end
    object qdetabtotal: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.deta_tableta.total'
    end
    object qdetabobserva: TMemoField
      FieldName = 'observa'
      Origin = 'COMYLEG.deta_tableta.observa'
      BlobType = ftMemo
      Size = 300
    end
    object qdetabrenglon: TStringField
      FieldName = 'renglon'
      Origin = 'COMYLEG.deta_tableta.renglon'
      FixedChar = True
      Size = 2
    end
    object qdetabcod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.deta_tableta.cod_cli'
      FixedChar = True
      Size = 200
    end
    object qdetabiva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.deta_tableta.iva'
    end
    object qdetabtip_art: TStringField
      FieldName = 'tip_art'
      Origin = 'COMYLEG.deta_tableta.tip_art'
      FixedChar = True
      Size = 2
    end
    object qdetablin_ven: TStringField
      FieldName = 'lin_ven'
      Origin = 'COMYLEG.deta_tableta.lin_ven'
      FixedChar = True
      Size = 2
    end
    object qdetabnum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.deta_tableta.num_emp'
      FixedChar = True
      Size = 2
    end
  end
  object qbusal: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from tableta '
      'where folio = :folio')
    Left = 784
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end>
    object qbusalnum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.tableta.num_emp'
      FixedChar = True
      Size = 2
    end
    object qbusalfolio: TStringField
      FieldName = 'folio'
      Origin = 'COMYLEG.tableta.folio'
      FixedChar = True
    end
    object qbusalcod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.tableta.cod_cli'
      FixedChar = True
      Size = 50
    end
    object qbusalnombre: TStringField
      FieldName = 'nombre'
      Origin = 'COMYLEG.tableta.nombre'
      FixedChar = True
      Size = 100
    end
    object qbusalfecha: TDateField
      FieldName = 'fecha'
      Origin = 'COMYLEG.tableta.fecha'
    end
    object qbusalsubtotal: TFloatField
      FieldName = 'subtotal'
      Origin = 'COMYLEG.tableta.subtotal'
    end
    object qbusaliva: TFloatField
      FieldName = 'iva'
      Origin = 'COMYLEG.tableta.iva'
    end
    object qbusaltotal: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.tableta.total'
    end
    object qbusalbande: TStringField
      FieldName = 'bande'
      Origin = 'COMYLEG.tableta.bande'
      FixedChar = True
      Size = 2
    end
    object qbusalrfc: TStringField
      FieldName = 'rfc'
      Origin = 'COMYLEG.tableta.rfc'
      FixedChar = True
      Size = 50
    end
    object qbusalfolio_col: TStringField
      FieldName = 'folio_col'
      Origin = 'COMYLEG.tableta.folio_col'
      FixedChar = True
      Size = 50
    end
    object qbusalvendedor: TStringField
      FieldName = 'vendedor'
      Origin = 'COMYLEG.tableta.vendedor'
      FixedChar = True
      Size = 30
    end
    object qbusaldiableros: TStringField
      FieldName = 'diableros'
      Origin = 'COMYLEG.tableta.diableros'
      FixedChar = True
      Size = 30
    end
    object qbusalestatus: TStringField
      FieldName = 'estatus'
      Origin = 'COMYLEG.tableta.estatus'
      FixedChar = True
      Size = 15
    end
  end
  object DataSource144: TDataSource
    DataSet = qdetab
    Left = 816
    Top = 69
  end
  object DataSource145: TDataSource
    DataSet = qbusal
    Left = 816
    Top = 104
  end
  object upventas: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update ventas'
      
        'set  iva = :iva, total = :total, kilos = :KGS, CAJAS = :CAJAS, p' +
        'recio = :precio , totiva = :totiva'
      'where folio = :folio and codigo = :cod_art AND renglon = :ren')
    Left = 480
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'iva'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'total'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'KGS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CAJAS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'precio'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'totiva'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FOLIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cod_art'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ren'
        ParamType = ptInput
      end>
    object StringField117: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.descto_ctes.cod_cli'
      FixedChar = True
    end
    object StringField118: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.descto_ctes.sucursal'
      FixedChar = True
      Size = 200
    end
    object FloatField110: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.descto_ctes.descto'
    end
  end
  object DataSource146: TDataSource
    Left = 512
    Top = 272
  end
  object DataSource147: TDataSource
    Left = 392
    Top = 544
  end
  object qsumvtas: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select SUM(TOTAL), SUM(TOTIVA), sum(total)+sum(totiva)'
      'from ventas a '
      'where    FOLIO = :folio')
    Left = 360
    Top = 544
    ParamData = <
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end>
    object qsumvtassum: TFloatField
      FieldName = '(sum)'
    end
    object qsumvtassum_1: TFloatField
      FieldName = '(sum)_1'
    end
    object qsumvtasexpression: TFloatField
      FieldName = '(expression)'
    end
  end
  object uptableta: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update tableta'
      'set subtotal = :subtotal, iva = :iva, total = :total'
      'where folio = :folio '
      '')
    Left = 360
    Top = 576
    ParamData = <
      item
        DataType = ftString
        Name = 'subtotal'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'iva'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'total'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end>
    object StringField119: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.descto_ctes.cod_cli'
      FixedChar = True
    end
    object StringField120: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.descto_ctes.sucursal'
      FixedChar = True
      Size = 200
    end
    object FloatField111: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.descto_ctes.descto'
    end
  end
  object DataSource148: TDataSource
    Left = 392
    Top = 576
  end
  object qlistapre: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'SELECT MENUDEO, MAYOREO'
      'FROM LISTAPRECIOS'
      'WHERE COD_ART = :cod_art ')
    Left = 520
    Top = 552
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_art'
        ParamType = ptInput
      end>
    object qlistapremenudeo: TFloatField
      FieldName = 'menudeo'
    end
    object qlistapremayoreo: TFloatField
      FieldName = 'mayoreo'
    end
  end
  object DataSource149: TDataSource
    DataSet = qlistapre
    Left = 552
    Top = 552
  end
  object DataSource150: TDataSource
    DataSet = Query6
    Left = 552
    Top = 592
  end
  object Query6: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update inartrcl'
      'set importe = :importe, sal_fac = :importe'
      'where num_docto = :num_doc and num_emp= :num_emp'
      '')
    Left = 520
    Top = 592
    ParamData = <
      item
        DataType = ftString
        Name = 'importe'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'importe'
        ParamType = ptInput
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
  end
  object upcamnomvtas: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update ventas'
      'set nombre = :nombre'
      'where folio = :folio')
    Left = 432
    Top = 536
    ParamData = <
      item
        DataType = ftString
        Name = 'nombre'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end>
  end
  object DataSource151: TDataSource
    DataSet = upcamnomvtas
    Left = 464
    Top = 536
  end
  object UPTAB04: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update tableta'
      'set num_emp = :num_emp '
      'where folio = :folio'
      '')
    Left = 568
    Top = 672
    ParamData = <
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptUnknown
      end>
    object StringField121: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inartrcl.num_emp'
      FixedChar = True
      Size = 2
    end
    object StringField122: TStringField
      FieldName = 'num_suc'
      Origin = 'COMYLEG.inartrcl.num_suc'
      FixedChar = True
      Size = 2
    end
    object StringField123: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.inartrcl.cod_cli'
      FixedChar = True
      Size = 8
    end
    object StringField124: TStringField
      FieldName = 'tipo'
      Origin = 'COMYLEG.inartrcl.tipo'
      FixedChar = True
      Size = 2
    end
    object StringField125: TStringField
      FieldName = 'num_docto'
      Origin = 'COMYLEG.inartrcl.num_docto'
      FixedChar = True
      Size = 10
    end
    object FloatField112: TFloatField
      FieldName = 'importe'
      Origin = 'COMYLEG.inartrcl.importe'
    end
    object FloatField113: TFloatField
      FieldName = 'sal_fac'
      Origin = 'COMYLEG.inartrcl.sal_fac'
    end
    object FloatField114: TFloatField
      FieldName = 'sal_iva'
      Origin = 'COMYLEG.inartrcl.sal_iva'
    end
    object DateField4: TDateField
      FieldName = 'fecha'
      Origin = 'COMYLEG.inartrcl.fecha'
    end
  end
  object DataSource152: TDataSource
    DataSet = UPTAB04
    Left = 600
    Top = 672
  end
  object DataSource153: TDataSource
    DataSet = UPVTAS04
    Left = 600
    Top = 712
  end
  object UPVTAS04: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update ventas'
      'set num_emp = :num_emp'
      'where folio = :folio')
    Left = 568
    Top = 712
    ParamData = <
      item
        DataType = ftString
        Name = 'num_emp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'folio'
        ParamType = ptInput
      end>
  end
  object upcortecaja: TTable
    DatabaseName = 'comyleg'
    TableName = 'tmp_tarjeta'
    Left = 720
    Top = 376
    object upcortecajano_doc: TStringField
      FieldName = 'no_doc'
      FixedChar = True
    end
    object upcortecajatdebito: TFloatField
      FieldName = 'tdebito'
    end
    object upcortecajatcredito: TFloatField
      FieldName = 'tcredito'
    end
    object upcortecajanum_emp: TStringField
      FieldName = 'num_emp'
      FixedChar = True
      Size = 2
    end
  end
  object DataSource154: TDataSource
    DataSet = upcortecaja
    Left = 752
    Top = 376
  end
  object qerror: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select  *'
      'from inarfac'
      'where num_doc = :num_doc ')
    Left = 352
    Top = 680
    ParamData = <
      item
        DataType = ftString
        Name = 'num_doc'
        ParamType = ptInput
      end>
    object qerrornum_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inarfac.num_emp'
      FixedChar = True
      Size = 2
    end
    object qerrornum_suc: TStringField
      FieldName = 'num_suc'
      Origin = 'COMYLEG.inarfac.num_suc'
      FixedChar = True
      Size = 2
    end
    object qerrornum_doc: TStringField
      FieldName = 'num_doc'
      Origin = 'COMYLEG.inarfac.num_doc'
      FixedChar = True
      Size = 10
    end
    object qerrorcod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.inarfac.cod_cli'
      FixedChar = True
      Size = 8
    end
    object qerrorraz_soc: TStringField
      FieldName = 'raz_soc'
      Origin = 'COMYLEG.inarfac.raz_soc'
      FixedChar = True
      Size = 50
    end
    object qerrordom_cli: TStringField
      FieldName = 'dom_cli'
      Origin = 'COMYLEG.inarfac.dom_cli'
      FixedChar = True
      Size = 60
    end
    object qerrorciu_cli: TStringField
      FieldName = 'ciu_cli'
      Origin = 'COMYLEG.inarfac.ciu_cli'
      FixedChar = True
    end
    object qerrorest_cli: TStringField
      FieldName = 'est_cli'
      Origin = 'COMYLEG.inarfac.est_cli'
      FixedChar = True
      Size = 10
    end
    object qerroremb_nom: TStringField
      FieldName = 'emb_nom'
      Origin = 'COMYLEG.inarfac.emb_nom'
      FixedChar = True
      Size = 40
    end
    object qerroremb_dom: TStringField
      FieldName = 'emb_dom'
      Origin = 'COMYLEG.inarfac.emb_dom'
      FixedChar = True
      Size = 40
    end
    object qerroremb_pob: TStringField
      FieldName = 'emb_pob'
      Origin = 'COMYLEG.inarfac.emb_pob'
      FixedChar = True
      Size = 30
    end
    object qerrornum_ped: TIntegerField
      FieldName = 'num_ped'
      Origin = 'COMYLEG.inarfac.num_ped'
    end
    object qerrorfech_ped: TDateField
      FieldName = 'fech_ped'
      Origin = 'COMYLEG.inarfac.fech_ped'
    end
    object qerrornum_ord: TIntegerField
      FieldName = 'num_ord'
      Origin = 'COMYLEG.inarfac.num_ord'
    end
    object qerrorfech_emb: TDateField
      FieldName = 'fech_emb'
      Origin = 'COMYLEG.inarfac.fech_emb'
    end
    object qerrorcon_cli: TStringField
      FieldName = 'con_cli'
      Origin = 'COMYLEG.inarfac.con_cli'
      FixedChar = True
      Size = 1
    end
    object qerrorag_fac: TSmallintField
      FieldName = 'ag_fac'
      Origin = 'COMYLEG.inarfac.ag_fac'
    end
    object qerrorimp_exe: TFloatField
      FieldName = 'imp_exe'
      Origin = 'COMYLEG.inarfac.imp_exe'
    end
    object qerrorimp_6: TFloatField
      FieldName = 'imp_6'
      Origin = 'COMYLEG.inarfac.imp_6'
    end
    object qerrorimp_15: TFloatField
      FieldName = 'imp_15'
      Origin = 'COMYLEG.inarfac.imp_15'
    end
    object qerrorimp_20: TFloatField
      FieldName = 'imp_20'
      Origin = 'COMYLEG.inarfac.imp_20'
    end
    object qerrordes_exe: TFloatField
      FieldName = 'des_exe'
      Origin = 'COMYLEG.inarfac.des_exe'
    end
    object qerrordes_6: TFloatField
      FieldName = 'des_6'
      Origin = 'COMYLEG.inarfac.des_6'
    end
    object qerrordes_15: TFloatField
      FieldName = 'des_15'
      Origin = 'COMYLEG.inarfac.des_15'
    end
    object qerrordes_20: TFloatField
      FieldName = 'des_20'
      Origin = 'COMYLEG.inarfac.des_20'
    end
    object qerroriva_6: TFloatField
      FieldName = 'iva_6'
      Origin = 'COMYLEG.inarfac.iva_6'
    end
    object qerroriva_15: TFloatField
      FieldName = 'iva_15'
      Origin = 'COMYLEG.inarfac.iva_15'
    end
    object qerroriva_20: TFloatField
      FieldName = 'iva_20'
      Origin = 'COMYLEG.inarfac.iva_20'
    end
    object qerrorcos_vta: TFloatField
      FieldName = 'cos_vta'
      Origin = 'COMYLEG.inarfac.cos_vta'
    end
    object qerrorflete: TFloatField
      FieldName = 'flete'
      Origin = 'COMYLEG.inarfac.flete'
    end
    object qerroriva_fle: TFloatField
      FieldName = 'iva_fle'
      Origin = 'COMYLEG.inarfac.iva_fle'
    end
    object qerrorcar_1: TFloatField
      FieldName = 'car_1'
      Origin = 'COMYLEG.inarfac.car_1'
    end
    object qerroriva_1: TFloatField
      FieldName = 'iva_1'
      Origin = 'COMYLEG.inarfac.iva_1'
    end
    object qerrorcar_2: TFloatField
      FieldName = 'car_2'
      Origin = 'COMYLEG.inarfac.car_2'
    end
    object qerroriva_2: TFloatField
      FieldName = 'iva_2'
      Origin = 'COMYLEG.inarfac.iva_2'
    end
    object qerrorfecha: TDateField
      FieldName = 'fecha'
      Origin = 'COMYLEG.inarfac.fecha'
    end
    object qerrorreg_fed: TStringField
      FieldName = 'reg_fed'
      Origin = 'COMYLEG.inarfac.reg_fed'
      FixedChar = True
    end
    object qerrortip_fac: TStringField
      FieldName = 'tip_fac'
      Origin = 'COMYLEG.inarfac.tip_fac'
      FixedChar = True
      Size = 1
    end
    object qerrorcajera: TStringField
      FieldName = 'cajera'
      Origin = 'COMYLEG.inarfac.cajera'
      FixedChar = True
      Size = 12
    end
  end
  object DataSource155: TDataSource
    Left = 384
    Top = 680
  end
  object qbusauto: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from autoriza'
      'where folio = :folio')
    Left = 480
    Top = 304
    ParamData = <
      item
        DataType = ftString
        Name = 'FOLIO'
        ParamType = ptInput
      end>
    object qbusautofolio: TStringField
      FieldName = 'folio'
      Origin = 'COMYLEG.autoriza.folio'
      FixedChar = True
      Size = 30
    end
    object qbusautocod_art: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.autoriza.cod_art'
      FixedChar = True
      Size = 40
    end
    object qbusautocan_kgs: TFloatField
      FieldName = 'can_kgs'
      Origin = 'COMYLEG.autoriza.can_kgs'
    end
    object qbusautocan_caj: TFloatField
      FieldName = 'can_caj'
      Origin = 'COMYLEG.autoriza.can_caj'
    end
    object qbusautopre_kgs: TFloatField
      FieldName = 'pre_kgs'
      Origin = 'COMYLEG.autoriza.pre_kgs'
    end
    object qbusautopre_caj: TFloatField
      FieldName = 'pre_caj'
      Origin = 'COMYLEG.autoriza.pre_caj'
    end
    object qbusautototal: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.autoriza.total'
    end
    object qbusautocliente: TStringField
      FieldName = 'cliente'
      Origin = 'COMYLEG.autoriza.cliente'
      FixedChar = True
    end
    object qbusautofecha: TDateField
      FieldName = 'fecha'
      Origin = 'COMYLEG.autoriza.fecha'
    end
    object qbusautobande: TIntegerField
      FieldName = 'bande'
      Origin = 'COMYLEG.autoriza.bande'
    end
    object qbusautovendedor: TStringField
      FieldName = 'vendedor'
      Origin = 'COMYLEG.autoriza.vendedor'
      FixedChar = True
      Size = 40
    end
  end
  object DataSource156: TDataSource
    Left = 512
    Top = 304
  end
  object qbuserror: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from AUTORIZA'
      'WHERE FOLIO = :folio AND COD_ART = :cod_art AND'
      ' CAN_KGS = :can_kgs AND TOTAL = :total')
    Left = 552
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'FOLIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cod_art'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'can_kgs'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'total'
        ParamType = ptInput
      end>
  end
  object DataSource157: TDataSource
    Left = 584
    Top = 272
  end
  object DataSource158: TDataSource
    Left = 584
    Top = 304
  end
  object qcerokgs: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'update ventas'
      'set  kilos = '#39'0'#39
      'where folio = :folio and codigo = :cod_art AND renglon = :ren'
      '')
    Left = 552
    Top = 304
    ParamData = <
      item
        DataType = ftString
        Name = 'FOLIO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cod_art'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ren'
        ParamType = ptUnknown
      end>
    object StringField128: TStringField
      FieldName = 'folio'
      Origin = 'COMYLEG.autoriza.folio'
      FixedChar = True
      Size = 30
    end
    object StringField129: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.autoriza.cod_art'
      FixedChar = True
      Size = 40
    end
    object FloatField116: TFloatField
      FieldName = 'can_kgs'
      Origin = 'COMYLEG.autoriza.can_kgs'
    end
    object FloatField117: TFloatField
      FieldName = 'can_caj'
      Origin = 'COMYLEG.autoriza.can_caj'
    end
    object FloatField118: TFloatField
      FieldName = 'pre_kgs'
      Origin = 'COMYLEG.autoriza.pre_kgs'
    end
    object FloatField119: TFloatField
      FieldName = 'pre_caj'
      Origin = 'COMYLEG.autoriza.pre_caj'
    end
    object FloatField120: TFloatField
      FieldName = 'total'
      Origin = 'COMYLEG.autoriza.total'
    end
    object StringField130: TStringField
      FieldName = 'cliente'
      Origin = 'COMYLEG.autoriza.cliente'
      FixedChar = True
    end
    object DateField5: TDateField
      FieldName = 'fecha'
      Origin = 'COMYLEG.autoriza.fecha'
    end
    object IntegerField28: TIntegerField
      FieldName = 'bande'
      Origin = 'COMYLEG.autoriza.bande'
    end
    object StringField131: TStringField
      FieldName = 'vendedor'
      Origin = 'COMYLEG.autoriza.vendedor'
      FixedChar = True
      Size = 40
    end
  end
  object AUTORIZA: TTable
    DatabaseName = 'comyleg'
    TableName = 'autoriza'
    Left = 560
    Top = 344
    object AUTORIZAfolio: TStringField
      FieldName = 'folio'
      FixedChar = True
      Size = 30
    end
    object AUTORIZAcod_art: TStringField
      FieldName = 'cod_art'
      FixedChar = True
      Size = 40
    end
    object AUTORIZAcan_kgs: TFloatField
      FieldName = 'can_kgs'
    end
    object AUTORIZAcan_caj: TFloatField
      FieldName = 'can_caj'
    end
    object AUTORIZApre_kgs: TFloatField
      FieldName = 'pre_kgs'
    end
    object AUTORIZApre_caj: TFloatField
      FieldName = 'pre_caj'
    end
    object AUTORIZAtotal: TFloatField
      FieldName = 'total'
    end
    object AUTORIZAcliente: TStringField
      FieldName = 'cliente'
      FixedChar = True
    end
    object AUTORIZAfecha: TDateField
      FieldName = 'fecha'
    end
    object AUTORIZAbande: TIntegerField
      FieldName = 'bande'
    end
    object AUTORIZAvendedor: TStringField
      FieldName = 'vendedor'
      FixedChar = True
      Size = 40
    end
  end
  object DataSource159: TDataSource
    DataSet = AUTORIZA
    Left = 592
    Top = 344
  end
  object qsacapor: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'SELECT *'
      'from  porce'
      'where cod_cli = :cod_cli and sucu ='#39'1'#39)
    Left = 560
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_cli'
        ParamType = ptInput
      end>
    object qsacaporcod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.porce.cod_cli'
      FixedChar = True
      Size = 25
    end
    object qsacaporporce: TFloatField
      FieldName = 'porce'
      Origin = 'COMYLEG.porce.porce'
    end
    object qsacaporsucu: TStringField
      FieldName = 'sucu'
      Origin = 'COMYLEG.porce.sucu'
      FixedChar = True
      Size = 30
    end
    object qsacaporcod_pro: TStringField
      FieldName = 'cod_pro'
      Origin = 'COMYLEG.porce.cod_pro'
      FixedChar = True
      Size = 10
    end
  end
  object DataSource160: TDataSource
    DataSet = qsacapor
    Left = 592
    Top = 392
  end
  object qsacapor2: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'SELECT *'
      'from  porce'
      'where cod_cli = :cod_cli and sucu = :sucu')
    Left = 560
    Top = 424
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_cli'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'sucu'
        ParamType = ptInput
      end>
    object StringField126: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.porce.cod_cli'
      FixedChar = True
      Size = 25
    end
    object FloatField115: TFloatField
      FieldName = 'porce'
      Origin = 'COMYLEG.porce.porce'
    end
    object StringField127: TStringField
      FieldName = 'sucu'
      Origin = 'COMYLEG.porce.sucu'
      FixedChar = True
      Size = 30
    end
    object StringField132: TStringField
      FieldName = 'cod_pro'
      Origin = 'COMYLEG.porce.cod_pro'
      FixedChar = True
      Size = 10
    end
  end
  object DataSource161: TDataSource
    DataSet = qsacapor2
    Left = 592
    Top = 424
  end
  object qsacapor3: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'SELECT *'
      'from  porce'
      'where cod_cli = :cod_cli and sucu = :sucu and cod_pro = :cod_pro')
    Left = 560
    Top = 456
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_cli'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'sucu'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cod_pro'
        ParamType = ptInput
      end>
    object StringField133: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.porce.cod_cli'
      FixedChar = True
      Size = 25
    end
    object FloatField121: TFloatField
      FieldName = 'porce'
      Origin = 'COMYLEG.porce.porce'
    end
    object StringField134: TStringField
      FieldName = 'sucu'
      Origin = 'COMYLEG.porce.sucu'
      FixedChar = True
      Size = 30
    end
    object StringField135: TStringField
      FieldName = 'cod_pro'
      Origin = 'COMYLEG.porce.cod_pro'
      FixedChar = True
      Size = 10
    end
  end
  object DataSource162: TDataSource
    DataSet = qsacapor3
    Left = 592
    Top = 456
  end
  object qcolesa: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from actu_tablet '
      '')
    Left = 200
    Top = 712
    object qcolesano_actu: TStringField
      FieldName = 'no_actu'
      Origin = 'COMYLEG.actu_tablet.no_actu'
      FixedChar = True
      Size = 2
    end
    object qcolesafecha: TDateField
      FieldName = 'fecha'
      Origin = 'COMYLEG.actu_tablet.fecha'
    end
  end
  object qtablet: TQuery
    DatabaseName = 'ventas'
    SQL.Strings = (
      'select *'
      'from actualiza'
      '')
    Left = 200
    Top = 760
    object qtabletNo_actu: TStringField
      FieldName = 'No_actu'
      Origin = 'VENTAS."actualiza.DB".No_actu'
      Size = 2
    end
    object qtabletFecha: TDateField
      FieldName = 'Fecha'
      Origin = 'VENTAS."actualiza.DB".Fecha'
    end
  end
  object DataSource163: TDataSource
    DataSet = qcolesa
    Left = 232
    Top = 712
  end
  object DataSource164: TDataSource
    DataSet = qtablet
    Left = 232
    Top = 760
  end
  object DataSource165: TDataSource
    DataSet = actualiza
    Left = 232
    Top = 800
  end
  object actualiza: TTable
    DatabaseName = 'ventas'
    TableName = 'actualiza'
    Left = 200
    Top = 800
    object actualizaNo_actu: TStringField
      FieldName = 'No_actu'
      Size = 2
    end
    object actualizaFecha: TDateField
      FieldName = 'Fecha'
    end
  end
  object LISTAPRECIOS2: TTable
    DatabaseName = 'ventas'
    TableName = 'listaprecios.db'
    Left = 264
    Top = 712
    object LISTAPRECIOS2Fecha: TDateField
      FieldName = 'Fecha'
    end
    object LISTAPRECIOS2Cod_art: TStringField
      FieldName = 'Cod_art'
      Size = 14
    end
    object LISTAPRECIOS2Des_art: TStringField
      FieldName = 'Des_art'
      Size = 50
    end
    object LISTAPRECIOS2Menudeo: TFloatField
      FieldName = 'Menudeo'
    end
    object LISTAPRECIOS2Mayoreo: TFloatField
      FieldName = 'Mayoreo'
    end
    object LISTAPRECIOS2Ban_men: TStringField
      FieldName = 'Ban_men'
      Size = 1
    end
    object LISTAPRECIOS2Ban_may: TStringField
      FieldName = 'Ban_may'
      Size = 1
    end
  end
  object DataSource166: TDataSource
    DataSet = LISTAPRECIOS2
    Left = 296
    Top = 712
  end
  object qlistata: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from listaprecios'
      '')
    Left = 264
    Top = 792
    object DateField8: TDateField
      FieldName = 'fecha'
      Origin = 'COMYLEG.listaprecios.fecha'
    end
    object StringField140: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.listaprecios.cod_art'
      FixedChar = True
      Size = 14
    end
    object StringField141: TStringField
      FieldName = 'des_art'
      Origin = 'COMYLEG.listaprecios.des_art'
      FixedChar = True
      Size = 40
    end
    object FloatField124: TFloatField
      FieldName = 'menudeo'
      Origin = 'COMYLEG.listaprecios.menudeo'
    end
    object FloatField125: TFloatField
      FieldName = 'mayoreo'
      Origin = 'COMYLEG.listaprecios.mayoreo'
    end
    object StringField142: TStringField
      FieldName = 'ban_men'
      Origin = 'COMYLEG.listaprecios.ban_men'
      FixedChar = True
      Size = 1
    end
    object StringField143: TStringField
      FieldName = 'ban_may'
      Origin = 'COMYLEG.listaprecios.ban_may'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource167: TDataSource
    DataSet = qlistata
    Left = 296
    Top = 792
  end
  object DataSource168: TDataSource
    DataSet = qborrota
    Left = 296
    Top = 760
  end
  object qborrota: TQuery
    DatabaseName = 'ventas'
    SQL.Strings = (
      'delete'
      'from listaprecios'
      '')
    Left = 264
    Top = 760
    object DateField7: TDateField
      FieldName = 'fecha'
      Origin = 'COMYLEG.listaprecios.fecha'
    end
    object StringField144: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.listaprecios.cod_art'
      FixedChar = True
      Size = 14
    end
    object StringField145: TStringField
      FieldName = 'des_art'
      Origin = 'COMYLEG.listaprecios.des_art'
      FixedChar = True
      Size = 40
    end
    object FloatField126: TFloatField
      FieldName = 'menudeo'
      Origin = 'COMYLEG.listaprecios.menudeo'
    end
    object FloatField127: TFloatField
      FieldName = 'mayoreo'
      Origin = 'COMYLEG.listaprecios.mayoreo'
    end
    object StringField146: TStringField
      FieldName = 'ban_men'
      Origin = 'COMYLEG.listaprecios.ban_men'
      FixedChar = True
      Size = 1
    end
    object StringField147: TStringField
      FieldName = 'ban_may'
      Origin = 'COMYLEG.listaprecios.ban_may'
      FixedChar = True
      Size = 1
    end
  end
  object qbusprecio: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'from listaprecios'
      'where cod_art = :cod_art AND (MENUDEO<>'#39'0'#39' OR MAYOREO <>'#39'0'#39')'
      '')
    Left = 432
    Top = 408
    ParamData = <
      item
        DataType = ftString
        Name = 'cod_art'
        ParamType = ptInput
      end>
    object qbuspreciofecha: TDateField
      FieldName = 'fecha'
      Origin = 'COMYLEG.listaprecios.fecha'
    end
    object qbuspreciocod_art: TStringField
      FieldName = 'cod_art'
      Origin = 'COMYLEG.listaprecios.cod_art'
      FixedChar = True
      Size = 14
    end
    object qbuspreciodes_art: TStringField
      FieldName = 'des_art'
      Origin = 'COMYLEG.listaprecios.des_art'
      FixedChar = True
      Size = 40
    end
    object qbuspreciomenudeo: TFloatField
      FieldName = 'menudeo'
      Origin = 'COMYLEG.listaprecios.menudeo'
    end
    object qbuspreciomayoreo: TFloatField
      FieldName = 'mayoreo'
      Origin = 'COMYLEG.listaprecios.mayoreo'
    end
    object qbusprecioban_men: TStringField
      FieldName = 'ban_men'
      Origin = 'COMYLEG.listaprecios.ban_men'
      FixedChar = True
      Size = 4
    end
    object qbusprecioban_may: TStringField
      FieldName = 'ban_may'
      Origin = 'COMYLEG.listaprecios.ban_may'
      FixedChar = True
      Size = 4
    end
  end
  object DataSource169: TDataSource
    Left = 464
    Top = 408
  end
  object QBUSDESCTO: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'FROM DESCTO_CTES'
      'WHERE COD_CLI = '#39'E257L'#39' ')
    Left = 288
    Top = 592
    object QBUSDESCTOcod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.descto_ctes.cod_cli'
      FixedChar = True
    end
    object QBUSDESCTOsucursal: TStringField
      FieldName = 'sucursal'
      Origin = 'COMYLEG.descto_ctes.sucursal'
      FixedChar = True
      Size = 200
    end
    object QBUSDESCTOdescto: TFloatField
      FieldName = 'descto'
      Origin = 'COMYLEG.descto_ctes.descto'
    end
  end
  object DataSource170: TDataSource
    DataSet = QBUSDESCTO
    Left = 320
    Top = 592
  end
  object QBUSEMP04: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'select *'
      'FROM INARCL'
      'WHERE COD_CLI = :COD_CLI AND NUM_EMP ='#39'04'#39' ')
    Left = 288
    Top = 640
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_CLI'
        ParamType = ptInput
      end>
    object QBUSEMP04num_emp: TStringField
      FieldName = 'num_emp'
      Origin = 'COMYLEG.inarcl.num_emp'
      FixedChar = True
      Size = 2
    end
    object QBUSEMP04cod_cli: TStringField
      FieldName = 'cod_cli'
      Origin = 'COMYLEG.inarcl.cod_cli'
      FixedChar = True
      Size = 8
    end
    object QBUSEMP04raz_soc: TStringField
      FieldName = 'raz_soc'
      Origin = 'COMYLEG.inarcl.raz_soc'
      FixedChar = True
      Size = 150
    end
    object QBUSEMP04dom_cli: TStringField
      FieldName = 'dom_cli'
      Origin = 'COMYLEG.inarcl.dom_cli'
      FixedChar = True
      Size = 60
    end
    object QBUSEMP04ciu_cli: TStringField
      FieldName = 'ciu_cli'
      Origin = 'COMYLEG.inarcl.ciu_cli'
      FixedChar = True
    end
    object QBUSEMP04est_cli: TStringField
      FieldName = 'est_cli'
      Origin = 'COMYLEG.inarcl.est_cli'
      FixedChar = True
      Size = 10
    end
    object QBUSEMP04tel_cli: TStringField
      FieldName = 'tel_cli'
      Origin = 'COMYLEG.inarcl.tel_cli'
      FixedChar = True
      Size = 12
    end
    object QBUSEMP04rfc_cli: TStringField
      FieldName = 'rfc_cli'
      Origin = 'COMYLEG.inarcl.rfc_cli'
      FixedChar = True
    end
    object QBUSEMP04cod_pos: TIntegerField
      FieldName = 'cod_pos'
      Origin = 'COMYLEG.inarcl.cod_pos'
    end
    object QBUSEMP04age_cli: TSmallintField
      FieldName = 'age_cli'
      Origin = 'COMYLEG.inarcl.age_cli'
    end
    object QBUSEMP04con_cli: TStringField
      FieldName = 'con_cli'
      Origin = 'COMYLEG.inarcl.con_cli'
      FixedChar = True
      Size = 1
    end
    object QBUSEMP04pla_cli: TSmallintField
      FieldName = 'pla_cli'
      Origin = 'COMYLEG.inarcl.pla_cli'
    end
    object QBUSEMP04sta_cli: TStringField
      FieldName = 'sta_cli'
      Origin = 'COMYLEG.inarcl.sta_cli'
      FixedChar = True
      Size = 1
    end
    object QBUSEMP04lim_cre: TFloatField
      FieldName = 'lim_cre'
      Origin = 'COMYLEG.inarcl.lim_cre'
    end
    object QBUSEMP04sal_act: TFloatField
      FieldName = 'sal_act'
      Origin = 'COMYLEG.inarcl.sal_act'
    end
    object QBUSEMP04sal_ant: TFloatField
      FieldName = 'sal_ant'
      Origin = 'COMYLEG.inarcl.sal_ant'
    end
    object QBUSEMP04com_mes: TFloatField
      FieldName = 'com_mes'
      Origin = 'COMYLEG.inarcl.com_mes'
    end
    object QBUSEMP04cos_mes: TFloatField
      FieldName = 'cos_mes'
      Origin = 'COMYLEG.inarcl.cos_mes'
    end
    object QBUSEMP04com_acu: TFloatField
      FieldName = 'com_acu'
      Origin = 'COMYLEG.inarcl.com_acu'
    end
    object QBUSEMP04cos_acu: TFloatField
      FieldName = 'cos_acu'
      Origin = 'COMYLEG.inarcl.cos_acu'
    end
    object QBUSEMP04fech_com: TDateField
      FieldName = 'fech_com'
      Origin = 'COMYLEG.inarcl.fech_com'
    end
    object QBUSEMP04can_com: TFloatField
      FieldName = 'can_com'
      Origin = 'COMYLEG.inarcl.can_com'
    end
    object QBUSEMP04fech_pag: TDateField
      FieldName = 'fech_pag'
      Origin = 'COMYLEG.inarcl.fech_pag'
    end
    object QBUSEMP04imp_pag: TFloatField
      FieldName = 'imp_pag'
      Origin = 'COMYLEG.inarcl.imp_pag'
    end
    object QBUSEMP04curp: TStringField
      FieldName = 'curp'
      Origin = 'COMYLEG.inarcl.curp'
      FixedChar = True
      Size = 18
    end
    object QBUSEMP04apodo: TStringField
      FieldName = 'apodo'
      Origin = 'COMYLEG.inarcl.apodo'
      FixedChar = True
      Size = 40
    end
    object QBUSEMP04observa: TStringField
      FieldName = 'observa'
      Origin = 'COMYLEG.inarcl.observa'
      FixedChar = True
      Size = 50
    end
  end
  object DataSource171: TDataSource
    DataSet = QBUSEMP04
    Left = 320
    Top = 640
  end
  object DataSource172: TDataSource
    Left = 776
    Top = 224
  end
  object qBuscaCanEmp: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'SELECT can_emp FROM inarinv WHERE num_emp = :emp AND cod_art = :cod'
      ''
      '')
    Left = 744
    Top = 264
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
  object qmarcapresentacion: TQuery
    DatabaseName = 'comyleg'
    SQL.Strings = (
      'UPDATE ventas '
      'SET id_presentacion = :idpres '
      'WHERE num_emp = :emp AND folio = :folio AND renglon = :reng'
      ''
      '')
    Left = 744
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'idpres'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'emp'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FOLIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'reng'
        ParamType = ptInput
      end>
  end
end
