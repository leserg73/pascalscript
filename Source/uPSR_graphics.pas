{ Runtime Graphics support }
unit uPSR_graphics;

{$I PascalScript.inc}

interface

uses
  uPSRuntime, uPSUtils;

procedure RIRegisterTGRAPHICSOBJECT(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTFont(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTPEN(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTBRUSH(Cl: TPSRuntimeClassImporter);
{$IFNDEF PS_MINIVCL}
  procedure RIRegisterTCustomCanvas(Cl: TPSRuntimeClassImporter);
{$ENDIF}
procedure RIRegisterTCanvas(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTGraphic(Cl: TPSRuntimeClassImporter; Streams: Boolean);
procedure RIRegisterTBitmap(Cl: TPSRuntimeClassImporter; Streams: Boolean);
procedure RIRegisterTPicture(Cl: TPSRuntimeClassImporter; Streams: Boolean);
{$IFNDEF PS_MINIVCL}
  procedure RIRegisterTIcon(Cl: TPSRuntimeClassImporter; Streams: Boolean);
  procedure RIRegisterTMetafile(Cl: TPSRuntimeClassImporter);   //3.6
  procedure RIRegisterTMetafileCanvas(Cl: TPSRuntimeClassImporter);
  procedure RIRegisterTPngImage(Cl: TPSRuntimeClassImporter; Streams: Boolean);
{$ENDIF}

procedure RIRegister_Graphics(Cl: TPSRuntimeClassImporter; Streams: Boolean);

implementation
{$IFNDEF FPC}
uses
  Classes
  {$IFDEF CLX}
    , QGraphics
  {$ELSE}
    , Windows, Graphics
  {$IFNDEF PS_MINIVCL}
    {$IFDEF VER200}
      , pngimage, jpeg
    {$ELSE}
      , Imaging.pngimage, Imaging.jpeg
    {$ENDIF}
  {$ENDIF}
  {$ENDIF}
  {$IFDEF DELPHI_TOKYO_UP}
    , UITypes
  {$ENDIF};

{$ELSE}
uses
  Classes, Graphics, LCLType;
{$ENDIF}

{ TGraphicsObject ------------------------------------------------------------ }
procedure TGRAPHICSOBJECTONCHANGE_W(Self: TGraphicsObject; T: TNotifyEvent); begin Self.OnChange := t; end;
procedure TGRAPHICSOBJECTONCHANGE_R(Self: TGraphicsObject; var T: TNotifyEvent); begin T :=Self.OnChange; end;

procedure RIRegisterTGRAPHICSOBJECT(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TGRAPHICSOBJECT) do
  begin
    RegisterPropertyHelper(@TGRAPHICSOBJECTONCHANGE_R, @TGRAPHICSOBJECTONCHANGE_W, 'OnChange');
  end;
end;

{ TFont ---------------------------------------------------------------------- }
{$IFNDEF CLX}
  procedure TFontHandleR(Self: TFont; var T: Longint); begin T := Self.Handle; end;
  procedure TFontHandleW(Self: TFont; T: Longint); begin Self.Handle := T; end;
{$ENDIF}
procedure TFontPixelsPerInchR(Self: TFont; var T: Longint); begin T := Self.PixelsPerInch; end;
procedure TFontPixelsPerInchW(Self: TFont; T: Longint); begin {$IFNDEF FPC} Self.PixelsPerInch := T;{$ENDIF} end;
procedure TFontStyleR(Self: TFont; var T: TFontStyles); begin T := Self.Style; end;
procedure TFontStyleW(Self: TFont; T: TFontStyles); begin Self.Style:= T; end;
procedure TFontCharset_W(Self: TFont; const T: TFontCharset); begin Self.Charset := T; end;
procedure TFontCharset_R(Self: TFont; var T: TFontCharset); begin T := Self.Charset; end;
procedure TFontPitch_W(Self: TFont; const T: TFontPitch); begin Self.Pitch := T; end;
procedure TFontPitch_R(Self: TFont; var T: TFontPitch); begin T := Self.Pitch; end;
procedure TFontOrientation_W(Self: TFont; const T: Integer); begin Self.Orientation := T; end;
procedure TFontOrientation_R(Self: TFont; var T: Integer); begin T := Self.Orientation; end;
{$IFNDEF PS_MINIVCL}
  procedure TFontQuality_W(Self: TFont; const T: TFontQuality); begin Self.Quality := T; end;
  procedure TFontQuality_R(Self: TFont; var T: TFontQuality); begin T := Self.Quality; end;
{$ENDIF}

procedure RIRegisterTFont(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TFont) do
  begin
    RegisterConstructor(@TFont.Create, 'Create');
{$IFNDEF CLX}
    RegisterPropertyHelper(@TFontHandleR, @TFontHandleW, 'Handle');
{$ENDIF}
    RegisterPropertyHelper(@TFontPixelsPerInchR, @TFontPixelsPerInchW, 'PixelsPerInch');
    RegisterPropertyHelper(@TFontStyleR, @TFontStyleW, 'Style');
    RegisterPropertyHelper(@TFontCharset_R,@TFontCharset_W,'Charset');
    RegisterPropertyHelper(@TFontOrientation_R,@TFontOrientation_W,'Orientation');
    RegisterPropertyHelper(@TFontPitch_R,@TFontPitch_W,'Pitch');
    {$IFNDEF PS_MINIVCL}
      RegisterPropertyHelper(@TFontQuality_R,@TFontQuality_W,'Quality');
    {$ENDIF}
  end;
end;

{$IFNDEF PS_MINIVCL}
{ TCustomCanvas -------------------------------------------------------------- }
procedure TCustomCanvasOnChanging_W(Self: TCustomCanvas; const T: TNotifyEvent); begin Self.OnChanging := T; end;
procedure TCustomCanvasOnChanging_R(Self: TCustomCanvas; var T: TNotifyEvent); begin T := Self.OnChanging; end;
procedure TCustomCanvasOnChange_W(Self: TCustomCanvas; const T: TNotifyEvent); begin Self.OnChange := T; end;
procedure TCustomCanvasOnChange_R(Self: TCustomCanvas; var T: TNotifyEvent); begin T := Self.OnChange; end;
procedure TCustomCanvasTextFlags_W(Self: TCustomCanvas; const T: Longint); begin Self.TextFlags := T; end;
procedure TCustomCanvasTextFlags_R(Self: TCustomCanvas; var T: Longint); begin T := Self.TextFlags; end;
procedure TCustomCanvasPixels_W(Self: TCustomCanvas; const T: TColor; const t1: Integer; const t2: Integer); begin Self.Pixels[t1, t2] := T; end;
procedure TCustomCanvasPixels_R(Self: TCustomCanvas; var T: TColor; const t1: Integer; const t2: Integer); begin T := Self.Pixels[t1, t2]; end;
procedure TCustomCanvasPenPos_W(Self: TCustomCanvas; const T: TPoint); begin Self.PenPos := T; end;
procedure TCustomCanvasPenPos_R(Self: TCustomCanvas; var T: TPoint); begin T := Self.PenPos; end;
procedure TCustomCanvasCanvasOrientation_R(Self: TCustomCanvas; var T: TCanvasOrientation); begin T := Self.CanvasOrientation; end;
procedure TCustomCanvasLockCount_R(Self: TCustomCanvas; var T: Integer); begin T := Self.LockCount; end;
procedure TCustomCanvasClipRect_R(Self: TCustomCanvas; var T: TRect); begin T := Self.ClipRect; end;
procedure TCustomCanvasTextRect_P(Self: TCustomCanvas; Rect: TRect; X, Y: Integer; const Text: string); begin Self.TextRect(Rect, X, Y, Text); end;
procedure TCustomCanvasTextRect1_P(Self: TCustomCanvas; var Rect: TRect; var Text: string; TextFormat: TTextFormat); begin Self.TextRect(Rect, Text, TextFormat); end;
procedure TCustomCanvasRoundRect1_P(Self: TCustomCanvas; const Rect: TRect; CX, CY: Integer); begin Self.RoundRect(Rect, CX, CY); end;
procedure TCustomCanvasRoundRect_P(Self: TCustomCanvas; X1, Y1, X2, Y2, X3, Y3: Integer); begin Self.RoundRect(X1, Y1, X2, Y2, X3, Y3); end;
procedure TCustomCanvasRectangle1_P(Self: TCustomCanvas; const Rect: TRect); begin Self.Rectangle(Rect); end;
procedure TCustomCanvasRectangle_P(Self: TCustomCanvas; X1, Y1, X2, Y2: Integer); begin Self.Rectangle(X1, Y1, X2, Y2); end;
procedure TCustomCanvasEllipse1_P(Self: TCustomCanvas; const Rect: TRect); begin Self.Ellipse(Rect); end;
procedure TCustomCanvasEllipse_P(Self: TCustomCanvas; X1, Y1, X2, Y2: Integer); begin Self.Ellipse(X1, Y1, X2, Y2); end;
procedure TCustomCanvasDraw1_P(Self: TCustomCanvas; X, Y: Integer; Graphic: TGraphic; Opacity: Byte); begin Self.Draw(X, Y, Graphic, Opacity); end;
procedure TCustomCanvasDraw_P(Self: TCustomCanvas; X, Y: Integer; Graphic: TGraphic); begin Self.Draw(X, Y, Graphic); end;

procedure RIRegisterTCustomCanvas(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCustomCanvas) do
  begin
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.Arc, 'Arc');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.ArcTo, 'ArcTo');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.AngleArc, 'AngleArc');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.BrushCopy, 'BrushCopy');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.Chord, 'Chord');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.Draw, 'Draw');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.Draw, 'Draw1');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.DrawFocusRect, 'DrawFocusRect');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.Ellipse, 'Ellipse');
    RegisterMethod(@TCustomCanvasEllipse1_P, 'Ellipse1');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.FillRect, 'FillRect');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.FloodFill, 'FloodFill');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.FrameRect, 'FrameRect');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.LineTo, 'LineTo');
    RegisterMethod(@TCustomCanvas.Lock, 'Lock');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.MoveTo, 'MoveTo');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.Pie, 'Pie');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.Polygon, 'Polygon');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.Polyline, 'Polyline');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.PolyBezier, 'PolyBezier');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.PolyBezierTo, 'PolyBezierTo');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.Rectangle, 'Rectangle');
    RegisterMethod(@TCustomCanvasRectangle1_P, 'Rectangle1');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.Refresh, 'Refresh');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.RoundRect, 'RoundRect');
    RegisterMethod(@TCustomCanvasRoundRect1_P, 'RoundRect1');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.StretchDraw, 'StretchDraw');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.TextExtent, 'TextExtent');
    RegisterMethod(@TCustomCanvas.TextHeight, 'TextHeight');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.TextOut, 'TextOut');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.TextRect, 'TextRect');
    RegisterVirtualAbstractMethod(TCustomCanvas, @TCustomCanvas.TextRect, 'TextRect1');
    RegisterMethod(@TCustomCanvas.TextWidth, 'TextWidth');
    RegisterMethod(@TCustomCanvas.TryLock, 'TryLock');
    RegisterMethod(@TCustomCanvas.Unlock, 'Unlock');
    RegisterPropertyHelper(@TCustomCanvasClipRect_R,nil,'ClipRect');
    RegisterPropertyHelper(@TCustomCanvasLockCount_R,nil,'LockCount');
    RegisterPropertyHelper(@TCustomCanvasCanvasOrientation_R,nil,'CanvasOrientation');
    RegisterPropertyHelper(@TCustomCanvasPenPos_R,@TCustomCanvasPenPos_W,'PenPos');
    RegisterPropertyHelper(@TCustomCanvasPixels_R,@TCustomCanvasPixels_W,'Pixels');
    RegisterPropertyHelper(@TCustomCanvasTextFlags_R,@TCustomCanvasTextFlags_W,'TextFlags');
    RegisterPropertyHelper(@TCustomCanvasOnChange_R,@TCustomCanvasOnChange_W,'OnChange');
    RegisterPropertyHelper(@TCustomCanvasOnChanging_R,@TCustomCanvasOnChanging_W,'OnChanging');
  end;
