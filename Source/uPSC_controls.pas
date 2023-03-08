{ Compiletime Controls support }
unit uPSC_controls;

{$I PascalScript.inc}

interface

uses
  uPSCompiler, uPSUtils;

{

  Will register files from:
    Controls
 
  Register the STD, Classes (at least the types&consts) and Graphics libraries first
 
}

procedure SIRegister_Controls_TypesAndConsts(Cl: TPSPascalCompiler);

procedure SIRegisterTControl(Cl: TPSPascalCompiler);
procedure SIRegisterTWinControl(Cl: TPSPascalCompiler); 
procedure SIRegisterTGraphicControl(Cl: TPSPascalCompiler); 
procedure SIRegisterTCustomControl(Cl: TPSPascalCompiler); 
procedure SIRegisterTDragObject(Cl: TPSPascalCompiler);
{$IFDEF DELPHI4UP}
  procedure SIRegisterTSizeConstraints(Cl: TPSPascalCompiler);
{$ENDIF}
{$IFNDEF PS_MINIVCL}
  procedure SIRegister_TImageList(Cl: TPSPascalCompiler);
  procedure SIRegister_TCustomImageList(Cl: TPSPascalCompiler);
  procedure SIRegister_THintWindow(Cl: TPSPascalCompiler);
  procedure SIRegister_TBalloonHint(Cl: TPSPascalCompiler);
  procedure SIRegister_TCustomHint(Cl: TPSPascalCompiler);
  procedure SIRegister_TCustomHintShowHideThread(Cl: TPSPascalCompiler);
  procedure SIRegister_TCustomHintWindow(Cl: TPSPascalCompiler);
  procedure SIRegister_TPadding(Cl: TPSPascalCompiler);
  procedure SIRegister_TMargins(Cl: TPSPascalCompiler);
{$ENDIF}

procedure SIRegister_Controls(Cl: TPSPascalCompiler);

implementation

