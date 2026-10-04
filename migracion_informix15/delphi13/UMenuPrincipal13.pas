unit UMenuPrincipal13;

{
  Menu minimo del proyecto Delphi 13. Mismo patron que
  migracion_informix15/delphi/UMenuPrincipal.pas (Create(Application) /
  ShowModal / Free por boton) -- por ahora solo tiene el formulario que
  ya se migro a FireDAC (Choferes). Conforme se vayan migrando los
  demas (Flotilla, Bitacora, Reparto, Monitor, Bundles, Articulos,
  OCRecepcion, CierreDiario, ReporteNegativos...), se agregan aqui
  mismo -- este es el proyecto definitivo, no uno de prueba descartable.

  JUNTA.pas y formato.pas NO estan aqui todavia -- bloqueados por Rave
  Reports y por las unidades PERSONAL/MENSAJE2-4 que faltan (ver
  ANALISIS_MIGRACION_DELPHI13.md en migracion_informix15/delphi/,
  secciones 2 y 4).
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,
  UMantChoferes;

type
  TFormMenuPrincipal13 = class(TForm)
    pnlBotones: TPanel;
    lblTitulo: TLabel;
    btnChoferes: TButton;
    btnSalir: TButton;
    procedure btnChoferesClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  FormMenuPrincipal13: TFormMenuPrincipal13;

implementation

{$R *.dfm}

procedure TFormMenuPrincipal13.FormCreate(Sender: TObject);
begin
  Position := poScreenCenter;
end;

procedure TFormMenuPrincipal13.btnChoferesClick(Sender: TObject);
begin
  FormMantChoferes := TFormMantChoferes.Create(Application);
  try
    FormMantChoferes.ShowModal;
  finally
    FormMantChoferes.Free;
  end;
end;

procedure TFormMenuPrincipal13.btnSalirClick(Sender: TObject);
begin
  Close;
end;

end.