end;
{$ENDIF}

{ TCanvas -------------------------------------------------------------------- }
{$IFNDEF CLX}
  procedure TCanvasHandleR(Self: TCanvas; var T: Longint); begin T := Self.Handle; end;
  procedure TCanvasHandleW(Self: TCanvas; T: Longint); begin Self.Handle:= T; end;
{$ENDIF}

procedure TCanvasPixelsR(Self: TCanvas; var T: Longint; X,Y: Longint); begin T := Self.Pixels[X,Y]; end;
procedure TCanvasPixelsW(Self: TCanvas; T, X, Y: Longint); begin Self.Pixels[X,Y]:= T; end;
{$IFDEF FPC}
  procedure TCanvasArc(Self: TCanvas; X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer); begin Self.Arc(X1, Y1, X2, Y2, X3, Y3, X4, Y4); end;
  procedure TCanvasChord(Self: TCanvas; X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer); begin self.Chord(X1, Y1, X2, Y2, X3, Y3, X4, Y4); end;
  procedure TCanvasFillRect(Self: TCanvas; const Rect: TRect); begin self.FillRect(rect); end;
  procedure TCanvasFloodFill(Self: TCanvas; X, Y: Integer; Color: TColor; FillStyle: TFillStyle); begin self.FloodFill(x,y,color,fillstyle); end;
{$ENDIF}
procedure TCanvasDraw(Self: TCanvas; X, Y: Integer; Graphic: TGraphic); begin Self.Draw(X, Y, Graphic); end;
procedure TCanvasDraw2(Self: TCanvas; X, Y: Integer; Graphic: TGraphic; Opacity:Byte); begin Self.Draw(X, Y, Graphic, Opacity); end;
procedure TCanvasEllipse(Self: TCanvas; X1, Y1, X2, Y2: Integer); begin self.Ellipse(X1, Y1, X2, Y2); end;
procedure TCanvasEllipse2(Self: TCanvas; const Rect: TRect); begin self.Ellipse(Rect); end;
procedure TCanvasRectangle(Self: TCanvas; X1,Y1,X2,Y2: integer); begin self.Rectangle(x1,y1,x2,y2); end;
procedure TCanvasRectangle2(Self: TCanvas; const Rect: TRect); begin self.Rectangle(Rect); end;
procedure TCanvasRoundRect(Self: TCanvas; X1, Y1, X2, Y2, X3, Y3 : integer); begin self.RoundRect(X1, Y1, X2, Y2, X3, Y3); end;
procedure TCanvasRoundRect2(Self: TCanvas; const Rect: TRect; CX, CY: Integer); begin self.RoundRect(Rect, CX, CY); end;
procedure TCanvasTextRect(Self: TCanvas; Rect: TRect; X: Integer; Y: Integer; const Text: string); begin Self.TextRect(Rect, X, Y, Text); end;
procedure TCanvasTextRect2(Self: TCanvas; var Rect: TRect; var Text: string; TextFormat: TTextFormat); begin Self.TextRect(Rect, Text, TextFormat); end;

