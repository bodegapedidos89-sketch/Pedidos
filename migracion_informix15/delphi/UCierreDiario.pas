unit UCierreDiario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids, DB, DBTables;

type
  TFormCierreDiario = class(TForm)
    Database1: TDatabase;
    pnlTop: TPanel;
    lblEmpresa: TLabel;
    edtEmpresa: TEdit;
    lblFecha: TLabel;
    dtFecha: TDateTimePicker;
    btnDetectaNegativos: TButton;
    gbRecalculo: TGroupBox;
    lblFechaIni: TLabel;
    dtFechaIniRecalculo: TDateTimePicker;
    lblRecalculoNota: TLabel;
    btnRecalcula: TButton;
    lblNegativosHoy: TLabel;
    dbgNegativosHoy: TDBGrid;
    qNegativosHoy: TQuery;
    dsNegativosHoy: TDataSource;
    lblLogCierre: TLabel;
    dbgLogCierre: TDBGrid;
    qLogCierre: TQuery;
    dsLogCierre: TDataSource;
    btnVerTendencias: TButton;
    qOper: TQuery;
    spDetectaNegativos: TStoredProc;
    spRecalculaKardex: TStoredProc;
    gbFisico: TGroupBox;
    lblFisicoNota: TLabel;
    btnAplicaDiferencias: TButton;
    qDifFisico: TQuery;
    qArtCierre: TQuery;
    qFolio: TQuery;
    spInsertaEntDiv: TStoredProc;
    spInsertaTrEntDiv: TStoredProc;
    spInsertaSalDiv: TStoredProc;
    spInsertaTrSalDiv: TStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure btnDetectaNegativosClick(Sender: TObject);
    procedure btnRecalculaClick(Sender: TObject);
    procedure btnVerTendenciasClick(Sender: TObject);
    procedure btnAplicaDiferenciasClick(Sender: TObject);
  private
    procedure CargaNegativosHoy;
    procedure CargaLogCierre;
  end;

var
  FormCierreDiario: TFormCierreDiario;

implementation

{$R *.dfm}

uses UReporteNegativos;

procedure TFormCierreDiario.CargaNegativosHoy;
begin
  qNegativosHoy.Close;
  qNegativosHoy.SQL.Text :=
    'SELECT cod_art, exi_cor_kgs, exi_cor_caj, can_emp FROM hist_existencia_negativa ' +
    'WHERE num_emp = :emp AND fecha_cierre = :fecha ORDER BY cod_art';
  qNegativosHoy.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qNegativosHoy.ParamByName('fecha').AsDateTime := dtFecha.Date;
  qNegativosHoy.Open;
end;

procedure TFormCierreDiario.CargaLogCierre;
begin
  qLogCierre.Close;
  qLogCierre.SQL.Text :=
    'SELECT codigo, tip_doc, fech_doc, motivo FROM hist_log_cierre ' +
    'WHERE num_emp = :emp ORDER BY fech_doc, codigo';
  qLogCierre.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qLogCierre.Open;
end;

procedure TFormCierreDiario.FormCreate(Sender: TObject);
begin
  edtEmpresa.Text := '01'; // ajusta al default de tu sistema
  dtFecha.Date := Date;
  dtFechaIniRecalculo.Date := Date - 30;
end;

procedure TFormCierreDiario.btnDetectaNegativosClick(Sender: TObject);
begin
  // barato: solo lee inarinv tal cual esta hoy y deja historial permanente
  spDetectaNegativos.Close;
  spDetectaNegativos.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  spDetectaNegativos.ParamByName('fecha').AsDateTime := dtFecha.Date;
  spDetectaNegativos.ExecProc;

  CargaNegativosHoy;
  ShowMessage('Cierre del dia guardado. Articulos con existencia negativa: ' +
    IntToStr(qNegativosHoy.RecordCount));
end;

