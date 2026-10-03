unit UMantChoferes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBTables;

type
  TFormMantChoferes = class(TForm)
    Database1: TDatabase;
    pnlIzq: TPanel;
    pnlDer: TPanel;
    lblEmpresa: TLabel;
    edtEmpresa: TEdit;
    lblBuscaChofer: TLabel;
    edtBuscaChofer: TEdit;
    btnBuscarChofer: TButton;
    dbgChoferes: TDBGrid;
    qChoferes: TQuery;
    dsChoferes: TDataSource;
    lblClave: TLabel;
    edtClave: TEdit;
    lblNombre: TLabel;
    edtNombre: TEdit;
    lblLicencia: TLabel;
    edtLicencia: TEdit;
    lblVigenciaLicencia: TLabel;
    edtVigenciaLicencia: TEdit;
    lblTelefono: TLabel;
    edtTelefono: TEdit;
    chkChoferActivo: TCheckBox;
    btnNuevoChofer: TButton;
    btnGuardarChofer: TButton;
    btnEliminarChofer: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarChoferClick(Sender: TObject);
    procedure dbgChoferesDblClick(Sender: TObject);
    procedure btnNuevoChoferClick(Sender: TObject);
    procedure btnGuardarChoferClick(Sender: TObject);
    procedure btnEliminarChoferClick(Sender: TObject);
  private
    FIdChoferActual: Integer;
    procedure CargaChoferes(const Filtro: string);
    procedure LimpiaChofer;
  end;

var
  FormMantChoferes: TFormMantChoferes;

implementation

{$R *.dfm}

procedure TFormMantChoferes.CargaChoferes(const Filtro: string);
begin
  qChoferes.Close;
  if Filtro = '' then
    qChoferes.SQL.Text :=
      'SELECT * FROM flotilla_chofer WHERE num_emp = :emp ORDER BY nombre'
  else
    qChoferes.SQL.Text :=
      'SELECT * FROM flotilla_chofer WHERE num_emp = :emp AND ' +
      '(nombre MATCHES :filtro OR clave MATCHES :filtro) ORDER BY nombre';
  qChoferes.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  if Filtro <> '' then
    qChoferes.ParamByName('filtro').AsString := '*' + Trim(Filtro) + '*';
  qChoferes.Open;
end;

procedure TFormMantChoferes.LimpiaChofer;
begin
  FIdChoferActual := 0;
  edtClave.Text := '';
  edtNombre.Text := '';
  edtLicencia.Text := '';
  edtVigenciaLicencia.Text := '';
  edtTelefono.Text := '';
  chkChoferActivo.Checked := True;
end;

procedure TFormMantChoferes.FormCreate(Sender: TObject);
begin
  edtEmpresa.Text := '01'; // ajusta al default de tu sistema
  LimpiaChofer;
  CargaChoferes('');
end;

procedure TFormMantChoferes.btnBuscarChoferClick(Sender: TObject);
begin
  CargaChoferes(edtBuscaChofer.Text);
end;

procedure TFormMantChoferes.dbgChoferesDblClick(Sender: TObject);
begin
  if qChoferes.IsEmpty then Exit;
  FIdChoferActual := qChoferes.FieldByName('id_chofer').AsInteger;
  edtClave.Text := Trim(qChoferes.FieldByName('clave').AsString);
  edtNombre.Text := Trim(qChoferes.FieldByName('nombre').AsString);
  edtLicencia.Text := Trim(qChoferes.FieldByName('licencia').AsString);
  if qChoferes.FieldByName('vigencia_licencia').IsNull then
    edtVigenciaLicencia.Text := ''
  else
    edtVigenciaLicencia.Text :=
      DateToStr(qChoferes.FieldByName('vigencia_licencia').AsDateTime);
  edtTelefono.Text := Trim(qChoferes.FieldByName('telefono').AsString);
  chkChoferActivo.Checked := Trim(qChoferes.FieldByName('activo').AsString) = 'S';
end;

procedure TFormMantChoferes.btnNuevoChoferClick(Sender: TObject);
begin
  LimpiaChofer;
  edtClave.SetFocus;