procedure RIRegisterTCanvas(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCanvas) do
  begin
    RegisterConstructor(@TCanvas.Create, 'Create');
    RegisterMethod(@TCanvas.CopyRect, 'CopyRect');
    RegisterMethod(@TCanvas.HandleAllocated, 'HandleAllocated');
  {$IFDEF FPC}
    RegisterMethod(@TCanvasArc, 'Arc');
    RegisterMethod(@TCanvasChord, 'Chord');
    RegisterMethod(@TCanvasRectangle, 'Rectangle');
    RegisterMethod(@TCanvasRoundRect, 'RoundRect');
    RegisterMethod(@TCanvasEllipse, 'Ellipse');
    RegisterMethod(@TCanvasFillRect, 'FillRect');
    RegisterMethod(@TCanvasFloodFill, 'FloodFill');
  {$ELSE}  
    RegisterMethod(@TCanvas{$IFNDEF FPC}.{$ENDIF}Arc, 'Arc');
    RegisterMethod(@TCanvas{$IFNDEF FPC}.{$ENDIF}Chord, 'Chord');
    RegisterMethod(@TCanvas{$IFNDEF FPC}.{$ENDIF}Rectangle, 'Rectangle');
    RegisterMethod(@TCanvas{$IFNDEF FPC}.{$ENDIF}RoundRect, 'RoundRect');
    RegisterMethod(@TCanvas{$IFNDEF FPC}.{$ENDIF}Ellipse, 'Ellipse');
    RegisterMethod(@TCanvas{$IFNDEF FPC}.{$ENDIF}FillRect, 'FillRect');
    {$IFNDEF CLX}
      RegisterMethod(@TCanvas{$IFNDEF FPC}.{$ENDIF}FloodFill, 'FloodFill');
    {$ENDIF}
  {$ENDIF}
    RegisterMethod(@TCanvasDraw, 'Draw');
    RegisterMethod(@TCanvasDraw2, 'Draw2');
    RegisterMethod(@TCanvasEllipse, 'Ellipse');
    RegisterMethod(@TCanvasEllipse2, 'Ellipse2');
    RegisterMethod(@TCanvas.Lineto, 'LineTo');
    RegisterMethod(@TCanvas.Moveto, 'MoveTo');
    RegisterMethod(@TCanvas.Pie, 'Pie');
    RegisterMethod(@TCanvasRectangle, 'Rectangle');
    RegisterMethod(@TCanvasRectangle2, 'Rectangle2');
    RegisterMethod(@TCanvasRoundRect, 'RoundRect');
    RegisterMethod(@TCanvasRoundRect2, 'RoundRect2');
    RegisterMethod(@TCanvas.Refresh, 'Refresh');
    RegisterMethod(@TCanvas.TextHeight, 'TextHeight');
    RegisterMethod(@TCanvas.TextOut, 'TextOut');
    RegisterMethod(@TCanvasTextRect, 'TextRect');
    RegisterMethod(@TCanvasTextRect2, 'TextRect2');
    RegisterMethod(@TCanvas.TextWidth, 'TextWidth');
  {$IFNDEF CLX}
    RegisterPropertyHelper(@TCanvasHandleR, @TCanvasHandleW, 'Handle');
  {$ENDIF}
    RegisterPropertyHelper(@TCanvasPixelsR, @TCanvasPixelsW, 'Pixels');
  end;
