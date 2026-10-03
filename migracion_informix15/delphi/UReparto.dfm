object FormReparto: TFormReparto
  Left = 90
  Top = 60
  Caption = 'Pedidos a Ruta de Reparto'
  ClientHeight = 640
  ClientWidth = 1020
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlIzq: TPanel
    Left = 8
    Top = 8
    Width = 420
    Height = 624
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
    object lblUsuario: TLabel
      Left = 110
      Top = 0
      Width = 90
      Height = 13
      Caption = 'Capturo (iniciales)'
    end
    object edtUsuario: TEdit
      Left = 110
      Top = 18
      Width = 80
      Height = 21
    end
    object lblFechaRuta: TLabel
      Left = 0
      Top = 48
      Width = 100
      Height = 13
      Caption = 'Fecha de la ruta'
    end
    object edtFechaRuta: TEdit
      Left = 0
      Top = 66
      Width = 120
      Height = 21
    end
    object lblClaveVehiculo: TLabel
      Left = 0
      Top = 96
      Width = 150
      Height = 13
      Caption = 'Vehiculo (numero economico)'
    end
    object edtClaveVehiculo: TEdit
      Left = 0
      Top = 114
      Width = 120
      Height = 21
      OnExit = edtClaveVehiculoExit
    end
    object lblVehiculoResuelto: TLabel
      Left = 130
      Top = 118
      Width = 280
      Height = 13
      Caption = ''
    end
    object lblClaveChofer: TLabel
      Left = 0
      Top = 144
      Width = 80
      Height = 13
      Caption = 'Chofer (clave)'
    end
    object edtClaveChofer: TEdit
      Left = 0
      Top = 162
      Width = 120
      Height = 21
      OnExit = edtClaveChoferExit
    end
    object lblChoferResuelto: TLabel
      Left = 130
      Top = 166
      Width = 280
      Height = 13
      Caption = ''
    end
    object btnNuevaRuta: TButton
      Left = 0
      Top = 194
      Width = 95
      Height = 25
      Caption = 'Nueva ruta'
      OnClick = btnNuevaRutaClick
    end
    object btnGuardarRuta: TButton
      Left = 100
      Top = 194
      Width = 95
      Height = 25
      Caption = 'Guardar ruta'
      OnClick = btnGuardarRutaClick
    end
    object btnMarcarSalida: TButton
      Left = 200
      Top = 194
      Width = 105
      Height = 25
      Caption = 'Marcar salida'
      OnClick = btnMarcarSalidaClick
    end
    object btnMarcarRegreso: TButton
      Left = 310
      Top = 194
      Width = 105
      Height = 25
      Caption = 'Marcar regreso'
      OnClick = btnMarcarRegresoClick
    end
    object lblRutasDia: TLabel
      Left = 0
      Top = 230
      Width = 150
      Height = 13
      Caption = 'Rutas de la fecha capturada'
    end
    object dbgRutasDia: TDBGrid
      Left = 0
      Top = 248
      Width = 412
      Height = 160
      DataSource = dsRutasDia
      TabOrder = 10
      OnDblClick = dbgRutasDiaDblClick
    end
    object lblPedidos: TLabel
      Left = 0
      Top = 418
      Width = 150
      Height = 13
      Caption = 'Pedidos de la ruta seleccionada'
    end
    object dbgPedidos: TDBGrid
      Left = 0
      Top = 436
      Width = 412
      Height = 180
      DataSource = dsPedidos
      TabOrder = 11
      OnDblClick = dbgPedidosDblClick
    end
  end
  object pnlDer: TPanel
    Left = 440
    Top = 8
    Width = 572
    Height = 624
    BevelOuter = bvNone
    object lblOrdenVisita: TLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 13
      Caption = 'Orden visita'
    end
    object edtOrdenVisita: TEdit
      Left = 0
      Top = 18
      Width = 80
      Height = 21
    end
    object lblFolioVenta: TLabel
      Left = 90
      Top = 0
      Width = 90
      Height = 13
      Caption = 'Folio venta (opc.)'
    end
    object edtFolioVenta: TEdit
      Left = 90
      Top = 18
      Width = 90
      Height = 21
    end
    object lblSucursalVenta: TLabel
      Left = 190
      Top = 0
      Width = 60
      Height = 13
      Caption = 'Sucursal'
    end
    object edtSucursalVenta: TEdit
      Left = 190
      Top = 18
      Width = 90
      Height = 21
    end
    object lblTipoVenta: TLabel
      Left = 290
      Top = 0
      Width = 30
      Height = 13
      Caption = 'Tipo'
    end
    object edtTipoVenta: TEdit
      Left = 290
      Top = 18
      Width = 60
      Height = 21
    end
    object lblCliente: TLabel
      Left = 0
      Top = 56
      Width = 36
      Height = 13
      Caption = 'Cliente'
    end
    object edtCliente: TEdit
      Left = 0
      Top = 74
      Width = 400
      Height = 21
    end
    object lblDireccionEntrega: TLabel
      Left = 0
      Top = 104
      Width = 100
      Height = 13
      Caption = 'Direccion de entrega'
    end
    object edtDireccionEntrega: TEdit
      Left = 0
      Top = 122
      Width = 550
      Height = 21
    end
    object lblTelefono: TLabel
      Left = 0
      Top = 152
      Width = 46
      Height = 13
      Caption = 'Telefono'
    end
    object edtTelefono: TEdit
      Left = 0
      Top = 170
      Width = 150
      Height = 21
    end
    object lblReferenciaPedido: TLabel
      Left = 170
      Top = 152
      Width = 110
      Height = 13
      Caption = 'Referencia de pedido'
    end
    object edtReferenciaPedido: TEdit
      Left = 170
      Top = 170
      Width = 150
      Height = 21
    end
    object lblImporteTotal: TLabel
      Left = 340
      Top = 152
      Width = 70
      Height = 13
      Caption = 'Importe total'
    end
    object edtImporteTotal: TEdit
      Left = 340
      Top = 170
      Width = 100
      Height = 21
    end
    object btnNuevoPedido: TButton
      Left = 0
      Top = 202
      Width = 110
      Height = 25
      Caption = 'Nuevo pedido'
      OnClick = btnNuevoPedidoClick
    end
    object btnGuardarPedido: TButton
      Left = 118
      Top = 202
      Width = 110
      Height = 25
      Caption = 'Guardar pedido'
      OnClick = btnGuardarPedidoClick
    end
    object btnEliminarPedido: TButton
      Left = 236
      Top = 202
      Width = 110
      Height = 25
      Caption = 'Quitar de ruta'
      OnClick = btnEliminarPedidoClick
    end
    object btnImprimirRemision: TButton
      Left = 354
      Top = 202
      Width = 140
      Height = 25
      Caption = 'Imprimir remision'
      OnClick = btnImprimirRemisionClick
    end
    object lblQuienRecibio: TLabel
      Left = 0
      Top = 240
      Width = 150
      Height = 13
      Caption = 'Quien recibio (firma/sello)'
    end
    object edtQuienRecibio: TEdit
      Left = 0
      Top = 258
      Width = 260
      Height = 21
    end
    object lblObservacionesEntrega: TLabel
      Left = 0
      Top = 288
      Width = 170
      Height = 13
      Caption = 'Observaciones de entrega'
    end
    object edtObservacionesEntrega: TEdit
      Left = 0
      Top = 306
      Width = 550
      Height = 21
    end
    object btnMarcarCargado: TButton
      Left = 0
      Top = 338
      Width = 130
      Height = 25
      Caption = 'Marcar: Cargado'
      OnClick = btnMarcarCargadoClick
    end
    object btnMarcarEnRuta: TButton
      Left = 136
      Top = 338
      Width = 130
      Height = 25
      Caption = 'Marcar: En ruta'
      OnClick = btnMarcarEnRutaClick
    end
    object btnMarcarEntregado: TButton
      Left = 272
      Top = 338
      Width = 130
      Height = 25
      Caption = 'Marcar: Entregado'
      OnClick = btnMarcarEntregadoClick
    end
    object btnMarcarNoEntregado: TButton
      Left = 408
      Top = 338
      Width = 150
      Height = 25
      Caption = 'Marcar: No entregado'
      OnClick = btnMarcarNoEntregadoClick
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
    Left = 960
    Top = 8
  end
  object qRutasDia: TQuery
    DatabaseName = 'comyleg'
    Left = 960
    Top = 48
  end
  object dsRutasDia: TDataSource
    DataSet = qRutasDia
    Left = 960
    Top = 88
  end
  object qPedidos: TQuery
    DatabaseName = 'comyleg'
    Left = 960
    Top = 128
  end
  object dsPedidos: TDataSource
    DataSet = qPedidos
    Left = 960
    Top = 168
  end
  object qImprime: TQuery
    DatabaseName = 'comyleg'
    Left = 960
    Top = 208
  end
end
