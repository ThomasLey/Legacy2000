//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "verinfo.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
Tvers *vers;
//---------------------------------------------------------------------------
__fastcall Tvers::Tvers(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall Tvers::verOKClick(TObject *Sender)
{
vers->Close();    
}
//---------------------------------------------------------------------------