end;

{ TPen ----------------------------------------------------------------------- }
{$IFNDEF PS_MINIVCL}
  procedure TPenHandle_W(Self: TPen; const T: HPen); begin Self.Handle := T; end;
  procedure TPenHandle_R(Self: TPen; var T: HPen); begin T := Self.Handle; end;
{$ENDIF}
procedure TPenWidth_W(Self: TPen; const T: Integer); begin Self.Width := T; end;
procedure TPenWidth_R(Self: TPen; var T: Integer); begin T := Self.Width; end;
procedure TPenStyle_W(Self: TPen; const T: TPenStyle); begin Self.Style := T; end;
procedure TPenStyle_R(Self: TPen; var T: TPenStyle); begin T := Self.Style; end;
procedure TPenMode_W(Self: TPen; const T: TPenMode); begin Self.Mode := T; end;
procedure TPenMode_R(Self: TPen; var T: TPenMode); begin T := Self.Mode; end;
procedure TPenColor_W(Self: TPen; const T: TColor); begin Self.Color := T; end;
procedure TPenColor_R(Self: TPen; var T: TColor); begin T := Self.Color; end;

procedure RIRegisterTPEN(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TPEN) do
  begin
    RegisterConstructor(@TPEN.CREATE, 'Create');
    {$IFNDEF PS_MINIVCL}
      RegisterPropertyHelper(@TPenHandle_R,@TPenHandle_W,'Handle');
    {$ENDIF}
    RegisterPropertyHelper(@TPenColor_R,@TPenColor_W,'Color');
    RegisterPropertyHelper(@TPenMode_R,@TPenMode_W,'Mode');
    RegisterPropertyHelper(@TPenStyle_R,@TPenStyle_W,'Style');
    RegisterPropertyHelper(@TPenWidth_R,@TPenWidth_W,'Width');
  end;
end;

{ TBrush --------------------------------------------------------------------- }
{$IFNDEF PS_MINIVCL}
  procedure TBrushHandle_W(Self: TBrush; const T: HBrush); begin Self.Handle := T; end;
  procedure TBrushHandle_R(Self: TBrush; var T: HBrush); begin T := Self.Handle; end;
  procedure TBrushBitmap_W(Self: TBrush; const T: TBitmap); begin Self.Bitmap := T; end;
  procedure TBrushBitmap_R(Self: TBrush; var T: TBitmap); begin T := Self.Bitmap; end;
{$ENDIF}
procedure TBrushStyle_W(Self: TBrush; const T: TBrushStyle); begin Self.Style := T; end;
procedure TBrushStyle_R(Self: TBrush; var T: TBrushStyle); begin T := Self.Style; end;
procedure TBrushColor_W(Self: TBrush; const T: TColor); begin Self.Color := T; end;
procedure TBrushColor_R(Self: TBrush; var T: TColor); begin T := Self.Color; end;

procedure RIRegisterTBRUSH(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TBRUSH) do
  begin
    RegisterConstructor(@TBRUSH.CREATE, 'Create');
    {$IFNDEF PS_MINIVCL}
      RegisterPropertyHelper(@TBrushHandle_R,@TBrushHandle_W,'Handle');
      RegisterPropertyHelper(@TBrushBitmap_R,@TBrushBitmap_W,'Bitmap');
    {$ENDIF}
    RegisterPropertyHelper(@TBrushColor_R,@TBrushColor_W,'Color');
    RegisterPropertyHelper(@TBrushStyle_R,@TBrushStyle_W,'Style');
  end;
end;

{ TGraphic ------------------------------------------------------------------- }
procedure TGraphicOnChange_W(Self: TGraphic; const T: TNotifyEvent); begin Self.OnChange := T; end;
procedure TGraphicOnChange_R(Self: TGraphic; var T: TNotifyEvent); begin T := Self.OnChange; end;
procedure TGraphicWidth_W(Self: TGraphic; const T: Integer); begin Self.Width := T; end;
procedure TGraphicWidth_R(Self: TGraphic; var T: Integer); begin T := Self.Width; end;
procedure TGraphicModified_W(Self: TGraphic; const T: Boolean); begin Self.Modified := T; end;
procedure TGraphicModified_R(Self: TGraphic; var T: Boolean); begin T := Self.Modified; end;
procedure TGraphicHeight_W(Self: TGraphic; const T: Integer); begin Self.Height := T; end;
procedure TGraphicHeight_R(Self: TGraphic; var T: Integer); begin T := Self.Height; end;
procedure TGraphicEmpty_R(Self: TGraphic; var T: Boolean); begin T := Self.Empty; end;
procedure TGraphicTransparent_W(Self: TGraphic; const T: Boolean); begin Self.Transparent := T; end;
procedure TGraphicTransparent_R(Self: TGraphic; var T: Boolean); begin T := Self.Transparent; end;
procedure TGraphicPaletteModified_W(Self: TGraphic; const T: Boolean); begin Self.PaletteModified := T; end;
procedure TGraphicPaletteModified_R(Self: TGraphic; var T: Boolean); begin T := Self.PaletteModified; end;
procedure TGraphicPalette_W(Self: TGraphic; const T: HPALETTE); begin Self.Palette := T; end;
procedure TGraphicPalette_R(Self: TGraphic; var T: HPALETTE); begin T := Self.Palette; end;

