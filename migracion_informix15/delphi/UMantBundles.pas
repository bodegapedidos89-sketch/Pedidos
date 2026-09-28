unit UMantBundles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBTables;

type
  TFormMantBundles = class(TForm)
    Database1: TDatabase;
    pnlIzq: TPanel;
    pnlDer: TPanel;
    lblBundles: TLabel;
    edtBuscaBundle: TEdit;
    btnBuscarBundle: TButton;
    dbgBundles: TDBGrid;
    qBundles: TQuery;
    dsBundles: TDataSource;
    lblEmpresa: TLabel;
    edtEmpresa: TEdit;
    lblCodBundle: TLabel;
    edtCodBundle: TEdit;
    lblDescBundle: TLabel;
    edtDescBundle: TEdit;
    btnNuevoBundle: TButton;
    btnGuardarBundle: TButton;
    btnEliminarBundle: TButton;
    lblBuscaProducto: TLabel;
    edtBuscaProducto: TEdit;
    btnBuscarPresentaciones: TButton;
    dbgPresentacionesDisp: TDBGrid;
    qPresentacionesDisp: TQuery;
    dsPresentacionesDisp: TDataSource;
    lblCantidadXBundle: TLabel;
    edtCantidadXBundle: TEdit;
    lblOrden: TLabel;
    edtOrden: TEdit;
    btnAgregarComponente: TButton;
    lblComponentes: TLabel;
    dbgComponentes: TDBGrid;
    qComponentes: TQuery;
    dsComponentes: TDataSource;
    btnEliminarComponente: TButton;
    qBuscaArt: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarBundleClick(Sender: TObject);
    procedure dbgBundlesDblClick(Sender: TObject);
    procedure edtCodBundleExit(Sender: TObject);
    procedure btnNuevoBundleClick(Sender: TObject);
    procedure btnGuardarBundleClick(Sender: TObject);
    procedure btnEliminarBundleClick(Sender: TObject);
    procedure btnBuscarPresentacionesClick(Sender: TObject);
    procedure dbgPresentacionesDispDblClick(Sender: TObject);
    procedure btnAgregarComponenteClick(Sender: TObject);
    procedure btnEliminarComponenteClick(Sender: TObject);
  private
    FIdBundleActual: Integer;
    FIdPresentacionElegida: Integer;
    FEtiquetaElegida: string;
    function BuscaDescArticulo(const CodArt: string): string;
    procedure CargaBundles(const Filtro: string);
    procedure CargaComponentes(IdBundle: Integer);
    procedure LimpiaBundle;
    procedure LimpiaComponente;
  end;

var
  FormMantBundles: TFormMantBundles;

implementation

{$R *.dfm}

function TFormMantBundles.BuscaDescArticulo(const CodArt: string): string;
begin
  Result := '';
  qBuscaArt.Close;
  qBuscaArt.SQL.Text :=
    'SELECT des_art FROM inarinv WHERE num_emp = :emp AND cod_art = :cod';
  qBuscaArt.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qBuscaArt.ParamByName('cod').AsString := Trim(CodArt);
  qBuscaArt.Open;
  if not qBuscaArt.Eof then
    Result := Trim(qBuscaArt.FieldByName('des_art').AsString);
  qBuscaArt.Close;
end;

procedure TFormMantBundles.CargaBundles(const Filtro: string);
begin
  qBundles.Close;
  if Filtro = '' then
    qBundles.SQL.Text :=
      'SELECT * FROM bundle_producto WHERE num_emp = :emp ORDER BY descripcion'
  else
    qBundles.SQL.Text :=
      'SELECT * FROM bundle_producto WHERE num_emp = :emp AND ' +
      '(descripcion MATCHES :filtro OR cod_bundle MATCHES :filtro) ' +
      'ORDER BY descripcion';
  qBundles.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  if Filtro <> '' then
    qBundles.ParamByName('filtro').AsString := '*' + Trim(Filtro) + '*';
  qBundles.Open;
end;

procedure TFormMantBundles.CargaComponentes(IdBundle: Integer);
begin
  FIdBundleActual := IdBundle;
  qComponentes.Close;
  if IdBundle = 0 then Exit;
  qComponentes.SQL.Text :=
    'SELECT bd.id_presentacion, bd.cantidad_x_bundle, bd.orden, ' +
    'ap.cod_art_ancla, ap.etiqueta ' +
    'FROM bundle_detalle bd, art_presentacion ap ' +
    'WHERE bd.id_bundle = :idbundle AND bd.id_presentacion = ap.id_presentacion ' +
    'ORDER BY bd.orden';
  qComponentes.ParamByName('idbundle').AsInteger := IdBundle;
  qComponentes.Open;
end;

procedure TFormMantBundles.LimpiaBundle;
begin
  edtCodBundle.Text := '';
  edtDescBundle.Text := '';
  FIdBundleActual := 0;
  qComponentes.Close;
