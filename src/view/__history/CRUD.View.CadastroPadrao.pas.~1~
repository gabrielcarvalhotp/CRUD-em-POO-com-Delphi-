unit Financeiro.View.CadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXPanels, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Financeiro.Controller.Interfaces, Datasnap.DBClient;

type
  TFrmCadPadrao = class(TForm)
    CardPanelPrincipal: TCardPanel;
    CardCadastro: TCard;
    CardPesquisa: TCard;
    PanelPesquisa: TPanel;
    PanelGrid: TPanel;
    PanelFooter: TPanel;
    DBGridPesquisa: TDBGrid;
    EditPesquisar: TEdit;
    BitBtnFecharPesquisa: TBitBtn;
    BitBtnIncluirPesquisa: TBitBtn;
    BitBtnExcluirPesquisa: TBitBtn;
    Panel1: TPanel;
    BitBtnFecharCadastro: TBitBtn;
    BitBtnSalvarCadastro: TBitBtn;
    LabelPesquisar: TLabel;
    BitBtnAlterarPesquisa: TBitBtn;
    Panel2: TPanel;
    Label6: TLabel;
    procedure BitBtnIncluirPesquisaClick(Sender: TObject);
    procedure BitBtnFecharCadastroClick(Sender: TObject);
    procedure BitBtnFecharPesquisaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnAlterarPesquisaClick(Sender: TObject);
    procedure DBGridPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

    { Private declarations }
  public
    { Public declarations }
    FDataModule: TClientDataSet;
    FChamaCard: iChamaCard;
  end;

var
  FrmCadPadrao: TFrmCadPadrao;

implementation

uses
  Financeiro.Model.ChamaCard;

{$R *.dfm}

procedure TFrmCadPadrao.FormCreate(Sender: TObject);
begin
  FChamaCard := TChamaCard.New;
end;

procedure TFrmCadPadrao.BitBtnIncluirPesquisaClick(Sender: TObject);
begin
  // CardPanelPrincipal.ActiveCard := CardCadastro;
  FChamaCard.Executar(self.CardPanelPrincipal, CardCadastro);
end;

procedure TFrmCadPadrao.BitBtnAlterarPesquisaClick(Sender: TObject);
begin
  FChamaCard.Executar(self.CardPanelPrincipal, CardCadastro);
end;

procedure TFrmCadPadrao.BitBtnFecharCadastroClick(Sender: TObject);
begin
  FChamaCard.Executar(self.CardPanelPrincipal, CardPesquisa);
end;

procedure TFrmCadPadrao.DBGridPesquisaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd(DBGridPesquisa.DataSource.DataSet.RecNo) then
  begin
    // DBGridPesquisa.Canvas.Font.Color:= clWhite;
    DBGridPesquisa.Canvas.Brush.Color := $00D2C8BE;
    DBGridPesquisa.DefaultDrawDataCell(Rect, Column.Field, State)
  end;
end;

procedure TFrmCadPadrao.BitBtnFecharPesquisaClick(Sender: TObject);
begin
  Close;
  self.Free;
end;

procedure TFrmCadPadrao.FormShow(Sender: TObject);
begin
  CardPanelPrincipal.ActiveCard := CardPesquisa;
end;

end.
