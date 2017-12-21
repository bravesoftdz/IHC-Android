unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.WebBrowser, FMX.TabControl, System.Actions, FMX.ActnList, FMX.Gestures,
  FMX.Controls.Presentation, FMX.Objects;

type
  TForm2 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    Image1: TImage;
    TabItem2: TTabItem;
    Image2: TImage;
    ToolBar1: TToolBar;
    Label1: TLabel;
    GestureManager1: TGestureManager;
    TabActionList: TActionList;
    ChangeTabActionNext: TNextTabAction;
    ChangeTabActionPrev: TPreviousTabAction;
    Label2: TLabel;
    Label3: TLabel;
    WebBrowser1: TWebBrowser;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
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
  Form2.Close();
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  WebBrowser1.Navigate('https://drive.google.com/open?id=1h1Quq54PnHeNXP0svmUyHg-O0cQ&usp=sharing');
end;

end.
