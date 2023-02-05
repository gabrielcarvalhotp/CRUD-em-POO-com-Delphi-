object DMConexao: TDMConexao
  OldCreateOrder = False
  Height = 132
  Width = 203
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\DB\DATABASETESTES.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 24
  end
end
