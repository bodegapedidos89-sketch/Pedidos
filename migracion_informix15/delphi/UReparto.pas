unit UReparto;

{
  Modulo de pedidos a ruta de reparto. Inspirado en el patron de
  captura de JUNTA.dfm (grid + panel de captura + botones de accion),
  pero adaptado por completo a un proceso distinto: aqui no se vende
  nada -- se arma la ruta del dia (vehiculo + chofer de
  flotilla_vehiculo/flotilla_chofer), se le asignan los pedidos que
  van a reparto, se les da seguimiento de estatus (Pendiente/Cargado/
  En ruta/Entregado/No entregado, con historial) y se imprime una
  remision por pedido para que el cliente firme o selle de recibido.

  Ver DOCUMENTACION_reparto.md para el flujo completo, el significado
  de cada estatus y las opciones sugeridas para tener el estatus
  actualizado "en tiempo real" (URepartoMonitor.pas es la primera de
  esas opciones, ya implementada).
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBTables, Printers;

type
  TFormReparto = class(TForm)
    Database1: TDatabase;
    pnlIzq: TPanel;
    pnlDer: TPanel;
    lblEmpresa: TLabel;
    edtEmpresa: TEdit;
    lblUsuario: TLabel;
    edtUsuario: TEdit;
    lblFechaRuta: TLabel;
    edtFechaRuta: TEdit;
    lblClaveVehiculo: TLabel;
    edtClaveVehiculo: TEdit;
    lblVehiculoResuelto: TLabel;
    lblClaveChofer: TLabel;
    edtClaveChofer: TEdit;
    lblChoferResuelto: TLabel;
    btnNuevaRuta: TButton;
    btnGuardarRuta: TButton;
    btnMarcarSalida: TButton;
    btnMarcarRegreso: TButton;
    lblRutasDia: TLabel;
    dbgRutasDia: TDBGrid;
    qRutasDia: TQuery;
    dsRutasDia: TDataSource;
    lblPedidos: TLabel;
    dbgPedidos: TDBGrid;
    qPedidos: TQuery;
    dsPedidos: TDataSource;
    lblOrdenVisita: TLabel;
    edtOrdenVisita: TEdit;
    lblFolioVenta: TLabel;
    edtFolioVenta: TEdit;
    lblSucursalVenta: TLabel;
    edtSucursalVenta: TEdit;
    lblTipoVenta: TLabel;
    edtTipoVenta: TEdit;
    lblCliente: TLabel;
    edtCliente: TEdit;
    lblDireccionEntrega: TLabel;
    edtDireccionEntrega: TEdit;
    lblTelefono: TLabel;
    edtTelefono: TEdit;
    lblReferenciaPedido: TLabel;
    edtReferenciaPedido: TEdit;
    lblImporteTotal: TLabel;
    edtImporteTotal: TEdit;
    btnNuevoPedido: TButton;
    btnGuardarPedido: TButton;
    btnEliminarPedido: TButton;
    lblQuienRecibio: TLabel;
    edtQuienRecibio: TEdit;
    lblObservacionesEntrega: TLabel;
    edtObservacionesEntrega: TEdit;
    btnMarcarCargado: TButton;
    btnMarcarEnRuta: TButton;
    btnMarcarEntregado: TButton;
    btnMarcarNoEntregado: TButton;
    btnImprimirRemision: TButton;
    qImprime: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure edtClaveVehiculoExit(Sender: TObject);
    procedure edtClaveChoferExit(Sender: TObject);
    procedure btnNuevaRutaClick(Sender: TObject);
    procedure btnGuardarRutaClick(Sender: TObject);
    procedure btnMarcarSalidaClick(Sender: TObject);
    procedure btnMarcarRegresoClick(Sender: TObject);
    procedure dbgRutasDiaDblClick(Sender: TObject);
    procedure dbgPedidosDblClick(Sender: TObject);
    procedure btnNuevoPedidoClick(Sender: TObject);
    procedure btnGuardarPedidoClick(Sender: TObject);
    procedure btnEliminarPedidoClick(Sender: TObject);
    procedure btnMarcarCargadoClick(Sender: TObject);
    procedure btnMarcarEnRutaClick(Sender: TObject);
    procedure btnMarcarEntregadoClick(Sender: TObject);
    procedure btnMarcarNoEntregadoClick(Sender: TObject);
    procedure btnImprimirRemisionClick(Sender: TObject);
  private
    FIdRutaActual: Integer;
    FIdPedidoActual: Integer;
    function ResuelveVehiculoPorClave(const Clave: string; out IdVehiculo: Integer;
      out Desc: string): Boolean;
    function ResuelveChoferPorClave(const Clave: string; out IdChofer: Integer;
      out Desc: string): Boolean;
    procedure CargaRutasDia(Fecha: TDateTime);
    procedure CargaPedidos(IdRuta: Integer);
    procedure LimpiaRutaCaptura;
    procedure LimpiaPedidoCaptura;
    procedure CambiaEstatusPedido(const NuevoEstatus: string);
    procedure ImprimeRemision(IdPedido: Integer);
  end;

var
  FormReparto: TFormReparto;

implementation

{$R *.dfm}

function TFormReparto.ResuelveVehiculoPorClave(const Clave: string;
  out IdVehiculo: Integer; out Desc: string): Boolean;
var
  Q: TQuery;
begin
  Result := False;
  IdVehiculo := 0;
  Desc := '';
  if Trim(Clave) = '' then Exit;

  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := Database1.DatabaseName;
    Q.SQL.Text :=
      'SELECT id_vehiculo, placas, tipo_vehiculo FROM flotilla_vehiculo ' +
      'WHERE num_emp = :emp AND numero_economico = :clave AND activo = ''S''';
    Q.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
    Q.ParamByName('clave').AsString := Trim(Clave);
    Q.Open;
    if not Q.Eof then
    begin
      IdVehiculo := Q.FieldByName('id_vehiculo').AsInteger;
      Desc := Trim(Q.FieldByName('placas').AsString);
      Result := True;
    end;
    Q.Close;
  finally
    Q.Free;
  end;
end;

function TFormReparto.ResuelveChoferPorClave(const Clave: string;
  out IdChofer: Integer; out Desc: string): Boolean;
var
  Q: TQuery;
begin
  Result := False;
  IdChofer := 0;
  Desc := '';
  if Trim(Clave) = '' then Exit;

  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := Database1.DatabaseName;
    Q.SQL.Text :=
      'SELECT id_chofer, nombre FROM flotilla_chofer ' +
      'WHERE num_emp = :emp AND clave = :clave AND activo = ''S''';
    Q.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
    Q.ParamByName('clave').AsString := Trim(Clave);
    Q.Open;
    if not Q.Eof then
    begin
      IdChofer := Q.FieldByName('id_chofer').AsInteger;
      Desc := Trim(Q.FieldByName('nombre').AsString);
      Result := True;
    end;
    Q.Close;
  finally
    Q.Free;
  end;
end;

procedure TFormReparto.CargaRutasDia(Fecha: TDateTime);
begin
  qRutasDia.Close;
  qRutasDia.SQL.Text :=
    'SELECT r.id_ruta, r.fecha, r.estatus, r.hora_salida, r.hora_regreso, ' +
    'v.numero_economico, v.placas, c.clave AS clave_chofer, c.nombre AS chofer_nombre ' +
    'FROM reparto_ruta r, flotilla_vehiculo v, flotilla_chofer c ' +
    'WHERE r.num_emp = :emp AND r.fecha = :fecha ' +
    'AND r.id_vehiculo = v.id_vehiculo AND r.id_chofer = c.id_chofer ' +
    'ORDER BY r.id_ruta';
  qRutasDia.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qRutasDia.ParamByName('fecha').AsDateTime := Fecha;
  qRutasDia.Open;
end;

procedure TFormReparto.CargaPedidos(IdRuta: Integer);
begin
  FIdRutaActual := IdRuta;
  qPedidos.Close;
  if IdRuta = 0 then Exit;
  qPedidos.SQL.Text :=
    'SELECT * FROM reparto_pedido WHERE id_ruta = :idr AND activo = ''S'' ' +
    'ORDER BY orden_visita';
  qPedidos.ParamByName('idr').AsInteger := IdRuta;
  qPedidos.Open;
end;

procedure TFormReparto.LimpiaRutaCaptura;
begin
  FIdRutaActual := 0;
  edtFechaRuta.Text := DateToStr(Date);
  edtClaveVehiculo.Text := '';
  lblVehiculoResuelto.Caption := '';
  edtClaveChofer.Text := '';
  lblChoferResuelto.Caption := '';
  qPedidos.Close;
end;

procedure TFormReparto.LimpiaPedidoCaptura;
begin
  FIdPedidoActual := 0;
  edtOrdenVisita.Text := '';
  edtFolioVenta.Text := '';
  edtSucursalVenta.Text := '';
  edtTipoVenta.Text := '';
  edtCliente.Text := '';
  edtDireccionEntrega.Text := '';
  edtTelefono.Text := '';
  edtReferenciaPedido.Text := '';
  edtImporteTotal.Text := '';
  edtQuienRecibio.Text := '';
  edtObservacionesEntrega.Text := '';
end;

procedure TFormReparto.FormCreate(Sender: TObject);
begin
  edtEmpresa.Text := '01'; // ajusta al default de tu sistema
  LimpiaRutaCaptura;
  LimpiaPedidoCaptura;
  CargaRutasDia(Date);
end;

procedure TFormReparto.edtClaveVehiculoExit(Sender: TObject);
var
  IdVehiculo: Integer;
  Desc: string;
begin
  if Trim(edtClaveVehiculo.Text) = '' then
  begin
    lblVehiculoResuelto.Caption := '';
    Exit;
  end;
  if ResuelveVehiculoPorClave(edtClaveVehiculo.Text, IdVehiculo, Desc) then
    lblVehiculoResuelto.Caption := 'Placas: ' + Desc
  else
    lblVehiculoResuelto.Caption := '*** no encontrado o inactivo ***';
end;

procedure TFormReparto.edtClaveChoferExit(Sender: TObject);
var
  IdChofer: Integer;
  Desc: string;
begin
  if Trim(edtClaveChofer.Text) = '' then
  begin
    lblChoferResuelto.Caption := '';
    Exit;
  end;
  if ResuelveChoferPorClave(edtClaveChofer.Text, IdChofer, Desc) then
    lblChoferResuelto.Caption := Desc
  else
    lblChoferResuelto.Caption := '*** no encontrado o inactivo ***';
end;

procedure TFormReparto.btnNuevaRutaClick(Sender: TObject);
begin
  LimpiaRutaCaptura;
  edtClaveVehiculo.SetFocus;
end;

procedure TFormReparto.btnGuardarRutaClick(Sender: TObject);
var
  Q: TQuery;
  Fecha: TDateTime;
  IdVehiculo, IdChofer: Integer;
  DescVeh, DescCho: string;
begin
  try
    Fecha := StrToDate(Trim(edtFechaRuta.Text));
  except
    ShowMessage('Fecha de la ruta invalida');
    edtFechaRuta.SetFocus;
    Exit;
  end;

  if not ResuelveVehiculoPorClave(edtClaveVehiculo.Text, IdVehiculo, DescVeh) then
  begin
    ShowMessage('Vehiculo no encontrado (o inactivo) en el catalogo de flotilla');
    edtClaveVehiculo.SetFocus;
    Exit;
  end;
  if not ResuelveChoferPorClave(edtClaveChofer.Text, IdChofer, DescCho) then
  begin
    ShowMessage('Chofer no encontrado (o inactivo) en el catalogo de choferes');
    edtClaveChofer.SetFocus;
    Exit;
  end;

  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := Database1.DatabaseName;

    if FIdRutaActual = 0 then
    begin
      Q.SQL.Text :=
        'INSERT INTO reparto_ruta (num_emp, fecha, id_vehiculo, id_chofer, estatus) ' +
        'VALUES (:emp, :fecha, :idveh, :idcho, ''A'')';
      Q.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
      Q.ParamByName('fecha').AsDateTime := Fecha;
      Q.ParamByName('idveh').AsInteger := IdVehiculo;
      Q.ParamByName('idcho').AsInteger := IdChofer;
      Q.ExecSQL;

      Q.SQL.Text :=
        'SELECT FIRST 1 id_ruta FROM reparto_ruta WHERE num_emp = :emp AND ' +
        'fecha = :fecha AND id_vehiculo = :idveh AND id_chofer = :idcho ' +
        'ORDER BY id_ruta DESC';
      Q.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
      Q.ParamByName('fecha').AsDateTime := Fecha;
      Q.ParamByName('idveh').AsInteger := IdVehiculo;
      Q.ParamByName('idcho').AsInteger := IdChofer;
      Q.Open;
      if not Q.Eof then
        FIdRutaActual := Q.FieldByName('id_ruta').AsInteger;
      Q.Close;
    end
    else
    begin
      Q.SQL.Text :=
        'UPDATE reparto_ruta SET fecha = :fecha, id_vehiculo = :idveh, ' +
        'id_chofer = :idcho WHERE id_ruta = :id';
      Q.ParamByName('fecha').AsDateTime := Fecha;
      Q.ParamByName('idveh').AsInteger := IdVehiculo;
      Q.ParamByName('idcho').AsInteger := IdChofer;
      Q.ParamByName('id').AsInteger := FIdRutaActual;
      Q.ExecSQL;
    end;
  finally
    Q.Free;
  end;

  ShowMessage('Ruta guardada');
  CargaRutasDia(Fecha);
  CargaPedidos(FIdRutaActual);
end;

procedure TFormReparto.btnMarcarSalidaClick(Sender: TObject);
var
  Q: TQuery;
begin
  if FIdRutaActual = 0 then
  begin
    ShowMessage('Primero guarda o selecciona una ruta');
    Exit;
  end;
  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := Database1.DatabaseName;
    Q.SQL.Text := 'UPDATE reparto_ruta SET estatus = ''S'', hora_salida = :ahora ' +
      'WHERE id_ruta = :id';
    Q.ParamByName('ahora').AsDateTime := Now;
    Q.ParamByName('id').AsInteger := FIdRutaActual;
    Q.ExecSQL;
  finally
    Q.Free;
  end;
  CargaRutasDia(StrToDate(Trim(edtFechaRuta.Text)));
end;

procedure TFormReparto.btnMarcarRegresoClick(Sender: TObject);
var
  Q: TQuery;
begin
  if FIdRutaActual = 0 then
  begin
    ShowMessage('Primero guarda o selecciona una ruta');
    Exit;
  end;
  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := Database1.DatabaseName;
    Q.SQL.Text := 'UPDATE reparto_ruta SET estatus = ''C'', hora_regreso = :ahora ' +
      'WHERE id_ruta = :id';
    Q.ParamByName('ahora').AsDateTime := Now;
    Q.ParamByName('id').AsInteger := FIdRutaActual;
    Q.ExecSQL;
  finally
    Q.Free;
  end;
  CargaRutasDia(StrToDate(Trim(edtFechaRuta.Text)));
end;

procedure TFormReparto.dbgRutasDiaDblClick(Sender: TObject);
begin
  if qRutasDia.IsEmpty then Exit;
  FIdRutaActual := qRutasDia.FieldByName('id_ruta').AsInteger;
  edtFechaRuta.Text := DateToStr(qRutasDia.FieldByName('fecha').AsDateTime);
  edtClaveVehiculo.Text := Trim(qRutasDia.FieldByName('numero_economico').AsString);
  lblVehiculoResuelto.Caption := 'Placas: ' + Trim(qRutasDia.FieldByName('placas').AsString);
  edtClaveChofer.Text := Trim(qRutasDia.FieldByName('clave_chofer').AsString);
  lblChoferResuelto.Caption := Trim(qRutasDia.FieldByName('chofer_nombre').AsString);
  CargaPedidos(FIdRutaActual);
  LimpiaPedidoCaptura;
end;

procedure TFormReparto.dbgPedidosDblClick(Sender: TObject);
begin
  if qPedidos.IsEmpty then Exit;
  FIdPedidoActual := qPedidos.FieldByName('id_pedido').AsInteger;
  edtOrdenVisita.Text := qPedidos.FieldByName('orden_visita').AsString;
  if qPedidos.FieldByName('folio_venta').IsNull then
    edtFolioVenta.Text := ''
  else
    edtFolioVenta.Text := qPedidos.FieldByName('folio_venta').AsString;
  edtSucursalVenta.Text := Trim(qPedidos.FieldByName('sucursal_venta').AsString);
  edtTipoVenta.Text := Trim(qPedidos.FieldByName('tipo_venta').AsString);
  edtCliente.Text := Trim(qPedidos.FieldByName('cliente').AsString);
  edtDireccionEntrega.Text := Trim(qPedidos.FieldByName('direccion_entrega').AsString);
  edtTelefono.Text := Trim(qPedidos.FieldByName('telefono').AsString);
  edtReferenciaPedido.Text := Trim(qPedidos.FieldByName('referencia_pedido').AsString);
  if qPedidos.FieldByName('importe_total').IsNull then
    edtImporteTotal.Text := ''
  else
    edtImporteTotal.Text := qPedidos.FieldByName('importe_total').AsString;
  edtQuienRecibio.Text := Trim(qPedidos.FieldByName('quien_recibio').AsString);
  edtObservacionesEntrega.Text := Trim(qPedidos.FieldByName('observaciones_entrega').AsString);
end;

procedure TFormReparto.btnNuevoPedidoClick(Sender: TObject);
begin
  if FIdRutaActual = 0 then
  begin
    ShowMessage('Primero guarda o selecciona una ruta');
    Exit;
  end;
  LimpiaPedidoCaptura;
  edtCliente.SetFocus;
end;

procedure TFormReparto.btnGuardarPedidoClick(Sender: TObject);
var
  Q: TQuery;
  OrdenVisita, FolioVenta: Integer;
  TieneFolio: Boolean;
  ImporteTotal: Double;
begin
  if FIdRutaActual = 0 then
  begin
    ShowMessage('Primero guarda o selecciona una ruta');
    Exit;
  end;
  if Trim(edtCliente.Text) = '' then
  begin
    ShowMessage('Captura el nombre del cliente');
    edtCliente.SetFocus;
    Exit;
  end;
  if Trim(edtDireccionEntrega.Text) = '' then
  begin
    ShowMessage('Captura la direccion de entrega');
    edtDireccionEntrega.SetFocus;
    Exit;
  end;

  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := Database1.DatabaseName;

    if Trim(edtOrdenVisita.Text) <> '' then
    begin
      try
        OrdenVisita := StrToInt(Trim(edtOrdenVisita.Text));
      except
        ShowMessage('Orden de visita invalido');
        edtOrdenVisita.SetFocus;
        Exit;
      end;
    end
    else
    begin
      Q.SQL.Text := 'SELECT COUNT(*) AS cnt FROM reparto_pedido WHERE id_ruta = :idr ' +
        'AND activo = ''S''';
      Q.ParamByName('idr').AsInteger := FIdRutaActual;
      Q.Open;
      OrdenVisita := Q.FieldByName('cnt').AsInteger + 1;
      Q.Close;
    end;

    TieneFolio := Trim(edtFolioVenta.Text) <> '';
    FolioVenta := 0;
    if TieneFolio then
    begin
      try
        FolioVenta := StrToInt(Trim(edtFolioVenta.Text));
      except
        ShowMessage('Folio de venta invalido');
        edtFolioVenta.SetFocus;
        Exit;
      end;
    end;

    ImporteTotal := 0;
    if Trim(edtImporteTotal.Text) <> '' then
    begin
      try
        ImporteTotal := StrToFloat(Trim(edtImporteTotal.Text));
      except
        ShowMessage('Importe total invalido');
        edtImporteTotal.SetFocus;
        Exit;
      end;
    end;

    if FIdPedidoActual = 0 then
      Q.SQL.Text :=
        'INSERT INTO reparto_pedido (id_ruta, num_emp, orden_visita, folio_venta, ' +
        'sucursal_venta, tipo_venta, cliente, direccion_entrega, telefono, ' +
        'referencia_pedido, importe_total, estatus, remision_impresa, activo) ' +
        'VALUES (:idr, :emp, :orden, :folio, :suc, :tipo, :cli, :dir, :tel, :ref, ' +
        ':imp, ''P'', ''N'', ''S'')'
    else
      Q.SQL.Text :=
        'UPDATE reparto_pedido SET orden_visita = :orden, folio_venta = :folio, ' +
        'sucursal_venta = :suc, tipo_venta = :tipo, cliente = :cli, ' +
        'direccion_entrega = :dir, telefono = :tel, referencia_pedido = :ref, ' +
        'importe_total = :imp WHERE id_pedido = :id';

    if FIdPedidoActual = 0 then
    begin
      Q.ParamByName('idr').AsInteger := FIdRutaActual;
      Q.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
    end
    else
      Q.ParamByName('id').AsInteger := FIdPedidoActual;
    Q.ParamByName('orden').AsInteger := OrdenVisita;
    if TieneFolio then
      Q.ParamByName('folio').AsInteger := FolioVenta
    else
      Q.ParamByName('folio').Clear;
    Q.ParamByName('suc').AsString := Trim(edtSucursalVenta.Text);
    Q.ParamByName('tipo').AsString := Trim(edtTipoVenta.Text);
    Q.ParamByName('cli').AsString := Trim(edtCliente.Text);
    Q.ParamByName('dir').AsString := Trim(edtDireccionEntrega.Text);
    Q.ParamByName('tel').AsString := Trim(edtTelefono.Text);
    Q.ParamByName('ref').AsString := Trim(edtReferenciaPedido.Text);
    if ImporteTotal = 0 then
      Q.ParamByName('imp').Clear
    else
      Q.ParamByName('imp').AsFloat := ImporteTotal;
    Q.ExecSQL;

    if FIdPedidoActual = 0 then
    begin
      Q.SQL.Text :=
        'SELECT FIRST 1 id_pedido FROM reparto_pedido WHERE id_ruta = :idr AND ' +
        'cliente = :cli ORDER BY id_pedido DESC';
      Q.ParamByName('idr').AsInteger := FIdRutaActual;
      Q.ParamByName('cli').AsString := Trim(edtCliente.Text);
      Q.Open;
      if not Q.Eof then
        FIdPedidoActual := Q.FieldByName('id_pedido').AsInteger;
      Q.Close;
    end;
  finally
    Q.Free;
  end;

  ShowMessage('Pedido guardado');
  CargaPedidos(FIdRutaActual);
end;

procedure TFormReparto.btnEliminarPedidoClick(Sender: TObject);
var
  Q: TQuery;
begin
  if FIdPedidoActual = 0 then Exit;
  if MessageDlg('¿Quitar este pedido de la ruta?', mtConfirmation,
       [mbYes, mbNo], 0) <> mrYes then Exit;

  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := Database1.DatabaseName;
    Q.SQL.Text := 'UPDATE reparto_pedido SET activo = ''N'' WHERE id_pedido = :id';
    Q.ParamByName('id').AsInteger := FIdPedidoActual;
    Q.ExecSQL;
  finally
    Q.Free;
  end;

  LimpiaPedidoCaptura;
  CargaPedidos(FIdRutaActual);
end;

procedure TFormReparto.CambiaEstatusPedido(const NuevoEstatus: string);
var
  Q: TQuery;
  EstatusAnterior: string;
  Ahora: TDateTime;
begin
  if FIdPedidoActual = 0 then
  begin
    ShowMessage('Primero elige un pedido (doble clic en el grid)');
    Exit;
  end;
  if (NuevoEstatus = 'E') and (Trim(edtQuienRecibio.Text) = '') then
  begin
    ShowMessage('Captura quien recibio (nombre de quien firma/sella)');
    edtQuienRecibio.SetFocus;
    Exit;
  end;
  if (NuevoEstatus = 'N') and (Trim(edtObservacionesEntrega.Text) = '') then
  begin
    ShowMessage('Captura el motivo de la no entrega en observaciones');
    edtObservacionesEntrega.SetFocus;
    Exit;
  end;

  Ahora := Now;
  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := Database1.DatabaseName;

    Q.SQL.Text := 'SELECT estatus FROM reparto_pedido WHERE id_pedido = :id';
    Q.ParamByName('id').AsInteger := FIdPedidoActual;
    Q.Open;
    EstatusAnterior := Trim(Q.FieldByName('estatus').AsString);
    Q.Close;

    if NuevoEstatus in ['E', 'N'] then
    begin
      Q.SQL.Text :=
        'UPDATE reparto_pedido SET estatus = :nuevo, fecha_hora_entrega = :ahora, ' +
        'quien_recibio = :qr, observaciones_entrega = :obs WHERE id_pedido = :id';
      Q.ParamByName('nuevo').AsString := NuevoEstatus;
      Q.ParamByName('ahora').AsDateTime := Ahora;
      Q.ParamByName('qr').AsString := Trim(edtQuienRecibio.Text);
      Q.ParamByName('obs').AsString := Trim(edtObservacionesEntrega.Text);
      Q.ParamByName('id').AsInteger := FIdPedidoActual;
    end
    else
    begin
      Q.SQL.Text := 'UPDATE reparto_pedido SET estatus = :nuevo WHERE id_pedido = :id';
      Q.ParamByName('nuevo').AsString := NuevoEstatus;
      Q.ParamByName('id').AsInteger := FIdPedidoActual;
    end;
    Q.ExecSQL;

    Q.SQL.Text :=
      'INSERT INTO reparto_pedido_estatus_hist (id_pedido, estatus_anterior, ' +
      'estatus_nuevo, fecha_hora, usuario) VALUES (:id, :ant, :nuevo, :ahora, :usr)';
    Q.ParamByName('id').AsInteger := FIdPedidoActual;
    Q.ParamByName('ant').AsString := EstatusAnterior;
    Q.ParamByName('nuevo').AsString := NuevoEstatus;
    Q.ParamByName('ahora').AsDateTime := Ahora;
    Q.ParamByName('usr').AsString := Trim(edtUsuario.Text);
    Q.ExecSQL;
  finally
    Q.Free;
  end;

  CargaPedidos(FIdRutaActual);
end;

procedure TFormReparto.btnMarcarCargadoClick(Sender: TObject);
begin
  CambiaEstatusPedido('C');
end;

procedure TFormReparto.btnMarcarEnRutaClick(Sender: TObject);
begin
  CambiaEstatusPedido('R');
end;

procedure TFormReparto.btnMarcarEntregadoClick(Sender: TObject);
begin
  CambiaEstatusPedido('E');
end;

procedure TFormReparto.btnMarcarNoEntregadoClick(Sender: TObject);
begin
  CambiaEstatusPedido('N');
end;

procedure TFormReparto.ImprimeRemision(IdPedido: Integer);
var
  Y, LineHeight: Integer;
begin
  qImprime.Close;
  qImprime.SQL.Text :=
    'SELECT p.*, r.fecha AS fecha_ruta, v.numero_economico, v.placas, ' +
    'c.nombre AS chofer_nombre ' +
    'FROM reparto_pedido p, reparto_ruta r, flotilla_vehiculo v, flotilla_chofer c ' +
    'WHERE p.id_pedido = :id AND p.id_ruta = r.id_ruta ' +
    'AND r.id_vehiculo = v.id_vehiculo AND r.id_chofer = c.id_chofer';
  qImprime.ParamByName('id').AsInteger := IdPedido;
  qImprime.Open;
  if qImprime.Eof then
  begin
    qImprime.Close;
    ShowMessage('No se encontro el pedido para imprimir');
    Exit;
  end;

  Printer.BeginDoc;
  try
    Printer.Canvas.Font.Name := 'Arial';
    Printer.Canvas.Font.Size := 14;
    Printer.Canvas.Font.Style := [fsBold];
    LineHeight := Printer.Canvas.TextHeight('A') + 60;
    Y := 100;

    Printer.Canvas.TextOut(100, Y, 'COMESTIBLES Y LEGUMBRES, SA DE CV');
    Inc(Y, LineHeight);
    Printer.Canvas.Font.Size := 20;
    Printer.Canvas.TextOut(100, Y, 'REMISION DE ENTREGA No. ' + IntToStr(IdPedido));
    Inc(Y, LineHeight + 100);

    Printer.Canvas.Font.Size := 11;
    Printer.Canvas.Font.Style := [];
    Printer.Canvas.TextOut(100, Y, 'Fecha de ruta: ' +
      DateToStr(qImprime.FieldByName('fecha_ruta').AsDateTime));
    Inc(Y, LineHeight);
    Printer.Canvas.TextOut(100, Y, 'Vehiculo: ' +
      Trim(qImprime.FieldByName('numero_economico').AsString) + '  Placas: ' +
      Trim(qImprime.FieldByName('placas').AsString));
    Inc(Y, LineHeight);
    Printer.Canvas.TextOut(100, Y, 'Chofer: ' +
      Trim(qImprime.FieldByName('chofer_nombre').AsString));
    Inc(Y, LineHeight + 100);

    Printer.Canvas.Font.Style := [fsBold];
    Printer.Canvas.TextOut(100, Y, 'Cliente: ');
    Printer.Canvas.Font.Style := [];
    Printer.Canvas.TextOut(100 + Printer.Canvas.TextWidth('Cliente: '), Y,
      Trim(qImprime.FieldByName('cliente').AsString));
    Inc(Y, LineHeight);
    Printer.Canvas.Font.Style := [fsBold];
    Printer.Canvas.TextOut(100, Y, 'Direccion: ');
    Printer.Canvas.Font.Style := [];
    Printer.Canvas.TextOut(100 + Printer.Canvas.TextWidth('Direccion: '), Y,
      Trim(qImprime.FieldByName('direccion_entrega').AsString));
    Inc(Y, LineHeight);
    Printer.Canvas.TextOut(100, Y, 'Telefono: ' +
      Trim(qImprime.FieldByName('telefono').AsString) + '    Referencia: ' +
      Trim(qImprime.FieldByName('referencia_pedido').AsString));
    Inc(Y, LineHeight + 100);

    // Resumen de productos, solo si el pedido viene ligado a una venta
    // ya facturada (folio_venta/sucursal_venta/tipo_venta capturados)
    if not qImprime.FieldByName('folio_venta').IsNull then
    begin
      Printer.Canvas.Font.Style := [fsBold];
      Printer.Canvas.TextOut(100, Y, 'DESCRIPCION                  CAJAS    KILOS     IMPORTE');
      Inc(Y, LineHeight);
      Printer.Canvas.Font.Style := [];

      with TQuery.Create(nil) do
      try
        DatabaseName := Database1.DatabaseName;
        SQL.Text :=
          'SELECT descripcion, cajas, kilos, total FROM ventas WHERE num_emp = :emp ' +
          'AND sucursal = :suc AND tipo = :tipo AND folio = :folio ORDER BY renglon';
        ParamByName('emp').AsString := Trim(qImprime.FieldByName('num_emp').AsString);
        ParamByName('suc').AsString := Trim(qImprime.FieldByName('sucursal_venta').AsString);
        ParamByName('tipo').AsString := Trim(qImprime.FieldByName('tipo_venta').AsString);
        ParamByName('folio').AsInteger := qImprime.FieldByName('folio_venta').AsInteger;
        Open;
        while not Eof do
        begin
          Printer.Canvas.TextOut(100, Y, Trim(FieldByName('descripcion').AsString) + '  ' +
            FieldByName('cajas').AsString + '  ' + FieldByName('kilos').AsString + '  ' +
            FieldByName('total').AsString);
          Inc(Y, LineHeight);
          Next;
        end;
        Close;
      finally
        Free;
      end;
      Inc(Y, 60);
    end;

    Printer.Canvas.Font.Style := [fsBold];
    Printer.Canvas.TextOut(100, Y, 'IMPORTE TOTAL: ' +
      FloatToStrF(qImprime.FieldByName('importe_total').AsFloat, ffCurrency, 10, 2));
    Printer.Canvas.Font.Style := [];
    Inc(Y, LineHeight + 150);

    Printer.Canvas.TextOut(100, Y, 'OBSERVACIONES:');
    Inc(Y, LineHeight);
    Printer.Canvas.Rectangle(100, Y, 2600, Y + 500);
    Inc(Y, 700);

    Printer.Canvas.TextOut(100, Y, '______________________________________');
    Inc(Y, LineHeight);
    Printer.Canvas.TextOut(100, Y, 'Firma o sello de recibido');
    Inc(Y, LineHeight + 100);
    Printer.Canvas.TextOut(100, Y, 'Nombre de quien recibe: ______________________________');
    Inc(Y, LineHeight);
    Printer.Canvas.TextOut(100, Y, 'Fecha y hora de entrega: _____________________________');
  finally
    Printer.EndDoc;
  end;

  qImprime.Close;

  with TQuery.Create(nil) do
  try
    DatabaseName := Database1.DatabaseName;
    SQL.Text := 'UPDATE reparto_pedido SET remision_impresa = ''S'' WHERE id_pedido = :id';
    ParamByName('id').AsInteger := IdPedido;
    ExecSQL;
  finally
    Free;
  end;
end;

procedure TFormReparto.btnImprimirRemisionClick(Sender: TObject);
begin
  if FIdPedidoActual = 0 then
  begin
    ShowMessage('Primero elige un pedido (doble clic en el grid)');
    Exit;
  end;
  ImprimeRemision(FIdPedidoActual);
  CargaPedidos(FIdRutaActual);
end;

end.
