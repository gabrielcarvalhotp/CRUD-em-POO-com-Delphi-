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
    Movimentaes1: TMenuItem;
    Orcamentos1: TMenuItem;
    Produtos1: TMenuItem;
    procedure Cliente1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  CRUD.View.Clientes, CRUD.View.Produtos;

{$R *.dfm}

procedure TFrmPrincipal.Cliente1Click(Sender: TObject);
var
  frmCadClientes: TfrmCadClientes;
begin
  frmCadClientes := TfrmCadClientes.Create(nil);
  try
    frmCadClientes.ShowModal;
  finally
    frmCadClientes.DisposeOf;
  end;
end;

procedure TFrmPrincipal.Produtos1Click(Sender: TObject);
var
  FrmCadProduto: TFrmCadProduto;
begin
  FrmCadProduto := TFrmCadProduto.Create(nil);
  try
    FrmCadProduto.ShowModal;
  finally
    FrmCadProduto.DisposeOf;
  end;
end;

end.
