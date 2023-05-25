{ Compiletime Forms support }
unit uPSC_forms;

{$I PascalScript.inc}

interface

uses
  uPSCompiler, uPSUtils;

procedure SIRegister_Forms_TypesAndConsts(Cl: TPSPascalCompiler);

procedure SIRegisterTCONTROLSCROLLBAR(Cl: TPSPascalCompiler);
procedure SIRegisterTSCROLLINGWINCONTROL(Cl: TPSPascalCompiler);
procedure SIRegisterTSCROLLBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTFORM(Cl: TPSPascalCompiler);
{$IFNDEF PS_MINIVCL}
  procedure SIRegisterTCUSTOMFORM(Cl: TPSPascalCompiler);
{$ENDIF}
procedure SIRegisterTAPPLICATION(Cl: TPSPascalCompiler);
{$IFNDEF PS_MINIVCL}
  procedure SIRegisterTSCREEN(Cl: TPSPascalCompiler);
{$ENDIF}
procedure SIRegister_Forms(Cl: TPSPascalCompiler);

implementation

{ TControlScrollBar ---------------------------------------------------------- }
procedure SIRegisterTCONTROLSCROLLBAR(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TPersistent'), 'TControlScrollBar') do
  begin
    RegisterProperty('Kind', 'TScrollBarKind', iptr);
    RegisterProperty('ScrollPos', 'Integer', iptr);
    RegisterProperty('Margin', 'Word', iptrw);
    RegisterProperty('Increment', 'TScrollBarInc', iptrw);
    RegisterProperty('Range', 'Integer', iptrw);
    RegisterProperty('Position', 'Integer', iptrw);
    RegisterProperty('Tracking', 'Boolean', iptrw);
    RegisterProperty('Visible', 'Boolean', iptrw);
  end;
end;

{ TScrollingWinControl ------------------------------------------------------- }
procedure SIRegisterTSCROLLINGWINCONTROL(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TWinControl'), 'TScrollingWinControl') do
  begin
    RegisterMethod('procedure ScrollInView(AControl: TControl)');
    RegisterProperty('HorzScrollBar', 'TControlScrollBar', iptrw);
    RegisterProperty('VertScrollBar', 'TControlScrollBar', iptrw);
  end;
end;

{ TScrollBox ----------------------------------------------------------------- }
procedure SIRegisterTSCROLLBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TScrollingWinControl'), 'TScrollBox') do
  begin
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
      RegisterProperty('Constraints', 'TSizeConstraints', iptrw);
    {$ENDIF}
    RegisterProperty('BorderStyle', 'TBorderStyle', iptrw);
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('AutoScroll', 'Boolean', iptrw);
    RegisterProperty('ParentColor', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDblClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterProperty('OnResize', 'TNotifyEvent', iptrw);
      RegisterProperty('DragCursor', 'TCursor', iptrw);
      RegisterProperty('DragMode', 'TDragMode', iptrw);
      RegisterProperty('ParentShowHint', 'Boolean', iptrw);
      RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
      RegisterProperty('CTL3D', 'Boolean', iptrw);
      RegisterProperty('ParentCtl3D', 'Boolean', iptrw);
      RegisterProperty('StyleElements', 'TStyleElements', iptrw);
      RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
      RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
      RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
      RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
      RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
      RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
      RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
      RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    {$ENDIF}
  end;
end;

{$IFNDEF PS_MINIVCL}
{ TCustomForm ---------------------------------------------------------------- }
procedure SIRegisterTCUSTOMFORM(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TScrollingWinControl', 'TCustomForm') do
  with Cl.AddClassN(Cl.FindClass('TScrollingWinControl'),'TCustomForm') do
  begin
    {$IFDEF DELPHI4UP}
      RegisterMethod('constructor CreateNew(AOwner: TComponent; Dummy: Integer)');
    {$ELSE}
      RegisterMethod('constructor CreateNew(AOwner: TComponent)');
    {$ENDIF}
    RegisterMethod('procedure Close');
    RegisterMethod('function CloseQuery: Boolean');
    RegisterMethod('procedure DefocusControl(Control: TWinControl; Removing: Boolean)');
    RegisterMethod('procedure FocusControl(Control: TWinControl)');
    RegisterMethod('function GetFormImage: TBitmap');
    RegisterMethod('procedure Hide');
    RegisterMethod('procedure Print');
    RegisterMethod('procedure Release');
    RegisterMethod('procedure SendCancelMode(Sender: TControl)');
    RegisterMethod('function SetFocusedControl(Control: TWinControl): Boolean');
    RegisterMethod('procedure Show');
    RegisterMethod('function ShowModal: Integer');
    RegisterMethod('function WantChildKey(Child: TControl; var Message: TMessage): Boolean');
    RegisterProperty('Active', 'Boolean', iptr);
    RegisterProperty('ActiveControl', 'TWinControl', iptrw);
    RegisterProperty('ActiveOleControl', 'TWinControl', iptrw);
    RegisterProperty('Canvas', 'TCanvas', iptr);
    RegisterProperty('Caption', 'NativeString', iptrw);
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    //RegisterProperty('Designer', 'TDesigner', iptrw);
    RegisterProperty('DropTarget', 'Boolean', iptrw);
    RegisterProperty('HelpFile', 'string', iptrw);
    RegisterProperty('KeyPreview', 'Boolean', iptrw);
    RegisterProperty('Menu', 'TMainMenu', iptrw);
    RegisterProperty('ModalResult', 'LongInt', iptrw);
    //RegisterProperty('OleFormObject', 'TOLEFormObject', iptrw);
    RegisterProperty('WindowState', 'TWindowState', iptrw);
  end;
end;
{$ENDIF}

{ TForm ---------------------------------------------------------------------- }
procedure SIRegisterTFORM(Cl: TPSPascalCompiler);
begin
{$IFNDEF PS_MINIVCL}
  with Cl.AddClassN(Cl.FindClass('TCustomForm'), 'TForm') do
{$ELSE}
  with Cl.AddClassN(cl.FindClass('TScrollingWinControl'), 'TForm') do
{$ENDIF}
  begin
    {$IFDEF DELPHI4UP}
      RegisterMethod('constructor CreateNew(AOwner: TComponent; Dummy: Integer)');
    {$ELSE}
      RegisterMethod('constructor CreateNew(AOwner: TComponent)');
    {$ENDIF}
    RegisterMethod('procedure Close');
    RegisterMethod('procedure Hide');
    RegisterMethod('procedure Show');
    RegisterMethod('function ShowModal: Integer');
    RegisterMethod('procedure Release');
    RegisterProperty('Active', 'Boolean', iptr);
    RegisterProperty('ActiveControl', 'TWinControl', iptrw);
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
      RegisterProperty('Constraints', 'TSizeConstraints', iptrw);
    {$ENDIF}
    RegisterProperty('BorderIcons', 'TBorderIcons', iptrw);
    RegisterProperty('BorderStyle', 'TFormBorderStyle', iptrw);
    RegisterProperty('Caption', 'NativeString', iptrw);
    RegisterProperty('AutoScroll', 'Boolean', iptrw);
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('FormStyle', 'TFormStyle', iptrw);
    RegisterProperty('KeyPreview', 'Boolean', iptrw);
    RegisterProperty('Position', 'TPosition', iptrw);
    RegisterProperty('OnActivate', 'TNotifyEvent', iptrw);
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDblClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnClose', 'TCloseEvent', iptrw);
    RegisterProperty('OnCloseQuery', 'TCloseQueryEvent', iptrw);
    RegisterProperty('OnCreate', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDestroy', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDeactivate', 'TNotifyEvent', iptrw);
    RegisterProperty('OnHide', 'TNotifyEvent', iptrw);
    RegisterProperty('OnKeyDown', 'TKeyEvent', iptrw);
    RegisterProperty('OnKeyPress', 'TKeyPressEvent', iptrw);
    RegisterProperty('OnKeyUp', 'TKeyEvent', iptrw);
    RegisterProperty('OnResize', 'TNotifyEvent', iptrw);
    RegisterProperty('OnShow', 'TNotifyEvent', iptrw);
    {$IFNDEF PS_MINIVCL}
      {$IFNDEF CLX}
        RegisterMethod('procedure ArrangeIcons');
        //RegisterMethod('function GetFormImage: TBitmap');
        RegisterMethod('procedure Print');
        RegisterMethod('procedure SendCancelMode(Sender: TControl)');
        RegisterProperty('ActiveOleControl', 'TWinControl', iptrw);
        RegisterProperty('OleFormObject', 'TOLEFormObject', iptrw);
        RegisterProperty('ClientHandle', 'LongInt', iptr);
        RegisterProperty('TileMode', 'TTileMode', iptrw);
      {$ENDIF}
      RegisterMethod('procedure Cascade');
      RegisterMethod('function CloseQuery: Boolean');
      RegisterMethod('procedure DefocusControl(Control: TWinControl; Removing: Boolean)');
      RegisterMethod('procedure FocusControl(Control: TWinControl)');
      RegisterMethod('procedure Next');
      RegisterMethod('procedure Previous');
      RegisterMethod('function SetFocusedControl(Control: TWinControl): Boolean');
      RegisterMethod('procedure Tile');
      RegisterProperty('ActiveMDIChild', 'TForm', iptr);
      RegisterProperty('AlphaBlend', 'Boolean', iptrw);
      RegisterProperty('AlphaBlendValue', 'Byte', iptrw);
      RegisterProperty('Canvas', 'TCanvas', iptr);
      RegisterProperty('DoubleBuffered', 'Boolean', iptrw);
      RegisterProperty('DropTarget', 'Boolean', iptrw);
      RegisterProperty('ModalResult', 'LongInt', iptrw);
      RegisterProperty('MDIChildCount', 'Integer', iptr);
      RegisterProperty('MDIChildren', 'TForm Integer', iptr);
      RegisterProperty('Icon', 'TIcon', iptrw);
      RegisterProperty('Menu', 'TMainMenu', iptrw);
      RegisterProperty('ObjectMenuItem', 'TMenuItem', iptrw);
      RegisterProperty('PixelsPerInch', 'Integer', iptrw);
      RegisterProperty('PrintScale', 'TPrintScale', iptrw);
      RegisterProperty('Scaled', 'Boolean', iptrw);
      RegisterProperty('WindowState', 'TWindowState', iptrw);
      RegisterProperty('WindowMenu', 'TMenuItem', iptrw);
      RegisterProperty('CTL3D', 'Boolean', iptrw);
      RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
      RegisterProperty('TransparentColor', 'Boolean', iptrw);
      RegisterProperty('TransparentColorValue', 'TColor', iptrw);
      RegisterProperty('StyleElements', 'TStyleElements', iptrw);
      RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
      RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
      RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
      RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
      RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
      RegisterProperty('OnPaint', 'TNotifyEvent', iptrw);
      RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
      RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    {$ENDIF}
  end;
end;

{ TApplication --------------------------------------------------------------- }
procedure SIRegisterTAPPLICATION(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TComponent'), 'TApplication') do
  begin
    RegisterMethod('procedure BringToFront');
    {$IFDEF PS_PANSICHAR}
      RegisterMethod('function MessageBox(Text,Caption: PAnsiChar; Flags: Word): Integer');
    {$ELSE}
      {$IFDEF UNICODE}
        RegisterMethod('function MessageBox(Text,Caption: string; Flags: Word): Integer');
      {$ELSE}
        RegisterMethod('function MessageBox(Text,Caption: PChar; Flags: Word): Integer');
      {$ENDIF}
    {$ENDIF}
    RegisterMethod('procedure Minimize');
    RegisterMethod('procedure ProcessMessages');
    RegisterMethod('procedure Restore');
    RegisterMethod('procedure Terminate');
    RegisterProperty('Active', 'Boolean', iptr);
    RegisterProperty('ExeName', 'NativeString', iptr);
    {$IFNDEF CLX}
      RegisterProperty('Handle', 'LongInt', iptrw);
      RegisterProperty('UpdateFormatSettings', 'Boolean', iptrw);
    {$ENDIF}
    RegisterProperty('Hint', 'NativeString', iptrw);
    RegisterProperty('MainForm', 'TForm', iptr);
    RegisterProperty('ShowHint', 'Boolean', iptrw);
    RegisterProperty('ShowMainForm', 'Boolean', iptrw);
    RegisterProperty('Terminated', 'Boolean', iptr);
    RegisterProperty('Title', 'NativeString', iptrw);
    RegisterProperty('OnActivate', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDeactivate', 'TNotifyEvent', iptrw);
    RegisterProperty('OnIdle', 'TIdleEvent', iptrw);
    RegisterProperty('OnHint', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMinimize', 'TNotifyEvent', iptrw);
    RegisterProperty('OnRestore', 'TNotifyEvent', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterMethod('procedure ControlDestroyed(Control: TControl)');
      RegisterMethod('procedure CancelHint');
      RegisterMethod('procedure HandleException(Sender: TObject)');
      RegisterMethod('procedure HandleMessage');
      RegisterMethod('procedure HideHint');
      //RegisterMethod('procedure HintMouseMessage(Control: TControl; var Message: TMessage)');
      RegisterMethod('procedure Initialize');
      RegisterMethod('procedure NormalizeTopMosts');
      RegisterMethod('procedure RestoreTopMosts');
      RegisterMethod('procedure Run');
      //RegisterMethod('procedure ShowException(E: Exception)');
      {$IFNDEF CLX}
        RegisterMethod('function HelpCommand(Command: Integer; Data: LongInt): Boolean');
        RegisterMethod('function HelpContext(Context: THelpContext): Boolean');
        RegisterMethod('function HelpJump(JumpID: NativeString): Boolean');
        RegisterProperty('DialogHandle', 'LongInt', iptrw);
        RegisterMethod('procedure CreateHandle');
        //RegisterMethod('procedure HookMainWindow(Hook: TWindowHook)');
        //RegisterMethod('procedure UnhookMainWindow(Hook: TWindowHook)');
      {$ENDIF}
      RegisterProperty('HelpFile', 'NativeString', iptrw);
      RegisterProperty('HintColor', 'TColor', iptrw);
      RegisterProperty('HintPause', 'Integer', iptrw);
      RegisterProperty('HintShortPause', 'Integer', iptrw);
      RegisterProperty('HintHidePause', 'Integer', iptrw);
      RegisterProperty('Icon', 'TIcon', iptrw);
      RegisterProperty('OnHelp', 'THelpEvent', iptrw);
      RegisterProperty('OnMessage', 'TMessageEvent', iptrw);
    {$ENDIF}
  end;
end;

{$IFNDEF PS_MINIVCL}
{ TScreen -------------------------------------------------------------------- }
procedure SIRegisterTSCREEN(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TComponent', 'TScreen') do
  with Cl.AddClassN(Cl.FindClass('TComponent'), 'TScreen') do
  begin
    //RegisterMethod('procedure DisableAlign');
    //RegisterMethod('procedure EnableAlign');
    //RegisterMethod('function MonitorFromPoint(const Point: TPoint; MonitorDefault: TMonitorDefaultTo): TMonitor');
    //RegisterMethod('function MonitorFromRect(const Rect: TRect; MonitorDefault: TMonitorDefaultTo): TMonitor');
    //RegisterMethod('function MonitorFromWindow(const Handle: THandle; MonitorDefault: TMonitorDefaultTo): TMonitor');
    //RegisterMethod('procedure Realign');
    //RegisterMethod('procedure ResetFonts');
    RegisterProperty('ActiveControl', 'TWinControl', iptr);
    //RegisterProperty('ActiveCustomForm', 'TCustomForm', iptr);
    RegisterProperty('ActiveForm', 'TForm', iptr);
    //RegisterProperty('CustomFormCount', 'Integer', iptr);
    //RegisterProperty('CustomForms', 'TCustomForm Integer', iptr);
    //RegisterProperty('CursorCount', 'Integer', iptr);
    RegisterProperty('Cursor', 'TCursor', iptrw);
    RegisterProperty('Cursors', 'HCURSOR Integer', iptrw);
    //RegisterProperty('DataModules', 'TDataModule Integer', iptr);
    //RegisterProperty('DataModuleCount', 'Integer', iptr);
    //RegisterProperty('FocusedForm', 'TCustomForm', iptrw);
    //RegisterProperty('SaveFocusedList', 'TList', iptr);
    //RegisterProperty('MonitorCount', 'Integer', iptr);
    //RegisterProperty('Monitors', 'TMonitor Integer', iptr);
    //RegisterProperty('DesktopRect', 'TRect', iptr);
    //RegisterProperty('DesktopHeight', 'Integer', iptr);
    //RegisterProperty('DesktopLeft', 'Integer', iptr);
    //RegisterProperty('DesktopTop', 'Integer', iptr);
    //RegisterProperty('DesktopWidth', 'Integer', iptr);
    //RegisterProperty('WorkAreaRect', 'TRect', iptr);
    //RegisterProperty('WorkAreaHeight', 'Integer', iptr);
    //RegisterProperty('WorkAreaLeft', 'Integer', iptr);
    //RegisterProperty('WorkAreaTop', 'Integer', iptr);
    //RegisterProperty('WorkAreaWidth', 'Integer', iptr);
    //RegisterProperty('HintFont', 'TFont', iptrw);
    //RegisterProperty('IconFont', 'TFont', iptrw);
    //RegisterProperty('MenuFont', 'TFont', iptrw);
    //RegisterProperty('MessageFont', 'TFont', iptrw);
    //RegisterProperty('CaptionFont', 'TFont', iptrw);
    RegisterProperty('Fonts', 'TStrings', iptr);
    RegisterProperty('FormCount', 'Integer', iptr);
    RegisterProperty('Forms', 'TForm Integer', iptr);
    //RegisterProperty('Imes', 'TStrings', iptr);
    //RegisterProperty('DefaultIme', 'string', iptr);
    //RegisterProperty('DefaultKbLayout', 'HKL', iptr);
    RegisterProperty('Height', 'Integer', iptr);
    RegisterProperty('PixelsPerInch', 'Integer', iptr);
    //RegisterProperty('PrimaryMonitor', 'TMonitor', iptr);
    RegisterProperty('Width', 'Integer', iptr);
    RegisterProperty('OnActiveControlChange', 'TNotifyEvent', iptrw);
    RegisterProperty('OnActiveFormChange', 'TNotifyEvent', iptrw);
    //RegisterProperty('UpdatingAllFonts', 'Boolean', iptr);
  end;
end;
{$ENDIF}

{ Types And Consts ----------------------------------------------------------- }
procedure SIRegister_Forms_TypesAndConsts(Cl: TPSPascalCompiler);
begin
  {$IFNDEF PS_MINIVCL}
    //Cl.AddType('TMsg', btRecord); // don't work
    Cl.AddTypeS('TMsg', 'record hwnd: HWND; message: LongWord; wParam: LongInt; lParam: LongInt; time: LongWord; pt: TPoint; end');
    Cl.AddTypeS('TMessageEvent', 'procedure (var Msg: TMsg; var Handled: Boolean)');

    { TScreen }
    Cl.AddTypes('HCURSOR', 'Cardinal');
    //Cl.AddTypeS('PCursorRec', '^TCursorRec // will not work');
    //Cl.AddTypeS('TCursorRec', 'record Next: PCursorRec; Index: Integer; Handle: Cardinal; end');
    //Cl.AddTypeS('TCursorRecType', 'PCursorRec');
    //Cl.AddTypeS('TMonitorDefaultTo', '(mdNearest, mdNull, mdPrimary)');
  {$ENDIF}
  Cl.AddTypeS('TIdleEvent', 'procedure (Sender: TObject; var Done: Boolean)');
  Cl.AddTypeS('TScrollBarKind', '(sbHorizontal, sbVertical)');
  Cl.AddTypeS('TScrollBarInc', 'SmallInt');
  Cl.AddTypeS('TFormBorderStyle', '(bsNone, bsSingle, bsSizeable, bsDialog, bsToolWindow, bsSizeToolWin)');
  Cl.AddTypeS('TBorderStyle', 'TFormBorderStyle');
  Cl.AddTypeS('TWindowState', '(wsNormal, wsMinimized, wsMaximized)');
  Cl.AddTypeS('TFormStyle', '(fsNormal, fsMDIChild, fsMDIForm, fsStayOnTop)');
  Cl.AddTypeS('TPosition', '(poDesigned, poDefault, poDefaultPosOnly, poDefaultSizeOnly, poScreenCenter, poDesktopCenter, poMainFormCenter, poOwnerFormCenter)');
  Cl.AddTypeS('TPrintScale', '(poNone, poProportional, poPrintToFit)');
  Cl.AddTypeS('TShowAction', '(saIgnore, saRestore, saMinimize, saMaximize)');
  Cl.AddTypeS('TTileMode', '(tbHorizontal, tbVertical)');
  Cl.AddTypeS('TCloseAction', '(caNone, caHide, caFree, caMinimize)');
  Cl.AddTypeS('TCloseEvent', 'procedure(Sender: TObject; var Action: TCloseAction)');
  Cl.AddTypeS('TCloseQueryEvent', 'procedure(Sender: TObject; var CanClose: Boolean)');
  Cl.AddTypeS('TBorderIcon', '(biSystemMenu, biMinimize, biMaximize, biHelp)');
  Cl.AddTypeS('TBorderIcons', 'set of TBorderIcon');
  Cl.AddTypeS('TFormStates', '(fsCreating, fsVisible, fsShowing, fsModal, fsCreatedMDIChild)');
  Cl.AddTypeS('TFormState', 'set of TFormStates');
  Cl.AddTypeS('THelpContext', 'LongInt');
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_Forms(Cl: TPSPascalCompiler);
begin
  SIRegister_Forms_TypesAndConsts(Cl);

  {$IFNDEF PS_MINIVCL}
    SIRegisterTCONTROLSCROLLBAR(Cl);
  {$ENDIF}
  SIRegisterTSCROLLINGWINCONTROL(Cl);
  {$IFNDEF PS_MINIVCL}
    SIRegisterTSCROLLBOX(Cl);
    SIRegisterTCUSTOMFORM(Cl);
  {$ENDIF}
  SIRegisterTFORM(Cl);
  {$IFNDEF PS_MINIVCL}
    SIRegisterTSCREEN(Cl);
    SIRegisterTAPPLICATION(Cl);
  {$ENDIF}
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)
end.
