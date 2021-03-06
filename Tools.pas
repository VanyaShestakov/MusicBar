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
        function CuteName(FileName: string): string;
        procedure ResetFocus();
    end;

var
  wTools: TTools;

implementation

{$R *.dfm}

uses MainUnit;


procedure TTools.ResetFocus();
begin
    MainForm.ResetBtn.SetFocus;
end;

end.
