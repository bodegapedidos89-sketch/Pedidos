unit UFormPresentacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DB, DBTables;

type
  TFormPresentacion = class(TForm)
    pnlBotones: TPanel;
    lblTitulo: TLabel;
    btnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
  private
    FIdSeleccionado: Integer;
    FCodLegacySel: string;
    FFactorSel: Double;
    FPrecioDerivadoSel: Boolean;
    FTaraSel: Double;
    FEsVariableSel: Boolean;
    procedure BotonClick(Sender: TObject);
  public
    class function Seleccionar(Database: TDatabase; const CodArtAncla: string;
      Uso: Char; out IdPresentacion: Integer; out CodArtLegacy: string;
      out Factor: Double; out PrecioDerivado: Boolean; out Tara: Double;
      out EsVariable: Boolean): Boolean;
    class function ResuelvePorCodigoBarras(Database: TDatabase;
      const NumEmp, CodigoEscaneado: string; out IdPresentacion: Integer;
      out CodArtAncla, CodArtLegacy: string; out Factor: Double;
      out PrecioDerivado: Boolean; out Tara: Double; out EsVariable: Boolean;
      out PesoKgBascula: Double): Boolean;
  end;

implementation

{$R *.dfm}

class function TFormPresentacion.Seleccionar(Database: TDatabase;
  const CodArtAncla: string; Uso: Char; out IdPresentacion: Integer;
  out CodArtLegacy: string; out Factor: Double; out PrecioDerivado: Boolean;
  out Tara: Double; out EsVariable: Boolean): Boolean;
var
  Frm: TFormPresentacion;
  Qry: TQuery;
  Btn: TButton;
  Y, Cont: Integer;
begin
  IdPresentacion := 0;
  CodArtLegacy := CodArtAncla; // si no hay presentaciones, se usa tal cual hoy
  Factor := 1;
  PrecioDerivado := False;
  Tara := 0;
  EsVariable := False;
  Result := True; // por default no se interrumpe la captura

  Qry := TQuery.Create(nil);
  try
    Qry.DatabaseName := Database.DatabaseName;
    Qry.SQL.Text :=
      'SELECT id_presentacion, etiqueta, cod_art_legacy, factor_a_base, ' +
      'precio_derivado, tara_kg, es_variable FROM art_presentacion ' +
      'WHERE cod_art_ancla = :cod AND activo = ''S'' ' +
      'AND (uso = ''A'' OR uso = :uso) ORDER BY etiqueta';
    Qry.ParamByName('cod').AsString := Trim(CodArtAncla);
    Qry.ParamByName('uso').AsString := Uso;
    Qry.Open;

    Cont := Qry.RecordCount;

    if Cont = 0 then
    begin
      // articulo no migrado al catalogo nuevo: se sigue igual que hoy
      Qry.Close;
      Exit;
    end;

    if Cont = 1 then
    begin
      // sin ambiguedad, se aplica sin interrumpir al cajero
      IdPresentacion := Qry.FieldByName('id_presentacion').AsInteger;
      CodArtLegacy   := Trim(Qry.FieldByName('cod_art_legacy').AsString);
      Factor         := Qry.FieldByName('factor_a_base').AsFloat;
      PrecioDerivado := Trim(Qry.FieldByName('precio_derivado').AsString) = 'S';
      Tara           := Qry.FieldByName('tara_kg').AsFloat;
      EsVariable     := Trim(Qry.FieldByName('es_variable').AsString) = 'S';
      Qry.Close;
      Exit;
    end;

    // 2 o mas presentaciones: aqui si se pregunta
    Frm := TFormPresentacion.Create(Application);
    try
      Y := 16;
      while not Qry.Eof do
      begin
        Btn := TButton.Create(Frm);
        Btn.Parent := Frm.pnlBotones;
        Btn.Caption := Qry.FieldByName('etiqueta').AsString;
        Btn.Tag := Qry.FieldByName('id_presentacion').AsInteger;
        // codigo real, factor, precio_derivado, tara y es_variable viajan
        // empacados en el Hint (separados por '|')
        Btn.Hint := Trim(Qry.FieldByName('cod_art_legacy').AsString) + '|' +
                    Qry.FieldByName('factor_a_base').AsString + '|' +
                    Trim(Qry.FieldByName('precio_derivado').AsString) + '|' +
                    Qry.FieldByName('tara_kg').AsString + '|' +
                    Trim(Qry.FieldByName('es_variable').AsString);
        Btn.Left := 16;
        Btn.Top := Y;
        Btn.Width := Frm.pnlBotones.Width - 32;
        Btn.Height := 32;
        Btn.OnClick := Frm.BotonClick;
        Inc(Y, 40);
        Qry.Next;
      end;
      Qry.Close;

      Frm.pnlBotones.Height := Y + 8;
      Frm.btnCancelar.Top := Frm.pnlBotones.Top + Y + 8;
      Frm.ClientHeight := Frm.btnCancelar.Top + Frm.btnCancelar.Height + 16;
      Frm.Position := poScreenCenter;

      Result := Frm.ShowModal = mrOk;
      if Result then
      begin
        IdPresentacion := Frm.FIdSeleccionado;
        CodArtLegacy   := Frm.FCodLegacySel;
        Factor         := Frm.FFactorSel;
        PrecioDerivado := Frm.FPrecioDerivadoSel;
        Tara           := Frm.FTaraSel;
        EsVariable     := Frm.FEsVariableSel;
      end;
    finally
      Frm.Free;
    end;
  finally
    Qry.Free;
  end;
