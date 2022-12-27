unit Procs;

interface

uses
  Forms, Windows, SysUtils, Dialogs, uVersionInfo;

const
  cAppRegistryRoot= 'Software\RTI\SAPService';
  cServiceName = 'RTProSAPService';
  cServiceFileName = 'RTProSAP.exe';
  cServiceDisplayName = 'RTPro SAP Service';

type
  TArguments = array of string;
  StringArray=array of string;

procedure ErrBox(ErrMsg : string);

function SplitString(InStr: String;SplitChar:string): StringArray;

function ValidName(Name:string):Boolean;

function GetWindowsDir:string;
function CreateConnectionString(Server,DatabaseName:string;UseWinLogon:Boolean;UserName:string='';Password:string=''):string;
function GetSpecialFolderPath(CSIDL_FolderName:Word):string;
function _FileSize(FileName: string): Integer;

function IsNumeric(const str: string): Boolean;
function WideStringReplace(const S, OldPattern, NewPattern: WideString; Flags: TReplaceFlags): WideString;

const
  cRegisteryKeyName  = '\SOFTWARE\RTI\RTProService';

var
  GUserID: String;
  GOrderNo : Integer;

  gVersionInfo:TVersionInfo;

  GAppPath: string;
  GPageNo: integer;
  GPrintOrder: TArguments;
  GRTFCommand: string;

implementation

uses
  ActiveX, ShlObj;


{$region 'function CreateConnectionString(Server,DatabaseName:string;UseWinLogon:Boolean;UserName:string='';Password:string=''):string'}
function CreateConnectionString(Server,DatabaseName:string;UseWinLogon:Boolean;UserName:string='';Password:string=''):string;
begin
  Result:='';
  if Server='' then
    Server:='.';
  Result:= 'Provider=SQLOLEDB.1;';
  Result := Result + 'Data Source=' + Server + ';';
  // if gDbLogonType = true then use logon user
  if UseWinLogon then
    Result := Result + 'Integrated Security=SSPI;Persist Security Info=False;'
  else begin
    Result := Result + 'Persist Security Info=True;User ID=' + UserName + ';Password=' + Password + ';'
  end;
  if DatabaseName<>'' then
    Result := Result + 'Initial Catalog='+DatabaseName+';';
end;
{$endregion}

{$region 'procedure ErrBox(ErrMsg : string);'}
procedure ErrBox(ErrMsg : string);
begin
  Beep;
  MessageDlg( ErrMsg, mtError, [ mbOK ], 0 );
end;
{$endregion}

{$region 'function Splitstring(Request: string;SplitChar:string): StringArray;'}
//Split string from SplitChar to an array of string
function SplitString(InStr: String;SplitChar:string): StringArray;
var
  I: Integer;
begin
  try
    SetLength(Result,1);
    I:=0;
    While (Pos(SplitChar, InStr) > 0)  do begin
      Result[I]:= Copy(InStr, 1, Pos(SplitChar,InStr)-1);
      InStr:=StringReplace(InStr,Result[I] + SplitChar,'',[]);
      SetLength(Result,Length(Result)+1);
      Inc(I);
    end;
    Result[I]:=InStr;
  except
  end;
end;
{$endregion}

{$region 'function ValidName(Name:string):Boolean;'}
function ValidName(Name:string):Boolean;
const
  ValidChars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz01234567890_';
var
  Index:Integer;
begin
  for Index:=1 to Length(Name) do
    if Pos(Name[Index],ValidChars)=0 then begin
      Result:=False;
      Exit;
    end;
  Result:=True;
end;
{$endregion}

{$region 'function GetWindowsDir:string;'}
//returns C:\WINNT (without last backslash)
function GetWindowsDir:string;
var
  TempStr:string;
  LngPtr:Longint;
begin
  SetLength(TempStr,MAX_PATH);
  LngPtr:=GetWindowsDirectory(pchar(TempStr),Length(TempStr));
  SetLength(TempStr,LngPtr);
  Result:=TempStr;
end;
{$endregion}

