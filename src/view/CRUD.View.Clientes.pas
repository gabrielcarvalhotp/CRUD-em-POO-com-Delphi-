unit CRUD.View.Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CRUD.View.CadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.WinXPanels, CRUD.model.Clientes,
  CRUD.Entidadas.Clientes, CRUD.DAO.Clientes;

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
    procedure BitBtnIncluirPesquisaClick(Sender: TObject);
    procedure ClearEdit;
    procedure BitBtnAlterarPesquisaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnExcluirPesquisaClick(Sender: TObject);
    procedure BitBtnFecharCadastroClick(Sender: TObject);
  private
    id: integer;
    FStatus: string;
    lDMClientes: TDMClientes;
  public
    { Public declarations }
  end;

implementation

uses
  CRUD.Entidadas.Constantes, CRUD.model.Clear;

{$R *.dfm}

procedure TfrmCadClientes.BitBtnAlterarPesquisaClick(Sender: TObject);
begin
  inherited;
  ClearEdit;
  edNome.Text := lDMClientes.FDQClientes_GridNOME.value;
  edEndereco.Text := lDMClientes.FDQClientes_GridENDERECO.value;
  edTelefone.Text := lDMClientes.FDQClientes_GridTELEFONE.value;
  edEmail.Text := lDMClientes.FDQClientes_GridEMAIL.value;
  edDataCadastro.Text := lDMClientes.FDQClientes_GridDATA_CADASTRO.Text;
  FStatus := TStatus.edit;
end;

procedure TfrmCadClientes.BitBtnExcluirPesquisaClick(Sender: TObject);
var
  lDAOCliente: TDAOCliente;
begin
  inherited;
  if MessageDlg('Deseja Deletar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
  begin
    lDAOCliente := TDAOCliente.Create;
    try
      lDAOCliente.DeleteCliente(lDMClientes.FDQClientes_GridID.value);
    finally
      lDAOCliente.DisposeOf;
    end;
  end;

end;

procedure TfrmCadClientes.BitBtnFecharCadastroClick(Sender: TObject);
begin
  inherited;
  DBGridPesquisa.Refresh;
end;

procedure TfrmCadClientes.BitBtnIncluirPesquisaClick(Sender: TObject);
begin
  inherited;
  ClearEdit;
  FStatus := TStatus.insert;
end;

procedure TfrmCadClientes.BitBtnSalvarCadastroClick(Sender: TObject);
var
  lCliente: TClientes;
  lDAOCliente: TDAOCliente;
begin
  inherited;
  if MessageDlg('Deseja Salvar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    lCliente := TClientes.Create;
    lDAOCliente := TDAOCliente.Create;
    try
      lCliente.nome := edNome.Text;
      lCliente.endereco := edEndereco.Text;
      lCliente.telefone := edTelefone.Text;
      lCliente.email := edEmail.Text;
      lCliente.data_cadastro := now;

      if FStatus = TStatus.insert then
        lDAOCliente.CreateCliente(lCliente)
      else if FStatus = TStatus.edit then
      begin
        lCliente.id := lDMClientes.FDQClientes_GridID.value;
        lDAOCliente.EditCliente(lCliente)
      end;

    finally
      lCliente.DisposeOf;
      lDAOCliente.DisposeOf;
    end;

    lDMClientes.FDQClientes_Grid.Refresh;
    BitBtnFecharCadastroClick(self);
  end;

  
end;

procedure TfrmCadClientes.ClearEdit;
begin
  TClearEdit.New
             .ClearEdit(edNome)
              .ClearEdit(edEndereco)
               .ClearEdit(edTelefone)
                .ClearEdit(edEmail)
                 .ClearEdit(edDataCadastro)
end;

procedure TfrmCadClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  lDMClientes.DisposeOf;
end;

procedure TfrmCadClientes.FormCreate(Sender: TObject);
begin
  inherited;
  lDMClientes := TDMClientes.Create(nil);
  lDMClientes.FDQClientes_Grid.Active := true;
end;

end.
