unit UMantFlotilla;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBTables;

type
  TFormMantFlotilla = class(TForm)
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
    lblNumEconomico: TLabel;
    edtNumEconomico: TEdit;
    rgTipoVehiculo: TRadioGroup;
    lblPlacas: TLabel;
    edtPlacas: TEdit;
    lblMarca: TLabel;
    edtMarca: TEdit;
    lblModelo: TLabel;
    edtModelo: TEdit;
    lblAnio: TLabel;
    edtAnio: TEdit;
    lblCapacidadKg: TLabel;
    edtCapacidadKg: TEdit;
    lblChofer: TLabel;
    edtChofer: TEdit;
    chkVehiculoActivo: TCheckBox;
    btnNuevoVehiculo: TButton;
    btnGuardarVehiculo: TButton;
    btnEliminarVehiculo: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarVehiculoClick(Sender: TObject);
    procedure dbgVehiculosDblClick(Sender: TObject);
    procedure btnNuevoVehiculoClick(Sender: TObject);
    procedure btnGuardarVehiculoClick(Sender: TObject);
    procedure btnEliminarVehiculoClick(Sender: TObject);
  private
    FIdVehiculoActual: Integer;
    procedure CargaVehiculos(const Filtro: string);
    procedure LimpiaVehiculo;
  end;

var
  FormMantFlotilla: TFormMantFlotilla;

implementation

{$R *.dfm}

procedure TFormMantFlotilla.CargaVehiculos(const Filtro: string);
begin
  qVehiculos.Close;
  if Filtro = '' then
    qVehiculos.SQL.Text :=
      'SELECT * FROM flotilla_vehiculo WHERE num_emp = :emp ORDER BY numero_economico'
  else
    qVehiculos.SQL.Text :=
      'SELECT * FROM flotilla_vehiculo WHERE num_emp = :emp AND ' +
      '(numero_economico MATCHES :filtro OR placas MATCHES :filtro OR ' +
      'marca MATCHES :filtro) ORDER BY numero_economico';
  qVehiculos.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  if Filtro <> '' then
    qVehiculos.ParamByName('filtro').AsString := '*' + Trim(Filtro) + '*';
  qVehiculos.Open;
end;

procedure TFormMantFlotilla.LimpiaVehiculo;
begin
  FIdVehiculoActual := 0;
  edtNumEconomico.Text := '';
  rgTipoVehiculo.ItemIndex := 0;
  edtPlacas.Text := '';
  edtMarca.Text := '';
  edtModelo.Text := '';
  edtAnio.Text := '';
  edtCapacidadKg.Text := '';
  edtChofer.Text := '';
  chkVehiculoActivo.Checked := True;
end;

procedure TFormMantFlotilla.FormCreate(Sender: TObject);
begin
  edtEmpresa.Text := '01'; // ajusta al default de tu sistema
  LimpiaVehiculo;
  CargaVehiculos('');
end;

procedure TFormMantFlotilla.btnBuscarVehiculoClick(Sender: TObject);
begin
  CargaVehiculos(edtBuscaVehiculo.Text);
end;

procedure TFormMantFlotilla.dbgVehiculosDblClick(Sender: TObject);
begin
  if qVehiculos.IsEmpty then Exit;
  FIdVehiculoActual := qVehiculos.FieldByName('id_vehiculo').AsInteger;
  edtNumEconomico.Text := Trim(qVehiculos.FieldByName('numero_economico').AsString);
  if Trim(qVehiculos.FieldByName('tipo_vehiculo').AsString) = 'C' then
    rgTipoVehiculo.ItemIndex := 1
  else
    rgTipoVehiculo.ItemIndex := 0;
  edtPlacas.Text := Trim(qVehiculos.FieldByName('placas').AsString);
  edtMarca.Text := Trim(qVehiculos.FieldByName('marca').AsString);
  edtModelo.Text := Trim(qVehiculos.FieldByName('modelo').AsString);
  if qVehiculos.FieldByName('anio').IsNull then
    edtAnio.Text := ''
  else
    edtAnio.Text := qVehiculos.FieldByName('anio').AsString;
  if qVehiculos.FieldByName('capacidad_kg').IsNull then
    edtCapacidadKg.Text := ''
  else
    edtCapacidadKg.Text := qVehiculos.FieldByName('capacidad_kg').AsString;
  edtChofer.Text := Trim(qVehiculos.FieldByName('chofer_habitual').AsString);
  chkVehiculoActivo.Checked := Trim(qVehiculos.FieldByName('activo').AsString) = 'S';
end;

procedure TFormMantFlotilla.btnNuevoVehiculoClick(Sender: TObject);
begin
  LimpiaVehiculo;
  edtNumEconomico.SetFocus;
end;

procedure TFormMantFlotilla.btnGuardarVehiculoClick(Sender: TObject);
var
  Q: TQuery;
  Existe: Boolean;
  Tipo: string;
  Anio: Integer;
  CapacidadKg: Double;
