program MusicBar;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles,
  RenamePlaylistUnit in 'RenamePlaylistUnit.pas' {RenamePlaylistForm},
  CreatePlaylistUnit in 'CreatePlaylistUnit.pas' {CreatePlaylistForm},
  SettingsUnit in 'SettingsUnit.pas' {SettingsForm},
  EqualizerUnit in 'EqualizerUnit.pas' {EqualizerForm},
  AboutUnit in 'AboutUnit.pas' {AboutForm},
  ToolsUnit in 'ToolsUnit.pas',
  LocalizationUnit in 'LocalizationUnit.pas',
  HeaderInfo in 'HeaderInfo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('TabletDark');
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSettingsForm, SettingsForm);
  Application.CreateForm(TRenamePlaylistForm, RenamePlaylistForm);
  Application.CreateForm(TEqualizerForm, EqualizerForm);
  Application.CreateForm(TCreatePlaylistForm, CreatePlaylistForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.Run;
end.
