unit uMonitorFolders;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, Mask, RzEdit, RzBtnEdt, RzButton, RzBorder;

type
  {$region 'TfmMonitorFolders = class(TForm)'}
  TfmMonitorFolders = class(TForm)
    lstMonitorFolders: TListBox;
    edtPath: TRzButtonEdit;
    lblFolderMonitor: TRzLabel;
    RzLabel1: TRzLabel;
    btnAdd: TRzButton;
    btnDelete: TRzButton;
    btnDeleteInvalidPath: TRzButton;
    btnReplace: TRzButton;
    Border1: TRzBorder;
    BtnCancel: TRzBitBtn;
    btnOk: TRzBitBtn;
    procedure edtPathButtonClick(Sender: TObject);
    procedure btnReplaceClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure lstMonitorFoldersDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure lstMonitorFoldersClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteInvalidPathClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;
  {$endregion}

implementation

{$R *.dfm}

uses
  FileCtrl, StrUtils;

{$region 'procedure TfmMonitorFolders.FormCreate(Sender: TObject);'}
procedure TfmMonitorFolders.FormCreate(Sender: TObject);
begin
  Font.Size:=10;
end;
{$endregion}

{$region 'procedure TfmMonitorFolders.FormShow(Sender: TObject);'}
procedure TfmMonitorFolders.FormShow(Sender: TObject);
begin
  if lstMonitorFolders.Count>0 then begin
    lstMonitorFolders.ItemIndex:=0;
    edtPath.Text:= lstMonitorFolders.Items[0];
  end;
end;
{$endregion}


{$region 'procedure TfmMonitorFolders.btnDeleteInvalidPathClick(Sender: TObject);'}
procedure TfmMonitorFolders.btnDeleteInvalidPathClick(Sender: TObject);
var
  I:Integer;
  Folder:string;
begin
  for I:= lstMonitorFolders.Items.Count-1 downto 0 do begin
    Folder:=lstMonitorFolders.Items[I];
    if LeftStr(Folder,1) = '+' then
      Folder:=RightStr(Folder,Length(Folder)-1);
    if not DirectoryExists(Folder) then
      lstMonitorFolders.Items.Delete(I);
  end;
  if lstMonitorFolders.Count>0 then begin
    lstMonitorFolders.ItemIndex:=0;
    edtPath.Text:= lstMonitorFolders.Items[0];
  end;
end;
{$endregion}

{$region 'procedure TfmMonitorFolders.btnAddClick(Sender: TObject);'}
procedure TfmMonitorFolders.btnAddClick(Sender: TObject);
begin
  lstMonitorFolders.Items.Add(edtPath.Text);
end;
{$endregion}

{$region 'procedure TfmMonitorFolders.lstMonitorFoldersClick(Sender: TObject);'}
procedure TfmMonitorFolders.lstMonitorFoldersClick(Sender: TObject);
begin
  if lstMonitorFolders.ItemIndex>-1 then
    edtPath.Text:= lstMonitorFolders.Items[lstMonitorFolders.ItemIndex]
end;
{$endregion}

{$region 'procedure TfmMonitorFolders.lstMonitorFoldersDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);'}
procedure TfmMonitorFolders.lstMonitorFoldersDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  Folder:string;  
begin
  Folder:=lstMonitorFolders.Items[Index];
  if LeftStr(Folder,1) = '+' then
    Folder:=RightStr(Folder,Length(Folder)-1);
  if not DirectoryExists(Folder) then
    lstMonitorFolders.Canvas.Font.Color:=clGrayText
  else if (odFocused in State) or (odSelected in State) then
    lstMonitorFolders.Canvas.Font.Color:=clCaptionText
  else
    lstMonitorFolders.Canvas.Font.Color:=clWindowText;
  lstMonitorFolders.Canvas.TextRect(Rect,2, Index * lstMonitorFolders.ItemHeight,lstMonitorFolders.Items[Index]);
end;
{$endregion}

{$region 'procedure TfmMonitorFolders.btnDeleteClick(Sender: TObject);'}
procedure TfmMonitorFolders.btnDeleteClick(Sender: TObject);
var
  CurrentItem:Integer;
begin
  if lstMonitorFolders.ItemIndex>-1 then begin
    CurrentItem:= lstMonitorFolders.ItemIndex;
    lstMonitorFolders.Items.Delete(lstMonitorFolders.ItemIndex);
    if CurrentItem>0 then
      lstMonitorFolders.ItemIndex:=CurrentItem-1
    else if lstMonitorFolders.Count>0 then
      lstMonitorFolders.ItemIndex:=0;
  end;
  if lstMonitorFolders.ItemIndex>-1 then
    edtPath.Text:= lstMonitorFolders.Items[lstMonitorFolders.ItemIndex]
  else
    edtPath.Text:= '';
end;
{$endregion}

{$region 'procedure TfmMonitorFolders.btnReplaceClick(Sender: TObject);'}
procedure TfmMonitorFolders.btnReplaceClick(Sender: TObject);
begin
  if lstMonitorFolders.ItemIndex>-1 then
    lstMonitorFolders.Items[lstMonitorFolders.ItemIndex]:= edtPath.Text;
end;
{$endregion}

{$region 'procedure TfmMonitorFolders.edtPathButtonClick(Sender: TObject);'}
procedure TfmMonitorFolders.edtPathButtonClick(Sender: TObject);
var
  Directory:string;
begin
  Directory:=edtPath.text;
  if SelectDirectory('Select Save Folder','',Directory,[sdNewFolder,sdShowShares, sdNewUI, sdValidateDir]) then
    edtPath.Text:=Directory;
end;
{$endregion}

end.
