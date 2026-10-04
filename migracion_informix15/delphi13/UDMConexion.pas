unit UDMConexion;

{
  Conexion FireDAC compartida a Informix. A diferencia del patron BDE
  (cada formulario con su propio TDatabase apuntando al mismo alias
  'comyleg'), aqui hay UNA sola TFDConnection en este data module, y
  cada formulario migrado la referencia (DMConexion.FDConnection1) en
  vez de crear la suya. Es el patron idiomatico de FireDAC y evita
  tener que repetir los parametros de conexion 14 veces.

  Rellena los 4 placeholders de abajo (o edita Params.* directo en el
  Object Inspector una vez abierto en Delphi) antes de compilar:
    <TU_INFORMIXSERVER>   -- el INFORMIXSERVER / dbservername real
    <TU_BASE_INFORMIX>    -- el nombre real de la base (lo que hoy
                             esconde el alias BDE 'comyleg')
    <TU_USUARIO> / <TU_PASSWORD>

  Requisito en la maquina donde compiles/corras: IBM Informix Client
  SDK 3.5+ con el IBM INFORMIX ODBC DRIVER instalado -- FireDAC lo usa
  por debajo aunque el driver se llame "nativo" (ver
  ANALISIS_MIGRACION_DELPHI13.md, secciones 1 y 7, en la carpeta
  delphi/ de este mismo paquete).
}

interface

uses
  System.SysUtils, System.Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UniProvider, FireDAC.Phys.Infx, FireDAC.Phys.InfxDef,
  FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.VCLUI.Wait;

type
  TDMConexion = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysInfxDriverLink1: TFDPhysInfxDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
  end;

var
  DMConexion: TDMConexion;

implementation

{$R *.dfm}

procedure TDMConexion.DataModuleCreate(Sender: TObject);
begin
  // mismo valor que usaban los 14 TDatabase.AliasName = 'comyleg' en
  // la version Delphi 7 -- aqui es solo un identificador interno de
  // FireDAC, no un alias BDE
  FDConnection1.Params.DriverID := 'Infx';
  FDConnection1.Params.Database := '<TU_BASE_INFORMIX>';
  FDConnection1.Params.Server := '<TU_INFORMIXSERVER>';
  FDConnection1.Params.UserName := '<TU_USUARIO>';
  FDConnection1.Params.Password := '<TU_PASSWORD>';
  FDConnection1.LoginPrompt := False;
  FDConnection1.Connected := True;
end;

end.
