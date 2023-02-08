unit CRUD.Entidadas.Produtos;

interface

type
  TProdutos = class
  private
    Fdescricao: string;
    Fpreco: double ;
    Fdata_cadastro: TdateTime;
    Fid: integer;
    Fnome: string;
  public
    constructor create;
    destructor destroy; override;
    property id : integer read Fid write Fid;
    property nome : string read Fnome write Fnome;
    property preco : double read Fpreco write Fpreco;
    property data_cadastro : TdateTime read Fdata_cadastro write Fdata_cadastro;
    property descricao : string read Fdescricao write Fdescricao;
    
  end;

implementation

{ TOrcamento_detalhe }

constructor TProdutos.create;
begin

end;

destructor TProdutos.destroy;
begin

  inherited;
end;

end.
