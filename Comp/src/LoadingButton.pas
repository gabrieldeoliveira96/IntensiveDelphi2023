unit LoadingButton;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls, FMX.Objects,
  FMX.StdCtrls, System.UITypes, FMX.Graphics;

type
  TLoadingButton = class(TRectangle)
  private
    const CorDefault = $FF088593;
    const TextDefault = '@DelphiNaVeia';
    var
    FText:string;
    procedure SetText(const Value: string);
  protected
    FLabel:TLabel;
    FAni:TAniIndicator;
  public
    constructor create(AOwner: TComponent); override;
    destructor Destroy;
  published
    property Text: string read FText write SetText;
    procedure Start;
    procedure Stop;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('DelphiNaVeia', [TLoadingButton]);
end;

{ TLoadingButton }

constructor TLoadingButton.create(AOwner: TComponent);
begin
  inherited;
//propriedades default
  FText:= TextDefault;

//criação de objetos
  FLabel:= TLabel.Create(self);
  FLabel.Text:= FText;
  FLabel.TextSettings.HorzAlign:= TTextAlign.Center;
  FLabel.Visible:= true;
  FLabel.Align:= TAlignLayout.Client;
  FLabel.SetSubComponent(true);
  FLabel.Stored:= false;

  FAni:= TAniIndicator.Create(self);
  FAni.Visible:= false;
  FAni.Enabled:= false;
  FAni.Align:= TAlignLayout.Center;
  FAni.SetSubComponent(true);
  FAni.Stored:= false;

//propriedades default pro componente
  self.Stroke.Kind:= TBrushKind.None;
  self.XRadius:= 10;
  self.YRadius:= 10;
  self.Fill.Color:= CorDefault;
  self.Width:= 400;
  self.Height:= 100;

//atribuição para o form
  self.AddObject(FLabel);
  self.AddObject(FAni);

end;

destructor TLoadingButton.Destroy;
begin
  FreeAndNil(FLabel);
  FreeAndNil(FAni);
end;

procedure TLoadingButton.SetText(const Value: string);
begin
  FText := Value;
  FLabel.Text:= Value;
end;

procedure TLoadingButton.Start;
begin
  FLabel.Visible:= false;
  FAni.Visible:= true;
  FAni.Enabled:= true;
end;


procedure TLoadingButton.Stop;
begin
  FLabel.Visible:= true;
  FAni.Visible:= false;
  FAni.Enabled:= false;
end;


end.
