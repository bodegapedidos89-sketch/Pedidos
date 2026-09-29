unit UReporteNegativos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids, DB, DBTables,
  Chart, TeEngine, Series, TeeProcs;

type
  TFormReporteNegativos = class(TForm)
    Database1: TDatabase;
    pnlTop: TPanel;
    lblEmpresa: TLabel;
    edtEmpresa: TEdit;
    lblDesde: TLabel;
    dtDesde: TDateTimePicker;
    lblHasta: TLabel;
    dtHasta: TDateTimePicker;
    btnBuscar: TButton;
    lblRanking: TLabel;
    dbgRanking: TDBGrid;
    qRanking: TQuery;
    dsRanking: TDataSource;
    lblGrafica: TLabel;
    Chart1: TChart;
    qTendencia: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure dbgRankingDblClick(Sender: TObject);
  private
    SerieKgs: TLineSeries;
    SerieCaj: TLineSeries;
    procedure CargaTendencia(const CodArt: string);
  end;

var
  FormReporteNegativos: TFormReporteNegativos;

implementation

{$R *.dfm}

procedure TFormReporteNegativos.FormCreate(Sender: TObject);
begin
  edtEmpresa.Text := '01'; // ajusta al default de tu sistema
  dtHasta.Date := Date;
  dtDesde.Date := Date - 30;

  Chart1.Title.Text.Text := 'Tendencia de existencia (doble clic en un codigo)';
  Chart1.LeftAxis.Title.Caption := 'Existencia';
  Chart1.BottomAxis.Title.Caption := 'Fecha de cierre';
  Chart1.View3D := False;
  Chart1.Legend.Visible := True;

  SerieKgs := TLineSeries.Create(Self);
  SerieKgs.ParentChart := Chart1;
  SerieKgs.Title := 'Kilos';
  SerieKgs.XValues.DateTime := True;

  SerieCaj := TLineSeries.Create(Self);
  SerieCaj.ParentChart := Chart1;
  SerieCaj.Title := 'Cajas';
  SerieCaj.XValues.DateTime := True;
end;

procedure TFormReporteNegativos.btnBuscarClick(Sender: TObject);
begin
  qRanking.Close;
  qRanking.SQL.Text :=
    'SELECT cod_art, COUNT(*) veces, MIN(exi_cor_kgs) peor_kgs, ' +
    'MIN(exi_cor_caj) peor_caj FROM hist_existencia_negativa ' +
    'WHERE num_emp = :emp AND fecha_cierre BETWEEN :desde AND :hasta ' +
    'GROUP BY cod_art ORDER BY veces DESC';
  qRanking.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qRanking.ParamByName('desde').AsDateTime := dtDesde.Date;
  qRanking.ParamByName('hasta').AsDateTime := dtHasta.Date;
  qRanking.Open;

  if qRanking.IsEmpty then
    ShowMessage('No hay articulos con existencia negativa en ese rango de fechas');
end;

procedure TFormReporteNegativos.CargaTendencia(const CodArt: string);
begin
  qTendencia.Close;
  qTendencia.SQL.Text :=
    'SELECT fecha_cierre, exi_cor_kgs, exi_cor_caj FROM hist_existencia_negativa ' +
    'WHERE num_emp = :emp AND cod_art = :art AND fecha_cierre BETWEEN :desde AND :hasta ' +
    'ORDER BY fecha_cierre';
  qTendencia.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qTendencia.ParamByName('art').AsString := CodArt;
  qTendencia.ParamByName('desde').AsDateTime := dtDesde.Date;
  qTendencia.ParamByName('hasta').AsDateTime := dtHasta.Date;
  qTendencia.Open;

  SerieKgs.Clear;
  SerieCaj.Clear;
  while not qTendencia.Eof do
  begin
    SerieKgs.AddXY(qTendencia.FieldByName('fecha_cierre').AsDateTime,
      qTendencia.FieldByName('exi_cor_kgs').AsFloat, '', clRed);
    SerieCaj.AddXY(qTendencia.FieldByName('fecha_cierre').AsDateTime,
      qTendencia.FieldByName('exi_cor_caj').AsFloat, '', clBlue);
    qTendencia.Next;
  end;
  qTendencia.Close;

  Chart1.Title.Text.Text := 'Tendencia de existencia - ' + Trim(CodArt);
end;

procedure TFormReporteNegativos.dbgRankingDblClick(Sender: TObject);
begin
  if qRanking.IsEmpty then Exit;
  CargaTendencia(Trim(qRanking.FieldByName('cod_art').AsString));
end;

end.
