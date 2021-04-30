unit LocalizationUnit;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.MPlayer, Vcl.StdCtrls, Vcl.ComCtrls,
    Vcl.Menus, Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.Buttons, Vcl.FileCtrl,
    Vcl.WinXCtrls, mmsystem, ShellAPI, Vcl.Imaging.pngimage, Vcl.JumpList,
    Vcl.WinXPickers, Vcl.TabNotBk, Vcl.ExtDlgs;

type
    TLanguages = (ENG, RUS);
    TLocalization = class(TObject)
        procedure SetLanguage(Language: TLanguages);
        procedure SelectLanguageForMessage(var Cap, Msg: string; RUS_CAP, RUS_MSG, ENG_CAP, ENG_MSG: string);
        procedure SelectLanguageForCaption(var Msg: string; RUS_MSG, ENG_MSG: string);
    end;

const
    RUS_LNG = 'RUS';
    ENG_LNG = 'ENG';

    DAMAGED_FILE_RUS = 'Файл повреждён. Выберите другой файл!';
    DAMAGED_FILE_ENG = 'The file is damaged. Please select another file!';

    ERROR_CAP_RUS = 'Ошибка';
    ERROR_CAP_ENG = 'Error';

    TRACK_NOT_FOUND_RUS = 'Трек не найден в плейлисте';
    TRACK_NOT_FOUND_ENG = 'Track not found in playlist';

    SELECT_TRACK_ENG = 'Select track';
    SELECT_TRACK_RUS = 'Выберите трек';

    DEL_TRACK_QUEST_RUS = 'Вы действительно хотите удалить трек: ';
    DEL_TRACK_QUEST_ENG = 'Do you really want to delete the track: ';

    DEL_TRACK_CAP_RUS = 'Удалить трек';
    DEL_TRACK_CAP_ENG = 'Delete track';

    DEL_PLAYLIST_CAP_RUS = 'Удалить плейлист';
    DEL_PLAYLIST_CAP_ENG = 'Delete playlist';

    DEL_PLAYLIST_QUEST_RUS = 'Вы действительно хотите удалить плейлист: ';
    DEL_PLAYLIST_QUEST_ENG = 'Are you sure you want to delete the playlist: ';

    PLST_NOT_FOUND_RUS = 'Плейлист не найден';
    PLST_NOT_FOUND_ENG = 'Playlist not found';

    SELECT_FOLDER_TITLE_ENG = 'Select a playlist (folder)';
    SELECT_FOLDER_TITLE_RUS = 'Выберите плейлист (папку)';

    SELECT_PLAYLIST_ENG = 'Select a playlist';
    SELECT_PLAYLIST_RUS = 'Выберите плейлист';

    TRACKS_LBL_ENG = 'TRACKS: ';
    TRACKS_LBL_RUS = 'ТРЕКОВ: ';

    CHNG_SUCC_MSG_RUS = 'Изменения успешно сохранены';
    CHNG_SUCC_MSG_ENG = 'Changes saved successfully';

    SETTINGS_CAP_RUS = 'Настройки';
    SETTINGS_CAP_ENG = 'Settings';

    ERR_MSG_RUS = 'Ошибка доступа к файлу конфигураций, изменения сохранены не будут';
    ERR_MSG_ENG = 'Configuration file access error, changes will not be saved';

    ENT_PLST_NAME_RUS = 'Введите название плейлиста';
    ENT_PLST_NAME_ENG = 'Enter playlist title';



var
  Localization: TLocalization;
  Language: TLanguages;

implementation

uses
    MainUnit, CreatePlaylistUnit, RenamePlaylistUnit, AboutUnit, SettingsUnit;

