unit CRUD.POO.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Cliente1: TMenuItem;
    procedure Cliente1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  CRUD.View.Clientes;

{$R *.dfm}

procedure TFrmPrincipal.Cliente1Click(Sender: TObject);
begin
  frmCadClientes := TfrmCadClientes.Create(nil);
  try
    frmCadClientes.ShowModal;
  finally
    frmCadClientes.DisposeOf;
  end;
end;

end.
