{ Runtime Forms support }
unit uPSR_forms;

{$I PascalScript.inc}

interface

uses
  uPSRuntime, uPSUtils;

procedure RIRegisterTCONTROLSCROLLBAR(Cl: TPSRuntimeClassImporter);
{$IFNDEF FPC}
  procedure RIRegisterTSCROLLINGWINCONTROL(Cl: TPSRuntimeClassImporter);
{$ENDIF}
procedure RIRegisterTSCROLLBOX(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTFORM(Cl: TPSRuntimeClassImporter);
{$IFNDEF PS_MINIVCL}
  procedure RIRegisterTCUSTOMFORM(Cl: TPSRuntimeClassImporter);
{$ENDIF}
procedure RIRegisterTAPPLICATION(Cl: TPSRuntimeClassImporter);
{$IFNDEF PS_MINIVCL}
  procedure RIRegisterTSCREEN(Cl: TPSRuntimeClassImporter);
{$ENDIF}

procedure RIRegister_Forms(Cl: TPSRuntimeClassImporter);

implementation

uses
  sysutils, classes, {$IFDEF CLX}QControls, QForms, QGraphics{$ELSE}Controls, Forms, Graphics{$ENDIF};

{ TControlScrollBar ---------------------------------------------------------- }
procedure TCONTROLSCROLLBARKIND_R(Self: TCONTROLSCROLLBAR; var T: TSCROLLBARKIND); begin T := Self.KIND; end;
procedure TCONTROLSCROLLBARSCROLLPOS_R(Self: TCONTROLSCROLLBAR; var T: INTEGER); begin t := Self.SCROLLPOS; end;

procedure RIRegisterTCONTROLSCROLLBAR(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCONTROLSCROLLBAR) do
  begin
    RegisterPropertyHelper(@TCONTROLSCROLLBARKIND_R, nil, 'Kind');
    RegisterPropertyHelper(@TCONTROLSCROLLBARSCROLLPOS_R, nil, 'ScrollPos');
  end;
end;

{$IFNDEF FPC}
{ TScrollingWinControl ------------------------------------------------------- }
procedure RIRegisterTSCROLLINGWINCONTROL(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TSCROLLINGWINCONTROL) do
  begin
    RegisterMethod(@TSCROLLINGWINCONTROL.SCROLLINVIEW, 'ScrollInView');
  end;
end;
{$ENDIF}

{ TScrollBox ----------------------------------------------------------------- }
procedure RIRegisterTSCROLLBOX(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TSCROLLBOX);
end;

{$IFNDEF PS_MINIVCL}
{ TCustomForm ---------------------------------------------------------------- }
procedure TCustomFormWindowState_W(Self: TCustomForm; const T: TWindowState); begin Self.WindowState := T; end;
procedure TCustomFormWindowState_R(Self: TCustomForm; var T: TWindowState); begin T := Self.WindowState; end;
//procedure TCustomFormOleFormObject_W(Self: TCustomForm; const T: TOLEFormObject); begin Self.OleFormObject := T; end;
//procedure TCustomFormOleFormObject_R(Self: TCustomForm; var T: TOLEFormObject); begin T := Self.OleFormObject; end;
procedure TCustomFormModalResult_W(Self: TCustomForm; const T: TModalResult); begin Self.ModalResult := T; end;
procedure TCustomFormModalResult_R(Self: TCustomForm; var T: TModalResult); begin T := Self.ModalResult; end;
//procedure TCustomFormMenu_W(Self: TCustomForm; const T: TMainMenu); begin Self.Menu := T; end;
//procedure TCustomFormMenu_R(Self: TCustomForm; var T: TMainMenu); begin T := Self.Menu; end;
procedure TCustomFormKeyPreview_W(Self: TCustomForm; const T: Boolean); begin Self.KeyPreview := T; end;
procedure TCustomFormKeyPreview_R(Self: TCustomForm; var T: Boolean); begin T := Self.KeyPreview; end;
procedure TCustomFormHelpFile_W(Self: TCustomForm; const T: string); begin Self.HelpFile := T; end;
procedure TCustomFormHelpFile_R(Self: TCustomForm; var T: string); begin T := Self.HelpFile; end;
procedure TCustomFormDropTarget_W(Self: TCustomForm; const T: Boolean); begin Self.DropTarget := T; end;
procedure TCustomFormDropTarget_R(Self: TCustomForm; var T: Boolean); begin T := Self.DropTarget; end;
//procedure TCustomFormDesigner_W(Self: TCustomForm; const T: TDesigner); begin Self.Designer := T; end;
//procedure TCustomFormDesigner_R(Self: TCustomForm; var T: TDesigner); begin T := Self.Designer; end;
procedure TCustomFormCanvas_R(Self: TCustomForm; var T: TCanvas); begin T := Self.Canvas; end;
procedure TCustomFormActiveOleControl_W(Self: TCustomForm; const T: TWinControl); begin Self.ActiveOleControl := T; end;
procedure TCustomFormActiveOleControl_R(Self: TCustomForm; var T: TWinControl); begin T := Self.ActiveOleControl; end;
procedure TCustomFormActiveControl_W(Self: TCustomForm; const T: TWinControl); begin Self.ActiveControl := T; end;
procedure TCustomFormActiveControl_R(Self: TCustomForm; var T: TWinControl); begin T := Self.ActiveControl; end;
procedure TCustomFormActive_R(Self: TCustomForm; var T: Boolean); begin T := Self.Active; end;

procedure RIRegisterTCUSTOMFORM(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCustomForm) do
  begin
    {$IFDEF DELPHI4UP}
      RegisterVirtualConstructor(@TCustomForm.CreateNew, 'CreateNew');
    {$ELSE}
      RegisterConstructor(@TCustomForm.CreateNew, 'CreateNew');
    {$ENDIF}
    RegisterMethod(@TCustomForm.Close, 'Close');
    RegisterMethod(@TCustomForm.CloseQuery, 'CloseQuery');
    RegisterMethod(@TCustomForm.DefocusControl, 'DefocusControl');
    RegisterMethod(@TCustomForm.FocusControl, 'FocusControl');
    RegisterMethod(@TCustomForm.GetFormImage, 'GetFormImage');
    RegisterMethod(@TCustomForm.Hide, 'Hide');
    RegisterMethod(@TCustomForm.Print, 'Print');
    RegisterMethod(@TCustomForm.Release, 'Release');
    RegisterMethod(@TCustomForm.SendCancelMode, 'SendCancelMode');
    RegisterMethod(@TCustomForm.SetFocusedControl, 'SetFocusedControl');
    RegisterMethod(@TCustomForm.Show, 'Show');
    RegisterMethod(@TCustomForm.ShowModal, 'ShowModal');
    RegisterVirtualMethod(@TCustomForm.WantChildKey, 'WantChildKey');
    RegisterPropertyHelper(@TCustomFormActive_R,nil,'Active');
    RegisterPropertyHelper(@TCustomFormActiveControl_R,@TCustomFormActiveControl_W,'ActiveControl');
    RegisterPropertyHelper(@TCustomFormActiveOleControl_R,@TCustomFormActiveOleControl_W,'ActiveOleControl');
    RegisterPropertyHelper(@TCustomFormCanvas_R,nil,'Canvas');
    //RegisterPropertyHelper(@TCustomFormDesigner_R,@TCustomFormDesigner_W,'Designer');
    RegisterPropertyHelper(@TCustomFormDropTarget_R,@TCustomFormDropTarget_W,'DropTarget');
    RegisterPropertyHelper(@TCustomFormHelpFile_R,@TCustomFormHelpFile_W,'HelpFile');
    RegisterPropertyHelper(@TCustomFormKeyPreview_R,@TCustomFormKeyPreview_W,'KeyPreview');
    //RegisterPropertyHelper(@TCustomFormMenu_R,@TCustomFormMenu_W,'Menu');
    RegisterPropertyHelper(@TCustomFormModalResult_R,@TCustomFormModalResult_W,'ModalResult');
    //RegisterPropertyHelper(@TCustomFormOleFormObject_R,@TCustomFormOleFormObject_W,'OleFormObject');
    RegisterPropertyHelper(@TCustomFormWindowState_R,@TCustomFormWindowState_W,'WindowState');
  end;
end;
{$ENDIF}

{ TForm ---------------------------------------------------------------------- }
{$IFNDEF FPC}
  {$IFNDEF CLX}
    procedure TFORMACTIVEOLECONTROL_W(Self: TFORM; T: TWINCONTROL); begin Self.ACTIVEOLECONTROL := T; end;
    procedure TFORMACTIVEOLECONTROL_R(Self: TFORM; var T: TWINCONTROL); begin T := Self.ACTIVEOLECONTROL; end;
    procedure TFORMTILEMODE_W(Self: TFORM; T: TTILEMODE); begin Self.TILEMODE := T; end;
    procedure TFORMTILEMODE_R(Self: TFORM; var T: TTILEMODE); begin T := Self.TILEMODE; end;
  {$ENDIF}{CLX}
  procedure TFORMACTIVEMDICHILD_R(Self: TFORM; var T: TFORM); begin T := Self.ACTIVEMDICHILD; end;
  procedure TFORMDROPTARGET_W(Self: TFORM; T: BOOLEAN); begin Self.DROPTARGET := T; end;
  procedure TFORMDROPTARGET_R(Self: TFORM; var T: BOOLEAN); begin T := Self.DROPTARGET; end;
  procedure TFORMMDICHILDCOUNT_R(Self: TFORM; var T: INTEGER); begin T := Self.MDICHILDCOUNT; end;
  procedure TFORMMDICHILDREN_R(Self: TFORM; var T: TFORM; t1: INTEGER); begin T := Self.MDICHILDREN[T1]; end;
{$ENDIF}{FPC}
procedure TFORMMODALRESULT_W(Self: TFORM; T: TMODALRESULT); begin Self.MODALRESULT := T; end;
procedure TFORMMODALRESULT_R(Self: TFORM; var T: TMODALRESULT); begin T := Self.MODALRESULT; end;
procedure TFORMACTIVE_R(Self: TFORM; var T: BOOLEAN); begin T := Self.ACTIVE; end;
procedure TFORMCANVAS_R(Self: TFORM; var T: TCANVAS); begin T := Self.CANVAS; end;
{$IFNDEF CLX}
  procedure TFORMCLIENTHANDLE_R(Self: TFORM; var T: Longint); begin T := Self.CLIENTHANDLE; end;
{$ENDIF}

{ Innerfuse Pascal Script Class Import Utility (runtime) }

procedure RIRegisterTFORM(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TFORM) do
  begin
    {$IFDEF DELPHI4UP}
      RegisterVirtualConstructor(@TFORM.CREATENEW, 'CreateNew');
    {$ELSE}
      RegisterConstructor(@TFORM.CREATENEW, 'CreateNew');
    {$ENDIF}
    RegisterMethod(@TFORM.CLOSE, 'Close');
    RegisterMethod(@TFORM.HIDE, 'Hide');
    RegisterMethod(@TFORM.SHOW, 'Show');
    RegisterMethod(@TFORM.SHOWMODAL, 'ShowModal');
    RegisterMethod(@TFORM.RELEASE, 'Release');
    RegisterPropertyHelper(@TFORMACTIVE_R, nil, 'Active');
    {$IFNDEF PS_MINIVCL}
      {$IFNDEF FPC}
        {$IFNDEF CLX} 
          RegisterMethod(@TFORM.ARRANGEICONS, 'ArrangeIcons');
          RegisterMethod(@TFORM.GETFORMIMAGE, 'GetFormImage');
          RegisterMethod(@TFORM.PRINT, 'Print');
          RegisterMethod(@TFORM.SENDCANCELMODE, 'SendCancelMode');
          RegisterPropertyHelper(@TFORMACTIVEOLECONTROL_R, @TFORMACTIVEOLECONTROL_W, 'ActiveOleControl');
          RegisterPropertyHelper(@TFORMCLIENTHANDLE_R, nil, 'ClientHandle');
          RegisterPropertyHelper(@TFORMTILEMODE_R, @TFORMTILEMODE_W, 'TileMode');
        {$ENDIF}{CLX}
        RegisterMethod(@TFORM.CASCADE, 'Cascade');
        RegisterMethod(@TFORM.NEXT, 'Next');
        RegisterMethod(@TFORM.PREVIOUS, 'Previous');
        RegisterMethod(@TFORM.TILE, 'Tile');
        RegisterPropertyHelper(@TFORMACTIVEMDICHILD_R, nil, 'ActiveMDIChild');
        RegisterPropertyHelper(@TFORMDROPTARGET_R, @TFORMDROPTARGET_W, 'DropTarget');
        RegisterPropertyHelper(@TFORMMDICHILDCOUNT_R, nil, 'MDIChildCount');
        RegisterPropertyHelper(@TFORMMDICHILDREN_R, nil, 'MDIChildren');
      {$ENDIF}{FPC}
    RegisterMethod(@TFORM.CLOSEQUERY, 'CloseQuery');
    RegisterMethod(@TFORM.DEFOCUSCONTROL, 'DefocusControl');
    RegisterMethod(@TFORM.FOCUSCONTROL, 'FocusControl');
    RegisterMethod(@TFORM.SETFOCUSEDCONTROL, 'SetFocusedControl');
    RegisterPropertyHelper(@TFORMCANVAS_R, nil, 'Canvas');
    RegisterPropertyHelper(@TFORMMODALRESULT_R, @TFORMMODALRESULT_W, 'ModalResult');
    {$ENDIF}{PS_MINIVCL}
  end;
end;

{ TApplication --------------------------------------------------------------- }
{$IFNDEF FPC}
  procedure TAPPLICATIONACTIVE_R(Self: TAPPLICATION; var T: BOOLEAN); begin T := Self.ACTIVE; end;
  {$IFNDEF CLX}
    procedure TAPPLICATIONDIALOGHANDLE_R(Self: TAPPLICATION; var T: Longint); begin T := Self.DIALOGHANDLE; end;
    procedure TAPPLICATIONDIALOGHANDLE_W(Self: TAPPLICATION; T: Longint); begin Self.DIALOGHANDLE := T; end;
    procedure TAPPLICATIONHANDLE_R(Self: TAPPLICATION; var T: Longint); begin T := Self.HANDLE; end;
    procedure TAPPLICATIONHANDLE_W(Self: TAPPLICATION; T: Longint); begin Self.HANDLE := T; end;
    procedure TAPPLICATIONUPDATEFORMATSETTINGS_R(Self: TAPPLICATION; var T: BOOLEAN); begin T := Self.UPDATEFORMATSETTINGS; end;
    procedure TAPPLICATIONUPDATEFORMATSETTINGS_W(Self: TAPPLICATION; T: BOOLEAN); begin Self.UPDATEFORMATSETTINGS := T; end;
  {$ENDIF}
{$ENDIF}{FPC}
procedure TAPPLICATIONEXENAME_R(Self: TAPPLICATION; var T: STRING); begin T := Self.EXENAME; end;
procedure TAPPLICATIONHELPFILE_R(Self: TAPPLICATION; var T: STRING); begin T := Self.HELPFILE; end;
procedure TAPPLICATIONHELPFILE_W(Self: TAPPLICATION; T: STRING); begin Self.HELPFILE := T; end;
procedure TAPPLICATIONHINT_R(Self: TAPPLICATION; var T: STRING); begin T := Self.HINT; end;
procedure TAPPLICATIONHINT_W(Self: TAPPLICATION; T: STRING); begin Self.HINT := T; end;
procedure TAPPLICATIONHINTCOLOR_R(Self: TAPPLICATION; var T: TCOLOR); begin T := Self.HINTCOLOR; end;
procedure TAPPLICATIONHINTCOLOR_W(Self: TAPPLICATION; T: TCOLOR); begin Self.HINTCOLOR := T; end;
procedure TAPPLICATIONHINTPAUSE_R(Self: TAPPLICATION; var T: INTEGER); begin T := Self.HINTPAUSE; end;
procedure TAPPLICATIONHINTPAUSE_W(Self: TAPPLICATION; T: INTEGER); begin Self.HINTPAUSE := T; end;
procedure TAPPLICATIONHINTSHORTPAUSE_R(Self: TAPPLICATION; var T: INTEGER); begin T := Self.HINTSHORTPAUSE; end;
procedure TAPPLICATIONHINTSHORTPAUSE_W(Self: TAPPLICATION; T: INTEGER); begin Self.HINTSHORTPAUSE := T; end;
procedure TAPPLICATIONHINTHIDEPAUSE_R(Self: TAPPLICATION; var T: INTEGER); begin T := Self.HINTHIDEPAUSE; end;
procedure TAPPLICATIONHINTHIDEPAUSE_W(Self: TAPPLICATION; T: INTEGER); begin Self.HINTHIDEPAUSE := T; end;
procedure TAPPLICATIONMAINFORM_R(Self: TAPPLICATION; var T: {$IFDEF DELPHI3UP}TCustomForm{$ELSE}TFORM{$ENDIF}); begin T := Self.MAINFORM; end;
procedure TAPPLICATIONSHOWHINT_R(Self: TAPPLICATION; var T: BOOLEAN); begin T := Self.SHOWHINT; end;
procedure TAPPLICATIONSHOWHINT_W(Self: TAPPLICATION; T: BOOLEAN); begin Self.SHOWHINT := T; end;
procedure TAPPLICATIONSHOWMAINFORM_R(Self: TAPPLICATION; var T: BOOLEAN); begin T := Self.SHOWMAINFORM; end;
procedure TAPPLICATIONSHOWMAINFORM_W(Self: TAPPLICATION; T: BOOLEAN); begin Self.SHOWMAINFORM := T; end;
procedure TAPPLICATIONTERMINATED_R(Self: TAPPLICATION; var T: BOOLEAN); begin T := Self.TERMINATED; end;
procedure TAPPLICATIONTITLE_R(Self: TAPPLICATION; var T: STRING); begin T := Self.TITLE; end;
procedure TAPPLICATIONTITLE_W(Self: TAPPLICATION; T: STRING); begin Self.TITLE := T; end;
{$IFNDEF FPC}
  procedure TAPPLICATIONONACTIVATE_R(Self: TAPPLICATION; var T: TNOTIFYEVENT); begin T := Self.ONACTIVATE; end;
  procedure TAPPLICATIONONACTIVATE_W(Self: TAPPLICATION; T: TNOTIFYEVENT); begin Self.ONACTIVATE := T; end;
  procedure TAPPLICATIONONDEACTIVATE_R(Self: TAPPLICATION; var T: TNOTIFYEVENT); begin T := Self.ONDEACTIVATE; end;
  procedure TAPPLICATIONONDEACTIVATE_W(Self: TAPPLICATION; T: TNOTIFYEVENT); begin Self.ONDEACTIVATE := T; end;
{$ENDIF}
procedure TAPPLICATIONONIDLE_R(Self: TAPPLICATION; var T: TIDLEEVENT); begin T := Self.ONIDLE; end;
procedure TAPPLICATIONONIDLE_W(Self: TAPPLICATION; T: TIDLEEVENT); begin Self.ONIDLE := T; end;
procedure TAPPLICATIONONHELP_R(Self: TAPPLICATION; var T: THELPEVENT); begin T := Self.ONHELP; end;
procedure TAPPLICATIONONHELP_W(Self: TAPPLICATION; T: THELPEVENT); begin Self.ONHELP := T; end;
procedure TAPPLICATIONONHINT_R(Self: TAPPLICATION; var T: TNOTIFYEVENT); begin T := Self.ONHINT; end;
procedure TAPPLICATIONONHINT_W(Self: TAPPLICATION; T: TNOTIFYEVENT); begin Self.ONHINT := T; end;
{$IFNDEF FPC}
  procedure TAPPLICATIONONMINIMIZE_R(Self: TAPPLICATION; var T: TNOTIFYEVENT); begin T := Self.ONMINIMIZE; end;
  procedure TAPPLICATIONONMINIMIZE_W(Self: TAPPLICATION; T: TNOTIFYEVENT); begin Self.ONMINIMIZE := T; end;
  procedure TAPPLICATIONONRESTORE_R(Self: TAPPLICATION; var T: TNOTIFYEVENT); begin T := Self.ONRESTORE; end;
  procedure TAPPLICATIONONRESTORE_W(Self: TAPPLICATION; T: TNOTIFYEVENT); begin Self.ONRESTORE := T; end;
  {$IFNDEF PS_MINIVCL}
    procedure TAPPLICATIONONMESSAGE_R(Self: TAPPLICATION; var T: TMESSAGEEVENT); begin T := Self.ONMESSAGE; end;
    procedure TAPPLICATIONONMESSAGE_W(Self: TAPPLICATION; T: TMESSAGEEVENT); begin Self.ONMESSAGE := T; end;
    procedure TAPPLICATIONICON_W(Self: TAPPLICATION; const T: TICON); begin Self.ICON := T; end;
    procedure TAPPLICATIONICON_R(Self: TAPPLICATION; var T: TICON); begin T := Self.ICON; end;
  {$ENDIF}
{$ENDIF}

procedure RIRegisterTAPPLICATION(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TAPPLICATION) do
  begin
    {$IFNDEF FPC}
      RegisterMethod(@TAPPLICATION.MINIMIZE, 'Minimize');
      RegisterMethod(@TAPPLICATION.RESTORE, 'Restore');
      RegisterPropertyHelper(@TAPPLICATIONACTIVE_R, nil, 'Active');
      RegisterPropertyHelper(@TAPPLICATIONONACTIVATE_R, @TAPPLICATIONONACTIVATE_W, 'OnActivate');
      RegisterPropertyHelper(@TAPPLICATIONONDEACTIVATE_R, @TAPPLICATIONONDEACTIVATE_W, 'OnDeactivate');
      RegisterPropertyHelper(@TAPPLICATIONONMINIMIZE_R, @TAPPLICATIONONMINIMIZE_W, 'OnMinimize');
      RegisterPropertyHelper(@TAPPLICATIONONRESTORE_R, @TAPPLICATIONONRESTORE_W, 'OnRestore');
      {$IFNDEF PS_MINIVCL}
        RegisterPropertyHelper(@TAPPLICATIONONMESSAGE_R, @TAPPLICATIONONMESSAGE_W, 'OnMessage');
        RegisterPropertyHelper(@TAPPLICATIONICON_R,@TAPPLICATIONICON_W,'Icon');
      {$ENDIF}
      RegisterPropertyHelper(@TAPPLICATIONDIALOGHANDLE_R, @TAPPLICATIONDIALOGHANDLE_W, 'DialogHandle');
      RegisterMethod(@TAPPLICATION.CREATEHANDLE, 'CreateHandle');
      RegisterMethod(@TAPPLICATION.NORMALIZETOPMOSTS, 'NormalizeTopMosts');
      RegisterMethod(@TAPPLICATION.RESTORETOPMOSTS, 'RestoreTopMosts');
      {$IFNDEF CLX}
        RegisterPropertyHelper(@TAPPLICATIONHANDLE_R, @TAPPLICATIONHANDLE_W, 'Handle');
        RegisterPropertyHelper(@TAPPLICATIONUPDATEFORMATSETTINGS_R, @TAPPLICATIONUPDATEFORMATSETTINGS_W, 'UpdateFormatSettings');
      {$ENDIF}
    {$ENDIF}
    RegisterMethod(@TAPPLICATION.BRINGTOFRONT, 'BringToFront');
    RegisterMethod(@TAPPLICATION.MESSAGEBOX, 'MessageBox');
    RegisterMethod(@TAPPLICATION.PROCESSMESSAGES, 'ProcessMessages');
    RegisterMethod(@TAPPLICATION.TERMINATE, 'Terminate');
    RegisterPropertyHelper(@TAPPLICATIONEXENAME_R, nil, 'ExeName');
    RegisterPropertyHelper(@TAPPLICATIONHINT_R, @TAPPLICATIONHINT_W, 'Hint');
    RegisterPropertyHelper(@TAPPLICATIONMAINFORM_R, nil, 'MainForm');
    RegisterPropertyHelper(@TAPPLICATIONSHOWHINT_R, @TAPPLICATIONSHOWHINT_W, 'ShowHint');
    RegisterPropertyHelper(@TAPPLICATIONSHOWMAINFORM_R, @TAPPLICATIONSHOWMAINFORM_W, 'ShowMainForm');
    RegisterPropertyHelper(@TAPPLICATIONTERMINATED_R, nil, 'Terminated');
    RegisterPropertyHelper(@TAPPLICATIONTITLE_R, @TAPPLICATIONTITLE_W, 'Title');
    RegisterPropertyHelper(@TAPPLICATIONONIDLE_R, @TAPPLICATIONONIDLE_W, 'OnIdle');
    RegisterPropertyHelper(@TAPPLICATIONONHINT_R, @TAPPLICATIONONHINT_W, 'OnHint');
    {$IFNDEF PS_MINIVCL}
      RegisterMethod(@TAPPLICATION.CONTROLDESTROYED, 'ControlDestroyed');
      RegisterMethod(@TAPPLICATION.CANCELHINT, 'CancelHint');
      {$IFNDEF CLX}
        {$IFNDEF FPC}
          RegisterMethod(@TAPPLICATION.HELPCOMMAND, 'HelpCommand');
        {$ENDIF}
        RegisterMethod(@TAPPLICATION.HELPCONTEXT, 'HelpContext');
        {$IFNDEF FPC}
          RegisterMethod(@TAPPLICATION.HELPJUMP, 'HelpJump');
        {$ENDIF}
      {$ENDIF}
      //RegisterMethod(@TAPPLICATION.HANDLEEXCEPTION, 'HandleException');
      //RegisterMethod(@TAPPLICATION.HOOKMAINWINDOW, 'HookMainWindow');
      //RegisterMethod(@TAPPLICATION.UNHOOKMAINWINDOW, 'UnhookMainWindow');
      RegisterMethod(@TAPPLICATION.HANDLEMESSAGE, 'HandleMessage');
      RegisterMethod(@TAPPLICATION.HIDEHINT, 'HideHint');
      RegisterMethod(@TAPPLICATION.HINTMOUSEMESSAGE, 'HintMouseMessage');
      RegisterMethod(@TAPPLICATION.INITIALIZE, 'Initialize');
      RegisterMethod(@TAPPLICATION.RUN, 'Run');
      //RegisterMethod(@TAPPLICATION.SHOWEXCEPTION, 'ShowException');
      RegisterPropertyHelper(@TAPPLICATIONHELPFILE_R, @TAPPLICATIONHELPFILE_W, 'HelpFile');
      RegisterPropertyHelper(@TAPPLICATIONHINTCOLOR_R, @TAPPLICATIONHINTCOLOR_W, 'HintColor');
      RegisterPropertyHelper(@TAPPLICATIONHINTPAUSE_R, @TAPPLICATIONHINTPAUSE_W, 'HintPause');
      RegisterPropertyHelper(@TAPPLICATIONHINTSHORTPAUSE_R, @TAPPLICATIONHINTSHORTPAUSE_W, 'HintShortPause');
      RegisterPropertyHelper(@TAPPLICATIONHINTHIDEPAUSE_R, @TAPPLICATIONHINTHIDEPAUSE_W, 'HintHidePause');
      RegisterPropertyHelper(@TAPPLICATIONONHELP_R, @TAPPLICATIONONHELP_W, 'OnHelp');
    {$ENDIF}
  end;
end;

{$IFNDEF PS_MINIVCL}
{ TScreen -------------------------------------------------------------------- }
// procedure TScreenUpdatingAllFonts_R(Self: TScreen; var T: Boolean); begin T := Self.UpdatingAllFonts; end;
procedure TScreenOnActiveFormChange_W(Self: TScreen; const T: TNotifyEvent); begin Self.OnActiveFormChange := T; end;
procedure TScreenOnActiveFormChange_R(Self: TScreen; var T: TNotifyEvent); begin T := Self.OnActiveFormChange; end;
procedure TScreenOnActiveControlChange_W(Self: TScreen; const T: TNotifyEvent); begin Self.OnActiveControlChange := T; end;
procedure TScreenOnActiveControlChange_R(Self: TScreen; var T: TNotifyEvent); begin T := Self.OnActiveControlChange; end;
procedure TScreenWidth_R(Self: TScreen; var T: Integer); begin T := Self.Width; end;
// procedure TScreenPrimaryMonitor_R(Self: TScreen; var T: TMonitor); begin T := Self.PrimaryMonitor; end;
procedure TScreenPixelsPerInch_R(Self: TScreen; var T: Integer); begin T := Self.PixelsPerInch; end;
procedure TScreenHeight_R(Self: TScreen; var T: Integer); begin T := Self.Height; end;
// procedure TScreenDefaultKbLayout_R(Self: TScreen; var T: HKL); begin T := Self.DefaultKbLayout; end;
// procedure TScreenDefaultIme_R(Self: TScreen; var T: string); begin T := Self.DefaultIme; end;
// procedure TScreenImes_R(Self: TScreen; var T: TStrings); begin T := Self.Imes; end;
procedure TScreenForms_R(Self: TScreen; var T: TForm; const t1: Integer); begin T := Self.Forms[t1]; end;
procedure TScreenFormCount_R(Self: TScreen; var T: Integer); begin T := Self.FormCount; end;
procedure TScreenFonts_R(Self: TScreen; var T: TStrings); begin T := Self.Fonts; end;
// procedure TScreenCaptionFont_W(Self: TScreen; const T: TFont); begin Self.CaptionFont := T; end;
// procedure TScreenCaptionFont_R(Self: TScreen; var T: TFont); begin T := Self.CaptionFont; end;
// procedure TScreenMessageFont_W(Self: TScreen; const T: TFont); begin Self.MessageFont := T; end;
// procedure TScreenMessageFont_R(Self: TScreen; var T: TFont); begin T := Self.MessageFont; end;
// procedure TScreenMenuFont_W(Self: TScreen; const T: TFont); begin Self.MenuFont := T; end;
// procedure TScreenMenuFont_R(Self: TScreen; var T: TFont); begin T := Self.MenuFont; end;
// procedure TScreenIconFont_W(Self: TScreen; const T: TFont); begin Self.IconFont := T; end;
// procedure TScreenIconFont_R(Self: TScreen; var T: TFont); begin T := Self.IconFont; end;
// procedure TScreenHintFont_W(Self: TScreen; const T: TFont); begin Self.HintFont := T; end;
// procedure TScreenHintFont_R(Self: TScreen; var T: TFont); begin T := Self.HintFont; end;
// procedure TScreenWorkAreaWidth_R(Self: TScreen; var T: Integer); begin T := Self.WorkAreaWidth; end;
// procedure TScreenWorkAreaTop_R(Self: TScreen; var T: Integer); begin T := Self.WorkAreaTop; end;
// procedure TScreenWorkAreaLeft_R(Self: TScreen; var T: Integer); begin T := Self.WorkAreaLeft; end;
// procedure TScreenWorkAreaHeight_R(Self: TScreen; var T: Integer); begin T := Self.WorkAreaHeight; end;
// procedure TScreenWorkAreaRect_R(Self: TScreen; var T: TRect); begin T := Self.WorkAreaRect; end;
// procedure TScreenDesktopWidth_R(Self: TScreen; var T: Integer); begin T := Self.DesktopWidth; end;
// procedure TScreenDesktopTop_R(Self: TScreen; var T: Integer); begin T := Self.DesktopTop; end;
// procedure TScreenDesktopLeft_R(Self: TScreen; var T: Integer); begin T := Self.DesktopLeft; end;
// procedure TScreenDesktopHeight_R(Self: TScreen; var T: Integer); begin T := Self.DesktopHeight; end;
// procedure TScreenDesktopRect_R(Self: TScreen; var T: TRect); begin T := Self.DesktopRect; end;
// procedure TScreenMonitors_R(Self: TScreen; var T: TMonitor; const t1: Integer); begin T := Self.Monitors[t1]; end;
// procedure TScreenMonitorCount_R(Self: TScreen; var T: Integer); begin T := Self.MonitorCount; end;
// procedure TScreenSaveFocusedList_R(Self: TScreen; var T: TList); begin T := Self.SaveFocusedList; end;
// procedure TScreenFocusedForm_W(Self: TScreen; const T: TCustomForm); begin Self.FocusedForm := T; end;
// procedure TScreenFocusedForm_R(Self: TScreen; var T: TCustomForm); begin T := Self.FocusedForm; end;
// procedure TScreenDataModuleCount_R(Self: TScreen; var T: Integer); begin T := Self.DataModuleCount; end;
// procedure TScreenDataModules_R(Self: TScreen; var T: TDataModule; const t1: Integer); begin T := Self.DataModules[t1]; end;
procedure TScreenCursors_W(Self: TScreen; const T: Cardinal; const t1: Integer); begin Self.Cursors[t1] := T; end;
procedure TScreenCursors_R(Self: TScreen; var T: Cardinal; const t1: Integer); begin T := Self.Cursors[t1]; end;
procedure TScreenCursor_W(Self: TScreen; const T: TCursor); begin Self.Cursor := T; end;
procedure TScreenCursor_R(Self: TScreen; var T: TCursor); begin T := Self.Cursor; end;
// procedure TScreenCursorCount_R(Self: TScreen; var T: Integer); begin T := Self.CursorCount; end;
// procedure TScreenCustomForms_R(Self: TScreen; var T: TCustomForm; const t1: Integer); begin T := Self.CustomForms[t1]; end;
// procedure TScreenCustomFormCount_R(Self: TScreen; var T: Integer); begin T := Self.CustomFormCount; end;
procedure TScreenActiveForm_R(Self: TScreen; var T: TForm); begin T := Self.ActiveForm; end;
// procedure TScreenActiveCustomForm_R(Self: TScreen; var T: TCustomForm); begin T := Self.ActiveCustomForm; end;
procedure TScreenActiveControl_R(Self: TScreen; var T: TWinControl); begin T := Self.ActiveControl; end;

procedure RIRegisterTSCREEN(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TScreen) do
  begin
//    RegisterMethod(@TScreen.DisableAlign, 'DisableAlign');
//    RegisterMethod(@TScreen.EnableAlign, 'EnableAlign');
//    RegisterMethod(@TScreen.MonitorFromPoint, 'MonitorFromPoint');
//    RegisterMethod(@TScreen.MonitorFromRect, 'MonitorFromRect');
//    RegisterMethod(@TScreen.MonitorFromWindow, 'MonitorFromWindow');
//    RegisterMethod(@TScreen.Realign, 'Realign');
//    RegisterMethod(@TScreen.ResetFonts, 'ResetFonts');
    RegisterPropertyHelper(@TScreenActiveControl_R,nil,'ActiveControl');
//    RegisterPropertyHelper(@TScreenActiveCustomForm_R,nil,'ActiveCustomForm');
    RegisterPropertyHelper(@TScreenActiveForm_R,nil,'ActiveForm');
//    RegisterPropertyHelper(@TScreenCustomFormCount_R,nil,'CustomFormCount');
//    RegisterPropertyHelper(@TScreenCustomForms_R,nil,'CustomForms');
//    RegisterPropertyHelper(@TScreenCursorCount_R,nil,'CursorCount');
    RegisterPropertyHelper(@TScreenCursor_R,@TScreenCursor_W,'Cursor');
    RegisterPropertyHelper(@TScreenCursors_R,@TScreenCursors_W,'Cursors');
//    RegisterPropertyHelper(@TScreenDataModules_R,nil,'DataModules');
//    RegisterPropertyHelper(@TScreenDataModuleCount_R,nil,'DataModuleCount');
//    RegisterPropertyHelper(@TScreenFocusedForm_R,@TScreenFocusedForm_W,'FocusedForm');
//    RegisterPropertyHelper(@TScreenSaveFocusedList_R,nil,'SaveFocusedList');
//    RegisterPropertyHelper(@TScreenMonitorCount_R,nil,'MonitorCount');
//    RegisterPropertyHelper(@TScreenMonitors_R,nil,'Monitors');
//    RegisterPropertyHelper(@TScreenDesktopRect_R,nil,'DesktopRect');
//    RegisterPropertyHelper(@TScreenDesktopHeight_R,nil,'DesktopHeight');
//    RegisterPropertyHelper(@TScreenDesktopLeft_R,nil,'DesktopLeft');
//    RegisterPropertyHelper(@TScreenDesktopTop_R,nil,'DesktopTop');
//    RegisterPropertyHelper(@TScreenDesktopWidth_R,nil,'DesktopWidth');
//    RegisterPropertyHelper(@TScreenWorkAreaRect_R,nil,'WorkAreaRect');
//    RegisterPropertyHelper(@TScreenWorkAreaHeight_R,nil,'WorkAreaHeight');
//    RegisterPropertyHelper(@TScreenWorkAreaLeft_R,nil,'WorkAreaLeft');
//    RegisterPropertyHelper(@TScreenWorkAreaTop_R,nil,'WorkAreaTop');
//    RegisterPropertyHelper(@TScreenWorkAreaWidth_R,nil,'WorkAreaWidth');
//    RegisterPropertyHelper(@TScreenHintFont_R,@TScreenHintFont_W,'HintFont');
//    RegisterPropertyHelper(@TScreenIconFont_R,@TScreenIconFont_W,'IconFont');
//    RegisterPropertyHelper(@TScreenMenuFont_R,@TScreenMenuFont_W,'MenuFont');
//    RegisterPropertyHelper(@TScreenMessageFont_R,@TScreenMessageFont_W,'MessageFont');
//    RegisterPropertyHelper(@TScreenCaptionFont_R,@TScreenCaptionFont_W,'CaptionFont');
    RegisterPropertyHelper(@TScreenFonts_R,nil,'Fonts');
    RegisterPropertyHelper(@TScreenFormCount_R,nil,'FormCount');
    RegisterPropertyHelper(@TScreenForms_R,nil,'Forms');
//    RegisterPropertyHelper(@TScreenImes_R,nil,'Imes');
//    RegisterPropertyHelper(@TScreenDefaultIme_R,nil,'DefaultIme');
//    RegisterPropertyHelper(@TScreenDefaultKbLayout_R,nil,'DefaultKbLayout');
    RegisterPropertyHelper(@TScreenHeight_R,nil,'Height');
    RegisterPropertyHelper(@TScreenPixelsPerInch_R,nil,'PixelsPerInch');
//    RegisterPropertyHelper(@TScreenPrimaryMonitor_R,nil,'PrimaryMonitor');
    RegisterPropertyHelper(@TScreenWidth_R,nil,'Width');
    RegisterPropertyHelper(@TScreenOnActiveControlChange_R,@TScreenOnActiveControlChange_W,'OnActiveControlChange');
    RegisterPropertyHelper(@TScreenOnActiveFormChange_R,@TScreenOnActiveFormChange_W,'OnActiveFormChange');
//    RegisterPropertyHelper(@TScreenUpdatingAllFonts_R,nil,'UpdatingAllFonts');
  end;
end;
{$ENDIF}

(*----------------------------------------------------------------------------*)
procedure RIRegister_Forms(Cl: TPSRuntimeClassImporter);
begin
  {$IFNDEF PS_MINIVCL}
    RIRegisterTCONTROLSCROLLBAR(Cl);
    RIRegisterTSCROLLBOX(Cl);
  {$ENDIF}
  {$IFNDEF FPC}
    RIRegisterTScrollingWinControl(Cl);
  {$ENDIF}
  {$IFNDEF PS_MINIVCL}
    RIRegisterTCustomForm(Cl);
  {$ENDIF}
  RIRegisterTForm(Cl);
  {$IFNDEF PS_MINIVCL}
    RIRegisterTScreen(Cl);
    RIRegisterTApplication(Cl);
  {$ENDIF}
end;

// PS_MINIVCL changes by Martijn Laan
// FPC changes by Boguslaw brandys (brandys at o2 _dot_ pl)
end.
