program CRUD_POO;

uses
  Vcl.Forms,
  CRUD.POO.Principal in 'src\view\CRUD.POO.Principal.pas' {FrmPrincipal},
  CRUD.View.CadastroPadrao in 'src\view\CRUD.View.CadastroPadrao.pas' {FrmCadPadrao},
  CRUD.Model.ChamaCard in 'src\model\CRUD.Model.ChamaCard.pas',
  CRUD.Controller.Interfaces in 'src\interfaces\CRUD.Controller.Interfaces.pas',
  CRUD.View.Clientes in 'src\view\CRUD.View.Clientes.pas' {frmCadClientes},
  CRUD.Entidadas.Clientes in 'src\model\Entidades\CRUD.Entidadas.Clientes.pas',
  CRUD.model.Conexao in 'src\model\Conexao\CRUD.model.Conexao.pas' {DMConexao: TDataModule},
  CRUD.DAO.Clientes in 'src\DAO\CRUD.DAO.Clientes.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMConexao, DMConexao);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.