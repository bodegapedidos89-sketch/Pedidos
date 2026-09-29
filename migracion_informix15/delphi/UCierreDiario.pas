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
    procedure FormCreate(Sender: TObject);
    procedure btnDetectaNegativosClick(Sender: TObject);
    procedure btnRecalculaClick(Sender: TObject);
    procedure btnVerTendenciasClick(Sender: TObject);
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

end.
