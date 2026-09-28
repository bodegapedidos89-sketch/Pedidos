unit UMenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,
  UMantArticulos, UMantBundles;

type
  TFormMenuPrincipal = class(TForm)
    pnlBotones: TPanel;
    lblTitulo: TLabel;
    btnArticulos: TButton;
    btnBundles: TButton;
    btnSalir: TButton;
    procedure btnArticulosClick(Sender: TObject);
    procedure btnBundlesClick(Sender: TObject);
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

procedure TFormMenuPrincipal.btnSalirClick(Sender: TObject);
begin
  Close;
end;

end.
