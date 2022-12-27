unit uNetUtils;

interface

uses
  Windows, Messages, SysUtils, WinSock, DateUtils, PsAPI, Classes;

function GetServerName: String;
function GetCurrentUser: string;

function GetProcessMemorySize: Longint;
function WindowsUpTime: string;
function GetAvailableMemory: TMemoryStatus;

function GetEnvVarValue(const VarName: string): string;
function GetWindowsDir: string;

// This function refreshs Environment varialbles block for every application that has window
procedure BroadcastChange;
function HTMLDecode(const AStr: WideString): WideString;

implementation

uses
  Dialogs, Procs, StrUtils, WideStrUtils;

{$REGION 'function GetServerName: String;'}
function GetServerName: String;
var
  LenCompName: Cardinal;
  ComputerName: pChar;
begin
  LenCompName := 255;
  GetMem(ComputerName, LenCompName);
  GetComputerName(ComputerName, LenCompName);
  Result := ComputerName;
  FreeMem(ComputerName);
end;
{$ENDREGION}

{$REGION 'GetCurrentUser'}
function GetCurrentUser: string;
var
  UserName: pChar;
  BufLength: Cardinal;
begin
  try
    GetMem(UserName, BufLength);
    try
      BufLength := 32;
      GetUserName(UserName, BufLength);
      Result := UserName;
    finally
      FreeMem(UserName);
    end;
  except
  end;
end;
{$ENDREGION}

{$REGION 'function GetProcessMemorySize: Longint;'}
function GetProcessMemorySize: Longint;
var
  pmc: PPROCESS_MEMORY_COUNTERS;
begin
  Result := 0;
  GetMem(pmc, SizeOf(TProcessMemoryCounters));
  pmc^.cb := SizeOf(TProcessMemoryCounters);
  if GetProcessMemoryInfo(GetCurrentProcess(), pmc, SizeOf(TProcessMemoryCounters)) then
    Result := Longint(pmc^.WorkingSetSize);
  FreeMem(pmc);
end;
{$ENDREGION}

{$REGION 'function WindowsUpTime: string;'}
function WindowsUpTime: string;
const
  TicksPerSecond: DWORD = 1000;
  TicksPerMinute: DWORD = 1000 * 60;
  TicksPerHour: DWORD = 1000 * 60 * 60;
  TicksPerDay: DWORD = 1000 * 60 * 60 * 24;
var
  T: DWORD;
  D, H, M, S: DWORD;
begin
  T := GetTickCount;
  D := T div TicksPerDay;
  Dec(T, D * TicksPerDay);
  H := T div TicksPerHour;
  Dec(T, H * TicksPerHour);
  M := T div TicksPerMinute;
  Dec(T, M * TicksPerMinute);
  S := T div TicksPerSecond;
  Result := IntToStr(D) + ' Days and ' + IntToStr(H) + ':' + IntToStr(M) + ':' + IntToStr(S);
end;
{$ENDREGION}

{$REGION 'function GetAvailableMemory;'}
function GetAvailableMemory: TMemoryStatus;
var
  memory: TMemoryStatus;
begin
  memory.dwLength := SizeOf(memory);
  GlobalMemoryStatus(memory);
  Result := memory;
end;
{$ENDREGION}

{$REGION 'function GetEnvVarValue(const VarName: string): string;'}
function GetEnvVarValue(const VarName: string): string;
var
  BufSize: Integer;
begin
  BufSize := GetEnvironmentVariable(pChar(VarName), nil, 0);
  if BufSize > 0 then
  begin
    SetLength(Result, BufSize - 1);
    GetEnvironmentVariable(pChar(VarName), pChar(Result), BufSize);
  end
  else
    Result := '';
end;
{$ENDREGION}

{$REGION 'procedure BroadcastChange;'}
// This function refreshs Environment varialbles block for every application that has window
procedure BroadcastChange;
var
  lParam, wParam: Integer;
  Buf: Array [0 .. 10] of Char;
  aResult: Cardinal;
begin
  Buf := 'Environment';
  wParam := 0;
  lParam := Integer(@Buf[0]);
  SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE, wParam, lParam, SMTO_NORMAL, 4000, aResult);
  // SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE, 0, LParam(PChar('Environment')), SMTO_ABORTIFHUNG, 5000, rv);
  if aResult <> 0 then
    SysErrorMessage(aResult);
end;
{$ENDREGION}

{$REGION 'function GetWindowsDir:string;'}
// returns C:\WINNT\ (including last backslash)
function GetWindowsDir: string;
var
  TempStr: string;
  LngPtr: Longint;
begin
  SetLength(TempStr, MAX_PATH);
  LngPtr := GetWindowsDirectory(pChar(TempStr), Length(TempStr));
  SetLength(TempStr, LngPtr);
  Result := IncludeTrailingBackslash(TempStr);