procedure RIRegisterTGraphic(Cl: TPSRuntimeClassImporter; Streams: Boolean);
begin
  with Cl.Add(TGraphic) do
  begin
    RegisterVirtualConstructor(@TGraphic.Create, 'Create');
    if Streams then begin
      RegisterVirtualAbstractMethod(TGraphic, @TGraphic.LoadFromStream, 'LoadFromStream');
      RegisterVirtualAbstractMethod(TGraphic, @TGraphic.SaveToStream, 'SaveToStream');
    end;
    RegisterVirtualMethod(@TGraphic.LoadFromFile, 'LoadFromFile');
    RegisterVirtualMethod(@TGraphic.SaveToFile, 'SaveToFile');
    RegisterVirtualMethod(@TGraphic.SetSize, 'SetSize');
    RegisterPropertyHelper(@TGraphicEmpty_R,nil,'Empty');
    RegisterPropertyHelper(@TGraphicHeight_R,@TGraphicHeight_W,'Height');
    RegisterPropertyHelper(@TGraphicWidth_R,@TGraphicWidth_W,'Width');
    RegisterPropertyHelper(@TGraphicOnChange_R,@TGraphicOnChange_W,'OnChange');
    RegisterPropertyHelper(@TGraphicPalette_R, @TGraphicPalette_W, 'Palette');
    RegisterPropertyHelper(@TGraphicPaletteModified_R, @TGraphicPaletteModified_W, 'PaletteModified');
    RegisterPropertyHelper(@TGraphicTransparent_R, @TGraphicTransparent_W, 'Transparent');
    {$IFNDEF PS_MINIVCL}
      RegisterPropertyHelper(@TGraphicModified_R,@TGraphicModified_W,'Modified');
    {$ENDIF}
  end;
end;

{ TBitmap -------------------------------------------------------------------- }
procedure TBitmapTransparentColor_W(Self: TBitmap; const T: TColor); begin Self.TransparentColor := T; end;
procedure TBitmapTransparentColor_R(Self: TBitmap; var T: TColor); begin T := Self.TransparentColor; end;
{$IFNDEF CLX}
  {$IFNDEF FPC}
    procedure TBitmapIgnorePalette_W(Self: TBitmap; const T: Boolean); begin Self.IgnorePalette := T; end;
    procedure TBitmapIgnorePalette_R(Self: TBitmap; var T: Boolean); begin T := Self.IgnorePalette; end;
  {$ENDIF}
  procedure TBitmapPalette_W(Self: TBitmap; const T: HPALETTE); begin Self.Palette := T; end;
  procedure TBitmapPalette_R(Self: TBitmap; var T: HPALETTE); begin T := Self.Palette; end;
{$ENDIF}
procedure TBitmapMonochrome_W(Self: TBitmap; const T: Boolean); begin Self.Monochrome := T; end;
procedure TBitmapMonochrome_R(Self: TBitmap; var T: Boolean); begin T := Self.Monochrome; end;
{$IFNDEF CLX}
  procedure TBitmapHandle_W(Self: TBitmap; const T: HBITMAP); begin Self.Handle := T; end;
  procedure TBitmapHandle_R(Self: TBitmap; var T: HBITMAP); begin T := Self.Handle; end;
{$ENDIF}
procedure TBitmapCanvas_R(Self: TBitmap; var T: TCanvas); begin T := Self.Canvas; end;
procedure TBitmapTransparentMode_W(Self: TBitmap; const T: TTransparentMode); begin Self.TransparentMode := T; end;
procedure TBitmapTransparentMode_R(Self: TBitmap; var T: TTransparentMode); begin T := Self.TransparentMode; end;
procedure TBitmapScanLine_R(Self: TBitmap; var T: Pointer; const t1: Integer); begin T := Self.ScanLine[t1]; end;
procedure TBitmapPixelFormat_W(Self: TBitmap; const T: TPixelFormat); begin Self.PixelFormat := T; end;
procedure TBitmapPixelFormat_R(Self: TBitmap; var T: TPixelFormat); begin T := Self.PixelFormat; end;
procedure TBitmapMaskHandle_W(Self: TBitmap; const T: HBITMAP); begin Self.MaskHandle := T; end;
procedure TBitmapMaskHandle_R(Self: TBitmap; var T: HBITMAP); begin T := Self.MaskHandle; end;
procedure TBitmapHandleType_W(Self: TBitmap; const T: TBitmapHandleType); begin Self.HandleType := T; end;
procedure TBitmapHandleType_R(Self: TBitmap; var T: TBitmapHandleType); begin T := Self.HandleType; end;

