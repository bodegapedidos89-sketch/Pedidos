unit UMenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,
  UMantArticulos, UMantBundles, formato, UOCRecepcion, UCierreDiario,
  UReporteNegativos, UMantFlotilla, UMantChoferes, UMantBitacoraFlotilla,
  UReparto, URepartoMonitor;

type
  TFormMenuPrincipal = class(TForm)
    pnlBotones: TPanel;
    lblTitulo: TLabel;
    btnArticulos: TButton;
    btnBundles: TButton;
    btnCompras: TButton;
    btnRecepcion: TButton;
    btnCierre: TButton;
    btnTendencias: TButton;
    btnFlotilla: TButton;
    btnChoferes: TButton;
    btnBitacoraFlotilla: TButton;
    btnReparto: TButton;
    btnRepartoMonitor: TButton;
    btnSalir: TButton;
    procedure btnArticulosClick(Sender: TObject);
    procedure btnBundlesClick(Sender: TObject);
    procedure btnComprasClick(Sender: TObject);
    procedure btnRecepcionClick(Sender: TObject);
    procedure btnCierreClick(Sender: TObject);
    procedure btnTendenciasClick(Sender: TObject);
    procedure btnFlotillaClick(Sender: TObject);
    procedure btnChoferesClick(Sender: TObject);
    procedure btnBitacoraFlotillaClick(Sender: TObject);
    procedure btnRepartoClick(Sender: TObject);
    procedure btnRepartoMonitorClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  FormMenuPrincipal: TFormMenuPrincipal;

implementation

{$R *.dfm}

procedure TFormMenuPrincipal.FormCreate(Sender: TObject);
begin
  Position := poScreenCenter;
end;

procedure TFormMenuPrincipal.btnArticulosClick(Sender: TObject);
begin
  FormMantArticulos := TFormMantArticulos.Create(Application);
  try
    FormMantArticulos.ShowModal;
  finally
    FormMantArticulos.Free;
  end;
end;

procedure TFormMenuPrincipal.btnBundlesClick(Sender: TObject);
begin
  FormMantBundles := TFormMantBundles.Create(Application);
  try
    FormMantBundles.ShowModal;
  finally
    FormMantBundles.Free;
  end;
end;

procedure TFormMenuPrincipal.btnComprasClick(Sender: TObject);
begin
  Form1 := TForm1.Create(Application);
  try
    Form1.ShowModal;
  finally
    Form1.Free;
  end;
end;

procedure TFormMenuPrincipal.btnRecepcionClick(Sender: TObject);
begin
  FormOCRecepcion := TFormOCRecepcion.Create(Application);
  try
    FormOCRecepcion.ShowModal;
  finally
    FormOCRecepcion.Free;
  end;
end;

procedure TFormMenuPrincipal.btnCierreClick(Sender: TObject);
begin
  FormCierreDiario := TFormCierreDiario.Create(Application);
  try
    FormCierreDiario.ShowModal;
  finally
    FormCierreDiario.Free;
  end;
end;

procedure TFormMenuPrincipal.btnTendenciasClick(Sender: TObject);
begin
  FormReporteNegativos := TFormReporteNegativos.Create(Application);
  try
    FormReporteNegativos.ShowModal;
  finally
    FormReporteNegativos.Free;
  end;
end;

procedure TFormMenuPrincipal.btnFlotillaClick(Sender: TObject);
begin
  FormMantFlotilla := TFormMantFlotilla.Create(Application);
  try
    FormMantFlotilla.ShowModal;
  finally
    FormMantFlotilla.Free;
  end;
end;

procedure TFormMenuPrincipal.btnChoferesClick(Sender: TObject);
begin
  FormMantChoferes := TFormMantChoferes.Create(Application);
  try
    FormMantChoferes.ShowModal;
  finally
    FormMantChoferes.Free;
  end;
end;

procedure TFormMenuPrincipal.btnBitacoraFlotillaClick(Sender: TObject);
begin
  FormMantBitacoraFlotilla := TFormMantBitacoraFlotilla.Create(Application);
  try
    FormMantBitacoraFlotilla.ShowModal;
  finally
    FormMantBitacoraFlotilla.Free;
  end;
end;

procedure TFormMenuPrincipal.btnRepartoClick(Sender: TObject);
begin
  FormReparto := TFormReparto.Create(Application);
  try
    FormReparto.ShowModal;
  finally
    FormReparto.Free;
  end;
end;

procedure TFormMenuPrincipal.btnRepartoMonitorClick(Sender: TObject);
begin
  FormRepartoMonitor := TFormRepartoMonitor.Create(Application);
  try
    FormRepartoMonitor.ShowModal;
  finally
    FormRepartoMonitor.Free;
  end;
end;

procedure TFormMenuPrincipal.btnSalirClick(Sender: TObject);
begin
  Close;
end;

end.