{ TControl ------------------------------------------------------------------- }
procedure SIRegisterTControl(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TComponent'), 'TControl') do
  begin
    RegisterMethod('constructor Create(AOwner: TComponent);');
    RegisterMethod('procedure BringToFront;');
    RegisterMethod('procedure Hide;');
    RegisterMethod('procedure Invalidate; virtual;');
    RegisterMethod('procedure Refresh;');
    RegisterMethod('procedure Repaint; virtual;');
    RegisterMethod('procedure SendToBack;');
    RegisterMethod('procedure Show;');
    RegisterMethod('procedure Update; virtual;');
    RegisterMethod('procedure SetBounds(X,Y,w,h: Integer); virtual;');
    RegisterProperty('Left', 'Integer', iptrw);
    RegisterProperty('Top', 'Integer', iptrw);
    RegisterProperty('Width', 'Integer', iptrw);
    RegisterProperty('Height', 'Integer', iptrw);
    RegisterProperty('Hint', 'string', iptrw);
    RegisterProperty('Align', 'TAlign', iptrw);
    RegisterProperty('ClientHeight', 'LongInt', iptrw);
    RegisterProperty('ClientWidth', 'LongInt', iptrw);
    RegisterProperty('ShowHint', 'Boolean', iptrw);
    RegisterProperty('Visible', 'Boolean', iptrw);
    RegisterProperty('Enabled', 'Boolean', iptrw);
    RegisterProperty('Cursor', 'TCursor', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterMethod('function Dragging: Boolean;');
      RegisterMethod('function HasParent: Boolean');
      RegisterMethod('procedure BeginDrag(Immediate: Boolean)');
      RegisterMethod('function ClientToScreen(Point: TPoint): TPoint');
      RegisterMethod('procedure EndDrag(Drop: Boolean)');
      {$IFNDEF CLX}
        RegisterMethod('function GetTextBuf(Buffer: PChar; BufSize: Integer): Integer');
        RegisterMethod('function GetTextLen: Integer');
        RegisterMethod('procedure SetTextBuf(Buffer: PChar)');
        RegisterMethod('function Perform(Msg: Cardinal; WPARAM,LPARAM: LongInt): LongInt');
      {$ENDIF}
      RegisterMethod('function ScreenToClient(Point: TPoint): TPoint');
      RegisterProperty('ClientRect', 'TRect', iptr);
      RegisterProperty('CustomHint', 'TCustomHint', iptrw);
      RegisterProperty('BoundsRect', 'TRect', iptrw);
      RegisterProperty('Margins', 'TMargins', iptrw);
    {$ENDIF}
  end;
end;

{ TWinControl ---------------------------------------------------------------- }
procedure SIRegisterTWinControl(Cl: TPSPascalCompiler); // requires TControl
begin
  with Cl.AddClassN(Cl.FindClass('TControl'), 'TWinControl') do
  begin
    with Cl.FindClass('TControl') do
    begin
      RegisterProperty('Parent', 'TWinControl', iptrw);
    end;
    {$IFNDEF CLX}
      RegisterProperty('Handle', 'LongInt', iptr);
    {$ENDIF}
    RegisterProperty('Showing', 'Boolean', iptr);
    RegisterProperty('TabOrder', 'Integer', iptrw);
    RegisterProperty('TabStop', 'Boolean', iptrw);
    RegisterMethod('function CanFocus: Boolean');
    RegisterMethod('function Focused: Boolean');
    RegisterProperty('Controls', 'TControl Integer', iptr);
    RegisterProperty('ControlCount', 'Integer', iptr);
    {$IFNDEF PS_MINIVCL}
      RegisterMethod('function HandleAllocated: Boolean;');
      RegisterMethod('procedure HandleNeeded;');
      RegisterMethod('procedure EnableAlign;');
      RegisterMethod('procedure RemoveControl(AControl: TControl);');
      RegisterMethod('procedure InsertControl(AControl: TControl);');
      RegisterMethod('procedure Realign;');
      RegisterMethod('procedure ScaleBy(M, D: Integer);');
      RegisterMethod('procedure ScrollBy(DeltaX, DeltaY: Integer);');
      RegisterMethod('procedure SetFocus; virtual;');
      {$IFNDEF CLX}
        RegisterMethod('procedure PaintTo(DC: LongInt; X,Y: Integer)');
      {$ENDIF}
      RegisterMethod('function ContainsControl(Control: TControl): Boolean');
      RegisterMethod('procedure DisableAlign');
      RegisterMethod('procedure UpdateControlState');
      RegisterProperty('Brush', 'TBrush', iptr);
      RegisterProperty('HelpContext', 'LongInt', iptrw);
      RegisterProperty('DoubleBuffered', 'Boolean', iptrw);
      RegisterProperty('ParentDoubleBuffered', 'Boolean', iptrw);
      RegisterProperty('Padding', 'TPadding', iptrw);
    {$ENDIF}
  end;
end;

{ TGraphicControl ------------------------------------------------------------ }
procedure SIRegisterTGraphicControl(Cl: TPSPascalCompiler); // requires TControl
begin
  Cl.AddClassN(Cl.FindClass('TControl'), 'TGraphicControl');
end;

{ TCustomControl ------------------------------------------------------------- }
procedure SIRegisterTCustomControl(Cl: TPSPascalCompiler); // requires TWinControl
begin
  Cl.AddClassN(Cl.FindClass('TWinControl'), 'TCustomControl');
end;

{ TDragObject ---------------------------------------------------------------- }
procedure SIRegisterTDragObject(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TObject'),'TDragObject') do
  begin
  {$IFNDEF PS_MINIVCL}
    {$IFDEF DELPHI4UP}
      RegisterMethod('procedure Assign(Source: TDragObject)');
    {$ENDIF}
    {$IFNDEF FPC}
      RegisterMethod('function GetName: string');
      RegisterMethod('function Instance: LongInt');
    {$ENDIF}
    RegisterMethod('procedure HideDragImage');
    RegisterMethod('procedure ShowDragImage');
    {$IFDEF DELPHI4UP}
      RegisterProperty('Cancelling', 'Boolean', iptrw);
      RegisterProperty('DragHandle', 'LongInt', iptrw);
      RegisterProperty('DragPos', 'TPoint', iptrw);
      RegisterProperty('DragTargetPos', 'TPoint', iptrw);
      RegisterProperty('MouseDeltaX', 'Double', iptr);
      RegisterProperty('MouseDeltaY', 'Double', iptr);
    {$ENDIF}
  {$ENDIF}
  end;
  Cl.AddTypeS('TStartDragEvent', 'procedure (Sender: TObject; var DragObject: TDragObject)');
end;

{$IFDEF DELPHI4UP}
{ TSizeConstraints ----------------------------------------------------------- }
procedure SIRegisterTSizeConstraints(Cl: TPSPascalCompiler);
begin
  Cl.AddTypeS('TConstraintSize', 'Integer');
  with Cl.AddClassN(Cl.FindClass('TPersistent'),'TSizeConstraints') do
  begin
    RegisterProperty('MaxHeight', 'TConstraintSize', iptrw);
    RegisterProperty('MaxWidth', 'TConstraintSize', iptrw);
    RegisterProperty('MinHeight', 'TConstraintSize', iptrw);
    RegisterProperty('MinWidth', 'TConstraintSize', iptrw);
  end;
end;
{$ENDIF}

{$IFNDEF PS_MINIVCL}
{ TCustomImageList ----------------------------------------------------------- }
procedure SIRegister_TCustomImageList(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TComponent'),'TCustomImageList') do
  begin
    RegisterMethod('constructor CreateSize(AWidth, AHeight: Integer)');
    RegisterMethod('function Add(Image, Mask: TBitmap): Integer');
    RegisterMethod('function AddIcon(Image: TIcon): Integer');
    RegisterMethod('procedure AddImages(Value: TCustomImageList)');
    RegisterMethod('function AddMasked(Image: TBitmap; MaskColor: TColor): Integer');
    //RegisterMethod('function BeginDrag(Window: HWND; X, Y: Integer): Boolean');
    RegisterMethod('procedure Clear');
    RegisterMethod('procedure Delete(Index: Integer)');
    //RegisterMethod('function DragLock(Window: HWND; XPos, YPos: Integer): Boolean');
    //RegisterMethod('function DragMove(X, Y: Integer): Boolean');
    //RegisterMethod('procedure DragUnlock');
    RegisterMethod('procedure Draw(Canvas: TCanvas; X, Y, Index: Integer)');
    RegisterMethod('procedure DrawOverlay(Canvas: TCanvas; X, Y: Integer; ImageIndex: Integer; Overlay: TOverlay)');
    //RegisterMethod('function EndDrag: Boolean');
    RegisterMethod('function FileLoad(ResType: TResType; Name: string; MaskColor: TColor): Boolean');
    RegisterMethod('procedure GetBitmap(Index: Integer; Image: TBitmap)');
    RegisterMethod('function GetHotSpot: TPoint');
    RegisterMethod('procedure GetIcon(Index: Integer; Image: TIcon)');
    RegisterMethod('function GetImageBitmap: HBITMAP');
    RegisterMethod('function GetMaskBitmap: HBITMAP');
    RegisterMethod('function GetResource(ResType: TResType; Name: string; Width: Integer; LoadFlags: TLoadResources; MaskColor: TColor): Boolean');
    RegisterMethod('function GetInstRes(Instance: THandle; ResType: TResType; Name: string; Width: Integer; LoadFlags: TLoadResources; MaskColor: TColor): Boolean');
    RegisterMethod('function HandleAllocated: Boolean');
    //RegisterMethod('procedure HideDragImage');
    RegisterMethod('procedure Insert(Index: Integer; Image, Mask: TBitmap)');
    RegisterMethod('procedure InsertIcon(Index: Integer; Image: TIcon)');
    RegisterMethod('procedure InsertMasked(Index: Integer; Image: TBitmap; MaskColor: TColor)');
    RegisterMethod('procedure Move(CurIndex, NewIndex: Integer)');
    RegisterMethod('function Overlay(ImageIndex: Integer; Overlay: TOverlay): Boolean');
    RegisterMethod('procedure RegisterChanges(Value: TChangeLink)');
    RegisterMethod('function ResourceLoad(ResType: TResType; Name: string; MaskColor: TColor): Boolean');
    RegisterMethod('function ResInstLoad(Instance: THandle; ResType: TResType; Name: string; MaskColor: TColor): Boolean');
    RegisterMethod('procedure Replace(Index: Integer; Image, Mask: TBitmap)');
    RegisterMethod('procedure ReplaceIcon(Index: Integer; Image: TIcon)');
    RegisterMethod('procedure ReplaceMasked(Index: Integer; NewImage: TBitmap; MaskColor: TColor)');
    //RegisterMethod('function SetDragImage(Index, HotSpotX, HotSpotY: Integer): Boolean');
    //RegisterMethod('procedure ShowDragImage');
    RegisterMethod('procedure UnRegisterChanges(Value: TChangeLink)');
    RegisterProperty('Count', 'Integer', iptr);
    //RegisterProperty('DragCursor', 'TCursor', iptrw);
    //RegisterProperty('Dragging', 'Boolean', iptr);
    RegisterProperty('ColorDepth', 'TColorDepth', iptrw);
    RegisterProperty('Handle', 'LongInt', iptrw);
    RegisterProperty('Scaling', 'Boolean', iptr);
    RegisterProperty('AllocBy', 'Integer', iptrw);
    RegisterProperty('BlendColor', 'TColor', iptrw);
    RegisterProperty('GrayscaleFactor', 'Byte', iptrw);
    RegisterProperty('BkColor', 'TColor', iptrw);
    RegisterProperty('DrawingStyle', 'TDrawingStyle', iptrw);
    RegisterProperty('Height', 'Integer', iptrw);
    RegisterProperty('ImageType', 'TImageType', iptrw);
    RegisterProperty('Masked', 'Boolean', iptrw);
    RegisterProperty('ShareImages', 'Boolean', iptrw);
    RegisterProperty('Width', 'Integer', iptrw);
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
  end;
end;

{ TImageList ----------------------------------------------------------------- }
procedure SIRegister_TImageList(Cl: TPSPascalCompiler);
begin
  Cl.AddClassN(Cl.FindClass('TCustomImageList'),'TImageList');
end;

{ TBalloonHint --------------------------------------------------------------- }
procedure SIRegister_TBalloonHint(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TCustomHint', 'TBalloonHint') do
  with Cl.AddClassN(Cl.FindClass('TCustomHint'),'TBalloonHint') do
  begin
  end;
end;

{ TCustomHint ---------------------------------------------------------------- }
procedure SIRegister_TCustomHint(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TComponent', 'TCustomHint') do
  with Cl.AddClassN(Cl.FindClass('TComponent'),'TCustomHint') do
  begin
    //RegisterMethod('procedure ShowHint;');
    RegisterMethod('procedure ShowHint(Point: TPoint);');
    //RegisterMethod('procedure ShowHint(Rect: TRect);');
    //RegisterMethod('procedure ShowHint(Control: TControl);');
    RegisterMethod('procedure HideHint;');
    //RegisterMethod('procedure HideHint(HidingControl: TControl);');
    RegisterMethod('procedure PaintHint(HintWindow: TCustomHintWindow)');
    RegisterMethod('procedure NCPaintHint(HintWindow: TCustomHintWindow; DC: HDC)');
    RegisterMethod('procedure SetHintSize(HintWindow: TCustomHintWindow)');
    RegisterProperty('ShowingHint', 'Boolean', iptr);
    RegisterProperty('Title', 'string', iptrw);
    RegisterProperty('Description', 'string', iptrw);
    RegisterProperty('ImageIndex', 'TImageIndex', iptrw);
    RegisterProperty('Images', 'TImageList', iptrw);
    RegisterProperty('Style', 'TBalloonHintStyle', iptrw);
    RegisterProperty('Delay', 'Cardinal', iptrw);
    RegisterProperty('HideAfter', 'Integer', iptrw);
  end;
end;

{ TCustomHintShowHideThread -------------------------------------------------- }
procedure SIRegister_TCustomHintShowHideThread(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TThread', 'TCustomHintShowHideThread') do
  with Cl.AddClassN(Cl.FindClass('TThread'),'TCustomHintShowHideThread') do
  begin
    RegisterMethod('constructor Create(Hint: TCustomHintWindow; HintObject: TCustomHint);');
    RegisterMethod('procedure ResumeWork');
    RegisterMethod('procedure HideHint');
  end;
end;

{ TCustomHintWindow ---------------------------------------------------------- }
procedure SIRegister_TCustomHintWindow(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TCustomControl', 'TCustomHintWindow') do
  with Cl.AddClassN(Cl.FindClass('TCustomControl'),'TCustomHintWindow') do
  begin
    RegisterMethod('procedure AutoSize');
    RegisterMethod('procedure PositionAt(Point: TPoint);');
    //RegisterMethod('procedure PositionAt(Rect: TRect);');
    RegisterMethod('procedure PositionAtCursor');
    RegisterProperty('HintParent', 'TCustomHint', iptrw);
    RegisterProperty('PopAbove', 'Boolean', iptr);
    RegisterProperty('Title', 'string', iptr);
    RegisterProperty('Description', 'string', iptr);
    RegisterProperty('ImageIndex', 'TImageIndex', iptr);
  end;
end;

{ THintWindow ---------------------------------------------------------------- }
procedure SIRegister_THintWindow(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TCustomControl', 'THintWindow') do
  with Cl.AddClassN(Cl.FindClass('TCustomControl'),'THintWindow') do
  begin
    RegisterMethod('procedure ActivateHint(Rect: TRect; const AHint: string)');
    RegisterMethod('function IsHintMsg(var Msg: TMsg): Boolean');
    RegisterMethod('function ShouldHideHint: Boolean');
    RegisterMethod('procedure ReleaseHandle');
    RegisterMethod('procedure ActivateHintData(Rect: TRect; const AHint: string; AData: TCustomData)');
    RegisterMethod('function CalcHintRect(MaxWidth: Integer; const AHint: string; AData: TCustomData): TRect');
    RegisterProperty('BiDiMode', 'TBiDiMode', iptrw);
    RegisterProperty('Caption', 'string', iptrw);
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Canvas', 'TCanvas', iptr);
    RegisterProperty('Font', 'TFont', iptrw);
  end;
end;

{ TPadding ------------------------------------------------------------------- }
procedure SIRegister_TPadding(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TMargins', 'TPadding') do
  with Cl.AddClassN(Cl.FindClass('TMargins'),'TPadding') do
  begin
  end;
end;

{ TMargins ------------------------------------------------------------------- }
procedure SIRegister_TMargins(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TPersistent', 'TMargins') do
  with Cl.AddClassN(Cl.FindClass('TPersistent'),'TMargins') do
  begin
    RegisterMethod('constructor Create(Control: TControl)');
    //RegisterMethod('procedure SetControlBounds(ALeft, ATop, AWidth, AHeight: Integer; Aligning: Boolean);');
    RegisterMethod('procedure SetControlBounds(const ARect: TRect; Aligning: Boolean);');
    RegisterMethod('procedure SetBounds(ALeft, ATop, ARight, ABottom: Integer)');
    RegisterProperty('ControlLeft', 'Integer', iptr);
    RegisterProperty('ControlTop', 'Integer', iptr);
    RegisterProperty('ControlWidth', 'Integer', iptr);
    RegisterProperty('ControlHeight', 'Integer', iptr);
    RegisterProperty('ExplicitLeft', 'Integer', iptr);
    RegisterProperty('ExplicitTop', 'Integer', iptr);
    RegisterProperty('ExplicitWidth', 'Integer', iptr);
    RegisterProperty('ExplicitHeight', 'Integer', iptr);
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
    RegisterProperty('Left', 'TMarginSize', iptrw);
    RegisterProperty('Top', 'TMarginSize', iptrw);
    RegisterProperty('Right', 'TMarginSize', iptrw);
    RegisterProperty('Bottom', 'TMarginSize', iptrw);
  end;
end;
{$ENDIF}

{ Types And Consts ----------------------------------------------------------- }
procedure SIRegister_Controls_TypesAndConsts(Cl: TPSPascalCompiler);
begin
  {$IFNDEF FPC}
    Cl.addTypeS('TEShiftState','(ssShift, ssAlt, ssCtrl, ssLeft, ssRight, ssMiddle, ssDouble)');
  {$ELSE}
    Cl.addTypeS('TEShiftState','(ssShift, ssAlt, ssCtrl, ssLeft, ssRight, ssMiddle, ssDouble,' +
    'ssMeta, ssSuper, ssHyper, ssAltGr, ssCaps, ssNum,ssScroll,ssTriple,ssQuad)');
  {$ENDIF}
  Cl.addTypeS('TShiftState','set of TEShiftState');
  Cl.AddTypeS('TMouseButton', '(mbLeft, mbRight, mbMiddle)');
  Cl.AddTypeS('TDragMode', '(dmManual, dmAutomatic)');
  Cl.AddTypeS('TDragState', '(dsDragEnter, dsDragLeave, dsDragMove)');
  Cl.AddTypeS('TDragKind', '(dkDrag, dkDock)');
  Cl.AddTypeS('TMouseEvent', 'procedure (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);');
  Cl.AddTypeS('TMouseMoveEvent', 'procedure(Sender: TObject; Shift: TShiftState; X, Y: Integer);');
  Cl.AddTypeS('TKeyEvent', 'procedure (Sender: TObject; var Key: Word; Shift: TShiftState);');
  Cl.AddTypeS('TKeyPressEvent', 'procedure(Sender: TObject; var Key: Char);');
  Cl.AddTypeS('TDragOverEvent', 'procedure(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean)');
  Cl.AddTypeS('TDragDropEvent', 'procedure(Sender, Source: TObject; X, Y: Integer)');
  Cl.AddTypeS('HWND', 'LongInt');
  //Cl.AddTypeS('HDC', 'LongInt');

  Cl.AddTypeS('TEndDragEvent', 'procedure(Sender, Target: TObject; X, Y: Integer)');

  Cl.addTypeS('TAlign', '(alNone, alTop, alBottom, alLeft, alRight, alClient)');

  {$IFDEF DELPHI4UP}
    Cl.addTypeS('TAnchorKind', '(akLeft, akTop, akRight, akBottom)');
    Cl.addTypeS('TAnchors','set of TAnchorKind');
  {$ENDIF}
  Cl.AddTypeS('TModalResult', 'Integer');
  Cl.AddTypeS('TCursor', 'Integer');
  Cl.AddTypeS('TPoint', 'record X,Y: LongInt; end;');

  Cl.AddConstantN('mrNone', 'Integer').Value.ts32 := 0;
  Cl.AddConstantN('mrOk', 'Integer').Value.ts32 := 1;
  Cl.AddConstantN('mrCancel', 'Integer').Value.ts32 := 2;
  Cl.AddConstantN('mrAbort', 'Integer').Value.ts32 := 3;
  Cl.AddConstantN('mrRetry', 'Integer').Value.ts32 := 4;
  Cl.AddConstantN('mrIgnore', 'Integer').Value.ts32 := 5;
  Cl.AddConstantN('mrYes', 'Integer').Value.ts32 := 6;
  Cl.AddConstantN('mrNo', 'Integer').Value.ts32 := 7;
  Cl.AddConstantN('mrAll', 'Integer').Value.ts32 := 8;
  Cl.AddConstantN('mrNoToAll', 'Integer').Value.ts32 := 9;
  Cl.AddConstantN('mrYesToAll', 'Integer').Value.ts32 := 10;
  Cl.AddConstantN('crDefault', 'Integer').Value.ts32 := 0;
  Cl.AddConstantN('crNone', 'Integer').Value.ts32 := -1;
  Cl.AddConstantN('crArrow', 'Integer').Value.ts32 := -2;
  Cl.AddConstantN('crCross', 'Integer').Value.ts32 := -3;
  Cl.AddConstantN('crIBeam', 'Integer').Value.ts32 := -4;
  Cl.AddConstantN('crSizeNESW', 'Integer').Value.ts32 := -6;
  Cl.AddConstantN('crSizeNS', 'Integer').Value.ts32 := -7;
  Cl.AddConstantN('crSizeNWSE', 'Integer').Value.ts32 := -8;
  Cl.AddConstantN('crSizeWE', 'Integer').Value.ts32 := -9;
  Cl.AddConstantN('crUpArrow', 'Integer').Value.ts32 := -10;
  Cl.AddConstantN('crHourGlass', 'Integer').Value.ts32 := -11;
  Cl.AddConstantN('crDrag', 'Integer').Value.ts32 := -12;
  Cl.AddConstantN('crNoDrop', 'Integer').Value.ts32 := -13;
  Cl.AddConstantN('crHSplit', 'Integer').Value.ts32 := -14;
  Cl.AddConstantN('crVSplit', 'Integer').Value.ts32 := -15;
  Cl.AddConstantN('crMultiDrag', 'Integer').Value.ts32 := -16;
  Cl.AddConstantN('crSQLWait', 'Integer').Value.ts32 := -17;
  Cl.AddConstantN('crNo', 'Integer').Value.ts32 := -18;
  Cl.AddConstantN('crAppStart', 'Integer').Value.ts32 := -19;
  Cl.AddConstantN('crHelp', 'Integer').Value.ts32 := -20;
  {$IFDEF DELPHI3UP}
    Cl.AddConstantN('crHandPoint', 'Integer').Value.ts32 := -21;
  {$ENDIF}
  {$IFDEF DELPHI4UP}
    Cl.AddConstantN('crSizeAll', 'Integer').Value.ts32 := -22;
  {$ENDIF}
  {$IFDEF DELPHI2009UP}
    Cl.AddTypeS('TBevelCut', '(bvNone, bvLowered, bvRaised, bvSpace)');
    Cl.AddTypeS('TBevelEdge', '(beLeft, beTop, beRight, beBottom)');
    Cl.AddTypeS('TBevelEdges', 'set of TBevelEdge');
    Cl.AddTypeS('TBevelKind', '(bkNone, bkTile, bkSoft, bkFlat)');
    Cl.addTypeS('BevelOuter', 'set of TBevelCut');
    Cl.addTypeS('BevelInner', 'set of TBevelCut');
    Cl.AddTypeS('TBevelWidth', 'LongInt');
    Cl.AddTypeS('TBorderWidth', 'LongInt');
    //Cl.AddTypeS('TSortType', '(stNone, stData, stText, stBoth)');
    //Cl.AddTypeS('TMultiSelectStyles', '(msControlSelect, msShiftSelect, msVisibleOnly, msSiblingOnly)');
    //Cl.AddTypeS('TMultiSelectStyle', 'set of TMultiSelectStyles');
  {$ENDIF}
  {$IFNDEF PS_MINIVCL}
    { Types }
    Cl.AddTypeS('HRGN', 'LongWord');
    Cl.AddTypeS('TBlendFunction', 'record BlendOp: Byte; BlendFlags: Byte; SourceConstantAlpha: Byte; AlphaFormat: Byte; end;');
    Cl.AddTypeS('TSize', 'record CX,CY: LongInt; end;');
    Cl.AddTypeS('TSmallPoint', 'record X,Y: SmallInt; end;');
    { TMargin }
    Cl.AddTypeS('TMarginSize', 'Integer');
    { TImageList }
    Cl.AddTypeS('TDrawingStyle', '(dsFocus, dsSelected, dsNormal, dsTransparent)');
    Cl.AddTypeS('TImageType', '(itImage, itMask)');
    Cl.AddTypeS('TResType', '(rtBitmap, rtCursor, rtIcon)');
    Cl.AddTypeS('TOverlay', 'Integer');
    Cl.AddTypeS('TLoadResource', '(lrDefaultColor, lrDefaultSize, lrFromFile, lrMap3DColors, lrTransparent, lrMonoChrome)');
    Cl.AddTypeS('TLoadResources', 'set of TLoadResource');
    Cl.AddTypeS('TColorDepth', '(cdDefault, cdDeviceDependent, cd4Bit, cd8Bit, cd16Bit, cd24Bit, cd32Bit)');
    Cl.AddTypeS('TImageIndex', 'Integer');
    { Hint }
    Cl.AddTypeS('TBalloonHintIcon', '(bhInfo, bhWarning, bhError)');
    Cl.AddTypeS('TBalloonHintIconSize', '(bhsNormal, bhsLarge, bhsSmall)');
    Cl.AddTypeS('TBalloonHintStyle', '(bhsStandard, bhsBalloon)');
  {$ENDIF}
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_Controls(Cl: TPSPascalCompiler);
begin
  SIRegister_Controls_TypesAndConsts(Cl);
  SIRegisterTDragObject(Cl);
  {$IFDEF DELPHI4UP}
    SIRegisterTSizeConstraints(Cl);
  {$ENDIF}
  {$IFNDEF PS_MINIVCL}
    SIRegister_TMargins(Cl);
    SIRegister_TPadding(Cl);
  {$ENDIF}
  SIRegisterTControl(Cl);
  SIRegisterTWinControl(Cl);
  SIRegisterTGraphicControl(Cl);
  SIRegisterTCustomControl(Cl);
  {$IFNDEF PS_MINIVCL}
    SIRegister_THintWindow(Cl);
    SIRegister_TCustomImageList(Cl);
    SIRegister_TImageList(Cl);
    SIRegister_TCustomHintWindow(Cl);
    SIRegister_TCustomHintShowHideThread(Cl);
    SIRegister_TCustomHint(Cl);
    SIRegister_TBalloonHint(Cl);
  {$ENDIF}
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)
end.
