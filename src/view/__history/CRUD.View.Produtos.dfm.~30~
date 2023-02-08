inherited FrmCadProduto: TFrmCadProduto
  Caption = 'FrmCadProduto'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 19
  inherited CardPanelPrincipal: TCardPanel
    inherited CardCadastro: TCard
      object Label1: TLabel [0]
        Left = 20
        Top = 80
        Width = 50
        Height = 19
        Caption = 'C'#243'digo'
      end
      object label2: TLabel [1]
        Left = 20
        Top = 113
        Width = 42
        Height = 19
        Caption = 'Nome'
      end
      object Label3: TLabel [2]
        Left = 20
        Top = 146
        Width = 39
        Height = 19
        Caption = 'Pre'#231'o'
      end
      object Label4: TLabel [3]
        Left = 20
        Top = 179
        Width = 67
        Height = 19
        Caption = 'Descri'#231#227'o'
      end
      inherited Panel1: TPanel
        inherited BitBtnSalvarCadastro: TBitBtn
          OnClick = BitBtnSalvarCadastroClick
        end
      end
      object edID: TEdit
        Left = 104
        Top = 77
        Width = 57
        Height = 27
        Color = clGray
        ReadOnly = True
        TabOrder = 2
      end
      object EdNome: TEdit
        Left = 104
        Top = 110
        Width = 200
        Height = 27
        TabOrder = 3
      end
      object edPreco: TEdit
        Left = 104
        Top = 143
        Width = 200
        Height = 27
        NumbersOnly = True
        TabOrder = 4
      end
      object MemoDescricao: TMemo
        Left = 104
        Top = 176
        Width = 200
        Height = 89
        DragMode = dmAutomatic
        TabOrder = 5
      end
    end
    inherited CardPesquisa: TCard
      inherited PanelFooter: TPanel
        inherited BitBtnExcluirPesquisa: TBitBtn
          OnClick = BitBtnExcluirPesquisaClick
        end
      end
      inherited PanelGrid: TPanel
        inherited DBGridPesquisa: TDBGrid
          DataSource = DMProdutos.DSPRodutos_grid
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO'
              Width = 156
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATACADASTRO'
              Width = 239
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Width = 423
              Visible = True
            end>
        end
      end
    end
  end
end
