unit Setup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, StdCtrls, INIFiles, ExtDlgs, Spin;

type
  TfrmSetup = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    GroupBox2: TGroupBox;
    tIcon: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    cbauto: TCheckBox;
    GroupBox3: TGroupBox;
    UserBox: TListBox;
    Button6: TButton;
    Label3: TLabel;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Schlieen1Click(Sender: TObject);
    procedure Speichern1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Abbrechen1Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure cbautoClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    pLeft, pTop: Integer;
    { Public-Deklarationen }
  end;

var
  frmSetup: TfrmSetup;
  tIcon: String;
  Autosave: Integer;

implementation

uses unimain;

function GetPathName(text: ShortString): ShortString; stdcall; external 'utils.dll';
{$R *.DFM}

procedure TfrmSetup.Schlieen1Click(Sender: TObject);
begin
     frmSetup.Speichern1Click(Sender);
     Close;
end;

procedure TfrmSetup.Speichern1Click(Sender: TObject);
var
   Datei: TINIFile;
begin
     Datei := TINIFile.Create(GetPathName(ParamStr(0)) + '\' + frmMain.System.UserName + '\' + 'config.ini');

     Datei.WriteString('Layout', 'Icon', frmSetup.OpenPictureDialog1.FileName);
     Datei.WriteInteger('Program', 'Autosave', SpinEdit1.Value);
     Datei.WriteBool('Program', 'tfAutosave', cbAuto.Checked);
     Datei.WriteInteger('Layout', 'pTop', SpinEdit2.Value);
     Datei.WriteInteger('Layout', 'pLeft', SpinEdit3.Value);
// Icon aktualisieren
     If FileExists(frmSetup.OpenPictureDialog1.FileName) then frmMain.Icon.LoadFromFile(frmSetup.OpenPictureDialog1.FileName);
     frmMain.TrayIcon.Icon := frmMain.Icon;
     Application.Icon := frmMain.Icon;
// Autosave aktualisieren
     frmMain.xMinuten := SpinEdit1.Value;
     frmMain.TimerAutosave.Enabled := cbAuto.Checked;
// Seitenlayout
     frmSetup.pTop := frmSetup.SpinEdit2.Value;
     frmSetup.pLeft := frmSetup.SpinEdit3.Value;

     Datei.Free;
     Button3.Enabled := false;
end;



procedure TfrmSetup.FormCreate(Sender: TObject);
var
   Datei: TINIFile;
   zIcon: String;
begin
     Datei := TINIFile.Create(GetPathName(ParamStr(0)) + '\' + frmMain.System.UserName + '\' + 'config.ini');

     zIcon := Datei.ReadString('Layout', 'Icon', '');
     frmSetup.OpenPictureDialog1.FileName := zIcon;
     If FileExists(zIcon) then tIcon.Picture.LoadFromFile(zIcon);

     SpinEdit1.Value := Datei.ReadInteger('Program', 'Autosave', 5);
     SpinEdit2.Value := Datei.ReadInteger('Layout', 'pTop', 25);
     SpinEdit3.Value := Datei.ReadInteger('Layout', 'pLeft', 30);
     cbAuto.Checked := Datei.ReadBool('Program', 'tfAutosave', true);
     Datei.Free;
     Button3.Enabled := false;
     frmSetup.Button6Click(Sender); // Update !!!
end;

procedure TfrmSetup.Button1Click(Sender: TObject);
begin
     If frmSetup.OpenPictureDialog1.Execute then begin
        tIcon.Picture.LoadFromFile(frmSetup.OpenPictureDialog1.FileName);
        Button3.Enabled := true;
     end;
end;

procedure TfrmSetup.Abbrechen1Click(Sender: TObject);
begin
     Close;
end;



procedure TfrmSetup.SpinEdit1Change(Sender: TObject);
begin
     Button3.Enabled := true;
end;

procedure TfrmSetup.cbautoClick(Sender: TObject);
begin
     Button3.Enabled := true;
end;

procedure TfrmSetup.Button6Click(Sender: TObject);
var
   Path: String;
   Search: TSearchRec;
begin
     UserBox.Clear;
     Path := GetPathName(ParamStr(0));
     If FindFirst(Path + '\*.*', faDirectory, Search) = 0 then begin
        repeat
              if ((Search.Attr and faDirectory) = faDirectory) and
              (Search.Name <> '.') and (Search.Name <> '..') then begin
                     UserBox.Items.Add(Search.Name);
              end;
        until findNext(Search) <> 0;
     end;
     FindClose(Search);

end;

end.