end;

{----------------------------------------------------------------------
  Resuelve un codigo ESCANEADO (13 digitos) a una presentacion, sin
  preguntarle nada al cajero -- un codigo de barras ya identifica una
  sola presentacion, a diferencia de teclear el codigo ancla (que
  puede tener varias y ahi si hace falta el selector de Seleccionar).

  Dos formatos conviven en las mismas columnas de art_presentacion:
    * Prefijo 20-29: codigo de BASCULA (es_variable='S'). El peso
      viene codificado en los digitos 8-12 (gramos) -- se decodifica
      aqui mismo y se regresa en PesoKgBascula; el llamador lo usa
      para prellenar la cantidad sin que el cajero la teclee.
    * Cualquier otro prefijo: codigo FIJO impreso en el empaque
      (es_variable='N'), busqueda por igualdad exacta completa.

  Si CodigoEscaneado no tiene 13 digitos numericos, o no hace match
  con ninguna presentacion, regresa False y el llamador debe tratarlo
  como lo que sea que haya tecleado (codigo ancla, bundle, etc.) --
  esta funcion nunca asume que algo es un codigo de barras invalido,
  solo dice si SI lo reconocio como uno valido.
----------------------------------------------------------------------}
class function TFormPresentacion.ResuelvePorCodigoBarras(Database: TDatabase;
  const NumEmp, CodigoEscaneado: string; out IdPresentacion: Integer;
  out CodArtAncla, CodArtLegacy: string; out Factor: Double;
  out PrecioDerivado: Boolean; out Tara: Double; out EsVariable: Boolean;
  out PesoKgBascula: Double): Boolean;
var
  Qry: TQuery;
  Codigo, Prefijo, CodInterno, PesoTexto: string;
  i: Integer;
  EsNumerico: Boolean;
