unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TForm2 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    const CorDefault = $FF088593;
    const TextDefault = '@DelphiNaVeia';
    var
    FRectangle:TRectangle;
    FLabel:TLabel;
    FAni:TAniIndicator;

    FColor:TAlphaColor;
    FText:string;

    procedure Start;
    procedure Stop;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
begin
  Start;

  TThread.CreateAnonymousThread(
  procedure
  begin
    sleep(5000);

    Tthread.Synchronize(nil,
    procedure
    begin

      stop;
    end);

  end).start;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
//criação de objetos
  FRectangle:= TRectangle.Create(self);
  FLabel:= TLabel.Create(self);
  FAni:= TAniIndicator.Create(self);

//atribuição para o form
  FRectangle.AddObject(FLabel);
  FRectangle.AddObject(FAni);
  self.AddObject(FRectangle);

//propriedades default
  FColor:= CorDefault;
  FText:= TextDefault;

  FRectangle.Stroke.Kind:= TBrushKind.None;
  FRectangle.XRadius:= 10;
  FRectangle.YRadius:= 10;
  FRectangle.Fill.Color:= FColor;
  FRectangle.Width:= 400;
  FRectangle.Height:= 100;

  FLabel.Text:= FText;
  FLabel.TextSettings.HorzAlign:= TTextAlign.Center;

  FLabel.Visible:= true;
  FAni.Visible:= false;
  FAni.Enabled:= false;

  FLabel.Align:= TAlignLayout.Client;
  FAni.Align:= TAlignLayout.Center;

end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FRectangle);
  FreeAndNil(FLabel);
  FreeAndNil(FAni);
end;

procedure TForm2.Start;
begin
  FLabel.Visible:= false;
  FAni.Visible:= true;
  FAni.Enabled:= true;
end;


procedure TForm2.Stop;
begin
  FLabel.Visible:= true;
  FAni.Visible:= false;
  FAni.Enabled:= false;
end;



end.
