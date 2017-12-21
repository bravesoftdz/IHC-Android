unit TabbedFormwithNavigation;


interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.Gestures, System.Actions, FMX.ActnList, FMX.Objects, FMX.Layouts,Unit1,FMX.PhoneDialer, FMX.Platform,Androidapi.Jni.Telephony, Androidapi.Jni.JavaTypes,
  FMX.Edit, FMX.ScrollBox, FMX.Memo,Unit2;
  const
     PosicaoXPadrao : Integer = 20;

type
  TTabbedwithNavigationForm = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabControl2: TTabControl;
    TabItem5: TTabItem;
    ToolBar1: TToolBar;
    lblTitle1: TLabel;
    btnNext: TSpeedButton;
    TabItem6: TTabItem;
    ToolBar2: TToolBar;
    lblTitle2: TLabel;
    btnBack: TSpeedButton;
    TabItem2: TTabItem;
    ToolBar3: TToolBar;
    lblTitle3: TLabel;
    TabItem3: TTabItem;
    ToolBar4: TToolBar;
    lblTitle4: TLabel;
    Brush1: TBrushObject;
    StyleBook1: TStyleBook;
    Circle1: TCircle;
    Rct_principal: TRectangle;
    Button1: TButton;
    VertScrollBox1: TVertScrollBox;
    Rct_Efeito: TRectangle;
    Image1: TImage;
    Label1: TLabel;
    Panel1: TPanel;
    Circle2: TCircle;
    Circle4: TCircle;
    Circle5: TCircle;
    Circle3: TCircle;
    Image2: TImage;
    Label_perfil: TLabel;
    Label_Nome: TLabel;
    Label3: TLabel;
    EditNome: TEdit;
    Nome: TLabel;
    Perfil: TLabel;
    Button2: TButton;
    MemoPerfil: TMemo;
    Label2: TLabel;
    Label4: TLabel;
    Switch1: TSwitch;
    Switch2: TSwitch;
    Label5: TLabel;
    Switch3: TSwitch;
    Button3: TButton;
    Label6: TLabel;
    CheckBox1: TCheckBox;
    procedure GestureDone(Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Rct_EfeitoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Rct_EfeitoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure VertScrollBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure VertScrollBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Image1Click(Sender: TObject);
    procedure Rct_EfeitoClick(Sender: TObject);
    procedure Circle2Click(Sender: TObject);
    procedure Circle5Click(Sender: TObject);
    procedure Circle4Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TabItem2Click(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure Circle3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
     MoverObj : Boolean;
    Offset : TPointF;
     Discador : IFMXPhoneDialerService;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  TabbedwithNavigationForm: TTabbedwithNavigationForm;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TTabbedwithNavigationForm.btnBackClick(Sender: TObject);
begin
  TabControl2.TabIndex:=0;
end;

procedure TTabbedwithNavigationForm.btnNextClick(Sender: TObject);
begin
  MemoPerfil.Lines.Add(Label_perfil.Text);
  EditNome.Text:=Label_Nome.Text;
  TabControl2.TabIndex:=1;
end;

procedure TTabbedwithNavigationForm.Button1Click(Sender: TObject);
begin
       if (Rct_Efeito.Position.Y > 150) Or (Rct_Efeito.Opacity = 0) then
      Begin

       Rct_Efeito.Position.Y := Self.Height +300;
       Rct_Efeito.Opacity    := 1;
       Rct_Efeito.Position.X := PosicaoXPadrao;
       Rct_Efeito.Width      := VertScrollBox1.Width - ( PosicaoXPadrao * 2 );


      Rct_Efeito.AnimateFloat('Position.Y',100,2.5, TAnimationType.InOut,TInterpolationType.Back);

 End
 Else
   Rct_Efeito.AnimateFloat('Opacity',0,1.5, TAnimationType.InOut,TInterpolationType.Circular);

end;

procedure TTabbedwithNavigationForm.Button2Click(Sender: TObject);
begin
  Label_perfil.Text:=MemoPerfil.Text;
  Label_Nome.Text:=EditNome.Text;
  MemoPerfil.Text:='';
  EditNome.Text:='';
  ShowMessage('Salvo com sucesso');
end;

procedure TTabbedwithNavigationForm.Button3Click(Sender: TObject);
begin
  Form2.Show();
end;

procedure TTabbedwithNavigationForm.Circle2Click(Sender: TObject);
begin
  Rct_Efeito.AnimateFloat('Opacity',0,1.5, TAnimationType.InOut,TInterpolationType.Circular);
end;

procedure TTabbedwithNavigationForm.Circle3Click(Sender: TObject);
begin
Rct_Efeito.AnimateFloat('Position.X',1000,0.5);
end;

procedure TTabbedwithNavigationForm.Circle4Click(Sender: TObject);
begin
  Form1.Edit1.Text:= '63985044068';
  Form1.Show();
end;

procedure TTabbedwithNavigationForm.Circle5Click(Sender: TObject);
begin

  TPlatformServices.Current.SupportsPlatformService(IFMXPhoneDialerService,IInterface(Discador));
  Discador.Call('6332199000');
end;

procedure TTabbedwithNavigationForm.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := TabItem1;
  MoverObj := False;
   Rct_Efeito.Position.Y := Self.Height + 200;
end;

procedure TTabbedwithNavigationForm.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
  begin
    if (TabControl1.ActiveTab = TabItem1) and (TabControl2.ActiveTab = TabItem6) then
    begin
      TabControl2.Previous;
      Key := 0;
    end;
  end;
end;

procedure TTabbedwithNavigationForm.FormShow(Sender: TObject);
begin
  TabControl1.TabIndex:=1;
         if (Rct_Efeito.Position.Y > 150) Or (Rct_Efeito.Opacity = 0) then
      Begin

       Rct_Efeito.Position.Y := Self.Height +300;
       Rct_Efeito.Opacity    := 1;
       Rct_Efeito.Position.X := PosicaoXPadrao;
       Rct_Efeito.Width      := VertScrollBox1.Width - ( PosicaoXPadrao * 2 );


      Rct_Efeito.AnimateFloat('Position.Y',100,2.5, TAnimationType.InOut,TInterpolationType.Back);

 End
 Else
   Rct_Efeito.AnimateFloat('Opacity',0,1.5, TAnimationType.InOut,TInterpolationType.Circular);
end;

procedure TTabbedwithNavigationForm.GestureDone(Sender: TObject; const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  case EventInfo.GestureID of
    sgiLeft:
      begin
        if TabControl1.ActiveTab <> TabControl1.Tabs[TabControl1.TabCount - 1] then
          TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex + 1];
        Handled := True;
      end;

    sgiRight:
      begin
        if TabControl1.ActiveTab <> TabControl1.Tabs[0] then
          TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex - 1];
        Handled := True;
      end;
  end;
end;

procedure TTabbedwithNavigationForm.Image1Click(Sender: TObject);
begin
  Form1.Show();
end;

procedure TTabbedwithNavigationForm.Image2Click(Sender: TObject);
begin
    TabbedwithNavigationForm.Close();
end;

procedure TTabbedwithNavigationForm.Label3Click(Sender: TObject);
begin
  TabbedwithNavigationForm.Close();
end;

procedure TTabbedwithNavigationForm.Rct_EfeitoClick(Sender: TObject);
begin
  Form1.Show();
end;

procedure TTabbedwithNavigationForm.Rct_EfeitoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
            VertScrollBox1.Root.Captured := VertScrollBox1;
            MoverObj := True;
end;

procedure TTabbedwithNavigationForm.Rct_EfeitoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Single);
begin
 MoverObj := True;
   Offset.Y := Y;
   Offset.X := X;
