unit UMenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,
  UMantArticulos, UMantBundles, formato, UOCRecepcion, UCierreDiario,
  UReporteNegativos;

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
    btnSalir: TButton;
    procedure btnArticulosClick(Sender: TObject);
    procedure btnBundlesClick(Sender: TObject);
    procedure btnComprasClick(Sender: TObject);
    procedure btnRecepcionClick(Sender: TObject);
    procedure btnCierreClick(Sender: TObject);
    procedure btnTendenciasClick(Sender: TObject);
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

procedure TFormMenuPrincipal.btnSalirClick(Sender: TObject);
begin
  Close;
end;

end.
