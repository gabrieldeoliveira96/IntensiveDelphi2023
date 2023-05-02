unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  LoadingButton, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Effects;

type
  TForm2 = class(TForm)
    LoadingButton2: TLoadingButton;
    ShadowEffect1: TShadowEffect;
    procedure LoadingButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.LoadingButton2Click(Sender: TObject);
begin
  LoadingButton2.Start;

  Tthread.CreateAnonymousThread(
  procedure
  begin
    sleep(5000);

    Tthread.Synchronize(nil,
    procedure
    begin
      LoadingButton2.Stop;
    end);

  end).Start;
end;

end.
