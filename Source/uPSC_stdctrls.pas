{ Compiletime STDCtrls support }
unit uPSC_stdctrls;

{$I PascalScript.inc}

interface

uses
  uPSCompiler, uPSUtils;

{
  Will register files from:
    stdctrls
 
  Requires:
    STD, classes, controls and graphics

}

procedure SIRegister_StdCtrls_TypesAndConsts(Cl: TPSPascalCompiler);

procedure SIRegisterTCUSTOMGROUPBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTGROUPBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMLABEL(Cl: TPSPascalCompiler);
procedure SIRegisterTLABEL(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMEDIT(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMMASKEDIT(Cl: TPSPascalCompiler);
procedure SIRegisterTEDIT(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMMEMO(Cl: TPSPascalCompiler);
procedure SIRegisterTMEMO(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMCOMBOBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTCOMBOBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTBUTTONCONTROL(Cl: TPSPascalCompiler);
{$IFNDEF PS_MINIVCL}
  procedure SIRegisterTIMAGEMARGINS(Cl: TPSPascalCompiler);
  procedure SIRegisterTCUSTOMBUTTON(Cl: TPSPascalCompiler);
{$ENDIF}
procedure SIRegisterTBUTTON(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMCHECKBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTCHECKBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTRADIOBUTTON(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMLISTBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTLISTBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTSCROLLBAR(Cl: TPSPascalCompiler);

{ ComCtrls }
{$IFNDEF PS_MINIVCL}
  procedure SIRegisterTTRACKBAR(Cl: TPSPascalCompiler);
  procedure SIRegisterTCUSTOMUPDOWN(Cl: TPSPascalCompiler);
  procedure SIRegisterTUPDOWN(Cl: TPSPascalCompiler);
  procedure SIRegisterTCUSTOMHOTKEY(Cl: TPSPascalCompiler);
  procedure SIRegisterTHOTKEY(Cl: TPSPascalCompiler);
  procedure SIRegisterTSTATUSBAR(Cl: TPSPascalCompiler);
  procedure SIRegisterTSTATUSPANELS(Cl: TPSPascalCompiler);
  procedure SIRegisterTSTATUSPANEL(Cl: TPSPascalCompiler);
  procedure SIRegister_TCustomListView(Cl: TPSPascalCompiler);
  procedure SIRegisterTICONOPTIONS(Cl: TPSPascalCompiler);
  procedure SIRegisterTLISTITEMS(Cl: TPSPascalCompiler);
  procedure SIRegisterTLISTITEM(Cl: TPSPascalCompiler);
  procedure SIRegisterTLISTCOLUMNS(Cl: TPSPascalCompiler);
  procedure SIRegisterTLISTCOLUMN(Cl: TPSPascalCompiler);
  procedure SIRegister_TCustomTreeView(Cl: TPSPascalCompiler);
  procedure SIRegister_TTreeNodes(Cl: TPSPascalCompiler);
  procedure SIRegister_TTreeNode(Cl: TPSPascalCompiler);
  procedure SIRegister_THeaderControl(Cl: TPSPascalCompiler);
  procedure SIRegister_THeaderSections(Cl: TPSPascalCompiler);
  procedure SIRegister_THeaderSection(Cl: TPSPascalCompiler);
  procedure SIRegister_TPageControl(Cl: TPSPascalCompiler);
  procedure SIRegister_TTabSheet(Cl: TPSPascalCompiler);
  procedure SIRegister_TTabControl(Cl: TPSPascalCompiler);
  procedure SIRegister_TCustomTabControl(Cl: TPSPascalCompiler);
  procedure SIRegisterTLISTVIEW(Cl: TPSPascalCompiler);
  procedure SIRegisterTTSTATUSBAR(Cl: TPSPascalCompiler);
  procedure SIRegisterTTREEVIEW(Cl: TPSPascalCompiler);
  procedure SIRegisterTTAB(Cl: TPSPascalCompiler);
  procedure SIRegisterTHEADERCONTROL(Cl: TPSPascalCompiler);
  { Date&Time }
  procedure SIRegister_TDateTimePicker(Cl: TPSPascalCompiler);
  procedure SIRegister_TMonthCalendar(Cl: TPSPascalCompiler);
  procedure SIRegister_TCommonCalendar(Cl: TPSPascalCompiler);
  procedure SIRegister_TMonthCalColors(Cl: TPSPascalCompiler);
{$ENDIF}

procedure SIRegister_StdCtrls(Cl: TPSPascalCompiler);

implementation

{ TCustomGroupBox ------------------------------------------------------------ }
procedure SIRegisterTCUSTOMGROUPBOX(Cl: TPSPascalCompiler);
begin
  Cl.AddClassN(Cl.FindClass('TCustomControl'), 'TCustomGroupBox');
end;

{ TGroupBox ------------------------------------------------------------------ }
procedure SIRegisterTGROUPBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomGroupBox'), 'TGroupBox') do
  begin
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
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
      RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
      RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
      RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
      RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
      RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
      RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    {$ENDIF}
  end;
end;

{ TCustomLabel --------------------------------------------------------------- }
procedure SIRegisterTCUSTOMLABEL(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TGraphicControl'), 'TCustomLabel') do
  begin
    {$IFNDEF PS_MINIVCL}
      {$IFNDEF CLX}
        RegisterProperty('Canvas', 'TCanvas', iptr);
      {$ENDIF}
    {$ENDIF}
  end;
end;

{ TLabel --------------------------------------------------------------------- }
procedure SIRegisterTLABEL(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomLabel'), 'TLabel') do
  begin
    RegisterProperty('Alignment', 'TAlignment', iptrw);
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('AutoSize', 'Boolean', iptrw);
    RegisterProperty('Caption', 'string', iptrw);
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('DragCursor', 'LongInt', iptrw);
    RegisterProperty('DragMode', 'TDragMode', iptrw);
    RegisterProperty('FocusControl', 'TWinControl', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('Layout', 'TTextLayout', iptrw);
    RegisterProperty('ParentColor', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('ParentShowHint', 'Boolean', iptrw);
    RegisterProperty('ShowAccelChar', 'Boolean', iptrw);
    RegisterProperty('Transparent', 'Boolean', iptrw);
    RegisterProperty('WordWrap', 'Boolean', iptrw);
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDblClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
    RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
    RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
    RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
    RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
    RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
    RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterProperty('StyleElements', 'TStyleElements', iptrw);
      RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
      RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    {$ENDIF}
  end;
end;

{ TCustomEdit ---------------------------------------------------------------- }
procedure SIRegisterTCUSTOMEDIT(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TWinControl'), 'TCustomEdit') do
  begin
    RegisterMethod('procedure Clear');
    RegisterMethod('procedure ClearSelection');
    RegisterMethod('procedure SelectAll');
    RegisterProperty('Modified', 'Boolean', iptrw);
    RegisterProperty('SelLength', 'Integer', iptrw);
    RegisterProperty('SelStart', 'Integer', iptrw);
    RegisterProperty('SelText', 'string', iptrw);
    RegisterProperty('Text', 'string', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterMethod('procedure CopyToClipboard');
      RegisterMethod('procedure CutToClipboard');
      RegisterMethod('procedure PasteFromClipboard');
      RegisterMethod('function GetSelTextBuf(Buffer: PChar; BufSize: Integer): Integer');
      RegisterMethod('procedure SetSelTextBuf(Buffer: PChar)');
    {$ENDIF}
  end;
end;

{ TCustomMaskEdit ------------------------------------------------------------ }
procedure SIRegisterTCUSTOMMASKEDIT(Cl: TPSPascalCompiler);
begin
  Cl.AddTypeS('TMaskedState', '(msMasked, msReEnter, msDBSetText)');
  with Cl.AddClassN(Cl.FindClass('TCustomEdit'),'TCustomMaskEdit') do
  begin
    RegisterMethod('constructor Create(AOwner: TComponent)');
    RegisterMethod('procedure ValidateEdit');
    RegisterMethod('function GetTextLen: Integer');
    RegisterProperty('IsMasked', 'Boolean', iptr);
    RegisterProperty('EditText', 'string', iptrw);
    RegisterProperty('Text', 'TMaskedText', iptrw);
  end;
end;

{ TEdit ---------------------------------------------------------------------- }
procedure SIRegisterTEDIT(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomEdit'), 'TEdit') do
  begin
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('AutoSelect', 'Boolean', iptrw);
    RegisterProperty('AutoSize', 'Boolean', iptrw);
    RegisterProperty('BorderStyle', 'TBorderStyle', iptrw);
    RegisterProperty('CharCase', 'TEditCharCase', iptrw);
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('HideSelection', 'Boolean', iptrw);
    RegisterProperty('MaxLength', 'Integer', iptrw);
    RegisterProperty('ParentColor', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('PasswordChar', 'Char', iptrw);
    RegisterProperty('ReadOnly', 'Boolean', iptrw);
    RegisterProperty('Text', 'string', iptrw);
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDblClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    RegisterProperty('OnKeyDown', 'TKeyEvent', iptrw);
    RegisterProperty('OnKeyPress', 'TKeyPressEvent', iptrw);
    RegisterProperty('OnKeyUp', 'TKeyEvent', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterProperty('CTL3D', 'Boolean', iptrw);
      RegisterProperty('DragCursor', 'LongInt', iptrw);
      RegisterProperty('DragMode', 'TDragMode', iptrw);
      RegisterProperty('OEMConvert', 'Boolean', iptrw);
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
      RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
      RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
      RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    {$ENDIF}
  end;
end;

{ TCustomMemo ---------------------------------------------------------------- }
procedure SIRegisterTCUSTOMMEMO(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomEdit'), 'TCustomMemo') do
  begin
    {$IFNDEF CLX}
      RegisterProperty('Lines', 'TStrings', iptrw);
    {$ENDIF}
  end;
end;

{ TMemo ---------------------------------------------------------------------- }
procedure SIRegisterTMEMO(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomMemo'), 'TMemo') do
  begin
    {$IFDEF CLX}
      RegisterProperty('Lines', 'TStrings', iptrw);
    {$ENDIF}
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('Alignment', 'TAlignment', iptrw);
    RegisterProperty('BorderStyle', 'TBorderStyle', iptrw);
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('HideSelection', 'Boolean', iptrw);
    RegisterProperty('MaxLength', 'Integer', iptrw);
    RegisterProperty('ParentColor', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('ReadOnly', 'Boolean', iptrw);
    RegisterProperty('ScrollBars', 'TScrollStyle', iptrw);
    RegisterProperty('WantReturns', 'Boolean', iptrw);
    RegisterProperty('WantTabs', 'Boolean', iptrw);
    RegisterProperty('WordWrap', 'Boolean', iptrw);
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDblClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    RegisterProperty('OnKeyDown', 'TKeyEvent', iptrw);
    RegisterProperty('OnKeyPress', 'TKeyPressEvent', iptrw);
    RegisterProperty('OnKeyUp', 'TKeyEvent', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterProperty('CTL3D', 'Boolean', iptrw);
      RegisterProperty('DragCursor', 'LongInt', iptrw);
      RegisterProperty('DragMode', 'TDragMode', iptrw);
      RegisterProperty('OEMConvert', 'Boolean', iptrw);
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
      RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
      RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
      RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    {$ENDIF}
  end;
end;

{ TCustomComboBox ------------------------------------------------------------ }
procedure SIRegisterTCUSTOMCOMBOBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TWinControl'), 'TCustomComboBox') do
  begin
    RegisterProperty('DroppedDown', 'Boolean', iptrw);
    RegisterProperty('Items', 'TStrings', iptrw);
    RegisterProperty('ItemIndex', 'Integer', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterMethod('procedure Clear');
      RegisterMethod('procedure SelectAll');
      RegisterProperty('Canvas', 'TCanvas', iptr);
      RegisterProperty('SelLength', 'Integer', iptrw);
      RegisterProperty('SelStart', 'Integer', iptrw);
      RegisterProperty('SelText', 'string', iptrw);
    {$ENDIF}
  end;
end;

{ TComboBox ------------------------------------------------------------------ }
procedure SIRegisterTCOMBOBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomComboBox'), 'TComboBox') do
  begin
    RegisterProperty('Style', 'TComboBoxStyle', iptrw);
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('DropDownCount', 'Integer', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('MaxLength', 'Integer', iptrw);
    RegisterProperty('ParentColor', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('Sorted', 'Boolean', iptrw);
    RegisterProperty('Text', 'string', iptrw);
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDblClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDropDown', 'TNotifyEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    RegisterProperty('OnKeyDown', 'TKeyEvent', iptrw);
    RegisterProperty('OnKeyPress', 'TKeyPressEvent', iptrw);
    RegisterProperty('OnKeyUp', 'TKeyEvent', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterProperty('CTL3D', 'Boolean', iptrw);
      RegisterProperty('DragMode', 'TDragMode', iptrw);
      RegisterProperty('DragCursor', 'LongInt', iptrw);
      RegisterProperty('ItemHeight', 'Integer', iptrw);
      RegisterProperty('ParentCtl3D', 'Boolean', iptrw);
      RegisterProperty('ParentShowHint', 'Boolean', iptrw);
      RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
      RegisterProperty('StyleElements', 'TStyleElements', iptrw);
      RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
      RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
      RegisterProperty('OnDrawItem', 'TDrawItemEvent', iptrw);
      RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
      RegisterProperty('OnMeasureItem', 'TMeasureItemEvent', iptrw);
      RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
    {$ENDIF}
  end;
end;

{ TButtonControl ------------------------------------------------------------- }
procedure SIRegisterTBUTTONCONTROL(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TWinControl'), 'TButtonControl') do
  begin
    RegisterMethod('constructor Create(AOwner: TComponent)'); //
  end;
end;


{$IFNDEF PS_MINIVCL}
{ TCustomButton -------------------------------------------------------------- }
procedure SIRegisterTCUSTOMBUTTON(Cl: TPSPascalCompiler);
begin
  //Cl.AddTypeS('TButtonStyle', '(bsPushButton, bsCommandLink, bsSplitButton)');
  with Cl.AddClassN(Cl.FindClass('TButtonControl'), 'TCustomButton') do
  begin
    RegisterMethod('constructor Create(AOwner: TComponent)'); //
    RegisterMethod('procedure Click');
    RegisterProperty('Cancel', 'Boolean', iptrw);
    RegisterProperty('CommandLinkHint', 'string', iptrw);
    RegisterProperty('Default', 'Boolean', iptrw);
    RegisterProperty('DisabledImageIndex', 'TImageIndex', iptrw);
    RegisterProperty('DropDownMenu', 'TPopupMenu', iptrw);
    RegisterProperty('ElevationRequired', 'Boolean', iptrw);
    RegisterProperty('HotImageIndex', 'TImageIndex', iptrw);
    RegisterProperty('Images', 'TCustomImageList', iptrw);
    RegisterProperty('ImageAlignment', 'TImageAlignment', iptrw);
    RegisterProperty('ImageIndex', 'TImageIndex', iptrw);
    RegisterProperty('ImageMargins', 'TImageMargins', iptrw);
    RegisterProperty('ModalResult', 'TModalResult', iptrw);
    RegisterProperty('PressedImageIndex', 'TImageIndex', iptrw);
    RegisterProperty('SelectedImageIndex', 'TImageIndex', iptrw);
    //RegisterProperty('Style', 'TButtonStyles', iptrw);
    RegisterProperty('StylusHotImageIndex', 'TImageIndex', iptrw);
    RegisterProperty('OnDropDownClick', 'TNotifyEvent', iptrw);
  end;
end;

{ TImageMargins -------------------------------------------------------------- }
procedure SIRegisterTIMAGEMARGINS(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TPersistent', 'TImageMargins') do
  with Cl.AddClassN(Cl.FindClass('TPersistent'),'TImageMargins') do
  begin
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
    RegisterProperty('Left', 'Integer', iptrw);
    RegisterProperty('Top', 'Integer', iptrw);
    RegisterProperty('Right', 'Integer', iptrw);
    RegisterProperty('Bottom', 'Integer', iptrw);
  end;
end;
{$ENDIF}

{ TButton -------------------------------------------------------------------- }
procedure SIRegisterTBUTTON(Cl: TPSPascalCompiler);
begin
{$IFNDEF PS_MINIVCL}
  with Cl.AddClassN(Cl.FindClass('TCustomButton'),'TButton') do
{$ELSE}
  with Cl.AddClassN(Cl.FindClass('TButtonControl'),'TButton') do
{$ENDIF}
  begin
    {$IFNDEF PS_MINIVCL}
      RegisterMethod('procedure Click');
    {$ENDIF}

    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}

    RegisterProperty('Cancel', 'Boolean', iptrw);
    RegisterProperty('Caption', 'string', iptrw);
    RegisterProperty('Default', 'Boolean', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('ModalResult', 'LongInt', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterProperty('Align', 'TAlign', iptrw);
      RegisterProperty('BiDiMode', 'TBiDiMode', iptrw);
      RegisterProperty('Constraints', 'TSizeConstraints', iptrw);
      RegisterProperty('DoubleBuffered', 'Boolean', iptrw);
      RegisterProperty('Enabled', 'Boolean', iptrw);
      RegisterProperty('ParentBiDiMode', 'Boolean', iptrw);
      RegisterProperty('ParentDoubleBuffered', 'Boolean', iptrw);
      RegisterProperty('ShowHint', 'Boolean', iptrw);
      RegisterProperty('TabOrder', 'Integer', iptrw);

      // Properties from TCustomButton -------------------------------------------
      RegisterProperty('CommandLinkHint', 'string', iptrw);
      RegisterProperty('DisabledImageIndex', 'TImageIndex', iptrw);
      RegisterProperty('DropDownMenu', 'TPopupMenu', iptrw);
      RegisterProperty('ElevationRequired', 'Boolean', iptrw);
      RegisterProperty('HotImageIndex', 'TImageIndex', iptrw);
      RegisterProperty('ImageAlignment', 'TImageAlignment', iptrw);
      RegisterProperty('ImageIndex', 'TImageIndex', iptrw);
      RegisterProperty('ImageMargins', 'TImageMargins', iptrw);
      RegisterProperty('Images', 'TCustomImageList', iptrw);
      RegisterProperty('PressedImageIndex', 'TImageIndex', iptrw);
      RegisterProperty('SelectedImageIndex', 'TImageIndex', iptrw);
      //RegisterProperty('Style', 'TButtonStyle', iptrw);
      RegisterProperty('StylusHotImageIndex', 'TImageIndex', iptrw);
      RegisterProperty('OnDropDownClick', 'TNotifyEvent', iptrw);
      // -------------------------------------------------------------------------

      RegisterProperty('TabStop', 'Boolean', iptrw);
      RegisterProperty('Visible', 'Boolean', iptrw);
      RegisterProperty('WordWrap', 'Boolean', iptrw);
      RegisterProperty('DragCursor', 'LongInt', iptrw);
      RegisterProperty('DragMode', 'TDragMode', iptrw);
      RegisterProperty('ParentShowHint', 'Boolean', iptrw);
      RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
      RegisterProperty('StyleElements', 'TStyleElements', iptrw);
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
    {$ENDIF}
  end;
end;

{ TCustomCheckBox ------------------------------------------------------------ }
procedure SIRegisterTCUSTOMCHECKBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TButtonControl'), 'TCustomCheckBox') do
  begin
  end;
end;

{ TCheckBox ------------------------------------------------------------------ }
procedure SIRegisterTCHECKBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomCheckBox'), 'TCheckBox') do
  begin
    RegisterProperty('Alignment', 'TAlignment', iptrw);
    RegisterProperty('AllowGrayed', 'Boolean', iptrw);
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('Caption', 'string', iptrw);
    RegisterProperty('Checked', 'Boolean', iptrw);
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('ParentColor', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('State', 'TCheckBoxState', iptrw);
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
      RegisterProperty('OnKeyDown', 'TKeyEvent', iptrw);
      RegisterProperty('OnKeyPress', 'TKeyPressEvent', iptrw);
      RegisterProperty('OnKeyUp', 'TKeyEvent', iptrw);
      RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
      RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
      RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
      RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
      RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
      RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    {$ENDIF}
  end;
end;

{ TRadioButton --------------------------------------------------------------- }
procedure SIRegisterTRADIOBUTTON(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TButtonControl'), 'TRadioButton') do
  begin
    RegisterProperty('Alignment', 'TAlignment', iptrw);
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('Caption', 'string', iptrw);
    RegisterProperty('Checked', 'Boolean', iptrw);
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('ParentColor', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDblClick', 'TNotifyEvent', iptrw);
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
      RegisterProperty('OnKeyDown', 'TKeyEvent', iptrw);
      RegisterProperty('OnKeyPress', 'TKeyPressEvent', iptrw);
      RegisterProperty('OnKeyUp', 'TKeyEvent', iptrw);
      RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
      RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
      RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
      RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
      RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
      RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    {$ENDIF}
  end;
end;

{ TCustomListBox ------------------------------------------------------------- }
procedure SIRegisterTCUSTOMLISTBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TWinControl'), 'TCustomListBox') do
  begin
    RegisterProperty('Items', 'TStrings', iptrw);
    RegisterProperty('ItemIndex', 'Integer', iptrw);
    RegisterProperty('SelCount', 'Integer', iptr);
    RegisterProperty('Selected', 'Boolean Integer', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterMethod('procedure Clear');
      RegisterMethod('function ItemAtPos(Pos: TPoint; Existing: Boolean): Integer');
      RegisterMethod('function ItemRect(Index: Integer): TRect');
      RegisterProperty('Canvas', 'TCanvas', iptr);
      RegisterProperty('TopIndex', 'Integer', iptrw);
    {$ENDIF}
  end;
end;

{ TListBox ------------------------------------------------------------------- }
procedure SIRegisterTLISTBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomListBox'), 'TListBox') do
  begin
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('BorderStyle', 'TBorderStyle', iptrw);
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('MultiSelect', 'Boolean', iptrw);
    RegisterProperty('ParentColor', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('Sorted', 'Boolean', iptrw);
    RegisterProperty('Style', 'TListBoxStyle', iptrw);
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDblClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    RegisterProperty('OnKeyDown', 'TKeyEvent', iptrw);
    RegisterProperty('OnKeyPress', 'TKeyPressEvent', iptrw);
    RegisterProperty('OnKeyUp', 'TKeyEvent', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterProperty('Columns', 'Integer', iptrw);
      RegisterProperty('CTL3D', 'Boolean', iptrw);
      RegisterProperty('DragCursor', 'LongInt', iptrw);
      RegisterProperty('DragMode', 'TDragMode', iptrw);
      RegisterProperty('ExtendedSelect', 'Boolean', iptrw);
      RegisterProperty('IntegralHeight', 'Boolean', iptrw);
      RegisterProperty('ItemHeight', 'Integer', iptrw);
      RegisterProperty('ParentCtl3D', 'Boolean', iptrw);
      RegisterProperty('ParentShowHint', 'Boolean', iptrw);
      RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
      RegisterProperty('TabWidth', 'Integer', iptrw);
      RegisterProperty('StyleElements', 'TStyleElements', iptrw);
      RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
      RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
      RegisterProperty('OnDrawItem', 'TDrawItemEvent', iptrw);
      RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
      RegisterProperty('OnMeasureItem', 'TMeasureItemEvent', iptrw);
      RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
      RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
      RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
      RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
      RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
      RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    {$ENDIF}
  end;
end;

{ TScrollBar ----------------------------------------------------------------- }
procedure SIRegisterTSCROLLBAR(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TWinControl'), 'TScrollBar') do
  begin
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('Kind', 'TScrollBarKind', iptrw);
    RegisterProperty('Max', 'Integer', iptrw);
    RegisterProperty('Min', 'Integer', iptrw);
    RegisterProperty('Position', 'Integer', iptrw);
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterMethod('procedure SetParams(APosition,AMin,AMax: Integer)');
      RegisterProperty('CTL3D', 'Boolean', iptrw);
      RegisterProperty('DragCursor', 'LongInt', iptrw);
      RegisterProperty('DragMode', 'TDragMode', iptrw);
      RegisterProperty('LargeChange', 'TScrollBarInc', iptrw);
      RegisterProperty('ParentCtl3D', 'Boolean', iptrw);
      RegisterProperty('ParentShowHint', 'Boolean', iptrw);
      RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
      RegisterProperty('SmallChange', 'TScrollBarInc', iptrw);
      RegisterProperty('StyleElements', 'TStyleElements', iptrw);
      RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
      RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
      RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
      RegisterProperty('OnKeyDown', 'TKeyEvent', iptrw);
      RegisterProperty('OnKeyPress', 'TKeyPressEvent', iptrw);
      RegisterProperty('OnKeyUp', 'TKeyEvent', iptrw);
      RegisterProperty('OnScroll', 'TScrollEvent', iptrw);
      RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
    {$ENDIF}
  end;
end;


{$IFNDEF PS_MINIVCL}
{ TTrackBar ------------------------------------------------------------------ }
procedure SIRegisterTTRACKBAR(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TWinControl'), 'TTrackBar') do
  begin
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('Max', 'Integer', iptrw);
    RegisterProperty('Min', 'Integer', iptrw);
    RegisterProperty('Position', 'Integer', iptrw);
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    RegisterMethod('procedure SetTick(Value: Integer)');
    RegisterProperty('CTL3D', 'Boolean', iptrw);
    RegisterProperty('DragCursor', 'LongInt', iptrw);
    RegisterProperty('DragMode', 'TDragMode', iptrw);
    RegisterProperty('LineSize', 'Integer', iptrw);
    RegisterProperty('Orientation', 'TTrackBarOrientation', iptrw);
    RegisterProperty('ParentCtl3D', 'Boolean', iptrw);
    RegisterProperty('ParentShowHint', 'Boolean', iptrw);
    RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
    RegisterProperty('PageSize', 'Integer', iptrw);
    RegisterProperty('Frequency', 'Integer', iptrw);
    RegisterProperty('SelEnd', 'Integer', iptrw);
    RegisterProperty('SelStart', 'Integer', iptrw);
    RegisterProperty('ThumbLength', 'Integer', iptrw);
    RegisterProperty('TickMarks', 'TTickMark', iptrw);
    RegisterProperty('TickStyle', 'TTickStyle', iptrw);
    RegisterProperty('StyleElements', 'TStyleElements', iptrw);
    RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
    RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
    RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
    RegisterProperty('OnKeyDown', 'TKeyEvent', iptrw);
    RegisterProperty('OnKeyPress', 'TKeyPressEvent', iptrw);
    RegisterProperty('OnKeyUp', 'TKeyEvent', iptrw);
    RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
  end;
end;

{ TCustomUpDown -------------------------------------------------------------- }
procedure SIRegisterTCUSTOMUPDOWN(Cl: TPSPascalCompiler);
begin
  Cl.AddClassN(Cl.FindClass('TWinControl'), 'TCustomUpDown');
end;

{ TUpDown -------------------------------------------------------------------- }
procedure SIRegisterTUPDOWN(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomUpDown'),'TUpDown') do
  begin
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('AlignButton', 'TUDAlignButton', iptrw);
    RegisterProperty('Associate', 'TWinControl', iptrw);
    RegisterProperty('ArrowKeys', 'Boolean', iptrw);
    RegisterProperty('Min', 'Integer', iptrw);
    RegisterProperty('Max', 'Integer', iptrw);
    RegisterProperty('Increment', 'Integer', iptrw);
    RegisterProperty('Orientation', 'TUDOrientation', iptrw);
    RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
    RegisterProperty('Position', 'Integer', iptrw);
    RegisterProperty('Thousands', 'Boolean', iptrw);
    RegisterProperty('Wrap', 'Boolean', iptrw);
    RegisterProperty('StyleElements', 'TStyleElements', iptrw);
    RegisterProperty('OnChanging', 'TUDChangingEvent', iptrw);
    RegisterProperty('OnChangingEx', 'TUDChangingEventEx', iptrw);
    RegisterProperty('OnClick', 'TUDClickEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
    RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
    RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
  end;
end;

{ TCustomHotKey -------------------------------------------------------------- }
procedure SIRegisterTCUSTOMHOTKEY(Cl: TPSPascalCompiler);
begin
  Cl.AddClassN(Cl.FindClass('TWinControl'), 'TCustomHotKey');
end;

{ THotKey -------------------------------------------------------------------- }
procedure SIRegisterTHOTKEY(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomHotKey'),'THotKey') do
  begin
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('AutoSize', 'Boolean', iptrw);
    RegisterProperty('HotKey', 'TShortCut', iptrw);
    RegisterProperty('InvalidKeys', 'THKInvalidKeys', iptrw);
    RegisterProperty('Modifiers', 'THKModifiers', iptrw);
    RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
    RegisterProperty('StyleElements', 'TStyleElements', iptrw);
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
    RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
    RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
  end;
end;

{ TStatusBar ----------------------------------------------------------------- }
procedure SIRegisterTSTATUSBAR(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TWinControl'),'TStatusBar') do
  begin
    RegisterProperty('Canvas', 'TCanvas', iptr);
    RegisterProperty('Panels', 'TStatusPanels', iptrw);
    RegisterProperty('SimplePanel', 'Boolean', iptrw);
    RegisterProperty('SimpleText', 'string', iptrw);
    RegisterProperty('SizeGrip', 'Boolean', iptrw);
    RegisterProperty('StyleElements', 'TStyleElements', iptrw);
    //RegisterProperty('OnDrawPanel', 'TDrawPanelEvent', iptrw);
    RegisterProperty('OnResize', 'TNotifyEvent', iptrw);
  end;
end;

{ TStatusPanels -------------------------------------------------------------- }
procedure SIRegisterTSTATUSPANELS(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCollection'),'TStatusPanels') do
  begin
    RegisterMethod('constructor Create(StatusBar: TStatusBar)');
    RegisterMethod('function Add: TStatusPanel');
    RegisterProperty('Items', 'TStatusPanel Integer', iptrw);
    SetDefaultPropery('Items');
  end;
end;

{ TStatusPanel --------------------------------------------------------------- }
procedure SIRegisterTSTATUSPANEL(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCollectionItem'),'TStatusPanel') do
  begin
    RegisterProperty('Alignment', 'TAlignment', iptrw);
    RegisterProperty('Bevel', 'TStatusPanelBevel', iptrw);
    RegisterProperty('Style', 'TStatusPanelStyle', iptrw);
    RegisterProperty('Text', 'string', iptrw);
    RegisterProperty('Width', 'Integer', iptrw);
  end;
end;


{ TCustomListView ------------------------------------------------------------ }
procedure SIRegister_TCustomListView(Cl: TPSPascalCompiler);
begin
  Cl.AddTypeS('TLVCompare', 'function (lParam1, lParam2, lParamSort: Integer): Integer;');
  with Cl.AddClassN(Cl.FindClass('TWinControl'),'TCustomListView') do
  begin
    RegisterMethod('function AlphaSort: Boolean');
    RegisterMethod('procedure Arrange(Code: TListArrangement)');
    RegisterMethod('function FindCaption(StartIndex: Integer; Value: string; Partial, Inclusive, Wrap: Boolean): TListItem');
    RegisterMethod('function FindData(StartIndex: Integer; Value: Pointer; Inclusive, Wrap: Boolean): TListItem');
    RegisterMethod('function GetItemAt(X, Y: Integer): TListItem');
    RegisterMethod('function GetNearestItem(Point: TPoint; Direction: TSearchDirection): TListItem');
    RegisterMethod('function GetNextItem(StartItem: TListItem; Direction: TSearchDirection; States: TItemStates): TListItem');
    RegisterMethod('function GetSearchString: string');
    RegisterMethod('function IsEditing: Boolean');
    RegisterMethod('procedure Scroll(DX, DY: Integer)');
    RegisterProperty('Checkboxes', 'Boolean', iptrw);
    RegisterProperty('Column', 'TListColumn Integer', iptr);
    RegisterProperty('DropTarget', 'TListItem', iptrw);
    RegisterProperty('GridLines', 'Boolean', iptrw);
    RegisterProperty('HotTrack', 'Boolean', iptrw);
    RegisterProperty('ItemFocused', 'TListItem', iptrw);
    RegisterProperty('RowSelect', 'Boolean', iptrw);
    RegisterProperty('SelCount', 'Integer', iptr);
    RegisterProperty('Selected', 'TListItem', iptrw);
    RegisterMethod('function CustomSort(SortProc: TLVCompare; lParam: Longint): Boolean');
    RegisterMethod('function StringWidth(S: string): Integer');
    RegisterMethod('procedure UpdateItems(FirstIndex, LastIndex: Integer)');
    RegisterProperty('TopItem', 'TListItem', iptr);
    RegisterProperty('ViewOrigin', 'TPoint', iptr);
    RegisterProperty('VisibleRowCount', 'Integer', iptr);
    RegisterProperty('BoundingRect', 'TRect', iptr);
  end;
end;

{ TIconOptions --------------------------------------------------------------- }
procedure SIRegisterTICONOPTIONS(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TPersistent'),'TIconOptions') do
  begin
    RegisterMethod('constructor Create(AOwner: TCustomListView)');
    RegisterProperty('Arrangement', 'Byte', iptrw);
    RegisterProperty('AutoArrange', 'Boolean', iptrw);
    RegisterProperty('WrapText', 'Boolean', iptrw);
  end;
end;

{ TListItems ----------------------------------------------------------------- }
procedure SIRegisterTLISTITEMS(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TPersistent'),'TListItems') do
  begin
    RegisterMethod('constructor Create(AOwner: TCustomListView)');
    RegisterMethod('function Add: TListItem');
    RegisterMethod('procedure BeginUpdate');
    RegisterMethod('procedure Clear');
    RegisterMethod('procedure Delete(Index: Integer)');
    RegisterMethod('procedure EndUpdate');
    RegisterMethod('function IndexOf(Value: TListItem): Integer');
    RegisterMethod('function Insert(Index: Integer): TListItem');
    RegisterProperty('Count', 'Integer', iptr);
    RegisterProperty('Handle', 'LongInt', iptr);
    RegisterProperty('Item', 'TListItem Integer', iptrw);
    RegisterProperty('Owner', 'TCustomListView', iptr);
  end;
end;

{ TListItem ------------------------------------------------------------------ }
procedure SIRegisterTLISTITEM(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TPersistent'),'TListItem') do
  begin
    RegisterMethod('constructor Create(AOwner: TListItems)');
    RegisterMethod('procedure CancelEdit');
    RegisterMethod('procedure Delete');
    RegisterMethod('function DisplayRect(Code: TDisplayCode): TRect');
    RegisterMethod('function EditCaption: Boolean');
    RegisterMethod('function GetPosition: TPoint');
    RegisterMethod('procedure MakeVisible(PartialOK: Boolean)');
    RegisterMethod('procedure Update');
    RegisterMethod('procedure SetPosition(const Value: TPoint)');
    RegisterProperty('Caption', 'string', iptrw);
    RegisterProperty('Checked', 'Boolean', iptrw);
    RegisterProperty('Cut', 'Boolean', iptrw);
    RegisterProperty('Data', 'Pointer', iptrw);
    RegisterProperty('DropTarget', 'Boolean', iptrw);
    RegisterProperty('Focused', 'Boolean', iptrw);
    RegisterProperty('Handle', 'LongInt', iptr);
    RegisterProperty('ImageIndex', 'Integer', iptrw);
    RegisterProperty('Index', 'Integer', iptr);
    RegisterProperty('Left', 'Integer', iptrw);
    RegisterProperty('ListView', 'TCustomListView', iptr);
    RegisterProperty('Owner', 'TListItems', iptr);
    RegisterProperty('OverlayIndex', 'Integer', iptrw);
    RegisterProperty('Selected', 'Boolean', iptrw);
    RegisterProperty('StateIndex', 'Integer', iptrw);
    RegisterProperty('SubItems', 'TStrings', iptrw);
    RegisterProperty('Top', 'Integer', iptrw);
  end;
end;

{ TListColumns --------------------------------------------------------------- }
procedure SIRegisterTLISTCOLUMNS(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCollection'),'TListColumns') do
  begin
    RegisterMethod('constructor Create(AOwner: TCustomListView)');
    RegisterMethod('function Add: TListColumn');
    RegisterProperty('Owner', 'TCustomListView', iptr);
    RegisterProperty('Items', 'TListColumn Integer', iptrw);
  end;
end;

{ TListColumn ---------------------------------------------------------------- }
procedure SIRegisterTLISTCOLUMN(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCollectionItem'),'TListColumn') do
  begin
    RegisterProperty('WidthType', 'Integer', iptr);
    RegisterProperty('Alignment', 'TAlignment', iptrw);
    RegisterProperty('Caption', 'string', iptrw);
    RegisterProperty('Width', 'Integer', iptrw);
  end;
end;

{ TCustomTreeView ------------------------------------------------------------ }
procedure SIRegister_TCustomTreeView(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TWinControl'),'TCustomTreeView') do
  begin
    RegisterMethod('function AlphaSort: Boolean');
    RegisterMethod('function CustomSort(SortProc: TTVCompare; Data: Longint): Boolean');
    RegisterMethod('procedure FullCollapse');
    RegisterMethod('procedure FullExpand');
    RegisterMethod('function GetHitTestInfoAt(X, Y: Integer): THitTests');
    RegisterMethod('function GetNodeAt(X, Y: Integer): TTreeNode');
    RegisterMethod('function IsEditing: Boolean');
    RegisterMethod('procedure LoadFromFile(const FileName: string)');
    RegisterMethod('procedure LoadFromStream(Stream: TStream)');
    RegisterMethod('procedure SaveToFile(const FileName: string)');
    RegisterMethod('procedure SaveToStream(Stream: TStream)');
    RegisterProperty('DropTarget', 'TTreeNode', iptrw);
    RegisterProperty('Selected', 'TTreeNode', iptrw);
    RegisterProperty('TopItem', 'TTreeNode', iptrw);
  end;
end;

{ TTreeNodes ----------------------------------------------------------------- }
procedure SIRegister_TTreeNodes(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TPersistent'),'TTreeNodes') do
  begin
    RegisterMethod('constructor Create(AOwner: TCustomTreeView)');
    RegisterMethod('function AddChildFirst(Node: TTreeNode; const S: string): TTreeNode');
    RegisterMethod('function AddChild(Node: TTreeNode; const S: string): TTreeNode');
    RegisterMethod('function AddChildObjectFirst(Node: TTreeNode; const S: string; Ptr: Pointer): TTreeNode');
    RegisterMethod('function AddChildObject(Node: TTreeNode; const S: string; Ptr: Pointer): TTreeNode');
    RegisterMethod('function AddFirst(Node: TTreeNode; const S: string): TTreeNode');
    RegisterMethod('function Add(Node: TTreeNode; const S: string): TTreeNode');
    RegisterMethod('function AddObjectFirst(Node: TTreeNode; const S: string; Ptr: Pointer): TTreeNode');
    RegisterMethod('function AddObject(Node: TTreeNode; const S: string; Ptr: Pointer): TTreeNode');
    RegisterMethod('procedure BeginUpdate');
    RegisterMethod('procedure Clear');
    RegisterMethod('procedure Delete(Node: TTreeNode)');
    RegisterMethod('procedure EndUpdate');
    RegisterMethod('function GetFirstNode: TTreeNode');
    RegisterMethod('function GetNode(ItemId: HTreeItem): TTreeNode');
    RegisterMethod('function Insert(Node: TTreeNode; const S: string): TTreeNode');
    RegisterMethod('function InsertObject(Node: TTreeNode; const S: string; Ptr: Pointer): TTreeNode');
    RegisterProperty('Count', 'Integer', iptr);
    RegisterProperty('Handle', 'HWND', iptr);
    RegisterProperty('Item', 'TTreeNode Integer', iptr);
    SetDefaultPropery('Item');
    RegisterProperty('Owner', 'TCustomTreeView', iptr);
  end;
end;

{ TTreeNode ------------------------------------------------------------------ }
procedure SIRegister_TTreeNode(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TPersistent'),'TTreeNode') do
  begin
    RegisterMethod('constructor Create(AOwner: TTreeNodes)');
    RegisterMethod('function AlphaSort: Boolean');
    RegisterMethod('procedure Collapse(Recurse: Boolean)');
    RegisterMethod('function CustomSort(SortProc: TTVCompare; Data: Longint): Boolean');
    RegisterMethod('procedure Delete');
    RegisterMethod('procedure DeleteChildren');
    RegisterMethod('function DisplayRect(TextOnly: Boolean): TRect');
    RegisterMethod('function EditText: Boolean');
    RegisterMethod('procedure EndEdit(Cancel: Boolean)');
    RegisterMethod('procedure Expand(Recurse: Boolean)');
    RegisterMethod('function GetFirstChild: TTreeNode');
    RegisterMethod('function GetHandle: HWND');
    RegisterMethod('function GetLastChild: TTreeNode');
    RegisterMethod('function GetNext: TTreeNode');
    RegisterMethod('function GetNextChild(Value: TTreeNode): TTreeNode');
    RegisterMethod('function GetNextSibling: TTreeNode');
    RegisterMethod('function GetNextVisible: TTreeNode');
    RegisterMethod('function GetPrev: TTreeNode');
    RegisterMethod('function GetPrevChild(Value: TTreeNode): TTreeNode');
    RegisterMethod('function GetPrevSibling: TTreeNode');
    RegisterMethod('function GetPrevVisible: TTreeNode');
    RegisterMethod('function HasAsParent(Value: TTreeNode): Boolean');
    RegisterMethod('function IndexOf(Value: TTreeNode): Integer');
    RegisterMethod('procedure MakeVisible');
    RegisterMethod('procedure MoveTo(Destination: TTreeNode; Mode: TNodeAttachMode)');
    RegisterProperty('AbsoluteIndex', 'Integer', iptr);
    RegisterProperty('Count', 'Integer', iptr);
    RegisterProperty('Cut', 'Boolean', iptrw);
    RegisterProperty('Data', 'Pointer', iptrw);
    RegisterProperty('Deleting', 'Boolean', iptr);
    RegisterProperty('Focused', 'Boolean', iptrw);
    RegisterProperty('DropTarget', 'Boolean', iptrw);
    RegisterProperty('Selected', 'Boolean', iptrw);
    RegisterProperty('Expanded', 'Boolean', iptrw);
    RegisterProperty('Handle', 'HWND', iptr);
    RegisterProperty('HasChildren', 'Boolean', iptrw);
    RegisterProperty('ImageIndex', 'Integer', iptrw);
    RegisterProperty('Index', 'Integer', iptr);
    RegisterProperty('IsVisible', 'Boolean', iptr);
    RegisterProperty('Item', 'TTreeNode Integer', iptrw);
    SetDefaultPropery('Item');
    RegisterProperty('ItemId', 'HTreeItem', iptr);
    RegisterProperty('Level', 'Integer', iptr);
    RegisterProperty('OverlayIndex', 'Integer', iptrw);
    RegisterProperty('Owner', 'TTreeNodes', iptr);
    RegisterProperty('Parent', 'TTreeNode', iptr);
    RegisterProperty('SelectedIndex', 'Integer', iptrw);
    RegisterProperty('StateIndex', 'Integer', iptrw);
    RegisterProperty('Text', 'string', iptrw);
    RegisterProperty('TreeView', 'TCustomTreeView', iptr);
  end;
end;

{ THeaderControl ------------------------------------------------------------- }
procedure SIRegister_THeaderControl(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TWinControl'),'THeaderControl') do
  begin
    RegisterProperty('Canvas', 'TCanvas', iptr);
    RegisterProperty('Align', 'TAlign', iptrw);
    RegisterProperty('DragCursor', 'LongInt', iptrw);
    RegisterProperty('DragMode', 'TDragMode', iptrw);
    RegisterProperty('Enabled', 'Boolean', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('HotTrack', 'Boolean', iptrw);
    RegisterProperty('Sections', 'THeaderSections', iptrw);
    RegisterProperty('ShowHint', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('ParentShowHint', 'Boolean', iptrw);
    RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
    RegisterProperty('Visible', 'Boolean', iptrw);
    RegisterProperty('StyleElements', 'TStyleElements', iptrw);
    RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
    RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
    RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
    RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
    RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
    RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
    //RegisterProperty('OnDrawSection', 'TDrawSectionEvent', iptrw); // registered in SIRegisterTHEADERCONTROL
    RegisterProperty('OnResize', 'TNotifyEvent', iptrw);
    //RegisterProperty('OnSectionClick', 'TSectionNotifyEvent', iptrw); // registered in SIRegisterTHEADERCONTROL
    //RegisterProperty('OnSectionResize', 'TSectionNotifyEvent', iptrw); // registered in SIRegisterTHEADERCONTROL
    //RegisterProperty('OnSectionTrack', 'TSectionTrackEvent', iptrw); // registered in SIRegisterTHEADERCONTROL
    RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
  end;
end;

{ THeaderSections ------------------------------------------------------------ }
procedure SIRegister_THeaderSections(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCollection'),'THeaderSections') do
  begin
    RegisterMethod('constructor Create(HeaderControl: THeaderControl)');
    RegisterMethod('function Add: THeaderSection');
    RegisterProperty('Items', 'THeaderSection Integer', iptrw);
    SetDefaultPropery('Items');
  end;
end;

{ THeaderSection ------------------------------------------------------------- }
procedure SIRegister_THeaderSection(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TCollectionItem', 'THeaderSection') do
  with Cl.AddClassN(Cl.FindClass('TCollectionItem'),'THeaderSection') do
  begin
    RegisterProperty('Left', 'Integer', iptr);
    RegisterProperty('Right', 'Integer', iptr);
    RegisterProperty('Alignment', 'TAlignment', iptrw);
    RegisterProperty('AllowClick', 'Boolean', iptrw);
    RegisterProperty('MaxWidth', 'Integer', iptrw);
    RegisterProperty('MinWidth', 'Integer', iptrw);
    RegisterProperty('Style', 'THeaderSectionStyle', iptrw);
    RegisterProperty('Text', 'string', iptrw);
    RegisterProperty('Width', 'Integer', iptrw);
  end;
end;

{ TPageControl --------------------------------------------------------------- }
procedure SIRegister_TPageControl(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomTabControl'),'TPageControl') do
  begin
    RegisterMethod('function FindNextPage(CurPage: TTabSheet; GoForward, CheckTabVisible: Boolean): TTabSheet');
    RegisterMethod('procedure SelectNextPage(GoForward: Boolean)');
    RegisterProperty('PageCount', 'Integer', iptr);
    RegisterProperty('Pages', 'TTabSheet Integer', iptr);
    RegisterProperty('ActivePage', 'TTabSheet', iptrw);
    RegisterProperty('Align', 'TAlign', iptrw);
    RegisterProperty('DragCursor', 'LongInt', iptrw);
    RegisterProperty('DragMode', 'TDragMode', iptrw);
    RegisterProperty('Enabled', 'Boolean', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('HotTrack', 'Boolean', iptrw);
    RegisterProperty('MultiLine', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('ParentShowHint', 'Boolean', iptrw);
    RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
    RegisterProperty('ScrollOpposite', 'Boolean', iptrw);
    RegisterProperty('ShowHint', 'Boolean', iptrw);
    RegisterProperty('TabHeight', 'Smallint', iptrw);
    RegisterProperty('TabOrder', 'Integer', iptrw);
    RegisterProperty('TabPosition', 'TTabPosition', iptrw);
    RegisterProperty('TabStop', 'Boolean', iptrw);
    RegisterProperty('TabWidth', 'Smallint', iptrw);
    RegisterProperty('Visible', 'Boolean', iptrw);
    RegisterProperty('StyleElements', 'TStyleElements', iptrw);
    RegisterProperty('OnChange', 'TTVChangedEvent', iptrw);
    RegisterProperty('OnChanging', 'TTVChangingEvent', iptrw);
    RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
    RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
    RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
    RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
    RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
    RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
  end;
end;

{ TTabSheet ------------------------------------------------------------------ }
procedure SIRegister_TTabSheet(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TWinControl'),'TTabSheet') do
  begin
    //RegisterProperty('PageControl', 'TPageControl', iptrw); // registered in SIRegisterTTAB
    RegisterProperty('TabIndex', 'Integer', iptr);
    RegisterProperty('Caption', 'string', iptrw);
    RegisterProperty('Enabled', 'Boolean', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('PageIndex', 'Integer', iptrw);
    RegisterProperty('TabVisible', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('ParentShowHint', 'Boolean', iptrw);
    RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
    RegisterProperty('ShowHint', 'Boolean', iptrw);
    RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
    RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
    RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
    RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
  end;
end;

{ TTabControl ---------------------------------------------------------------- }
procedure SIRegister_TTabControl(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomTabControl'),'TTabControl') do
  begin
    RegisterProperty('DisplayRect', 'TRect', iptr);
    RegisterProperty('Align', 'TAlign', iptrw);
    RegisterProperty('DragCursor', 'LongInt', iptrw);
    RegisterProperty('DragMode', 'TDragMode', iptrw);
    RegisterProperty('Enabled', 'Boolean', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('HotTrack', 'Boolean', iptrw);
    RegisterProperty('MultiLine', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('ParentShowHint', 'Boolean', iptrw);
    RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
    RegisterProperty('ScrollOpposite', 'Boolean', iptrw);
    RegisterProperty('ShowHint', 'Boolean', iptrw);
    RegisterProperty('TabHeight', 'Smallint', iptrw);
    RegisterProperty('TabOrder', 'Integer', iptrw);
    RegisterProperty('TabPosition', 'TTabPosition', iptrw);
    RegisterProperty('Tabs', 'TStrings', iptrw);
    RegisterProperty('TabIndex', 'Integer', iptrw);
    RegisterProperty('TabStop', 'Boolean', iptrw);
    RegisterProperty('TabWidth', 'Smallint', iptrw);
    RegisterProperty('Visible', 'Boolean', iptrw);
    RegisterProperty('StyleElements', 'TStyleElements', iptrw);
    RegisterProperty('OnChange', 'TTVChangedEvent', iptrw);
    RegisterProperty('OnChanging', 'TTVChangingEvent', iptrw);
    RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
    RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
    RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
    RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
    RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
    RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
  end;
end;

{ TCustomTabControl ---------------------------------------------------------- }
procedure SIRegister_TCustomTabControl(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TWinControl'),'TCustomTabControl') do
  begin
    RegisterProperty('TabStop', 'Boolean', iptrw);
  end;
end;

{ Register TListView ---------------------------------------------------------- }
procedure SIRegisterTLISTVIEW(Cl: TPSPascalCompiler);
begin
  SIRegisterTLISTCOLUMN(Cl);
  SIRegisterTLISTCOLUMNS(Cl);
  Cl.AddTypeS('TDisplayCode', '(drBounds, drIcon, drLabel, drSelectBounds)');
  SIRegisterTLISTITEM(Cl);
  SIRegisterTLISTITEMS(Cl);
  //Cl.AddTypeS('TIconArrangement', '(iaTop, iaLeft)');
  SIRegisterTICONOPTIONS(Cl);
  Cl.AddTypeS('TListArrangement', '(arAlignBottom, arAlignLeft, arAlignRight, arAlignTop, arDefault, arSnapToGrid)');
  Cl.AddTypeS('TViewStyle', '(vsIcon, vsSmallIcon, vsList, vsReport)');
  Cl.AddTypeS('TItemState', '(isNone, isCut, isDropHilited, isFocused, isSelected)');
  Cl.AddTypeS('TItemStates', 'set of TItemState');
  Cl.AddTypeS('TItemChange', '(ctText, ctImage, ctState)');
//  Cl.AddTypeS('TItemFind', '(ifData, ifPartialString, ifExactString, ifNearest)');
  Cl.AddTypeS('TSearchDirection', '(sdLeft, sdRight, sdAbove, sdBelow, sdAll)');
  Cl.AddTypeS('TLVDeletedEvent', 'procedure (Sender: TObject; Item: TListItem)');
  Cl.AddTypeS('TLVEditingEvent', 'procedure (Sender: TObject; Item: TListItem; var AllowEdit: Boolean)');
  Cl.AddTypeS('TLVEditedEvent', 'procedure (Sender: TObject; Item: TListItem; var S: string)');
  Cl.AddTypeS('TLVChangeEvent', 'procedure (Sender: TObject; Item: TListItem; Change: TItemChange)');
  Cl.AddTypeS('TLVChangingEvent', 'procedure (Sender: TObject; Item: TListItem; Change: TItemChange; var AllowChange: Boolean)');
  Cl.AddTypeS('TLVColumnClickEvent', 'procedure (Sender: TObject; Column: TListColumn)');
//  Cl.AddTypeS('TLVColumnRClickEvent', 'procedure (Sender: TObject; Column: TListColumn; Point: TPoint)');
  Cl.AddTypeS('TLVCompareEvent', 'procedure (Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer)');
//  Cl.AddTypeS('TLVNotifyEvent', 'procedure (Sender: TObject; Item: TListItem)');
//  Cl.AddTypeS('TLVSelectItemEvent', 'procedure (Sender: TObject; Item: TListItem; Selected: Boolean)');
//  Cl.AddTypeS('TLVCheckedItemEvent', 'procedure (Sender: TObject; Item: TListItem)');
//  Cl.AddTypeS('TLVDrawItemEvent', 'procedure (Sender: TCustomListView; Item: TListItem; Rect: TRect; State: TOwnerDrawState)');
//  Cl.AddTypeS('TLVOwnerDataEvent', 'procedure (Sender: TObject; Item: TListItem)');
//  Cl.AddTypeS('TLVOwnerDataFindEvent', 'procedure (Sender: TObject; Find: TItemFind; const FindString: string; const FindPosition: TPoint; FindData: TCustomData; StartIndex: Integer; Direction: TSearchDirection; Wrap: Boolean; var Index: Integer)');
//  Cl.AddTypeS('TLVOwnerDataHintEvent', 'procedure (Sender: TObject; StartIndex, EndIndex: Integer)');
//  Cl.AddTypeS('TLVOwnerDataStateChangeEvent', 'procedure (Sender: TObject; StartIndex, EndIndex: Integer; OldState, NewState: TItemStates)');
//  Cl.AddTypeS('TLVSubItemImageEvent', 'procedure (Sender: TObject; Item: TListItem; SubItem: Integer; var ImageIndex: Integer)');
//  Cl.AddTypeS('TLVInfoTipEvent', 'procedure (Sender: TObject; Item: TListItem; var InfoTip: string)');
//  Cl.AddTypeS('TLVCreateItemClassEvent', 'procedure (Sender: TCustomListView; var ItemClass: TListItemClass)');
  SIRegister_TCustomListView(Cl);

  with Cl.AddClassN(Cl.FindClass('TCustomListView'),'TListView') do
    begin
      {$IFDEF DELPHI4UP}
        RegisterProperty('Anchors', 'TAnchors', iptrw);
      {$ENDIF}
      RegisterProperty('BorderStyle', 'TBorderStyle', iptrw);
      RegisterProperty('Color', 'TColor', iptrw);
      RegisterProperty('ColumnClick', 'Boolean', iptrw);
      RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
      RegisterProperty('OnDblClick', 'TNotifyEvent', iptrw);
      RegisterProperty('Columns', 'TListColumns', iptrw);
      RegisterProperty('Ctl3D', 'Boolean', iptrw);
      RegisterProperty('DragMode', 'TDragMode', iptrw);
      RegisterProperty('ReadOnly', 'Boolean', iptrw);
      RegisterProperty('Font', 'TFont', iptrw);
      RegisterProperty('HideSelection', 'Boolean', iptrw);
      RegisterProperty('IconOptions', 'TIconOptions', iptrw);
      RegisterProperty('Items', 'TListItems', iptrw);
      RegisterProperty('AllocBy', 'Integer', iptrw);
      RegisterProperty('MultiSelect', 'Boolean', iptrw);
      RegisterProperty('OnChange', 'TLVChangeEvent', iptrw);
      RegisterProperty('OnChanging', 'TLVChangingEvent', iptrw);
      RegisterProperty('OnColumnClick', 'TLVColumnClickEvent', iptrw);
      RegisterProperty('OnCompare', 'TLVCompareEvent', iptrw);
      RegisterProperty('OnDeletion', 'TLVDeletedEvent', iptrw);
      RegisterProperty('OnEdited', 'TLVEditedEvent', iptrw);
      RegisterProperty('OnEditing', 'TLVEditingEvent', iptrw);
      RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
      RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
      RegisterProperty('OnInsert', 'TLVDeletedEvent', iptrw);
      RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
      RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
      RegisterProperty('DragCursor', 'TCursor', iptrw);
      RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
      RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
      RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
      RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
      RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
      RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
      RegisterProperty('ShowColumnHeaders', 'Boolean', iptrw);
      RegisterProperty('SortType', 'TSortType', iptrw);
      RegisterProperty('ViewStyle', 'TViewStyle', iptrw);
      RegisterProperty('OnKeyDown', 'TKeyEvent', iptrw);
      RegisterProperty('OnKeyPress', 'TKeyPressEvent', iptrw);
      RegisterProperty('OnKeyUp', 'TKeyEvent', iptrw);
      RegisterProperty('LargeImages', 'TImageList', iptrw);
      RegisterProperty('SmallImages', 'TImageList', iptrw);
      RegisterProperty('StateImages', 'TImageList', iptrw);
      RegisterProperty('ParentColor', 'Boolean', iptrw);
      RegisterProperty('ParentFont', 'Boolean', iptrw);
      RegisterProperty('StyleElements', 'TStyleElements', iptrw);
      RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
      RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    end;
end;

{ Register TStatusBar -------------------------------------------------------- }
procedure SIRegisterTTSTATUSBAR(Cl: TPSPascalCompiler);
begin
  Cl.AddTypeS('TStatusPanelStyle', '(psText, psOwnerDraw)');
  Cl.AddTypeS('TStatusPanelBevel', '(pbNone, pbLowered, pbRaised)');
  SIRegisterTSTATUSPANEL(Cl);
  SIRegisterTSTATUSPANELS(Cl);
  SIRegisterTSTATUSBAR(Cl);
  Cl.AddTypeS('TDrawPanelEvent', 'procedure(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect)');
  with Cl.FindClass('TStatusBar') do RegisterProperty('OnDrawPanel', 'TDrawPanelEvent', iptrw);
end;

{ Register TTreeView --------------------------------------------------------- }
procedure SIRegisterTTREEVIEW(Cl: TPSPascalCompiler);
begin
  Cl.AddTypeS('TNodeState', '(nsCut, nsDropHilited, nsFocused, nsSelected, nsExpanded)');
  Cl.AddTypeS('TNodeAttachMode', '(naAdd, naAddFirst, naAddChild, naAddChildFirst, naInsert)');
  Cl.AddTypeS('TAddMode', '(taAddFirst, taAdd, taInsert)');
  Cl.AddTypeS('TNodeInfo', 'record ImageIndex: Integer; SelectedIndex: Integer; StateIndex: Integer; OverlayIndex: Integer; Data: Integer; Count: Integer; Text: string; end');
  Cl.AddTypeS('TTVCompare', 'function (lParam1, lParam2, lParamSort: Longint): Integer;');

  SIRegister_TTreeNode(Cl);
  SIRegister_TTreeNodes(Cl);

  Cl.AddTypeS('THitTest', '(htAbove, htBelow, htNowhere, htOnItem, htOnButton, htOnIcon, htOnIndent, htOnLabel, htOnRight, htOnStateIcon, htToLeft, htToRight)');
  Cl.AddTypeS('THitTests', 'set of THitTest');
  //Cl.AddClassN(Cl.FindClass('TOBJECT'),'ETreeViewError');
  Cl.AddTypeS('TTVChangingEvent', 'procedure(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean)');
  Cl.AddTypeS('TTVChangedEvent', 'procedure(Sender: TObject; Node: TTreeNode)');
  Cl.AddTypeS('TTVEditingEvent', 'procedure(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean)');
  Cl.AddTypeS('TTVEditedEvent', 'procedure(Sender: TObject; Node: TTreeNode; var S: string)');
  Cl.AddTypeS('TTVExpandingEvent', 'procedure(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean)');
  Cl.AddTypeS('TTVCollapsingEvent', 'procedure(Sender: TObject; Node: TTreeNode; var AllowCollapse: Boolean)');
  Cl.AddTypeS('TTVExpandedEvent', 'procedure(Sender: TObject; Node: TTreeNode)');
  Cl.AddTypeS('TTVCompareEvent', 'procedure(Sender: TObject; Node1, Node2: TTreeNode; Data: Integer; var Compare: Integer)');
  Cl.AddTypeS('TSortType', '(stNone, stData, stText, stBoth)');
  Cl.AddTypeS('TMultiSelectStyles', '(msControlSelect, msShiftSelect, msVisibleOnly, msSiblingOnly)');
  Cl.AddTypeS('TMultiSelectStyle', 'set of TMultiSelectStyles');
  SIRegister_TCustomTreeView(Cl);

  with Cl.AddClassN(Cl.FindClass('TCustomTreeView'),'TTreeView') do
  begin
    RegisterProperty('Align', 'TAlign', iptrw);
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('AutoExpand', 'Boolean', iptrw);
    RegisterProperty('BevelEdges', 'TBevelEdges', iptrw);
    RegisterProperty('BevelInner', 'TBevelCut', iptrw);
    RegisterProperty('BevelKind', 'TBevelKind', iptrw);
    RegisterProperty('BevelOuter', 'TBevelCut', iptrw);
    RegisterProperty('BevelWidth', 'TBevelWidth', iptrw);
    RegisterProperty('BiDiMode', 'TBiDiMode', iptrw);
    RegisterProperty('BorderStyle', 'TBorderStyle', iptrw);
    RegisterProperty('BorderWidth', 'TBorderWidth', iptrw);
    RegisterProperty('ChangeDelay', 'Integer', iptrw);
    RegisterProperty('CheckBoxes', 'Boolean', iptrw);
    RegisterProperty('CheckHierarchy', 'Boolean', iptrw);
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Ctl3D', 'Boolean', iptrw);
    RegisterProperty('Constraints', 'TSizeConstraints', iptrw);
    RegisterProperty('DoubleBuffered', 'Boolean', iptrw);
    //property DragKind;
    RegisterProperty('DragCursor', 'TCursor', iptrw);
    RegisterProperty('DragMode', 'TDragMode', iptrw);
    RegisterProperty('Enabled', 'Boolean', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    RegisterProperty('HideSelection', 'Boolean', iptrw);
    RegisterProperty('HotTrack', 'Boolean', iptrw);
    RegisterProperty('Images', 'TCustomImageList', iptrw);
    RegisterProperty('Indent', 'Integer', iptrw);
    RegisterProperty('MultiSelect', 'Boolean', iptrw);
    RegisterProperty('MultiSelectStyle', 'TMultiSelectStyle', iptrw);
    RegisterProperty('ParentBiDiMode', 'Boolean', iptrw);
    RegisterProperty('ParentColor', 'Boolean', iptrw); //  default False
    RegisterProperty('ParentCtl3D', 'Boolean', iptrw);
    RegisterProperty('ParentDoubleBuffered', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('ParentShowHint', 'Boolean', iptrw);
    RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
    RegisterProperty('ReadOnly', 'Boolean', iptrw);
    RegisterProperty('RightClickSelect', 'Boolean', iptrw);
    RegisterProperty('RowSelect', 'Boolean', iptrw);
    RegisterProperty('ShowButtons', 'Boolean', iptrw);
    RegisterProperty('ShowHint', 'Boolean', iptrw);
    RegisterProperty('ShowRoot', 'Boolean', iptrw);
    RegisterProperty('ShowLines', 'Boolean', iptrw);
    RegisterProperty('SortType', 'TSortType', iptrw);
    RegisterProperty('StateImages', 'TCustomImageList', iptrw);
    RegisterProperty('TabOrder', 'Integer', iptrw);
    RegisterProperty('TabStop', 'Boolean', iptrw); // default True;
    RegisterProperty('ToolTips', 'Boolean', iptrw);
    //property Touch;
    RegisterProperty('Visible', 'Boolean', iptrw);
//    {$IFNDEF VER230}
      RegisterProperty('StyleElements', 'TStyleElements', iptrw);
//    {$ENDIF}
    { Events }
    RegisterProperty('OnAddition', 'TTVExpandedEvent', iptrw);
    //RegisterProperty('OnAdvancedCustomDraw', 'TTVAdvancedCustomDrawEvent', iptrw);
    //RegisterProperty('OnAdvancedCustomDrawItem', 'TTVAdvancedCustomDrawItemEvent', iptrw);
    RegisterProperty('OnCancelEdit', 'TTVChangedEvent', iptrw);
    RegisterProperty('OnChange', 'TTVChangedEvent', iptrw);
    RegisterProperty('OnChanging', 'TTVChangingEvent', iptrw);
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnCollapsed', 'TTVExpandedEvent', iptrw);
    RegisterProperty('OnCollapsing', 'TTVCollapsingEvent', iptrw);
    RegisterProperty('OnCompare', 'TTVCompareEvent', iptrw);
    //property OnContextPopup (TContextPopupEvent);
    RegisterProperty('OnCreateNodeClass', 'TTVCreateNodeClassEvent', iptrw);
    RegisterProperty('OnCustomDraw', 'TTVCustomDrawEvent', iptrw);
    RegisterProperty('OnCustomDrawItem', 'TTVCustomDrawItemEvent', iptrw);
    RegisterProperty('OnDblClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDeletion', 'TTVExpandedEvent', iptrw);
    RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
    RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
    RegisterProperty('OnEdited', 'TTVEditedEvent', iptrw);
    RegisterProperty('OnEditing', 'TTVEditingEvent', iptrw);
    //property OnEndDock;
    RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExpanding', 'TTVExpandingEvent', iptrw);
    RegisterProperty('OnExpanded', 'TTVExpandedEvent', iptrw);
    //property OnGesture;
    RegisterProperty('OnGetImageIndex', 'TTVExpandedEvent', iptrw);
    RegisterProperty('OnGetSelectedIndex', 'TTVExpandedEvent', iptrw);
    RegisterProperty('OnHint', 'TTVHintEvent', iptrw);
    RegisterProperty('OnKeyDown', 'TKeyEvent', iptrw);
    RegisterProperty('OnKeyPress', 'TKeyPressEvent', iptrw);
    RegisterProperty('OnKeyUp', 'TKeyEvent', iptrw);
    //property OnMouseActivate (TMouseActivateEvent);
    RegisterProperty('OnMouseDown', 'TMouseEvent', iptrw);
    RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseMove', 'TMouseMoveEvent', iptrw);
    RegisterProperty('OnMouseUp', 'TMouseEvent', iptrw);
    //property OnStartDock;
    RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
    RegisterProperty('Items', 'TTreeNodes', iptrw);
  end;
end;

{ Register TTab -------------------------------------------------------------- }
procedure SIRegisterTTAB(Cl: TPSPascalCompiler);
begin
  Cl.AddTypeS('TTabChangingEvent', 'procedure(Sender: TObject; var AllowChange: Boolean)');
  Cl.AddTypeS('TTabPosition', '(tpTop, tpBottom)');
  SIRegister_TCustomTabControl(Cl);
  SIRegister_TTabControl(Cl);
  SIRegister_TTabSheet(Cl);
  SIRegister_TPageControl(Cl);
  with Cl.FindClass('TTabSheet') do RegisterProperty('PageControl', 'TPageControl', iptrw);
end;

{ Register THeader ----------------------------------------------------------- }
procedure SIRegisterTHEADERCONTROL(Cl: TPSPascalCompiler);
begin
  Cl.AddTypeS('THeaderSectionStyle', '(hsText, hsOwnerDraw)');
  SIRegister_THeaderSection(Cl);
  SIRegister_THeaderSections(Cl);
  Cl.AddTypeS('TSectionTrackState', '(tsTrackBegin, tsTrackMove, tsTrackEnd)');
  SIRegister_THeaderControl(Cl);
  Cl.AddTypeS('TDrawSectionEvent', 'procedure(HeaderControl: THeaderControl; Section: THeaderSection; const Rect: TRect; Pressed: Boolean)');
  Cl.AddTypeS('TSectionNotifyEvent', 'procedure(HeaderControl: THeaderControl; Section: THeaderSection)');
  Cl.AddTypeS('TSectionTrackEvent', 'procedure(HeaderControl: THeaderControl; Section: THeaderSection; Width: Integer; State: TSectionTrackState)');
  with Cl.FindClass('THeaderControl') do
  begin
    RegisterProperty('OnDrawSection', 'TDrawSectionEvent', iptrw);
    RegisterProperty('OnSectionClick', 'TSectionNotifyEvent', iptrw);
    RegisterProperty('OnSectionResize', 'TSectionNotifyEvent', iptrw);
    RegisterProperty('OnSectionTrack', 'TSectionTrackEvent', iptrw);
  end;
end;

{ TMonthCalColors ------------------------------------------------------------ }
procedure SIRegister_TMonthCalColors(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TPersistent', 'TMonthCalColors') do
  with Cl.AddClassN(Cl.FindClass('TPersistent'),'TMonthCalColors') do
  begin
    { Properties }
    RegisterMethod('constructor Create(AOwner: TCommonCalendar)');
    RegisterProperty('BackColor', 'TColor', iptrw);
    RegisterProperty('TextColor', 'TColor', iptrw);
    RegisterProperty('TitleBackColor', 'TColor', iptrw);
    RegisterProperty('TitleTextColor', 'TColor', iptrw);
    RegisterProperty('MonthBackColor', 'TColor', iptrw);
    RegisterProperty('TrailingTextColor', 'TColor', iptrw);
  end;
end;

{ TCommonCalendar ------------------------------------------------------------ }
procedure SIRegister_TCommonCalendar(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TWinControl', 'TCommonCalendar') do
  with Cl.AddClassN(Cl.FindClass('TWinControl'),'TCommonCalendar') do
  begin
    { Properties }
    RegisterMethod('procedure BoldDays(Days: array of LongWord; var MonthBoldInfo: LongWord)');
  end;
end;

{ TMonthCalendar ------------------------------------------------------------- }
procedure SIRegister_TMonthCalendar(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TCommonCalendar', 'TMonthCalendar') do
  with Cl.AddClassN(Cl.FindClass('TCommonCalendar'),'TMonthCalendar') do
  begin
    { Properties }
    RegisterProperty('Align', 'TAlign', iptrw);
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('AutoSize', 'Boolean', iptrw);
    RegisterProperty('BorderWidth', 'TBorderWidth', iptrw);
    RegisterProperty('BiDiMode', 'TBiDiMode', iptrw);
    RegisterProperty('CalColors', 'TMonthCalColors', iptrw);
    RegisterProperty('Constraints', 'TSizeConstraints', iptrw);
    RegisterProperty('MultiSelect', 'Boolean', iptrw);
    RegisterProperty('Date', 'TDate', iptrw);
    RegisterProperty('DoubleBuffered', 'Boolean', iptrw);
    RegisterProperty('DragCursor', 'TCursor', iptrw);
    //property DragKind;
    RegisterProperty('DragMode', 'TDragMode', iptrw);
    RegisterProperty('Enabled', 'Boolean', iptrw);
    RegisterProperty('EndDate', 'TDate', iptrw);
    RegisterProperty('FirstDayOfWeek', 'TCalDayOfWeek', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    //property ImeMode;
    //property ImeName;
    RegisterProperty('MaxDate', 'TDate', iptrw);
    RegisterProperty('MaxSelectRange', 'Integer', iptrw);
    RegisterProperty('MinDate', 'TDate', iptrw);
    RegisterProperty('ParentBiDiMode', 'Boolean', iptrw);
    RegisterProperty('ParentDoubleBuffered', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('ParentShowHint', 'Boolean', iptrw);
    RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
    RegisterProperty('ShowHint', 'Boolean', iptrw);
    RegisterProperty('ShowToday', 'Boolean', iptrw);
    RegisterProperty('ShowTodayCircle', 'Boolean', iptrw);
    RegisterProperty('TabOrder', 'Integer', iptrw);
    RegisterProperty('TabStop', 'Boolean', iptrw); // default True;
    //property Touch;
    RegisterProperty('Visible', 'Boolean', iptrw);
    RegisterProperty('WeekNumbers', 'Boolean', iptrw);
    { Events }
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    //property OnContextPopup (TContextPopupEvent);
    RegisterProperty('OnDblClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
    RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
    //property OnEndDock;
    RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    //property OnGesture;
    RegisterProperty('OnGetMonthInfo', 'TOnGetMonthInfoEvent', iptrw);
    RegisterProperty('OnGetMonthBoldInfo', 'TOnGetMonthBoldInfoEvent', iptrw);
    RegisterProperty('OnKeyDown', 'TKeyEvent', iptrw);
    RegisterProperty('OnKeyPress', 'TKeyPressEvent', iptrw);
    RegisterProperty('OnKeyUp', 'TKeyEvent', iptrw);
    RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    //property OnStartDock;
    RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
  end;
end;

{ TDateTimePicker ------------------------------------------------------------ }
procedure SIRegister_TDateTimePicker(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TCommonCalendar', 'TDateTimePicker') do
  Cl.AddTypeS('TDateTimeColors', 'TMonthCalColors');
  with Cl.AddClassN(Cl.FindClass('TCommonCalendar'),'TDateTimePicker') do
  begin
    { Properties }
    RegisterProperty('DateTime', 'TDateTime', iptrw);
    RegisterProperty('DroppedDown', 'Boolean', iptr);
    RegisterProperty('Align', 'TAlign', iptrw);
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('BevelEdges', 'TBevelEdges', iptrw);
    RegisterProperty('BevelInner', 'TBevelCut', iptrw);
    RegisterProperty('BevelOuter', 'TBevelCut', iptrw);
    RegisterProperty('BevelKind', 'TBevelKind', iptrw);
    RegisterProperty('BevelWidth', 'TBevelWidth', iptrw);
    RegisterProperty('BiDiMode', 'TBiDiMode', iptrw);
    RegisterProperty('CalAlignment', 'TDTCalAlignment', iptrw);
    RegisterProperty('CalColors', 'TDateTimeColors', iptrw);
    RegisterProperty('Constraints', 'TSizeConstraints', iptrw);
    RegisterProperty('Date', 'TDate', iptrw);
    RegisterProperty('Format', 'String', iptrw);
    RegisterProperty('Time', 'TTime', iptrw);
    RegisterProperty('ShowCheckbox', 'Boolean', iptrw);
    RegisterProperty('Checked', 'Boolean', iptrw);
    RegisterProperty('DateFormat', 'TDTDateFormat', iptrw);
    RegisterProperty('DateMode', 'TDTDateMode', iptrw);
    RegisterProperty('DoubleBuffered', 'Boolean', iptrw);
    RegisterProperty('DragCursor', 'TCursor', iptrw);
    //property DragKind;
    RegisterProperty('DragMode', 'TDragMode', iptrw);
    RegisterProperty('Enabled', 'Boolean', iptrw);
    RegisterProperty('Font', 'TFont', iptrw);
    //property ImeMode;
    //property ImeName;
    RegisterProperty('Kind', 'TDateTimeKind', iptrw);
    RegisterProperty('MaxDate', 'TDate', iptrw);
    RegisterProperty('MinDate', 'TDate', iptrw);
    RegisterProperty('ParseInput', 'Boolean', iptrw);
    RegisterProperty('ParentBiDiMode', 'Boolean', iptrw);
    RegisterProperty('ParentColor', 'Boolean', iptrw); //  default False
    RegisterProperty('ParentDoubleBuffered', 'Boolean', iptrw);
    RegisterProperty('ParentFont', 'Boolean', iptrw);
    RegisterProperty('ParentShowHint', 'Boolean', iptrw);
    RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
    RegisterProperty('ShowHint', 'Boolean', iptrw);
    RegisterProperty('TabOrder', 'Integer', iptrw);
    RegisterProperty('TabStop', 'Boolean', iptrw); // default True;
    //property Touch;
    RegisterProperty('Visible', 'Boolean', iptrw);
//    {$IFNDEF VER230}
      RegisterProperty('StyleElements', 'TStyleElements', iptrw);
//    {$ENDIF}
    { Events }
    RegisterProperty('OnClick', 'TNotifyEvent', iptrw);
    RegisterProperty('OnCloseUp', 'TNotifyEvent', iptrw);
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
    //property OnContextPopup (TContextPopupEvent);
    RegisterProperty('OnDropDown', 'TNotifyEvent', iptrw);
    RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
    RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
    //property OnEndDock;
    RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
    RegisterProperty('OnEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnExit', 'TNotifyEvent', iptrw);
    //property OnGesture;
    RegisterProperty('OnKeyDown', 'TKeyEvent', iptrw);
    RegisterProperty('OnKeyPress', 'TKeyPressEvent', iptrw);
    RegisterProperty('OnKeyUp', 'TKeyEvent', iptrw);
    RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
    RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    //property OnStartDock;
    RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
    RegisterProperty('OnUserInput', 'TDTParseInputEvent', iptrw);
  end;
end;
{$ENDIF}

{ Types And Consts ----------------------------------------------------------- }
procedure SIRegister_StdCtrls_TypesAndConsts(Cl: TPSPascalCompiler);
begin
  Cl.AddTypeS('TEditCharCase', '(ecNormal, ecUpperCase, ecLowerCase)');
  Cl.AddTypeS('TScrollStyle', '(ssNone, ssHorizontal, ssVertical, ssBoth)');
  Cl.AddTypeS('TComboBoxStyle', '(csDropDown, csSimple, csDropDownList, csOwnerDrawFixed, csOwnerDrawVariable)');
  Cl.AddTypeS('TMeasureItemEvent', 'procedure(Control: TWinControl; Index: Integer; var Height: Integer)');
  Cl.AddTypeS('TCheckBoxState', '(cbUnchecked, cbChecked, cbGrayed)');
  Cl.AddTypeS('TListBoxStyle', '(lbStandard, lbOwnerDrawFixed, lbOwnerDrawVariable)');
  Cl.AddTypeS('TScrollCode', '(scLineUp, scLineDown, scPageUp, scPageDown, scPosition, scTrack, scTop, scBottom, scEndScroll)');
  Cl.AddTypeS('TScrollEvent', 'procedure(Sender: TObject; ScrollCode: TScrollCode; var ScrollPos: Integer)');

  Cl.addTypeS('TEOwnerDrawState', '(odSelected, odGrayed, odDisabled, odChecked, odFocused, odDefault, odHotLight, odInactive, odNoAccel, odNoFocusRect, odReserved1, odReserved2, odComboBoxEdit)');

  Cl.AddTypeS('TTextLayout', '(tlTop, tlCenter, tlBottom)');
  Cl.AddTypeS('TOwnerDrawState', 'set of TEOwnerDrawState');
  Cl.AddTypeS('TDrawItemEvent', 'procedure(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState)');

{$IFNDEF PS_MINIVCL}
  { TCustomButton }
  Cl.AddTypeS('TImageAlignment', '(iaLeft, iaRight, iaTop, iaBottom, iaCenter)');
  //Cl.AddTypeS('TButtonStyle', '(bsPushButton, bsCommandLink, bsSplitButton)');

  { TTrackBar }
  Cl.AddTypeS('TTrackBarOrientation', '(trHorizontal, trVertical)');
  Cl.AddTypeS('TTickMark', '(tmBottomRight, tmTopLeft, tmBoth)');
  Cl.AddTypeS('TTickStyle', '(tsNone, tsAuto, tsManual)');

  { TUpDown }
  Cl.AddTypeS('TUDAlignButton', '(udLeft, udRight)');
  Cl.AddTypeS('TUDOrientation', '(udHorizontal, udVertical)');
  Cl.AddTypeS('TUDBtnType', '(btNext, btPrev)');
  Cl.AddTypeS('TUpDownDirection', '(updNone, updUp, updDown)');
  Cl.AddTypeS('TUDClickEvent', 'procedure (Sender: TObject; Button: TUDBtnType)');
  Cl.AddTypeS('TUDChangingEvent', 'procedure (Sender: TObject; var AllowChange: Boolean)');
  Cl.AddTypeS('TUDChangingEventEx', 'procedure (Sender: TObject; var AllowChange: Boolean; NewValue: Integer; Direction: TUpDownDirection)');

  { THotKey }
  Cl.AddTypeS('THKModifier', '(hkShift, hkCtrl, hkAlt, hkExt)');
  Cl.AddTypeS('THKModifiers', 'set of THKModifier');
  Cl.AddTypeS('THKInvalidKey', '(hcNone, hcShift, hcCtrl, hcAlt, hcShiftCtrl, hcShiftAlt, hcCtrlAlt, hcShiftCtrlAlt)');
  Cl.AddTypeS('THKInvalidKeys', 'set of THKInvalidKey');
  Cl.addTypeS('TShortCut', 'Word');

  { Date&Time }
  Cl.AddType('TDateTime', btDouble).ExportName := True;
  Cl.AddTypeS('TCalDayOfWeek', '(dowMonday, dowTuesday, dowWednesday, dowThursday, dowFriday, dowSaturday, dowSunday, dowLocaleDefault)');
  Cl.AddTypeS('TOnGetMonthInfoEvent', 'procedure(Sender: TObject; Month: LongWord; var MonthBoldInfo: LongWord)');
  Cl.AddTypeS('TOnGetMonthBoldInfoEvent', 'procedure(Sender: TObject; Month: LongWord; Year: LongWord; var MonthBoldInfo: LongWord)');
  Cl.AddTypeS('TDate', 'TDateTime');
  Cl.AddTypeS('TTime', 'TDateTime');
  Cl.AddTypeS('TDateTimeKind', '(dtkDate, dtkTime)');
  Cl.AddTypeS('TDTDateMode', '(dmComboBox, dmUpDown)');
  Cl.AddTypeS('TDTDateFormat', '(dfShort, dfLong)');
  Cl.AddTypeS('TDTCalAlignment', '(dtaLeft, dtaRight)');
  Cl.AddTypeS('TDTParseInputEvent', 'procedure(Sender: TObject; const UserString: string; var DateAndTime: TDateTime; var AllowChange: Boolean)');
{$ENDIF}
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_stdctrls(Cl: TPSPascalCompiler);
begin
  SIRegister_StdCtrls_TypesAndConsts(Cl);
  {$IFNDEF PS_MINIVCL}
    SIRegisterTCUSTOMGROUPBOX(Cl);
    SIRegisterTGROUPBOX(Cl);
  {$ENDIF}
  SIRegisterTCUSTOMLABEL(Cl);
  SIRegisterTLABEL(Cl);
  SIRegisterTCUSTOMEDIT(Cl);
  SIRegisterTCUSTOMMASKEDIT(Cl);
  SIRegisterTEDIT(Cl);
  SIRegisterTCUSTOMMEMO(Cl);
  SIRegisterTMEMO(Cl);
  SIRegisterTCUSTOMCOMBOBOX(Cl);
  SIRegisterTCOMBOBOX(Cl);
  SIRegisterTBUTTONCONTROL(Cl);
  {$IFNDEF PS_MINIVCL}
    SIRegisterTIMAGEMARGINS(Cl);
    SIRegisterTCUSTOMBUTTON(Cl);
  {$ENDIF}
  SIRegisterTBUTTON(Cl);
  SIRegisterTCUSTOMCHECKBOX(Cl);
  SIRegisterTCHECKBOX(Cl);
  SIRegisterTRADIOBUTTON(Cl);
  SIRegisterTCUSTOMLISTBOX(Cl);
  SIRegisterTLISTBOX(Cl);
  {$IFNDEF PS_MINIVCL}
    SIRegisterTSCROLLBAR(Cl);
    { ComCtrls }
    SIRegisterTTRACKBAR(Cl);
    SIRegisterTCUSTOMUPDOWN(Cl);
    SIRegisterTUPDOWN(Cl);
    SIRegisterTCUSTOMHOTKEY(Cl);
    SIRegisterTHOTKEY(Cl);
    SIRegisterTLISTVIEW(Cl);
    SIRegisterTTSTATUSBAR(Cl);
    SIRegisterTTREEVIEW(Cl);
    SIRegisterTTAB(Cl);
    SIRegisterTHEADERCONTROL(Cl);
    { Date&Time }
    SIRegister_TMonthCalColors(Cl);
    SIRegister_TCommonCalendar(Cl);
    SIRegister_TMonthCalendar(Cl);
    SIRegister_TDateTimePicker(Cl);
  {$ENDIF}
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)
end.