end;

procedure TFormMantBundles.LimpiaComponente;
begin
  FIdPresentacionElegida := 0;
  FEtiquetaElegida := '';
  edtBuscaProducto.Text := '';
  edtCantidadXBundle.Text := '1';
  edtOrden.Text := '1';
  qPresentacionesDisp.Close;
end;

procedure TFormMantBundles.FormCreate(Sender: TObject);
begin
  edtEmpresa.Text := '01'; // ajusta al default de tu sistema
  LimpiaComponente;
  CargaBundles('');
end;

procedure TFormMantBundles.btnBuscarBundleClick(Sender: TObject);
begin
  CargaBundles(edtBuscaBundle.Text);
end;

procedure TFormMantBundles.dbgBundlesDblClick(Sender: TObject);
begin
  if qBundles.IsEmpty then Exit;
  edtCodBundle.Text := Trim(qBundles.FieldByName('cod_bundle').AsString);
  edtDescBundle.Text := Trim(qBundles.FieldByName('descripcion').AsString);
  CargaComponentes(qBundles.FieldByName('id_bundle').AsInteger);
  LimpiaComponente;
end;

procedure TFormMantBundles.edtCodBundleExit(Sender: TObject);
var
  Desc: string;
begin
  if Trim(edtCodBundle.Text) = '' then Exit;
  Desc := BuscaDescArticulo(edtCodBundle.Text);
  if Desc = '' then
  begin
    ShowMessage('Ese codigo no existe en inarinv. Da de alta primero un renglon ' +
      '(aunque sea placeholder) para este bundle en el catalogo -- CODIGOART lo ' +
      'necesita para poder tecleario en la pantalla de ventas.');
    edtCodBundle.SetFocus;
    Exit;
  end;
  if Trim(edtDescBundle.Text) = '' then
    edtDescBundle.Text := Desc;
end;

procedure TFormMantBundles.btnNuevoBundleClick(Sender: TObject);
begin
  LimpiaBundle;
  LimpiaComponente;
  edtCodBundle.SetFocus;
end;

procedure TFormMantBundles.btnGuardarBundleClick(Sender: TObject);
var
  Q: TQuery;
  Existe: Boolean;
begin
  if Trim(edtCodBundle.Text) = '' then
  begin
    ShowMessage('Captura el codigo del bundle');
    edtCodBundle.SetFocus;
    Exit;
  end;
  if BuscaDescArticulo(edtCodBundle.Text) = '' then
  begin
    ShowMessage('El codigo no existe en inarinv');
    edtCodBundle.SetFocus;
    Exit;
  end;
  if Trim(edtDescBundle.Text) = '' then
  begin
    ShowMessage('Captura la descripcion del bundle');
    edtDescBundle.SetFocus;
    Exit;
  end;

  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := Database1.DatabaseName;

    // busca si ya existe, para actualizar en vez de borrar+insertar --
    // id_bundle es SERIAL y bundle_detalle depende de el, no se puede
    // regenerar sin huerfanar los componentes ya cargados
    Q.SQL.Text := 'SELECT id_bundle FROM bundle_producto WHERE num_emp = :emp AND cod_bundle = :cod';
    Q.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
    Q.ParamByName('cod').AsString := Trim(edtCodBundle.Text);
    Q.Open;
    Existe := not Q.Eof;
    if Existe then
      FIdBundleActual := Q.FieldByName('id_bundle').AsInteger;
    Q.Close;

    if Existe then
    begin
      Q.SQL.Text := 'UPDATE bundle_producto SET descripcion = :desc WHERE id_bundle = :idb';
      Q.ParamByName('desc').AsString := Trim(edtDescBundle.Text);
      Q.ParamByName('idb').AsInteger := FIdBundleActual;
      Q.ExecSQL;
    end
    else
    begin
      Q.SQL.Text :=
        'INSERT INTO bundle_producto (num_emp, cod_bundle, descripcion, activo) ' +
        'VALUES (:emp, :cod, :desc, "S")';
      Q.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
      Q.ParamByName('cod').AsString := Trim(edtCodBundle.Text);
      Q.ParamByName('desc').AsString := Trim(edtDescBundle.Text);
      Q.ExecSQL;

      Q.SQL.Text := 'SELECT id_bundle FROM bundle_producto WHERE num_emp = :emp AND cod_bundle = :cod';
      Q.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
      Q.ParamByName('cod').AsString := Trim(edtCodBundle.Text);
      Q.Open;
      if not Q.Eof then
        FIdBundleActual := Q.FieldByName('id_bundle').AsInteger;
      Q.Close;
    end;
  finally
    Q.Free;
  end;

  ShowMessage('Bundle guardado');
  CargaBundles(edtBuscaBundle.Text);
  CargaComponentes(FIdBundleActual);
end;

