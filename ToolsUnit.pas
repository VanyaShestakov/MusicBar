unit ToolsUnit;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.MPlayer, Vcl.StdCtrls, Vcl.ComCtrls,
    Vcl.Menus, Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.Buttons, Vcl.FileCtrl,
    Vcl.WinXCtrls, mmsystem, ShellAPI, Vcl.Imaging.pngimage, Vcl.JumpList,
    Vcl.WinXPickers, Vcl.TabNotBk, Vcl.ExtDlgs;

type
    TTools = class(TObject)
        procedure ResetFocus();
        function CuteName(FileName: string): string;
        function CopyDir(const FromDir, ToDir: string) : Boolean;
        procedure DeleteDir(Path: string);
        procedure SetVolume(const VolL, VolR: Word);
    end;

var
    Tools: TTools;

implementation

uses
    MainUnit;

procedure TTools.ResetFocus();
begin
    MainForm.ResetBtn.SetFocus;
end;

function TTools.CuteName(FileName: string): string;
var
    FileNameLength: Integer;
    Name: string;
begin
    FileNameLength := Length(FileName);
    if FileNameLength <> 0 then
    begin
        while (FileName[FileNameLength] <> '\') and (FileNameLength > 0) do
        begin
            Dec(FileNameLength);
            Name := Copy(FileName, FileNameLength + 1, Length(FileName) - FileNameLength);
        end;
        Result := Name;
    end;
end;

function TTools.CopyDir(const FromDir, ToDir: string) : Boolean;
var
    Fos: TSHFileOpStruct;
begin
    ZeroMemory(@Fos, SizeOf(Fos));
    with Fos do
    begin
        WFunc := FO_COPY;
        FFlags := FOF_ALLOWUNDO;
        PFrom := PChar(FromDir + #0);
        PTo := PChar(ToDir)
    end;
    CopyDir := (0 = ShFileOperation(Fos));
end;

procedure TTools.DeleteDir(Path: string);
var
    SearchResult: TSearchRec;
begin
    if FindFirst(Path + '\*.*', faAnyFile, SearchResult) = 0 then
    begin
        repeat
            if SearchResult.Attr and faDirectory = 0 then
                DeleteFile(path + '\' + SearchResult.name)
            else
                if Pos('.', SearchResult.name) <= 0 then
                    DeleteDir(Path + '\' + SearchResult.name);
        until
        FindNext(SearchResult) <> 0;
    end;
    FindClose(SearchResult);
    RemoveDirectory(PChar(Path));
end;

procedure TTools.SetVolume(const VolL, VolR: Word);
var
    hWO: HWAVEOUT;
    waveF: TWAVEFORMATEX;
    vol: DWORD;
begin
    FillChar(waveF, SizeOf(waveF), 0);
    WaveOutOpen(@hWO, WAVE_MAPPER, @waveF, 0, 0, 0);
    Vol := VolL + VolR shl 16;
    WaveOutSetVolume(hWO, vol);
    WaveOutClose(hWO);
end;

end.