{$region 'function GetSpecialFolderPath(CSIDL_FolderName:Word):string;'}
{
  Constants:

  CSIDL_DESKTOP
  CSIDL_INTERNET
  CSIDL_PROGRAMS
  CSIDL_CONTROLS
  CSIDL_PRINTERS
  CSIDL_PERSONAL
  CSIDL_FAVORITES
  CSIDL_STARTUP
  CSIDL_RECENT
  CSIDL_SENDTO
  CSIDL_BITBUCKET
  CSIDL_STARTMENU
  CSIDL_DESKTOPDIRECTORY
  CSIDL_DRIVES
  CSIDL_NETWORK
  CSIDL_NETHOOD
  CSIDL_FONTS
  CSIDL_TEMPLATES
  CSIDL_COMMON_STARTMENU
  CSIDL_COMMON_PROGRAMS
  CSIDL_COMMON_STARTUP
  CSIDL_COMMON_DESKTOPDIRECTORY
  CSIDL_APPDATA
  CSIDL_PRINTHOOD
  CSIDL_ALTSTARTUP
  CSIDL_COMMON_ALTSTARTUP
  CSIDL_COMMON_FAVORITES
  CSIDL_INTERNET_CACHE
  CSIDL_COOKIES
  CSIDL_HISTORY
}
function GetSpecialFolderPath(CSIDL_FolderName:Word):string;
// Replace CSIDL_HISTORY with the constants below
var
  Allocator: IMalloc;
  SpecialDir: PItemIdList;
  FBuf: array[0..MAX_PATH] of Char;
begin
  if SHGetMalloc(Allocator) = NOERROR then begin
    SHGetSpecialFolderLocation(Application.Handle, CSIDL_FolderName, SpecialDir);
    SHGetPathFromIDList(SpecialDir, @FBuf[0]);
    Allocator.Free(SpecialDir);
    Result:=FBuf;
  end;
end;
{$endregion}

{$region 'function _FileSize(FileName: string): Integer;'}
function _FileSize(FileName: string): Integer;
{
 for some reason both methods of finding file size return
 a filesize that is slightly larger than what Windows File
 Explorer reports
}
var
  FileHandle: THandle;
begin
  FileHandle := CreateFile(PChar(FileName), GENERIC_READ, 0, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Result     := GetFileSize(FileHandle, nil);
  CloseHandle(FileHandle);
end;
{$endregion}

{$region 'function IsNumeric(const str: string): Boolean;'}
function IsNumeric(const str: string): Boolean;
var
 i: Integer;
begin
 Result := True;
 for i:=1 to Length(str) do
   if not (str[i] in ['0'..'9']) then begin
     Result := False;
     Exit;
   end;
end;
{$endregion}

{$region 'function WideStringReplace(const S, OldPattern, NewPattern: WideString; Flags: TReplaceFlags): WideString;'}
function WideStringReplace(const S, OldPattern, NewPattern: WideString; Flags: TReplaceFlags): WideString;
var
  SearchStr, Patt, NewStr: WideString;
  Offset: Integer;
begin
  if rfIgnoreCase in Flags then begin
    SearchStr := WideUpperCase(S);
    Patt := WideUpperCase(OldPattern);
  end else begin
    SearchStr := S;
    Patt := OldPattern;
  end;

  NewStr := S;
  Result := '';
  while SearchStr <> '' do begin
    Offset := Pos(Patt, SearchStr);
    if Offset = 0 then begin
      Result := Result + NewStr;
      Break;
    end;

    Result := Result + Copy(NewStr, 1, Offset - 1) + NewPattern;
    NewStr := Copy(NewStr, Offset + Length(OldPattern), MaxInt);
    if not (rfReplaceAll in Flags) then begin
      Result := Result + NewStr;
      Break;
    end;
    SearchStr := Copy(SearchStr, Offset + Length(Patt), MaxInt);
  end;
end;
{$endregion}

{$region 'function WideStrPos(Str, SubStr: PWideChar): PWideChar;'}
function WideStrPos(Str, SubStr: PWideChar): PWideChar;
var
  PSave: PWideChar;
  P: PWideChar;
  PSub: PWideChar;
begin
  // returns a pointer to the first occurance of SubStr in Str
  Result := nil;
  if (Str <> nil) and (Str^ <> #0) and (SubStr <> nil) and (SubStr^ <> #0) then begin
    P := Str;
    While P^ <> #0 do begin
      if P^ = SubStr^ then begin
        // investigate possibility here
        PSave := P;
        PSub := SubStr;
        While (P^ = PSub^) do begin
          Inc(P);
          Inc(PSub);
          if (PSub^ = #0) then begin
            Result := PSave;
            exit; // found a match
          end;
          if (P^ = #0) then
            exit; // no match, hit end of string
        end;
        P := PSave;
      end;
      Inc(P);
    end;
  end;
end;
{$endregion}

end.