procedure TFormMantBundles.btnEliminarBundleClick(Sender: TObject);
var
  Q: TQuery;
begin
  if FIdBundleActual = 0 then Exit;
  if MessageDlg('¿Eliminar este bundle y TODOS sus componentes?',
       mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := Database1.DatabaseName;
    Q.SQL.Text := 'DELETE FROM bundle_detalle WHERE id_bundle = :idb';
    Q.ParamByName('idb').AsInteger := FIdBundleActual;
    Q.ExecSQL;

    Q.SQL.Text := 'DELETE FROM bundle_producto WHERE id_bundle = :idb';
    Q.ParamByName('idb').AsInteger := FIdBundleActual;
    Q.ExecSQL;
  finally
    Q.Free;
  end;

  LimpiaBundle;
  LimpiaComponente;
  CargaBundles(edtBuscaBundle.Text);
end;

procedure TFormMantBundles.btnBuscarPresentacionesClick(Sender: TObject);
begin
  qPresentacionesDisp.Close;
  qPresentacionesDisp.SQL.Text :=
    'SELECT id_presentacion, cod_art_ancla, cod_art_legacy, etiqueta ' +
    'FROM art_presentacion WHERE num_emp = :emp AND activo = ''S'' ' +
    'AND cod_art_ancla MATCHES :filtro ORDER BY cod_art_ancla, etiqueta';
  qPresentacionesDisp.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qPresentacionesDisp.ParamByName('filtro').AsString := '*' + Trim(edtBuscaProducto.Text) + '*';
  qPresentacionesDisp.Open;
end;

procedure TFormMantBundles.dbgPresentacionesDispDblClick(Sender: TObject);
begin
  if qPresentacionesDisp.IsEmpty then Exit;
  FIdPresentacionElegida := qPresentacionesDisp.FieldByName('id_presentacion').AsInteger;
  FEtiquetaElegida := Trim(qPresentacionesDisp.FieldByName('etiqueta').AsString);
  ShowMessage('Presentacion elegida: ' +
    Trim(qPresentacionesDisp.FieldByName('cod_art_ancla').AsString) + ' - ' + FEtiquetaElegida +
    #13#10 + 'Ahora captura la cantidad por bundle y presiona "Agregar componente".');
end;

procedure TFormMantBundles.btnAgregarComponenteClick(Sender: TObject);
var
  Q: TQuery;
  Cantidad: Double;
  Orden: Integer;
begin
  if FIdBundleActual = 0 then
  begin
    ShowMessage('Primero guarda o selecciona el bundle');
    Exit;
  end;
  if FIdPresentacionElegida = 0 then
  begin
    ShowMessage('Busca un producto y haz doble clic en la presentacion (arriba) para elegirla');
    Exit;
  end;
  try
    Cantidad := StrToFloat(edtCantidadXBundle.Text);
  except
    ShowMessage('Cantidad por bundle invalida');
    edtCantidadXBundle.SetFocus;
    Exit;
  end;
  try
    Orden := StrToInt(edtOrden.Text);
  except
    Orden := 1;
  end;

  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := Database1.DatabaseName;

    // evita duplicar el mismo componente en el mismo bundle
    Q.SQL.Text := 'DELETE FROM bundle_detalle WHERE id_bundle = :idb AND id_presentacion = :idp';
    Q.ParamByName('idb').AsInteger := FIdBundleActual;
    Q.ParamByName('idp').AsInteger := FIdPresentacionElegida;
    Q.ExecSQL;

    Q.SQL.Text :=
      'INSERT INTO bundle_detalle (id_bundle, id_presentacion, cantidad_x_bundle, orden) ' +
      'VALUES (:idb, :idp, :cant, :ord)';
    Q.ParamByName('idb').AsInteger := FIdBundleActual;
    Q.ParamByName('idp').AsInteger := FIdPresentacionElegida;
    Q.ParamByName('cant').AsFloat := Cantidad;
    Q.ParamByName('ord').AsInteger := Orden;
    Q.ExecSQL;
  finally
    Q.Free;
  end;

  CargaComponentes(FIdBundleActual);
  LimpiaComponente;
end;

procedure TFormMantBundles.btnEliminarComponenteClick(Sender: TObject);
var
  Q: TQuery;
begin
  if qComponentes.IsEmpty then Exit;
  if MessageDlg('¿Eliminar este componente del bundle?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := Database1.DatabaseName;
    Q.SQL.Text := 'DELETE FROM bundle_detalle WHERE id_bundle = :idb AND id_presentacion = :idp';
    Q.ParamByName('idb').AsInteger := FIdBundleActual;
    Q.ParamByName('idp').AsInteger := qComponentes.FieldByName('id_presentacion').AsInteger;
    Q.ExecSQL;
  finally
    Q.Free;
  end;

  CargaComponentes(FIdBundleActual);
end;

end.
