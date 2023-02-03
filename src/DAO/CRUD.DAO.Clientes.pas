unit CRUD.DAO.Clientes;

interface

uses
  CRUD.Entidadas.Clientes, CRUD.model.Conexao;

type
  TDAOCliente = class
  private
    FDMcliente: TDMConexao;
  public
    constructor Create;
    destructor Destroy; override;
    procedure CreateCliente(aValue: TClientes);
  end;

implementation

{ TCliente }

constructor TDAOCliente.Create;
begin
  FDMcliente := TDMConexao.Create(nil)
end;

procedure TDAOCliente.CreateCliente(aValue: TClientes);
var
  lSQL: string;
begin
  try
    lsql := ' insert into CLIENTES values (?,?,?,?,?,?)';
    FDMcliente.PrepareStatement(lsql);
    FDMcliente.SetValue(1, aValue.nome);
    FDMcliente.SetValue(2, aValue.endereco);
    FDMcliente.SetValue(3, aValue.telefone);
    FDMcliente.SetValue(4, aValue.email);
    FDMcliente.SetValue(5, aValue.data_cadastro);
    FDMcliente.ExecSQL;
    FDMcliente.Commit;
  except
    FDMcliente.Rollback;
  end;
end;

destructor TDAOCliente.Destroy;
begin
   FDMcliente.DisposeOf;
  inherited;
end;

end.
