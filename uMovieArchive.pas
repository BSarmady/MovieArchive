unit uMovieArchive;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, Grids, DB,
  DBCtrls, DBGrids, ADODB, ImgList, Menus, ActnList, RichEdit, RzButton,
  RzEdit, RzBtnEdt, RzLabel, RzPanel, RzStatus, RzChkLst, RzCmboBx, RzDBCmbo,
  RzTabs, RzLstBox, RzPrgres, Wwdbigrd, Wwdbgrid, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, uNetUtils, RzDBEdit, Actions, ImageList;

const
  cAppRegistryRoot = 'Software\JGhost\Movie Archive\';
  cAppName = 'Movie Archive';

type
  TLogOptions = (loNone, loLog, loStatus, loBoth);

{$REGION 'TfmMovieArchive = class(TForm)'}

  TfmMovieArchive = class(TForm)
    pnApplTitle: TRzPanel;
    lblCaption: TRzLabel;
    StatusBar: TRzStatusBar;
    JobStatus: TRzStatusPane;
    StatusPaneResize: TRzStatusPane;
    MainMenu1: TMainMenu;
    Images: TImageList;
    ActionList: TActionList;
    acRefresh: TAction;
    Progress: TRzProgressBar;
    PopupMenu1: TPopupMenu;
    PageControl: TRzPageControl;
    tbSearch: TRzTabSheet;
    tbMonitor: TRzTabSheet;
    tbDetail: TRzTabSheet;
    pnlSearch: TRzPanel;
    edtSearch: TRzEdit;
    lblSearch: TRzLabel;
    edtPath: TRzButtonEdit;
    lblFolderMonitor: TRzLabel;
    Grid: TwwDBGrid;
    lblFor: TRzLabel;
    cbFieldNames: TRzComboBox;
    btnFirst: TRzBitBtn;
    btnPrev: TRzBitBtn;
    btnNext: TRzBitBtn;
    btnLast: TRzBitBtn;
    btnCancel: TRzBitBtn;
    btnSave: TRzBitBtn;
    edtYear: TRzDBEdit;
    lblName: TRzLabel;
    lblDirector: TRzLabel;
    lblYear: TRzLabel;
    lblIMDB: TRzLabel;
    acGetNewCDNo: TAction;
    acApplyCdNo: TAction;
    lblMediaType: TRzLabel;
    edtCdNo: TRzDBEdit;
    lblCdNo: TRzLabel;
    acGoSearch: TAction;
    acGoDetail: TAction;
    acGoMonitor: TAction;
    btnSeparateDates: TRzButton;
    pnlLowerDetail: TRzPanel;
    pnlGenre: TRzPanel;
    lblGenre: TRzLabel;
    pnlCast: TRzPanel;
    lblCast: TRzLabel;
    pnlRating: TRzPanel;
    lblRating: TRzLabel;
    imgRates: TImage;
    cbRates: TRzDBComboBox;
    lstFileList: TRzCheckList;
    btnStart: TRzButton;
    btnAddToDatabase: TRzButton;
    lblCheckAll: TRzURLLabel;
    lblReverseChecked: TRzURLLabel;
    acAddToDatabase: TAction;
    daFileTable: TDataSource;
    btnUpdateInfo: TRzBitBtn;
    acUpdateInfo: TAction;
    Animate1: TAnimate;
    lblInfo: TRzLabel;
    edtGenre: TRzDBEdit;
    edtDirector: TRzDBEdit;
    edtIMDB: TRzDBEdit;
    edtMediaType: TRzDBEdit;
    edtName: TRzDBEdit;
    acSave: TAction;
    acCancel: TAction;
    mmoCast: TRzDBMemo;
    RzBitBtn1: TRzBitBtn;
    lblBatchUpdate: TRzLabel;
    mmoKeyword: TRzDBMemo;
    lblKeywords: TRzLabel;
    edtAKA: TRzDBMemo;
    lblAKA: TRzLabel;
    RzBitBtn2: TRzBitBtn;
    lstCast: TRzEditListBox;
    btnAssignFileNames: TRzBitBtn;
    btnCorrectMovieNames: TRzBitBtn;
    btnFixFileNames: TRzButton;
    btnAddNames: TRzBitBtn;
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure daFileTableStateChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure acUpdateInfoExecute(Sender: TObject);
    procedure daFileTableDataChange(Sender: TObject; Field: TField);
    procedure cbRatesChange(Sender: TObject);
    procedure acAddToDatabaseExecute(Sender: TObject);
    procedure lblReverseCheckedClick(Sender: TObject);
    procedure lblCheckAllClick(Sender: TObject);
    procedure mmoKeywordChange(Sender: TObject);
    procedure pnlLowerDetailResize(Sender: TObject);
    procedure GridCalcTitleAttributes(Sender: TObject; AFieldName: string; AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
    procedure GridTitleButtonClick(Sender: TObject; AFieldName: string);
    procedure btnSeparateDatesClick(Sender: TObject);
    procedure acGoMonitorExecute(Sender: TObject);
    procedure acGoDetailExecute(Sender: TObject);
    procedure acGoSearchExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnNavigate(Sender: TObject);
    procedure GridURLOpen(Sender: TObject; var URLLink: string; Field: TField; var UseDefault: Boolean);
    procedure FormShow(Sender: TObject);
    procedure GridDrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure PageControlChange(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure acRefreshExecute(Sender: TObject);
    procedure edtPathButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnAssignFileNamesClick(Sender: TObject);
    procedure btnCorrectMovieNamesClick(Sender: TObject);
    procedure btnFixFileNamesClick(Sender: TObject);
    procedure btnAddNamesClick(Sender: TObject);

  private
    Processing: Boolean;
    _RichEd: TRichEdit;
    RepositoryFolder: string;
    MovieNames: array of string;
    MovieYears: array of string;

    function PrintToCanvas(ACanvas: TCanvas; FromChar, ToChar: integer; ARichEdit: TRichEdit; Rect: TRect): Longint;
    function FileExistsInDb(MovieName: string; MovieYear: string): Boolean;
    function ExtractMovieName(FileName: string): string;
    function ExtractMovieYear(FileName: string): string;
    function CreateFileName(FileName: string): string;

  public
  end;
{$ENDREGION}


var
  cAppFolder: string;
  fmMovieArchive: TfmMovieArchive;

implementation

{$R *.dfm}
{$R 'Rates.res'}


uses
  Math, StrUtils, uDataModule, uRegistry, Procs, uMonitorFolders, uStatus;

{$REGION 'procedure TfmMovieArchive.FormCreate(...)'}
procedure TfmMovieArchive.FormCreate(Sender: TObject);
var
  Tabulators: array [0 .. 1] of integer;
  I: integer;
  Columns: TStrings;
begin
  Font.Size := 10;
  cAppFolder := ExtractFilePath(Application.ExeName);

  _RichEd := TRichEdit.Create(Self);
  _RichEd.Visible := False;
  _RichEd.Parent := Self;

  Processing := False;
  Caption := cAppName;
  lblCaption.Caption := cAppName;
  Application.Title := cAppName;

  for I := 0 to Dm.dsFileTable.FieldCount - 1 do
    if Dm.dsFileTable.Fields[I].Visible then
      cbFieldNames.Add(Dm.dsFileTable.Fields[I].FieldName);
  if cbFieldNames.Count > 0 then
    cbFieldNames.ItemIndex := 0;

  LoadFormState(Self, cAppRegistryRoot);
  edtPath.Text := LoadFromRegistry(cAppRegistryRoot, 'LastFolder', ExtractFilePath(Application.ExeName));
  RepositoryFolder := LoadFromRegistry(cAppRegistryRoot, 'RepositryFolder', ExtractFilePath(Application.ExeName));
  cbFieldNames.ItemIndex := LoadFromRegistry(cAppRegistryRoot, 'LastSearchField', cbFieldNames.ItemIndex);
  edtSearch.Text := LoadFromRegistry(cAppRegistryRoot, 'LastSearchText', edtSearch.Text);

  daFileTable.DataSet := Dm.dsFileTable;
  Columns := TStringList.Create;
  try

    Read_MULTI_SZ(cAppRegistryRoot, 'SearchGrid', Columns);
    // Add New Columns
    for I := 0 to Dm.dsFileTable.FieldCount - 1 do
      if Dm.dsFileTable.Fields[I].Visible and (Pos(Dm.dsFileTable.Fields[I].FieldName, Columns.Text) = 0) then
        Columns.Add(Dm.dsFileTable.Fields[I].FieldName + #9 + IntToStr(IfThen(Dm.dsFileTable.Fields[I].DisplayWidth < 150, Dm.dsFileTable.Fields[I].DisplayWidth, 150)) + #9 + Dm.dsFileTable.Fields[I].FieldName);

    // Remove Deleted Columns
    for I := Columns.Count - 1 downto 0 do
      if (Dm.dsFileTable.FindField(LeftStr(Columns[I], Pos(#9, Columns[I]) - 1)) = nil) or not Dm.dsFileTable.FindField(LeftStr(Columns[I], Pos(#9, Columns[I]) - 1)).Visible then
        Columns.Delete(I);

    Grid.Selected := Columns;
    Grid.ApplySelected;
  finally
    FreeAndNil(Columns);
  end;

  Tabulators[0] := 100;
  Tabulators[1] := 200;
  // Set the Tabulators
  SendMessage(mmoCast.Handle, EM_SETTABSTOPS, 2, Longint(@Tabulators));
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.FormShow(...)'}
procedure TfmMovieArchive.FormShow(Sender: TObject);
var
  I: integer;
begin
  PageControl.ActivePage := tbSearch;
  for I := 0 to Self.ComponentCount - 1 do begin
    if Components[I] is TRzButton then
      TRzButton(Components[I]).Height := edtSearch.Height;
    if Components[I] is TRzBitBtn then begin
      TRzBitBtn(Components[I]).Height := edtSearch.Height;
      TRzBitBtn(Components[I]).Width := edtSearch.Height;
    end;
  end;
  // acRefresh.Execute;
  // if lstFileList.Count>0 then
  // PageControl.ActivePage:=tbMonitor;

  lblInfo.Caption := '';
  lblBatchUpdate.Caption := '';
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.FormClose(...)'}
procedure TfmMovieArchive.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveFormState(Self, cAppRegistryRoot);
  SaveToRegistry(cAppRegistryRoot, 'LastFolder', edtPath.Text);
  SaveToRegistry(cAppRegistryRoot, 'RepositryFolder', RepositoryFolder);
  SaveToRegistry(cAppRegistryRoot, 'LastSearchField', cbFieldNames.ItemIndex);
  SaveToRegistry(cAppRegistryRoot, 'LastSearchText', edtSearch.Text);
  // FindAllFiles(RepositoryFolder);
  Write_MULTI_SZ(cAppRegistryRoot, 'SearchGrid', Grid.Selected);
  FreeAndNil(_RichEd);
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.FormKeyPress(...)'}
procedure TfmMovieArchive.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then begin
    Processing := False;
    if (PageControl.ActivePage = tbSearch) and (edtSearch.Text <> '') then
      edtSearch.Text := '';
    edtSearch.SetFocus;
  end;
end;
{$ENDREGION}

{$REGION 'function TfmMovieArchive.FileExistsInDb(...):Boolean'}
function TfmMovieArchive.FileExistsInDb(MovieName: string; MovieYear: string): Boolean;
var
  I: integer;
begin
  Dm.dsFileTable.Filtered := False;
  if (Length(MovieNames) < 1) or (Length(MovieNames) <> Dm.dsFileTable.RecordCount) then begin
    SetLength(MovieNames, Dm.dsFileTable.RecordCount);
    SetLength(MovieYears, Dm.dsFileTable.RecordCount);
    while not Dm.dsFileTable.Eof do begin
      MovieNames[Dm.dsFileTable.RecNo - 1] := Trim(Dm.dsFileTableName.AsString);
      MovieYears[Dm.dsFileTable.RecNo - 1] := Trim(Dm.dsFileTableYear.AsString);
      Dm.dsFileTable.Next;
    end;
  end;
  Dm.dsFileTable.Filtered := True;
  Result := False;
  MovieName := Trim(MovieName);
  Application.ProcessMessages;
  for I := 0 to Length(MovieNames) - 1 do begin
    if (MovieNames[I] = MovieName) and (MovieYears[I] = MovieYear) then begin
      Result := True;
      Exit;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'function ValidMovieExtention(...):Boolean'}
function ValidMovieExtention(Extention: string): Boolean;
const
  Extentions: array [0 .. 5] of string = ('.avi', '.mpg', '.mpeg', '.flv', '.mkv', 'mp4');
var
  I: integer;
begin
  Extention := LowerCase(Extention);
  Result := False;
  for I := 0 to Length(Extentions) - 1 do
    if Extention = Extentions[I] then
      Result := True;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.acRefreshExecute(...)'}
procedure TfmMovieArchive.acRefreshExecute(Sender: TObject);
var
  I: integer;
  FolderList: TStrings;
  Folder: string;
  MovieName: string;
  MovieYear: string;

{$REGION 'procedure FindFiles(Path:string;Recursive:Boolean:True)'}
  procedure FindFiles(Path: string; Recursive: Boolean = True);
  var
    SearchRec: TSearchRec;
  begin
    try
      if not DirectoryExists(Path) then
        Exit;
      if FindFirst(IncludeTrailingBackslash(Path) + '*.*', faAnyFile, SearchRec) = 0 then begin
        repeat
          if not Processing then
            Exit;
          if (SearchRec.Attr and faDirectory) = faDirectory then begin
            if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') and Recursive then begin
              FindFiles(IncludeTrailingBackslash(Path) + SearchRec.Name, Recursive);
            end;
          end else if ValidMovieExtention(ExtractFileExt(SearchRec.Name)) then begin
            if SearchRec.Size > 0 then
              lstFileList.Add(IncludeTrailingBackslash(Path) + SearchRec.Name);
          end;
          Application.ProcessMessages;
        until FindNext(SearchRec) <> 0;
        FindClose(SearchRec);
      end;
    except
      on ex: Exception do
        ErrBox(ex.Message);
    end;
  end;
{$ENDREGION}

begin
  FolderList := TStringList.Create;
  try
    Processing := True;
    acRefresh.Enabled := False;
    lstFileList.Clear;
    lstFileList.Enabled := False;
    lstFileList.Items.BeginUpdate;
    FolderList.Text := StringReplace(edtPath.Text, ';', #13#10, [rfReplaceAll]);
    for I := 0 to FolderList.Count - 1 do begin
      Folder := Trim(FolderList[I]);
      if LeftStr(Folder, 1) = '+' then begin
        Folder := RightStr(Folder, Length(Folder) - 1);
        FindFiles(IncludeTrailingBackslash(Folder), True);
      end
      else
        FindFiles(IncludeTrailingBackslash(Folder), False);
    end;
    for I := 0 to lstFileList.Count - 1 do begin
      MovieName := ExtractFileName(lstFileList.Items[I]);
      MovieName := StringReplace(ExtractFileName(MovieName), ExtractFileExt(MovieName), '', []);

      MovieYear := '';
      if (Pos('(', MovieName) > 0) and (Pos(')', MovieName) > 0) then begin
        MovieYear := Copy(MovieName, Pos('(', MovieName) + 1, Pos(')', MovieName) - Pos('(', MovieName) - 1);
        if not((Length(MovieYear) = 4) and IsNumeric(MovieYear)) then
          MovieYear := '';
      end;
      MovieName := StringReplace(MovieName, '(' + MovieYear + ')', '', []);
      MovieName := StringReplace(MovieName, 'CD1', '', [rfIgnoreCase]);
      MovieName := StringReplace(MovieName, 'CD2', '', [rfIgnoreCase]);
      MovieName := StringReplace(MovieName, 'CD3', '', [rfIgnoreCase]);
      MovieName := Trim(StringReplace(MovieName, 'CD4', '', [rfIgnoreCase]));
      if not FileExistsInDb(MovieName, MovieYear) then
        lstFileList.ItemChecked[I] := True;
    end;
    if lstFileList.Count > 0 then
      lstFileList.ItemIndex := 0;
    lblCheckAll.Caption := 'Deselect all';
  finally
    lstFileList.Items.EndUpdate;
    lstFileList.Enabled := True;
    acRefresh.Enabled := True;
    Processing := False;
    FreeAndNil(FolderList);
  end;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.edtPathButtonClick(...)'}
procedure TfmMovieArchive.edtPathButtonClick(Sender: TObject);
var
  fmMonitorFolders: TfmMonitorFolders;
begin
  fmMonitorFolders := TfmMonitorFolders.Create(Self);
  try
    fmMonitorFolders.lstMonitorFolders.Items.Text := StringReplace(edtPath.Text, ';', #13#10, [rfReplaceAll]);
    if fmMonitorFolders.ShowModal = mrOk then begin
      edtPath.Text := StringReplace(fmMonitorFolders.lstMonitorFolders.Items.Text, #13#10, ';', [rfReplaceAll]);
      SaveToRegistry(cAppRegistryRoot, 'LastFolder', edtPath.Text);
    end;
  finally
    FreeAndNil(fmMonitorFolders);
  end;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.edtSearchChange(...)'}
procedure TfmMovieArchive.edtSearchChange(Sender: TObject);
begin
  if edtSearch.Text <> '' then begin
    if Dm.dsFileTable.FieldByName(cbFieldNames.Text).DataType in [ftSmallint, ftInteger, ftWord, ftBoolean, ftFloat, ftCurrency, ftBCD] then begin
      if IsNumeric(edtSearch.Text) then begin
        Dm.dsFileTable.Filter := cbFieldNames.Text + '=' + edtSearch.Text;
        Dm.dsFileTable.Filtered := True;
      end
      else
        ErrBox('Invalid Number')
    end else begin
      Dm.dsFileTable.Filter := cbFieldNames.Text + ' like ' + QuotedStr('*' + edtSearch.Text + '*');
      Dm.dsFileTable.Filtered := True;
    end;
  end
  else
    Dm.dsFileTable.Filtered := False;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.PageControlChange(...)'}
procedure TfmMovieArchive.PageControlChange(Sender: TObject);
begin
  if PageControl.ActivePage = tbSearch then
    if edtSearch.CanFocus then
      edtSearch.SetFocus;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.GridDrawDataCell(...)'}
procedure TfmMovieArchive.GridDrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
var
  SearchPos: integer;
  DrawPos: integer;
  AfterSearchPos: integer;
  SearchText: string;
  BrushColor: TColor;
  FontColor: TColor;
begin
  if (Length(edtSearch.Text) > 0) and (Field.FieldName = cbFieldNames.Text) then begin
    if Field.DataType = ftMemo then begin

    {$REGION 'Draw Memo fields differently'}
      SearchPos := Pos(UpperCase(edtSearch.Text), UpperCase(Field.AsString));
      if (gdSelected in State) and (gdFocused in State) then begin
        _RichEd.Color := clHighlight;
      end
      else
        _RichEd.Color := Grid.Color;
      _RichEd.Lines.Clear;
      _RichEd.SelText := LeftStr(Field.AsString, SearchPos - 1);
      _RichEd.SelAttributes.Style := [fsBold];
      _RichEd.SelText := Copy(Field.AsString, SearchPos, Length(edtSearch.Text));
      _RichEd.SelAttributes.Style := [];
      _RichEd.SelText := RightStr(Field.AsString, Length(Field.AsString) - SearchPos - Length(edtSearch.Text) + 1);
      PrintToCanvas(Grid.Canvas, 0, Length(_RichEd.Text), _RichEd, Rect);
{$ENDREGION}

    end else begin

    {$REGION 'Draw Other Fields'}
      if Grid.IsAlternatingRow(Dm.dsFileTable.RecNo - 1) then
        BrushColor := Grid.PaintOptions.AlternatingRowColor
      else
        BrushColor := Grid.Brush.Color;
      if (gdSelected in State) and (gdFocused in State) then begin
        BrushColor := clHighlight;
        FontColor := clHighlightText;
      end
      else
        FontColor := Grid.Font.Color;

      Grid.Canvas.Brush.Color := BrushColor;
      Grid.Canvas.Font.Color := FontColor;
      Grid.Canvas.FillRect(Rect);
      Grid.Canvas.Brush.Style := bsClear;
      SearchPos := Pos(UpperCase(edtSearch.Text), UpperCase(Field.AsString));
      Grid.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, LeftStr(Field.AsString, SearchPos - 1));
      DrawPos := Grid.Canvas.TextWidth(LeftStr(Field.AsString, SearchPos - 1));
      if DrawPos > -1 then
        Grid.Canvas.Font.Style := [fsBold];
      SearchText := Copy(Field.AsString, SearchPos, Length(edtSearch.Text));
      AfterSearchPos := Grid.Canvas.TextWidth(SearchText) + DrawPos;
      // Grid.Canvas.Font.Color:= $00DD0000;
      Grid.Canvas.TextRect(Rect, Rect.Left + 2 + DrawPos, Rect.Top + 2, SearchText);
      Grid.Canvas.Font.Style := [];
      // Grid.Canvas.Font.Color := FontColor;
      Grid.Canvas.TextRect(Rect, Rect.Left + 2 + AfterSearchPos, Rect.Top + 2, RightStr(Field.AsString, Length(Field.AsString) - SearchPos - Length(edtSearch.Text) + 1));
      Grid.Canvas.Brush.Style := bsSolid;
{$ENDREGION}

    end;
  end;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.GridURLOpen(...)'}
procedure TfmMovieArchive.GridURLOpen(Sender: TObject; var URLLink: string; Field: TField; var UseDefault: Boolean);
begin
  //
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.btnNavigate(...)'}
procedure TfmMovieArchive.btnNavigate(Sender: TObject);
begin
  if Sender = btnFirst then
    Dm.dsFileTable.First
  else if Sender = btnPrev then
    Dm.dsFileTable.Prior
  else if Sender = btnNext then
    Dm.dsFileTable.Next
  else if Sender = btnLast then
    Dm.dsFileTable.Last
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.DataSourceDataChange(...)'}
procedure TfmMovieArchive.daFileTableDataChange(Sender: TObject; Field: TField);
var
  arrActors: StringArray;
  I: integer;
begin
  btnFirst.Enabled := Dm.dsFileTable.RecNo > 1;
  btnPrev.Enabled := Dm.dsFileTable.RecNo > 1;
  btnNext.Enabled := Dm.dsFileTable.RecNo < Dm.dsFileTable.RecordCount;
  btnLast.Enabled := Dm.dsFileTable.RecNo < Dm.dsFileTable.RecordCount;
  btnUpdateInfo.Enabled := Dm.dsFileTableIMDB.AsString <> '';

  lstCast.Items.Clear;
  arrActors := SplitString(Dm.dsFileTableCast.AsString, ',');
  for I := 0 to Length(arrActors) - 1 do begin
    if FileExists(cAppFolder + 'Actors\' + arrActors[I] + '1.jpg') or FileExists(cAppFolder + 'Actors\' + arrActors[I] + '.jpg') or FileExists(cAppFolder + 'Actress\' + arrActors[I] + '1.jpg') or FileExists(cAppFolder + 'Actress\' + arrActors[I] + '.jpg') then
      lstCast.Items.Add('+' + arrActors[I])
    else
      lstCast.Items.Add(arrActors[I]);
  end;
  cbRatesChange(cbRates);
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.daFileTableDataChange(...)'}
procedure TfmMovieArchive.cbRatesChange(Sender: TObject);
begin
  if cbRates.ItemIndex < 0 then
    Exit;
  if cbRates.Text <> '' then
    imgRates.Picture.Bitmap.LoadFromResourceName(HInstance, 'RATE_' + cbRates.Text)
  else
    imgRates.Picture.Bitmap := nil;
end;
{$ENDREGION}

{$REGION 'function TfmMovieArchive.PrintToCanvas(...'}
function TfmMovieArchive.PrintToCanvas(ACanvas: TCanvas; FromChar, ToChar: integer; ARichEdit: TRichEdit; Rect: TRect): Longint;
var
  Range: TFormatRange;
begin
  FillChar(Range, SizeOf(TFormatRange), 0);
  Range.hdc := ACanvas.Handle;
  Range.hdcTarget := ACanvas.Handle;
  Range.rc.Left := (Rect.Left + 2) * 1440 div Screen.PixelsPerInch;
  Range.rc.Top := (Rect.Top + 2) * 1440 div Screen.PixelsPerInch;
  Range.rc.right := (Rect.right - 2) * 1440 div Screen.PixelsPerInch;
  Range.rc.Bottom := (Rect.Bottom - 2) * 1440 div Screen.PixelsPerInch;
  Range.chrg.cpMax := ToChar;
  Range.chrg.cpMin := FromChar;
  Result := SendMessage(ARichEdit.Handle, EM_FORMATRANGE, 1, Longint(@Range));
  SendMessage(ARichEdit.Handle, EM_FORMATRANGE, 0, 0);
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.FormKeyDown(...)'}
procedure TfmMovieArchive.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Dm.dsFileTable.Active and (ActiveControl = edtSearch) then begin
    case Key of
      VK_DOWN:
        Dm.dsFileTable.Next;
      VK_UP:
        Dm.dsFileTable.Prior;
      VK_NEXT:
        Dm.dsFileTable.MoveBy(Grid.GetRowCount - 2);
      VK_PRIOR:
        Dm.dsFileTable.MoveBy(-Grid.GetRowCount + 2);
      VK_END:
        if Shift = [ssCtrl] then
          Dm.dsFileTable.Last;
      VK_HOME:
        if Shift = [ssCtrl] then
          Dm.dsFileTable.First;
    end;
    if Key in [VK_DOWN, VK_UP, VK_NEXT, VK_PRIOR] then
      Key := 0;
    if (Key in [VK_HOME, VK_END]) and (Shift = [ssCtrl]) then
      Key := 0;
  end;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.acGoSearchExecute(...)'}
procedure TfmMovieArchive.acGoSearchExecute(Sender: TObject);
begin
  PageControl.ActivePage := tbSearch;
  edtSearch.SetFocus;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.acGoDetailExecute(...)'}
procedure TfmMovieArchive.acGoDetailExecute(Sender: TObject);
begin
  PageControl.ActivePage := tbDetail;

end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.acGoMonitorExecute(...)'}
procedure TfmMovieArchive.acGoMonitorExecute(Sender: TObject);
begin
  PageControl.ActivePage := tbMonitor;

end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.btnSeparateDatesClick(...)'}
procedure TfmMovieArchive.btnSeparateDatesClick(Sender: TObject);
var
  Text: string;
  Bookmark: TBookmark;
  SaveFilter: string;
begin
  Dm.dsFileTable.DisableControls;
  try
    Bookmark := Dm.dsFileTable.GetBookmark;
    SaveFilter := Dm.dsFileTable.Filter;
    Dm.dsFileTable.Filter := '';
    Dm.dsFileTable.Filtered := False;
    Dm.dsFileTable.First;

    while not Dm.dsFileTable.Eof do begin
      if (Pos('(', Dm.dsFileTableName.AsString) > 0) and (Pos(')', Dm.dsFileTableName.AsString) > 0) then begin
        Text := Copy(Dm.dsFileTableName.AsString, Pos('(', Dm.dsFileTableName.AsString) + 1, Pos(')', Dm.dsFileTableName.AsString) - Pos('(', Dm.dsFileTableName.AsString) - 1);
        if IsNumeric(Text) and (Length(Text) = 4) and (Dm.dsFileTableYear.AsString = '') then begin
          Dm.dsFileTable.Edit;
          Dm.dsFileTableName.Value := Trim(StringReplace(Dm.dsFileTableName.AsString, '(' + Text + ')', '', []));
          Dm.dsFileTableYear.Value := Text;
          Dm.dsFileTable.Post;
        end;
      end;
      Dm.dsFileTable.Next;
    end;

    Dm.dsFileTable.Filter := SaveFilter;
    if SaveFilter <> '' then
      Dm.dsFileTable.Filtered := True;
    if Dm.dsFileTable.BookmarkValid(Bookmark) then
      Dm.dsFileTable.GotoBookmark(Bookmark);
    Dm.dsFileTable.FreeBookmark(Bookmark);
    Dm.dsSameCD.Requery;
  finally
    Dm.dsFileTable.EnableControls;
  end;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.GridTitleButtonClick(...)'}
procedure TfmMovieArchive.GridTitleButtonClick(Sender: TObject; AFieldName: string);
var
  Bookmark: TBookmark;
begin
  Bookmark := Dm.dsFileTable.GetBookmark;
  if Dm.dsFileTable.FieldByName(AFieldName).DataType <> ftMemo then begin
    Dm.dsFileTable.IndexFieldNames := AFieldName;
  end
  else
    Dm.dsFileTable.IndexFieldNames := 'Name';
  if Dm.dsFileTable.BookmarkValid(Bookmark) then
    Dm.dsFileTable.GotoBookmark(Bookmark);
  Dm.dsFileTable.FreeBookmark(Bookmark);
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.GridCalcTitleAttributes(...)'}
procedure TfmMovieArchive.GridCalcTitleAttributes(Sender: TObject; AFieldName: string; AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
begin
  if Dm.dsFileTable.IndexFieldNames = AFieldName then begin
    AFont.Color := clActiveCaption;
    AFont.Style := [fsBold];
  end;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.pnlLowerDetailResize(...)'}
procedure TfmMovieArchive.pnlLowerDetailResize(Sender: TObject);
begin
  pnlCast.Width := (pnlLowerDetail.Width - pnlRating.Width) div 2;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.mmoGenreChange(...)'}
procedure TfmMovieArchive.mmoKeywordChange(Sender: TObject);
var
  Genre: string;
begin
  Genre := StringReplace(mmoKeyword.Lines.Text, ' |', '|', [rfReplaceAll]);
  Genre := StringReplace(Genre, '| ', '|', [rfReplaceAll]);
  Genre := StringReplace(Genre, '|', ', '#13#10, [rfReplaceAll]);
  mmoKeyword.Lines.Text := Genre;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.lblCheckAllClick(...)'}
procedure TfmMovieArchive.lblCheckAllClick(Sender: TObject);
begin
  if lblCheckAll.Caption = 'Select All' then begin
    lstFileList.CheckAll;
    lblCheckAll.Caption := 'Deselect All'
  end else begin
    lstFileList.UncheckAll;
    lblCheckAll.Caption := 'Select All'
  end;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.lblReverseCheckedClick(...)'}
procedure TfmMovieArchive.lblReverseCheckedClick(Sender: TObject);
var
  I: integer;
begin
  for I := 0 to lstFileList.Count - 1 do
    lstFileList.ItemChecked[I] := not lstFileList.ItemChecked[I];
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.acAddToDatabaseExecute(...)'}
procedure TfmMovieArchive.acAddToDatabaseExecute(Sender: TObject);
var
  Found: integer;
  I: integer;
  MovieName: string;
  MovieFile: string;
  MovieYear: string;
begin
  if lstFileList.ItemsChecked < 1 then begin
    ErrBox('No files selected');
    Exit;
  end;

  Processing := True;
  acAddToDatabase.Enabled := False;
  Dm.dsFileTable.DisableControls;
  try
    Progress.TotalParts := lstFileList.Count - 1;
    Progress.Visible := True;
    Dm.dsFileTable.Filtered := False;
    Found := 0;
    for I := 0 to lstFileList.Count - 1 do begin
      if not Processing then
        Exit;
      if lstFileList.ItemChecked[I] then begin
        MovieFile := CreateFileName(lstFileList.Items[I]);
        MovieName := ExtractMovieName(lstFileList.Items[I]);
        MovieYear := ExtractMovieYear(lstFileList.Items[I]);
        if ((not Dm.dsFileTable.Locate('filename', MovieFile, [])) and (not Dm.dsFileTable.Locate('name;year', VarArrayOf([MovieName, MovieYear]), []))) or (MessageDlg('"' + MovieName + '"'#13#10'Movie exists in database, add it again?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
          Dm.dsFileTable.Insert;
          Dm.dsFileTableYear.Value := MovieYear;
          Dm.dsFileTableYear.Value := MovieFile;
          Dm.dsFileTableName.Value := MovieName;
          Dm.dsFileTableMediaType.Value := UpperCase(Copy(ExtractFileExt(lstFileList.Items[I]), 2, Length(lstFileList.Items[I]) - 2));
          Dm.dsFileTable.Post;
          lstFileList.ItemChecked[I] := False;
          lstFileList.ItemState[I] := cbGrayed;
          Inc(Found);
        end;
      end;
    end;
    if lstFileList.ItemsChecked > 0 then
      ErrBox('Some files already exists in Database and does not add to archive!')
    else
      PageControl.ActivePage := tbSearch;
    if Found > 0 then begin
      edtSearch.Text := '';
      Dm.dsFileTable.Filter := 'CdNo= Null or CdNo=0';
    end;
    Dm.dsFileTable.Filtered := True;
    Dm.dsFileTable.First;
  finally
    Dm.dsFileTable.EnableControls;
    acAddToDatabase.Enabled := True;
    Progress.Visible := False;
    Processing := False;
  end;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.btnCancelClick(...)'}
procedure TfmMovieArchive.btnCancelClick(Sender: TObject);
begin
  if Dm.dsFileTable.State in [dsEdit, dsInsert] then
    Dm.dsFileTable.Cancel;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.btnSaveClick(...)'}
procedure TfmMovieArchive.btnSaveClick(Sender: TObject);
begin
  if Dm.dsFileTable.State in [dsEdit, dsInsert] then
    Dm.dsFileTable.Post;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.daFileTableStateChange(...)'}
procedure TfmMovieArchive.daFileTableStateChange(Sender: TObject);
begin
  btnCancel.Enabled := Dm.dsFileTable.State in [dsEdit, dsInsert];
  btnSave.Enabled := Dm.dsFileTable.State in [dsEdit, dsInsert];
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.acUpdateInfoExecute(...)'}
procedure TfmMovieArchive.acUpdateInfoExecute(Sender: TObject);
const
  Keywords = 'keywords';
  Credits = 'fullcredits';

var
  Cast1: TStrings;
  Cast2: TStrings;
  SS: TStrings;
  I, J: integer;
  InList: Boolean;
  KeywordList: TStrings;
  RateText: string;
  KeywordText: string;
  CastList: string;
  SearchGenre: Boolean;
  HTTPClient: TIdHTTP;

{$REGION 'function FilterTags(...):string'}
  function FilterTags(InStr: string; ReplaceBr: Boolean = True): string;
  var
    InTag: Boolean;
    I: integer;
  begin
    Result := '';
    if ReplaceBr then begin
      InStr := StringReplace(InStr, '<br>', ', ', [rfReplaceAll, rfIgnoreCase]);
      InStr := StringReplace(InStr, '<br/>', ', ', [rfReplaceAll, rfIgnoreCase]);
      InStr := StringReplace(InStr, '<br />', ', ', [rfReplaceAll, rfIgnoreCase]);
    end;
    InTag := False;
    for I := 1 to Length(InStr) do begin
      if InStr[I] = '<' then
        InTag := True;
      if not InTag then
        Result := Result + InStr[I];
      if InStr[I] = '>' then
        InTag := False;
    end;
    Result := HTMLDecode(Result);
    Result := Trim(Result);
    if RightStr(Trim(Result), 1) = ',' then
      Result := LeftStr(Result, Length(Result) - 1);
  end;
{$ENDREGION}

begin
  Animate1.Visible := True;
  Animate1.Active := True;
  SS := TStringList.Create;
  KeywordList := TStringList.Create;
  HTTPClient := TIdHTTP.Create(Self);
  try
    try
      HTTPClient.AllowCookies := True;
      HTTPClient.HandleRedirects := True;
      HTTPClient.Request.Accept := 'text/html, */*';
      HTTPClient.Request.AcceptCharSet := 'ISO-8859-1';
      HTTPClient.Request.AcceptLanguage := 'en-us';
      HTTPClient.Request.UserAgent := 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14';
      HTTPClient.HTTPOptions := [hoForceEncodeParams];

      Application.ProcessMessages;
      Dm.dsFileTable.Edit;
      lblInfo.Caption := 'Reading Movie Main Page';
      SS.Text := HTTPClient.Get(edtIMDB.Text);
      SS.SaveToFile('1.txt');

      for I := 0 to SS.Count - 1 do begin
        if Trim(SS[I]) = '<h5>Director:</h5>' then begin
          edtDirector.Text := FilterTags(SS[I + 1]);
        end else if Trim(SS[I]) = '<h5>Directors:</h5>' then begin
          edtDirector.Text := FilterTags(StringReplace(SS[I + 1], '>more<', '><', [rfReplaceAll]));
        end else if Pos('MPAA', SS[I]) > 0 then begin
          RateText := FilterTags(SS[I + 1]);
          if Pos(' PG-13 ', RateText) > 0 then
            Dm.dsFileTableMPAA.Value := 'PG-13'
          else if Pos(' PG ', RateText) > 0 then
            Dm.dsFileTableMPAA.Value := 'PG'
          else if Pos(' G ', RateText) > 0 then
            Dm.dsFileTableMPAA.Value := 'G'
          else if Pos(' R ', RateText) > 0 then
            Dm.dsFileTableMPAA.Value := 'R'
          else if Pos('NC-17', RateText) > 0 then
            Dm.dsFileTableMPAA.Value := 'NC-17'
        end else if (Dm.dsFileTableMPAA.AsString = '') and (Pos('USA:PG-13', SS[I]) > 0) then
          Dm.dsFileTableMPAA.Value := 'PG-13'
        else if (Dm.dsFileTableMPAA.AsString = '') and (Pos('USA:PG', SS[I]) > 0) then
          Dm.dsFileTableMPAA.Value := 'PG'
        else if (Dm.dsFileTableMPAA.AsString = '') and (Pos('USA:G', SS[I]) > 0) then
          Dm.dsFileTableMPAA.Value := 'G'
        else if (Dm.dsFileTableMPAA.AsString = '') and (Pos('USA:R', SS[I]) > 0) then
          Dm.dsFileTableMPAA.Value := 'R'
        else if (Dm.dsFileTableMPAA.AsString = '') and (Pos('USA:NC-17', SS[I]) > 0) then
          Dm.dsFileTableMPAA.Value := 'NC-17'
        else if Pos('Genre:', SS[I]) > 0 then begin
          edtGenre.Text := Trim(StringReplace(StringReplace(FilterTags(SS[I + 1]), ' more', '', [rfIgnoreCase, rfReplaceAll]), ' | ', ', ', [rfReplaceAll]));
        end else if Pos('<h5>Also Known As:</h5>', SS[I]) > 0 then begin
          edtAKA.Text := Trim(StringReplace(StringReplace(FilterTags(SS[I + 1]), '  ', ' ', [rfIgnoreCase, rfReplaceAll]), '<br>', ', '#13#10, [rfReplaceAll]));
        end;
      end;
      // SS.SaveToFile(edtName.Text + '.htm');
      lblInfo.Caption := 'Reading Movie Keywords';
      Application.ProcessMessages;
      SS.Text := HTTPClient.Get(edtIMDB.Text + Keywords);
      InList := False;
      KeywordText := '';
      for I := 0 to SS.Count - 1 do begin
        if SS[I] = '<ul>' then
          InList := True;
        if InList then begin
          KeywordText := FilterTags(SS[I]);
          if KeywordText <> '' then
            KeywordList.Add(KeywordText + ', ');
        end;
        if SS[I] = '</ul>' then
          InList := False;
      end;
      if KeywordList.Text <> '' then
        mmoKeyword.Text := KeywordList.Text;
      lblInfo.Caption := 'Reading Movie Cast';
      Application.ProcessMessages;
      SS.Text := HTTPClient.Get(edtIMDB.Text + Credits);
      for I := 0 to SS.Count - 1 do begin
        if Pos('<table class="cast">', SS[I]) > 0 then begin
          CastList := Copy(SS[I], Pos('<table class="cast">', SS[I]), Length(SS[I]));
          CastList := Copy(CastList, 0, Pos('</tr></table>', CastList));
          CastList := FilterTags(StringReplace(CastList, '</tr>', #13#10, [rfReplaceAll]), False);
        end;
      end;
      Cast1 := TStringList.Create;
      Cast2 := TStringList.Create;
      try
        Cast1.Text := CastList;
        Cast2.Clear;
        for J := 0 to Cast1.Count - 1 do begin
          if Trim(Cast1[J]) <> '' then
            if Pos('...', Cast1[J]) > 0 then
              Cast2.Add(StringReplace(StringReplace(Cast1[J], '/ ... ', '', [rfReplaceAll]), ' ... ', #9, [rfReplaceAll]))
              // Cast2.Add(Trim(LeftStr(Cast1[J],Pos('...', Cast1[J])-1)) + ', ')
            else if Trim(Cast1[J]) <> 'rest of cast listed alphabetically:' then
              Cast2.Add(Trim(Cast1[J]) + ', ');
        end;
        Dm.dsFileTableCast.Value := Cast2.Text;
      finally
        FreeAndNil(Cast1);
        FreeAndNil(Cast2);
      end;
      lblInfo.Caption := 'Done!';
    except
      on ex: Exception do
        ErrBox('Error: ' + ex.Message);
    end;

  finally
    Animate1.Visible := False;
    Animate1.Active := False;
    HTTPClient.Free;
    SS.Free;
    KeywordList.Free;
  end;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.RzBitBtn1Click(...)'}
procedure TfmMovieArchive.RzBitBtn1Click(Sender: TObject);
begin
  if Processing then begin
    lblBatchUpdate.Caption := 'Canceled';
    Processing := False;
    Exit;
  end else begin
    lblBatchUpdate.Caption := 'Working ...';
    Processing := True;
    Dm.dsFileTable.First;
    while not Dm.dsFileTable.Eof do begin
      if (Dm.dsFileTableCast.AsString = '') and (Dm.dsFileTableIMDB.AsString <> '') then
        acUpdateInfo.Execute;
      if Dm.dsFileTable.State in [dsEdit] then
        Dm.dsFileTable.Post;
      Dm.dsFileTable.Next;
      Application.ProcessMessages;
      if not Processing then
        Exit;
    end;
    lblBatchUpdate.Caption := '';
  end;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.RzBitBtn2Click(...)'}
procedure TfmMovieArchive.RzBitBtn2Click(Sender: TObject);
const
  Keywords = 'keywords';
  Credits = 'fullcredits';
var
  SS: TStrings;
  HTTPClient: TIdHTTP;
begin
  if Processing then begin
    lblBatchUpdate.Caption := 'Canceled';
    Processing := False;
    Exit;
  end else begin
    HTTPClient := TIdHTTP.Create(Self);
    SS := TStringList.Create;
    try
      lblBatchUpdate.Caption := 'Working ...';
      Processing := True;
      Dm.dsFileTable.First;
      ForceDirectories(ExtractFilePath(Application.ExeName) + 'Files\' + Keywords);
      ForceDirectories(ExtractFilePath(Application.ExeName) + 'Files\' + Credits);
      ForceDirectories(ExtractFilePath(Application.ExeName) + 'Files\combined');
      while not Dm.dsFileTable.Eof do begin
        if Dm.dsFileTableIMDB.AsString <> '' then begin
          HTTPClient.AllowCookies := True;
          HTTPClient.HandleRedirects := True;
          HTTPClient.Request.Accept := 'text/html, */*';
          HTTPClient.Request.AcceptCharSet := 'ISO-8859-1';
          HTTPClient.Request.AcceptLanguage := 'en-us';
          HTTPClient.Request.UserAgent := 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14';
          HTTPClient.HTTPOptions := [hoForceEncodeParams];

          Application.ProcessMessages;
          if not FileExists(ExtractFilePath(Application.ExeName) + 'Files\' + Dm.dsFileTableId.AsString + '.htm') then begin
            SS.Text := HTTPClient.Get(Dm.dsFileTableIMDB.AsString);
            SS.SaveToFile(ExtractFilePath(Application.ExeName) + 'Files\' + Dm.dsFileTableId.AsString + '.htm');
          end;
          if not Processing then
            Exit;

          Application.ProcessMessages;
          if not FileExists(ExtractFilePath(Application.ExeName) + 'Files\' + Keywords + '\' + Dm.dsFileTableId.AsString + '.htm') then begin
            SS.Text := HTTPClient.Get(Dm.dsFileTableIMDB.AsString + Keywords);
            SS.SaveToFile(ExtractFilePath(Application.ExeName) + 'Files\' + Keywords + '\' + Dm.dsFileTableId.AsString + '.htm');
          end;
          if not Processing then
            Exit;

          Application.ProcessMessages;
          if not FileExists(ExtractFilePath(Application.ExeName) + 'Files\' + Credits + '\' + Dm.dsFileTableId.AsString + '.htm') then begin
            SS.Text := HTTPClient.Get(Dm.dsFileTableIMDB.AsString + Credits);
            SS.SaveToFile(ExtractFilePath(Application.ExeName) + 'Files\' + Credits + '\' + Dm.dsFileTableId.AsString + '.htm');
          end;

          Application.ProcessMessages;
          if not FileExists(ExtractFilePath(Application.ExeName) + 'Files\combined\' + Dm.dsFileTableId.AsString + '.htm') then begin
            SS.Text := HTTPClient.Get(Dm.dsFileTableIMDB.AsString + 'combined');
            SS.SaveToFile(ExtractFilePath(Application.ExeName) + 'Files\combined\' + Dm.dsFileTableId.AsString + '.htm');
          end;

        end;
        Application.ProcessMessages;
        if not Processing then
          Exit;
        Dm.dsFileTable.Next;
      end;
      lblBatchUpdate.Caption := '';
    finally
      HTTPClient.Free;
      SS.Free;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'function TfmMovieArchive.ExtractMovieName(...):string'}
function TfmMovieArchive.ExtractMovieName(FileName: string): string;
begin
  FileName := CreateFileName(FileName);
  FileName := StringReplace(FileName, ExtractFileExt(FileName), '', [rfIgnoreCase]);
  FileName := StringReplace(FileName, 'Cd#', '', [rfReplaceAll, rfIgnoreCase]);
  FileName := StringReplace(FileName, '(' + ExtractMovieYear(FileName) + ')', '', []);
  FileName := StringReplace(FileName, '(', ' (', [rfReplaceAll, rfIgnoreCase]);
  FileName := StringReplace(FileName, '  ', ' ', [rfReplaceAll, rfIgnoreCase]);
  FileName := StringReplace(FileName, '  ', ' ', [rfReplaceAll, rfIgnoreCase]);
  FileName := StringReplace(FileName, ' - ', ': ', [rfReplaceAll, rfIgnoreCase]);
  Result := Trim(FileName);
end;
{$ENDREGION}

{$REGION 'function TfmMovieArchive.CreateFileName(...):string'}
function TfmMovieArchive.CreateFileName(FileName: string): string;
begin
  FileName := ExtractFileName(FileName);
  FileName := StringReplace(FileName, 'CD1', 'Cd#', [rfReplaceAll, rfIgnoreCase]);
  FileName := StringReplace(FileName, 'CD2', 'Cd#', [rfReplaceAll, rfIgnoreCase]);
  FileName := StringReplace(FileName, 'CD3', 'Cd#', [rfReplaceAll, rfIgnoreCase]);
  FileName := StringReplace(FileName, 'CD4', 'Cd#', [rfReplaceAll, rfIgnoreCase]);
  FileName := StringReplace(FileName, 'CD5', 'Cd#', [rfReplaceAll, rfIgnoreCase]);
  FileName := StringReplace(FileName, 'CD6', 'Cd#', [rfReplaceAll, rfIgnoreCase]);

  FileName := StringReplace(FileName, ')', ') ', [rfReplaceAll, rfIgnoreCase]);
  FileName := StringReplace(FileName, ') .', ').', [rfReplaceAll, rfIgnoreCase]);
  FileName := StringReplace(FileName, '(', ' (', [rfReplaceAll, rfIgnoreCase]);
  FileName := StringReplace(FileName, '  ', ' ', [rfReplaceAll, rfIgnoreCase]);
  FileName := StringReplace(FileName, '  ', ' ', [rfReplaceAll, rfIgnoreCase]);
  Result := Trim(FileName);
end;
{$ENDREGION}

{$REGION 'function TfmMovieArchive.ExtractMovieYear(...):string'}
function TfmMovieArchive.ExtractMovieYear(FileName: string): string;
begin
  Result := '';
  if (Pos('(', FileName) > 0) and (Pos(')', FileName) > 0) then begin
    Result := Copy(FileName, Pos('(', FileName) + 1, Pos(')', FileName) - Pos('(', FileName) - 1);
    if not((Length(Result) = 4) and IsNumeric(Result)) then
      Result := '';
  end;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.btnAddNamesClick(...)'}
procedure TfmMovieArchive.btnAddNamesClick(Sender: TObject);
var
  Filtered: Boolean;
  Bookmark: TBookmark;
  frmStatus: TfrmStatus;
  IndexField: string;
  MovieYear: string;
  MovieFile: string;
  MovieName: string;
  MovieType: string;
begin
  frmStatus := TfrmStatus.Create(Self);
  Dm.dsFileTable.DisableControls;
  try
    IndexField := Dm.dsFileTable.IndexFieldNames;
    Filtered := Dm.dsFileTable.Filtered;
    Dm.dsFileTable.Filtered := False;
    Bookmark := Dm.dsFileTable.GetBookmark;
    Dm.dsFileTable.IndexFieldNames := 'FileName,Id';
    Dm.dsFileTable.First;
    frmStatus.Progress.TotalParts := Dm.dsFileTable.RecordCount;
    frmStatus.Show;
    while not Dm.dsFileTable.Eof do begin
      frmStatus.Caption.Caption := Dm.dsFileTableName.AsString + '(' + Dm.dsFileTableYear.AsString + ')' + #13#10 + MovieName + '(' + MovieYear + ')';
      if (MovieFile = Dm.dsFileTableFileName.AsString) and
      // (MovieYear = Dm.dsFileTableYear.AsString) and
        (Dm.dsFileTableDirector.AsString = '') // and
      // (MovieFile = Dm.dsFileTableFileName.AsString) and
      // (Dm.dsFileTableIMDB.AsString='')
      then begin
        Dm.dsFileTable.Edit;
        Dm.dsFileTableDirector.Value := '@@@@@@';
        Dm.dsFileTable.Post;
      end;
      MovieName := Dm.dsFileTableName.AsString;
      MovieYear := Dm.dsFileTableYear.AsString;
      MovieFile := Dm.dsFileTableFileName.AsString;
      MovieType := Dm.dsFileTableMediaType.AsString;
      frmStatus.Progress.IncPartsByOne;
      Application.ProcessMessages;
      Dm.dsFileTable.Next;
      // if Status form is closed abort process
      if not frmStatus.Visible then
        Exit;
    end;
    Dm.dsFileTable.IndexFieldNames := IndexField;
    if Dm.dsFileTable.BookmarkValid(Bookmark) then
      Dm.dsFileTable.GotoBookmark(Bookmark);
    Dm.dsFileTable.FreeBookmark(Bookmark);
    Dm.dsFileTable.Filtered := Filtered;
  finally
    Dm.dsFileTable.EnableControls;
    frmStatus.Free;
  end;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.btnAssignFileNamesClick(...)'}
procedure TfmMovieArchive.btnAssignFileNamesClick(Sender: TObject);
var
  Bookmark: TBookmark;
  frmStatus: TfrmStatus;
  SS: TStrings;
  I: integer;
  MovieYear: string;
  MovieFile: string;
  MovieName: string;
  MovieType: string;
  Filtered: Boolean;
begin
  frmStatus := TfrmStatus.Create(Self);
  SS := TStringList.Create;
  Dm.dsFileTable.DisableControls;
  Filtered := Dm.dsFileTable.Filtered;
  Dm.dsFileTable.Filtered := False;
  Bookmark := Dm.dsFileTable.GetBookmark;
  try
    SS.LoadFromFile('I:\Movies.bak');
    frmStatus.Progress.PartsComplete := 0;
    frmStatus.Progress.TotalParts := SS.Count;
    frmStatus.Show;
    for I := 0 to SS.Count - 1 do begin
      frmStatus.Caption.Caption := SS[I];
      SS[I] := ExtractFileName(SS[I]);
      MovieFile := CreateFileName(SS[I]);
      MovieName := ExtractMovieName(SS[I]);
      MovieType := ExtractFileExt(SS[I]);
      MovieType := UpperCase(RightStr(MovieType, Length(MovieType) - 1));
      MovieYear := ExtractMovieYear(SS[I]);
      if Dm.dsFileTable.Locate('Name;Year', VarArrayOf([MovieName, MovieYear]), [loCaseInsensitive]) then begin
        if (MovieType = Dm.dsFileTableMediaType.AsString) or (Dm.dsFileTableMediaType.AsString = '') then begin
          Dm.dsFileTable.Edit;
          Dm.dsFileTableFileName.Value := MovieFile;
          if Pos('Cd#', UpperCase(MovieFile)) > 0 then
            Dm.dsFileTableMediaType.Value := 'Multi ' + MovieType
          else
            Dm.dsFileTableMediaType.Value := MovieType;
          Dm.dsFileTable.Post;
        end;
      end else begin
        Dm.dsFileTable.Insert;
        Dm.dsFileTableName.Value := MovieName;
        Dm.dsFileTableYear.Value := MovieYear;
        Dm.dsFileTableMediaType.Value := MovieType;
        Dm.dsFileTableFileName.Value := MovieFile;
        Dm.dsFileTable.Post;
      end;
      frmStatus.Progress.IncPartsByOne;
      Application.ProcessMessages;
      // if Status form is closed abort process
      if not frmStatus.Visible then
        Exit;
    end;
  finally
    if Dm.dsFileTable.BookmarkValid(Bookmark) then
      Dm.dsFileTable.GotoBookmark(Bookmark);
    Dm.dsFileTable.FreeBookmark(Bookmark);
    Dm.dsFileTable.Filtered := Filtered;
    Dm.dsFileTable.EnableControls;
    frmStatus.Free;
    SS.Free;
  end;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.btnCorrectMovieNamesClick(...)'}
procedure TfmMovieArchive.btnCorrectMovieNamesClick(Sender: TObject);
var
  Bookmark: TBookmark;
  frmStatus: TfrmStatus;
  Filtered: Boolean;
  MovieName: string;
  IndexField: string;
begin
  frmStatus := TfrmStatus.Create(Self);
  Dm.dsFileTable.DisableControls;
  try
    Filtered := Dm.dsFileTable.Filtered;
    Dm.dsFileTable.Filtered := False;
    Bookmark := Dm.dsFileTable.GetBookmark;
    frmStatus.Progress.PartsComplete := 0;
    frmStatus.Progress.TotalParts := Dm.dsFileTable.RecordCount;
    IndexField := Dm.dsFileTable.IndexFieldNames;
    Dm.dsFileTable.IndexFieldNames := 'Id';
    Dm.dsFileTable.First;
    frmStatus.Show;
    while not Dm.dsFileTable.Eof do begin
      MovieName := Dm.dsFileTableName.AsString;
      MovieName := StringReplace(MovieName, ')', ') ', [rfReplaceAll, rfIgnoreCase]);
      MovieName := StringReplace(MovieName, '(', ' (', [rfReplaceAll, rfIgnoreCase]);
      MovieName := StringReplace(MovieName, ' - ', ': ', [rfReplaceAll, rfIgnoreCase]);
      MovieName := StringReplace(MovieName, '  ', ' ', [rfReplaceAll, rfIgnoreCase]);
      MovieName := StringReplace(MovieName, '  ', ' ', [rfReplaceAll, rfIgnoreCase]);
      MovieName := Trim(MovieName);
      if Dm.dsFileTableName.AsString <> MovieName then begin
        frmStatus.Caption.Caption := Dm.dsFileTableName.AsString + #13#10 + MovieName;
        Dm.dsFileTable.Edit;
        Dm.dsFileTableName.Value := MovieName;
        Dm.dsFileTable.Post;
      end;
      frmStatus.Progress.IncPartsByOne;
      Application.ProcessMessages;
      Dm.dsFileTable.Next;
      // if Status form is closed abort process
      if not frmStatus.Visible then
        Exit;
    end;
    Dm.dsFileTable.IndexFieldNames := IndexField;
    if Dm.dsFileTable.BookmarkValid(Bookmark) then
      Dm.dsFileTable.GotoBookmark(Bookmark);
    Dm.dsFileTable.FreeBookmark(Bookmark);
    Dm.dsFileTable.Filtered := Filtered;
  finally
    Dm.dsFileTable.EnableControls;
    frmStatus.Free;
  end;
end;
{$ENDREGION}

{$REGION 'procedure TfmMovieArchive.btnFixFileNamesClick(...)'}
procedure TfmMovieArchive.btnFixFileNamesClick(Sender: TObject);
var
  Bookmark: TBookmark;
  frmStatus: TfrmStatus;
  FolderList: TStrings;
  Folder: string;
  Filtered: Boolean;
  IndexField: string;
  I: integer;

{$REGION 'procedure AddFile(...)'}
  procedure AddFile(FileName: string);
  var
    MovieType: string;
    MovieName: string;
    MovieFile: string;
    MovieYear: string;
  begin
    MovieFile := CreateFileName(FileName);
    MovieName := ExtractMovieName(FileName);
    MovieType := ExtractFileExt(FileName);
    MovieType := UpperCase(RightStr(MovieType, Length(MovieType) - 1));
    MovieYear := ExtractMovieYear(FileName);
    if Dm.dsFileTable.Locate('Name;Year', VarArrayOf([MovieName, MovieYear]), [loCaseInsensitive]) then begin
      if (MovieType = Dm.dsFileTableMediaType.AsString) or (Dm.dsFileTableMediaType.AsString = '') then begin
        if Pos('Cd#', UpperCase(MovieFile)) > 0 then
          MovieType := 'Multi ' + MovieType;
        Dm.dsFileTable.Edit;
        Dm.dsFileTableFileName.Value := MovieFile;
        Dm.dsFileTableMediaType.Value := MovieType;
        Dm.dsFileTable.Post;
      end;
    end else begin
      Dm.dsFileTable.Insert;
      Dm.dsFileTableName.Value := MovieName;
      Dm.dsFileTableYear.Value := MovieYear;
      Dm.dsFileTableMediaType.Value := MovieType;
      Dm.dsFileTableFileName.Value := MovieFile;
      Dm.dsFileTable.Post;
    end;
  end;
{$ENDREGION}

{$REGION 'procedure FindFiles(...)'}
  procedure FindFiles(Path: string; Recursive: Boolean = True);
  var
    SearchRec: TSearchRec;
  begin
    try
      if not DirectoryExists(Path) then
        Exit;
      if FindFirst(IncludeTrailingBackslash(Path) + '*.*', faAnyFile, SearchRec) = 0 then begin
        repeat
          if (SearchRec.Attr and faDirectory) = faDirectory then begin
            if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') and Recursive then begin
              FindFiles(IncludeTrailingBackslash(Path) + SearchRec.Name, Recursive);
            end;
          end else if ValidMovieExtention(ExtractFileExt(SearchRec.Name)) then begin
            if SearchRec.Size > 0 then begin
              AddFile(SearchRec.Name);
              frmStatus.Caption.Caption := SearchRec.Name;
            end;
          end;
          frmStatus.Progress.IncPartsByOne;
          Application.ProcessMessages;
          // if Status form is closed abort process
          if not frmStatus.Visible then
            Exit;
        until FindNext(SearchRec) <> 0;
        FindClose(SearchRec);
      end;
    except
      on ex: Exception do
        ErrBox(ex.Message);
    end;
  end;
{$ENDREGION}

begin
  frmStatus := TfrmStatus.Create(Self);
  Dm.dsFileTable.DisableControls;
  FolderList := TStringList.Create;
  try
    Filtered := Dm.dsFileTable.Filtered;
    Dm.dsFileTable.Filtered := False;
    Bookmark := Dm.dsFileTable.GetBookmark;
    frmStatus.Progress.PartsComplete := 0;
    frmStatus.Progress.TotalParts := 0;
    IndexField := Dm.dsFileTable.IndexFieldNames;
    Dm.dsFileTable.IndexFieldNames := 'Id';
    Dm.dsFileTable.First;
    frmStatus.Show;
    FolderList.Clear;
    FolderList.Text := StringReplace(edtPath.Text, ';', #13#10, [rfReplaceAll]);
    for I := 0 to FolderList.Count - 1 do begin
      Folder := Trim(FolderList[I]);
      if LeftStr(Folder, 1) = '+' then begin
        Folder := RightStr(Folder, Length(Folder) - 1);
        FindFiles(IncludeTrailingBackslash(Folder), True);
      end
      else
        FindFiles(IncludeTrailingBackslash(Folder), False);
      // if Status form is closed abort process
      if not frmStatus.Visible then
        Exit;
    end;
    Dm.dsFileTable.IndexFieldNames := IndexField;
    if Dm.dsFileTable.BookmarkValid(Bookmark) then
      Dm.dsFileTable.GotoBookmark(Bookmark);
    Dm.dsFileTable.FreeBookmark(Bookmark);
    Dm.dsFileTable.Filtered := Filtered;
  finally
    Dm.dsFileTable.EnableControls;
    frmStatus.Free;
    FolderList.Free;
  end;
end;
{$ENDREGION}

end.
