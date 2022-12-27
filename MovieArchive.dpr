program MovieArchive;

uses
  Forms,
  XPMan,
  uMovieArchive in 'uMovieArchive.pas' {fmMovieArchive},
  uDataModule in 'uDataModule.pas' {Dm: TDataModule},
  uMonitorFolders in 'uMonitorFolders.pas' {fmMonitorFolders},
  uStatus in 'uStatus.pas' {frmStatus};

{$R *.res}


begin
  Application.Initialize;
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TfmMovieArchive, fmMovieArchive);
  Application.Run;
end.
