unit UOCRecepcion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBTables;

type
  TFormOCRecepcion = class(TForm)
    Database1: TDatabase;
    pnlIzq: TPanel;
    pnlDer: TPanel;
    lblEmpresa: TLabel;
    edtEmpresa: TEdit;
    lblUsuario: TLabel;
    edtUsuario: TEdit;
    lblBuscaPedido: TLabel;
    edtBuscaPedido: TEdit;
    btnBuscarPedido: TButton;
    dbgPedidos: TDBGrid;
    qPedidosPend: TQuery;
    dsPedidosPend: TDataSource;
    lblRenglones: TLabel;
    dbgRenglones: TDBGrid;
    qRenglonesPend: TQuery;
    dsRenglonesPend: TDataSource;
    gbRecepcion: TGroupBox;
    lblArticuloSel: TLabel;
    lblCantidadRecibida: TLabel;
    edtCantidadRecibida: TEdit;
    lblCantidadXEmpaque: TLabel;
    edtCantidadXEmpaque: TEdit;
    lblTara: TLabel;
    edtTara: TEdit;
    rgRecibido: TRadioGroup;
    lblObservaciones: TLabel;
    edtObservaciones: TEdit;
    btnGuardarRecepcion: TButton;
    qOper: TQuery;
    spRecibeRenglon: TStoredProc;
    spAplicaMovKardex: TStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarPedidoClick(Sender: TObject);
    procedure dbgPedidosDblClick(Sender: TObject);
    procedure dbgRenglonesDblClick(Sender: TObject);
    procedure rgRecibidoClick(Sender: TObject);
    procedure btnGuardarRecepcionClick(Sender: TObject);
  private
    FNumPedActual: Integer;
    FRenglonActual: Integer;
    FCodArtActual: string;
    FCodProActual: string;
    FCosUniActual: Double;
    FIvaActual: Double;
    procedure CargaPedidosPendientes(const Filtro: string);
    procedure CargaRenglonesPendientes(NumPed: Integer);
    procedure LimpiaCaptura;
  end;

var
  FormOCRecepcion: TFormOCRecepcion;

implementation

{$R *.dfm}

procedure TFormOCRecepcion.CargaPedidosPendientes(const Filtro: string);
begin
  qPedidosPend.Close;
  if Trim(Filtro) = '' then
    qPedidosPend.SQL.Text :=
      'SELECT DISTINCT num_ped, cod_pro, fech_ped FROM oc_pedido_detalle ' +
      'WHERE num_emp = :emp AND estado = ''P'' ORDER BY num_ped'
  else
    qPedidosPend.SQL.Text :=
      'SELECT DISTINCT num_ped, cod_pro, fech_ped FROM oc_pedido_detalle ' +
      'WHERE num_emp = :emp AND estado = ''P'' AND num_ped = :ped ORDER BY num_ped';
  qPedidosPend.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  if Trim(Filtro) <> '' then
    qPedidosPend.ParamByName('ped').AsInteger := StrToIntDef(Trim(Filtro), 0);
  qPedidosPend.Open;
end;

procedure TFormOCRecepcion.CargaRenglonesPendientes(NumPed: Integer);
begin
  FNumPedActual := NumPed;
  qRenglonesPend.Close;
  if NumPed = 0 then Exit;
  qRenglonesPend.SQL.Text :=
    'SELECT renglon, cod_art, cod_pro, cantidad_ped_cajas, cantidad_ped_kilos, ' +
    'cos_uni, iva FROM oc_pedido_detalle ' +
    'WHERE num_emp = :emp AND num_ped = :ped AND estado = ''P'' ORDER BY renglon';
  qRenglonesPend.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qRenglonesPend.ParamByName('ped').AsInteger := NumPed;
  qRenglonesPend.Open;
end;

procedure TFormOCRecepcion.LimpiaCaptura;
begin
  FRenglonActual := 0;
  FCodArtActual := '';
  FCodProActual := '';
  FCosUniActual := 0;
  FIvaActual := 0;
  lblArticuloSel.Caption := '(doble clic en un renglon de arriba)';
  edtCantidadRecibida.Text := '0';
  edtCantidadXEmpaque.Text := '0';
  edtTara.Text := '0';
  rgRecibido.ItemIndex := 0;
  edtObservaciones.Text := '';
  edtObservaciones.Enabled := False;
end;

procedure TFormOCRecepcion.FormCreate(Sender: TObject);
begin
  edtEmpresa.Text := '01'; // ajusta al default de tu sistema
  LimpiaCaptura;
  CargaPedidosPendientes('');
end;

procedure TFormOCRecepcion.btnBuscarPedidoClick(Sender: TObject);
begin
  CargaPedidosPendientes(edtBuscaPedido.Text);
end;

procedure TFormOCRecepcion.dbgPedidosDblClick(Sender: TObject);
begin
  if qPedidosPend.IsEmpty then Exit;
  CargaRenglonesPendientes(qPedidosPend.FieldByName('num_ped').AsInteger);
  LimpiaCaptura;
