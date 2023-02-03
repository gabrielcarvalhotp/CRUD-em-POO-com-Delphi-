unit CRUD.model.Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDMConexao = class(TDataModule)
    FDConnection: TFDConnection;
    FDQClientes_Grid: TFDQuery;
    DSClientes_grid: TDataSource;
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
  DMConexao: TDMConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDMConexao }

procedure TDMConexao.Commit;
begin
  FDConnection.Connected := true;
end;

procedure TDMConexao.ExecSQL;
begin
  FDQClientes.ExecSQL;
end;

procedure TDMConexao.PrepareStatement(aSql: string);
begin
  FDQClientes.SQL.Clear;
  FDQClientes.SQL.Add(aSql);
end;

procedure TDMConexao.Rollback;
begin
  FDConnection.Rollback;
end;

procedure TDMConexao.SetValue(aIndex: integer; aValue: variant);
begin
  FDQClientes.Params.Add;
  FDQClientes.Params[aIndex].Value := aValue;
end;

procedure TDMConexao.StartTransation;
begin
  FDConnection.StartTransaction;
end;

end.