procedure RIRegisterTBitmap(Cl: TPSRuntimeClassImporter; Streams: Boolean);
begin
  with Cl.Add(TBitmap) do
  begin
    RegisterConstructor(@TBitmap.Create, 'Create');
    if Streams then begin
      RegisterMethod(@TBitmap.LoadFromStream, 'LoadFromStream');
      RegisterMethod(@TBitmap.SaveToStream, 'SaveToStream');
    end;
    RegisterPropertyHelper(@TBitmapCanvas_R,nil,'Canvas');
    {$IFNDEF CLX}
      RegisterPropertyHelper(@TBitmapHandle_R,@TBitmapHandle_W,'Handle');
    {$ENDIF}
    {$IFNDEF PS_MINIVCL}
      {$IFNDEF FPC}
        RegisterMethod(@TBitmap.Dormant, 'Dormant');
      {$ENDIF}
      RegisterMethod(@TBitmap.FreeImage, 'FreeImage');
      {$IFNDEF CLX}
        RegisterMethod(@TBitmap.LoadFromClipboardFormat, 'LoadFromClipboardFormat');
      {$ENDIF}
      RegisterMethod(@TBitmap.LoadFromResourceName, 'LoadFromResourceName');
      RegisterMethod(@TBitmap.LoadFromResourceID, 'LoadFromResourceID');
      {$IFNDEF CLX}
      RegisterMethod(@TBitmap.ReleaseHandle, 'ReleaseHandle');
      RegisterMethod(@TBitmap.ReleasePalette, 'ReleasePalette');
      RegisterMethod(@TBitmap.SaveToClipboardFormat, 'SaveToClipboardFormat');
      RegisterPropertyHelper(@TBitmapMonochrome_R,@TBitmapMonochrome_W,'Monochrome');
      RegisterPropertyHelper(@TBitmapPalette_R,@TBitmapPalette_W,'Palette');
        {$IFNDEF FPC}
          RegisterPropertyHelper(@TBitmapIgnorePalette_R,@TBitmapIgnorePalette_W,'IgnorePalette');
        {$ENDIF}
      {$ENDIF}
      RegisterPropertyHelper(@TBitmapTransparentColor_R,@TBitmapTransparentColor_W,'TransparentColor');
      RegisterMethod(@TBitmap.Mask, 'Mask');
      RegisterMethod(@TBitmap.ReleaseMaskHandle, 'ReleaseMaskHandle');
      RegisterPropertyHelper(@TBitmapHandleType_R, @TBitmapHandleType_W, 'HandleType');
      RegisterPropertyHelper(@TBitmapMaskHandle_R, @TBitmapMaskHandle_W, 'MaskHandle');
      RegisterPropertyHelper(@TBitmapPixelFormat_R, @TBitmapPixelFormat_W, 'PixelFormat');
      RegisterPropertyHelper(@TBitmapTransparentMode_R, @TBitmapTransparentMode_W, 'TransparentMode');
      RegisterPropertyHelper(@TBitmapScanLine_R, nil, 'ScanLine');
    {$ENDIF}
  end;
end;

{ TPicture ------------------------------------------------------------------- }
{$IFNDEF PS_MINIVCL}
  procedure TPictureOnProgress_W(Self: TPicture; const T: TProgressEvent); begin Self.OnProgress := T; end;
  procedure TPictureOnProgress_R(Self: TPicture; var T: TProgressEvent); begin T := Self.OnProgress; end;
  procedure TPictureOnChange_W(Self: TPicture; const T: TNotifyEvent); begin Self.OnChange := T; end;
  procedure TPictureOnChange_R(Self: TPicture; var T: TNotifyEvent); begin T := Self.OnChange; end;
  procedure TPictureMetafile_W(Self: TPicture; const T: TMetafile); begin Self.Metafile := T; end;
  procedure TPictureMetafile_R(Self: TPicture; var T: TMetafile); begin T := Self.Metafile; end;
  procedure TPictureIcon_W(Self: TPicture; const T: TIcon); begin Self.Icon := T; end;
  procedure TPictureIcon_R(Self: TPicture; var T: TIcon); begin T := Self.Icon; end;
  procedure TPictureGraphic_W(Self: TPicture; const T: TGraphic); begin Self.Graphic := T; end;
  procedure TPictureGraphic_R(Self: TPicture; var T: TGraphic); begin T := Self.Graphic; end;
{$ENDIF}
procedure TPictureBitmap_W(Self: TPicture; const T: TBitmap); begin Self.Bitmap := T; end;
procedure TPictureBitmap_R(Self: TPicture; var T: TBitmap); begin T := Self.Bitmap; end;
{$IFNDEF PS_MINIVCL}
  procedure TPictureWidth_R(Self: TPicture; var T: Integer); begin T := Self.Width; end;
  procedure TPictureHeight_R(Self: TPicture; var T: Integer); begin T := Self.Height; end;
{$ENDIF}

procedure RIRegisterTPicture(Cl: TPSRuntimeClassImporter; Streams: Boolean);
begin
  with Cl.Add(TPicture) do
  begin
  {$IFNDEF PS_MINIVCL} // on Delphi 2009 is Private
    {$IFNDEF VER200}
      if Streams then begin
        RegisterMethod(@TPicture.LoadFromStream, 'LoadFromStream');
        RegisterMethod(@TPicture.SaveToStream, 'SaveToStream');
      end;
    {$ENDIF}
    RegisterConstructor(@TPicture.Create, 'Create');
    RegisterMethod(@TPicture.LoadFromFile, 'LoadFromFile');
    RegisterMethod(@TPicture.SaveToFile, 'SaveToFile');
    //RegisterMethod(@TPicture.LoadFromClipboardFormat, 'LoadFromClipboardFormat');
    //RegisterMethod(@TPicture.SaveToClipboardFormat, 'SaveToClipboardFormat');
    //RegisterMethod(@TPicture.SupportsClipboardFormat, 'SupportsClipboardFormat');
    //RegisterMethod(@TPicture.RegisterFileFormat, 'RegisterFileFormat');
    //RegisterMethod(@TPicture.RegisterFileFormatRes, 'RegisterFileFormatRes');
    //RegisterMethod(@TPicture.RegisterClipboardFormat, 'RegisterClipboardFormat');
    //RegisterMethod(@TPicture.UnregisterGraphicClass, 'UnregisterGraphicClass');
  {$ENDIF}
    RegisterPropertyHelper(@TPictureBitmap_R,@TPictureBitmap_W,'Bitmap');
  {$IFNDEF PS_MINIVCL}
    RegisterPropertyHelper(@TPictureGraphic_R, @TPictureGraphic_W, 'Graphic');
    RegisterPropertyHelper(@TPictureHeight_R, nil, 'Height');
    RegisterPropertyHelper(@TPictureWidth_R, nil, 'Width');
    RegisterPropertyHelper(@TPictureIcon_R, @TPictureIcon_W, 'Icon');
    RegisterPropertyHelper(@TPictureMetafile_R, @TPictureMetafile_W, 'Metafile');
    RegisterPropertyHelper(@TPictureOnChange_R, @TPictureOnChange_W, 'OnChange');
    RegisterPropertyHelper(@TPictureOnProgress_R,@TPictureOnProgress_W,'OnProgress');
  {$ENDIF}
  end;
end;