end;

procedure TFormOCRecepcion.dbgRenglonesDblClick(Sender: TObject);
begin
  if qRenglonesPend.IsEmpty then Exit;
  FRenglonActual  := qRenglonesPend.FieldByName('renglon').AsInteger;
  FCodArtActual   := Trim(qRenglonesPend.FieldByName('cod_art').AsString);
  FCodProActual   := Trim(qRenglonesPend.FieldByName('cod_pro').AsString);
  FCosUniActual   := qRenglonesPend.FieldByName('cos_uni').AsFloat;
  FIvaActual      := qRenglonesPend.FieldByName('iva').AsFloat;

  lblArticuloSel.Caption := FCodArtActual + '  -  pedido: ' +
    qRenglonesPend.FieldByName('cantidad_ped_cajas').AsString + ' / ' +
    qRenglonesPend.FieldByName('cantidad_ped_kilos').AsString + ' kg';

  // valores por default, editables: lo que se pidio y el can_emp actual
  edtCantidadRecibida.Text := qRenglonesPend.FieldByName('cantidad_ped_cajas').AsString;
  qOper.Close;
  qOper.SQL.Text := 'SELECT can_emp FROM inarinv WHERE num_emp = :emp AND cod_art = :cod';
  qOper.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qOper.ParamByName('cod').AsString := FCodArtActual;
  qOper.Open;
  if not qOper.Eof then
    edtCantidadXEmpaque.Text := qOper.FieldByName('can_emp').AsString
  else
    edtCantidadXEmpaque.Text := '0';
  qOper.Close;

  edtTara.Text := '0';
  rgRecibido.ItemIndex := 0;
  edtObservaciones.Text := '';
  edtObservaciones.Enabled := False;
end;

procedure TFormOCRecepcion.rgRecibidoClick(Sender: TObject);
begin
  // 0 = Si se recibio, 1 = No se recibio
  edtObservaciones.Enabled := rgRecibido.ItemIndex = 1;
  if edtObservaciones.Enabled then
    edtObservaciones.SetFocus;
end;

procedure TFormOCRecepcion.btnGuardarRecepcionClick(Sender: TObject);
var
  cantRecibida, cantXEmpaque, tara, kilosNetos, costoPorKgBase: Double;
