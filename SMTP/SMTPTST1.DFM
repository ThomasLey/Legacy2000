�
 TSMTPTESTFORM 0�
  TPF0TSmtpTestFormSmtpTestFormLeftJTopSWidthHeightfCaptionSend Mail - 1.0Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OnCreate
FormCreatePixelsPerInch`
TextHeight TMemoMsgMemoLeft TopaWidthHeight`AlignalTopLines.StringsThis is the first lineThen the second oneThe next one is empty "The next one has only a single dot.Finally the last one 
ScrollBarsssBothTabOrder   TMemoDisplayMemoLeft TopWidthHeightIAlignalClientLines.StringsDisplayMemo ReadOnly	
ScrollBarsssBothTabOrder  TPanelPanel1Left Top WidthHeightaAlignalTopTabOrder TLabelLabel1LeftTopWidth7HeightCaption	SMTP Host  TLabelLabel2Left0Top$WidthHeightCaptionFrom  TLabelLabel3Left� Top$WidthHeightCaptionTo  TLabelSubjectLeft#Top:Width$HeightCaptionSubject  TLabelLabel4Left� TopWidthHeightCaptionPort  TLabelLabel5LeftTopPWidthBHeightCaptionMessage text:  TWaitWait1LefthTop
WidthaHeightCaption60ModalResult Interval�	IsControl	  TEditHostEditLeftPTopWidthyHeightTabOrderText	localhost  TEditFromEditLeftPTop WidthyHeightTabOrderTextfirst.last@company.com  TEditToEditLeft� Top WidthyHeightTabOrderTextjohn.doe@acme  TButtonConnectButtonLefthTop WidthIHeightCaption&ConnectTabOrderOnClickConnectButtonClick  TButton
MailButtonLeft�Top WidthIHeightCaption
Send &MailTabOrderOnClickMailButtonClick  TEditSubjectEditLeftPTop8WidthyHeightTabOrderTextLe sujet du message  TButtonDisconnectButtonLefthTop8WidthIHeightCaption&DisconnectTabOrderOnClickDisconnectButtonClick  TEdit
SignOnEditLeft� Top8WidthyHeightTabOrderText
SignOnEdit  TEditPortEditLeft� TopWidthyHeightTabOrder	Textsmtp  TButtonClearDisplayButtonLeft�Top8WidthIHeightCaptionClear &InfoTabOrder
OnClickClearDisplayButtonClick   TPanelPanel2Left Top� WidthHeightAlignalTopTabOrder TLabelLabel6LeftTopWidthCHeightCaptionAttached files:   TMemoFileAttachMemoLeft Top� WidthHeightAlignalTopLines.Stringsc:\temp\brol.txtc:\temp\test.txt 
ScrollBars
ssVerticalTabOrder  TPanelPanel3Left Top� WidthHeightAlignalTopTabOrder TLabelLabel7LeftTopWidthGHeightCaptionInfo messages:   TSmtpClient
SmtpClientTag PortsmtpWaitWait1CharSet
iso-8859-1TimeOut	OnDisplaySmtpClientDisplay	OnGetDataSmtpClientGetDataOnHeaderLineSmtpClientHeaderLineLeft�Topp  TTimer
CloseTimerEnabledInterval
OnTimerCloseTimerTimerLeft�Topp   