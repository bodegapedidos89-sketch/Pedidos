unit UMantBitacoraFlotilla;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBTables;

type
  TFormMantBitacoraFlotilla = class(TForm)
    Database1: TDatabase;
    pnlIzq: TPanel;
    pnlDer: TPanel;
    lblEmpresa: TLabel;
    edtEmpresa: TEdit;
    lblBuscaVehiculo: TLabel;
    edtBuscaVehiculo: TEdit;
    btnBuscarVehiculo: TButton;
    dbgVehiculos: TDBGrid;
    qVehiculos: TQuery;
    dsVehiculos: TDataSource;
    lblVehiculoSel: TLabel;
    rgTipoEvento: TRadioGroup;
    lblFecha: TLabel;
    edtFecha: TEdit;
    lblKilometraje: TLabel;
    edtKilometraje: TEdit;
    lblLitros: TLabel;
    edtLitros: TEdit;
    lblCosto: TLabel;
    edtCosto: TEdit;
    lblTallerProveedor: TLabel;
    edtTallerProveedor: TEdit;
    lblDescripcion: TLabel;
    edtDescripcion: TEdit;
    lblObservaciones: TLabel;
    edtObservaciones: TEdit;
    btnAgregarBitacora: TButton;
    lblBitacora: TLabel;
    dbgBitacora: TDBGrid;
    qBitacora: TQuery;
    dsBitacora: TDataSource;
    btnEliminarBitacora: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarVehiculoClick(Sender: TObject);
    procedure dbgVehiculosDblClick(Sender: TObject);
    procedure btnAgregarBitacoraClick(Sender: TObject);
    procedure btnEliminarBitacoraClick(Sender: TObject);
  private
    FIdVehiculoActual: Integer;
    procedure CargaVehiculos(const Filtro: string);
    procedure CargaBitacora(IdVehiculo: Integer);
    procedure LimpiaCaptura;
  end;

var
  FormMantBitacoraFlotilla: TFormMantBitacoraFlotilla;

implementation

{$R *.dfm}

procedure TFormMantBitacoraFlotilla.CargaVehiculos(const Filtro: string);
begin
  qVehiculos.Close;
  if Filtro = '' then
    qVehiculos.SQL.Text :=
      'SELECT * FROM flotilla_vehiculo WHERE num_emp = :emp ORDER BY numero_economico'
  else
    qVehiculos.SQL.Text :=
      'SELECT * FROM flotilla_vehiculo WHERE num_emp = :emp AND ' +
      '(numero_economico MATCHES :filtro OR placas MATCHES :filtro) ' +
      'ORDER BY numero_economico';
  qVehiculos.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  if Filtro <> '' then
    qVehiculos.ParamByName('filtro').AsString := '*' + Trim(Filtro) + '*';
  qVehiculos.Open;
end;

procedure TFormMantBitacoraFlotilla.CargaBitacora(IdVehiculo: Integer);
begin
  FIdVehiculoActual := IdVehiculo;
  qBitacora.Close;
  if IdVehiculo = 0 then Exit;
  qBitacora.SQL.Text :=
    'SELECT * FROM flotilla_bitacora WHERE id_vehiculo = :idv ORDER BY fecha DESC';
  qBitacora.ParamByName('idv').AsInteger := IdVehiculo;
  qBitacora.Open;
end;

procedure TFormMantBitacoraFlotilla.LimpiaCaptura;
begin
  rgTipoEvento.ItemIndex := 0;
  edtFecha.Text := DateToStr(Date);
  edtKilometraje.Text := '';
  edtLitros.Text := '';
  edtCosto.Text := '';
  edtTallerProveedor.Text := '';
  edtDescripcion.Text := '';
  edtObservaciones.Text := '';
end;

procedure TFormMantBitacoraFlotilla.FormCreate(Sender: TObject);
begin
  edtEmpresa.Text := '01'; // ajusta al default de tu sistema
  LimpiaCaptura;
  CargaVehiculos('');
end;

procedure TFormMantBitacoraFlotilla.btnBuscarVehiculoClick(Sender: TObject);
begin
  CargaVehiculos(edtBuscaVehiculo.Text);
end;

