unit LoadScreenUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    LoadTimer: TTimer;
    ProgressBar: TProgressBar;
    procedure LoadTimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.LoadTimerTimer(Sender: TObject);
begin
    ProgressBar.Position := ProgressBar.Position + 1;
end;

end.