{$IFNDEF PS_MINIVCL}
{ TIcon ---------------------------------------------------------------------- }
procedure TIconHandle_W(Self: TIcon; const T: HICON); begin Self.Handle := T; end;
procedure TIconHandle_R(Self: TIcon; var T: HICON); begin T := Self.Handle; end;

procedure RIRegisterTIcon(Cl: TPSRuntimeClassImporter; Streams: Boolean);
begin
  with Cl.Add(TIcon) do
  begin
    RegisterConstructor(@TIcon.Create, 'Create');
    if Streams then begin
      RegisterMethod(@TIcon.LoadFromStream, 'LoadFromStream');
      RegisterMethod(@TIcon.SaveToStream, 'SaveToStream');
    end;
    RegisterMethod(@TIcon.HandleAllocated, 'HandleAllocated');
    RegisterMethod(@TIcon.LoadFromResourceName, 'LoadFromResourceName');
    RegisterMethod(@TIcon.LoadFromResourceID, 'LoadFromResourceID');
    RegisterMethod(@TIcon.ReleaseHandle, 'ReleaseHandle');
    RegisterPropertyHelper(@TIconHandle_R,@TIconHandle_W,'Handle');
  end;
end;

{ TMetafile ------------------------------------------------------------------ }
procedure TMetafileInch_W(Self: TMetafile; const T: Word); begin Self.Inch := T; end;
procedure TMetafileInch_R(Self: TMetafile; var T: Word); begin T := Self.Inch; end;
procedure TMetafileMMHeight_W(Self: TMetafile; const T: Integer); begin Self.MMHeight := T; end;
procedure TMetafileMMHeight_R(Self: TMetafile; var T: Integer); begin T := Self.MMHeight; end;
procedure TMetafileMMWidth_W(Self: TMetafile; const T: Integer); begin Self.MMWidth := T; end;
procedure TMetafileMMWidth_R(Self: TMetafile; var T: Integer); begin T := Self.MMWidth; end;
procedure TMetafileHandle_W(Self: TMetafile; const T: HENHMETAFILE); begin Self.Handle := T; end;
procedure TMetafileHandle_R(Self: TMetafile; var T: HENHMETAFILE); begin T := Self.Handle; end;
procedure TMetafileEnhanced_W(Self: TMetafile; const T: Boolean); begin Self.Enhanced := T; end;
procedure TMetafileEnhanced_R(Self: TMetafile; var T: Boolean); begin T := Self.Enhanced; end;
procedure TMetafileDescription_R(Self: TMetafile; var T: String); begin T := Self.Description; end;
procedure TMetafileCreatedBy_R(Self: TMetafile; var T: String); begin T := Self.CreatedBy; end;

procedure RIRegisterTMetafile(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TMetafile) do begin
    RegisterConstructor(@TMetafile.Create, 'Create');
    RegisterMethod(@TMetafile.Clear, 'Clear');
    RegisterMethod(@TMetafile.HandleAllocated, 'HandleAllocated');
    RegisterMethod(@TMetafile.ReleaseHandle, 'ReleaseHandle');
    RegisterPropertyHelper(@TMetafileCreatedBy_R,nil,'CreatedBy');
    RegisterPropertyHelper(@TMetafileDescription_R,nil,'Description');
    RegisterPropertyHelper(@TMetafileEnhanced_R,@TMetafileEnhanced_W,'Enhanced');
    RegisterPropertyHelper(@TMetafileHandle_R,@TMetafileHandle_W,'Handle');
    RegisterPropertyHelper(@TMetafileMMWidth_R,@TMetafileMMWidth_W,'MMWidth');
    RegisterPropertyHelper(@TMetafileMMHeight_R,@TMetafileMMHeight_W,'MMHeight');
    RegisterPropertyHelper(@TMetafileInch_R,@TMetafileInch_W,'Inch');
  end;
end;

{ TMetafileCanvas ------------------------------------------------------------ }
procedure RIRegisterTMetafileCanvas(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TMetafileCanvas) do
  begin
    RegisterConstructor(@TMetafileCanvas.Create, 'Create');
    RegisterConstructor(@TMetafileCanvas.CreateWithComment, 'CreateWithComment');
  end;
end;

{ TPngImage ------------------------------------------------------------------ }
procedure TPngImageAlphaScanline_R(Self: TPngImage; var T: pByteArray; const t1: Integer); begin T := Self.AlphaScanline[t1]; end;
procedure TPngImageCanvas_R(Self: TPngImage; var T: TCanvas); begin T := Self.Canvas; end;
//procedure TPngImageChunks_R(Self: TPngImage; var T: TPngList); begin T := Self.Chunks; end;
//procedure TPngImageCompressionLevel_R(Self: TPngImage; var T: TCompressionLevel); begin T := Self.CompressionLevel; end;
//procedure TPngImageCompressionLevel_W(Self: TPngImage; const T: TCompressionLevel); begin Self.CompressionLevel := T; end;
procedure TPngImageEmpty_R(Self: TPngImage; var T: Boolean); begin T := Self.Empty; end;
//procedure TPngImageFilters_R(Self: TPngImage; var T: TFilters); begin T := Self.Filters; end;
//procedure TPngImageFilters_W(Self: TPngImage; const T: TFilters); begin Self.Filters := T; end;
//procedure TPngImageHeader_R(Self: TPngImage; var T: TChunkIHDR); begin T := Self.Header; end;
procedure TPngImageHeight_R(Self: TPngImage; var T: Integer); begin T := Self.Height; end;
//procedure TPngImageInterlaceMethod_R(Self: TPngImage; var T: TInterlaceMethod); begin T := Self.InterlaceMethod; end;
//procedure TPngImageInterlaceMethod_W(Self: TPngImage; const T: TInterlaceMethod); begin Self.InterlaceMethod := T; end;
//procedure TPngImageMaxIdatSize_R(Self: TPngImage; var T: Integer); begin T := Self.MaxIdatSize; end;
//procedure TPngImageMaxIdatSize_W(Self: TPngImage; const T: Integer); begin Self.MaxIdatSize := T; end;
procedure TPngImagePalette_R(Self: TPngImage; var T: HPalette); begin T := Self.Palette; end;
procedure TPngImagePalette_W(Self: TPngImage; const T: HPalette); begin Self.Palette := T; end;
//procedure TPngImagePixelInformation_R(Self: TPngImage; var T: TChunkpHYs); begin T := Self.PixelInformation; end;
//procedure TPngImagePixels_R(Self: TPngImage; var T: TColor; const t1: Integer; const t2: Integer); begin T := Self.Pixels[t1, t2]; end;
//procedure TPngImagePixels_W(Self: TPngImage; const T: TColor; const t1: Integer; const t2: Integer); begin Self.Pixels[t1, t2] := T; end;
//procedure TPngImageScanline_R(Self: TPngImage; var T: Pointer; const t1: Integer); begin T := Self.Scanline[t1]; end;
//procedure TPngImageTransparencyMode_R(Self: TPngImage; var T: TPNGTransparencyMode); begin T := Self.TransparencyMode; end;
procedure TPngImageTransparentColor_R(Self: TPngImage; var T: TColor); begin T := Self.TransparentColor; end;
procedure TPngImageTransparentColor_W(Self: TPngImage; const T: TColor); begin Self.TransparentColor := T; end;
//procedure TPngImageVersion_R(Self: TPngImage; var T: String); begin T := Self.Version; end;
procedure TPngImageWidth_R(Self: TPngImage; var T: Integer); begin T := Self.Width; end;

