object DMProdutos: TDMProdutos
  OldCreateOrder = False
  Height = 304
  Width = 525
  object FDQProdutos_grid: TFDQuery
    Connection = DMConexao.FDConnection
    SQL.Strings = (
      'select * from produtos')
    Left = 40
    Top = 24
    object FDQProdutos_gridID: TIntegerField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQProdutos_gridNOME: TStringField
      DisplayWidth = 13
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object FDQProdutos_gridPRECO: TFMTBCDField
      DisplayWidth = 19
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Required = True
      Precision = 18
      Size = 2
    end
    object FDQProdutos_gridDATACADASTRO: TSQLTimeStampField
      DisplayWidth = 21
      FieldName = 'DATACADASTRO'
      Origin = 'DATACADASTRO'
      Required = True
    end
    object FDQProdutos_gridDESCRICAO: TStringField
      DisplayWidth = 255
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 255
    end
  end
  object FDQProdutos: TFDQuery
    Connection = DMConexao.FDConnection
    Left = 144
    Top = 24
  end
  object DSPRodutos_grid: TDataSource
    DataSet = FDQProdutos_grid
    Left = 40
    Top = 88
  end
end
