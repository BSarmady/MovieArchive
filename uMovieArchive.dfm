object fmMovieArchive: TfmMovieArchive
  Left = 216
  Top = 204
  Caption = 'fmMovieArchive'
  ClientHeight = 444
  ClientWidth = 692
  Color = clBtnFace
  ParentFont = True
  KeyPreview = True
  Menu = MainMenu1
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 15
  object pnApplTitle: TRzPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 44
    Align = alTop
    BorderInner = fsFlatRounded
    BorderOuter = fsNone
    BorderWidth = 2
    Color = 15987699
    TabOrder = 0
    object lblCaption: TRzLabel
      Left = 7
      Top = 7
      Width = 111
      Height = 28
      Caption = 'lblCaption'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
  end
  object StatusBar: TRzStatusBar
    Left = 0
    Top = 425
    Width = 692
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    Color = 15987699
    TabOrder = 2
    object JobStatus: TRzStatusPane
      Left = 0
      Top = 0
      Width = 507
      Height = 19
      Align = alClient
      AutoSize = True
      Caption = ''
      ExplicitWidth = 40
    end
    object StatusPaneResize: TRzStatusPane
      Left = 655
      Top = 0
      Width = 37
      Height = 19
      Align = alRight
      Caption = ''
      ExplicitLeft = 730
    end
    object Progress: TRzProgressBar
      Left = 507
      Top = 0
      Width = 148
      Height = 19
      Align = alRight
      BackColor = clBtnFace
      BorderInner = fsFlat
      BorderOuter = fsNone
      BorderWidth = 1
      InteriorOffset = 0
      PartsComplete = 0
      Percent = 0
      TotalParts = 0
      Visible = False
      ExplicitLeft = 582
    end
  end
  object PageControl: TRzPageControl
    Left = 0
    Top = 44
    Width = 692
    Height = 381
    Hint = ''
    ActivePage = tbDetail
    Align = alClient
    ShowShadow = False
    TabIndex = 0
    TabOrder = 1
    TabStyle = tsRoundCorners
    OnChange = PageControlChange
    FixedDimension = 21
    object tbDetail: TRzTabSheet
      Caption = 'Detail'
      DesignSize = (
        690
        355)
      object lblName: TRzLabel
        Left = 3
        Top = 34
        Width = 32
        Height = 15
        Caption = 'Name'
      end
      object lblDirector: TRzLabel
        Left = 3
        Top = 77
        Width = 55
        Height = 15
        Caption = 'Director(s)'
      end
      object lblYear: TRzLabel
        Left = 607
        Top = 34
        Width = 22
        Height = 15
        Anchors = [akTop, akRight]
        Caption = 'Year'
        ExplicitLeft = 623
      end
      object lblIMDB: TRzLabel
        Left = 224
        Top = 77
        Width = 54
        Height = 15
        Caption = 'IMDB Link'
      end
      object lblMediaType: TRzLabel
        Left = 440
        Top = 77
        Width = 61
        Height = 15
        Caption = 'Media Type'
      end
      object lblCdNo: TRzLabel
        Left = 607
        Top = 77
        Width = 34
        Height = 15
        Anchors = [akTop, akRight]
        Caption = 'Cd No'
        ExplicitLeft = 623
      end
      object lblInfo: TRzLabel
        Left = 242
        Top = 7
        Width = 34
        Height = 16
        Caption = 'Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblBatchUpdate: TRzLabel
        Left = 619
        Top = 7
        Width = 34
        Height = 16
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 635
      end
      object btnFirst: TRzBitBtn
        Left = 3
        Top = 3
        Width = 25
        TabOrder = 0
        OnClick = btnNavigate
        DisabledIndex = 25
        ImageIndex = 24
        Images = Images
        Margin = 0
        NumGlyphs = 2
      end
      object btnPrev: TRzBitBtn
        Left = 34
        Top = 3
        Width = 25
        TabOrder = 1
        OnClick = btnNavigate
        DisabledIndex = 27
        ImageIndex = 26
        Images = Images
        Margin = 0
        NumGlyphs = 2
      end
      object btnNext: TRzBitBtn
        Left = 65
        Top = 3
        Width = 25
        TabOrder = 2
        OnClick = btnNavigate
        DisabledIndex = 29
        ImageIndex = 28
        Images = Images
        Margin = 0
        NumGlyphs = 2
      end
      object btnLast: TRzBitBtn
        Left = 96
        Top = 3
        Width = 25
        TabOrder = 3
        OnClick = btnNavigate
        DisabledIndex = 31
        ImageIndex = 30
        Images = Images
        Margin = 0
        NumGlyphs = 2
      end
      object btnCancel: TRzBitBtn
        Left = 127
        Top = 3
        Width = 25
        Cancel = True
        Caption = 'Cancel'
        TabOrder = 4
        OnClick = btnCancelClick
        DisabledIndex = 5
        ImageIndex = 4
        Images = Images
        Margin = 0
        NumGlyphs = 2
      end
      object btnSave: TRzBitBtn
        Left = 158
        Top = 3
        Width = 25
        Caption = 'Cancel'
        TabOrder = 5
        OnClick = btnSaveClick
        DisabledIndex = 3
        ImageIndex = 2
        Images = Images
        Margin = 0
        NumGlyphs = 2
      end
      object edtYear: TRzDBEdit
        Left = 607
        Top = 50
        Width = 76
        Height = 23
        DataSource = daFileTable
        DataField = 'Year'
        Anchors = [akTop, akRight]
        TabOrder = 14
      end
      object edtCdNo: TRzDBEdit
        Left = 607
        Top = 96
        Width = 73
        Height = 23
        DataSource = daFileTable
        DataField = 'CdNo'
        Anchors = [akTop, akRight]
        TabOrder = 13
      end
      object pnlLowerDetail: TRzPanel
        Left = 0
        Top = 128
        Width = 690
        Height = 227
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderOuter = fsNone
        Color = 15987699
        TabOrder = 15
        OnResize = pnlLowerDetailResize
        object pnlGenre: TRzPanel
          Left = 217
          Top = 0
          Width = 203
          Height = 227
          Align = alClient
          BorderOuter = fsNone
          Color = 15987699
          TabOrder = 1
          DesignSize = (
            203
            227)
          object lblGenre: TRzLabel
            Left = 8
            Top = 0
            Width = 44
            Height = 15
            Caption = 'Genre(s)'
          end
          object lblAKA: TRzLabel
            Left = 8
            Top = 40
            Width = 51
            Height = 15
            Caption = 'Keywords'
          end
          object edtGenre: TRzDBEdit
            Left = 7
            Top = 16
            Width = 192
            Height = 23
            DataSource = daFileTable
            DataField = 'Genre'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object edtAKA: TRzDBMemo
            Left = 8
            Top = 56
            Width = 192
            Height = 164
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'Keywords'
            DataSource = daFileTable
            ScrollBars = ssBoth
            TabOrder = 1
            OnChange = mmoKeywordChange
          end
        end
        object pnlCast: TRzPanel
          Left = 0
          Top = 0
          Width = 217
          Height = 227
          Align = alLeft
          BorderOuter = fsNone
          Color = 15987699
          TabOrder = 0
          DesignSize = (
            217
            227)
          object lblCast: TRzLabel
            Left = 8
            Top = -3
            Width = 23
            Height = 15
            Caption = 'Cast'
          end
          object mmoCast: TRzDBMemo
            Left = 8
            Top = 16
            Width = 209
            Height = 204
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'Cast'
            DataSource = daFileTable
            ScrollBars = ssBoth
            TabOrder = 0
            WantTabs = True
          end
        end
        object pnlRating: TRzPanel
          Left = 420
          Top = 0
          Width = 270
          Height = 227
          Align = alRight
          BorderOuter = fsNone
          Color = 15987699
          TabOrder = 2
          DesignSize = (
            270
            227)
          object lblRating: TRzLabel
            Left = 8
            Top = 115
            Width = 34
            Height = 15
            Anchors = [akLeft, akBottom]
            Caption = 'Rating'
            ExplicitTop = 120
          end
          object imgRates: TImage
            Left = 8
            Top = 155
            Width = 250
            Height = 64
            Anchors = [akLeft, akBottom]
            ExplicitTop = 160
          end
          object lblKeywords: TRzLabel
            Left = 6
            Top = -3
            Width = 51
            Height = 15
            Caption = 'Keywords'
          end
          object cbRates: TRzDBComboBox
            Left = 8
            Top = 131
            Width = 250
            Height = 23
            DataField = 'MPAA'
            DataSource = daFileTable
            Anchors = [akLeft, akBottom]
            TabOrder = 1
            OnChange = cbRatesChange
            Items.Strings = (
              ''
              'G'
              'PG'
              'PG-13'
              'R'
              'NC-17')
          end
          object mmoKeyword: TRzDBMemo
            Left = 8
            Top = 16
            Width = 249
            Height = 100
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'Keywords'
            DataSource = daFileTable
            ScrollBars = ssBoth
            TabOrder = 0
            OnChange = mmoKeywordChange
          end
        end
      end
      object btnUpdateInfo: TRzBitBtn
        Left = 189
        Top = 3
        Width = 25
        Action = acUpdateInfo
        Caption = 'Update Information'
        TabOrder = 6
        Visible = False
        DisabledIndex = 39
        ImageIndex = 38
        Images = Images
        Margin = 0
        NumGlyphs = 2
      end
      object Animate1: TAnimate
        Left = 220
        Top = 7
        Width = 16
        Height = 16
        CommonAVI = aviFindFile
        StopFrame = 8
        Visible = False
      end
      object edtDirector: TRzDBEdit
        Left = 8
        Top = 96
        Width = 209
        Height = 23
        DataSource = daFileTable
        DataField = 'Director'
        TabOrder = 10
      end
      object edtIMDB: TRzDBEdit
        Left = 224
        Top = 96
        Width = 209
        Height = 23
        DataSource = daFileTable
        DataField = 'IMDB'
        TabOrder = 11
      end
      object edtMediaType: TRzDBEdit
        Left = 440
        Top = 96
        Width = 161
        Height = 23
        DataSource = daFileTable
        DataField = 'MediaType'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 12
      end
      object edtName: TRzDBEdit
        Left = 3
        Top = 50
        Width = 598
        Height = 23
        DataSource = daFileTable
        DataField = 'Name'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
      end
      object RzBitBtn1: TRzBitBtn
        Left = 658
        Top = 3
        Width = 25
        Hint = 'Update Information'
        Anchors = [akTop, akRight]
        Caption = 'Update Information'
        TabOrder = 8
        Visible = False
        OnClick = RzBitBtn1Click
        DisabledIndex = 39
        ImageIndex = 38
        Images = Images
        Margin = 0
        NumGlyphs = 2
      end
      object RzBitBtn2: TRzBitBtn
        Left = 588
        Top = 3
        Width = 25
        Hint = 'Update Information'
        Anchors = [akTop, akRight]
        Caption = 'Update Information'
        TabOrder = 7
        Visible = False
        OnClick = RzBitBtn2Click
        DisabledIndex = 39
        ImageIndex = 38
        Images = Images
        Margin = 0
        NumGlyphs = 2
      end
      object lstCast: TRzEditListBox
        Left = 310
        Top = 8
        Width = 105
        Height = 20
        GroupPrefix = '+'
        ItemHeight = 17
        ShowGroups = True
        Style = lbOwnerDrawFixed
        TabOrder = 16
        Visible = False
        AllowDeleteByKbd = True
      end
    end
    object tbSearch: TRzTabSheet
      Caption = 'Search'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlSearch: TRzPanel
        Left = 0
        Top = 0
        Width = 698
        Height = 38
        Align = alTop
        BorderOuter = fsFlatRounded
        BorderSides = [sdBottom]
        Color = 15987699
        TabOrder = 0
        object lblSearch: TRzLabel
          Left = 16
          Top = 8
          Width = 35
          Height = 15
          Caption = 'Search'
        end
        object lblFor: TRzLabel
          Left = 152
          Top = 8
          Width = 17
          Height = 15
          Caption = 'For'
        end
        object edtSearch: TRzEdit
          Left = 176
          Top = 8
          Width = 337
          Height = 23
          Text = ''
          TabOrder = 1
          OnChange = edtSearchChange
        end
        object cbFieldNames: TRzComboBox
          Left = 56
          Top = 8
          Width = 89
          Height = 23
          Style = csDropDownList
          TabOrder = 0
        end
      end
      object Grid: TwwDBGrid
        Left = 0
        Top = 38
        Width = 690
        Height = 317
        ControlType.Strings = (
          'IMDB;URL-Link')
        Selected.Strings = (
          'CdNo'#9'10'#9'Cd#'#9'F'
          'Name'#9'44'#9'Name'#9#9
          'Year'#9'4'#9'Year'#9#9
          'Director'#9'11'#9'Director'#9#9
          'Genre'#9'10'#9'Genre'#9#9
          'Cast'#9'11'#9'Cast'#9#9
          'MPAA'#9'14'#9'MPAA'#9#9
          'IMDB'#9'22'#9'IMDB'#9#9
          'MediaType'#9'6'#9'Media Type'#9'F')
        MemoAttributes = [mSizeable, mWordWrap, mGridShow, mViewOnly]
        IniAttributes.Delimiter = ';;'
        IniAttributes.UnicodeIniFile = False
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        BorderStyle = bsNone
        DataSource = daFileTable
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgShowCellHint, dgRowResize, dgDblClickColSizing]
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = True
        UseTFields = False
        OnCalcTitleAttributes = GridCalcTitleAttributes
        OnTitleButtonClick = GridTitleButtonClick
        OnDrawDataCell = GridDrawDataCell
        PadColumnStyle = pcsPlain
        OnURLOpen = GridURLOpen
        PaintOptions.AlternatingRowColor = 15794175
        ExplicitWidth = 698
        ExplicitHeight = 319
      end
    end
    object tbMonitor: TRzTabSheet
      Caption = 'Monitor Folders'
      ExplicitWidth = 694
      ExplicitHeight = 356
      DesignSize = (
        690
        355)
      object lblFolderMonitor: TRzLabel
        Left = 8
        Top = 8
        Width = 98
        Height = 15
        Caption = 'Folders to Monitor'
      end
      object lblCheckAll: TRzURLLabel
        Left = 88
        Top = 323
        Width = 43
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Select All'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = lblCheckAllClick
        ExplicitTop = 328
      end
      object lblReverseChecked: TRzURLLabel
        Left = 8
        Top = 323
        Width = 74
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Invert Selected'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = lblReverseCheckedClick
        ExplicitTop = 328
      end
      object edtPath: TRzButtonEdit
        Left = 8
        Top = 24
        Width = 600
        Height = 23
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        AltBtnNumGlyphs = 1
        ButtonNumGlyphs = 1
        FlatButtons = True
        OnButtonClick = edtPathButtonClick
        ExplicitWidth = 604
      end
      object btnSeparateDates: TRzButton
        Left = 431
        Top = 323
        Width = 107
        Height = 21
        Anchors = [akRight, akBottom]
        Caption = 'Separate Dates'
        TabOrder = 3
        Visible = False
        OnClick = btnSeparateDatesClick
        ExplicitLeft = 435
        ExplicitTop = 324
      end
      object lstFileList: TRzCheckList
        Left = 8
        Top = 56
        Width = 664
        Height = 260
        Anchors = [akLeft, akTop, akRight, akBottom]
        ItemHeight = 17
        TabOrder = 2
      end
      object btnStart: TRzButton
        Left = 615
        Top = 24
        Width = 57
        Height = 20
        Action = acRefresh
        Anchors = [akTop, akRight]
        TabOrder = 1
        ExplicitLeft = 619
      end
      object btnAddToDatabase: TRzButton
        Left = 559
        Top = 323
        Width = 115
        Height = 21
        Action = acAddToDatabase
        Anchors = [akRight, akBottom]
        TabOrder = 4
        ExplicitLeft = 563
        ExplicitTop = 324
      end
      object btnAssignFileNames: TRzBitBtn
        Left = 400
        Top = 323
        Width = 25
        Height = 21
        Hint = 'Assign File Names'
        Anchors = [akRight, akBottom]
        Caption = 'Assign File Names'
        TabOrder = 5
        Visible = False
        OnClick = btnAssignFileNamesClick
        DisabledIndex = 39
        ImageIndex = 38
        Images = Images
        Margin = 0
        NumGlyphs = 2
        ExplicitLeft = 404
        ExplicitTop = 324
      end
      object btnCorrectMovieNames: TRzBitBtn
        Left = 369
        Top = 322
        Width = 25
        Height = 21
        Hint = 'Correct Movie Names'
        Anchors = [akRight, akBottom]
        Caption = 'Correct Movie Names'
        TabOrder = 6
        Visible = False
        OnClick = btnCorrectMovieNamesClick
        DisabledIndex = 39
        ImageIndex = 38
        Images = Images
        Margin = 0
        NumGlyphs = 2
        ExplicitLeft = 373
        ExplicitTop = 323
      end
      object btnFixFileNames: TRzButton
        Left = 248
        Top = 322
        Width = 115
        Height = 21
        Anchors = [akRight, akBottom]
        Caption = 'Fix File Names'
        TabOrder = 7
        Visible = False
        OnClick = btnFixFileNamesClick
        ExplicitLeft = 252
        ExplicitTop = 323
      end
      object btnAddNames: TRzBitBtn
        Left = 217
        Top = 322
        Width = 25
        Height = 21
        Hint = 'Add Names'
        Anchors = [akRight, akBottom]
        Caption = 'Add Names'
        TabOrder = 8
        Visible = False
        OnClick = btnAddNamesClick
        DisabledIndex = 39
        ImageIndex = 38
        Images = Images
        Margin = 0
        NumGlyphs = 2
        ExplicitLeft = 221
        ExplicitTop = 323
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 432
    Top = 40
  end
  object Images: TImageList
    Left = 488
    Top = 40
    Bitmap = {
      494C010128002C00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000B0000000010020000000000000B0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000066666600666666006666660066666600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000666666006666660099999900999999009999990099999900666666006666
      6600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000099330000000000FF000000FF663300FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000006666
      6600999999006666660099999900CCCCCC009999990099999900999999009999
      990066666600000000000000000000000000000000000000FF00000099000000
      99000000990000000000000000000000000000000000000000000000FF000000
      99000000990000009900000000000000000000000000B2B2B200808080008080
      8000808080000000000000000000000000000000000000000000B2B2B2008080
      8000808080008080800000000000000000000000000000000000009933000099
      3300009933000099330000000000FF663300FF663300FF663300FF000000FF00
      0000003300000000000000000000000000000000000000000000999999009999
      9900999999009999990066666600CCCCCC00CCCCCC00CCCCCC00999999009999
      990000330000666666000000000000000000000000000000FF000000CC000000
      CC000000CC00000099000000000000000000000000000000FF000000CC000000
      CC000000CC0000009900000000000000000000000000B2B2B200999999009999
      99009999990080808000000000000000000000000000B2B2B200999999009999
      99009999990080808000000000000000000000000000009933000099330066FF
      330066FF330033CC33000099330000000000FF663300FF663300006600000066
      000000660000006600000000000000000000000000009999990099999900E5E5
      E500E5E5E500CCCCCC009999990066666600CCCCCC00CCCCCC00999999009999
      99009999990099999900666666000000000000000000000000000000FF000000
      CC000000CC000000CC0000009900000000000000FF000000CC000000CC000000
      CC00000099000000000000000000000000000000000000000000B2B2B2009999
      990099999900999999008080800000000000B2B2B20099999900999999009999
      990080808000000000000000000000000000000000000099330066FF330066FF
      330066FF330033CC33000099330000000000FF99000000660000009933000099
      3300006600000066000000000000000000000000000099999900E5E5E500E5E5
      E500E5E5E500CCCCCC009999990066666600CCCCCC0099999900999999009999
      9900999999009999990066666600000000000000000000000000000000000000
      FF000000CC000000CC000000CC00000099000000CC000000CC000000CC000000
      990000000000000000000000000000000000000000000000000000000000B2B2
      B200999999009999990099999900808080009999990099999900999999008080
      80000000000000000000000000000000000000993300CCFFCC00CCFFCC00CCFF
      CC0033CC33000066000000660000FF9900000066000033CC3300009933000099
      33000066000000660000006600000000000099999900E5E5E500E5E5E500E5E5
      E500CCCCCC009999990099999900CCCCCC0099999900CCCCCC00999999009999
      9900999999009999990099999900666666000000000000000000000000000000
      00000000FF000000CC000000CC000000CC000000CC000000CC00000099000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B2B2B2009999990099999900999999009999990099999900808080000000
      0000000000000000000000000000000000000099330000993300FFFFFF0033CC
      330000660000FF990000FFCC3300FFCC330000660000CCFFCC0033CC33000099
      3300006600000066000000660000000000009999990099999900FFFFFF00CCCC
      CC0099999900CCCCCC00E5E5E500E5E5E50099999900E5E5E500CCCCCC009999
      9900999999009999990099999900666666000000000000000000000000000000
      0000000000000000FF000000CC000000CC000000CC0000009900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B2B2B20099999900999999009999990080808000000000000000
      000000000000000000000000000000000000FF663300FFFFCC00009933000099
      3300FF990000FFCC3300FFCC3300FFCC3300FF99000000660000CCFFCC0033CC
      330000993300006600000066000000000000CCCCCC00FFFFFF00999999009999
      9900CCCCCC00E5E5E500E5E5E500E5E5E500CCCCCC0099999900E5E5E500CCCC
      CC00999999009999990099999900666666000000000000000000000000000000
      00000000FF000000CC000000CC000000CC000000CC000000CC00000099000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B2B2B2009999990099999900999999009999990099999900808080000000
      000000000000000000000000000000000000FF663300FFFFCC00FFFF3300FF99
      000000663300FF663300FF990000FFCC3300FF990000FF663300FF6633000066
      000033CC3300009933000066000000000000CCCCCC00FFFFFF00E5E5E500CCCC
      CC0099999900CCCCCC00CCCCCC00E5E5E500CCCCCC00CCCCCC00CCCCCC009999
      9900CCCCCC009999990099999900666666000000000000000000000000000000
      FF000000CC000000CC000000CC00000099000000CC000000CC000000CC000000
      990000000000000000000000000000000000000000000000000000000000B2B2
      B200999999009999990099999900808080009999990099999900999999008080
      80000000000000000000000000000000000000000000FF663300006633000066
      330033CC330000663300FF663300FFCC3300FFCC3300FF990000FF663300FF66
      33000066000000660000000000000000000000000000CCCCCC00999999009999
      9900CCCCCC0099999900CCCCCC00E5E5E500E5E5E500CCCCCC00CCCCCC00CCCC
      CC009999990099999900666666000000000000000000000000000000FF000000
      CC000000CC000000CC0000009900000000000000FF000000CC000000CC000000
      CC00000099000000000000000000000000000000000000000000B2B2B2009999
      990099999900999999008080800000000000B2B2B20099999900999999009999
      9900808080000000000000000000000000000000000000993300FFFFFF00CCFF
      CC0033CC330033CC330000663300FF990000FF990000FFCC3300FF663300FF66
      3300FF663300FF66330000000000000000000000000099999900FFFFFF00E5E5
      E500CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00E5E5E500CCCCCC00CCCC
      CC00CCCCCC00CCCCCC006666660000000000000000000000FF000000CC000000
      CC000000CC00000099000000000000000000000000000000FF000000CC000000
      CC000000CC0000009900000000000000000000000000B2B2B200999999009999
      99009999990080808000000000000000000000000000B2B2B200999999009999
      990099999900808080000000000000000000000000000000000000993300FFFF
      FF00CCFFCC0033CC330033CC33000066330000663300FF990000FF663300FF66
      3300FF663300800000000000000000000000000000000000000099999900FFFF
      FF00E5E5E500CCCCCC00CCCCCC009999990099999900CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00666666000000000000000000000000000000FF000000FF000000
      FF000000FF0000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF00000000000000000000000000B2B2B200B2B2B200B2B2
      B200B2B2B2000000000000000000000000000000000000000000B2B2B200B2B2
      B200B2B2B200B2B2B20000000000000000000000000000000000000000000099
      3300FFFFFF00CCFFCC00CCFFCC0033CC33000099330000663300FF663300FF66
      3300FF6633000000000000000000000000000000000000000000000000009999
      9900FFFFFF00E5E5E500E5E5E500CCCCCC009999990099999900CCCCCC00CCCC
      CC00CCCCCC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000099330000993300FFFFFF0033CC330033CC330000993300FF663300FF66
      3300000000000000000000000000000000000000000000000000000000000000
      00009999990099999900FFFFFF00CCCCCC00CCCCCC0099999900CCCCCC00CCCC
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000993300009933000099330000993300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900999999009999990099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000993300009933
      0000993300000000000000000000000000000000000000000000993300009933
      0000993300009933000000000000000000000000000099999900999999009999
      9900999999000000000000000000000000000000000000000000999999009999
      9900999999009999990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000CC660000CC66
      0000CC6600009933000000000000000000000000000099330000CC660000CC66
      0000CC6600009933000000000000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099330000CC66
      0000CC660000CC660000993300000000000099330000CC660000CC660000CC66
      000099330000000000000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00999999000000000099999900CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC66000099330000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000000000000993300009933
      0000993300009933000099330000993300009933000099330000993300009933
      0000993300009933000000000000000000000000000000000000999999009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900999999009999990000000000000000000000000000000000000000000000
      000099330000CC660000CC660000CC660000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00999999000000
      000000000000000000000000000000000000000000000000000099330000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000CC660000993300000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      000000000000000000000000000000000000000000000000000099330000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000CC660000993300000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000000000000000000000000
      000099330000CC660000CC660000CC660000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000993300009933
      0000993300009933000099330000993300009933000099330000993300009933
      0000993300009933000000000000000000000000000000000000999999009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900999999009999990000000000000000000000000000000000000000009933
      0000CC660000CC660000CC66000099330000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099330000CC66
      0000CC660000CC660000993300000000000099330000CC660000CC660000CC66
      000099330000000000000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00999999000000000099999900CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000CC660000CC66
      0000CC6600009933000000000000000000000000000099330000CC660000CC66
      0000CC6600009933000000000000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000993300009933
      0000993300000000000000000000000000000000000000000000993300009933
      0000993300009933000000000000000000000000000099999900999999009999
      9900999999000000000000000000000000000000000000000000999999009999
      9900999999009999990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009933000099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000993300000000000000000000993300009933000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009999
      9900999999000000000000000000999999009999990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000993300000000000099330000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC00999999000000000099999900CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC6600009933000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC009999990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC6600009933000099330000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC009999990099999900CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000000000009933
      00009933000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000009999
      99009999990099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000099330000993300009933
      0000CC660000CC660000CC66000099330000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000099999900999999009999
      9900CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000099330000CC660000CC66
      0000CC660000CC660000CC660000CC66000099330000CC660000CC660000CC66
      0000993300000000000000000000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000099330000CC660000CC66
      0000CC660000CC660000CC660000CC660000CC66000099330000CC660000CC66
      0000CC6600009933000000000000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000099330000CC660000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC66000099330000CC66
      0000CC660000CC66000099330000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC0099999900CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000099330000CC660000CC66
      0000CC660000CC660000CC660000CC660000CC66000099330000CC660000CC66
      0000CC6600009933000000000000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000099330000CC660000CC66
      0000CC660000CC660000CC660000CC66000099330000CC660000CC660000CC66
      0000993300000000000000000000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000009933
      00009933000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000009999
      99009999990099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000099330000993300009933
      0000CC660000CC660000CC66000099330000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000099999900999999009999
      9900CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC6600009933000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC009999990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC6600009933000099330000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC009999990099999900CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000993300000000000099330000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC00999999000000000099999900CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009933000099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009999990099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000993300000000000000000000993300009933000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009999
      9900999999000000000000000000999999009999990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000993300009933000000000000000000009933
      0000993300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000999999009999990000000000000000009999
      9900999999000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900999999000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000CC660000993300000000000099330000CC66
      0000993300000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC00999999000000000099999900CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099330000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099999900CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC6600009933000099330000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC009999990099999900CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      000000000000000000000000000099330000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000099999900CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099330000CC660000CC660000CC66000099330000CC660000CC660000CC66
      0000993300009933000099330000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00CCCC
      CC00999999009999990099999900000000000000000000000000000000000000
      0000000000000000000099330000CC660000CC660000CC660000993300009933
      0000993300000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC00CCCCCC00CCCCCC00999999009999
      9900999999000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC66000099330000CC660000CC660000CC660000CC66
      0000CC660000CC66000099330000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC660000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC0099999900000000000000000000000000000000000000000099330000CC66
      0000CC660000CC66000099330000CC660000CC660000CC660000CC660000CC66
      0000CC660000CC6600009933000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      000099330000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000099330000CC660000CC66
      0000CC66000099330000CC660000CC660000CC660000CC660000CC660000CC66
      0000CC660000CC66000099330000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC0099999900000000000000000000000000000000000000000099330000CC66
      0000CC660000CC66000099330000CC660000CC660000CC660000CC660000CC66
      0000CC660000CC6600009933000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      000099330000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC66000099330000CC660000CC660000CC660000CC66
      0000CC660000CC66000099330000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC660000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      000099330000CC660000CC660000CC66000099330000CC660000CC660000CC66
      0000993300009933000099330000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00CCCC
      CC00999999009999990099999900000000000000000000000000000000000000
      0000000000000000000099330000CC660000CC660000CC660000993300009933
      0000993300000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC00CCCCCC00CCCCCC00999999009999
      9900999999000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC6600009933000099330000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC009999990099999900CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      000000000000000000000000000099330000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000099999900CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000CC660000993300000000000099330000CC66
      0000993300000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC00999999000000000099999900CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099330000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099999900CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000993300009933000000000000000000009933
      0000993300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000999999009999990000000000000000009999
      9900999999000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900999999000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CC66
      3300CC663300CC663300CC663300CC663300CC663300CC663300CC663300CC66
      3300CC6633000000000000000000000000000000000000000000000000009900
      0000990000009900000099000000990000009900000099000000990000009900
      0000990000000000000000000000000000000000000000000000000000009900
      6600990066009900660099006600990066009900660099006600990066009900
      6600990066000000000000000000000000000000000000000000000000009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900999999000000000000000000000000000000000000000000CC663300FF99
      6600FF996600FF996600FF996600FF996600CC663300FF996600CC663300CC66
      3300CC663300CC6633000000000000000000000000000000000099000000CC00
      0000CC000000CC000000CC000000CC00000099000000CC000000990000009900
      0000990000009900000000000000000000000000000000000000990066009933
      6600993366009933660099336600993366009900660099336600990066009900
      660099006600990066000000000000000000000000000000000099999900B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B20099999900B2B2B200999999009999
      9900999999009999990000000000000000000000000000000000CC663300FFCC
      9900FF996600FF996600FF996600FF996600FF996600CC663300FF996600CC66
      3300CC663300CC6633000000000000000000000000000000000099000000FF00
      0000CC000000CC000000CC000000CC000000CC00000099000000CC0000009900
      000099000000990000000000000000000000000000000000000099006600CC66
      9900993366009933660099336600993366009933660099006600993366009900
      660099006600990066000000000000000000000000000000000099999900CCCC
      CC00B2B2B200B2B2B200B2B2B200B2B2B200B2B2B20099999900B2B2B2009999
      9900999999009999990000000000000000000000000000000000CC663300FF99
      6600FFCC9900FF996600FF996600FF996600FF996600FF996600CC663300FF99
      6600CC663300CC6633000000000000000000000000000000000099000000CC00
      0000FF000000CC000000CC000000CC000000CC000000CC00000099000000CC00
      0000990000009900000000000000000000000000000000000000990066009933
      6600CC6699009933660099336600993366009933660099336600990066009933
      660099006600990066000000000000000000000000000000000099999900B2B2
      B200CCCCCC00B2B2B200B2B2B200B2B2B200B2B2B200B2B2B20099999900B2B2
      B200999999009999990000000000000000000000000000000000CC663300FFCC
      9900FF996600FFCC9900FF996600FF996600FF996600FF996600FF996600CC66
      3300FF996600CC6633000000000000000000000000000000000099000000FF00
      0000CC000000FF000000CC000000CC000000CC000000CC000000CC0000009900
      0000CC000000990000000000000000000000000000000000000099006600CC66
      990099336600CC66990099336600993366009933660099336600993366009900
      660099336600990066000000000000000000000000000000000099999900CCCC
      CC00B2B2B200CCCCCC00B2B2B200B2B2B200B2B2B200B2B2B200B2B2B2009999
      9900B2B2B2009999990000000000000000000000000000000000CC663300FFCC
      9900FFCC9900FF996600FFCC9900FF996600FF996600FF996600FF996600FF99
      6600CC663300CC6633000000000000000000000000000000000099000000FF00
      0000FF000000CC000000FF000000CC000000CC000000CC000000CC000000CC00
      000099000000990000000000000000000000000000000000000099006600CC66
      9900CC66990099336600CC669900993366009933660099336600993366009933
      660099006600990066000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00B2B2B200CCCCCC00B2B2B200B2B2B200B2B2B200B2B2B200B2B2
      B200999999009999990000000000000000000000000000000000CC663300FFFF
      CC00FFCC9900FFCC9900FF996600FFCC9900FF996600FF996600FF996600FF99
      6600FF996600CC6633000000000000000000000000000000000099000000FF99
      6600FF000000FF000000CC000000FF000000CC000000CC000000CC000000CC00
      0000CC000000990000000000000000000000000000000000000099006600FF99
      CC00CC669900CC66990099336600CC6699009933660099336600993366009933
      660099336600990066000000000000000000000000000000000099999900E5E5
      E500CCCCCC00CCCCCC00B2B2B200CCCCCC00B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B2009999990000000000000000000000000000000000CC663300FFFF
      CC00FFFFCC00FFCC9900FFCC9900FF996600FFCC9900FF996600FF996600FF99
      6600FF996600CC6633000000000000000000000000000000000099000000FF99
      6600FF996600FF000000FF000000CC000000FF000000CC000000CC000000CC00
      0000CC000000990000000000000000000000000000000000000099006600FF99
      CC00FF99CC00CC669900CC66990099336600CC66990099336600993366009933
      660099336600990066000000000000000000000000000000000099999900E5E5
      E500E5E5E500CCCCCC00CCCCCC00B2B2B200CCCCCC00B2B2B200B2B2B200B2B2
      B200B2B2B200999999000000000000000000000000000000000000000000CC66
      3300CC663300CC663300CC663300CC663300CC663300CC663300CC663300CC66
      3300CC6633000000000000000000000000000000000000000000000000009900
      0000990000009900000099000000990000009900000099000000990000009900
      0000990000000000000000000000000000000000000000000000000000009900
      6600990066009900660099006600990066009900660099006600990066009900
      6600990066000000000000000000000000000000000000000000000000009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900999999000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      9900000099000000990000009900000099000000990000009900000099000000
      9900000099000000000000000000000000000000000000000000000000000066
      CC000066CC000066CC000066CC000066CC000066CC000066CC000066CC000066
      CC000066CC000000000000000000000000000000000000000000000000000099
      9900009999000099990000999900009999000099990000999900009999000099
      9900009999000000000000000000000000000000000000000000000000000099
      0000009900000099000000990000009900000099000000990000009900000099
      0000009900000000000000000000000000000000000000000000000099000000
      CC000000CC000000CC000000CC000000CC00000099000000CC00000099000000
      99000000990000009900000000000000000000000000000000000066CC000099
      FF000099FF000099FF000099FF000099FF000066CC000099FF000066CC000066
      CC000066CC000066CC00000000000000000000000000000000000099990000CC
      CC0000CCCC0000CCCC0000CCCC0000CCCC000099990000CCCC00009999000099
      99000099990000999900000000000000000000000000000000000099000000CC
      000000CC000000CC000000CC000000CC00000099000000CC0000009900000099
      0000009900000099000000000000000000000000000000000000000099000000
      FF000000CC000000CC000000CC000000CC000000CC00000099000000CC000000
      99000000990000009900000000000000000000000000000000000066CC0000CC
      FF000099FF000099FF000099FF000099FF000099FF000066CC000099FF000066
      CC000066CC000066CC00000000000000000000000000000000000099990000FF
      FF0000CCCC0000CCCC0000CCCC0000CCCC0000CCCC000099990000CCCC000099
      99000099990000999900000000000000000000000000000000000099000000FF
      000000CC000000CC000000CC000000CC000000CC00000099000000CC00000099
      0000009900000099000000000000000000000000000000000000000099000000
      CC000000FF000000CC000000CC000000CC000000CC000000CC00000099000000
      CC000000990000009900000000000000000000000000000000000066CC000099
      FF0000CCFF000099FF000099FF000099FF000099FF000099FF000066CC000099
      FF000066CC000066CC00000000000000000000000000000000000099990000CC
      CC0000FFFF0000CCCC0000CCCC0000CCCC0000CCCC0000CCCC000099990000CC
      CC000099990000999900000000000000000000000000000000000099000000CC
      000000FF000000CC000000CC000000CC000000CC000000CC00000099000000CC
      0000009900000099000000000000000000000000000000000000000099000000
      FF000000CC000000FF000000CC000000CC000000CC000000CC000000CC000000
      99000000CC0000009900000000000000000000000000000000000066CC0000CC
      FF000099FF0000CCFF000099FF000099FF000099FF000099FF000099FF000066
      CC000099FF000066CC00000000000000000000000000000000000099990000FF
      FF0000CCCC0000FFFF0000CCCC0000CCCC0000CCCC0000CCCC0000CCCC000099
      990000CCCC0000999900000000000000000000000000000000000099000000FF
      000000CC000000FF000000CC000000CC000000CC000000CC000000CC00000099
      000000CC00000099000000000000000000000000000000000000000099000000
      FF000000FF000000CC000000FF000000CC000000CC000000CC000000CC000000
      CC000000990000009900000000000000000000000000000000000066CC0000CC
      FF0000CCFF000099FF0000CCFF000099FF000099FF000099FF000099FF000099
      FF000066CC000066CC00000000000000000000000000000000000099990000FF
      FF0000FFFF0000CCCC0000FFFF0000CCCC0000CCCC0000CCCC0000CCCC0000CC
      CC000099990000999900000000000000000000000000000000000099000000FF
      000000FF000000CC000000FF000000CC000000CC000000CC000000CC000000CC
      0000009900000099000000000000000000000000000000000000000099009999
      FF000000FF000000FF000000CC000000FF000000CC000000CC000000CC000000
      CC000000CC0000009900000000000000000000000000000000000066CC0099CC
      FF0000CCFF0000CCFF000099FF0000CCFF000099FF000099FF000099FF000099
      FF000099FF000066CC000000000000000000000000000000000000999900FFFF
      FF0000FFFF0000FFFF0000CCCC0000FFFF0000CCCC0000CCCC0000CCCC0000CC
      CC0000CCCC0000999900000000000000000000000000000000000099000099FF
      990000FF000000FF000000CC000000FF000000CC000000CC000000CC000000CC
      000000CC00000099000000000000000000000000000000000000000099009999
      FF009999FF000000FF000000FF000000CC000000FF000000CC000000CC000000
      CC000000CC0000009900000000000000000000000000000000000066CC0099CC
      FF0099CCFF0000CCFF0000CCFF000099FF0000CCFF000099FF000099FF000099
      FF000099FF000066CC00000000000000000000000000000000000099990099FF
      FF00FFFFFF0000FFFF0000FFFF0000CCCC0000FFFF0000CCCC0000CCCC0000CC
      CC0000CCCC0000999900000000000000000000000000000000000099000099FF
      990099FF990000FF000000FF000000CC000000FF000000CC000000CC000000CC
      000000CC00000099000000000000000000000000000000000000000000000000
      9900000099000000990000009900000099000000990000009900000099000000
      9900000099000000000000000000000000000000000000000000000000000066
      CC000066CC000066CC000066CC000066CC000066CC000066CC000066CC000066
      CC000066CC000000000000000000000000000000000000000000000000000099
      9900009999000099990000999900009999000099990000999900009999000099
      9900009999000000000000000000000000000000000000000000000000000099
      0000009900000099000000990000009900000099000000990000009900000099
      0000009900000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF0000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF0080808000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000066CCFF003399CC003399CC0066CCFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B2B2B2009999990099999900B2B2B200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000000000003399CC003399
      CC003399CC003399CC003399CC0066CCFF0066CCFF003399CC003399CC003399
      CC003399CC003399CC0000000000000000000000000000000000999999009999
      9900999999009999990099999900B2B2B200B2B2B20099999900999999009999
      9900999999009999990000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000FFFFFF008080800080808000FFFFFF008080800080808000000000000000
      00000000000000000000000000000000000000000000000000003399CC0099FF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0066CCFF0066CC
      FF0066CCFF003399CC000000000000000000000000000000000099999900CCCC
      CC00FFFFFF00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00B2B2B200B2B2
      B200B2B2B2009999990000000000000000000000000080808000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      0000000000000000000000000000666699000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000000000000000
      0000000000000000000000000000999999000000000000000000000000003399
      CC0099FFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0066CC
      FF003399CC000000000000000000000000000000000000000000000000009999
      9900CCCCCC00FFFFFF00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00B2B2
      B2009999990000000000000000000000000080808000FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000C0C0C0000000000000000000000000000000
      00000000000000000000666699003399CC0080808000FFFFFF00FFFFFF008080
      8000FFFFFF008080800080808000C0C0C0008080800080808000808080000000
      0000000000000000000099999900CCCCCC000000000000000000000000000000
      00003399CC0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF003399
      CC00000000000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      99000000000000000000000000000000000080808000FFFFFF00000000000000
      0000FFFFFF0080808000C0C0C000FFFFFF008080800000000000FFFFFF008080
      800000000000666699003399CC0066CCFF0080808000FFFFFF00808080008080
      8000FFFFFF0080808000C0C0C000FFFFFF008080800080808000FFFFFF008080
      80000000000099999900CCCCCC00FFFFFF000000000000000000000000000000
      00003399CC0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF003399
      CC00000000000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000008080800000000000000000000000
      0000808080000000000000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00666699003399CC0066CCFF00000000008080800080808000808080008080
      8000808080008080800080808000FFFFFF0080808000FFFFFF00FFFFFF00FFFF
      FF0099999900CCCCCC00FFFFFF00000000000000000000000000000000000000
      00003399CC0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF003399
      CC00000000000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000FFFFFF006666
      99003399CC0066CCFF0000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000FFFFFF009999
      9900CCCCCC00FFFFFF0000000000000000000000000000000000000000000000
      00003399CC00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF003399
      CC00000000000000000000000000000000000000000000000000000000000000
      000099999900FFFFFF00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000000000000C0C0C000C0C0
      C0000000000000000000FFFFFF00000000000000000000000000666699003399
      CC0066CCFF000000000000000000000000000000000080808000C0C0C000C0C0
      C0008080800080808000FFFFFF0080808000808080008080800099999900CCCC
      CC00FFFFFF000000000000000000000000000000000000000000000000000000
      000066CCFF0066CCFF00FFFFFF0000FFFF0000FFFF0000FFFF0066CCFF0066CC
      FF00000000000000000000000000000000000000000000000000000000000000
      0000B2B2B200B2B2B200FFFFFF00CCCCCC00CCCCCC00CCCCCC00B2B2B200B2B2
      B200000000000000000000000000000000000000000080808000C0C0C000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF0000000000666699003399CC0066CC
      FF00000000000000000000000000000000000000000080808000C0C0C000FFFF
      FF0080808000FFFFFF00FFFFFF00FFFFFF008080800099999900CCCCCC00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000003399CC0099FFFF00FFFFFF0000FFFF0000FFFF003399CC000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00FFFFFF00CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000808080008080
      80000000000000000000FFFFFF00FFFFFF00666699003399CC0066CCFF000000
      0000000000000000000000000000000000000000000000000000808080008080
      80008080800080808000FFFFFF00FFFFFF0099999900CCCCCC00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003399CC003399CC003399CC003399CC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900999999009999990099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000666699003399CC0066CCFF00000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800080808000808080008080800099999900CCCCCC00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000666699003399CC0066CCFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800099999900CCCCCC00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000666699003399CC0066CCFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066CCFF003399CC003399
      CC003399CC003399CC003399CC003399CC003399CC003399CC003399CC003399
      CC003399CC0066CCFF00000000000000000000000000B2B2B200999999009999
      9900999999009999990099999900999999009999990099999900999999009999
      990099999900B2B2B20000000000000000000000000000000000000000000000
      00009999CC0000008000000080000000800000008000000080009999CC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CCCCCC009999990099999900999999009999990099999900CCCCCC000000
      00000000000000000000000000000000000066CCFF003399CC0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF003399CC0066CCFF0000000000B2B2B20099999900CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC0099999900B2B2B200000000000000000000000000000000000000
      80000000CC000000FF000000FF000000FF000000FF000000FF000000CC000000
      8000000000000000000000000000000000000000000000000000000000009999
      9900B2B2B200CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00B2B2B2009999
      9900000000000000000000000000000000003399CC0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF003399CC00003366003399CC0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF003399CC000000000099999900CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00999999006666660099999900CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000000080000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000008000000000000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000003399CC0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000336600003366000033660000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF003399CC000000000099999900CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00666666006666660066666600CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00999999000000000000000000000080000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000800000000000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000003399CC0066CCFF0000FFFF0000FF
      FF0000FFFF0000FFFF003399CC00003366003399CC0000FFFF0000FFFF0000FF
      FF0000FFFF0066CCFF003399CC000000000099999900B2B2B200CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00999999006666660099999900CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00B2B2B20099999900000000009999CC000000CC000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFFFF000000
      FF000000FF000000CC009999CC0000000000CCCCCC00B2B2B200CCCCCC00CCCC
      CC00FFFFFF00FFFFFF00CCCCCC00CCCCCC00CCCCCC00FFFFFF00FFFFFF00CCCC
      CC00CCCCCC00B2B2B200CCCCCC000000000066CCFF003399CC0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF003399CC0066CCFF0000000000B2B2B20099999900CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC0099999900B2B2B20000000000000080000000FF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF00000080000000000099999900CCCCCC00CCCCCC00CCCC
      CC00FFFFFF00FFFFFF00FFFFFF00CCCCCC00FFFFFF00FFFFFF00FFFFFF00CCCC
      CC00CCCCCC00CCCCCC009999990000000000000000003399CC0066CCFF0000FF
      FF0000FFFF0000FFFF0066CCFF000033660066CCFF0000FFFF0000FFFF0000FF
      FF0066CCFF003399CC0000000000000000000000000099999900B2B2B200CCCC
      CC00CCCCCC00CCCCCC00B2B2B20066666600B2B2B200CCCCCC00CCCCCC00CCCC
      CC00B2B2B200999999000000000000000000000080000000FF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF00000080000000000099999900CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000066CCFF003399CC0000FF
      FF0000FFFF0000FFFF003399CC00003366003399CC0000FFFF0000FFFF0000FF
      FF003399CC0066CCFF00000000000000000000000000B2B2B20099999900CCCC
      CC00CCCCCC00CCCCCC00999999006666660099999900CCCCCC00CCCCCC00CCCC
      CC0099999900B2B2B2000000000000000000000080000000FF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF00000080000000000099999900CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00FFFFFF00FFFFFF00FFFFFF00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00999999000000000000000000000000003399CC0066CC
      FF0000FFFF0000FFFF0033669900003366003366990000FFFF0000FFFF0066CC
      FF003399CC00000000000000000000000000000000000000000099999900B2B2
      B200CCCCCC00CCCCCC00808080006666660080808000CCCCCC00CCCCCC00B2B2
      B20099999900000000000000000000000000000080000000FF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF00000080000000000099999900CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC009999990000000000000000000000000066CCFF003399
      CC0000FFFF0000FFFF0000336600003366000033660000FFFF0000FFFF003399
      CC0066CCFF000000000000000000000000000000000000000000B2B2B2009999
      9900CCCCCC00CCCCCC00666666006666660066666600CCCCCC00CCCCCC009999
      9900B2B2B200000000000000000000000000000080000000FF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF00000080000000000099999900CCCCCC00CCCCCC00CCCC
      CC00FFFFFF00FFFFFF00FFFFFF00CCCCCC00FFFFFF00FFFFFF00FFFFFF00CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000000000003399
      CC0066CCFF0000FFFF0000336600003366000033660000FFFF0066CCFF003399
      CC00000000000000000000000000000000000000000000000000000000009999
      9900B2B2B200CCCCCC00666666006666660066666600CCCCCC00B2B2B2009999
      9900000000000000000000000000000000009999CC000000CC000000FF000000
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFFFF000000
      FF000000FF000000CC009999CC0000000000CCCCCC00B2B2B200CCCCCC00CCCC
      CC00FFFFFF00FFFFFF00CCCCCC00CCCCCC00CCCCCC00FFFFFF00FFFFFF00CCCC
      CC00CCCCCC00B2B2B200CCCCCC000000000000000000000000000000000066CC
      FF003399CC0000FFFF003399CC00003366003399CC0000FFFF003399CC0066CC
      FF0000000000000000000000000000000000000000000000000000000000B2B2
      B20099999900CCCCCC00999999006666660099999900CCCCCC0099999900B2B2
      B2000000000000000000000000000000000000000000000080000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000800000000000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000000000000000000000000
      00003399CC0066CCFF0000FFFF0000FFFF0000FFFF0066CCFF003399CC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099999900B2B2B200CCCCCC00CCCCCC00CCCCCC00B2B2B200999999000000
      0000000000000000000000000000000000000000000000000000000080000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000008000000000000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      000066CCFF003399CC003399CC003399CC003399CC003399CC0066CCFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B2B2B2009999990099999900999999009999990099999900B2B2B2000000
      0000000000000000000000000000000000000000000000000000000000000000
      80000000CC000000FF000000FF000000FF000000FF000000FF000000CC000000
      8000000000000000000000000000000000000000000000000000000000009999
      9900B2B2B200CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00B2B2B2009999
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000066CCFF0066CCFF0066CCFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B2B2B200B2B2B200B2B2B20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009999CC0000008000000080000000800000008000000080009999CC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CCCCCC009999990099999900999999009999990099999900CCCCCC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009933000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009999990099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000099330000FFFFFF0099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000999999000000000099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000FFFFFF00FFFFFF0099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900000000000000000099999900000000000000
      000000000000000000000000000000000000000000000000FF00000099000000
      99000000990000000000000000000000000000000000000000000000FF000000
      99000000990000009900000000000000000000000000B2B2B200808080008080
      8000808080000000000000000000000000000000000000000000B2B2B2008080
      800080808000808080000000000000000000000000000000000000000000CC99
      6600993300009933000099330000FFFFFF00FFFFFF009933000099330000CC99
      660000000000000000000000000000000000000000000000000000000000B2B2
      B20099999900999999009999990000000000000000009999990099999900B2B2
      B20000000000000000000000000000000000000000000000FF000000CC000000
      CC000000CC00000099000000000000000000000000000000FF000000CC000000
      CC000000CC0000009900000000000000000000000000B2B2B200999999009999
      99009999990080808000000000000000000000000000B2B2B200999999009999
      990099999900808080000000000000000000000000000000000099330000CC99
      6600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CC99
      660099330000000000000000000000000000000000000000000099999900B2B2
      B20000000000000000000000000000000000000000000000000000000000B2B2
      B2009999990000000000000000000000000000000000000000000000FF000000
      CC000000CC000000CC0000009900000000000000FF000000CC000000CC000000
      CC00000099000000000000000000000000000000000000000000B2B2B2009999
      990099999900999999008080800000000000B2B2B20099999900999999009999
      9900808080000000000000000000000000000000000099330000FFFFFF00FFFF
      FF00FFFFFF009933000099330000993300009933000099330000FFFFFF00FFFF
      FF00FFFFFF009933000000000000000000000000000099999900000000000000
      0000000000009999990099999900999999009999990099999900000000000000
      0000000000009999990000000000000000000000000000000000000000000000
      FF000000CC000000CC000000CC00000099000000CC000000CC000000CC000000
      990000000000000000000000000000000000000000000000000000000000B2B2
      B200999999009999990099999900808080009999990099999900999999008080
      800000000000000000000000000000000000CC996600CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00993300009933000099330000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CC996600CC99660000000000B2B2B200B2B2B200000000000000
      0000000000000000000099999900999999009999990000000000000000000000
      000000000000B2B2B200B2B2B200000000000000000000000000000000000000
      00000000FF000000CC000000CC000000CC000000CC000000CC00000099000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B2B2B2009999990099999900999999009999990099999900808080000000
      00000000000000000000000000000000000099330000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00993300009933000099330000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0099330000000000009999990000000000000000000000
      0000000000000000000099999900999999009999990000000000000000000000
      0000000000000000000099999900000000000000000000000000000000000000
      0000000000000000FF000000CC000000CC000000CC0000009900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B2B2B20099999900999999009999990080808000000000000000
      00000000000000000000000000000000000099330000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00993300009933000099330000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0099330000000000009999990000000000000000000000
      0000000000000000000099999900999999009999990000000000000000000000
      0000000000000000000099999900000000000000000000000000000000000000
      00000000FF000000CC000000CC000000CC000000CC000000CC00000099000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B2B2B2009999990099999900999999009999990099999900808080000000
      00000000000000000000000000000000000099330000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0099330000993300009933000099330000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0099330000000000009999990000000000000000000000
      0000000000009999990099999900999999009999990000000000000000000000
      0000000000000000000099999900000000000000000000000000000000000000
      FF000000CC000000CC000000CC00000099000000CC000000CC000000CC000000
      990000000000000000000000000000000000000000000000000000000000B2B2
      B200999999009999990099999900808080009999990099999900999999008080
      80000000000000000000000000000000000099330000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0099330000000000009999990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000999999000000000000000000000000000000FF000000
      CC000000CC000000CC0000009900000000000000FF000000CC000000CC000000
      CC00000099000000000000000000000000000000000000000000B2B2B2009999
      990099999900999999008080800000000000B2B2B20099999900999999009999
      99008080800000000000000000000000000099330000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CC99660099330000CC996600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0099330000000000009999990000000000000000000000
      00000000000000000000B2B2B20099999900B2B2B20000000000000000000000
      000000000000000000009999990000000000000000000000FF000000CC000000
      CC000000CC00000099000000000000000000000000000000FF000000CC000000
      CC000000CC0000009900000000000000000000000000B2B2B200999999009999
      99009999990080808000000000000000000000000000B2B2B200999999009999
      990099999900808080000000000000000000CC996600CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00993300009933000099330000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CC996600CC99660000000000B2B2B200B2B2B200000000000000
      0000000000000000000099999900999999009999990000000000000000000000
      000000000000B2B2B200B2B2B20000000000000000000000FF000000FF000000
      FF000000FF0000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF00000000000000000000000000B2B2B200B2B2B200B2B2
      B200B2B2B2000000000000000000000000000000000000000000B2B2B200B2B2
      B200B2B2B200B2B2B20000000000000000000000000099330000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CC99660099330000CC996600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009933000000000000000000000000000099999900000000000000
      00000000000000000000B2B2B20099999900B2B2B20000000000000000000000
      0000000000009999990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099330000CC99
      6600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CC99
      660099330000000000000000000000000000000000000000000099999900B2B2
      B20000000000000000000000000000000000000000000000000000000000B2B2
      B200999999000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CC99
      660099330000993300009933000099330000993300009933000099330000CC99
      660000000000000000000000000000000000000000000000000000000000B2B2
      B20099999900999999009999990099999900999999009999990099999900B2B2
      B200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7818300A4787400A478
      7400A4787400A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400986B66000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009090900000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B7818300FDEFD900F6E3
      CB00F5DFC200F4DBBA00F2D7B200F1D4A900F1D0A200EECC9900EECC9700EECC
      9700F3D19900986B66000000000000000000000000009C9C9C00EBEBEB00E0E0
      E000DBDBDB00D7D7D700D2D2D200CDCDCD00C9C9C900C3C3C300C2C2C200C2C2
      C200C6C6C6009090900000000000000000000000000000000000000000000000
      000000CC00000066000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B2B2B2008080800000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B4817600FEF3E300F8E7
      D300F5E3CB00F5DFC300CFCF9F00018A0200018A0200CCC68B00EECC9A00EECC
      9700F3D19900986B660000000000000000000000000095959500F0F0F000E5E5
      E500E0E0E000DCDCDC00C6C6C6009595950095959500C0C0C000C4C4C400C2C2
      C200C6C6C60090909000000000000000000000000000000000000000000000CC
      0000009900000099000000660000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B2B2
      B200999999009999990080808000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B4817600FFF7EB00F9EB
      DA00018A0200D1D6AC00018A0200D0CF9E00CECC9800018A0200CCC68900EFCD
      9900F3D19800986B660000000000000000000000000095959500F5F5F500E9E9
      E90095959500CCCCCC0095959500C6C6C600C6C6C60095959500C0C0C000C4C4
      C400C5C5C500909090000000000000000000000000000000000000CC00000099
      0000009900000099000000990000006600000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B2B2B2009999
      9900999999009999990099999900808080000000000000000000000000000000
      00000000000000000000000000000000000000000000BA8E8500FFFCF400FAEF
      E400018A0200018A0200D1D5AD00F5DFC200F4DBBB00CDCC9800018A0200F0D0
      A100F3D29B00986B66000000000000000000000000009F9F9F00F9F9F900EFEF
      EF009595950095959500CCCCCC00DBDBDB00D7D7D700C0C0C00095959500C8C8
      C800C7C7C7009090900000000000000000000000000000CC0000009900000099
      0000009900000099000000990000009900000066000000000000000000000000
      00000000000000000000000000000000000000000000B2B2B200999999009999
      9900999999009999990099999900999999008080800000000000000000000000
      00000000000000000000000000000000000000000000BA8E8500FFFFFD00FBF4
      EC00018A0200018A0200018A0200F5E3C900F5DFC200F4DBBA00F2D7B100F0D4
      A900F5D5A300986B66000000000000000000000000009F9F9F00FEFEFE00F3F3
      F300959595009595950095959500DFDFDF00DBDBDB00D7D7D700D1D1D100CCCC
      CC00CCCCCC009090900000000000000000000000000000CC0000009900000099
      00000066000000CC000000990000009900000099000000660000000000000000
      00000000000000000000000000000000000000000000B2B2B200999999009999
      990080808000B2B2B20099999900999999009999990080808000000000000000
      00000000000000000000000000000000000000000000CB9A8200FFFFFF00FEF9
      F500FBF3EC00FAEFE200F9EADA00F8E7D200018A0200018A0200018A0200F2D8
      B200F6D9AC00986B6600000000000000000000000000A6A6A600FFFFFF00F9F9
      F900F3F3F300EEEEEE00E9E9E900E5E5E500959595009595950095959500D2D2
      D200D1D1D1009090900000000000000000000000000000CC0000009900000066
      0000000000000000000000CC0000009900000099000000990000006600000000
      00000000000000000000000000000000000000000000B2B2B200999999008080
      80000000000000000000B2B2B200999999009999990099999900808080000000
      00000000000000000000000000000000000000000000CB9A8200FFFFFF00FFFE
      FD00018A0200D6E3C900F9EFE300F8EADA00D2D9B300018A0200018A0200F4DB
      B900F8DDB400986B6600000000000000000000000000A6A6A600FFFFFF00FEFE
      FE0095959500D6D6D600EEEEEE00E9E9E900C9C9C9009595950095959500D6D6
      D600D6D6D6009090900000000000000000000000000000CC0000006600000000
      000000000000000000000000000000CC00000099000000990000009900000066
      00000000000000000000000000000000000000000000B2B2B200808080000000
      0000000000000000000000000000B2B2B2009999990099999900999999008080
      80000000000000000000000000000000000000000000DCA88700FFFFFF00FFFF
      FF00D9EDD800018A0200D6E3C800D5E0C100018A0200D3D8B200018A0200F7E1
      C200F0DAB700986B6600000000000000000000000000B1B1B100FFFFFF00FFFF
      FF00DCDCDC0095959500D6D6D600CECECE0095959500C9C9C90095959500DCDC
      DC00D3D3D3009090900000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000CC000000990000009900000099
      0000006600000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B2B2B20099999900999999009999
      99008080800000000000000000000000000000000000DCA88700FFFFFF00FFFF
      FF00FFFFFF00D9EDD800018A0200018A0200D5DFC100FAEDDC00FCEFD900E6D9
      C400C6BCA900986B6600000000000000000000000000B1B1B100FFFFFF00FFFF
      FF00FFFFFF00DCDCDC009595950095959500CECECE00EBEBEB00EAEAEA00D5D5
      D500B7B7B7009090900000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000CC0000009900000099
      0000009900000066000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2B2B200999999009999
      99009999990080808000000000000000000000000000E3B18E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFD00FDF8F300FDF6EC00F1E1D500B4817600B481
      7600B4817600B4817600000000000000000000000000B8B8B800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00F8F8F800F4F4F400E3E3E300A4A4A400A4A4
      A400A4A4A400A4A4A40000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000CC00000099
      0000009900000066000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B2B2B2009999
      99009999990080808000000000000000000000000000E3B18E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FFFEF900E3CFC900B4817600E8B2
      7000ECA54A00C5876800000000000000000000000000B8B8B800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FCFCFC00D6D6D600A4A4A400ACAC
      AC00A3A3A300ABABAB0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000CC
      0000009900000066000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B2B2
      B2009999990080808000000000000000000000000000EDBD9200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4D4D200B4817600FAC5
      7700CD93770000000000000000000000000000000000BFBFBF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DBDBDB00A4A4A400B8B8
      B800ABABAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000CC00000066000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B2B2B20080808000000000000000000000000000EDBD9200FCF7F400FCF7
      F300FBF6F300FBF6F300FAF5F300F9F5F300F9F5F300E1D0CE00B4817600CF9B
      86000000000000000000000000000000000000000000BFBFBF00F8F8F800F7F7
      F700F7F7F700F7F7F700F6F6F600F6F6F600F6F6F600D7D7D700A4A4A400ABAB
      AB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDBD9200DAA48200DAA4
      8200DAA48200DAA48200DAA48200DAA48200DAA48200DAA48200B48176000000
      00000000000000000000000000000000000000000000BFBFBF00BABABA00BABA
      BA00BABABA00BABABA00BABABA00BABABA00BABABA00BABABA00A4A4A4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000B00000000100010000000000800500000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFC3FFC3FFFFFFFFFF00FF00F
      FFFFFFFFE007E00787C387C3C003C0038383838380018001C107C10780018001
      E00FE00F00000000F01FF01F00000000F83FF83F00000000F01FF01F00000000
      E00FE00F80018001C107C1078001800183838383C003C00387C387C3E007E007
      FFFFFFFFF00FF00FFFFFFFFFFC3FFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF87C387C3FFFFFFFF83838383FFFFFFFFC107C107FFFFFFFF
      E00FE00FC003C003F01FF01FC003C003F83FF83FC003C003F01FF01FC003C003
      E00FE00FFFFFFFFFC107C107FFFFFFFF83838383FFFFFFFF87C387C3FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      F9FFF9FFE67FE67FF8FFF8FFE23FE23FF87FF87FE01FE01FE03FE03F800F800F
      E01FE01F80078007E00FE00F80038003E007E00780018001E00FE00F80038003
      E01FE01F80078007E03FE03F800F800FF87FF87FE01FE01FF8FFF8FFE23FE23F
      F9FFF9FFE67FE67FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FE67FE67FF9FFF9FFC47FC47FF1FFF1FF807F807FE1FFE1FF001F001FC07FC07
      E001E001F807F807C001C001F007F00780018001E007E007C001C001F007F007
      E001E001F807F807F001F001FC07FC07F807F807FE1FFE1FFC47FC47FF1FFF1F
      FE67FE67FF9FFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE007E007E007E007C003C003C003C003
      C003C003C003C003C003C003C003C003C003C003C003C003C003C003C003C003
      C003C003C003C003C003C003C003C003E007E007E007E007FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE007E007E007E007C003C003C003C003
      C003C003C003C003C003C003C003C003C003C003C003C003C003C003C003C003
      C003C003C003C003C003C003C003C003E007E007E007E007FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFFFCFFFFFFFFFFF87FF87F
      FFFFFFFFF07FF07FFC3FFC3FE07FE07FC003C003C03FC03FC003C003803E803E
      E007E007001C001CF00FF00F00080008F00FF00F00010001F00FF00F80038003
      F00FF00F80078007F00FF00F800F800FF81FF81FC01FC01FFC3FFC3FE03FE03F
      FFFFFFFFF07FF07FFFFFFFFFF8FFF8FFFFFFFFFFFFFFFFFF80038003F01FF01F
      00010001E00FE00F00010001C007C00700010001800380030001000100010001
      000100010001000180038003000100018003800300010001C007C00700010001
      C007C00700010001E00FE00F00010001E00FE00F80038003F01FF01FC007C007
      F01FF01FE00FE00FFC7FFC7FF01FF01FFFFFFFFFFF3FFF3FFFFFFFFFFE3FFEBF
      FFFFFFFFFC3FFDBF87C387C3E00FE18F83838383C007CFE7C107C1078003B83B
      E00FE00F00013C79F01FF01F00017C7DF83FF83F00017C7DF01FF01F0001787D
      E00FE00F00017FFDC107C10700017C7D8383838300013C7987C387C38003BC7B
      FFFFFFFFC007CFE7FFFFFFFFE00FE00FFFFFFFFFFFFFFFFF80038003FFFFFFFF
      80038003F3FFF3FF80038003E1FFE1FF80038003C0FFC0FF80038003807F807F
      80038003803F803F800380038C1F8C1F800380039E0F9E0F80038003FF07FF07
      80038003FF83FF8380038003FFC3FFC380038003FFE3FFE380078007FFF3FFF3
      800F800FFFFFFFFF801F801FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ActionList: TActionList
    Images = Images
    Left = 400
    Top = 40
    object acRefresh: TAction
      Caption = 'Refresh'
      Hint = 'Refresh Monitor List'
      ImageIndex = 0
      OnExecute = acRefreshExecute
    end
    object acGetNewCDNo: TAction
      Caption = 'Get New CD #'
      ShortCut = 16462
    end
    object acApplyCdNo: TAction
      Caption = 'Apply Cd #'
      ShortCut = 16397
    end
    object acGoMonitor: TAction
      Caption = 'Go to Monitor Folders Page'
      ShortCut = 116
      OnExecute = acGoMonitorExecute
    end
    object acGoDetail: TAction
      Caption = 'Go To Detail Page'
      ShortCut = 113
      OnExecute = acGoDetailExecute
    end
    object acGoSearch: TAction
      Caption = 'Go to Search Page'
      ShortCut = 114
      OnExecute = acGoSearchExecute
    end
    object acAddToDatabase: TAction
      Caption = 'Add To Database'
      OnExecute = acAddToDatabaseExecute
    end
    object acUpdateInfo: TAction
      Caption = 'Update Information'
      Hint = 'Update Information'
      ImageIndex = 38
      ShortCut = 16457
      OnExecute = acUpdateInfoExecute
    end
    object acSave: TAction
      Caption = 'acSave'
      ShortCut = 16467
    end
    object acCancel: TAction
      Caption = 'acCancel'
      ShortCut = 27
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 368
    Top = 40
  end
  object daFileTable: TDataSource
    DataSet = Dm.dsFileTable
    OnStateChange = daFileTableStateChange
    OnDataChange = daFileTableDataChange
    Left = 528
    Top = 40
  end
end
