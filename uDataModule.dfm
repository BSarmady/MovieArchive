object Dm: TDm
  OnCreate = DataModuleCreate
  Height = 294
  Width = 535
  object dsFileTable: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    AfterScroll = dsFileTableAfterScroll
    CommandText = 'tblFiles'
    CommandType = cmdTable
    IndexFieldNames = 'Name'
    Parameters = <>
    Left = 72
    Top = 8
    object dsFileTableId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object dsFileTableName: TWideStringField
      FieldName = 'Name'
      Size = 150
    end
    object dsFileTableDirector: TWideStringField
      FieldName = 'Director'
      Size = 50
    end
    object dsFileTableYear: TWideStringField
      FieldName = 'Year'
      Size = 4
    end
    object dsFileTableGenre: TWideStringField
      FieldName = 'Genre'
      Size = 200
    end
    object dsFileTableCast: TWideMemoField
      FieldName = 'Cast'
      BlobType = ftWideMemo
    end
    object dsFileTableMPAA: TWideStringField
      DisplayLabel = 'Rating'
      FieldName = 'MPAA'
      Size = 50
    end
    object dsFileTableIMDB: TWideStringField
      FieldName = 'IMDB'
      Size = 50
    end
    object dsFileTableMediaType: TWideStringField
      DisplayLabel = 'Media~Type'
      FieldName = 'MediaType'
      Size = 10
    end
    object dsFileTableCdNo: TIntegerField
      DisplayLabel = 'Cd#'
      FieldName = 'CdNo'
    end
    object dsFileTableKeywords: TWideMemoField
      FieldName = 'Keywords'
      BlobType = ftWideMemo
    end
    object dsFileTableAKA: TWideMemoField
      FieldName = 'AKA'
      BlobType = ftWideMemo
    end
    object dsFileTableFileName: TWideStringField
      DisplayLabel = 'File~Name'
      FieldName = 'FileName'
      Size = 200
    end
  end
  object Conn: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=Movie' +
      'Archive.mdb;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 8
  end
  object Command: TADOCommand
    Connection = Conn
    Parameters = <>
    Left = 16
    Top = 64
  end
  object dsSameCD: TADODataSet
    Connection = Conn
    CursorType = ctStatic
    CommandText = 'tblFiles'
    CommandType = cmdTable
    IndexFieldNames = 'Name'
    Parameters = <>
    Left = 144
    Top = 8
    object dsSameCDId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object dsSameCDName: TWideStringField
      FieldName = 'Name'
      Size = 150
    end
    object dsSameCDDirector: TWideStringField
      FieldName = 'Director'
      Size = 50
    end
    object dsSameCDYear: TWideStringField
      FieldName = 'Year'
      Size = 4
    end
    object dsSameCDGenre: TWideStringField
      FieldName = 'Genre'
      Size = 200
    end
    object dsSameCDCast: TWideMemoField
      FieldName = 'Cast'
      BlobType = ftWideMemo
    end
    object dsSameCDMPAA: TWideStringField
      DisplayLabel = 'Rating'
      FieldName = 'MPAA'
      Size = 50
    end
    object dsSameCDIMDB: TWideStringField
      FieldName = 'IMDB'
      Size = 50
    end
    object dsSameCDMediaType: TWideStringField
      DisplayLabel = 'Media~Type'
      FieldName = 'MediaType'
      Size = 10
    end
    object dsSameCDCdNo: TIntegerField
      DisplayLabel = 'Cd#'
      FieldName = 'CdNo'
    end
    object dsSameCDKeywords: TWideMemoField
      FieldName = 'Keywords'
      BlobType = ftWideMemo
    end
    object dsSameCDAKA: TWideMemoField
      FieldName = 'AKA'
      BlobType = ftWideMemo
    end
    object dsSameCDFileName: TWideStringField
      DisplayLabel = 'File~Name'
      FieldName = 'FileName'
      Size = 200
    end
  end
  object daSameCD: TDataSource
    DataSet = dsSameCD
    Left = 144
    Top = 64
  end
end