begin
  IdPresentacion := 0;
  CodArtAncla := '';
  CodArtLegacy := '';
  Factor := 1;
  PrecioDerivado := False;
  Tara := 0;
  EsVariable := False;
  PesoKgBascula := 0;
  Result := False;

  Codigo := Trim(CodigoEscaneado);
  if Length(Codigo) <> 13 then Exit;

  EsNumerico := True;
  for i := 1 to 13 do
    if not (Codigo[i] in ['0'..'9']) then
    begin
      EsNumerico := False;
      Break;
    end;
  if not EsNumerico then Exit;

  Prefijo := Copy(Codigo, 1, 2);

  Qry := TQuery.Create(nil);
  try
    Qry.DatabaseName := Database.DatabaseName;

    if (Prefijo >= '20') and (Prefijo <= '29') then
    begin
      // codigo de bascula: digitos 3-7 = codigo interno, 8-12 = peso
      // en gramos, 13 = digito verificador (no se valida aqui)
      CodInterno := Copy(Codigo, 3, 5);
      PesoTexto  := Copy(Codigo, 8, 5);

      Qry.SQL.Text :=
        'SELECT id_presentacion, cod_art_ancla, cod_art_legacy, factor_a_base, ' +
        'precio_derivado, tara_kg, es_variable FROM art_presentacion ' +
        'WHERE num_emp = :emp AND codigo_bascula = :cod AND es_variable = ''S'' ' +
        'AND activo = ''S''';
      Qry.ParamByName('emp').AsString := NumEmp;
      Qry.ParamByName('cod').AsString := CodInterno;
      Qry.Open;

      if not Qry.Eof then
      begin
        IdPresentacion := Qry.FieldByName('id_presentacion').AsInteger;
        CodArtAncla    := Trim(Qry.FieldByName('cod_art_ancla').AsString);
        CodArtLegacy   := Trim(Qry.FieldByName('cod_art_legacy').AsString);
        Factor         := Qry.FieldByName('factor_a_base').AsFloat;
        PrecioDerivado := Trim(Qry.FieldByName('precio_derivado').AsString) = 'S';
        Tara           := Qry.FieldByName('tara_kg').AsFloat;
        EsVariable     := True;
        PesoKgBascula  := StrToInt(PesoTexto) / 1000;
        Result := True;
      end;
      Qry.Close;
      if Result then Exit;
      // no hizo match como codigo de bascula -- sigue abajo por si de
      // todos modos hay un codigo_barras FIJO capturado con ese mismo
      // prefijo (muy improbable, pero no se descarta)
    end;

    // codigo de barras fijo, impreso en el empaque
    Qry.SQL.Text :=
      'SELECT id_presentacion, cod_art_ancla, cod_art_legacy, factor_a_base, ' +
      'precio_derivado, tara_kg, es_variable FROM art_presentacion ' +
      'WHERE num_emp = :emp AND codigo_barras = :cod AND activo = ''S''';
    Qry.ParamByName('emp').AsString := NumEmp;
    Qry.ParamByName('cod').AsString := Codigo;
    Qry.Open;

    if not Qry.Eof then
    begin
      IdPresentacion := Qry.FieldByName('id_presentacion').AsInteger;
      CodArtAncla    := Trim(Qry.FieldByName('cod_art_ancla').AsString);
      CodArtLegacy   := Trim(Qry.FieldByName('cod_art_legacy').AsString);
      Factor         := Qry.FieldByName('factor_a_base').AsFloat;
      PrecioDerivado := Trim(Qry.FieldByName('precio_derivado').AsString) = 'S';
      Tara           := Qry.FieldByName('tara_kg').AsFloat;
      EsVariable     := Trim(Qry.FieldByName('es_variable').AsString) = 'S';
      Result := True;
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TFormPresentacion.BotonClick(Sender: TObject);
var
  Datos: string;
  P1, P2, P3, P4: Integer;
begin
  FIdSeleccionado := (Sender as TButton).Tag;

  Datos := (Sender as TButton).Hint;
  P1 := Pos('|', Datos);
  FCodLegacySel := Copy(Datos, 1, P1 - 1);
  Datos := Copy(Datos, P1 + 1, Length(Datos));

  P2 := Pos('|', Datos);
  FFactorSel := StrToFloat(Copy(Datos, 1, P2 - 1));
  Datos := Copy(Datos, P2 + 1, Length(Datos));

  P3 := Pos('|', Datos);
  FPrecioDerivadoSel := Copy(Datos, 1, P3 - 1) = 'S';
  Datos := Copy(Datos, P3 + 1, Length(Datos));

  P4 := Pos('|', Datos);
  FTaraSel := StrToFloat(Copy(Datos, 1, P4 - 1));
  FEsVariableSel := Copy(Datos, P4 + 1, Length(Datos)) = 'S';

  ModalResult := mrOk;
end;

procedure TFormPresentacion.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormPresentacion.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    ModalResult := mrCancel;
end;

procedure TFormPresentacion.FormCreate(Sender: TObject);
begin
  BorderStyle := bsDialog;
  Caption := 'Seleccione presentación';
  KeyPreview := True;
end;

end.
