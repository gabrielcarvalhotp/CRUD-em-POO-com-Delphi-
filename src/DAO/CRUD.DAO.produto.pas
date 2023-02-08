unit CRUD.DAO.produto;

interface

uses
  CRUD.model.Produtos, CRUD.Entidadas.Produtos, System.SysUtils;

type
  TDAOProdutos = class
  private
    DMProduto: TDMProdutos;
  public
    constructor Create;
    destructor destroy; override;
    procedure createProduto(aValue: TProdutos);
    procedure EditProduto(aValue: TProdutos);
    procedure DeleteProduto(aValue: integer);
  end;

implementation

uses
  FireDAC.Comp.Client;

{ TDAOProduto }

constructor TDAOProdutos.Create;
begin
  DMProduto := TDMProdutos.Create(nil);
end;

procedure TDAOProdutos.createProduto(aValue: TProdutos);
var
  lsql: string;
begin
  try
    lsql := ' insert into produtos values (?,?,?,?,?) ';
    DMProduto.PreparementsStatement(lsql);
    DMProduto.setValue(1, aValue.nome);
    DMProduto.setValue(2, aValue.preco);
    DMProduto.setValue(3, aValue.data_cadastro);
    DMProduto.setValue(4, aValue.descricao);
    DMProduto.execSQL;
  except
    DMProduto.Rollback;
  end;

end;

procedure TDAOProdutos.EditProduto(aValue: TProdutos);
var
  lsql: string;
begin
  try
    lsql := ' update produtos ' + 
            ' SET produtos.nome = :pNome, ' +
            ' produtos.preco = :pPreco, ' + 
            ' produtos.datacadastro = :Pdatacadastro, ' +
            ' produtos.descricao = :pDescricao ' + 
            ' where produtos.id = :pId ';

    DMProduto.PreparementsStatement(lsql);
    DMProduto.addParaments('pNome', aValue.nome);
    DMProduto.addParaments('pPreco', aValue.preco);
    DMProduto.addParaments('pdatacadastro', aValue.data_cadastro);
    DMProduto.addParaments('pDescricao', aValue.descricao);
    DMProduto.addParaments('pid', aValue.id);
    DMProduto.execSQL;
  except
       DMProduto.Rollback;
       raise Exception.Create('N�o foi possivel editar!');
  end;
end;

procedure TDAOProdutos.DeleteProduto(aValue: integer);
var
  lsql: string;
begin
  try
  lsql := ' delete from PRODUTOS where PRODUTOS.id = :pId ';
  DMProduto.PreparementsStatement(lsql);
  DMProduto.addParaments('pid', avalue);
  DMProduto.execSQL;
  except
    DMProduto.Rollback;
  end;

end;

destructor TDAOProdutos.destroy;
begin
  inherited;
  DMProduto.DisposeOf;
end;

end.
