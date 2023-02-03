unit Financeiro.Model.ChamaCard;

interface

uses
  Financeiro.Controller.Interfaces, Vcl.WinXPanels;

type
  TChamaCard = class(TInterfacedObject, iChamaCard)
    constructor Create;
    destructor Destroy; override;
    class function New: iChamaCard;
    procedure Executar(Card: TCardPanel; Value: TCard);
  end;

implementation

uses
  Financeiro.View.CadastroPadrao, vcl.Dialogs;

{ TBotaoIncluir }

constructor TChamaCard.Create;
begin

end;

destructor TChamaCard.Destroy;
begin

  inherited;
end;

class function TChamaCard.New: iChamaCard;
begin
  Result := Self.Create;
end;

procedure TChamaCard.Executar(Card: TCardPanel; Value: TCard);
begin
  Card.ActiveCard := Value;
end;

end.
