unit CRUD.View.Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CRUD.View.CadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.WinXPanels, CRUD.model.Produtos, Vcl.ComCtrls;

type
  TFrmCadProduto = class(TFrmCadPadrao)
    Label1: TLabel;
    edID: TEdit;
    label2: TLabel;
    EdNome: TEdit;
    Label3: TLabel;
    edPreco: TEdit;
    Label4: TLabel;
    MemoDescricao: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnAlterarPesquisaClick(Sender: TObject);
    procedure BitBtnIncluirPesquisaClick(Sender: TObject);
    procedure BitBtnSalvarCadastroClick(Sender: TObject);
    procedure BitBtnExcluirPesquisaClick(Sender: TObject);
  private
    FStatus: string;
    dmProdutos: TDMProdutos;
    procedure ClearEdit;
    procedure CompleteEdit;
  public

  end;

implementation

uses CRUD.Entidadas.Produtos, CRUD.DAO.produto, CRUD.Entidadas.Constantes,
  CRUD.model.Clear;
{$R *.dfm}

procedure TFrmCadProduto.BitBtnAlterarPesquisaClick(Sender: TObject);
begin
  inherited;
  CompleteEdit;
  FStatus := TStatus.edit;
end;

procedure TFrmCadProduto.BitBtnExcluirPesquisaClick(Sender: TObject);
var
  lDAOProdutos: TDAOProdutos;
begin
  inherited;
  if MessageDlg('Deseja Salvar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    lDAOProdutos := TDAOProdutos.Create;
    try
      lDAOProdutos.DeleteProduto(dmProdutos.FDQProdutos_gridID.Value)
    finally
      lDAOProdutos.DisposeOf;
    end;
  end;
  dmProdutos.FDQProdutos_grid.Refresh;
end;

procedure TFrmCadProduto.BitBtnIncluirPesquisaClick(Sender: TObject);
begin
  inherited;
  ClearEdit;
  FStatus := TStatus.insert;
end;

procedure TFrmCadProduto.BitBtnSalvarCadastroClick(Sender: TObject);
var
  lProduto: TProdutos;
  lDAOProdutos: TDAOProdutos;
begin
  inherited;
  if MessageDlg('Deseja Salvar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    lProduto := TProdutos.Create;
    lDAOProdutos := TDAOProdutos.Create;
    try
      lProduto.nome := EdNome.Text;
      lProduto.preco := StrToFloat(edPreco.Text);
      lProduto.descricao := MemoDescricao.Text;
      lProduto.data_cadastro := now;

      if FStatus = TStatus.insert then
        lDAOProdutos.createProduto(lProduto)
      else if FStatus = TStatus.edit then
      begin
        lProduto.id := dmProdutos.FDQProdutos_gridID.Value;
        lDAOProdutos.EditProduto(lProduto);
      end;

    finally
      lProduto.DisposeOf;
      lDAOProdutos.DisposeOf;
    end;
    dmProdutos.FDQProdutos_grid.Refresh;
    BitBtnFecharCadastroClick(self);
  end;
  
end;

procedure TFrmCadProduto.ClearEdit;
begin
  TClearEdit.New
             .ClearEdit(EdNome)
              .ClearEdit(edPreco)
               .ClearMemo(MemoDescricao)
end;

procedure TFrmCadProduto.CompleteEdit;
begin
  edID.Text := dmProdutos.FDQProdutos_gridID.Text;
  EdNome.Text := dmProdutos.FDQProdutos_gridNOME.Text;
  edPreco.Text := dmProdutos.FDQProdutos_gridPRECO.Text;
  MemoDescricao.Lines.Text := dmProdutos.FDQProdutos_gridDESCRICAO.Text;
  FStatus := TStatus.edit;
end;

procedure TFrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
  dmProdutos := TDMProdutos.Create(nil);
  dmProdutos.FDQProdutos_grid.Active := true;
end;

procedure TFrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmProdutos.DisposeOf;
end;

end.
