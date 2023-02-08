unit CRUD.Entidadas.Constantes;

interface

type
  TStatus = class
  private
  public
    constructor create;
    destructor destroy; override;

  const
    insert = 'dsInsert';

  const
    edit = 'dsEdit';

  end;

var
  Contantes: TStatus;

implementation

{ TConstantes }

constructor TStatus.create;
begin

end;

destructor TStatus.destroy;
begin

  inherited;
end;

end.
