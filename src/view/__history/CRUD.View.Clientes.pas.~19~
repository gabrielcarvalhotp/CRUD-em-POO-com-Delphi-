unit CRUD.View.Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CRUD.View.CadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.WinXPanels, CRUD.model.Conexao;

type
  TfrmCadClientes = class(TFrmCadPadrao)
    edNome: TEdit;
    Label1: TLabel;
    edEndereco: TEdit;
    Label2: TLabel;
    edTelefone: TEdit;
    Label3: TLabel;
    edEmail: TEdit;
    Label4: TLabel;
    edDataCadastro: TEdit;
    Label5: TLabel;
    procedure BitBtnSalvarCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadClientes: TfrmCadClientes;

implementation

uses
  CRUD.Entidadas.Clientes, CRUD.DAO.Clientes;

{$R *.dfm}

procedure TfrmCadClientes.BitBtnSalvarCadastroClick(Sender: TObject);
var
  lCliente: Tclientes;
  lDAOCliente: TDAOCliente;
begin
  inherited;
  
  lCliente := Tclientes.Create;
  lDAOCliente := TDAOCliente.Create;
  try
    lCliente.nome := edNome.Text;
    lCliente.endereco := edEndereco.Text;
    lCliente.telefone := edTelefone.Text;
    lCliente.email := edEmail.Text;
    lCliente.data_cadastro := edDataCadastro.Text;

    lDAOCliente.CreateCliente(lCliente);
  finally
    lCliente.DisposeOf;
    lDAOCliente.DisposeOf;
  end;

end;

end.
