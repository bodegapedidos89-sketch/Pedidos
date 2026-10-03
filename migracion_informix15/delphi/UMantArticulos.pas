unit UMantArticulos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBTables;

type
  TFormMantArticulos = class(TForm)
    Database1: TDatabase;
    pnlIzq: TPanel;
    pnlDer: TPanel;
    lblEmpresa: TLabel;
    edtEmpresa: TEdit;
    lblBuscaProducto: TLabel;
    edtBuscaProducto: TEdit;
    btnBuscarProducto: TButton;
    dbgProductos: TDBGrid;
    qProductos: TQuery;
    dsProductos: TDataSource;
    lblCodAncla: TLabel;
    edtCodAncla: TEdit;
    lblDescProducto: TLabel;
    edtDescProducto: TEdit;
    chkProductoActivo: TCheckBox;
    btnNuevoProducto: TButton;
    btnGuardarProducto: TButton;
    btnEliminarProducto: TButton;
    lblPresentaciones: TLabel;
    dbgPresentaciones: TDBGrid;
    qPresentaciones: TQuery;
    dsPresentaciones: TDataSource;
    lblCodLegacy: TLabel;
    edtCodLegacy: TEdit;
    lblEtiqueta: TLabel;
    edtEtiqueta: TEdit;
    lblFactor: TLabel;
    edtFactor: TEdit;
    lblTara: TLabel;
    edtTara: TEdit;
    chkEsVariable: TCheckBox;
    chkPrecioDerivado: TCheckBox;
    rgUso: TRadioGroup;
    lblCodigoBarras: TLabel;
    lblCodigoBascula: TLabel;
    edtCodigoBarras: TEdit;
    edtCodigoBascula: TEdit;
    chkPresentacionActiva: TCheckBox;
    btnNuevaPresentacion: TButton;
    btnGuardarPresentacion: TButton;
    btnEliminarPresentacion: TButton;
    qOper: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarProductoClick(Sender: TObject);
    procedure dbgProductosDblClick(Sender: TObject);
    procedure btnNuevoProductoClick(Sender: TObject);
    procedure btnGuardarProductoClick(Sender: TObject);
    procedure btnEliminarProductoClick(Sender: TObject);
    procedure dbgPresentacionesDblClick(Sender: TObject);
    procedure btnNuevaPresentacionClick(Sender: TObject);
    procedure btnGuardarPresentacionClick(Sender: TObject);
    procedure btnEliminarPresentacionClick(Sender: TObject);
  private
    FCodAnclaActual: string;
    procedure CargaProductos(const Filtro: string);
    procedure CargaPresentaciones(const CodAncla: string);
    procedure LimpiaProducto;
    procedure LimpiaPresentacion;
  end;

var
  FormMantArticulos: TFormMantArticulos;

implementation

{$R *.dfm}

procedure TFormMantArticulos.CargaProductos(const Filtro: string);
begin
  qProductos.Close;
  if Trim(Filtro) = '' then
    qProductos.SQL.Text :=
      'SELECT * FROM art_producto WHERE num_emp = :emp ORDER BY descripcion'
  else
    qProductos.SQL.Text :=
      'SELECT * FROM art_producto WHERE num_emp = :emp AND ' +
      '(descripcion MATCHES :filtro OR cod_art_ancla MATCHES :filtro) ' +
      'ORDER BY descripcion';
  qProductos.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  if Trim(Filtro) <> '' then
    qProductos.ParamByName('filtro').AsString := '*' + Trim(Filtro) + '*';
  qProductos.Open;
end;

procedure TFormMantArticulos.CargaPresentaciones(const CodAncla: string);
begin
  FCodAnclaActual := CodAncla;
  qPresentaciones.Close;
  if CodAncla = '' then Exit;
  qPresentaciones.SQL.Text :=
    'SELECT * FROM art_presentacion WHERE num_emp = :emp AND cod_art_ancla = :anc ' +
    'ORDER BY etiqueta';
  qPresentaciones.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qPresentaciones.ParamByName('anc').AsString := CodAncla;
  qPresentaciones.Open;
end;

procedure TFormMantArticulos.LimpiaProducto;
begin
  edtCodAncla.Text := '';
  edtDescProducto.Text := '';
  chkProductoActivo.Checked := True;
  FCodAnclaActual := '';
  qPresentaciones.Close;
  LimpiaPresentacion;
end;

