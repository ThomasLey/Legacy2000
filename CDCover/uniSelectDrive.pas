unit uniSelectDrive;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, StdCtrls, Buttons, ComCtrls;

type
  TfrmSelDrive = class(TForm)
    ImageList1: TImageList;
    ListView1: TListView;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    laufwerk: Char;
    { Public-Deklarationen }
  end;

var
  frmSelDrive: TfrmSelDrive;

implementation

{$R *.DFM}

procedure TfrmSelDrive.BitBtn2Click(Sender: TObject);
begin
     close();
end;

procedure TfrmSelDrive.BitBtn1Click(Sender: TObject);
begin
     if ListView1.Items.Count >= 0 then
        laufwerk := Copy(ListView1.Selected.Caption, 1, 1)[1];
     close();
end;

procedure TfrmSelDrive.FormCreate(Sender: TObject);
var
   i      : Integer;
   typ    : Integer;
   s      : String;
   NewItem: TListItem;
begin
     laufwerk := chr(32);
     for i := 0 to 25 do begin
         s := chr(i + 65) + ':\';
         typ := GetDriveType(PChar(s));
         if Typ <> 0 then
            case Typ of
                 DRIVE_CDROM : begin
                             newItem := ListView1.Items.Add;
                             newItem.Caption := chr(i + 65) + ': CDROM';
                             newItem.ImageIndex := 2;
                             end;
                 DRIVE_FIXED : begin
                             newItem := ListView1.Items.Add;
                             newItem.Caption := chr(i + 65) + ': Festplatte';
                             newItem.ImageIndex := 1;
                             end;
                 DRIVE_REMOVABLE: begin
                             newItem := ListView1.Items.Add;
                             newItem.Caption := chr(i + 65) + ': DISKETTE';
                             newItem.ImageIndex := 1;
                             end;
                 DRIVE_REMOTE,
                 DRIVE_RAMDISK:begin
                             newItem := ListView1.Items.Add;
                             newItem.Caption := chr(i + 65) + ': Unbekannt';
                             newItem.ImageIndex := 0;
                             end;
            end;
     end;
end;

end.