begin
  if Trim(edtNumEconomico.Text) = '' then
  begin
    ShowMessage('Captura el numero economico del vehiculo');
    edtNumEconomico.SetFocus;
    Exit;
  end;

  if rgTipoVehiculo.ItemIndex = 1 then
    Tipo := 'C'
  else
    Tipo := 'P';

  Anio := 0;
  if Trim(edtAnio.Text) <> '' then
  begin
    try
      Anio := StrToInt(Trim(edtAnio.Text));
    except
      ShowMessage('Año invalido');
      edtAnio.SetFocus;
      Exit;
    end;
  end;

  CapacidadKg := 0;
  if Trim(edtCapacidadKg.Text) <> '' then
  begin
    try
      CapacidadKg := StrToFloat(Trim(edtCapacidadKg.Text));
    except
      ShowMessage('Capacidad (kg) invalida');
      edtCapacidadKg.SetFocus;
      Exit;
    end;
  end;

  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := Database1.DatabaseName;

    // busca si ya existe (mismo num_emp + numero_economico), para
    // actualizar en vez de duplicar -- igual que en UMantBundles.pas
    Q.SQL.Text := 'SELECT id_vehiculo FROM flotilla_vehiculo WHERE num_emp = :emp ' +
      'AND numero_economico = :num';
    Q.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
    Q.ParamByName('num').AsString := Trim(edtNumEconomico.Text);
    Q.Open;
    Existe := not Q.Eof;
    if Existe then
      FIdVehiculoActual := Q.FieldByName('id_vehiculo').AsInteger;
    Q.Close;

    if Existe then
    begin
      Q.SQL.Text :=
        'UPDATE flotilla_vehiculo SET tipo_vehiculo = :tipo, placas = :placas, ' +
        'marca = :marca, modelo = :modelo, anio = :anio, capacidad_kg = :cap, ' +
        'chofer_habitual = :chofer, activo = :act WHERE id_vehiculo = :id';
    end
    else
    begin
      Q.SQL.Text :=
        'INSERT INTO flotilla_vehiculo (num_emp, numero_economico, tipo_vehiculo, ' +
        'placas, marca, modelo, anio, capacidad_kg, chofer_habitual, activo) ' +
        'VALUES (:emp, :num, :tipo, :placas, :marca, :modelo, :anio, :cap, :chofer, :act)';
    end;

    if Existe then
      Q.ParamByName('id').AsInteger := FIdVehiculoActual
    else
    begin
      Q.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
      Q.ParamByName('num').AsString := Trim(edtNumEconomico.Text);
    end;
    Q.ParamByName('tipo').AsString := Tipo;
    Q.ParamByName('placas').AsString := Trim(edtPlacas.Text);
    Q.ParamByName('marca').AsString := Trim(edtMarca.Text);
    Q.ParamByName('modelo').AsString := Trim(edtModelo.Text);
    if Anio = 0 then
      Q.ParamByName('anio').Clear
    else
      Q.ParamByName('anio').AsInteger := Anio;
    if CapacidadKg = 0 then
      Q.ParamByName('cap').Clear
    else
      Q.ParamByName('cap').AsFloat := CapacidadKg;
    Q.ParamByName('chofer').AsString := Trim(edtChofer.Text);
    if chkVehiculoActivo.Checked then
      Q.ParamByName('act').AsString := 'S'
    else
      Q.ParamByName('act').AsString := 'N';
    Q.ExecSQL;

    if not Existe then
    begin
      Q.SQL.Text := 'SELECT id_vehiculo FROM flotilla_vehiculo WHERE num_emp = :emp ' +
        'AND numero_economico = :num';
      Q.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
      Q.ParamByName('num').AsString := Trim(edtNumEconomico.Text);
      Q.Open;
      if not Q.Eof then
        FIdVehiculoActual := Q.FieldByName('id_vehiculo').AsInteger;
      Q.Close;
    end;
  finally
    Q.Free;
  end;

  ShowMessage('Vehiculo guardado');
  CargaVehiculos(edtBuscaVehiculo.Text);
end;

procedure TFormMantFlotilla.btnEliminarVehiculoClick(Sender: TObject);
var
  Q: TQuery;
begin
  if FIdVehiculoActual = 0 then Exit;
  if MessageDlg('¿Eliminar este vehiculo de la flotilla?',
       mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := Database1.DatabaseName;
    Q.SQL.Text := 'DELETE FROM flotilla_vehiculo WHERE id_vehiculo = :id';
    Q.ParamByName('id').AsInteger := FIdVehiculoActual;
    Q.ExecSQL;
  finally
    Q.Free;
  end;

  LimpiaVehiculo;
  CargaVehiculos(edtBuscaVehiculo.Text);
end;

end.