procedure TFormMantArticulos.LimpiaPresentacion;
begin
  edtCodLegacy.Text := '';
  edtEtiqueta.Text := '';
  edtFactor.Text := '1';
  edtTara.Text := '0';
  chkEsVariable.Checked := False;
  chkPrecioDerivado.Checked := False;
  rgUso.ItemIndex := 2; // 'A' ambos, por default
  edtCodigoBarras.Text := '';
  edtCodigoBascula.Text := '';
  chkPresentacionActiva.Checked := True;
end;

procedure TFormMantArticulos.FormCreate(Sender: TObject);
begin
  edtEmpresa.Text := '01'; // ajusta al default de tu sistema
  LimpiaProducto;
  CargaProductos('');
end;

procedure TFormMantArticulos.btnBuscarProductoClick(Sender: TObject);
begin
  CargaProductos(edtBuscaProducto.Text);
end;

procedure TFormMantArticulos.dbgProductosDblClick(Sender: TObject);
begin
  if qProductos.IsEmpty then Exit;
  edtCodAncla.Text := Trim(qProductos.FieldByName('cod_art_ancla').AsString);
  edtDescProducto.Text := Trim(qProductos.FieldByName('descripcion').AsString);
  chkProductoActivo.Checked := Trim(qProductos.FieldByName('activo').AsString) = 'S';
  CargaPresentaciones(edtCodAncla.Text);
  LimpiaPresentacion;
end;

procedure TFormMantArticulos.btnNuevoProductoClick(Sender: TObject);
begin
  LimpiaProducto;
  edtCodAncla.SetFocus;
end;

procedure TFormMantArticulos.btnGuardarProductoClick(Sender: TObject);
var
  Existe: Boolean;
begin
  if Trim(edtCodAncla.Text) = '' then
  begin
    ShowMessage('Captura el codigo ancla del producto');
    edtCodAncla.SetFocus;
    Exit;
  end;
  if Trim(edtDescProducto.Text) = '' then
  begin
    ShowMessage('Captura la descripcion del producto');
    edtDescProducto.SetFocus;
    Exit;
  end;

  qOper.Close;
  qOper.SQL.Text := 'SELECT cod_art_ancla FROM art_producto WHERE num_emp = :emp AND cod_art_ancla = :anc';
  qOper.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qOper.ParamByName('anc').AsString := Trim(edtCodAncla.Text);
  qOper.Open;
  Existe := not qOper.Eof;
  qOper.Close;

  if Existe then
  begin
    qOper.SQL.Text :=
      'UPDATE art_producto SET descripcion = :desc, activo = :act ' +
      'WHERE num_emp = :emp AND cod_art_ancla = :anc';
  end
  else
  begin
    qOper.SQL.Text :=
      'INSERT INTO art_producto (num_emp, cod_art_ancla, descripcion, activo) ' +
      'VALUES (:emp, :anc, :desc, :act)';
  end;
  qOper.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qOper.ParamByName('anc').AsString := Trim(edtCodAncla.Text);
  qOper.ParamByName('desc').AsString := Trim(edtDescProducto.Text);
  if chkProductoActivo.Checked then
    qOper.ParamByName('act').AsString := 'S'
  else
    qOper.ParamByName('act').AsString := 'N';
  qOper.ExecSQL;

  ShowMessage('Producto guardado');
  FCodAnclaActual := Trim(edtCodAncla.Text);
  CargaProductos(edtBuscaProducto.Text);
  CargaPresentaciones(FCodAnclaActual);
end;

