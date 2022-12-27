unit uVersionInfo;

interface

uses
  Windows, SysUtils, ShellApi;

type

  {$region 'DEF: record TVersionInfo'}
  TVersionInfo = record
    CompanyName      : string;
    FileDescription  : string;
    FileVersion      : string;
    Internalname     : string;
    LegalCopyright   : string;
    LegalTradeMarks  : string;
    OriginalFilename : string;
    ProductName      : string;
    ProductVersion   : string;
    Comments         : string;
    MajorVersion     : DWord;
    MinorVersion     : DWord;
    Release          : DWord;
    Build            : DWord;
    VersionString    : String;
  end;
  {$endregion}

function GetVersionInfo(HInstance: HINST):TVersionInfo;
function GetVersionInfoByName(ModuleName:string):TVersionInfo;

implementation

type
  {$region 'DEF: record TLangAndCP'}
TLangAndCP = record
  wLanguage : word;
  wCodePage : word;
  end;
PLangAndCP = ^TLangAndCP;
{$endregion}

{$region 'function GetVersionInfo(HInstance: HINST):TVersionInfo'}
function GetVersionInfo(HInstance: HINST):TVersionInfo;
begin
  Result:= GetVersionInfoByName(GetModuleName(HInstance));
end;
{$endregion}

{$region 'function GetVersionInfoByName(ModuleName:string):TVersionInfo;'}
function GetVersionInfoByName(ModuleName:string):TVersionInfo;
var
  TheLength : integer;
  Temp      : cardinal;
  Buffer    : PChar;
  Lang      : PLangAndCP;
  LangLen   : cardinal;
  SubBlock  : string;
  Value     : PChar;
  PVersion  : Pointer;
  Len       : cardinal;
begin
  TheLength := GetFileVersionInfoSize(PChar(ModuleName), Temp);
  if TheLength>0 then begin
    Buffer:=AllocMem(TheLength);
    try
      Windows.GetFileVersionInfo(PChar(ModuleName), 0, TheLength, Buffer);

      VerQueryValue(Buffer,PChar('\\VarFileInfo\\Translation'),Pointer(Lang),LangLen);

      SubBlock:=Format('\\StringFileInfo\\%.4x%.4x\\CompanyName',[Lang^.wLanguage,Lang^.wCodePage]);
      VerQueryValue(Buffer,PChar(SubBlock),Pointer(Value),Len);
      Result.CompanyName:=string(Value);

      SubBlock:=Format('\\StringFileInfo\\%.4x%.4x\\FileDescription',[Lang^.wLanguage,Lang^.wCodePage]);
      VerQueryValue(Buffer,PChar(SubBlock),Pointer(Value),Len);
      Result.FileDescription:=Value;

      SubBlock:=Format('\\StringFileInfo\\%.4x%.4x\\FileVersion',[Lang^.wLanguage,Lang^.wCodePage]);
      VerQueryValue(Buffer,PChar(SubBlock),Pointer(Value),Len);
      Result.FileVersion:=Value;

      SubBlock:=Format('\\StringFileInfo\\%.4x%.4x\\InternalName',[Lang^.wLanguage,Lang^.wCodePage]);
      VerQueryValue(Buffer,PChar(SubBlock),Pointer(Value),Len);
      Result.InternalName:=Value;

      SubBlock:=Format('\\StringFileInfo\\%.4x%.4x\\LegalCopyright',[Lang^.wLanguage,Lang^.wCodePage]);
      VerQueryValue(Buffer,PChar(SubBlock),Pointer(Value),Len);
      Result.LegalCopyright:=Value;

      SubBlock:=Format('\\StringFileInfo\\%.4x%.4x\\LegalTradeMarks',[Lang^.wLanguage,Lang^.wCodePage]);
      VerQueryValue(Buffer,PChar(SubBlock),Pointer(Value),Len);
      Result.LegalTradeMarks:=Value;

      SubBlock:=Format('\\StringFileInfo\\%.4x%.4x\\OriginalFilename',[Lang^.wLanguage,Lang^.wCodePage]);
      VerQueryValue(Buffer,PChar(SubBlock),Pointer(Value),Len);
      Result.OriginalFilename:=Value;

      SubBlock:=Format('\\StringFileInfo\\%.4x%.4x\\ProductName',[Lang^.wLanguage,Lang^.wCodePage]);
      VerQueryValue(Buffer,PChar(SubBlock),Pointer(Value),Len);
      Result.ProductName:=Value;

      SubBlock:=Format('\\StringFileInfo\\%.4x%.4x\\ProductVersion',[Lang^.wLanguage,Lang^.wCodePage]);
      VerQueryValue(Buffer,PChar(SubBlock),Pointer(Value),Len);
      Result.ProductVersion:=Value;

      SubBlock:=Format('\\StringFileInfo\\%.4x%.4x\\Comments',[Lang^.wLanguage,Lang^.wCodePage]);
      VerQueryValue(Buffer,PChar(SubBlock),Pointer(Value),Len);
      Result.Comments:=Value;

      VerQueryValue(Buffer, '\', PVersion, Len);
      Result.MajorVersion   := HiWord(TVSFixedFileInfo(PVersion^).dwFileVersionMS);
      Result.MinorVersion   := LoWord(TVSFixedFileInfo(PVersion^).dwFileVersionMS);
      Result.Release        := HiWord(TVSFixedFileInfo(PVersion^).dwFileVersionLS);
      Result.Build          := LoWord(TVSFixedFileInfo(PVersion^).dwFileVersionLS);
      Result.VersionString := 'V' + IntToStr(Result.MajorVersion) + '.' + IntToStr(Result.MinorVersion) + '.' + IntToStr(Result.Release) + ' Build ' + IntToStr(Result.Build);
    finally
      FreeMem(Buffer,TheLength);
    end;
  end;
end;
{$endregion}

end.