procedure RIRegisterTPngImage(Cl: TPSRuntimeClassImporter; Streams: Boolean);
begin
  with Cl.Add(TPngImage) do
  begin
    if Streams then begin
      RegisterMethod(@TPngImage.LoadFromStream, 'LoadFromStream');
      RegisterMethod(@TPngImage.SaveToStream, 'SaveToStream');
    end;
    RegisterConstructor(@TPngImage.Create, 'Create');
    //RegisterConstructor(@TPngImage.CreateBlank, 'CreateBlank');
    //RegisterMethod(@TPngImage.AddtEXt, 'AddtEXt');
    //RegisterMethod(@TPngImage.AddzTXt, 'AddzTXt');
    //RegisterMethod(@TPngImage.AssignHandle, 'AssignHandle');
    //RegisterMethod(@TPngImage.CreateAlpha, 'CreateAlpha');
    //RegisterMethod(@TPngImage.DrawUsingPixelInformation, 'DrawUsingPixelInformation');
    RegisterMethod(@TPngImage.LoadFromFile, 'LoadFromFile');
    RegisterMethod(@TPngImage.LoadFromResourceID, 'LoadFromResourceID');
    RegisterMethod(@TPngImage.LoadFromResourceName, 'LoadFromResourceName');
    //RegisterMethod(@TPngImage.RaiseError, 'RaiseError');
    //RegisterMethod(@TPngImage.RemoveTransparency, 'RemoveTransparency');
    RegisterMethod(@TPngImage.Resize, 'Resize');
    //RegisterMethod(@TPngImage.SaveToFile, 'SaveToFile');
    RegisterPropertyHelper(@TPngImageAlphaScanline_R,nil,'AlphaScanline');
    RegisterPropertyHelper(@TPngImageCanvas_R,nil,'Canvas');
    //RegisterPropertyHelper(@TPngImageChunks_R,nil,'Chunks');
    //RegisterPropertyHelper(@TPngImageCompressionLevel_R,@TPngImageCompressionLevel_W,'CompressionLevel');
    RegisterPropertyHelper(@TPngImageEmpty_R,nil,'Empty');
    //RegisterPropertyHelper(@TPngImageFilters_R,@TPngImageFilters_W,'Filters');
    //RegisterPropertyHelper(@TPngImageHeader_R,nil,'Header');
    RegisterPropertyHelper(@TPngImageHeight_R,nil,'Height');
    //RegisterPropertyHelper(@TPngImageInterlaceMethod_R,@TPngImageInterlaceMethod_W,'InterlaceMethod');
    //RegisterPropertyHelper(@TPngImageMaxIdatSize_R,@TPngImageMaxIdatSize_W,'MaxIdatSize');
    RegisterPropertyHelper(@TPngImagePalette_R,@TPngImagePalette_W,'Palette');
    //RegisterPropertyHelper(@TPngImagePixelInformation_R,nil,'PixelInformation');
    //RegisterPropertyHelper(@TPngImagePixels_R,@TPngImagePixels_W,'Pixels');
    //RegisterPropertyHelper(@TPngImageScanline_R,nil,'Scanline');
    //RegisterPropertyHelper(@TPngImageTransparencyMode_R,nil,'TransparencyMode');
    RegisterPropertyHelper(@TPngImageTransparentColor_R,@TPngImageTransparentColor_W,'TransparentColor');
    //RegisterPropertyHelper(@TPngImageVersion_R,nil,'Version');
    RegisterPropertyHelper(@TPngImageWidth_R,nil,'Width');
  end;
end;
{$ENDIF}

(*----------------------------------------------------------------------------*)
procedure RIRegister_Graphics(Cl: TPSRuntimeClassImporter; Streams: Boolean);
begin
  RIRegisterTGRAPHICSOBJECT(Cl);
  RIRegisterTFont(Cl);
  {$IFNDEF PS_MINIVCL}
    RIRegisterTCustomCanvas(Cl);
  {$ENDIF}
  RIRegisterTCanvas(Cl);
  RIRegisterTPEN(Cl);
  RIRegisterTBRUSH(Cl);
  RIRegisterTGraphic(Cl, Streams);
  RIRegisterTBitmap(Cl, Streams);
  {$IFNDEF PS_MINIVCL}
    RIRegisterTIcon(Cl, Streams);
    RIRegisterTMetafile(Cl);
    RIRegisterTMetafileCanvas(Cl);
    RIRegisterTPngImage(Cl, Streams);
  {$ENDIF}
  RIRegisterTPicture(Cl, Streams);
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)
end.