procedure TLocalization.SetLanguage(Language: TLanguages);
begin
    if Language = ENG then
    begin
        with SettingsForm do
        begin
            Caption := 'Settings';
            SettingsLabel.Caption := 'SETTINGS';
            LngLabel.Caption := 'Language';
            AboutButton.Caption := 'About program';
            SaveSettingsButton.Caption := 'Save settings';
        end;

        with MainForm do
        begin
            PlaylistLabel.Caption := 'PLAYLISTS';
            NowPlayLabel.Caption := 'Now play:';

            RepeatButton.Hint := 'Loop track';
            MuteButton.Hint := 'Mute sound';
            ShowPlaylistsButton.Hint := 'Show playlists';
            SettingsButton.Hint := 'Settings';

            CreatePlaylistButton.Hint := 'Create playlist';
            AddPlaylistButton.Hint := 'Add playlist';
            DeletePlaylistButton.Hint := 'Delete playlist';
            UpdatePlaylistsButton.Hint := 'Update playlists';
            ShowPlstsInExpButton.Hint := 'Open playlists in explorer';

            BackButton.Hint := 'Back';
            AddMusicButton.Hint := 'Add track';
            DeleteMusicButton.Hint := 'Delete track';
            UpdateTracksButton.Hint := 'Update tracks';
            ShowCurrPlstInExpButton.Hint := 'Open playlist in explorer';

            RenamePlaylistButton.Hint := 'Rename';
            ChangeCoverButton.Hint := 'Change cover';

            AddMusicDialog.Title := 'Add track';
            AddPlaylistDialog.Title := 'Add playlist';
            OpenPictureDialog.Title := 'Change cover';
        end;

        with CreatePlaylistForm do
        begin
            OpenPictureDialog.Title := 'Select cover';
            AddMusicDialog.Title :=  'Add track';
            Caption := 'Create playlist';
            NameLabel.Caption := 'Name';
            CoverLabel.Caption := 'Cover';
            TracksLabel.Caption := 'Tracks';
            AddMusicButton.Hint := 'Add track';
            DeleteButton.Hint := 'Delete track';
            LoadButton.Caption := 'Load';
            CreateButton.Caption := 'Create';
            CancelButton.Caption := 'Cancel';
        end;

        with RenamePlaylistForm do
        begin
            Caption := 'Rename';
            NameLabel.Caption := 'Enter the name';
            SaveButton.Caption := 'Save';
            CancelButton.Caption := 'Cancel';
        end;

    end
    else
    begin
        with SettingsForm do
        begin
            Caption := 'Настройки';
            SettingsLabel.Caption := 'НАСТРОЙКИ';
            LngLabel.Caption := 'Язык';
            AboutButton.Caption := 'О программе';
            SaveSettingsButton.Caption := 'Сохранить настройки';
        end;

        with MainForm do
        begin
            PlaylistLabel.Caption := 'ПЛЕЙЛИСТЫ';
            NowPlayLabel.Caption := 'Сейчас играет:';

            RepeatButton.Hint := 'Зациклить трек';
            MuteButton.Hint := 'Без звука';
            ShowPlaylistsButton.Hint := 'Показать плейлисты';
            SettingsButton.Hint := 'Настройки';

            CreatePlaylistButton.Hint := 'Создать плейлист';
            AddPlaylistButton.Hint := 'Добавить плейлист';
            DeletePlaylistButton.Hint := 'Удалить плейлист';
            UpdatePlaylistsButton.Hint := 'Обновить плейлисты';
            ShowPlstsInExpButton.Hint := 'Открыть плейлисты в проводнике';

            BackButton.Hint := 'Назад';
            AddMusicButton.Hint := 'Добавить трек';
            DeleteMusicButton.Hint := 'Удалить трек';
            UpdateTracksButton.Hint := 'Обновить треки';
            ShowCurrPlstInExpButton.Hint := 'Открыть плейлист в проводнике';

            RenamePlaylistButton.Hint := 'Переименовать';
            ChangeCoverButton.Hint := 'Сменить обложку';

            AddMusicDialog.Title := 'Добавить трек';
            AddPlaylistDialog.Title := 'Добавить плейлист';
            OpenPictureDialog.Title := 'Сменить обложку';
        end;

        with CreatePlaylistForm do
        begin
            OpenPictureDialog.Title := 'Выбрать обложку';
            AddMusicDialog.Title :=  'Добавить трек';
            Caption := 'Создать плейлист';
            NameLabel.Caption := 'Название плейлиста';
            CoverLabel.Caption := 'Обложка';
            TracksLabel.Caption := 'Треки';
            AddMusicButton.Hint := 'Добавить трек';
            DeleteButton.Hint := 'Удалить трек';
            LoadButton.Caption := 'Загрузить';
            CreateButton.Caption := 'Создать';
            CancelButton.Caption := 'Отмена';
        end;

        with RenamePlaylistForm do
        begin
            Caption := 'Переименовать';
            NameLabel.Caption := 'Введите название';
            SaveButton.Caption := 'Сохранить';
            CancelButton.Caption := 'Отмена';
        end;
    end;
end;

procedure TLocalization.SelectLanguageForMessage(var Cap, Msg: string; RUS_CAP, RUS_MSG, ENG_CAP, ENG_MSG: string);
begin
    if Language = ENG then
    begin
        Cap := ENG_CAP;
        Msg := ENG_MSG;
    end
    else
    begin
        Cap := RUS_CAP;
        Msg := RUS_MSG;
    end;
end;

procedure TLocalization.SelectLanguageForCaption(var Msg: string; RUS_MSG, ENG_MSG: string);
begin
    if Language = ENG then
    begin
        Msg := ENG_MSG;
    end
    else
    begin
        Msg := RUS_MSG;
    end;
end;



end.
