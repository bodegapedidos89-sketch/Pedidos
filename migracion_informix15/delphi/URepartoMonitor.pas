unit URepartoMonitor;

{
  Tablero de estatus de reparto, de solo lectura. Ver
  DOCUMENTACION_reparto.md, seccion "Estatus en tiempo real" -- esta
  pantalla es la opcion 1 (polling con TTimer) de las que se sugieren
  ahi: no hay servidor web ni app movil en este stack, pero refrescar
  un query cada N segundos desde Delphi es inmediato de desplegar y le
  da a cualquiera en la oficina (o proyectado en una pantalla del
  almacen) una vista actualizada de donde va cada pedido, coloreada por
  estatus.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBTables;

type
  TFormRepartoMonitor = class(TForm)
    Database1: TDatabase;
    pnl: TPanel;
    lblEmpresa: TLabel;
    edtEmpresa: TEdit;
    lblFecha: TLabel;
    edtFecha: TEdit;
    btnActualizar: TButton;
    chkAutoRefresh: TCheckBox;
    lblIntervalo: TLabel;
    edtIntervaloSeg: TEdit;
    lblUltimaActualizacion: TLabel;
    lblLeyenda: TLabel;
    dbgMonitor: TDBGrid;
    qMonitor: TQuery;
    dsMonitor: TDataSource;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure chkAutoRefreshClick(Sender: TObject);
    procedure edtIntervaloSegExit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure dbgMonitorDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure Actualiza;
  end;

var
  FormRepartoMonitor: TFormRepartoMonitor;

implementation

{$R *.dfm}

procedure TFormRepartoMonitor.Actualiza;
var
  Fecha: TDateTime;
begin
  try
    Fecha := StrToDate(Trim(edtFecha.Text));
  except
    Exit; // fecha invalida: no refresca, no truena el timer
  end;

  qMonitor.Close;
  qMonitor.SQL.Text :=
    'SELECT p.id_pedido, v.numero_economico, c.nombre AS chofer_nombre, ' +
    'p.orden_visita, p.cliente, p.direccion_entrega, p.estatus, ' +
    'p.fecha_hora_entrega, r.estatus AS estatus_ruta ' +
    'FROM reparto_pedido p, reparto_ruta r, flotilla_vehiculo v, flotilla_chofer c ' +
    'WHERE r.num_emp = :emp AND r.fecha = :fecha AND p.id_ruta = r.id_ruta ' +
    'AND p.activo = ''S'' AND r.id_vehiculo = v.id_vehiculo ' +
    'AND r.id_chofer = c.id_chofer ' +
    'ORDER BY v.numero_economico, p.orden_visita';
  qMonitor.ParamByName('emp').AsString := Trim(edtEmpresa.Text);
  qMonitor.ParamByName('fecha').AsDateTime := Fecha;
  qMonitor.Open;

  lblUltimaActualizacion.Caption := 'Ultima actualizacion: ' + TimeToStr(Now);
end;

procedure TFormRepartoMonitor.FormCreate(Sender: TObject);
begin
  edtEmpresa.Text := '01'; // ajusta al default de tu sistema
  edtFecha.Text := DateToStr(Date);
  edtIntervaloSeg.Text := '30';
  Timer1.Interval := 30000;
  Timer1.Enabled := False;
  Actualiza;
end;

procedure TFormRepartoMonitor.btnActualizarClick(Sender: TObject);
begin
  Actualiza;
end;

procedure TFormRepartoMonitor.chkAutoRefreshClick(Sender: TObject);
begin
  Timer1.Enabled := chkAutoRefresh.Checked;
end;

procedure TFormRepartoMonitor.edtIntervaloSegExit(Sender: TObject);
var
  Segundos: Integer;
begin
  try
    Segundos := StrToInt(Trim(edtIntervaloSeg.Text));
    if Segundos < 5 then
      Segundos := 5; // evita martillear la base por un typo (ej. "1" segundo)
  except
    Segundos := 30;
  end;
  edtIntervaloSeg.Text := IntToStr(Segundos);
  Timer1.Interval := Segundos * 1000;
end;

procedure TFormRepartoMonitor.Timer1Timer(Sender: TObject);
begin
  Actualiza;
end;

procedure TFormRepartoMonitor.dbgMonitorDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (Column.FieldName = 'estatus') and (Column.Field.AsString <> '') then
  begin
    case Column.Field.AsString[1] of
      'P': dbgMonitor.Canvas.Brush.Color := clSilver;   // Pendiente
      'C': dbgMonitor.Canvas.Brush.Color := clYellow;   // Cargado
      'R': dbgMonitor.Canvas.Brush.Color := clAqua;      // En ruta
      'E': dbgMonitor.Canvas.Brush.Color := clLime;      // Entregado
      'N': dbgMonitor.Canvas.Brush.Color := clRed;       // No entregado
    end;
  end;
  dbgMonitor.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
