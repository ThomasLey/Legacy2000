object frmNewCD: TfrmNewCD
  Left = 281
  Top = 240
  BorderStyle = bsDialog
  Caption = 'Neue CD eintragen'
  ClientHeight = 393
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 361
    Height = 345
    Caption = 'CD Informationen'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 43
      Width = 56
      Height = 15
      AutoSize = False
      Caption = 'Interpret:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 67
      Width = 56
      Height = 15
      AutoSize = False
      Caption = 'Album:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 91
      Width = 56
      Height = 15
      AutoSize = False
      Caption = 'Lieder:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 19
      Width = 56
      Height = 15
      AutoSize = False
      Caption = 'CD ID:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Interpret: TEdit
      Left = 64
      Top = 43
      Width = 289
      Height = 20
      TabOrder = 0
    end
    object Album: TEdit
      Left = 64
      Top = 67
      Width = 289
      Height = 20
      TabOrder = 1
    end
    object Lieder: TMemo
      Left = 64
      Top = 91
      Width = 289
      Height = 246
      TabOrder = 2
    end
    object CDID: TEdit
      Left = 64
      Top = 19
      Width = 265
      Height = 20
      TabOrder = 3
    end
    object BitBtn3: TBitBtn
      Left = 330
      Top = 19
      Width = 23
      Height = 20
      Caption = '...'
      TabOrder = 4
      OnClick = BitBtn3Click
    end
  end
  object BitBtn2: TBitBtn
    Left = 166
    Top = 360
    Width = 99
    Height = 25
    Caption = '&Abbrechen'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn1: TBitBtn
    Left = 272
    Top = 360
    Width = 99
    Height = 25
    Caption = '&OK'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
end
