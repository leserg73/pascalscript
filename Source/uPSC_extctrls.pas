{ Compiletime Extctrls support }
unit uPSC_extctrls;

{$I PascalScript.inc}

interface

uses
  uPSCompiler, uPSUtils;

(*
  Will register files from:
    ExtCtrls
 
  Requires:
    STD, classes, controls, graphics {$IFNDEF PS_MINIVCL}, stdctrls {$ENDIF}
*)

procedure SIRegister_ExtCtrls_TypesAndConsts(Cl: TPSPascalCompiler);

procedure SIRegisterTSHAPE(Cl: TPSPascalCompiler);
procedure SIRegisterTIMAGE(Cl: TPSPascalCompiler);
procedure SIRegisterTPAINTBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTBEVEL(Cl: TPSPascalCompiler);
procedure SIRegisterTTIMER(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMPANEL(Cl: TPSPascalCompiler);
procedure SIRegisterTPANEL(Cl: TPSPascalCompiler);
{$IFNDEF CLX}
  procedure SIRegisterTPAGE(Cl: TPSPascalCompiler);
  procedure SIRegisterTNOTEBOOK(Cl: TPSPascalCompiler);
  procedure SIRegisterTHEADER(Cl: TPSPascalCompiler);
{$ENDIF}
procedure SIRegisterTCUSTOMRADIOGROUP(Cl: TPSPascalCompiler);
procedure SIRegisterTRADIOGROUP(Cl: TPSPascalCompiler);
{$IFNDEF PS_MINIVCL}
  procedure SIRegister_TColorBox(Cl: TPSPascalCompiler);
  procedure SIRegister_TCustomColorBox(Cl: TPSPascalCompiler);
{$ENDIF}

procedure SIRegister_ExtCtrls(Cl: TPSPascalCompiler);

implementation

{ TShape --------------------------------------------------------------------- }
procedure SIRegisterTSHAPE(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TGraphicControl'), 'TShape') do
  begin
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('Brush', 'TBrush', iptrw);
    RegisterProperty('Pen', 'TPen', iptrw);
    RegisterProperty('Shape', 'TShapeType', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterMethod('procedure StyleChanged(Sender: TObject)');
      RegisterProperty('DragCursor', 'LongInt', iptrw);
      RegisterProperty('DragMode', 'TDragMode', iptrw);
      RegisterProperty('ParentShowHint', 'Boolean', iptrw);
      RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
      RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
      RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
      RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
      RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
      RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
      RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
      RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
      RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    {$ENDIF}
  end;
end;

{ TImage --------------------------------------------------------------------- }
procedure SIRegisterTIMAGE(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TGraphicControl'), 'TImage') do
  begin
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('Canvas', 'TCanvas', iptr);
    RegisterProperty('AutoSize', 'Boolean', iptrw);
    RegisterProperty('Center', 'Boolean', iptrw);
    RegisterProperty('Picture', 'TPicture', iptrw);
    RegisterProperty('Stretch', 'Boolean', iptrw);
    RegisterProperty('Transparent', 'Boolean', iptrw);
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDblClick', 'TNotifyEvent', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterProperty('DragCursor', 'LongInt', iptrw);
      RegisterProperty('DragMode', 'TDragMode', iptrw);
      RegisterProperty('ParentShowHint', 'Boolean', iptrw);
      RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
      RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
      RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
      RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
      RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
      RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
      RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
      RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
      RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
      RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    {$ENDIF}
  end;
end;

{ TPaintBox ------------------------------------------------------------------ }
procedure SIRegisterTPAINTBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TGraphicControl'), 'TPaintBox') do
  begin
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('Canvas', 'TCanvas', iptr);
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('ParentColor', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDblClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnPaint', 'TNotifyEvent', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterProperty('DragCursor', 'LongInt', iptrw);
      RegisterProperty('DragMode', 'TDragMode', iptrw);
      RegisterProperty('ParentShowHint', 'Boolean', iptrw);
      RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
      RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
      RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
      RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
      RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
      RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
      RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
      RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
      RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
      RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    {$ENDIF}
  end;
end;

{ TBevel --------------------------------------------------------------------- }
procedure SIRegisterTBEVEL(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TGraphicControl'), 'TBevel') do
  begin
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('Shape', 'TBevelShape', iptrw);
    RegisterProperty('Style', 'TBevelStyle', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterProperty('ParentShowHint', 'Boolean', iptrw);
    {$ENDIF}
  end;
end;

{ TTimer --------------------------------------------------------------------- }
procedure SIRegisterTTIMER(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TComponent'), 'TTimer') do
  begin
    RegisterProperty('Enabled', 'Boolean', iptrw);
    RegisterProperty('Interval', 'Cardinal', iptrw);
    RegisterProperty('OnTimer', 'TNotifyEvent', iptrw);
  end;
end;

{ TCustomPanel --------------------------------------------------------------- }
procedure SIRegisterTCUSTOMPANEL(Cl: TPSPascalCompiler);
begin
  Cl.AddClassN(Cl.FindClass('TCustomControl'), 'TCustomPanel');
end;

{ TPanel --------------------------------------------------------------------- }
procedure SIRegisterTPANEL(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomPanel'), 'TPanel') do
  begin
    RegisterProperty('Alignment', 'TAlignment', iptrw);
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('BevelInner', 'TPanelBevel', iptrw);
    RegisterProperty('BevelOuter', 'TPanelBevel', iptrw);
    {$IFDEF DELPHI2009UP}
      RegisterProperty('BevelKind', 'TBevelKind', iptrw);
    {$ENDIF}
    RegisterProperty('BevelWidth', 'TBevelWidth', iptrw);
    RegisterProperty('BorderWidth', 'TBorderWidth', iptrw);
    RegisterProperty('BorderStyle', 'TBorderStyle', iptrw);
    RegisterProperty('Caption', 'string', iptrw);
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('ParentColor', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDblClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterProperty('DragCursor', 'LongInt', iptrw);
      RegisterProperty('DragMode', 'TDragMode', iptrw);
      RegisterProperty('CTL3D', 'Boolean', iptrw);
      RegisterProperty('Locked', 'Boolean', iptrw);
      RegisterProperty('ParentCtl3D', 'Boolean', iptrw);
      RegisterProperty('ParentShowHint', 'Boolean', iptrw);
      RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
      RegisterProperty('StyleElements', 'TStyleElements', iptrw);
      RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
      RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
      RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
      RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
      RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
      RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
      RegisterProperty('OnResize', 'TNotifyEvent', iptrw);
      RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
      RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
      RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    {$ENDIF}
  end;
end;

{$IFNDEF CLX}
{ TPage ---------------------------------------------------------------------- }
procedure SIRegisterTPAGE(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomControl'), 'TPage') do
  begin
    RegisterProperty('Caption', 'string', iptrw);
  end;
end;

{ TNotebook ------------------------------------------------------------------ }
procedure SIRegisterTNOTEBOOK(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomControl'), 'TNotebook') do
  begin
    RegisterProperty('ActivePage', 'string', iptrw);
    {$IFDEF DELPHI4UP}
    RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('PageIndex', 'Integer', iptrw);
    RegisterProperty('Pages', 'TStrings', iptrw);
    RegisterProperty('ParentColor', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDblClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    RegisterProperty('OnPageChanged', 'TNotifyEvent', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterProperty('CTL3D', 'Boolean', iptrw);
      RegisterProperty('DragCursor', 'LongInt', iptrw);
      RegisterProperty('DragMode', 'TDragMode', iptrw);
      RegisterProperty('ParentCtl3D', 'Boolean', iptrw);
      RegisterProperty('ParentShowHint', 'Boolean', iptrw);
      RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
      RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
      RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
      RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
      RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
      RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
      RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
      RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
      RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
      RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    {$ENDIF}
  end;
end;

{ THeader -------------------------------------------------------------------- }
procedure SIRegisterTHEADER(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomControl'), 'THeader') do
  begin
    RegisterProperty('SectionWidth', 'Integer Integer', iptrw);
    RegisterProperty('AllowResize', 'Boolean', iptrw);
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('BorderStyle', 'TBorderStyle', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('Sections', 'TStrings', iptrw);
    RegisterProperty('OnSizing', 'TSectionEvent', iptrw);
    RegisterProperty('OnSized', 'TSectionEvent', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterProperty('ParentShowHint', 'Boolean', iptrw);
      RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
    {$ENDIF}
  end;
end;
{$ENDIF}

{ TCustomRadioGroup ---------------------------------------------------------- }
procedure SIRegisterTCUSTOMRADIOGROUP(Cl: TPSPascalCompiler);
begin
  Cl.AddClassN(Cl.FindClass('TCustomGroupBox'), 'TCustomRadioGroup');
end;

{ TRadioGroup ---------------------------------------------------------------- }
procedure SIRegisterTRADIOGROUP(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomRadioGroup'), 'TRadioGroup') do
  begin
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('Caption', 'string', iptrw);
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Columns', 'Integer', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('ItemIndex', 'Integer', iptrw);
    RegisterProperty('Items', 'TStrings', iptrw);
    RegisterProperty('ParentColor', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterProperty('CTL3D', 'Boolean', iptrw);
      RegisterProperty('DragCursor', 'LongInt', iptrw);
      RegisterProperty('DragMode', 'TDragMode', iptrw);
      RegisterProperty('ParentCtl3D', 'Boolean', iptrw);
      RegisterProperty('ParentShowHint', 'Boolean', iptrw);
      RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
      RegisterProperty('StyleElements', 'TStyleElements', iptrw);
      RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
      RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
      RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
      RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
    {$ENDIF}
  end;
end;

{$IFNDEF PS_MINIVCL}
{ TColorBox ------------------------------------------------------------------ }
procedure SIRegister_TColorBox(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TCustomColorBox', 'TColorBox') do
  with Cl.AddClassN(Cl.FindClass('TCustomColorBox'),'TColorBox') do
  begin
    { Properties }
    RegisterProperty('Align', 'TAlign', iptrw);
    RegisterProperty('AutoComplete', 'Boolean', iptrw);
    RegisterProperty('AutoDropDown', 'Boolean', iptrw);
    RegisterProperty('DefaultColorColor', 'TColor', iptrw);
    RegisterProperty('NoneColorColor', 'TColor', iptrw);
    RegisterProperty('Selected', 'TColor', iptrw);
    RegisterProperty('Style', 'TColorBoxStyle', iptrw);
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('BevelEdges', 'TBevelEdges', iptrw);
    RegisterProperty('BevelInner', 'TBevelCut', iptrw);
    RegisterProperty('BevelKind', 'TBevelKind', iptrw);
    RegisterProperty('BevelOuter', 'TBevelCut', iptrw);
    RegisterProperty('BiDiMode', 'TBiDiMode', iptrw);
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Constraints', 'TSizeConstraints', iptrw);
    RegisterProperty('CTL3D', 'Boolean', iptrw);
    RegisterProperty('DoubleBuffered', 'Boolean', iptrw);
    RegisterProperty('DropDownCount', 'Integer', iptrw);
    RegisterProperty('Enabled', 'Boolean', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('ItemHeight', 'Integer', iptrw);
    RegisterProperty('ParentBiDiMode', 'Boolean', iptrw);
    RegisterProperty('ParentColor', 'Boolean', iptrw);
    RegisterProperty('ParentCtl3D', 'Boolean', iptrw);
    RegisterProperty('ParentDoubleBuffered', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('ParentShowHint', 'Boolean', iptrw);
    RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
    RegisterProperty('ShowHint', 'Boolean', iptrw);
    RegisterProperty('TabOrder', 'Integer', iptrw);
    RegisterProperty('TabStop', 'Boolean', iptrw);
    //property Touch;
    RegisterProperty('Visible', 'Boolean', iptrw);
    RegisterProperty('StyleElements', 'TStyleElements', iptrw);
    { Events }
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
    RegisterProperty('OnCloseUp', 'TscButtonCloseUpEvent', iptrw);
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    //property OnContextPopup;
    RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
    RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
    RegisterProperty('OnDropDown', 'TNotifyEvent', iptrw);
    //property OnEndDock;
    RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    //property OnGesture;
    RegisterProperty('OnGetColors', 'TGetColorsEvent', iptrw);
    RegisterProperty('OnKeyDown', 'TKeyEvent', iptrw);
    RegisterProperty('OnKeyPress', 'TKeyPressEvent', iptrw);
    RegisterProperty('OnKeyUp', 'TKeyEvent', iptrw);
    RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    RegisterProperty('OnSelect', 'TNotifyEvent', iptrw);
    //property OnStartDock;
    RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
  end;
end;

{ TCustomColorBox ------------------------------------------------------------ }
procedure SIRegister_TCustomColorBox(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TCustomComboBox', 'TCustomColorBox') do
  with Cl.AddClassN(Cl.FindClass('TCustomComboBox'),'TCustomColorBox') do
  begin
  Cl.AddTypeS('TGetColorsEvent', 'procedure(Sender: TCustomColorBox; Items: TStrings)');
    RegisterProperty('Style', 'TColorBoxStyle', iptrw);
    RegisterProperty('Colors', 'TColor Integer', iptr);
    RegisterProperty('ColorNames', 'string Integer', iptr);
    RegisterProperty('Selected', 'TColor', iptrw);
    RegisterProperty('DefaultColorColor', 'TColor', iptrw);
    RegisterProperty('NoneColorColor', 'TColor', iptrw);
    RegisterProperty('OnGetColors', 'TGetColorsEvent', iptrw);
  end;
end;
{$ENDIF}

{ Types And Consts ----------------------------------------------------------- }
procedure SIRegister_ExtCtrls_TypesAndConsts(Cl: TPSPascalCompiler);
begin
  Cl.AddTypeS('TShapeType', '(stRectangle, stSquare, stRoundRect, stRoundSquare, stEllipse, stCircle)');
  Cl.AddTypeS('TBevelStyle', '(bsLowered, bsRaised)');
  Cl.AddTypeS('TBevelShape', '(bsBox, bsFrame, bsTopLine, bsBottomLine, bsLeftLine, bsRightLine, bsSpacer)');
  //Cl.AddTypeS('TPanelBevel', '(bvNone, bvLowered, bvRaised, bvSpace)');
  Cl.AddTypeS('TPanelBevel', 'TBevelCut');
  //Cl.addTypeS('BevelOuter', 'set of TPanelBevel');
  //Cl.addTypeS('BevelInner', 'set of TPanelBevel');
  //Cl.AddTypeS('TBevelWidth', 'LongInt');
  //Cl.AddTypeS('TBorderWidth', 'LongInt');
  Cl.AddTypeS('TSectionEvent', 'procedure(Sender: TObject; ASection, AWidth: Integer)');
  {$IFNDEF PS_MINIVCL}
    Cl.AddTypeS('TColorBoxStyles', '(cbStandardColors, cbExtendedColors, cbSystemColors, cbIncludeNone, cbIncludeDefault, cbCustomColor, cbPrettyNames, cbCustomColors)');
    Cl.AddTypeS('TColorBoxStyle', 'set of TColorBoxStyles');
    //Cl.AddTypeS('TGetColorsEvent', 'procedure(Sender: TCustomColorBox; Items: TStrings)');
  {$ENDIF}
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_ExtCtrls(Cl: TPSPascalCompiler);
begin
  SIRegister_ExtCtrls_TypesAndConsts(Cl);
  {$IFNDEF PS_MINIVCL}
    SIRegisterTSHAPE(Cl);
    SIRegisterTIMAGE(Cl);
    SIRegisterTPAINTBOX(Cl);
  {$ENDIF}
  SIRegisterTBEVEL(Cl);
  {$IFNDEF PS_MINIVCL}
    SIRegisterTTIMER(Cl);
  {$ENDIF}
  SIRegisterTCUSTOMPANEL(Cl);
  SIRegisterTPANEL(Cl);
  {$IFNDEF PS_MINIVCL}
    {$IFNDEF CLX}
      SIRegisterTPAGE(Cl);
      SIRegisterTNOTEBOOK(Cl);
      SIRegisterTHEADER(Cl);
    {$ENDIF}
    SIRegisterTCUSTOMRADIOGROUP(Cl);
    SIRegisterTRADIOGROUP(Cl);
    SIRegister_TCustomColorBox(Cl);
    SIRegister_TColorBox(Cl);
  {$ENDIF}
end;

end.
