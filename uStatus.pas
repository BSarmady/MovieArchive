unit uStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, RzStatus;

type
  TfrmStatus = class(TForm)
    Progress: TRzProgressStatus;
    caption: TRzLabel;
    Label1: TRzLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmStatus.FormCreate(Sender: TObject);
begin
  caption.Caption := '';
  Progress.PartsComplete :=0;
end;

procedure TfrmStatus.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then
    Close;
end;

end.
