unit CRUD.model.Produtos;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, CRUD.model.Conexao;

type
  TDMProdutos = class(TDataModule)
    FDQProdutos_grid: TFDQuery;
    FDQProdutos: TFDQuery;
    DSPRodutos_grid: TDataSource;
    FDQProdutos_gridID: TIntegerField;
    FDQProdutos_gridNOME: TStringField;
    FDQProdutos_gridPRECO: TFMTBCDField;
    FDQProdutos_gridDATACADASTRO: TSQLTimeStampField;
    FDQProdutos_gridDESCRICAO: TStringField;
  private
    { Private declarations }
  public
    procedure PreparementsStatement(aSql: string);
    procedure setValue(aIndex: integer; aValue: Variant);
    procedure addParaments(aNameParament: string; aValue: integer); overload;
    procedure addParaments(aNameParament: string; aValue: string); overload;
    procedure addParaments(aNameParament: string; aValue: double); overload;
    procedure addParaments(aNameParament: string; aValue: TDateTime); overload;
    procedure execSQL;
    procedure Rollback;
  end;

implementation

uses
  Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDMProdutos }

procedure TDMProdutos.addParaments(aNameParament: string; aValue: integer);
begin
  FDQProdutos.ParamByName(aNameParament).AsInteger := aValue;
end;

procedure TDMProdutos.addParaments(aNameParament, aValue: string);
begin
  FDQProdutos.ParamByName(aNameParament).Asstring := aValue;
end;

procedure TDMProdutos.addParaments(aNameParament: string; aValue: double);
begin
  FDQProdutos.ParamByName(aNameParament).AsFloat := aValue;
end;

procedure TDMProdutos.addParaments(aNameParament: string; aValue: TDateTime);
begin
FDQProdutos.ParamByName(aNameParament).AsDateTime := aValue;
end;

procedure TDMProdutos.execSQL;
begin
  FDQProdutos.execSQL;
end;

procedure TDMProdutos.PreparementsStatement(aSql: string);
begin
  FDQProdutos.SQL.Clear;
  FDQProdutos.SQL.Add(aSql);
end;

procedure TDMProdutos.Rollback;
begin
  DMConexao.FDConnection.Rollback;
end;

procedure TDMProdutos.setValue(aIndex: integer; aValue: Variant);
begin
  FDQProdutos.Params.Add;
  FDQProdutos.Params[aIndex].Value := aValue;
end;

end.
