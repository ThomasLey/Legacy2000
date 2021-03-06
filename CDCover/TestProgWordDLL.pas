unit TestProgWordDLL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ActnList;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    Edit3: TEdit;
    Button3: TButton;
    Button4: TButton;
    Edit4: TEdit;
    Button5: TButton;
    Button6: TButton;
    Edit5: TEdit;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation
uses uniStruc;

function getContents(CD: String): TAudioCD; stdcall; external 'Word.dll';
procedure fillContents(interpret, album: ShortString; index: TStrings; datei: String); stdcall; external 'Word.dll';
function  openCD(Application: TApplication): String; stdcall; external 'CDInfo.dll';
procedure newCD(Application: TApplication); stdcall; external 'CDInfo.dll';
function  getDrive(Application: TApplication): Char; stdcall; external 'CDInfo.dll';

{$R *.DFM}
function GetString(Zeichen: Char; Text: ShortString; Zahler: Integer): ShortString; stdcall;
var i, j, Start: Integer;
begin
     j := 0; Start := 1;
     text := Zeichen + text + Zeichen + Zeichen;
     for i := 1 to length(Text) do begin
         If Text[i] = Zeichen then begin
            Inc(j);
            If j = (Zahler) then Start := i + 1;
            If j = (Zahler + 1) then Result := Copy(Text, Start, i - Start);
         end
     end;
end;



procedure TForm1.Button1Click(Sender: TObject);
begin
     ListBox1.Items.Add(Edit3.Text);
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
     ListBox1.Clear();
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
     fillContents(edit1.Text, edit2.Text, ListBox1.Items, ExtractFilePath(ParamStr(0)) + '\CDCover\' + Edit1.Text + ' - ' + Edit2.Text + '.doc');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
     Edit4.Text := openCD(Application);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
     Edit5.Text := getDrive(Application);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
     newCD(Application);
end;

procedure TForm1.Button7Click(Sender: TObject);
var
   tmp: TAudioCD;
   i: Integer;
   stmp: String;
begin
     Listbox1.Clear();
     tmp := getContents(Edit4.Text);
     Edit1.Text := tmp.Interpret;
     Edit2.Text := tmp.Album;
     sTmp := tmp.Lieder;
     for i := 1 to tmp.Stuecke do begin
         Listbox1.Items.Add(GetString('|', sTmp, i));
     end;
end;

end.
