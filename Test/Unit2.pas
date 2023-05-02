unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects;

type
  TForm2 = class(TForm)
    Rectangle1: TRectangle;
    btnStart: TButton;
    Label1: TLabel;
    AniIndicator1: TAniIndicator;
    btnStop: TButton;
    procedure btnStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
  private
    FColor:TAlphaColor;
    FText:string;
    procedure Stop;
    procedure Start;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.btnStartClick(Sender: TObject);
begin
  Start;
end;

procedure TForm2.Start;
begin

  Rectangle1.Fill.Color:= FColor;
  Label1.Text:= FText;

  Label1.Visible:= false;
  AniIndicator1.Visible:= true;
  AniIndicator1.Enabled:= true;
end;

procedure TForm2.btnStopClick(Sender: TObject);
begin
  Stop;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Stop;

  FColor:= $FFC55A5A;
  FText:= '@DelphiNaVeia';

  Rectangle1.Fill.Color:= FColor;
  Label1.Text:= FText;

end;

procedure TForm2.Stop;
begin
  Label1.Visible:= true;
  AniIndicator1.Visible:= false;
  AniIndicator1.Enabled:= false;
end;

end.
