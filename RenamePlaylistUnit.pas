unit RenamePlaylistUnit;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
    TRenamePlaylistForm = class(TForm)
        NameLabel: TLabel;
        NameEdit: TEdit;
        SaveButton: TBitBtn;
        CancelButton: TBitBtn;
        procedure SaveButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    RenamePlaylistForm: TRenamePlaylistForm;

implementation

{$R *.dfm}

uses
    MainUnit, LocalizationUnit, ToolsUnit;

const
    PLAYLISTS_NAME = 'Playlists';

procedure TRenamePlaylistForm.CancelButtonClick(Sender: TObject);
begin
    RenamePlaylistForm.Close;
end;

procedure TRenamePlaylistForm.SaveButtonClick(Sender: TObject);
var
    ErrorCap, ErrorMsg, TrackName, NewPlaylistName, CurrentPlaylist: string;
    IsClosed, IsPlayed: Boolean;
    CurrentPosition: Integer;
begin
    if Length(NameEdit.Text) <> 0 then
    begin
        if not FileExists(ExeDirectory + PLAYLISTS_NAME) then
            CreateDir(ExeDirectory + PLAYLISTS_NAME);
        MainForm.MusicListBox.FileName := ExeDirectory;
        IsClosed := False;
        if IsActive then
        begin
            IsPlayed := IsPlaying;
            CurrentPlaylist := CurrentPlaylistDirectory;
            IsClosed := True;
            TrackName := Tools.CuteName(MainForm.MusicPlayer.FileName);
            CurrentPosition := MainForm.MusicPlayer.Position;
            MainForm.MusicPlayer.Close;
        end;
        NewPlaylistName := ExeDirectory + '\' + PLAYLISTS_NAME + '\' + NameEdit.Text;
        RenameFile(CurrentPlaylistDirectory, NewPlaylistName);
        MainForm.UpdatePlaylists;
        CurrentPlaylistDirectory := NewPlaylistName;
        MainForm.MusicListBox.Directory := CurrentPlaylistDirectory;
        MainForm.MusicListBox.Update;
        MainForm.MusicLabel.Caption := NameEdit.Text;
        if IsClosed then
        begin
            if NowPlayPlaylistDir = CurrentPlaylist then
            begin
                MainForm.OpenTrack(NewPlaylistName + '\' + TrackName);
                NowPlayPlaylistDir := NewPlaylistName;
            end
            else
                MainForm.OpenTrack(NowPlayPlaylistDir + '\' + TrackName);
            MainForm.MusicPlayer.Position := CurrentPosition;
            if isPlayed then
                MainForm.PlayMusic
            else
                MainForm.PauseMusic;
        end;
        RenamePlaylistForm.Close;

    end
    else
    begin
        Localization.SelectLanguageForMessage(
            ErrorCap, ErrorMsg,
            ERROR_CAP_RUS, ENT_PLST_NAME_RUS,
            ERROR_CAP_ENG, ENT_PLST_NAME_ENG);
        MessageBox(Handle, PChar(ErrorMsg), PChar(ErrorCap), MB_OK + MB_ICONERROR);
    end;
end;

end.
