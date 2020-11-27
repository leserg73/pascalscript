{ STDCtrls import unit }
unit uPSR_stdctrls;

{$I PascalScript.inc}
interface
uses
  uPSRuntime, uPSUtils;


procedure RIRegisterTCUSTOMGROUPBOX(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTGROUPBOX(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTCUSTOMLABEL(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTLABEL(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTCUSTOMEDIT(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTEDIT(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTCUSTOMMEMO(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTMEMO(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTCUSTOMCOMBOBOX(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTCOMBOBOX(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTBUTTONCONTROL(Cl: TPSRuntimeClassImporter);
{$IFNDEF PS_MINIVCL}
  procedure RIRegisterTCUSTOMBUTTON(Cl: TPSRuntimeClassImporter);
{$ENDIF}
procedure RIRegisterTBUTTON(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTCUSTOMCHECKBOX(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTCHECKBOX(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTRADIOBUTTON(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTCUSTOMLISTBOX(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTLISTBOX(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTSCROLLBAR(Cl: TPSRuntimeClassImporter);

{ ComCtrls }
{$IFNDEF PS_MINIVCL}
  procedure RIRegisterTTRACKBAR(Cl: TPSRuntimeClassImporter);
  procedure RIRegisterTCUSTOMUPDOWN(Cl: TPSRuntimeClassImporter);
  procedure RIRegisterTUPDOWN(Cl: TPSRuntimeClassImporter);
  procedure RIRegisterTCUSTOMHOTKEY(Cl: TPSRuntimeClassImporter);
  procedure RIRegisterTHOTKEY(Cl: TPSRuntimeClassImporter);
  procedure RIRegisterTIMAGELIST(Cl: TPSRuntimeClassImporter);
  procedure RIRegisterTCUSTOMIMAGELIST(Cl: TPSRuntimeClassImporter);
  procedure RIRegisterTSTATUSBAR(Cl: TPSRuntimeClassImporter);
  procedure RIRegisterTSTATUSPANELS(Cl: TPSRuntimeClassImporter);
  procedure RIRegisterTSTATUSPANEL(Cl: TPSRuntimeClassImporter);
  procedure RIRegisterTCUSTOMLISTVIEW(Cl: TPSRuntimeClassImporter);
  procedure RIRegisterTICONOPTIONS(Cl: TPSRuntimeClassImporter);
  procedure RIRegisterTLISTITEMS(Cl: TPSRuntimeClassImporter);
  procedure RIRegisterTLISTITEM(Cl: TPSRuntimeClassImporter);
  procedure RIRegisterTLISTCOLUMNS(Cl: TPSRuntimeClassImporter);
  procedure RIRegisterTLISTCOLUMN(Cl: TPSRuntimeClassImporter);
{$ENDIF}

procedure RIRegister_stdctrls(cl: TPSRuntimeClassImporter);

{$IFNDEF PS_MINIVCL}
  procedure RIRegister_TListView(Cl: TPSRuntimeClassImporter);
  procedure RIRegister_StatusBar(Cl: TPSRuntimeClassImporter);
{$ENDIF}

implementation
uses
  sysutils, classes{$IFDEF CLX}, QControls, QStdCtrls, QGraphics{$ELSE}, controls, stdctrls, {$IFNDEF PS_MINIVCL}ComCtrls, ImgList, Windows, {$ENDIF} Graphics{$ENDIF}{$IFDEF FPC}, buttons{$ENDIF};

procedure RIRegisterTCUSTOMGROUPBOX(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TCUSTOMGROUPBOX);
end;


procedure RIRegisterTGROUPBOX(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TGROUPBOX);
end;


{$IFNDEF CLX}
  procedure TCUSTOMLABELCANVAS_R(Self: TCUSTOMLABEL; var T: TCanvas); begin T := Self.CANVAS; end;
{$ENDIF}


procedure RIRegisterTCUSTOMLABEL(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCUSTOMLABEL) do
  begin
    {$IFNDEF PS_MINIVCL}
      {$IFNDEF CLX}
        RegisterPropertyHelper(@TCUSTOMLABELCANVAS_R, nil, 'Canvas');
      {$ENDIF}
    {$ENDIF}
  end;
end;


procedure RIRegisterTLABEL(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TLABEL);
end;


procedure TCUSTOMEDITMODIFIED_R(Self: TCUSTOMEDIT; var T: BOOLEAN); begin T := Self.MODIFIED; end;
procedure TCUSTOMEDITMODIFIED_W(Self: TCUSTOMEDIT; T: BOOLEAN); begin Self.MODIFIED := T; end;
procedure TCUSTOMEDITSELLENGTH_R(Self: TCUSTOMEDIT; var T: INTEGER); begin T := Self.SELLENGTH; end;
procedure TCUSTOMEDITSELLENGTH_W(Self: TCUSTOMEDIT; T: INTEGER); begin Self.SELLENGTH := T; end;
procedure TCUSTOMEDITSELSTART_R(Self: TCUSTOMEDIT; var T: INTEGER); begin T := Self.SELSTART; end;
procedure TCUSTOMEDITSELSTART_W(Self: TCUSTOMEDIT; T: INTEGER); begin Self.SELSTART := T; end;
procedure TCUSTOMEDITSELTEXT_R(Self: TCUSTOMEDIT; var T: STRING); begin T := Self.SELTEXT; end;
procedure TCUSTOMEDITSELTEXT_W(Self: TCUSTOMEDIT; T: STRING); begin Self.SELTEXT := T; end;
procedure TCUSTOMEDITTEXT_R(Self: TCUSTOMEDIT; var T: string); begin T := Self.TEXT; end;
procedure TCUSTOMEDITTEXT_W(Self: TCUSTOMEDIT; T: string); begin Self.TEXT := T; end;


procedure RIRegisterTCUSTOMEDIT(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCUSTOMEDIT) do
  begin
    RegisterMethod(@TCUSTOMEDIT.CLEAR, 'Clear');
    RegisterMethod(@TCUSTOMEDIT.CLEARSELECTION, 'ClearSelection');
    RegisterMethod(@TCUSTOMEDIT.SELECTALL, 'SelectAll');
    RegisterPropertyHelper(@TCUSTOMEDITMODIFIED_R, @TCUSTOMEDITMODIFIED_W, 'Modified');
    RegisterPropertyHelper(@TCUSTOMEDITSELLENGTH_R, @TCUSTOMEDITSELLENGTH_W, 'SelLength');
    RegisterPropertyHelper(@TCUSTOMEDITSELSTART_R, @TCUSTOMEDITSELSTART_W, 'SelStart');
    RegisterPropertyHelper(@TCUSTOMEDITSELTEXT_R, @TCUSTOMEDITSELTEXT_W, 'SelText');
    RegisterPropertyHelper(@TCUSTOMEDITTEXT_R, @TCUSTOMEDITTEXT_W, 'Text');

    {$IFNDEF PS_MINIVCL}
      RegisterMethod(@TCUSTOMEDIT.COPYTOCLIPBOARD, 'CopyToClipboard');
      RegisterMethod(@TCUSTOMEDIT.CUTTOCLIPBOARD, 'CutToClipboard');
      RegisterMethod(@TCUSTOMEDIT.PASTEFROMCLIPBOARD, 'PasteFromClipboard');
      {$IFNDEF FPC}
        RegisterMethod(@TCUSTOMEDIT.GETSELTEXTBUF, 'GetSelTextBuf');
        RegisterMethod(@TCUSTOMEDIT.SETSELTEXTBUF, 'SetSelTextBuf');
      {$ENDIF}{FPC}
    {$ENDIF}
  end;
end;


procedure RIRegisterTEDIT(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TEDIT);
end;


procedure TCUSTOMMEMOLINES_R(Self: {$IFDEF CLX}TMemo{$ELSE}TCUSTOMMEMO{$ENDIF}; var T: TSTRINGS); begin T := Self.LINES; end;
procedure TCUSTOMMEMOLINES_W(Self: {$IFDEF CLX}TMemo{$ELSE}TCUSTOMMEMO{$ENDIF}; T: TSTRINGS); begin Self.LINES := T; end;


procedure RIRegisterTCUSTOMMEMO(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCUSTOMMEMO) do
  begin
    {$IFNDEF CLX}
      RegisterPropertyHelper(@TCUSTOMMEMOLINES_R, @TCUSTOMMEMOLINES_W, 'Lines');
    {$ENDIF}
  end;
end;


procedure RIRegisterTMEMO(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TMEMO) do
  begin
    {$IFDEF CLX}
      RegisterPropertyHelper(@TCUSTOMMEMOLINES_R, @TCUSTOMMEMOLINES_W, 'Lines');
    {$ENDIF}
  end;
end;


procedure TCUSTOMCOMBOBOXCANVAS_R(Self: TCUSTOMCOMBOBOX; var T: TCANVAS); begin T := Self.CANVAS; end;
procedure TCUSTOMCOMBOBOXDROPPEDDOWN_R(Self: TCUSTOMCOMBOBOX; var T: BOOLEAN); begin T := Self.DROPPEDDOWN; end;
procedure TCUSTOMCOMBOBOXDROPPEDDOWN_W(Self: TCUSTOMCOMBOBOX; T: BOOLEAN); begin Self.DROPPEDDOWN := T; end;
procedure TCUSTOMCOMBOBOXITEMS_R(Self: TCUSTOMCOMBOBOX; var T: TSTRINGS); begin T := Self.ITEMS; end;
procedure TCUSTOMCOMBOBOXITEMS_W(Self: TCUSTOMCOMBOBOX; T: TSTRINGS); begin Self.ITEMS := T; end;
procedure TCUSTOMCOMBOBOXITEMINDEX_R(Self: TCUSTOMCOMBOBOX; var T: INTEGER); begin T := Self.ITEMINDEX; end;
procedure TCUSTOMCOMBOBOXITEMINDEX_W(Self: TCUSTOMCOMBOBOX; T: INTEGER); begin Self.ITEMINDEX := T; end;
procedure TCUSTOMCOMBOBOXSELLENGTH_R(Self: TCUSTOMCOMBOBOX; var T: INTEGER); begin T := Self.SELLENGTH; end;
procedure TCUSTOMCOMBOBOXSELLENGTH_W(Self: TCUSTOMCOMBOBOX; T: INTEGER); begin Self.SELLENGTH := T; end;
procedure TCUSTOMCOMBOBOXSELSTART_R(Self: TCUSTOMCOMBOBOX; var T: INTEGER); begin T := Self.SELSTART; end;
procedure TCUSTOMCOMBOBOXSELSTART_W(Self: TCUSTOMCOMBOBOX; T: INTEGER); begin Self.SELSTART := T; end;
procedure TCUSTOMCOMBOBOXSELTEXT_R(Self: TCUSTOMCOMBOBOX; var T: STRING); begin T := Self.SELTEXT; end;
procedure TCUSTOMCOMBOBOXSELTEXT_W(Self: TCUSTOMCOMBOBOX; T: STRING); begin Self.SELTEXT := T; end;


procedure RIRegisterTCUSTOMCOMBOBOX(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCUSTOMCOMBOBOX) do
  begin
    RegisterPropertyHelper(@TCUSTOMCOMBOBOXDROPPEDDOWN_R, @TCUSTOMCOMBOBOXDROPPEDDOWN_W, 'DroppedDown');
    RegisterPropertyHelper(@TCUSTOMCOMBOBOXITEMS_R, @TCUSTOMCOMBOBOXITEMS_W, 'Items');
    RegisterPropertyHelper(@TCUSTOMCOMBOBOXITEMINDEX_R, @TCUSTOMCOMBOBOXITEMINDEX_W, 'ItemIndex');

    {$IFNDEF PS_MINIVCL}
      RegisterMethod(@TCUSTOMCOMBOBOX.CLEAR, 'Clear');
      RegisterMethod(@TCUSTOMCOMBOBOX.SELECTALL, 'SelectAll');
      RegisterPropertyHelper(@TCUSTOMCOMBOBOXCANVAS_R, nil, 'Canvas');
      RegisterPropertyHelper(@TCUSTOMCOMBOBOXSELLENGTH_R, @TCUSTOMCOMBOBOXSELLENGTH_W, 'SelLength');
      RegisterPropertyHelper(@TCUSTOMCOMBOBOXSELSTART_R, @TCUSTOMCOMBOBOXSELSTART_W, 'SelStart');
      RegisterPropertyHelper(@TCUSTOMCOMBOBOXSELTEXT_R, @TCUSTOMCOMBOBOXSELTEXT_W, 'SelText');
    {$ENDIF}
  end;
end;


procedure RIRegisterTCOMBOBOX(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TCOMBOBOX);
end;


procedure RIRegisterTBUTTONCONTROL(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TBUTTONCONTROL) do
  begin
    {$IFDEF DELPHI4UP}
      RegisterVirtualConstructor(@TBUTTONCONTROL.CREATE, 'Create');
    {$ELSE}
      RegisterConstructor(@TBUTTONCONTROL.CREATE, 'Create');
    {$ENDIF}
  end;
end;


{$IFNDEF PS_MINIVCL}
procedure RIRegisterTCUSTOMBUTTON(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCUSTOMBUTTON) do
  begin
    {$IFDEF DELPHI4UP}
      RegisterVirtualConstructor(@TCUSTOMBUTTON.CREATE, 'Create');
    {$ELSE}
      RegisterConstructor(@TCUSTOMBUTTON.CREATE, 'Create');
    {$ENDIF}
    RegisterMethod(@TCUSTOMBUTTON.CLICK, 'Click');
//    RegisterMethod(@TCUSTOMBUTTON.USERIGHTTOLEFTALIGNMENT, 'UseRightToLeftAlignment');
  end;
end;
{$ENDIF}


procedure RIRegisterTBUTTON(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TBUTTON) do
  begin
    {$IFNDEF PS_MINIVCL}
      RegisterMethod(@TBUTTON.CLICK, 'Click');
    {$ENDIF}
  end;
end;


procedure RIRegisterTCUSTOMCHECKBOX(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TCUSTOMCHECKBOX);
end;


procedure RIRegisterTCHECKBOX(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TCHECKBOX);
end;


procedure RIRegisterTRADIOBUTTON(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TRADIOBUTTON);
end;


procedure TCUSTOMLISTBOXCANVAS_R(Self: TCUSTOMLISTBOX; var T: TCANVAS); begin T := Self.CANVAS; end;
procedure TCUSTOMLISTBOXITEMS_R(Self: TCUSTOMLISTBOX; var T: TSTRINGS); begin T := Self.ITEMS; end;
procedure TCUSTOMLISTBOXITEMS_W(Self: TCUSTOMLISTBOX; T: TSTRINGS); begin Self.ITEMS := T; end;
procedure TCUSTOMLISTBOXITEMINDEX_R(Self: TCUSTOMLISTBOX; var T: INTEGER); begin T := Self.ITEMINDEX; end;
procedure TCUSTOMLISTBOXITEMINDEX_W(Self: TCUSTOMLISTBOX; T: INTEGER); begin Self.ITEMINDEX := T; end;
procedure TCUSTOMLISTBOXSELCOUNT_R(Self: TCUSTOMLISTBOX; var T: INTEGER); begin T := Self.SELCOUNT; end;
procedure TCUSTOMLISTBOXSELECTED_R(Self: TCUSTOMLISTBOX; var T: BOOLEAN; t1: INTEGER); begin T := Self.SELECTED[t1]; end;
procedure TCUSTOMLISTBOXSELECTED_W(Self: TCUSTOMLISTBOX; T: BOOLEAN; t1: INTEGER); begin Self.SELECTED[t1] := T; end;
procedure TCUSTOMLISTBOXTOPINDEX_R(Self: TCUSTOMLISTBOX; var T: INTEGER); begin T := Self.TOPINDEX; end;
procedure TCUSTOMLISTBOXTOPINDEX_W(Self: TCUSTOMLISTBOX; T: INTEGER); begin Self.TOPINDEX := T; end;


procedure RIRegisterTCUSTOMLISTBOX(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCUSTOMLISTBOX) do
  begin
    RegisterPropertyHelper(@TCUSTOMLISTBOXITEMS_R, @TCUSTOMLISTBOXITEMS_W, 'Items');
    RegisterPropertyHelper(@TCUSTOMLISTBOXITEMINDEX_R, @TCUSTOMLISTBOXITEMINDEX_W, 'ItemIndex');
    RegisterPropertyHelper(@TCUSTOMLISTBOXSELCOUNT_R, nil, 'SelCount');
    RegisterPropertyHelper(@TCUSTOMLISTBOXSELECTED_R, @TCUSTOMLISTBOXSELECTED_W, 'Selected');

    {$IFNDEF PS_MINIVCL}
      RegisterMethod(@TCUSTOMLISTBOX.CLEAR, 'Clear');
      RegisterMethod(@TCUSTOMLISTBOX.ITEMATPOS, 'ItemAtPos');
      RegisterMethod(@TCUSTOMLISTBOX.ITEMRECT, 'ItemRect');
      RegisterPropertyHelper(@TCUSTOMLISTBOXCANVAS_R, nil, 'Canvas');
      RegisterPropertyHelper(@TCUSTOMLISTBOXTOPINDEX_R, @TCUSTOMLISTBOXTOPINDEX_W, 'TopIndex');
    {$ENDIF}
  end;
end;


procedure RIRegisterTLISTBOX(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TLISTBOX);
end;


procedure RIRegisterTSCROLLBAR(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TSCROLLBAR) do
  begin
    RegisterMethod(@TSCROLLBAR.SETPARAMS, 'SetParams');
  end;
end;


{$IFNDEF PS_MINIVCL}
{ TTrackBar }
procedure RIRegisterTTRACKBAR(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TTRACKBAR) do
  begin
    RegisterMethod(@TTRACKBAR.SETTICK, 'SetTick');
  end;
end;


{ TUpDown }
procedure RIRegisterTCUSTOMUPDOWN(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TCustomUpDown);
end;

procedure RIRegisterTUPDOWN(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TUpDown);
end;


{ THotKey }
procedure RIRegisterTCUSTOMHOTKEY(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TCustomHotKey);
end;

procedure RIRegisterTHOTKEY(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(THotKey);
end;


{ TImageList }
procedure TCustomImageListColorDepth_W(Self: TCustomImageList; const T: TColorDepth); begin Self.ColorDepth := T; end;
procedure TCustomImageListColorDepth_R(Self: TCustomImageList; var T: TColorDepth); begin T := Self.ColorDepth; end;
procedure TCustomImageListHandle_W(Self: TCustomImageList; const T: LongInt); begin Self.Handle := T; end;
procedure TCustomImageListHandle_R(Self: TCustomImageList; var T: LongInt); begin T := Self.Handle; end;
//procedure TCustomImageListDragging_R(Self: TCustomImageList; var T: Boolean); begin T := Self.Dragging; end;
//procedure TCustomImageListDragCursor_W(Self: TCustomImageList; const T: TCursor); begin Self.DragCursor := T; end;
//procedure TCustomImageListDragCursor_R(Self: TCustomImageList; var T: TCursor); begin T := Self.DragCursor; end;
procedure TCustomImageListCount_R(Self: TCustomImageList; var T: Integer); begin T := Self.Count; end;

procedure RIRegisterTIMAGELIST(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TImageList);
end;

procedure RIRegisterTCUSTOMIMAGELIST(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCustomImageList) do
  begin
    RegisterConstructor(@TCustomImageList.CreateSize, 'CreateSize');
    RegisterMethod(@TCustomImageList.Add, 'Add');
    RegisterMethod(@TCustomImageList.AddIcon, 'AddIcon');
    RegisterMethod(@TCustomImageList.AddImages, 'AddImages');
    RegisterMethod(@TCustomImageList.AddMasked, 'AddMasked');
    //RegisterMethod(@TCustomImageList.BeginDrag, 'BeginDrag');
    RegisterMethod(@TCustomImageList.Clear, 'Clear');
    RegisterMethod(@TCustomImageList.Delete, 'Delete');
    //RegisterMethod(@TCustomImageList.DragLock, 'DragLock');
    //RegisterMethod(@TCustomImageList.DragMove, 'DragMove');
    //RegisterMethod(@TCustomImageList.DragUnlock, 'DragUnlock');
    RegisterMethod(@TCustomImageList.Draw, 'Draw');
    RegisterMethod(@TCustomImageList.DrawOverlay, 'DrawOverlay');
    //RegisterMethod(@TCustomImageList.EndDrag, 'EndDrag');
    RegisterMethod(@TCustomImageList.FileLoad, 'FileLoad');
    RegisterMethod(@TCustomImageList.GetBitmap, 'GetBitmap');
    RegisterMethod(@TCustomImageList.GetHotSpot, 'GetHotSpot');
    RegisterMethod(@TCustomImageList.GetIcon, 'GetIcon');
    RegisterMethod(@TCustomImageList.GetImageBitmap, 'GetImageBitmap');
    RegisterMethod(@TCustomImageList.GetMaskBitmap, 'GetMaskBitmap');
    RegisterMethod(@TCustomImageList.GetResource, 'GetResource');
    RegisterMethod(@TCustomImageList.GetInstRes, 'GetInstRes');
    RegisterMethod(@TCustomImageList.HandleAllocated, 'HandleAllocated');
    //RegisterMethod(@TCustomImageList.HideDragImage, 'HideDragImage');
    RegisterMethod(@TCustomImageList.Insert, 'Insert');
    RegisterMethod(@TCustomImageList.InsertIcon, 'InsertIcon');
    RegisterMethod(@TCustomImageList.InsertMasked, 'InsertMasked');
    RegisterMethod(@TCustomImageList.Move, 'Move');
    RegisterMethod(@TCustomImageList.Overlay, 'Overlay');
    RegisterMethod(@TCustomImageList.RegisterChanges, 'RegisterChanges');
    RegisterMethod(@TCustomImageList.ResourceLoad, 'ResourceLoad');
    RegisterMethod(@TCustomImageList.ResInstLoad, 'ResInstLoad');
    RegisterMethod(@TCustomImageList.Replace, 'Replace');
    RegisterMethod(@TCustomImageList.ReplaceIcon, 'ReplaceIcon');
    RegisterMethod(@TCustomImageList.ReplaceMasked, 'ReplaceMasked');
    //RegisterMethod(@TCustomImageList.SetDragImage, 'SetDragImage');
    //RegisterMethod(@TCustomImageList.ShowDragImage, 'ShowDragImage');
    RegisterMethod(@TCustomImageList.UnRegisterChanges, 'UnRegisterChanges');
    RegisterPropertyHelper(@TCustomImageListCount_R,nil,'Count');
    //RegisterPropertyHelper(@TCustomImageListDragCursor_R,@TCustomImageListDragCursor_W,'DragCursor');
    //RegisterPropertyHelper(@TCustomImageListDragging_R,nil,'Dragging');
    RegisterPropertyHelper(@TCustomImageListHandle_R,@TCustomImageListHandle_W,'Handle');
    RegisterPropertyHelper(@TCustomImageListColorDepth_R,@TCustomImageListColorDepth_W,'ColorDepth');
  end;
end;


{ TStatusBar }
procedure TStatusBarOnResize_W(Self: TStatusBar; const T: TNotifyEvent); begin Self.OnResize := T; end;
procedure TStatusBarOnResize_R(Self: TStatusBar; var T: TNotifyEvent); begin T := Self.OnResize; end;
procedure TStatusBarOnDrawPanel_W(Self: TStatusBar; const T: TDrawPanelEvent); begin Self.OnDrawPanel := T; end;
procedure TStatusBarOnDrawPanel_R(Self: TStatusBar; var T: TDrawPanelEvent); begin T := Self.OnDrawPanel; end;
procedure TStatusBarSizeGrip_W(Self: TStatusBar; const T: Boolean); begin Self.SizeGrip := T; end;
procedure TStatusBarSizeGrip_R(Self: TStatusBar; var T: Boolean); begin T := Self.SizeGrip; end;
procedure TStatusBarSimpleText_W(Self: TStatusBar; const T: string); begin Self.SimpleText := T; end;
procedure TStatusBarSimpleText_R(Self: TStatusBar; var T: string); begin T := Self.SimpleText; end;
procedure TStatusBarSimplePanel_W(Self: TStatusBar; const T: Boolean); begin Self.SimplePanel := T; end;
procedure TStatusBarSimplePanel_R(Self: TStatusBar; var T: Boolean); begin T := Self.SimplePanel; end;
procedure TStatusBarPanels_W(Self: TStatusBar; const T: TStatusPanels); begin Self.Panels := T; end;
procedure TStatusBarPanels_R(Self: TStatusBar; var T: TStatusPanels); begin T := Self.Panels; end;
procedure TStatusBarCanvas_R(Self: TStatusBar; var T: TCanvas); begin T := Self.Canvas; end;
procedure TStatusPanelsItems_W(Self: TStatusPanels; const T: TStatusPanel; const t1: Integer); begin Self.Items[t1] := T; end;
procedure TStatusPanelsItems_R(Self: TStatusPanels; var T: TStatusPanel; const t1: Integer); begin T := Self.Items[t1]; end;
procedure TStatusPanelWidth_W(Self: TStatusPanel; const T: Integer); begin Self.Width := T; end;
procedure TStatusPanelWidth_R(Self: TStatusPanel; var T: Integer); begin T := Self.Width; end;
procedure TStatusPanelText_W(Self: TStatusPanel; const T: string); begin Self.Text := T; end;
procedure TStatusPanelText_R(Self: TStatusPanel; var T: string); begin T := Self.Text; end;
procedure TStatusPanelStyle_W(Self: TStatusPanel; const T: TStatusPanelStyle); begin Self.Style := T; end;
procedure TStatusPanelStyle_R(Self: TStatusPanel; var T: TStatusPanelStyle); begin T := Self.Style; end;
procedure TStatusPanelBevel_W(Self: TStatusPanel; const T: TStatusPanelBevel); begin Self.Bevel := T; end;
procedure TStatusPanelBevel_R(Self: TStatusPanel; var T: TStatusPanelBevel); begin T := Self.Bevel; end;
procedure TStatusPanelAlignment_W(Self: TStatusPanel; const T: TAlignment); begin Self.Alignment := T; end;
procedure TStatusPanelAlignment_R(Self: TStatusPanel; var T: TAlignment); begin T := Self.Alignment; end;

procedure RIRegisterTSTATUSBAR(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TStatusBar) do
  begin
    RegisterPropertyHelper(@TStatusBarCanvas_R,nil,'Canvas');
    RegisterPropertyHelper(@TStatusBarPanels_R,@TStatusBarPanels_W,'Panels');
    RegisterPropertyHelper(@TStatusBarSimplePanel_R,@TStatusBarSimplePanel_W,'SimplePanel');
    RegisterPropertyHelper(@TStatusBarSimpleText_R,@TStatusBarSimpleText_W,'SimpleText');
    RegisterPropertyHelper(@TStatusBarSizeGrip_R,@TStatusBarSizeGrip_W,'SizeGrip');
    RegisterPropertyHelper(@TStatusBarOnDrawPanel_R,@TStatusBarOnDrawPanel_W,'OnDrawPanel');
    RegisterPropertyHelper(@TStatusBarOnResize_R,@TStatusBarOnResize_W,'OnResize');
  end;
end;

procedure RIRegisterTSTATUSPANELS(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TStatusPanels) do
  begin
    RegisterConstructor(@TStatusPanels.Create, 'Create');
    RegisterMethod(@TStatusPanels.Add, 'Add');
    RegisterPropertyHelper(@TStatusPanelsItems_R,@TStatusPanelsItems_W,'Items');
  end;
end;

procedure RIRegisterTSTATUSPANEL(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TStatusPanel) do
  begin
    RegisterPropertyHelper(@TStatusPanelAlignment_R,@TStatusPanelAlignment_W,'Alignment');
    RegisterPropertyHelper(@TStatusPanelBevel_R,@TStatusPanelBevel_W,'Bevel');
    RegisterPropertyHelper(@TStatusPanelStyle_R,@TStatusPanelStyle_W,'Style');
    RegisterPropertyHelper(@TStatusPanelText_R,@TStatusPanelText_W,'Text');
    RegisterPropertyHelper(@TStatusPanelWidth_R,@TStatusPanelWidth_W,'Width');
  end;
end;


{ TListView }
procedure TCustomListViewBoundingRect_R(Self: TCustomListView; var T: TRect); begin T := Self.BoundingRect; end;
procedure TCustomListViewVisibleRowCount_R(Self: TCustomListView; var T: Integer); begin T := Self.VisibleRowCount; end;
procedure TCustomListViewViewOrigin_R(Self: TCustomListView; var T: TPoint); begin T := Self.ViewOrigin; end;
procedure TCustomListViewTopItem_R(Self: TCustomListView; var T: TListItem); begin T := Self.TopItem; end;
procedure TCustomListViewSelected_W(Self: TCustomListView; const T: TListItem); begin Self.Selected := T; end;
procedure TCustomListViewSelected_R(Self: TCustomListView; var T: TListItem); begin T := Self.Selected; end;
procedure TCustomListViewSelCount_R(Self: TCustomListView; var T: Integer); begin T := Self.SelCount; end;
procedure TCustomListViewRowSelect_W(Self: TCustomListView; const T: Boolean); begin Self.RowSelect := T; end;
procedure TCustomListViewRowSelect_R(Self: TCustomListView; var T: Boolean); begin T := Self.RowSelect; end;
procedure TCustomListViewItemFocused_W(Self: TCustomListView; const T: TListItem); begin Self.ItemFocused := T; end;
procedure TCustomListViewItemFocused_R(Self: TCustomListView; var T: TListItem); begin T := Self.ItemFocused; end;
procedure TCustomListViewHotTrack_W(Self: TCustomListView; const T: Boolean); begin Self.HotTrack := T; end;
procedure TCustomListViewHotTrack_R(Self: TCustomListView; var T: Boolean); begin T := Self.HotTrack; end;
procedure TCustomListViewGridLines_W(Self: TCustomListView; const T: Boolean); begin Self.GridLines := T; end;
procedure TCustomListViewGridLines_R(Self: TCustomListView; var T: Boolean); begin T := Self.GridLines; end;
procedure TCustomListViewDropTarget_W(Self: TCustomListView; const T: TListItem); begin Self.DropTarget := T; end;
procedure TCustomListViewDropTarget_R(Self: TCustomListView; var T: TListItem); begin T := Self.DropTarget; end;
procedure TCustomListViewColumn_R(Self: TCustomListView; var T: TListColumn; const t1: Integer); begin T := Self.Column[t1]; end;
procedure TCustomListViewCheckboxes_W(Self: TCustomListView; const T: Boolean); begin Self.Checkboxes := T; end;
procedure TCustomListViewCheckboxes_R(Self: TCustomListView; var T: Boolean); begin T := Self.Checkboxes; end;

procedure TIconOptionsWrapText_W(Self: TIconOptions; const T: Boolean); begin Self.WrapText := T; end;
procedure TIconOptionsWrapText_R(Self: TIconOptions; var T: Boolean); begin T := Self.WrapText; end;
procedure TIconOptionsAutoArrange_W(Self: TIconOptions; const T: Boolean); begin Self.AutoArrange := T; end;
procedure TIconOptionsAutoArrange_R(Self: TIconOptions; var T: Boolean); begin T := Self.AutoArrange; end;
procedure TIconOptionsArrangement_W(Self: TIconOptions; const T: TIconArrangement); begin Self.Arrangement := T; end;
procedure TIconOptionsArrangement_R(Self: TIconOptions; var T: TIconArrangement); begin T := Self.Arrangement; end;

procedure TListItemsOwner_R(Self: TListItems; var T: TCustomListView); begin T := Self.Owner; end;
procedure TListItemsItem_W(Self: TListItems; const T: TListItem; const t1: Integer); begin Self.Item[t1] := T; end;
procedure TListItemsItem_R(Self: TListItems; var T: TListItem; const t1: Integer); begin T := Self.Item[t1]; end;
procedure TListItemsHandle_R(Self: TListItems; var T: LongInt); begin T := Self.Handle; end;
procedure TListItemsCount_R(Self: TListItems; var T: Integer); begin T := Self.Count; end;
procedure TListItemTop_W(Self: TListItem; const T: Integer); begin Self.Top := T; end;
procedure TListItemTop_R(Self: TListItem; var T: Integer); begin T := Self.Top; end;
procedure TListItemSubItems_W(Self: TListItem; const T: TStrings); begin Self.SubItems := T; end;
procedure TListItemSubItems_R(Self: TListItem; var T: TStrings); begin T := Self.SubItems; end;
procedure TListItemStateIndex_W(Self: TListItem; const T: Integer); begin Self.StateIndex := T; end;
procedure TListItemStateIndex_R(Self: TListItem; var T: Integer); begin T := Self.StateIndex; end;
procedure TListItemSelected_W(Self: TListItem; const T: Boolean); begin Self.Selected := T; end;
procedure TListItemSelected_R(Self: TListItem; var T: Boolean); begin T := Self.Selected; end;
procedure TListItemOverlayIndex_W(Self: TListItem; const T: Integer); begin Self.OverlayIndex := T; end;
procedure TListItemOverlayIndex_R(Self: TListItem; var T: Integer); begin T := Self.OverlayIndex; end;
procedure TListItemOwner_R(Self: TListItem; var T: TListItems); begin T := Self.Owner; end;
procedure TListItemListView_R(Self: TListItem; var T: TCustomListView); begin T := Self.ListView; end;
procedure TListItemLeft_W(Self: TListItem; const T: Integer); begin Self.Left := T; end;
procedure TListItemLeft_R(Self: TListItem; var T: Integer); begin T := Self.Left; end;
procedure TListItemIndex_R(Self: TListItem; var T: Integer); begin T := Self.Index; end;
procedure TListItemImageIndex_W(Self: TListItem; const T: Integer); begin Self.ImageIndex := T; end;
procedure TListItemImageIndex_R(Self: TListItem; var T: Integer); begin T := Self.ImageIndex; end;
procedure TListItemHandle_R(Self: TListItem; var T: LongInt); begin T := Self.Handle; end;
procedure TListItemFocused_W(Self: TListItem; const T: Boolean); begin Self.Focused := T; end;
procedure TListItemFocused_R(Self: TListItem; var T: Boolean); begin T := Self.Focused; end;
procedure TListItemDropTarget_W(Self: TListItem; const T: Boolean); begin Self.DropTarget := T; end;
procedure TListItemDropTarget_R(Self: TListItem; var T: Boolean); begin T := Self.DropTarget; end;
procedure TListItemData_W(Self: TListItem; const T: Pointer); begin Self.Data := T; end;
procedure TListItemData_R(Self: TListItem; var T: Pointer); begin T := Self.Data; end;
procedure TListItemCut_W(Self: TListItem; const T: Boolean); begin Self.Cut := T; end;
procedure TListItemCut_R(Self: TListItem; var T: Boolean); begin T := Self.Cut; end;
procedure TListItemChecked_W(Self: TListItem; const T: Boolean); begin Self.Checked := T; end;
procedure TListItemChecked_R(Self: TListItem; var T: Boolean); begin T := Self.Checked; end;
procedure TListItemCaption_W(Self: TListItem; const T: string); begin Self.Caption := T; end;
procedure TListItemCaption_R(Self: TListItem; var T: string); begin T := Self.Caption; end;

procedure TListColumnsItems_W(Self: TListColumns; const T: TListColumn; const t1: Integer); begin Self.Items[t1] := T; end;
procedure TListColumnsItems_R(Self: TListColumns; var T: TListColumn; const t1: Integer); begin T := Self.Items[t1]; end;
procedure TListColumnsOwner_R(Self: TListColumns; var T: TCustomListView); begin T := Self.Owner; end;
procedure TListColumnWidth_W(Self: TListColumn; const T: Integer); begin Self.Width := T; end;
procedure TListColumnWidth_R(Self: TListColumn; var T: Integer); begin T := Self.Width; end;
procedure TListColumnCaption_W(Self: TListColumn; const T: string); begin Self.Caption := T; end;
procedure TListColumnCaption_R(Self: TListColumn; var T: string); begin T := Self.Caption; end;
procedure TListColumnAlignment_W(Self: TListColumn; const T: TAlignment); begin Self.Alignment := T; end;
procedure TListColumnAlignment_R(Self: TListColumn; var T: TAlignment); begin T := Self.Alignment; end;
procedure TListColumnWidthType_R(Self: TListColumn; var T: Integer); begin T := Self.WidthType; end;

procedure RIRegisterTCUSTOMLISTVIEW(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCustomListView) do
  begin
    RegisterMethod(@TCustomListView.AlphaSort, 'AlphaSort');
    RegisterMethod(@TCustomListView.Arrange, 'Arrange');
    RegisterMethod(@TCustomListView.FindCaption, 'FindCaption');
    RegisterMethod(@TCustomListView.FindData, 'FindData');
    RegisterMethod(@TCustomListView.GetItemAt, 'GetItemAt');
    RegisterMethod(@TCustomListView.GetNearestItem, 'GetNearestItem');
    RegisterMethod(@TCustomListView.GetNextItem, 'GetNextItem');
    RegisterMethod(@TCustomListView.GetSearchString, 'GetSearchString');
    RegisterMethod(@TCustomListView.IsEditing, 'IsEditing');
    RegisterMethod(@TCustomListView.Scroll, 'Scroll');
    RegisterPropertyHelper(@TCustomListViewCheckboxes_R,@TCustomListViewCheckboxes_W,'Checkboxes');
    RegisterPropertyHelper(@TCustomListViewColumn_R,nil,'Column');
    RegisterPropertyHelper(@TCustomListViewDropTarget_R,@TCustomListViewDropTarget_W,'DropTarget');
    RegisterPropertyHelper(@TCustomListViewGridLines_R,@TCustomListViewGridLines_W,'GridLines');
    RegisterPropertyHelper(@TCustomListViewHotTrack_R,@TCustomListViewHotTrack_W,'HotTrack');
    RegisterPropertyHelper(@TCustomListViewItemFocused_R,@TCustomListViewItemFocused_W,'ItemFocused');
    RegisterPropertyHelper(@TCustomListViewRowSelect_R,@TCustomListViewRowSelect_W,'RowSelect');
    RegisterPropertyHelper(@TCustomListViewSelCount_R,nil,'SelCount');
    RegisterPropertyHelper(@TCustomListViewSelected_R,@TCustomListViewSelected_W,'Selected');
    RegisterMethod(@TCustomListView.CustomSort, 'CustomSort');
    RegisterMethod(@TCustomListView.StringWidth, 'StringWidth');
    RegisterMethod(@TCustomListView.UpdateItems, 'UpdateItems');
    RegisterPropertyHelper(@TCustomListViewTopItem_R,nil,'TopItem');
    RegisterPropertyHelper(@TCustomListViewViewOrigin_R,nil,'ViewOrigin');
    RegisterPropertyHelper(@TCustomListViewVisibleRowCount_R,nil,'VisibleRowCount');
    RegisterPropertyHelper(@TCustomListViewBoundingRect_R,nil,'BoundingRect');
  end;
end;

procedure RIRegisterTICONOPTIONS(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TIconOptions) do
  begin
    RegisterConstructor(@TIconOptions.Create, 'Create');
    RegisterPropertyHelper(@TIconOptionsArrangement_R,@TIconOptionsArrangement_W,'Arrangement');
    RegisterPropertyHelper(@TIconOptionsAutoArrange_R,@TIconOptionsAutoArrange_W,'AutoArrange');
    RegisterPropertyHelper(@TIconOptionsWrapText_R,@TIconOptionsWrapText_W,'WrapText');
  end;
end;

procedure RIRegisterTLISTITEMS(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TListItems) do
  begin
    RegisterConstructor(@TListItems.Create, 'Create');
    RegisterMethod(@TListItems.Add, 'Add');
    RegisterMethod(@TListItems.BeginUpdate, 'BeginUpdate');
    RegisterMethod(@TListItems.Clear, 'Clear');
    RegisterMethod(@TListItems.Delete, 'Delete');
    RegisterMethod(@TListItems.EndUpdate, 'EndUpdate');
    RegisterMethod(@TListItems.IndexOf, 'IndexOf');
    RegisterMethod(@TListItems.Insert, 'Insert');
    RegisterPropertyHelper(@TListItemsCount_R,nil,'Count');
    RegisterPropertyHelper(@TListItemsHandle_R,nil,'Handle');
    RegisterPropertyHelper(@TListItemsItem_R,@TListItemsItem_W,'Item');
    RegisterPropertyHelper(@TListItemsOwner_R,nil,'Owner');
  end;
end;

procedure RIRegisterTLISTITEM(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TListItem) do
  begin
    RegisterConstructor(@TListItem.Create, 'Create');
    RegisterMethod(@TListItem.CancelEdit, 'CancelEdit');
    RegisterMethod(@TListItem.Delete, 'Delete');
    RegisterMethod(@TListItem.DisplayRect, 'DisplayRect');
    RegisterMethod(@TListItem.EditCaption, 'EditCaption');
    RegisterMethod(@TListItem.GetPosition, 'GetPosition');
    RegisterMethod(@TListItem.MakeVisible, 'MakeVisible');
    RegisterMethod(@TListItem.Update, 'Update');
    RegisterMethod(@TListItem.SetPosition, 'SetPosition');
    RegisterPropertyHelper(@TListItemCaption_R,@TListItemCaption_W,'Caption');
    RegisterPropertyHelper(@TListItemChecked_R,@TListItemChecked_W,'Checked');
    RegisterPropertyHelper(@TListItemCut_R,@TListItemCut_W,'Cut');
    RegisterPropertyHelper(@TListItemData_R,@TListItemData_W,'Data');
    RegisterPropertyHelper(@TListItemDropTarget_R,@TListItemDropTarget_W,'DropTarget');
    RegisterPropertyHelper(@TListItemFocused_R,@TListItemFocused_W,'Focused');
    RegisterPropertyHelper(@TListItemHandle_R,nil,'Handle');
    RegisterPropertyHelper(@TListItemImageIndex_R,@TListItemImageIndex_W,'ImageIndex');
    RegisterPropertyHelper(@TListItemIndex_R,nil,'Index');
    RegisterPropertyHelper(@TListItemLeft_R,@TListItemLeft_W,'Left');
    RegisterPropertyHelper(@TListItemListView_R,nil,'ListView');
    RegisterPropertyHelper(@TListItemOwner_R,nil,'Owner');
    RegisterPropertyHelper(@TListItemOverlayIndex_R,@TListItemOverlayIndex_W,'OverlayIndex');
    RegisterPropertyHelper(@TListItemSelected_R,@TListItemSelected_W,'Selected');
    RegisterPropertyHelper(@TListItemStateIndex_R,@TListItemStateIndex_W,'StateIndex');
    RegisterPropertyHelper(@TListItemSubItems_R,@TListItemSubItems_W,'SubItems');
    RegisterPropertyHelper(@TListItemTop_R,@TListItemTop_W,'Top');
  end;
end;

procedure RIRegisterTLISTCOLUMNS(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TListColumns) do
  begin
    RegisterConstructor(@TListColumns.Create, 'Create');
    RegisterMethod(@TListColumns.Add, 'Add');
    RegisterPropertyHelper(@TListColumnsOwner_R,nil,'Owner');
    RegisterPropertyHelper(@TListColumnsItems_R,@TListColumnsItems_W,'Items');
  end;
end;

procedure RIRegisterTLISTCOLUMN(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TListColumn) do
  begin
    RegisterPropertyHelper(@TListColumnWidthType_R,nil,'WidthType');
    RegisterPropertyHelper(@TListColumnAlignment_R,@TListColumnAlignment_W,'Alignment');
    RegisterPropertyHelper(@TListColumnCaption_R,@TListColumnCaption_W,'Caption');
    RegisterPropertyHelper(@TListColumnWidth_R,@TListColumnWidth_W,'Width');
  end;
end;
{$ENDIF}

procedure RIRegister_stdctrls(cl: TPSRuntimeClassImporter);
begin
  {$IFNDEF PS_MINIVCL}
    RIRegisterTCUSTOMGROUPBOX(Cl);
    RIRegisterTGROUPBOX(Cl);
  {$ENDIF}
  RIRegisterTCUSTOMLABEL(Cl);
  RIRegisterTLABEL(Cl);
  RIRegisterTCUSTOMEDIT(Cl);
  RIRegisterTEDIT(Cl);
  RIRegisterTCUSTOMMEMO(Cl);
  RIRegisterTMEMO(Cl);
  RIRegisterTCUSTOMCOMBOBOX(Cl);
  RIRegisterTCOMBOBOX(Cl);
  RIRegisterTBUTTONCONTROL(Cl);
  {$IFNDEF PS_MINIVCL}
    RIRegisterTCUSTOMBUTTON(Cl);
  {$ENDIF}
  RIRegisterTBUTTON(Cl);
  RIRegisterTCUSTOMCHECKBOX(Cl);
  RIRegisterTCHECKBOX(Cl);
  RIRegisterTRADIOBUTTON(Cl);
  RIRegisterTCUSTOMLISTBOX(Cl);
  RIRegisterTLISTBOX(Cl);
  {$IFNDEF PS_MINIVCL}
    RIRegisterTSCROLLBAR(Cl);
    { ComCtrls }
    RIRegisterTTRACKBAR(Cl);
    RIRegisterTCUSTOMUPDOWN(Cl);
    RIRegisterTUPDOWN(Cl);
    RIRegisterTCUSTOMHOTKEY(Cl);
    RIRegisterTHOTKEY(Cl);
    RIRegisterTCUSTOMIMAGELIST(Cl);
    RIRegisterTIMAGELIST(Cl);
  {$ENDIF}
end;


{$IFNDEF PS_MINIVCL}
{ Register TListView }
procedure RIRegister_TListView(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TListColumns) do
    with Cl.Add(TListItems) do
      with Cl.Add(TCustomListView) do RIRegisterTLISTCOLUMN(Cl);
  RIRegisterTLISTCOLUMNS(Cl);
  RIRegisterTLISTITEM(Cl);
  RIRegisterTLISTITEMS(Cl);
  RIRegisterTICONOPTIONS(Cl);
  RIRegisterTCUSTOMLISTVIEW(Cl);
  Cl.Add(TListView);
end;


{ Register TStatusBar }
procedure RIRegister_StatusBar(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TStatusBar) do RIRegisterTSTATUSPANEL(Cl);
  RIRegisterTSTATUSPANELS(Cl);
  RIRegisterTSTATUSBAR(Cl);
end;
{$ENDIF}

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)

end.