procedure TFormCierreDiario.btnRecalculaClick(Sender: TObject);
begin
  if MessageDlg(
       'Esto va a recorrer TODO el kardex de la empresa ' + Trim(edtEmpresa.Text) +
       ' entre ' + DateToStr(dtFechaIniRecalculo.Date) + ' y ' + DateToStr(dtFecha.Date) +
       ' y va a SOBRESCRIBIR costo promedio, can_emp y existencias en inarinv/inartrinv.' +
       #13#10 + 'Usalo solo si sospechas que algo se desfaso, no como rutina diaria.' +
       #13#10#13#10 + 'Necesita que exista una foto en la tabla "inventario" con fecha = ' +
       DateToStr(dtFechaIniRecalculo.Date) + ' para ese articulo; si no existe, arranca de cero (en 0).' +
       #13#10#13#10 + 'Continuar?',
       mtWarning, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  spRecalculaKardex.Close;
  spRecalculaKardex.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  spRecalculaKardex.ParamByName('fech_ini').AsDateTime := dtFechaIniRecalculo.Date;
  spRecalculaKardex.ParamByName('fech_fin').AsDateTime := dtFecha.Date;
  spRecalculaKardex.ExecProc;

  CargaLogCierre;
  ShowMessage('Recalculo terminado. Revisa la bitacora de abajo por si quedaron ' +
    'articulos con can_emp o existencia en 0 durante el recorrido.');
end;

procedure TFormCierreDiario.btnVerTendenciasClick(Sender: TObject);
begin
  FormReporteNegativos := TFormReporteNegativos.Create(Application);
  try
    FormReporteNegativos.edtEmpresa.Text := Trim(edtEmpresa.Text);
    FormReporteNegativos.ShowModal;
  finally
    FormReporteNegativos.Free;
  end;
end;

procedure TFormCierreDiario.btnAplicaDiferenciasClick(Sender: TObject);
var
  folioEnt, folioSal, renEnt, renSal: Integer;
  difKgs, difCaj, exiKgs, exiCaj, cosKgs, cosCaj: Double;
  tipArt, codArt, concepto: string;
  esEntrada: Boolean;
begin
  // compara lo contado en inv_diario (terminal portatil) contra la
  // existencia VIGENTE en inarinv, y registra la diferencia como una
  // entrada o salida diversa usando exactamente el mismo mecanismo que ya
  // usa el sistema (inserta_entdiv/inserta_tr_entdiv y sus pares de
  // salida) -- no se inventa un movimiento nuevo. No toca can_emp: eso
  // solo se actualiza al recibir mercancia (UOCRecepcion).
  if MessageDlg(
       'Esto compara lo contado en inv_diario contra la existencia actual en inarinv ' +
       'para el ' + DateToStr(dtFecha.Date) + ' y REGISTRA una entrada/salida diversa ' +
       '(ED/SD) en el Kardex por cada diferencia.' + #13#10#13#10 +
       'No toca can_emp. Si vuelves a correrlo, solo aplica lo que siga sin cuadrar ' +
       '(compara contra la existencia ya actualizada). Continuar?',
       mtWarning, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  qDifFisico.Close;
  qDifFisico.SQL.Text :=
    'SELECT cod_art, SUM(can_kgs) fis_kgs, SUM(can_caj) fis_caj FROM inv_diario ' +
    'WHERE num_emp = :emp AND fecha = :fecha GROUP BY cod_art';
  qDifFisico.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qDifFisico.ParamByName('fecha').AsDateTime := dtFecha.Date;
  qDifFisico.Open;

  if qDifFisico.IsEmpty then
  begin
    ShowMessage('No hay conteo fisico (inv_diario) capturado para esa fecha');
    qDifFisico.Close;
    Exit;
  end;

  // folio propio de este ajuste (independiente del que usa formato.pas
  // para el "terreno", que corre en otras empresas)
  qFolio.Close;
  qFolio.SQL.Text := 'SELECT MAX(num_doc) maxdoc FROM inartrinv WHERE num_emp = :emp AND tip_doc = ''ED''';
  qFolio.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qFolio.Open;
  folioEnt := qFolio.FieldByName('maxdoc').AsInteger + 1;
  qFolio.Close;

  qFolio.SQL.Text := 'SELECT MAX(num_doc) maxdoc FROM inartrinv WHERE num_emp = :emp AND tip_doc = ''SD''';
  qFolio.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qFolio.Open;
  folioSal := qFolio.FieldByName('maxdoc').AsInteger + 1;
  qFolio.Close;

  renEnt := 0;
  renSal := 0;
  concepto := 'AJUSTE INV FISICO CIERRE ' + DateToStr(dtFecha.Date);

  while not qDifFisico.Eof do
  begin
    codArt := Trim(qDifFisico.FieldByName('cod_art').AsString);

    qArtCierre.Close;
    qArtCierre.SQL.Text :=
      'SELECT exi_cor_kgs, exi_cor_caj, tip_art, cos_pro_kgs, cos_pro_caj FROM inarinv ' +
      'WHERE num_emp = :emp AND cod_art = :art';
    qArtCierre.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
    qArtCierre.ParamByName('art').AsString := codArt;
    qArtCierre.Open;

    if not qArtCierre.Eof then
    begin
      exiKgs := qArtCierre.FieldByName('exi_cor_kgs').AsFloat;
      exiCaj := qArtCierre.FieldByName('exi_cor_caj').AsFloat;
      tipArt := Trim(qArtCierre.FieldByName('tip_art').AsString);
      cosKgs := qArtCierre.FieldByName('cos_pro_kgs').AsFloat;
      cosCaj := qArtCierre.FieldByName('cos_pro_caj').AsFloat;
      qArtCierre.Close;

      difKgs := qDifFisico.FieldByName('fis_kgs').AsFloat - exiKgs;
      difCaj := qDifFisico.FieldByName('fis_caj').AsFloat - exiCaj;

      if (difKgs <> 0) or (difCaj <> 0) then
      begin
        if tipArt = 'K' then
          esEntrada := difKgs >= 0
        else
          esEntrada := difCaj >= 0;

        if esEntrada then
        begin
          Inc(renEnt);
          spInsertaTrEntDiv.Close;
          spInsertaTrEntDiv.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
          spInsertaTrEntDiv.ParamByName('suc').AsString := Trim(edtEmpresa.Text);
          spInsertaTrEntDiv.ParamByName('art').AsString := codArt;
          spInsertaTrEntDiv.ParamByName('doc').AsInteger := folioEnt;
          spInsertaTrEntDiv.ParamByName('fech').AsDateTime := dtFecha.Date;
          spInsertaTrEntDiv.ParamByName('kgs').AsFloat := difKgs;
          spInsertaTrEntDiv.ParamByName('caj').AsFloat := difCaj;
          spInsertaTrEntDiv.ParamByName('cosprokgs').AsFloat := cosKgs;
          spInsertaTrEntDiv.ParamByName('cosprocaj').AsFloat := cosCaj;
          spInsertaTrEntDiv.ParamByName('ren').AsInteger := renEnt;
          spInsertaTrEntDiv.ExecProc;
        end
        else
        begin
          Inc(renSal);
          spInsertaTrSalDiv.Close;
          spInsertaTrSalDiv.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
          spInsertaTrSalDiv.ParamByName('suc').AsString := Trim(edtEmpresa.Text);
          spInsertaTrSalDiv.ParamByName('art').AsString := codArt;
          spInsertaTrSalDiv.ParamByName('doc').AsInteger := folioSal;
          spInsertaTrSalDiv.ParamByName('fech').AsDateTime := dtFecha.Date;
          spInsertaTrSalDiv.ParamByName('kgs').AsFloat := -difKgs;
          spInsertaTrSalDiv.ParamByName('caj').AsFloat := -difCaj;
          spInsertaTrSalDiv.ParamByName('cosprokgs').AsFloat := cosKgs;
          spInsertaTrSalDiv.ParamByName('cosprocaj').AsFloat := cosCaj;
          spInsertaTrSalDiv.ParamByName('ren').AsInteger := renSal;
          spInsertaTrSalDiv.ExecProc;
        end;
      end;
    end
    else
      qArtCierre.Close;

    qDifFisico.Next;
  end;
  qDifFisico.Close;

  if renEnt > 0 then
  begin
    spInsertaEntDiv.Close;
    spInsertaEntDiv.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
    spInsertaEntDiv.ParamByName('suc').AsString := Trim(edtEmpresa.Text);
    spInsertaEntDiv.ParamByName('doc').AsInteger := folioEnt;
    spInsertaEntDiv.ParamByName('fech').AsDateTime := dtFecha.Date;
    spInsertaEntDiv.ParamByName('imp').AsFloat := 0;
    spInsertaEntDiv.ParamByName('concept').AsString := concepto;
    spInsertaEntDiv.ExecProc;
  end;

  if renSal > 0 then
  begin
    spInsertaSalDiv.Close;
    spInsertaSalDiv.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
    spInsertaSalDiv.ParamByName('suc').AsString := Trim(edtEmpresa.Text);
    spInsertaSalDiv.ParamByName('doc').AsInteger := folioSal;
    spInsertaSalDiv.ParamByName('fech').AsDateTime := dtFecha.Date;
    spInsertaSalDiv.ParamByName('imp').AsFloat := 0;
    spInsertaSalDiv.ParamByName('concept').AsString := concepto;
    spInsertaSalDiv.ExecProc;
  end;

  ShowMessage('Diferencias aplicadas: ' + IntToStr(renEnt) + ' entradas diversas, ' +
    IntToStr(renSal) + ' salidas diversas.');
end;

end.
