program CRUD_POO;

uses
  Vcl.Forms,
  CRUD.POO.Principal in 'src\view\CRUD.POO.Principal.pas' {FrmPrincipal},
  CRUD.View.CadastroPadrao in 'src\view\CRUD.View.CadastroPadrao.pas' {FrmCadPadrao},
  CRUD.View.Clientes in 'src\view\CRUD.View.Clientes.pas' {frmCadClientes},
  CRUD.Entidadas.Clientes in 'src\model\Entidades\CRUD.Entidadas.Clientes.pas',
  CRUD.model.Conexao in 'src\model\Conexao\CRUD.model.Conexao.pas' {DMConexao: TDataModule},
  CRUD.DAO.Clientes in 'src\DAO\CRUD.DAO.Clientes.pas',
  CRUD.model.Clientes in 'src\model\Conexao\CRUD.model.Clientes.pas' {DMClientes: TDataModule},
  CRUD.Entidadas.Constantes in 'src\model\Entidades\CRUD.Entidadas.Constantes.pas',
  CRUD.View.Produtos in 'src\view\CRUD.View.Produtos.pas' {FrmCadProduto},
  CRUD.model.Orcamento in 'src\model\Conexao\CRUD.model.Orcamento.pas' {DMOrcamentos: TDataModule},
  CRUD.Entidadas.Produtos in 'src\model\Entidades\CRUD.Entidadas.Produtos.pas',
  CRUD.model.Produtos in 'src\model\Conexao\CRUD.model.Produtos.pas' {DMProdutos: TDataModule},
  CRUD.DAO.produto in 'src\DAO\CRUD.DAO.produto.pas',
  CRUD.Model.Clear in 'src\model\CRUD.Model.Clear.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMConexao, DMConexao);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