end;

procedure TTabbedwithNavigationForm.TabItem2Click(Sender: TObject);
begin
         if (Rct_Efeito.Position.Y > 150) Or (Rct_Efeito.Opacity = 0) then
      Begin

       Rct_Efeito.Position.Y := Self.Height +300;
       Rct_Efeito.Opacity    := 1;
       Rct_Efeito.Position.X := PosicaoXPadrao;
       Rct_Efeito.Width      := VertScrollBox1.Width - ( PosicaoXPadrao * 2 );


      Rct_Efeito.AnimateFloat('Position.Y',100,2.5, TAnimationType.InOut,TInterpolationType.Back);

 End
 
end;

procedure TTabbedwithNavigationForm.VertScrollBox1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Single);
begin


  if (MoverObj) And (ssLeft In Shift) then
  Begin


    if X > (VertScrollBox1.Width + Offset.X ) then
      X := VertScrollBox1.Width + Offset.X ;

    if Y > (VertScrollBox1.Height + Offset.Y ) then
      Y := VertScrollBox1.Height + Offset.Y ;

    if X < Offset.X then
      X := Offset.X;

    if Y < Offset.Y then
      Y := Offset.Y;

    if X > 0 then
    Rct_Efeito.Position.X := ( X - Offset.X );

  End;
end;

procedure TTabbedwithNavigationForm.VertScrollBox1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
      MoverObj := False;

    if Rct_Efeito.Position.X > ( (VertScrollBox1.Position.X + VertScrollBox1.Width) - 150 ) then
     Rct_Efeito.AnimateFloat('Position.X',1000,0.5)
    Else
     Rct_Efeito.AnimateFloat('Position.X',VertScrollBox1.Position.X + PosicaoXPadrao,0.5)
end;

end.

