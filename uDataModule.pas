unit uDataModule;

interface

//Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=.\MovieArchive.mdb

uses
  SysUtils, Classes, DB, ADODB;

type
  {$region 'TDm = class(TDataModule)'}
  TDm = class(TDataModule)
    dsFileTable: TADODataSet;
    Conn: TADOConnection;
    Command: TADOCommand;
    dsSameCD: TADODataSet;
    daSameCD: TDataSource;
    dsFileTableId: TAutoIncField;
    dsFileTableName: TWideStringField;
    dsFileTableDirector: TWideStringField;
    dsFileTableYear: TWideStringField;
    dsFileTableGenre: TWideStringField;
    dsFileTableCast: TWideMemoField;
    dsFileTableMPAA: TWideStringField;
    dsFileTableIMDB: TWideStringField;
    dsFileTableMediaType: TWideStringField;
    dsFileTableCdNo: TIntegerField;
    dsFileTableKeywords: TWideMemoField;
    dsFileTableAKA: TWideMemoField;
    dsFileTableFileName: TWideStringField;
    dsSameCDId: TAutoIncField;
    dsSameCDName: TWideStringField;
    dsSameCDDirector: TWideStringField;
    dsSameCDYear: TWideStringField;
    dsSameCDGenre: TWideStringField;
    dsSameCDCast: TWideMemoField;
    dsSameCDMPAA: TWideStringField;
    dsSameCDIMDB: TWideStringField;
    dsSameCDMediaType: TWideStringField;
    dsSameCDCdNo: TIntegerField;
    dsSameCDKeywords: TWideMemoField;
    dsSameCDAKA: TWideMemoField;
    dsSameCDFileName: TWideStringField;
    procedure dsFileTableAfterScroll(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
  public
  end;
  {$endregion}

var
  Dm: TDm;

implementation

uses
  Forms, ADOInt;

{$R *.dfm}

{$region 'procedure TDm.DataModuleCreate(Sender: TObject);'}
procedure TDm.DataModuleCreate(Sender: TObject);
begin
  if Conn.Connected then
    Conn.Close;
  Conn.ConnectionString:= 'Provider=Microsoft.Jet.OLEDB.4.0;Persist Security Info=False;Data Source=' + StringReplace(Application.ExeName, ExtractFileExt(Application.ExeName),'',[]) + '.mdb';
  Conn.Open;
  dsFileTable.Open;
  dsSameCD.Open;
  dsFileTable.Properties['Update Criteria'].value :=adCriteriaKey;
  dsSameCD.Filtered:=True;
end;
{$endregion}

{$region 'procedure TDm.dsFileTableAfterScroll(DataSet: TDataSet);'}
procedure TDm.dsFileTableAfterScroll(DataSet: TDataSet);
begin
  if dsFileTableCdNo.AsString<>'' then begin
    dsSameCD.Filter:= 'CdNo = ' + dsFileTableCdNo.AsString;
  end else begin
    dsSameCD.Filter:='CdNo= Null or CdNo=0';
  end;
end;
{$endregion}

end.

