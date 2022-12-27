object frmStatus: TfrmStatus
  Left = 321
  Top = 176
  BorderStyle = bsToolWindow
  Caption = 'Progress'
  ClientHeight = 93
  ClientWidth = 268
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  TextHeight = 13
  object Progress: TRzProgressStatus
    Left = 0
    Top = 63
    Width = 268
    Height = 30
    BorderWidth = 4
    Align = alBottom
    ParentShowHint = False
    PartsComplete = 0
    Percent = 50
    TotalParts = 0
    ExplicitTop = 26
  end
  object caption: TRzLabel
    Left = 0
    Top = 0
    Width = 268
    Height = 42
    Align = alClient
    Caption = 'caption'
    WordWrap = True
    BorderWidth = 4
    ExplicitWidth = 43
    ExplicitHeight = 21
  end
  object Label1: TRzLabel
    Left = 0
    Top = 42
    Width = 268
    Height = 21
    Align = alBottom
    Caption = 'Press Esc to Abort'
    WordWrap = True
    BevelWidth = 0
    BorderWidth = 4
    ExplicitWidth = 96
  end
end
