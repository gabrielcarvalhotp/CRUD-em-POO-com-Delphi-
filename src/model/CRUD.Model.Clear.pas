unit CRUD.Model.Clear;

interface

uses
  Vcl.StdCtrls;

type

  iClearEdit = interface
    ['{C8A3FE83-71A2-4956-919F-502B66FA281B}']
    function ClearEdit(avalue: TEdit): iClearEdit;
    function ClearMemo(aValue : TMemo) : iClearEdit;
  end;

  TClearEdit = class(TInterfacedObject, iClearEdit)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iClearEdit;
    function ClearEdit(avalue: TEdit): iClearEdit;
    function ClearMemo(aValue : TMemo) : iClearEdit;
  end;

implementation

{ TClearEdit }

function TClearEdit.ClearEdit(avalue: TEdit): iClearEdit;
begin
  avalue.Text := '';
  result := self;
end;

function TClearEdit.ClearMemo(aValue: TMemo): iClearEdit;
begin
  aValue.Lines.Clear;
end;

constructor TClearEdit.Create;
begin

end;

destructor TClearEdit.Destroy;
begin

  inherited;
end;

class function TClearEdit.New: iClearEdit;
begin
  result := self.Create;
end;

end.
