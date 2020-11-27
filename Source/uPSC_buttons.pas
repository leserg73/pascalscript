{ Compiletime Buttons support }
unit uPSC_buttons;
{$I PascalScript.inc}
interface
uses
  uPSCompiler, uPSUtils;

{
  Will register files from:
    Buttons
 
  Requires
      STD, classes, controls and graphics and StdCtrls and Buttons
}
procedure SIRegister_Buttons_TypesAndConsts(Cl: TPSPascalCompiler);

procedure SIRegisterTSPEEDBUTTON(Cl: TPSPascalCompiler);
procedure SIRegisterTBITBTN(Cl: TPSPascalCompiler);

procedure SIRegister_Buttons(Cl: TPSPascalCompiler);

implementation

procedure SIRegisterTSPEEDBUTTON(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TGraphicControl'), 'TSpeedButton') do
  begin
    RegisterMethod('constructor Create(AOwner: TComponent)'); //
//    RegisterMethod('procedure Click');
//    RegisterMethod('procedure DefocusControl(Control: TWinControl; Removing: Boolean)');
//    RegisterMethod('procedure FocusControl(Control: TWinControl)');
//    RegisterMethod('function SetFocusedControl(Control: TWinControl): Boolean');
    RegisterProperty('AllowAllUp', 'Boolean', iptrw);
    {$IFDEF DELPHI4UP}
    RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('GroupIndex', 'Integer', iptrw);
    RegisterProperty('Down', 'Boolean', iptrw);
    RegisterProperty('Caption', 'string', iptrw);
    RegisterProperty('Enabled', 'Boolean', iptrw);
    RegisterProperty('Flat', 'Boolean', iptrw);
//    RegisterProperty('FocusControl', 'TWinControl', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('Glyph', 'TBitmap', iptrw);
    RegisterProperty('Layout', 'TButtonLayout', iptrw);
    RegisterProperty('Margin', 'Integer', iptrw);
    RegisterProperty('NumGlyphs', 'Byte', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('ParentShowHint', 'Boolean', iptrw);
    RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
    RegisterProperty('ShowHint', 'Boolean', iptrw);
    RegisterProperty('Spacing', 'Integer', iptrw);
    RegisterProperty('Transparent', 'Boolean', iptrw);
    RegisterProperty('Visible', 'Boolean', iptrw);
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDblClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
    RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
    RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
    RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
  end;
end;

procedure SIRegisterTBITBTN(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCustomButton'), 'TBitBtn') do
  begin
    RegisterMethod('constructor Create(AOwner: TComponent)'); //
//    RegisterMethod('procedure Click');  
    {$IFDEF DELPHI4UP}
    RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('Cancel', 'Boolean', iptrw);
    RegisterProperty('Caption', 'string', iptrw);
    RegisterProperty('Default', 'Boolean', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('ModalResult', 'LongInt', iptrw);

    RegisterProperty('Glyph', 'TBitmap', iptrw);
    RegisterProperty('Kind', 'TBitBtnKind', iptrw);
    RegisterProperty('Layout', 'TButtonLayout', iptrw);
    RegisterProperty('Margin', 'Integer', iptrw);
    RegisterProperty('NumGlyphs', 'Byte', iptrw);
    RegisterProperty('Style', 'TButtonStyle', iptrw);
    RegisterProperty('Spacing', 'Integer', iptrw);

    RegisterProperty('DragCursor', 'LongInt', iptrw);
    RegisterProperty('DragMode', 'TDragMode', iptrw);
    RegisterProperty('ParentShowHint', 'Boolean', iptrw);
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
    RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
    RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
    RegisterProperty('OnKeyDown', 'TKeyEvent', iptrw);
    RegisterProperty('OnKeyPress', 'TKeyPressEvent', iptrw);
    RegisterProperty('OnKeyUp', 'TKeyEvent', iptrw);
    RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
    RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
    RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
    RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
    RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);

  end;
end;



procedure SIRegister_Buttons_TypesAndConsts(cl: TPSPascalCompiler);
begin
  { TSpeedButton }
  cl.AddTypeS('TButtonLayout', '(blGlyphLeft, blGlyphRight, blGlyphTop, blGlyphBottom)');
  cl.AddTypeS('TButtonState', '(bsUp, bsDisabled, bsDown, bsExclusive)');
  { TBitBtn }
//  cl.AddTypeS('TModalResult', '(mrNone, mrOk, mrCancel, mrAbort, mrRetry, mrIgnore, mrYes, mrNo, mrClose, mrHelp, mrTryAgain, mrContinue, mrAll, mrNoToAll, mrYesToAll)');
  cl.AddTypeS('TButtonStyle', '(bsAutoDetect, bsWin31, bsNew)');
//  cl.AddTypeS('TButtonStyle', '(bsPushButton, bsCommandLink, bsSplitButton)');
  cl.AddTypeS('TBitBtnKind', '(bkCustom, bkOK, bkCancel, bkHelp, bkYes, bkNo, bkClose, bkAbort, bkRetry, bkIgnore, bkAll)');
end;

procedure SIRegister_Buttons(Cl: TPSPascalCompiler);
begin
  SIRegister_Buttons_TypesAndConsts(cl);
  SIRegisterTSPEEDBUTTON(Cl);
  SIRegisterTBITBTN(Cl);
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)


end.