begin
  if FRenglonActual = 0 then
  begin
    ShowMessage('Selecciona primero un renglon del pedido (doble clic arriba)');
    Exit;
  end;

  if rgRecibido.ItemIndex = 1 then
  begin
    // NO se recibio: solo bitacora, no se toca el Kardex
    if Trim(edtObservaciones.Text) = '' then
    begin
      ShowMessage('Indica en observaciones la razon por la que no se recibio');
      edtObservaciones.SetFocus;
      Exit;
    end;

    qOper.Close;
    qOper.SQL.Text :=
      'INSERT INTO oc_recepcion_detalle ' +
      '(num_emp, num_ped, renglon, cod_art, recibido, observaciones, usuario, fecha_recepcion) ' +
      'VALUES (:emp, :ped, :ren, :art, ''N'', :obs, :usr, TODAY)';
    qOper.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
    qOper.ParamByName('ped').AsInteger := FNumPedActual;
    qOper.ParamByName('ren').AsInteger := FRenglonActual;
    qOper.ParamByName('art').AsString := FCodArtActual;
    qOper.ParamByName('obs').AsString := Trim(edtObservaciones.Text);
    qOper.ParamByName('usr').AsString := Trim(edtUsuario.Text);
    qOper.ExecSQL;

    qOper.Close;
    qOper.SQL.Text :=
      'UPDATE oc_pedido_detalle SET estado = ''X'' ' +
      'WHERE num_emp = :emp AND num_ped = :ped AND renglon = :ren';
    qOper.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
    qOper.ParamByName('ped').AsInteger := FNumPedActual;
    qOper.ParamByName('ren').AsInteger := FRenglonActual;
    qOper.ExecSQL;
  end
  else
  begin
    // SI se recibio: se afecta el Kardex con lo REALMENTE recibido
    try
      cantRecibida := StrToFloat(edtCantidadRecibida.Text);
      cantXEmpaque := StrToFloat(edtCantidadXEmpaque.Text);
      tara         := StrToFloat(edtTara.Text);
    except
      ShowMessage('Revisa Cantidad Recibida / Cantidad x Empaque / Tara');
      Exit;
    end;

    if cantRecibida <= 0 then
    begin
      ShowMessage('La cantidad recibida debe ser mayor a cero');
      edtCantidadRecibida.SetFocus;
      Exit;
    end;

    kilosNetos := (cantRecibida * cantXEmpaque) - (cantRecibida * tara);

    qOper.Close;
    qOper.SQL.Text :=
      'INSERT INTO oc_recepcion_detalle ' +
      '(num_emp, num_ped, renglon, cod_art, recibido, cantidad_recibida, ' +
      ' cantidad_x_empaque, tara_kg, kilos_netos, usuario, fecha_recepcion) ' +
      'VALUES (:emp, :ped, :ren, :art, ''S'', :canrec, :canemp, :tara, :kilos, :usr, TODAY)';
    qOper.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
    qOper.ParamByName('ped').AsInteger := FNumPedActual;
    qOper.ParamByName('ren').AsInteger := FRenglonActual;
    qOper.ParamByName('art').AsString := FCodArtActual;
    qOper.ParamByName('canrec').AsFloat := cantRecibida;
    qOper.ParamByName('canemp').AsFloat := cantXEmpaque;
    qOper.ParamByName('tara').AsFloat := tara;
    qOper.ParamByName('kilos').AsFloat := kilosNetos;
    qOper.ParamByName('usr').AsString := Trim(edtUsuario.Text);
    qOper.ExecSQL;

    // aplica al Kardex (inartrinv + existencias/can_emp de inarinv) con
    // sp_recibe_renglon_oc -- ella misma marca oc_pedido_detalle.estado='R'
    spRecibeRenglon.Close;
    spRecibeRenglon.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
    spRecibeRenglon.ParamByName('suc').AsString := Trim(edtEmpresa.Text);
    spRecibeRenglon.ParamByName('art').AsString := FCodArtActual;
    spRecibeRenglon.ParamByName('ped').AsInteger := FNumPedActual;
    spRecibeRenglon.ParamByName('ren').AsInteger := FRenglonActual;
    spRecibeRenglon.ParamByName('fech').AsDateTime := Date;
    spRecibeRenglon.ParamByName('kgs').AsFloat := kilosNetos;
    spRecibeRenglon.ParamByName('caj').AsFloat := cantRecibida;
    spRecibeRenglon.ParamByName('cosuni').AsFloat := FCosUniActual;
    spRecibeRenglon.ParamByName('codpro').AsString := FCodProActual;
    spRecibeRenglon.ParamByName('iva').AsFloat := FIvaActual;
    spRecibeRenglon.ParamByName('des').AsFloat := 0;
    spRecibeRenglon.ParamByName('fle').AsFloat := 0;
    spRecibeRenglon.ParamByName('canempreal').AsFloat := cantXEmpaque;
    spRecibeRenglon.ExecProc;

    // motor de Kardex por producto unificado: solo aplica si
    // FCodArtActual ya esta dado de alta en art_presentacion
    //
    // FCosUniActual es el costo capturado en la orden (costo por CAJA,
    // o por lo que sea la unidad de compra), pero sp_aplica_mov_kardex
    // promedia el costo contra la cantidad ya convertida a unidad BASE
    // (kg) -- si se le pasara FCosUniActual tal cual, el costo promedio
    // quedaria multiplicado por el factor de la presentacion (p.ej. 10x
    // si se compra por caja de 10kg). Se convierte aqui a costo por kg
    // usando el total realmente pagado (FCosUniActual * cantRecibida)
    // entre los kilos netos reales recibidos.
    if kilosNetos <> 0 then
      costoPorKgBase := (FCosUniActual * cantRecibida) / kilosNetos
    else
      costoPorKgBase := 0;

    spAplicaMovKardex.Close;
    spAplicaMovKardex.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
    spAplicaMovKardex.ParamByName('suc').AsString := Trim(edtEmpresa.Text);
    spAplicaMovKardex.ParamByName('codart').AsString := FCodArtActual;
    spAplicaMovKardex.ParamByName('fech').AsDateTime := Date;
    spAplicaMovKardex.ParamByName('tipdoc').AsString := 'AC';
    spAplicaMovKardex.ParamByName('numdoc').AsString := IntToStr(FNumPedActual);
    spAplicaMovKardex.ParamByName('ren').AsInteger := FRenglonActual;
    spAplicaMovKardex.ParamByName('cantcap').AsFloat := cantRecibida;
    spAplicaMovKardex.ParamByName('costouni').AsFloat := costoPorKgBase;
    spAplicaMovKardex.ParamByName('esentrada').AsString := 'S';
    spAplicaMovKardex.ExecProc;
  end;

  // refresca renglones pendientes del pedido; si ya no queda ninguno,
  // el pedido completo se marca como recibido en inarped
  CargaRenglonesPendientes(FNumPedActual);
  if qRenglonesPend.IsEmpty then
  begin
    qOper.Close;
    qOper.SQL.Text :=
      'UPDATE inarped SET estado = ''R'' WHERE num_emp = :emp AND num_ped = :ped';
    qOper.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
    qOper.ParamByName('ped').AsInteger := FNumPedActual;
    qOper.ExecSQL;

    ShowMessage('Pedido completo, ya no quedan renglones pendientes');
    CargaPedidosPendientes(edtBuscaPedido.Text);
  end;

  LimpiaCaptura;
end;

end.
