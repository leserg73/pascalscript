{ Runtime Controls support }
unit uPSR_controls;

{$I PascalScript.inc}

interface

uses
  uPSRuntime, uPSUtils;

procedure RIRegisterTControl(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTWinControl(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTGraphicControl(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTCustomControl(Cl: TPSRuntimeClassImporter);
procedure RIRegister_TDragObject(Cl: TPSRuntimeClassImporter);
{$IFDEF DELPHI4UP}
  procedure RIRegisterTSizeConstraints(Cl: TPSRuntimeClassImporter);
{$ENDIF}
{$IFNDEF PS_MINIVCL}
  procedure RIRegister_TImageList(Cl: TPSRuntimeClassImporter);
  procedure RIRegister_TCustomImageList(Cl: TPSRuntimeClassImporter);
  procedure RIRegister_TBalloonHint(Cl: TPSRuntimeClassImporter);
  procedure RIRegister_TCustomHint(Cl: TPSRuntimeClassImporter);
  procedure RIRegister_TCustomHintShowHideThread(Cl: TPSRuntimeClassImporter);
  procedure RIRegister_TCustomHintWindow(Cl: TPSRuntimeClassImporter);
  procedure RIRegister_THintWindow(Cl: TPSRuntimeClassImporter);
  procedure RIRegister_TPadding(Cl: TPSRuntimeClassImporter);
  procedure RIRegister_TMargins(Cl: TPSRuntimeClassImporter);
{$ENDIF}

procedure RIRegister_Controls(Cl: TPSRuntimeClassImporter);

implementation
{$IFNDEF FPC}
uses
  Classes{$IFDEF CLX}, QControls, QGraphics{$ELSE}, Controls{$IFNDEF PS_MINIVCL}, ImgList{$ENDIF}, Graphics, Windows{$ENDIF};
{$ELSE}
uses
  Classes, Controls, Graphics;
{$ENDIF}

{ TControl ------------------------------------------------------------------- }
procedure TControlAlignR(Self: TControl; var T: Byte); begin T := Byte(Self.Align); end;
procedure TControlAlignW(Self: TControl; T: Byte); begin Self.Align:= TAlign(T); end;
procedure TControlClientHeightR(Self: TControl; var T: Longint); begin T := Self.ClientHeight; end;
procedure TControlClientHeightW(Self: TControl; T: Longint); begin Self.ClientHeight := T; end;
procedure TControlClientWidthR(Self: TControl; var T: Longint); begin T := Self.ClientWidth; end;
procedure TControlClientWidthW(Self: TControl; T: Longint); begin Self.ClientWidth:= T; end;
procedure TControlShowHintR(Self: TControl; var T: Boolean); begin T := Self.ShowHint; end;
procedure TControlShowHintW(Self: TControl; T: Boolean); begin Self.ShowHint:= T; end;
procedure TControlVisibleR(Self: TControl; var T: Boolean); begin T := Self.Visible; end;
procedure TControlVisibleW(Self: TControl; T: Boolean); begin Self.Visible:= T; end;
procedure TControlParentR(Self: TControl; var T: TWinControl); begin T := Self.Parent; end;
procedure TControlParentW(Self: TControl; T: TWinControl); begin Self.Parent:= T; end;
procedure TCONTROLSHOWHINT_W(Self: TCONTROL; T: BOOLEAN); begin Self.SHOWHINT := T; end;
procedure TCONTROLSHOWHINT_R(Self: TCONTROL; var T: BOOLEAN); begin T := Self.SHOWHINT; end;
procedure TCONTROLENABLED_W(Self: TCONTROL; T: BOOLEAN); begin Self.ENABLED := T; end;
procedure TCONTROLENABLED_R(Self: TCONTROL; var T: BOOLEAN); begin T := Self.ENABLED; end;
{$IFNDEF PS_MINIVCL}
  procedure TCONTROLCLIENTRECT_R(Self: TCONTROL; var T: TRECT); begin T := Self.ClientRect; end;
  procedure TCONTROLCUSTOMHINT_W(Self: TControl; const T: TCustomHint); begin Self.CustomHint := T; end;
  procedure TCONTROLCUSTOMHINT_R(Self: TControl; var T: TCustomHint); begin T := Self.CustomHint; end;
  procedure TCONTROLBOUNDSRECT_W(Self: TControl; const T: TRect); begin Self.BoundsRect := T; end;
  procedure TCONTROLBOUNDSRECT_R(Self: TControl; var T: TRect); begin T := Self.BoundsRect; end;
  procedure TCONTROLMARGINS_W(Self: TControl; const T: TMargins); begin Self.Margins := T; end;
  procedure TCONTROLMARGINS_R(Self: TControl; var T: TMargins); begin T := Self.Margins; end;
  procedure TCONTROLSTYLEELEMENTS_W(Self: TControl; const T: TStyleElements); begin Self.StyleElements := T; end;
  procedure TCONTROLSTYLEELEMENTS_R(Self: TControl; var T: TStyleElements); begin T := Self.StyleElements; end;
{$ENDIF}

procedure RIRegisterTControl(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TControl) do
  begin
    RegisterVirtualConstructor(@TControl.Create, 'Create');
    RegisterMethod(@TControl.BRingToFront, 'BringToFront');
    RegisterMethod(@TControl.Hide, 'Hide');
    RegisterVirtualMethod(@TControl.Invalidate, 'Invalidate');
    RegisterMethod(@TControl.Refresh, 'Refresh');
    RegisterVirtualMethod(@TControl.Repaint, 'Repaint');
    RegisterMethod(@TControl.SendToBack, 'SendToBack');
    RegisterMethod(@TControl.Show, 'Show');
    RegisterVirtualMethod(@TControl.Update, 'Update');
    RegisterVirtualMethod(@TControl.SetBounds, 'SetBounds');
    RegisterPropertyHelper(@TControlShowHintR, @TControlShowHintW, 'ShowHint');
    RegisterPropertyHelper(@TControlAlignR, @TControlAlignW, 'Align');
    RegisterPropertyHelper(@TControlClientHeightR, @TControlClientHeightW, 'ClientHeight');
    RegisterPropertyHelper(@TControlClientWidthR, @TControlClientWidthW, 'ClientWidth');
    RegisterPropertyHelper(@TControlVisibleR, @TControlVisibleW, 'Visible');
    RegisterPropertyHelper(@TCONTROLENABLED_R, @TCONTROLENABLED_W, 'Enabled');
    RegisterPropertyHelper(@TControlParentR, @TControlParentW, 'Parent');
    {$IFNDEF PS_MINIVCL}
      RegisterMethod(@TControl.Dragging, 'Dragging');
      RegisterMethod(@TControl.HasParent, 'HasParent');
      RegisterMethod(@TCONTROL.CLIENTTOSCREEN, 'ClientToScreen');
      RegisterMethod(@TCONTROL.DRAGGING, 'Dragging');
    {$IFNDEF FPC} 
      RegisterMethod(@TCONTROL.BEGINDRAG, 'BeginDrag');
      RegisterMethod(@TCONTROL.ENDDRAG, 'EndDrag');
    {$ENDIF}
    {$IFNDEF CLX}
      RegisterMethod(@TCONTROL.GETTEXTBUF, 'GetTextBuf');
      RegisterMethod(@TCONTROL.GETTEXTLEN, 'GetTextLen');
      RegisterMethod(@TCONTROL.PERFORM, 'Perform');
      RegisterMethod(@TCONTROL.SETTEXTBUF, 'SetTextBuf');
    {$ENDIF}
      RegisterMethod(@TCONTROL.SCREENTOCLIENT, 'ScreenToClient');
      RegisterPropertyHelper(@TCONTROLCLIENTRECT_R, nil, 'ClientRect');
      RegisterPropertyHelper(@TCONTROLCUSTOMHINT_R,@TCONTROLCUSTOMHINT_W,'CustomHint');
      RegisterPropertyHelper(@TCONTROLBOUNDSRECT_R,@TCONTROLBOUNDSRECT_W,'BoundsRect');
      RegisterPropertyHelper(@TCONTROLMARGINS_R,@TCONTROLMARGINS_W,'Margins');
      RegisterPropertyHelper(@TCONTROLSTYLEELEMENTS_R,@TCONTROLSTYLEELEMENTS_W,'StyleElements');
    {$ENDIF}
  end;
end;

{ TWinControl ---------------------------------------------------------------- }
{$IFNDEF CLX}
  procedure TWinControlHandleR(Self: TWinControl; var T: Longint); begin T := Self.Handle; end;
{$ENDIF}
procedure TWinControlShowingR(Self: TWinControl; var T: Boolean); begin T := Self.Showing; end;
procedure TWinControlDoubleBufferedR(Self: TWinControl; var T: Boolean); begin T := Self.DoubleBuffered; end;
procedure TWinControlDoubleBufferedW(Self: TWinControl; T: Boolean); begin Self.DoubleBuffered := T; end;
procedure TWinControlParentDoubleBufferedR(Self: TWinControl; var T: Boolean); begin T := Self.ParentDoubleBuffered; end;
procedure TWinControlParentDoubleBufferedW(Self: TWinControl; T: Boolean); begin Self.ParentDoubleBuffered := T; end;
procedure TWinControlPadding_W(Self: TWinControl; const T: TPadding); begin Self.Padding := T; end;
procedure TWinControlPadding_R(Self: TWinControl; var T: TPadding); begin T := Self.Padding; end;
procedure TWinControlTabOrderR(Self: TWinControl; var T: Longint); begin T := Self.TabOrder; end;
procedure TWinControlTabOrderW(Self: TWinControl; T: Longint); begin Self.TabOrder:= T; end;
procedure TWinControlTabStopR(Self: TWinControl; var T: Boolean); begin T := Self.TabStop; end;
procedure TWinControlTabStopW(Self: TWinControl; T: Boolean); begin Self.TabStop:= T; end;
procedure TWINCONTROLBRUSH_R(Self: TWINCONTROL; var T: TBRUSH); begin T := Self.BRUSH; end;
procedure TWINCONTROLCONTROLS_R(Self: TWINCONTROL; var T: TCONTROL; t1: INTEGER); begin t := Self.CONTROLS[t1]; end;
procedure TWINCONTROLCONTROLCOUNT_R(Self: TWINCONTROL; var T: INTEGER); begin t := Self.CONTROLCOUNT; end;

procedure RIRegisterTWinControl(Cl: TPSRuntimeClassImporter); // requires TControl
begin
  with Cl.Add(TWinControl) do
  begin
    {$IFNDEF CLX}
      RegisterPropertyHelper(@TWinControlHandleR, nil, 'Handle');
    {$ENDIF}
    RegisterPropertyHelper(@TWinControlShowingR, nil, 'Showing');
    RegisterPropertyHelper(@TWinControlTabOrderR, @TWinControlTabOrderW, 'TabOrder');
    RegisterPropertyHelper(@TWinControlTabStopR, @TWinControlTabStopW, 'TabStop');
    RegisterMethod(@TWINCONTROL.CANFOCUS, 'CanFocus');
    RegisterMethod(@TWINCONTROL.FOCUSED, 'Focused');
    RegisterPropertyHelper(@TWINCONTROLCONTROLS_R, nil, 'Controls');
    RegisterPropertyHelper(@TWINCONTROLCONTROLCOUNT_R, nil, 'ControlCount');
    {$IFNDEF PS_MINIVCL}
      RegisterMethod(@TWinControl.HandleAllocated, 'HandleAllocated');
      RegisterPropertyHelper(@TWinControlDoubleBufferedR, @TWinControlDoubleBufferedW, 'DoubleBuffered');
      RegisterPropertyHelper(@TWinControlParentDoubleBufferedR, @TWinControlParentDoubleBufferedW, 'ParentDoubleBuffered');
      RegisterPropertyHelper(@TWinControlPadding_R,@TWinControlPadding_W,'Padding');
      RegisterMethod(@TWinControl.HandleNeeded, 'HandleNeeded');
      RegisterMethod(@TWinControl.EnableAlign, 'EnableAlign');
      RegisterMethod(@TWinControl.RemoveControl, 'RemoveControl');
        {$IFNDEF FPC}
          RegisterMethod(@TWinControl.InsertControl, 'InsertControl');
          RegisterMethod(@TWinControl.ScaleBy, 'ScaleBy');
          RegisterMethod(@TWinControl.ScrollBy, 'ScrollBy');
            {$IFNDEF CLX}
              RegisterMethod(@TWINCONTROL.PAINTTO, 'PaintTo');
            {$ENDIF}
        {$ENDIF}{FPC}
      RegisterMethod(@TWinControl.Realign, 'Realign');
      RegisterVirtualMethod(@TWinControl.SetFocus, 'SetFocus');
      RegisterMethod(@TWINCONTROL.CONTAINSCONTROL, 'ContainsControl');
      RegisterMethod(@TWINCONTROL.DISABLEALIGN, 'DisableAlign');
      RegisterMethod(@TWINCONTROL.UPDATECONTROLSTATE, 'UpdateControlState');
      RegisterPropertyHelper(@TWINCONTROLBRUSH_R, nil, 'Brush');
    {$ENDIF}
  end;
end;

{ TGraphicControl ------------------------------------------------------------ }
procedure RIRegisterTGraphicControl(Cl: TPSRuntimeClassImporter); // requires TControl
begin
  Cl.Add(TGraphicControl);
end;

{ TCustomControl ------------------------------------------------------------- }
procedure RIRegisterTCustomControl(Cl: TPSRuntimeClassImporter); // requires TControl
begin
  Cl.Add(TCustomControl);
end;

{ TDragObject ---------------------------------------------------------------- }
{$IFDEF DELPHI4UP}
  procedure TDragObjectMouseDeltaY_R(Self: TDragObject; var T: Double); begin T := Self.MouseDeltaY; end;
  procedure TDragObjectMouseDeltaX_R(Self: TDragObject; var T: Double); begin T := Self.MouseDeltaX; end;
  procedure TDragObjectDragTarget_W(Self: TDragObject; const T: Pointer); begin Self.DragTarget := T; end;
  procedure TDragObjectDragTarget_R(Self: TDragObject; var T: Pointer); begin T := Self.DragTarget; end;
  procedure TDragObjectDragTargetPos_W(Self: TDragObject; const T: TPoint); begin Self.DragTargetPos := T; end;
  procedure TDragObjectDragTargetPos_R(Self: TDragObject; var T: TPoint); begin T := Self.DragTargetPos; end;
  procedure TDragObjectDragPos_W(Self: TDragObject; const T: TPoint); begin Self.DragPos := T; end;
  procedure TDragObjectDragPos_R(Self: TDragObject; var T: TPoint); begin T := Self.DragPos; end;
  procedure TDragObjectDragHandle_W(Self: TDragObject; const T: HWND); begin Self.DragHandle := T; end;
  procedure TDragObjectDragHandle_R(Self: TDragObject; var T: HWND); begin T := Self.DragHandle; end;
  procedure TDragObjectCancelling_W(Self: TDragObject; const T: Boolean); begin Self.Cancelling := T; end;
  procedure TDragObjectCancelling_R(Self: TDragObject; var T: Boolean); begin T := Self.Cancelling; end;
{$ENDIF}

procedure RIRegister_TDragObject(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TDragObject) do
  begin
  {$IFNDEF PS_MINIVCL}
    {$IFDEF DELPHI4UP}
      RegisterVirtualMethod(@TDragObject.Assign, 'Assign');
    {$ENDIF}
    {$IFNDEF FPC}
      RegisterVirtualMethod(@TDragObject.GetName, 'GetName');
      RegisterVirtualMethod(@TDragObject.Instance, 'Instance');
    {$ENDIF}    
      RegisterVirtualMethod(@TDragObject.HideDragImage, 'HideDragImage');
      RegisterVirtualMethod(@TDragObject.ShowDragImage, 'ShowDragImage');
    {$IFDEF DELPHI4UP}
      RegisterPropertyHelper(@TDragObjectCancelling_R,@TDragObjectCancelling_W,'Cancelling');
      RegisterPropertyHelper(@TDragObjectDragHandle_R,@TDragObjectDragHandle_W,'DragHandle');
      RegisterPropertyHelper(@TDragObjectDragPos_R,@TDragObjectDragPos_W,'DragPos');
      RegisterPropertyHelper(@TDragObjectDragTargetPos_R,@TDragObjectDragTargetPos_W,'DragTargetPos');
      RegisterPropertyHelper(@TDragObjectDragTarget_R,@TDragObjectDragTarget_W,'DragTarget');
      RegisterPropertyHelper(@TDragObjectMouseDeltaX_R,nil,'MouseDeltaX');
      RegisterPropertyHelper(@TDragObjectMouseDeltaY_R,nil,'MouseDeltaY');
    {$ENDIF}
  {$ENDIF}
  end;
end;

{ TSizeConstraints ----------------------------------------------------------- }
procedure RIRegisterTSizeConstraints(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TSizeConstraints);
end;

{$IFNDEF PS_MINIVCL}
{ TCustomImageList ----------------------------------------------------------- }
//procedure TCustomImageListDragging_R(Self: TCustomImageList; var T: Boolean); begin T := Self.Dragging; end;
//procedure TCustomImageListDragCursor_W(Self: TCustomImageList; const T: TCursor); begin Self.DragCursor := T; end;
//procedure TCustomImageListDragCursor_R(Self: TCustomImageList; var T: TCursor); begin T := Self.DragCursor; end;
procedure TCustomImageListCount_R(Self: TCustomImageList; var T: Integer); begin T := Self.Count; end;
procedure TCustomImageListOnChange_W(Self: TCustomImageList; const T: TNotifyEvent); begin Self.OnChange := T; end;
procedure TCustomImageListOnChange_R(Self: TCustomImageList; var T: TNotifyEvent); begin T := Self.OnChange; end;
procedure TCustomImageListWidth_W(Self: TCustomImageList; const T: Integer); begin Self.Width := T; end;
procedure TCustomImageListWidth_R(Self: TCustomImageList; var T: Integer); begin T := Self.Width; end;
procedure TCustomImageListShareImages_W(Self: TCustomImageList; const T: Boolean); begin Self.ShareImages := T; end;
procedure TCustomImageListShareImages_R(Self: TCustomImageList; var T: Boolean); begin T := Self.ShareImages; end;
procedure TCustomImageListMasked_W(Self: TCustomImageList; const T: Boolean); begin Self.Masked := T; end;
procedure TCustomImageListMasked_R(Self: TCustomImageList; var T: Boolean); begin T := Self.Masked; end;
procedure TCustomImageListImageType_W(Self: TCustomImageList; const T: TImageType); begin Self.ImageType := T; end;
procedure TCustomImageListImageType_R(Self: TCustomImageList; var T: TImageType); begin T := Self.ImageType; end;
procedure TCustomImageListHeight_W(Self: TCustomImageList; const T: Integer); begin Self.Height := T; end;
procedure TCustomImageListHeight_R(Self: TCustomImageList; var T: Integer); begin T := Self.Height; end;
procedure TCustomImageListDrawingStyle_W(Self: TCustomImageList; const T: TDrawingStyle); begin Self.DrawingStyle := T; end;
procedure TCustomImageListDrawingStyle_R(Self: TCustomImageList; var T: TDrawingStyle); begin T := Self.DrawingStyle; end;
procedure TCustomImageListBkColor_W(Self: TCustomImageList; const T: TColor); begin Self.BkColor := T; end;
procedure TCustomImageListBkColor_R(Self: TCustomImageList; var T: TColor); begin T := Self.BkColor; end;
procedure TCustomImageListGrayscaleFactor_W(Self: TCustomImageList; const T: Byte); begin Self.GrayscaleFactor := T; end;
procedure TCustomImageListGrayscaleFactor_R(Self: TCustomImageList; var T: Byte); begin T := Self.GrayscaleFactor; end;
procedure TCustomImageListBlendColor_W(Self: TCustomImageList; const T: TColor); begin Self.BlendColor := T; end;
procedure TCustomImageListBlendColor_R(Self: TCustomImageList; var T: TColor); begin T := Self.BlendColor; end;
procedure TCustomImageListAllocBy_W(Self: TCustomImageList; const T: Integer); begin Self.AllocBy := T; end;
procedure TCustomImageListAllocBy_R(Self: TCustomImageList; var T: Integer); begin T := Self.AllocBy; end;
procedure TCustomImageListScaling_R(Self: TCustomImageList; var T: Boolean); begin T := Self.Scaling; end;
procedure TCustomImageListHandle_W(Self: TCustomImageList; const T: LongInt); begin Self.Handle := T; end;
procedure TCustomImageListHandle_R(Self: TCustomImageList; var T: LongInt); begin T := Self.Handle; end;
procedure TCustomImageListColorDepth_W(Self: TCustomImageList; const T: TColorDepth); begin Self.ColorDepth := T; end;
procedure TCustomImageListColorDepth_R(Self: TCustomImageList; var T: TColorDepth); begin T := Self.ColorDepth; end;

procedure RIRegister_TCustomImageList(Cl: TPSRuntimeClassImporter);
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
    RegisterPropertyHelper(@TCustomImageListColorDepth_R,@TCustomImageListColorDepth_W,'ColorDepth');
    RegisterPropertyHelper(@TCustomImageListHandle_R,@TCustomImageListHandle_W,'Handle');
    RegisterPropertyHelper(@TCustomImageListScaling_R,nil,'Scaling');
    RegisterPropertyHelper(@TCustomImageListAllocBy_R,@TCustomImageListAllocBy_W,'AllocBy');
    RegisterPropertyHelper(@TCustomImageListBlendColor_R,@TCustomImageListBlendColor_W,'BlendColor');
    RegisterPropertyHelper(@TCustomImageListGrayscaleFactor_R,@TCustomImageListGrayscaleFactor_W,'GrayscaleFactor');
    RegisterPropertyHelper(@TCustomImageListBkColor_R,@TCustomImageListBkColor_W,'BkColor');
    RegisterPropertyHelper(@TCustomImageListDrawingStyle_R,@TCustomImageListDrawingStyle_W,'DrawingStyle');
    RegisterPropertyHelper(@TCustomImageListHeight_R,@TCustomImageListHeight_W,'Height');
    RegisterPropertyHelper(@TCustomImageListImageType_R,@TCustomImageListImageType_W,'ImageType');
    RegisterPropertyHelper(@TCustomImageListMasked_R,@TCustomImageListMasked_W,'Masked');
    RegisterPropertyHelper(@TCustomImageListShareImages_R,@TCustomImageListShareImages_W,'ShareImages');
    RegisterPropertyHelper(@TCustomImageListWidth_R,@TCustomImageListWidth_W,'Width');
    RegisterPropertyHelper(@TCustomImageListOnChange_R,@TCustomImageListOnChange_W,'OnChange');
  end;
end;

{ TImageList ----------------------------------------------------------------- }
procedure RIRegister_TImageList(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TImageList);
end;

{ TBalloonHint --------------------------------------------------------------- }
procedure RIRegister_TBalloonHint(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TBalloonHint) do
  begin
  end;
end;

{ TCustomHint ---------------------------------------------------------------- }
procedure TCustomHintHideAfter_W(Self: TCustomHint; const T: Integer); begin Self.HideAfter := T; end;
procedure TCustomHintHideAfter_R(Self: TCustomHint; var T: Integer); begin T := Self.HideAfter; end;
procedure TCustomHintDelay_W(Self: TCustomHint; const T: Cardinal); begin Self.Delay := T; end;
procedure TCustomHintDelay_R(Self: TCustomHint; var T: Cardinal); begin T := Self.Delay; end;
procedure TCustomHintStyle_W(Self: TCustomHint; const T: TBalloonHintStyle); begin Self.Style := T; end;
procedure TCustomHintStyle_R(Self: TCustomHint; var T: TBalloonHintStyle); begin T := Self.Style; end;
procedure TCustomHintImages_W(Self: TCustomHint; const T: TImageList); begin Self.Images := T; end;
procedure TCustomHintImages_R(Self: TCustomHint; var T: TImageList); begin T := Self.Images; end;
procedure TCustomHintImageIndex_W(Self: TCustomHint; const T: TImageIndex); begin Self.ImageIndex := T; end;
procedure TCustomHintImageIndex_R(Self: TCustomHint; var T: TImageIndex); begin T := Self.ImageIndex; end;
procedure TCustomHintDescription_W(Self: TCustomHint; const T: string); begin Self.Description := T; end;
procedure TCustomHintDescription_R(Self: TCustomHint; var T: string); begin T := Self.Description; end;
procedure TCustomHintTitle_W(Self: TCustomHint; const T: string); begin Self.Title := T; end;
procedure TCustomHintTitle_R(Self: TCustomHint; var T: string); begin T := Self.Title; end;
procedure TCustomHintShowingHint_R(Self: TCustomHint; var T: Boolean); begin T := Self.ShowingHint; end;
//procedure TCustomHintHideHint_P(Self: TCustomHint;  HidingControl : TControl); begin Self.HideHint(HidingControl); end;
procedure TCustomHintHideHint_P(Self: TCustomHint); begin Self.HideHint; end;
//procedure TCustomHintShowHint_P(Self: TCustomHint;  Control : TControl); begin Self.ShowHint(Control); end;
//procedure TCustomHintShowHint_P(Self: TCustomHint;  Rect : TRect); begin Self.ShowHint(Rect); end;
procedure TCustomHintShowHint_P(Self: TCustomHint;  Point : TPoint); begin Self.ShowHint(Point); end;
//procedure TCustomHintShowHint_P(Self: TCustomHint); begin Self.ShowHint; end;

procedure RIRegister_TCustomHint(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCustomHint) do
  begin
    RegisterMethod(@TCustomHintShowHint_P, 'ShowHint');
    //RegisterMethod(@TCustomHintShowHint_P, 'ShowHint');
    //RegisterMethod(@TCustomHintShowHint_P, 'ShowHint');
    //RegisterMethod(@TCustomHintShowHint_P, 'ShowHint');
    RegisterMethod(@TCustomHintHideHint_P, 'HideHint');
    //RegisterMethod(@TCustomHintHideHint_P, 'HideHint');
    RegisterVirtualMethod(@TCustomHint.PaintHint, 'PaintHint');
    RegisterVirtualMethod(@TCustomHint.NCPaintHint, 'NCPaintHint');
    RegisterVirtualMethod(@TCustomHint.SetHintSize, 'SetHintSize');
    RegisterPropertyHelper(@TCustomHintShowingHint_R,nil,'ShowingHint');
    RegisterPropertyHelper(@TCustomHintTitle_R,@TCustomHintTitle_W,'Title');
    RegisterPropertyHelper(@TCustomHintDescription_R,@TCustomHintDescription_W,'Description');
    RegisterPropertyHelper(@TCustomHintImageIndex_R,@TCustomHintImageIndex_W,'ImageIndex');
    RegisterPropertyHelper(@TCustomHintImages_R,@TCustomHintImages_W,'Images');
    RegisterPropertyHelper(@TCustomHintStyle_R,@TCustomHintStyle_W,'Style');
    RegisterPropertyHelper(@TCustomHintDelay_R,@TCustomHintDelay_W,'Delay');
    RegisterPropertyHelper(@TCustomHintHideAfter_R,@TCustomHintHideAfter_W,'HideAfter');
  end;
end;

{ TCustomHintShowHideThread -------------------------------------------------- }
function TCustomHintShowHideThreadCreate_P(Self: TClass; CreateNewInstance: Boolean;  Hint: TCustomHintWindow; HintObject: TCustomHint):TObject;
begin Result := TCustomHintShowHideThread.Create(Hint, HintObject); end;

procedure RIRegister_TCustomHintShowHideThread(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCustomHintShowHideThread) do
  begin
    RegisterConstructor(@TCustomHintShowHideThreadCreate_P, 'Create');
    RegisterMethod(@TCustomHintShowHideThread.ResumeWork, 'ResumeWork');
    RegisterMethod(@TCustomHintShowHideThread.HideHint, 'HideHint');
  end;
end;

{ TCustomHintWindow ---------------------------------------------------------- }
procedure TCustomHintWindowImageIndex_R(Self: TCustomHintWindow; var T: TImageIndex); begin T := Self.ImageIndex; end;
procedure TCustomHintWindowDescription_R(Self: TCustomHintWindow; var T: string); begin T := Self.Description; end;
procedure TCustomHintWindowTitle_R(Self: TCustomHintWindow; var T: string); begin T := Self.Title; end;
procedure TCustomHintWindowPopAbove_R(Self: TCustomHintWindow; var T: Boolean); begin T := Self.PopAbove; end;
procedure TCustomHintWindowHintParent_W(Self: TCustomHintWindow; const T: TCustomHint); begin Self.HintParent := T; end;
procedure TCustomHintWindowHintParent_R(Self: TCustomHintWindow; var T: TCustomHint); begin T := Self.HintParent; end;
//procedure TCustomHintWindowPositionAt_P(Self: TCustomHintWindow;  Rect: TRect); begin Self.PositionAt(Rect); end;
procedure TCustomHintWindowPositionAt_P(Self: TCustomHintWindow;  Point: TPoint); begin Self.PositionAt(Point); end;

procedure RIRegister_TCustomHintWindow(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCustomHintWindow) do
  begin
    RegisterMethod(@TCustomHintWindow.AutoSize, 'AutoSize');
    //RegisterMethod(@TCustomHintWindowPositionAt_P, 'PositionAt');
    RegisterMethod(@TCustomHintWindowPositionAt_P, 'PositionAt');
    RegisterMethod(@TCustomHintWindow.PositionAtCursor, 'PositionAtCursor');
    RegisterPropertyHelper(@TCustomHintWindowHintParent_R,@TCustomHintWindowHintParent_W,'HintParent');
    RegisterPropertyHelper(@TCustomHintWindowPopAbove_R,nil,'PopAbove');
    RegisterPropertyHelper(@TCustomHintWindowTitle_R,nil,'Title');
    RegisterPropertyHelper(@TCustomHintWindowDescription_R,nil,'Description');
    RegisterPropertyHelper(@TCustomHintWindowImageIndex_R,nil,'ImageIndex');
  end;
end;

{ THintWindow ---------------------------------------------------------------- }
procedure RIRegister_THintWindow(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(THintWindow) do
  begin
    RegisterVirtualMethod(@THintWindow.ActivateHint, 'ActivateHint');
    RegisterVirtualMethod(@THintWindow.IsHintMsg, 'IsHintMsg');
    RegisterVirtualMethod(@THintWindow.ShouldHideHint, 'ShouldHideHint');
    RegisterMethod(@THintWindow.ReleaseHandle, 'ReleaseHandle');
    RegisterVirtualMethod(@THintWindow.ActivateHintData, 'ActivateHintData');
    RegisterVirtualMethod(@THintWindow.CalcHintRect, 'CalcHintRect');
  end;
end;

{ TPadding ------------------------------------------------------------------- }
procedure RIRegister_TPadding(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TPadding) do
  begin
  end;
end;

{ TMargins ------------------------------------------------------------------- }
procedure TMarginsBottom_W(Self: TMargins; const T: TMarginSize); begin Self.Bottom := T; end;
procedure TMarginsBottom_R(Self: TMargins; var T: TMarginSize); begin T := Self.Bottom; end;
procedure TMarginsRight_W(Self: TMargins; const T: TMarginSize); begin Self.Right := T; end;
procedure TMarginsRight_R(Self: TMargins; var T: TMarginSize); begin T := Self.Right; end;
procedure TMarginsTop_W(Self: TMargins; const T: TMarginSize); begin Self.Top := T; end;
procedure TMarginsTop_R(Self: TMargins; var T: TMarginSize); begin T := Self.Top; end;
procedure TMarginsLeft_W(Self: TMargins; const T: TMarginSize); begin Self.Left := T; end;
procedure TMarginsLeft_R(Self: TMargins; var T: TMarginSize); begin T := Self.Left; end;
procedure TMarginsOnChange_W(Self: TMargins; const T: TNotifyEvent); begin Self.OnChange := T; end;
procedure TMarginsOnChange_R(Self: TMargins; var T: TNotifyEvent); begin T := Self.OnChange; end;
procedure TMarginsExplicitHeight_R(Self: TMargins; var T: Integer); begin T := Self.ExplicitHeight; end;
procedure TMarginsExplicitWidth_R(Self: TMargins; var T: Integer); begin T := Self.ExplicitWidth; end;
procedure TMarginsExplicitTop_R(Self: TMargins; var T: Integer); begin T := Self.ExplicitTop; end;
procedure TMarginsExplicitLeft_R(Self: TMargins; var T: Integer); begin T := Self.ExplicitLeft; end;
procedure TMarginsControlHeight_R(Self: TMargins; var T: Integer); begin T := Self.ControlHeight; end;
procedure TMarginsControlWidth_R(Self: TMargins; var T: Integer); begin T := Self.ControlWidth; end;
procedure TMarginsControlTop_R(Self: TMargins; var T: Integer); begin T := Self.ControlTop; end;
procedure TMarginsControlLeft_R(Self: TMargins; var T: Integer); begin T := Self.ControlLeft; end;
procedure TMarginsSetControlBounds_P(Self: TMargins;  const ARect : TRect; Aligning : Boolean); begin Self.SetControlBounds(ARect, Aligning); end;
//procedure TMarginsSetControlBounds_P(Self: TMargins;  ALeft, ATop, AWidth, AHeight : Integer; Aligning : Boolean); begin Self.SetControlBounds(ALeft, ATop, AWidth, AHeight, Aligning); end;

procedure RIRegister_TMargins(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TMargins) do
  begin
    RegisterVirtualConstructor(@TMargins.Create, 'Create');
    //RegisterMethod(@TMarginsSetControlBounds_P, 'SetControlBounds');
    RegisterMethod(@TMarginsSetControlBounds_P, 'SetControlBounds');
    RegisterMethod(@TMargins.SetBounds, 'SetBounds');
    RegisterPropertyHelper(@TMarginsControlLeft_R,nil,'ControlLeft');
    RegisterPropertyHelper(@TMarginsControlTop_R,nil,'ControlTop');
    RegisterPropertyHelper(@TMarginsControlWidth_R,nil,'ControlWidth');
    RegisterPropertyHelper(@TMarginsControlHeight_R,nil,'ControlHeight');
    RegisterPropertyHelper(@TMarginsExplicitLeft_R,nil,'ExplicitLeft');
    RegisterPropertyHelper(@TMarginsExplicitTop_R,nil,'ExplicitTop');
    RegisterPropertyHelper(@TMarginsExplicitWidth_R,nil,'ExplicitWidth');
    RegisterPropertyHelper(@TMarginsExplicitHeight_R,nil,'ExplicitHeight');
    RegisterPropertyHelper(@TMarginsOnChange_R,@TMarginsOnChange_W,'OnChange');
    RegisterPropertyHelper(@TMarginsLeft_R,@TMarginsLeft_W,'Left');
    RegisterPropertyHelper(@TMarginsTop_R,@TMarginsTop_W,'Top');
    RegisterPropertyHelper(@TMarginsRight_R,@TMarginsRight_W,'Right');
    RegisterPropertyHelper(@TMarginsBottom_R,@TMarginsBottom_W,'Bottom');
  end;
end;
{$ENDIF}

(*----------------------------------------------------------------------------*)
procedure RIRegister_Controls(Cl: TPSRuntimeClassImporter);
begin
  RIRegister_TDragObject(Cl);
  RIRegisterTSizeConstraints(Cl);
{$IFNDEF PS_MINIVCL}
  RIRegister_TMargins(Cl);
  RIRegister_TPadding(Cl);
{$ENDIF}
  RIRegisterTControl(Cl);
  RIRegisterTWinControl(Cl);
  RIRegisterTGraphicControl(Cl);
  RIRegisterTCustomControl(Cl);
{$IFNDEF PS_MINIVCL}
  RIRegister_THintWindow(Cl);
  RIRegister_TCustomImageList(Cl);
  RIRegister_TImageList(Cl);
  with Cl.Add(TCustomHintShowHideThread) do
  RIRegister_TCustomHintWindow(Cl);
  RIRegister_TCustomHintShowHideThread(Cl);
  RIRegister_TCustomHint(Cl);
  RIRegister_TBalloonHint(Cl);
{$ENDIF}
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)
end.