procedure TFormMantArticulos.btnEliminarProductoClick(Sender: TObject);
begin
  if Trim(edtCodAncla.Text) = '' then Exit;
  if MessageDlg('¿Eliminar este producto y TODAS sus presentaciones? ' +
       'Si ya se uso en ventas/bundles, mejor desactivalo en vez de borrarlo.',
       mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

  qOper.Close;
  qOper.SQL.Text := 'DELETE FROM art_presentacion WHERE num_emp = :emp AND cod_art_ancla = :anc';
  qOper.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qOper.ParamByName('anc').AsString := Trim(edtCodAncla.Text);
  qOper.ExecSQL;

  qOper.SQL.Text := 'DELETE FROM art_producto WHERE num_emp = :emp AND cod_art_ancla = :anc';
  qOper.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qOper.ParamByName('anc').AsString := Trim(edtCodAncla.Text);
  qOper.ExecSQL;

  LimpiaProducto;
  CargaProductos(edtBuscaProducto.Text);
end;

procedure TFormMantArticulos.dbgPresentacionesDblClick(Sender: TObject);
begin
  if qPresentaciones.IsEmpty then Exit;
  edtCodLegacy.Text := Trim(qPresentaciones.FieldByName('cod_art_legacy').AsString);
  edtEtiqueta.Text := Trim(qPresentaciones.FieldByName('etiqueta').AsString);
  edtFactor.Text := qPresentaciones.FieldByName('factor_a_base').AsString;
  edtTara.Text := qPresentaciones.FieldByName('tara_kg').AsString;
  chkEsVariable.Checked := Trim(qPresentaciones.FieldByName('es_variable').AsString) = 'S';
  chkPrecioDerivado.Checked := Trim(qPresentaciones.FieldByName('precio_derivado').AsString) = 'S';
  edtCodigoBarras.Text := Trim(qPresentaciones.FieldByName('codigo_barras').AsString);
  edtCodigoBascula.Text := Trim(qPresentaciones.FieldByName('codigo_bascula').AsString);
  chkPresentacionActiva.Checked := Trim(qPresentaciones.FieldByName('activo').AsString) = 'S';
  if Trim(qPresentaciones.FieldByName('uso').AsString) = 'C' then
    rgUso.ItemIndex := 0
  else if Trim(qPresentaciones.FieldByName('uso').AsString) = 'V' then
    rgUso.ItemIndex := 1
  else
    rgUso.ItemIndex := 2; // 'A'
end;

procedure TFormMantArticulos.btnNuevaPresentacionClick(Sender: TObject);
begin
  if FCodAnclaActual = '' then
  begin
    ShowMessage('Primero guarda o selecciona el producto');
    Exit;
  end;
  LimpiaPresentacion;
  edtEtiqueta.SetFocus;
end;

procedure TFormMantArticulos.btnGuardarPresentacionClick(Sender: TObject);
var
  Existe: Boolean;
  Factor, Tara: Double;
  Uso: string;
  CodBarras, CodBascula: string;
  i: Integer;
  SoloDigitos: Boolean;
begin
  if FCodAnclaActual = '' then
  begin
    ShowMessage('Primero guarda o selecciona el producto');
    Exit;
  end;
  if Trim(edtCodLegacy.Text) = '' then
  begin
    ShowMessage('Captura el codigo legacy real (el que ya existe en inarinv)');
    edtCodLegacy.SetFocus;
    Exit;
  end;
  if Trim(edtEtiqueta.Text) = '' then
  begin
    ShowMessage('Captura la etiqueta de la presentacion (CAJA, KG, PIEZA...)');
    edtEtiqueta.SetFocus;
    Exit;
  end;
  try
    Factor := StrToFloat(edtFactor.Text);
  except
    ShowMessage('Factor a base invalido');
    edtFactor.SetFocus;
    Exit;
  end;
  try
    Tara := StrToFloat(edtTara.Text);
  except
    ShowMessage('Tara invalida');
    edtTara.SetFocus;
    Exit;
  end;

  // codigo de barras FIJO: si se captura, debe quedar exactamente igual
  // de largo (13 digitos) a lo que JUNTA.pas reconoce como codigo de
  // barras escaneado -- si no, nunca va a hacer match en el mostrador
  // y la captura queda muerta sin que nadie se de cuenta.
  CodBarras := Trim(edtCodigoBarras.Text);
  if CodBarras <> '' then
  begin
    SoloDigitos := Length(CodBarras) = 13;
    if SoloDigitos then
      for i := 1 to 13 do
        if not (CodBarras[i] in ['0'..'9']) then
        begin
          SoloDigitos := False;
          Break;
        end;
    if not SoloDigitos then
    begin
      ShowMessage('El codigo de barras fijo debe ser de 13 digitos numericos (EAN-13)');
      edtCodigoBarras.SetFocus;
      Exit;
    end;
  end;

  // codigo interno de bascula: el segmento de 5 digitos que va a traer
  // escondido cada etiqueta de peso variable (ver 08_codigo_barras.sql)
  CodBascula := Trim(edtCodigoBascula.Text);
  if CodBascula <> '' then
  begin
    SoloDigitos := Length(CodBascula) = 5;
    if SoloDigitos then
      for i := 1 to 5 do
        if not (CodBascula[i] in ['0'..'9']) then
        begin
          SoloDigitos := False;
          Break;
        end;
    if not SoloDigitos then
    begin
      ShowMessage('El codigo interno de bascula debe ser de 5 digitos numericos');
      edtCodigoBascula.SetFocus;
      Exit;
    end;
    if not chkEsVariable.Checked then
    begin
      ShowMessage('El codigo de bascula solo aplica si "Es variable" esta marcado');
      chkEsVariable.SetFocus;
      Exit;
    end;
  end;

  case rgUso.ItemIndex of
    0: Uso := 'C';
    1: Uso := 'V';
  else
    Uso := 'A';
  end;

  // actualiza si ya existe en vez de borrar+insertar -- id_presentacion
  // (SERIAL) queda referenciado desde ventas.id_presentacion,
  // bundle_detalle.id_presentacion, art_kardex_mov.id_presentacion, etc.
  // y borrar+reinsertar generaria un id nuevo, huerfanando esas
  // referencias (mismo criterio que ya se uso en UMantBundles para
  // bundle_producto)
  qOper.Close;
  qOper.SQL.Text :=
    'SELECT id_presentacion FROM art_presentacion ' +
    'WHERE num_emp = :emp AND cod_art_ancla = :anc AND etiqueta = :etq';
  qOper.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qOper.ParamByName('anc').AsString := FCodAnclaActual;
  qOper.ParamByName('etq').AsString := Trim(edtEtiqueta.Text);
  qOper.Open;
  Existe := not qOper.Eof;
  qOper.Close;

  if Existe then
  begin
    qOper.SQL.Text :=
      'UPDATE art_presentacion SET cod_art_legacy = :leg, factor_a_base = :fac, ' +
      'tara_kg = :tara, es_variable = :var, precio_derivado = :pder, uso = :uso, ' +
      'codigo_barras = :barras, codigo_bascula = :bascula, activo = :act ' +
      'WHERE num_emp = :emp AND cod_art_ancla = :anc AND etiqueta = :etq';
  end
  else
  begin
    qOper.SQL.Text :=
      'INSERT INTO art_presentacion ' +
      '(num_emp, cod_art_ancla, cod_art_legacy, etiqueta, factor_a_base, tara_kg, ' +
      ' es_variable, precio_derivado, uso, codigo_barras, codigo_bascula, activo) ' +
      'VALUES (:emp, :anc, :leg, :etq, :fac, :tara, :var, :pder, :uso, :barras, :bascula, :act)';
  end;
  qOper.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qOper.ParamByName('anc').AsString := FCodAnclaActual;
  qOper.ParamByName('etq').AsString := Trim(edtEtiqueta.Text);
  qOper.ParamByName('leg').AsString := Trim(edtCodLegacy.Text);
  qOper.ParamByName('fac').AsFloat := Factor;
  qOper.ParamByName('tara').AsFloat := Tara;
  if chkEsVariable.Checked then qOper.ParamByName('var').AsString := 'S' else qOper.ParamByName('var').AsString := 'N';
  if chkPrecioDerivado.Checked then qOper.ParamByName('pder').AsString := 'S' else qOper.ParamByName('pder').AsString := 'N';
  qOper.ParamByName('uso').AsString := Uso;
  // NULL (no '') cuando no se captura, para que el indice de busqueda
  // por codigo de barras no confunda "sin codigo" con un codigo vacio
  if CodBarras = '' then qOper.ParamByName('barras').Clear
  else qOper.ParamByName('barras').AsString := CodBarras;
  if CodBascula = '' then qOper.ParamByName('bascula').Clear
  else qOper.ParamByName('bascula').AsString := CodBascula;
  if chkPresentacionActiva.Checked then qOper.ParamByName('act').AsString := 'S' else qOper.ParamByName('act').AsString := 'N';
  qOper.ExecSQL;

  CargaPresentaciones(FCodAnclaActual);
  LimpiaPresentacion;
end;

procedure TFormMantArticulos.btnEliminarPresentacionClick(Sender: TObject);
begin
  if qPresentaciones.IsEmpty then Exit;
  if MessageDlg('¿Eliminar esta presentacion? Si ya se uso en ventas/bundles, ' +
       'mejor desactivala en vez de borrarla.',
       mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

  qOper.Close;
  qOper.SQL.Text := 'DELETE FROM art_presentacion WHERE id_presentacion = :id';
  qOper.ParamByName('id').AsInteger := qPresentaciones.FieldByName('id_presentacion').AsInteger;
  qOper.ExecSQL;

  CargaPresentaciones(FCodAnclaActual);
  LimpiaPresentacion;
end;

end.
