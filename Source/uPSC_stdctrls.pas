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

procedure SIRegister_StdCtrls_TypesAndConsts(cl: TPSPascalCompiler);

procedure SIRegisterTCUSTOMGROUPBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTGROUPBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMLABEL(Cl: TPSPascalCompiler);
procedure SIRegisterTLABEL(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMEDIT(Cl: TPSPascalCompiler);
procedure SIRegisterTEDIT(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMMEMO(Cl: TPSPascalCompiler);
procedure SIRegisterTMEMO(Cl: TPSPascalCompiler);
procedure SIRegisterTCUSTOMCOMBOBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTCOMBOBOX(Cl: TPSPascalCompiler);
procedure SIRegisterTBUTTONCONTROL(Cl: TPSPascalCompiler);
{$IFNDEF PS_MINIVCL}
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
  procedure SIRegisterTIMAGELIST(Cl: TPSPascalCompiler);
  procedure SIRegisterTCUSTOMIMAGELIST(Cl: TPSPascalCompiler);
  procedure SIRegisterTSTATUSBAR(Cl: TPSPascalCompiler);
  procedure SIRegisterTSTATUSPANELS(Cl: TPSPascalCompiler);
  procedure SIRegisterTSTATUSPANEL(Cl: TPSPascalCompiler);
  procedure SIRegister_TCustomListView(Cl: TPSPascalCompiler);
  procedure SIRegisterTICONOPTIONS(Cl: TPSPascalCompiler);
  procedure SIRegisterTLISTITEMS(Cl: TPSPascalCompiler);
  procedure SIRegisterTLISTITEM(Cl: TPSPascalCompiler);
  procedure SIRegisterTLISTCOLUMNS(Cl: TPSPascalCompiler);
  procedure SIRegisterTLISTCOLUMN(Cl: TPSPascalCompiler);
{$ENDIF}


procedure SIRegister_StdCtrls(cl: TPSPascalCompiler);
{$IFNDEF PS_MINIVCL}
  procedure SIRegister_TListView(Cl: TPSPascalCompiler);
  procedure SIRegister_StatusBar(Cl: TPSPascalCompiler);
{$ENDIF}

implementation

procedure SIRegisterTCUSTOMGROUPBOX(Cl: TPSPascalCompiler);
begin
  Cl.AddClassN(cl.FindClass('TCustomControl'), 'TCustomGroupBox');
end;


procedure SIRegisterTGROUPBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCustomGroupBox'), 'TGroupBox') do
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


procedure SIRegisterTCUSTOMLABEL(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TGraphicControl'), 'TCustomLabel') do
  begin
    {$IFNDEF PS_MINIVCL}
      {$IFNDEF CLX}
        RegisterProperty('Canvas', 'TCanvas', iptr);
      {$ENDIF}
    {$ENDIF}
  end;
end;


procedure SIRegisterTLABEL(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCustomLabel'), 'TLabel') do
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
      RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
      RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    {$ENDIF}
  end;
end;


procedure SIRegisterTCUSTOMEDIT(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TWinControl'), 'TCustomEdit') do
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


procedure SIRegisterTEDIT(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCustomEdit'), 'TEdit') do
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


procedure SIRegisterTCUSTOMMEMO(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCustomEdit'), 'TCustomMemo') do
  begin
    {$IFNDEF CLX}
      RegisterProperty('Lines', 'TStrings', iptrw);
    {$ENDIF}
  end;
end;


procedure SIRegisterTMEMO(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCustomMemo'), 'TMemo') do
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


procedure SIRegisterTCUSTOMCOMBOBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TWinControl'), 'TCustomComboBox') do
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


procedure SIRegisterTCOMBOBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCustomComboBox'), 'TComboBox') do
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
      RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
      RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
      RegisterProperty('OnDrawItem', 'TDrawItemEvent', iptrw);
      RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
      RegisterProperty('OnMeasureItem', 'TMeasureItemEvent', iptrw);
      RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
    {$ENDIF}
  end;
end;


procedure SIRegisterTBUTTONCONTROL(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TWinControl'), 'TButtonControl') do
  begin
    RegisterMethod('constructor Create(AOwner: TComponent)'); //
  end;
end;


{$IFNDEF PS_MINIVCL}
procedure SIRegisterTCUSTOMBUTTON(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TButtonControl'), 'TCustomButton') do
  begin
    RegisterMethod('constructor Create(AOwner: TComponent)'); //
    RegisterMethod('procedure Click');
//    RegisterMethod('function UseRightToLeftAlignment: Boolean');
//    RegisterProperty('Default', 'Boolean', iptrw);
//    RegisterProperty('DisabledImageIndex', 'TImageIndex', iptrw);
//    RegisterProperty('DropDownMenu', 'TPopupMenu', iptrw);
//    RegisterProperty('ElevationRequired', 'Boolean', iptrw);
//    RegisterProperty('HotImageIndex', 'TImageIndex', iptrw);
//    RegisterProperty('ModalResult', 'LongInt', iptrw);
//    RegisterProperty('OnDropDownClick', 'TNotifyEvent', iptrw);
//    RegisterProperty('PressedImageIndex', 'TImageIndex', iptrw);
//    RegisterProperty('SelectedImageIndex', 'TImageIndex', iptrw);
//    RegisterProperty('StylusHotImageIndex', 'TImageIndex', iptrw);
//    RegisterProperty('ImageIndex', 'TImageIndex', iptrw);
//    RegisterProperty('Images', 'TCustomImageList', iptrw);
//    RegisterProperty('ImageAlignment', 'TImageAlignment', iptrw);
//    RegisterProperty('ImageMargins', 'TImageMargins', iptrw);
//    RegisterProperty('Style', 'TButtonStyle', iptrw);

  end;
end;
{$ENDIF}


procedure SIRegisterTBUTTON(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TButtonControl'),  'TButton') do
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
      RegisterProperty('DragCursor', 'LongInt', iptrw);
      RegisterProperty('DragMode', 'TDragMode', iptrw);
      RegisterProperty('ParentShowHint', 'Boolean', iptrw);
      RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
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


procedure SIRegisterTCUSTOMCHECKBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TButtonControl'), 'TCustomCheckBox') do
  begin
  end;
end;


procedure SIRegisterTCHECKBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCustomCheckBox'), 'TCheckBox') do
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


procedure SIRegisterTRADIOBUTTON(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TButtonControl'), 'TRadioButton') do
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


procedure SIRegisterTCUSTOMLISTBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TWinControl'), 'TCustomListBox') do
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


procedure SIRegisterTLISTBOX(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCustomListBox'), 'TListBox') do
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


procedure SIRegisterTSCROLLBAR(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TWinControl'), 'TScrollBar') do
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
{ TTrackBar }
procedure SIRegisterTTRACKBAR(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TWinControl'), 'TTrackBar') do
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
    RegisterProperty('TickMarks', 'TTickMark', iptrw);
    RegisterProperty('TickStyle', 'TTickStyle', iptrw);
    RegisterProperty('OnDragDrop', 'TDragDropEvent', iptrw);
    RegisterProperty('OnDragOver', 'TDragOverEvent', iptrw);
    RegisterProperty('OnEndDrag', 'TEndDragEvent', iptrw);
    RegisterProperty('OnKeyDown', 'TKeyEvent', iptrw);
    RegisterProperty('OnKeyPress', 'TKeyPressEvent', iptrw);
    RegisterProperty('OnKeyUp', 'TKeyEvent', iptrw);
    RegisterProperty('OnStartDrag', 'TStartDragEvent', iptrw);
  end;
end;


{ TUpDown }
procedure SIRegisterTCUSTOMUPDOWN(Cl: TPSPascalCompiler);
begin
  Cl.AddClassN(cl.FindClass('TWinControl'), 'TCustomUpDown');
end;

procedure SIRegisterTUPDOWN(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCustomUpDown'),'TUpDown') do
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


{ THotKey }
procedure SIRegisterTCUSTOMHOTKEY(Cl: TPSPascalCompiler);
begin
  Cl.AddClassN(cl.FindClass('TWinControl'), 'TCustomHotKey');
end;

procedure SIRegisterTHOTKEY(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TCustomHotKey'),'THotKey') do
  begin
    {$IFDEF DELPHI4UP}
      RegisterProperty('Anchors', 'TAnchors', iptrw);
    {$ENDIF}
    RegisterProperty('AutoSize', 'Boolean', iptrw);
    RegisterProperty('HotKey', 'TShortCut', iptrw);
    RegisterProperty('InvalidKeys', 'THKInvalidKeys', iptrw);
    RegisterProperty('Modifiers', 'THKModifiers', iptrw);
    RegisterProperty('PopupMenu', 'TPopupMenu', iptrw);
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


{ TImageList }
procedure SIRegisterTIMAGELIST(Cl: TPSPascalCompiler);
begin
  Cl.AddClassN(Cl.FindClass('TCustomImageList'),'TImageList');
end;

procedure SIRegisterTCUSTOMIMAGELIST(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TComponent'),'TCustomImageList') do
  begin
    RegisterMethod('Constructor CreateSize( AWidth, AHeight : Integer)');
    RegisterMethod('Function Add( Image, Mask : TBitmap) : Integer');
    RegisterMethod('Function AddIcon( Image : TIcon) : Integer');
    RegisterMethod('Procedure AddImages( Value : TCustomImageList)');
    RegisterMethod('Function AddMasked( Image : TBitmap; MaskColor : TColor) : Integer');
    //RegisterMethod('Function BeginDrag( Window : HWND; X, Y : Integer) : Boolean');
    RegisterMethod('Procedure Clear');
    RegisterMethod('Procedure Delete( Index : Integer)');
    //RegisterMethod('Function DragLock( Window : HWND; XPos, YPos : Integer) : Boolean');
    //RegisterMethod('Function DragMove( X, Y : Integer) : Boolean');
    //RegisterMethod('Procedure DragUnlock');
    RegisterMethod('Procedure Draw( Canvas : TCanvas; X, Y, Index : Integer)');
    RegisterMethod('Procedure DrawOverlay( Canvas : TCanvas; X, Y : Integer; ImageIndex : Integer; Overlay : TOverlay)');
    //RegisterMethod('Function EndDrag : Boolean');
    RegisterMethod('Function FileLoad( ResType : TResType; Name : string; MaskColor : TColor) : Boolean');
    RegisterMethod('Procedure GetBitmap( Index : Integer; Image : TBitmap)');
    RegisterMethod('Function GetHotSpot : TPoint');
    RegisterMethod('Procedure GetIcon( Index : Integer; Image : TIcon)');
    RegisterMethod('Function GetImageBitmap : HBITMAP');
    RegisterMethod('Function GetMaskBitmap : HBITMAP');
    RegisterMethod('Function GetResource( ResType : TResType; Name : string; Width : Integer; LoadFlags : TLoadResources; MaskColor : TColor) : Boolean');
    RegisterMethod('Function GetInstRes( Instance : THandle; ResType : TResType; Name : string; Width : Integer; LoadFlags : TLoadResources; MaskColor : TColor) : Boolean');
    RegisterMethod('Function HandleAllocated : Boolean');
    //RegisterMethod('Procedure HideDragImage');
    RegisterMethod('Procedure Insert( Index : Integer; Image, Mask : TBitmap)');
    RegisterMethod('Procedure InsertIcon( Index : Integer; Image : TIcon)');
    RegisterMethod('Procedure InsertMasked( Index : Integer; Image : TBitmap; MaskColor : TColor)');
    RegisterMethod('Procedure Move( CurIndex, NewIndex : Integer)');
    RegisterMethod('Function Overlay( ImageIndex : Integer; Overlay : TOverlay) : Boolean');
    RegisterMethod('Procedure RegisterChanges( Value : TChangeLink)');
    RegisterMethod('Function ResourceLoad( ResType : TResType; Name : string; MaskColor : TColor) : Boolean');
    RegisterMethod('Function ResInstLoad( Instance : THandle; ResType : TResType; Name : string; MaskColor : TColor) : Boolean');
    RegisterMethod('Procedure Replace( Index : Integer; Image, Mask : TBitmap)');
    RegisterMethod('Procedure ReplaceIcon( Index : Integer; Image : TIcon)');
    RegisterMethod('Procedure ReplaceMasked( Index : Integer; NewImage : TBitmap; MaskColor : TColor)');
    //RegisterMethod('Function SetDragImage( Index, HotSpotX, HotSpotY : Integer) : Boolean');
    //RegisterMethod('Procedure ShowDragImage');
    RegisterMethod('Procedure UnRegisterChanges( Value : TChangeLink)');
    RegisterProperty('Count', 'Integer', iptr);
    //RegisterProperty('DragCursor', 'TCursor', iptrw);
    //RegisterProperty('Dragging', 'Boolean', iptr);
    RegisterProperty('Handle', 'LongInt', iptrw);
    RegisterProperty('ColorDepth', 'TColorDepth', iptrw);
  end;
end;


{ TStatusBar }
procedure SIRegisterTSTATUSBAR(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TWinControl'),'TStatusBar') do
  begin
    RegisterProperty('Canvas', 'TCanvas', iptr);
    RegisterProperty('Panels', 'TStatusPanels', iptrw);
    RegisterProperty('SimplePanel', 'Boolean', iptrw);
    RegisterProperty('SimpleText', 'string', iptrw);
    RegisterProperty('SizeGrip', 'Boolean', iptrw);
    //RegisterProperty('OnDrawPanel', 'TDrawPanelEvent', iptrw);
    RegisterProperty('OnResize', 'TNotifyEvent', iptrw);
  end;
end;

procedure SIRegisterTSTATUSPANELS(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCollection'),'TStatusPanels') do
  begin
    RegisterMethod('Constructor Create( StatusBar : TStatusBar)');
    RegisterMethod('Function Add : TStatusPanel');
    RegisterProperty('Items', 'TStatusPanel Integer', iptrw);
    SetDefaultPropery('Items');
  end;
end;

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


{ TListView }
procedure SIRegister_TCustomListView(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TWinControl'),'TCustomListView') do
  begin
    RegisterMethod('Function AlphaSort : Boolean');
    RegisterMethod('Procedure Arrange( Code : TListArrangement)');
    RegisterMethod('Function FindCaption( StartIndex : Integer; Value : string; Partial, Inclusive, Wrap : Boolean) : TListItem');
    RegisterMethod('Function FindData( StartIndex : Integer; Value : Pointer; Inclusive, Wrap : Boolean) : TListItem');
    RegisterMethod('Function GetItemAt( X, Y : Integer) : TListItem');
    RegisterMethod('Function GetNearestItem( Point : TPoint; Direction : TSearchDirection) : TListItem');
    RegisterMethod('Function GetNextItem( StartItem : TListItem; Direction : TSearchDirection; States : TItemStates) : TListItem');
    RegisterMethod('Function GetSearchString : string');
    RegisterMethod('Function IsEditing : Boolean');
    RegisterMethod('Procedure Scroll( DX, DY : Integer)');
    RegisterProperty('Checkboxes', 'Boolean', iptrw);
    RegisterProperty('Column', 'TListColumn Integer', iptr);
    RegisterProperty('DropTarget', 'TListItem', iptrw);
    RegisterProperty('GridLines', 'Boolean', iptrw);
    RegisterProperty('HotTrack', 'Boolean', iptrw);
    RegisterProperty('ItemFocused', 'TListItem', iptrw);
    RegisterProperty('RowSelect', 'Boolean', iptrw);
    RegisterProperty('SelCount', 'Integer', iptr);
    RegisterProperty('Selected', 'TListItem', iptrw);
    RegisterMethod('Function CustomSort( SortProc : TLVCompare; lParam : Longint) : Boolean');
    RegisterMethod('Function StringWidth( S : string) : Integer');
    RegisterMethod('Procedure UpdateItems( FirstIndex, LastIndex : Integer)');
    RegisterProperty('TopItem', 'TListItem', iptr);
    RegisterProperty('ViewOrigin', 'TPoint', iptr);
    RegisterProperty('VisibleRowCount', 'Integer', iptr);
    RegisterProperty('BoundingRect', 'TRect', iptr);
  end;
end;

procedure SIRegisterTICONOPTIONS(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TPersistent'),'TIconOptions') do
  begin
    RegisterMethod('Constructor Create( AOwner : TCustomListView)');
    RegisterProperty('Arrangement', 'TIconArrangement', iptrw);
    RegisterProperty('AutoArrange', 'Boolean', iptrw);
    RegisterProperty('WrapText', 'Boolean', iptrw);
  end;
end;

procedure SIRegisterTLISTITEMS(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TPersistent'),'TListItems') do
  begin
    RegisterMethod('Constructor Create( AOwner : TCustomListView)');
    RegisterMethod('Function Add : TListItem');
    RegisterMethod('Procedure BeginUpdate');
    RegisterMethod('Procedure Clear');
    RegisterMethod('Procedure Delete( Index : Integer)');
    RegisterMethod('Procedure EndUpdate');
    RegisterMethod('Function IndexOf( Value : TListItem) : Integer');
    RegisterMethod('Function Insert( Index : Integer) : TListItem');
    RegisterProperty('Count', 'Integer', iptr);
    RegisterProperty('Handle', 'LongInt', iptr);
    RegisterProperty('Item', 'TListItem Integer', iptrw);
    RegisterProperty('Owner', 'TCustomListView', iptr);
  end;
end;

procedure SIRegisterTLISTITEM(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TPersistent'),'TListItem') do
  begin
    RegisterMethod('Constructor Create( AOwner : TListItems)');
    RegisterMethod('Procedure CancelEdit');
    RegisterMethod('Procedure Delete');
    RegisterMethod('Function DisplayRect( Code : TDisplayCode) : TRect');
    RegisterMethod('Function EditCaption : Boolean');
    RegisterMethod('Function GetPosition : TPoint');
    RegisterMethod('Procedure MakeVisible( PartialOK : Boolean)');
    RegisterMethod('Procedure Update');
    RegisterMethod('Procedure SetPosition( const Value : TPoint)');
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

procedure SIRegisterTLISTCOLUMNS(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCollection'),'TListColumns') do
  begin
    RegisterMethod('Constructor Create( AOwner : TCustomListView)');
    RegisterMethod('Function Add : TListColumn');
    RegisterProperty('Owner', 'TCustomListView', iptr);
    RegisterProperty('Items', 'TListColumn Integer', iptrw);
  end;
end;

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
{$ENDIF}

procedure SIRegister_StdCtrls_TypesAndConsts(cl: TPSPascalCompiler);
begin
  cl.AddTypeS('TEditCharCase', '(ecNormal, ecUpperCase, ecLowerCase)');
  cl.AddTypeS('TScrollStyle', '(ssNone, ssHorizontal, ssVertical, ssBoth)');
  cl.AddTypeS('TComboBoxStyle', '(csDropDown, csSimple, csDropDownList, csOwnerDrawFixed, csOwnerDrawVariable)');
  cl.AddTypeS('TMeasureItemEvent', 'procedure(Control: TWinControl; Index: Integer; var Height: Integer)');
  cl.AddTypeS('TCheckBoxState', '(cbUnchecked, cbChecked, cbGrayed)');
  cl.AddTypeS('TListBoxStyle', '(lbStandard, lbOwnerDrawFixed, lbOwnerDrawVariable)');
  cl.AddTypeS('TScrollCode', '(scLineUp, scLineDown, scPageUp, scPageDown, scPosition, scTrack, scTop, scBottom, scEndScroll)');
  cl.AddTypeS('TScrollEvent', 'procedure(Sender: TObject; ScrollCode: TScrollCode; var ScrollPos: Integer)');

  cl.addTypeS('TEOwnerDrawState', '(odSelected, odGrayed, odDisabled, odChecked, odFocused, odDefault, odHotLight, odInactive, odNoAccel, odNoFocusRect, odReserved1, odReserved2, odComboBoxEdit)');

  cl.AddTypeS('TTextLayout', '(tlTop, tlCenter, tlBottom)');
  cl.AddTypeS('TOwnerDrawState', 'set of TEOwnerDrawState');
  cl.AddTypeS('TDrawItemEvent', 'procedure(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState)');

{$IFNDEF PS_MINIVCL}
  { TTrackBar }
  cl.AddTypeS('TTrackBarOrientation', '(trHorizontal, trVertical)');
  cl.AddTypeS('TTickMark', '(tmBottomRight, tmTopLeft, tmBoth)');
  cl.AddTypeS('TTickStyle', '(tsNone, tsAuto, tsManual)');
  { TUpDown }
  cl.AddTypeS('TUDAlignButton', '(udLeft, udRight)');
  cl.AddTypeS('TUDOrientation', '(udHorizontal, udVertical)');
  cl.AddTypeS('TUDBtnType', '(btNext, btPrev)');
  cl.AddTypeS('TUpDownDirection', '(updNone, updUp, updDown)');
  cl.AddTypeS('TUDClickEvent', 'procedure (Sender: TObject; Button: TUDBtnType)');
  cl.AddTypeS('TUDChangingEvent', 'procedure (Sender: TObject; var AllowChange: Boolean)');
  cl.AddTypeS('TUDChangingEventEx', 'procedure (Sender: TObject; var AllowChange: Boolean; NewValue: Integer; Direction: TUpDownDirection)');
  { THotKey }
  cl.AddTypeS('THKModifier', '(hkShift, hkCtrl, hkAlt, hkExt)');
  cl.AddTypeS('THKModifiers', 'set of THKModifier');
  cl.AddTypeS('THKInvalidKey', '(hcNone, hcShift, hcCtrl, hcAlt, hcShiftCtrl, hcShiftAlt, hcCtrlAlt, hcShiftCtrlAlt)');
  cl.AddTypeS('THKInvalidKeys', 'set of THKInvalidKey');
  cl.addTypeS('TShortCut', 'Word');
  { TImageList }
  cl.AddTypeS('TDrawingStyle', '( dsFocus, dsSelected, dsNormal, dsTransparent )');
  cl.AddTypeS('TImageType', '( itImage, itMask )');
  cl.AddTypeS('TResType', '( rtBitmap, rtCursor, rtIcon )');
  cl.AddTypeS('TOverlay', 'Integer');
  cl.AddTypeS('TLoadResource', '( lrDefaultColor, lrDefaultSize, lrFromFile, lrMap3DColors, lrTransparent, lrMonoChrome )');
  cl.AddTypeS('TLoadResources', 'set of TLoadResource');
  cl.AddTypeS('TColorDepth', '( cdDefault, cdDeviceDependent, cd4Bit, cd8Bit, cd16Bit, cd24Bit, cd32Bit )');
  cl.AddTypeS('TImageIndex', 'Integer');
{$ENDIF}
end;


procedure SIRegister_stdctrls(cl: TPSPascalCompiler);
begin
  SIRegister_StdCtrls_TypesAndConsts(cl);
  {$IFNDEF PS_MINIVCL}
    SIRegisterTCUSTOMGROUPBOX(Cl);
    SIRegisterTGROUPBOX(Cl);
  {$ENDIF}
  SIRegisterTCUSTOMLABEL(Cl);
  SIRegisterTLABEL(Cl);
  SIRegisterTCUSTOMEDIT(Cl);
  SIRegisterTEDIT(Cl);
  SIRegisterTCUSTOMMEMO(Cl);
  SIRegisterTMEMO(Cl);
  SIRegisterTCUSTOMCOMBOBOX(Cl);
  SIRegisterTCOMBOBOX(Cl);
  SIRegisterTBUTTONCONTROL(Cl);
  {$IFNDEF PS_MINIVCL}
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
    SIRegisterTCUSTOMIMAGELIST(Cl);
    SIRegisterTIMAGELIST(Cl);
  {$ENDIF}
end;

{$IFNDEF PS_MINIVCL}
{ Register TListView }
procedure SIRegister_TListView(Cl: TPSPascalCompiler);
begin
  SIRegisterTLISTCOLUMN(Cl);
  SIRegisterTLISTCOLUMNS(Cl);
  Cl.AddTypeS('TDisplayCode', '( drBounds, drIcon, drLabel, drSelectBounds )');
  SIRegisterTLISTITEM(Cl);
  SIRegisterTLISTITEMS(Cl);
  Cl.AddTypeS('TIconArrangement', '( iaTop, iaLeft )');
  SIRegisterTICONOPTIONS(Cl);
  Cl.AddTypeS('TListArrangement', '( arAlignBottom, arAlignLeft, arAlignRight, arAlignTop, arDefault, arSnapToGrid )');
  Cl.AddTypeS('TViewStyle', '( vsIcon, vsSmallIcon, vsList, vsReport )');
  Cl.AddTypeS('TItemState', '( isNone, isCut, isDropHilited, isFocused, isSelected )');
  Cl.AddTypeS('TItemStates', 'set of TItemState');
  Cl.AddTypeS('TItemChange', '( ctText, ctImage, ctState )');
  Cl.AddTypeS('TLVDeletedEvent', 'Procedure ( Sender : TObject; Item : TListItem)');
  Cl.AddTypeS('TLVEditingEvent', 'Procedure ( Sender : TObject; Item : TListItem; var AllowEdit : Boolean)');
  Cl.AddTypeS('TLVEditedEvent', 'Procedure ( Sender : TObject; Item : TListItem; var S : string)');
  Cl.AddTypeS('TLVChangeEvent', 'Procedure ( Sender : TObject; Item : TListItem; Change : TItemChange)');
  Cl.AddTypeS('TLVChangingEvent', 'Procedure ( Sender : TObject; Item : TListItem; Change : TItemChange; var AllowChange : Boolean)');
  Cl.AddTypeS('TLVColumnClickEvent', 'Procedure ( Sender : TObject; Column : TListColumn)');
  Cl.AddTypeS('TLVCompareEvent', 'Procedure ( Sender : TObject; Item1, Item2 : TListItem; Data : Integer; var Compare : Integer)');
  Cl.AddTypeS('TSearchDirection', '( sdLeft, sdRight, sdAbove, sdBelow, sdAll )');
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
      RegisterProperty('OnMouseEnter', 'TNotifyEvent', iptrw);
      RegisterProperty('OnMouseLeave', 'TNotifyEvent', iptrw);
    end;
end;

{ Register TStatusBar }
procedure SIRegister_StatusBar(Cl: TPSPascalCompiler);
begin
  Cl.AddTypeS('TStatusPanelStyle', '( psText, psOwnerDraw )');
  Cl.AddTypeS('TStatusPanelBevel', '( pbNone, pbLowered, pbRaised )');
  SIRegisterTSTATUSPANEL(Cl);
  SIRegisterTSTATUSPANELS(Cl);
  SIRegisterTSTATUSBAR(Cl);
  Cl.AddTypeS('TDrawPanelEvent', 'procedure(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect)');
  with Cl.FindClass('TStatusBar') do RegisterProperty('OnDrawPanel', 'TDrawPanelEvent', iptrw);
end;
{$ENDIF}

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)

end.