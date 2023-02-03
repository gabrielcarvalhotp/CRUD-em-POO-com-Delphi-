unit CRUD.model.Clientes;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDMClientes = class(TDataModule)
    FDQClientes: TFDQuery;
  private
    { Private declarations }
  public
    procedure PrepareStatement(aSql: string);
    procedure SetValue(aIndex: integer; aValue: variant);
    procedure ExecSQL;
    procedure StartTransation;
    procedure Commit;
    procedure Rollback;
  end;

var
  DMClientes: TDMClientes;

implementation

uses
  CRUD.model.Conexao;

procedure TDMClientes.Commit;
begin
  DMConexao.FDConnection.Connected := true;
end;

procedure TDMClientes.ExecSQL;
begin
  FDQClientes.ExecSQL;
end;

procedure TDMClientes.PrepareStatement(aSql: string);
begin
  FDQClientes.Connection := DMConexao.FDConnection;
  FDQClientes.Close;
  FDQClientes.SQL.Clear;
  FDQClientes.SQL.Add(aSql);
end;

procedure TDMClientes.Rollback;
begin
  DMConexao.FDConnection.Rollback;
end;

procedure TDMClientes.SetValue(aIndex: integer; aValue: variant);
begin
  FDQClientes.Params.Add;
  FDQClientes.Params[aIndex].Value := aValue;
end;

procedure TDMClientes.StartTransation;
begin
  DMConexao.FDConnection.StartTransaction;
end;

end.