end;

procedure TFormMantChoferes.btnGuardarChoferClick(Sender: TObject);
var
  Q: TQuery;
  Existe: Boolean;
  VigenciaLic: TDateTime;
  TieneVigencia: Boolean;
begin
  if Trim(edtClave.Text) = '' then
  begin
    ShowMessage('Captura la clave del chofer');
    edtClave.SetFocus;
    Exit;
  end;
  if Trim(edtNombre.Text) = '' then
  begin
    ShowMessage('Captura el nombre del chofer');
    edtNombre.SetFocus;
    Exit;
  end;

  TieneVigencia := Trim(edtVigenciaLicencia.Text) <> '';
  VigenciaLic := 0;
  if TieneVigencia then
  begin
    try
      VigenciaLic := StrToDate(Trim(edtVigenciaLicencia.Text));
    except
      ShowMessage('Fecha de vigencia de licencia invalida');
      edtVigenciaLicencia.SetFocus;
      Exit;
    end;
  end;

  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := Database1.DatabaseName;

    Q.SQL.Text := 'SELECT id_chofer FROM flotilla_chofer WHERE num_emp = :emp ' +
      'AND clave = :clave';
    Q.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
    Q.ParamByName('clave').AsString := Trim(edtClave.Text);
    Q.Open;
    Existe := not Q.Eof;
    if Existe then
      FIdChoferActual := Q.FieldByName('id_chofer').AsInteger;
    Q.Close;

    if Existe then
      Q.SQL.Text :=
        'UPDATE flotilla_chofer SET nombre = :nombre, licencia = :licencia, ' +
        'vigencia_licencia = :vigencia, telefono = :tel, activo = :act ' +
        'WHERE id_chofer = :id'
    else
      Q.SQL.Text :=
        'INSERT INTO flotilla_chofer (num_emp, clave, nombre, licencia, ' +
        'vigencia_licencia, telefono, activo) ' +
        'VALUES (:emp, :clave, :nombre, :licencia, :vigencia, :tel, :act)';

    if Existe then
      Q.ParamByName('id').AsInteger := FIdChoferActual
    else
    begin
      Q.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
      Q.ParamByName('clave').AsString := Trim(edtClave.Text);
    end;
    Q.ParamByName('nombre').AsString := Trim(edtNombre.Text);
    Q.ParamByName('licencia').AsString := Trim(edtLicencia.Text);
    if TieneVigencia then
      Q.ParamByName('vigencia').AsDateTime := VigenciaLic
    else
      Q.ParamByName('vigencia').Clear;
    Q.ParamByName('tel').AsString := Trim(edtTelefono.Text);
    if chkChoferActivo.Checked then
      Q.ParamByName('act').AsString := 'S'
    else
      Q.ParamByName('act').AsString := 'N';
    Q.ExecSQL;

    if not Existe then
    begin
      Q.SQL.Text := 'SELECT id_chofer FROM flotilla_chofer WHERE num_emp = :emp ' +
        'AND clave = :clave';
      Q.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
      Q.ParamByName('clave').AsString := Trim(edtClave.Text);
      Q.Open;
      if not Q.Eof then
        FIdChoferActual := Q.FieldByName('id_chofer').AsInteger;
      Q.Close;
    end;
  finally
    Q.Free;
  end;

  ShowMessage('Chofer guardado');
  CargaChoferes(edtBuscaChofer.Text);
end;

procedure TFormMantChoferes.btnEliminarChoferClick(Sender: TObject);
var
  Q: TQuery;
begin
  if FIdChoferActual = 0 then Exit;
  if MessageDlg('¿Eliminar este chofer?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := Database1.DatabaseName;
    Q.SQL.Text := 'DELETE FROM flotilla_chofer WHERE id_chofer = :id';
    Q.ParamByName('id').AsInteger := FIdChoferActual;
    Q.ExecSQL;
  finally
    Q.Free;
  end;

  LimpiaChofer;
  CargaChoferes(edtBuscaChofer.Text);
end;

end.
