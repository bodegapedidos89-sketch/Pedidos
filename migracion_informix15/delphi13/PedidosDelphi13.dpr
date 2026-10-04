program PedidosDelphi13;

{
  Proyecto Delphi 13 / FireDAC -- version migrada, en progreso, del
  sistema que en migracion_informix15/delphi/ sigue en Delphi 7/BDE
  (esa carpeta NO se toca; esta es la nueva, en paralelo). Ver
  LEEME_delphi13.md en esta misma carpeta.
}

uses
  Vcl.Forms,
  UDMConexion in 'UDMConexion.pas' {DMConexion: TDataModule},
  UMenuPrincipal13 in 'UMenuPrincipal13.pas' {FormMenuPrincipal13},
  UMantChoferes in 'UMantChoferes.pas' {FormMantChoferes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMConexion, DMConexion);
  Application.CreateForm(TFormMenuPrincipal13, FormMenuPrincipal13);
  Application.Run;
end.