procedure TFormMantBitacoraFlotilla.dbgVehiculosDblClick(Sender: TObject);
begin
  if qVehiculos.IsEmpty then Exit;
  lblVehiculoSel.Caption := 'Vehiculo: ' +
    Trim(qVehiculos.FieldByName('numero_economico').AsString) + ' - ' +
    Trim(qVehiculos.FieldByName('placas').AsString);
  CargaBitacora(qVehiculos.FieldByName('id_vehiculo').AsInteger);
  LimpiaCaptura;
end;

procedure TFormMantBitacoraFlotilla.btnAgregarBitacoraClick(Sender: TObject);
var
  Q: TQuery;
  Fecha: TDateTime;
  Kilometraje: Integer;
  Litros, Costo: Double;
  Tipo: string;
begin
  if FIdVehiculoActual = 0 then
  begin
    ShowMessage('Primero elige un vehiculo (doble clic en el grid de arriba)');
    Exit;
  end;

  try
    Fecha := StrToDate(Trim(edtFecha.Text));
  except
    ShowMessage('Fecha invalida');
    edtFecha.SetFocus;
    Exit;
  end;

  Kilometraje := 0;
  if Trim(edtKilometraje.Text) <> '' then
  begin
    try
      Kilometraje := StrToInt(Trim(edtKilometraje.Text));
    except
      ShowMessage('Kilometraje invalido');
      edtKilometraje.SetFocus;
      Exit;
    end;
  end;

  Litros := 0;
  if Trim(edtLitros.Text) <> '' then
  begin
    try
      Litros := StrToFloat(Trim(edtLitros.Text));
    except
      ShowMessage('Litros invalido');
      edtLitros.SetFocus;
      Exit;
    end;
  end;

  Costo := 0;
  if Trim(edtCosto.Text) <> '' then
  begin
    try
      Costo := StrToFloat(Trim(edtCosto.Text));
    except
      ShowMessage('Costo invalido');
      edtCosto.SetFocus;
      Exit;
    end;
  end;

  if rgTipoEvento.ItemIndex = 1 then
    Tipo := 'M'
  else
    Tipo := 'C';

  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := Database1.DatabaseName;
    Q.SQL.Text :=
      'INSERT INTO flotilla_bitacora (num_emp, id_vehiculo, tipo, fecha, ' +
      'kilometraje, litros, costo, taller_proveedor, descripcion, observaciones) ' +
      'VALUES (:emp, :idv, :tipo, :fecha, :km, :litros, :costo, :taller, :desc, :obs)';
    Q.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
    Q.ParamByName('idv').AsInteger := FIdVehiculoActual;
    Q.ParamByName('tipo').AsString := Tipo;
    Q.ParamByName('fecha').AsDateTime := Fecha;
    if Kilometraje = 0 then
      Q.ParamByName('km').Clear
    else
      Q.ParamByName('km').AsInteger := Kilometraje;
    if Litros = 0 then
      Q.ParamByName('litros').Clear
    else
      Q.ParamByName('litros').AsFloat := Litros;
    if Costo = 0 then
      Q.ParamByName('costo').Clear
    else
      Q.ParamByName('costo').AsFloat := Costo;
    Q.ParamByName('taller').AsString := Trim(edtTallerProveedor.Text);
    Q.ParamByName('desc').AsString := Trim(edtDescripcion.Text);
    Q.ParamByName('obs').AsString := Trim(edtObservaciones.Text);
    Q.ExecSQL;
  finally
    Q.Free;
  end;

  CargaBitacora(FIdVehiculoActual);
  LimpiaCaptura;
end;

procedure TFormMantBitacoraFlotilla.btnEliminarBitacoraClick(Sender: TObject);
var
  Q: TQuery;
begin
  if qBitacora.IsEmpty then Exit;
  if MessageDlg('¿Eliminar este registro de bitacora?', mtConfirmation,
       [mbYes, mbNo], 0) <> mrYes then Exit;

  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := Database1.DatabaseName;
    Q.SQL.Text := 'DELETE FROM flotilla_bitacora WHERE id_bitacora = :id';
    Q.ParamByName('id').AsInteger := qBitacora.FieldByName('id_bitacora').AsInteger;
    Q.ExecSQL;
  finally
    Q.Free;
  end;

  CargaBitacora(FIdVehiculoActual);
end;

end.
