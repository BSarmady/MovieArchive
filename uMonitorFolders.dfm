object fmMonitorFolders: TfmMonitorFolders
  Left = 216
  Top = 88
  Caption = 'Modify Monitor Folders'
  ClientHeight = 413
  ClientWidth = 425
  Color = clBtnFace
  ParentFont = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    425
    413)
  TextHeight = 15
  object lblFolderMonitor: TRzLabel
    Left = 8
    Top = 8
    Width = 98
    Height = 15
    Caption = 'Folders to Monitor'
  end
  object RzLabel1: TRzLabel
    Left = 8
    Top = 296
    Width = 288
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Folder (for recursive search, start folder name with a +)'
  end
  object Border1: TRzBorder
    Left = 8
    Top = 376
    Width = 413
    Height = 9
    BorderSides = [sdTop]
    Anchors = [akLeft, akRight, akBottom]
    ExplicitWidth = 417
  end
  object lstMonitorFolders: TListBox
    Left = 8
    Top = 24
    Width = 413
    Height = 265
    Style = lbOwnerDrawFixed
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 17
    TabOrder = 0
    OnClick = lstMonitorFoldersClick
    OnDrawItem = lstMonitorFoldersDrawItem
  end
  object edtPath: TRzButtonEdit
    Left = 8
    Top = 312
    Width = 413
    Height = 23
    Text = ''
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    AltBtnNumGlyphs = 1
    ButtonNumGlyphs = 1
    OnButtonClick = edtPathButtonClick
    ExplicitWidth = 417
  end
  object btnAdd: TRzButton
    Left = 8
    Top = 344
    Width = 57
    Anchors = [akLeft, akBottom]
    Caption = 'Add'
    TabOrder = 2
    OnClick = btnAddClick
  end
  object btnDelete: TRzButton
    Left = 220
    Top = 344
    Width = 57
    Anchors = [akRight, akBottom]
    Caption = 'Delete'
    TabOrder = 3
    OnClick = btnDeleteClick
    ExplicitLeft = 224
  end
  object btnDeleteInvalidPath: TRzButton
    Left = 284
    Top = 344
    Width = 137
    Anchors = [akRight, akBottom]
    Caption = 'Delete Invalid Paths'
    TabOrder = 4
    OnClick = btnDeleteInvalidPathClick
    ExplicitLeft = 288
  end
  object btnReplace: TRzButton
    Left = 72
    Top = 344
    Width = 65
    Anchors = [akLeft, akBottom]
    Caption = 'Replace'
    TabOrder = 5
    OnClick = btnReplaceClick
  end
  object BtnCancel: TRzBitBtn
    Left = 348
    Top = 384
    Anchors = [akRight, akBottom]
    TabOrder = 6
    Kind = bkCancel
    ExplicitLeft = 352
  end
  object btnOk: TRzBitBtn
    Left = 266
    Top = 384
    Anchors = [akRight, akBottom]
    TabOrder = 7
    Kind = bkOK
    ExplicitLeft = 270
  end
end