end;
{$ENDREGION}

{$REGION 'function GetHTMLReplaceStringList: TStringList;'}

const
  HtmlCodedChars: array [0 .. 99, 0 .. 1] of WideString = (
    ('&quot;', '"'), ('&lt;', '<'), ('&gt;', '>'), ('&nbsp;', ' '), ('&iexcl;', '¡'),
    ('&cent;', '¢'), ('&pound;', '£'), ('&curren;', '¤'), ('&yen;', '¥'), ('&brvbar;', '¦'),
    ('&sect;', '§'), ('&uml;', '¨'), ('&copy;', '©'), ('&ordf;', 'ª'), ('&laquo;', '«'),
    ('&not;', '¬'), ('&shy;', '-'), ('&reg;', '®'), ('&macr;', '¯'), ('&deg;', '°'),
    ('&plusmn;', '±'), ('&sup2;', '²'), ('&sup3;', '³'), ('&acute;', '´'), ('&micro;', 'µ'),
    ('&para;', '¶'), ('&middot;', '·'), ('&cedil;', '¸'), ('&sup1;', '¹'), ('&ordm;', 'º'),
    ('&raquo;', '»'), ('&frac14;', '¼'), ('&frac12;', '½'), ('&frac34;', '¾'), ('&iquest;', '¿'),
    ('&Agrave;', 'À'), ('&Aacute;', 'Á'), ('&Acirc;', 'Â'), ('&Atilde;', 'Ã'), ('&Auml;', 'Ä'),
    ('&Aring;', 'Å'), ('&AElig;', 'Æ'), ('&Ccedil;', 'Ç'), ('&Egrave;', 'È'), ('&Eacute;', 'É'),
    ('&Ecirc;', 'Ê'), ('&Euml;', 'Ë'), ('&Igrave;', 'Ì'), ('&Iacute;', 'Í'), ('&Icirc;', 'Î'),
    ('&Iuml;', 'Ï'), ('&ETH;', 'Ð'), ('&Ntilde;', 'Ñ'), ('&Ograve;', 'Ò'), ('&Oacute;', 'Ó'),
    ('&Ocirc;', 'Ô'), ('&Otilde;', 'Õ'), ('&Ouml;', 'Ö'), ('&times;', '×'), ('&Oslash;', 'Ø'),
    ('&Ugrave;', 'Ù'), ('&Uacute;', 'Ú'), ('&Ucirc;', 'Û'), ('&Uuml;', 'Ü'), ('&Yacute;', 'Ý'),
    ('&THORN;', 'Þ'), ('&szlig;', 'ß'), ('&agrave;', 'à'), ('&aacute;', 'á'), ('&acirc;', 'â'),
    ('&atilde;', 'ã'), ('&auml;', 'ä'), ('&aring;', 'å'), ('&aelig;', 'æ'), ('&ccedil;', 'ç'),
    ('&egrave;', 'è'), ('&eacute;', 'é'), ('&ecirc;', 'ê'), ('&euml;', 'ë'), ('&igrave;', 'ì'),
    ('&iacute;', 'í'), ('&icirc;', 'î'), ('&iuml;', 'ï'), ('&eth;', 'ð'), ('&ntilde;', 'ñ'),
    ('&ograve;', 'ò'), ('&oacute;', 'ó'), ('&ocirc;', 'ô'), ('&otilde;', 'õ'), ('&ouml;', 'ö'),
    ('&divide;', '÷'), ('&oslash;', 'ø'), ('&ugrave;', 'ù'), ('&uacute;', 'ú'), ('&ucirc;', 'û'),
    ('&uuml;', 'ü'), ('&yacute;', 'ý'), ('&thorn;', 'þ'), ('&yuml;', 'ÿ'), ('&amp;', '&')
    );
{$ENDREGION}

{$REGION 'function HTMLDecode(const AStr: WideString): WideString;'}
function HTMLDecode(const AStr: WideString): WideString;
const
  UnicodeChar: WideString = '&#';
var
  S: WideString;
  I: Integer;
begin
  try
    Result := AStr;
    while Pos(UnicodeChar, Result) > 0 do
    begin
      S := Copy(Result, Pos(UnicodeChar, Result) + 2, PosEx(';', Result, Pos(UnicodeChar, Result) + 2) - PosEx(UnicodeChar, Result, 0) - 2);
      Result := WideStringReplace(Result, UnicodeChar + S + ';', WideChar(StrToInt(S)), [rfReplaceAll]);
    end;
    for I := 0 to Length(HtmlCodedChars) do
      Result := WideStringReplace(Result, '&quot;', '"', []);
    Result := WideStringReplace(Result, '&amp;', '&', []);
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;
{$ENDREGION}


end.
