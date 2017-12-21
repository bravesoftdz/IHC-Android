unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
uses   Androidapi.Jni.Telephony,FMX.Platform.Android, Androidapi.JNI.JavaTypes, Androidapi.JNI.Net, Androidapi.JNI.Os, Androidapi.Helpers;

procedure TForm1.Button1Click(Sender: TObject);
var
  GerenciadorSMS : JSmsManager;
begin
  GerenciadorSMS := TJSmsManager.JavaClass.getDefault;
  if not Edit1.Text.IsEmpty then
    begin
      if not Memo1.Lines.Text.IsEmpty then
        GerenciadorSMS.sendTextMessage(StringToJString(Edit1.Text), nil, StringToJString(Memo1.Lines.Text), nil, nil )

      else
        ShowMessage('Escreva a mensagem.');
    end
  else
    ShowMessage('Informe o n�mero de destino para a mensagem.');

end;

end.
