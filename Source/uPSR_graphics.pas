
unit uPSR_graphics;
{$I PascalScript.inc}
interface
uses
  uPSRuntime, uPSUtils;

procedure RIRegisterTGRAPHICSOBJECT(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTFont(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTPEN(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTBRUSH(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTCanvas(cl: TPSRuntimeClassImporter);
procedure RIRegisterTGraphic(CL: TPSRuntimeClassImporter);
procedure RIRegisterTBitmap(CL: TPSRuntimeClassImporter; Streams: Boolean);
procedure RIRegisterTPicture(CL: TPSRuntimeClassImporter; Streams: Boolean);

{$IFNDEF PS_MINIVCL}
  procedure RIRegisterTIcon(CL: TPSRuntimeClassImporter; Streams: Boolean);
  procedure RIRegisterTPngImage(CL: TPSRuntimeClassImporter; Streams: Boolean);
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

{$IFNDEF CLX}
procedure TFontHandleR(Self: TFont; var T: Longint); begin T := Self.Handle; end;
procedure TFontHandleW(Self: TFont; T: Longint); begin Self.Handle := T; end;
{$ENDIF}
procedure TFontPixelsPerInchR(Self: TFont; var T: Longint); begin T := Self.PixelsPerInch; end;
procedure TFontPixelsPerInchW(Self: TFont; T: Longint); begin {$IFNDEF FPC} Self.PixelsPerInch := T;{$ENDIF} end;
procedure TFontStyleR(Self: TFont; var T: TFontStyles); begin T := Self.Style; end;
procedure TFontStyleW(Self: TFont; T: TFontStyles); begin Self.Style:= T; end;

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
  end;
end;
{$IFNDEF CLX}
procedure TCanvasHandleR(Self: TCanvas; var T: Longint); begin T := Self.Handle; end;
procedure TCanvasHandleW(Self: TCanvas; T: Longint); begin Self.Handle:= T; end;
{$ENDIF}

procedure TCanvasPixelsR(Self: TCanvas; var T: Longint; X,Y: Longint); begin T := Self.Pixels[X,Y]; end;
procedure TCanvasPixelsW(Self: TCanvas; T, X, Y: Longint); begin Self.Pixels[X,Y]:= T; end;
{$IFDEF FPC}
procedure TCanvasArc(Self : TCanvas; X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer); begin Self.Arc(X1, Y1, X2, Y2, X3, Y3, X4, Y4); end;
procedure TCanvasChord(Self : TCanvas; X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer); begin self.Chord(X1, Y1, X2, Y2, X3, Y3, X4, Y4); end;
procedure TCanvasRectangle(Self : TCanvas; X1,Y1,X2,Y2 : integer); begin self.Rectangle(x1,y1,x2,y2); end;
procedure TCanvasRoundRect(Self : TCanvas; X1, Y1, X2, Y2, X3, Y3 : integer); begin self.RoundRect(X1, Y1, X2, Y2, X3, Y3); end;
procedure TCanvasEllipse(Self : TCanvas;X1, Y1, X2, Y2: Integer); begin self.Ellipse(X1, Y1, X2, Y2); end;
procedure TCanvasFillRect(Self : TCanvas; const Rect: TRect); begin self.FillRect(rect); end;
procedure TCanvasFloodFill(Self : TCanvas; X, Y: Integer; Color: TColor; FillStyle: TFillStyle); begin self.FloodFill(x,y,color,fillstyle); end;
{$ENDIF}

procedure RIRegisterTCanvas(cl: TPSRuntimeClassImporter); // requires TPersistent
begin
  with Cl.Add(TCanvas) do
  begin
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
    RegisterMethod(@TCanvas.Draw, 'Draw');

    RegisterMethod(@TCanvas.Lineto, 'LineTo');
    RegisterMethod(@TCanvas.Moveto, 'MoveTo');
    RegisterMethod(@TCanvas.Pie, 'Pie');
    RegisterMethod(@TCanvas.Refresh, 'Refresh');
    RegisterMethod(@TCanvas.TextHeight, 'TextHeight');
    RegisterMethod(@TCanvas.TextOut, 'TextOut');
    RegisterMethod(@TCanvas.TextWidth, 'TextWidth');
{$IFNDEF CLX}
    RegisterPropertyHelper(@TCanvasHandleR, @TCanvasHandleW, 'Handle');
{$ENDIF}
    RegisterPropertyHelper(@TCanvasPixelsR, @TCanvasPixelsW, 'Pixels');
  end;
end;


procedure TGRAPHICSOBJECTONCHANGE_W(Self: TGraphicsObject; T: TNotifyEvent); begin Self.OnChange := t; end;
procedure TGRAPHICSOBJECTONCHANGE_R(Self: TGraphicsObject; var T: TNotifyEvent); begin T :=Self.OnChange; end;


procedure RIRegisterTGRAPHICSOBJECT(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TGRAPHICSOBJECT) do
  begin
    RegisterPropertyHelper(@TGRAPHICSOBJECTONCHANGE_R, @TGRAPHICSOBJECTONCHANGE_W, 'OnChange');
  end;
end;

procedure RIRegisterTPEN(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TPEN) do
  begin
    RegisterConstructor(@TPEN.CREATE, 'Create');
  end;
end;

procedure RIRegisterTBRUSH(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TBRUSH) do
  begin
    RegisterConstructor(@TBRUSH.CREATE, 'Create');
  end;
end;

procedure TGraphicOnChange_W(Self: TGraphic; const T: TNotifyEvent); begin Self.OnChange := T; end;
procedure TGraphicOnChange_R(Self: TGraphic; var T: TNotifyEvent); begin T := Self.OnChange; end;
procedure TGraphicWidth_W(Self: TGraphic; const T: Integer); begin Self.Width := T; end;
procedure TGraphicWidth_R(Self: TGraphic; var T: Integer); begin T := Self.Width; end;
procedure TGraphicModified_W(Self: TGraphic; const T: Boolean); begin Self.Modified := T; end;
procedure TGraphicModified_R(Self: TGraphic; var T: Boolean); begin T := Self.Modified; end;
procedure TGraphicHeight_W(Self: TGraphic; const T: Integer); begin Self.Height := T; end;
procedure TGraphicHeight_R(Self: TGraphic; var T: Integer); begin T := Self.Height; end;
procedure TGraphicEmpty_R(Self: TGraphic; var T: Boolean); begin T := Self.Empty; end;

procedure RIRegisterTGraphic(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TGraphic) do
  begin
    RegisterVirtualConstructor(@TGraphic.Create, 'Create');
    RegisterVirtualMethod(@TGraphic.LoadFromFile, 'LoadFromFile');
    RegisterVirtualMethod(@TGraphic.SaveToFile, 'SaveToFile');
    RegisterPropertyHelper(@TGraphicEmpty_R,nil,'Empty');
    RegisterPropertyHelper(@TGraphicHeight_R,@TGraphicHeight_W,'Height');
    RegisterPropertyHelper(@TGraphicWidth_R,@TGraphicWidth_W,'Width');
    RegisterPropertyHelper(@TGraphicOnChange_R,@TGraphicOnChange_W,'OnChange');

    {$IFNDEF PS_MINIVCL}
    RegisterPropertyHelper(@TGraphicModified_R,@TGraphicModified_W,'Modified');
    {$ENDIF}
  end;
end;

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

procedure RIRegisterTBitmap(CL: TPSRuntimeClassImporter; Streams: Boolean);
begin
  with CL.Add(TBitmap) do
  begin
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
    RegisterPropertyHelper(@TBitmapTransparentColor_R,nil,'TransparentColor');
    {$ENDIF}
  end;
end;

{ TPicture }
{$IFNDEF PS_MINIVCL}
  procedure TPictureOnProgress_W(Self: TPicture; const T: TProgressEvent); begin Self.OnProgress := T; end;
  procedure TPictureOnProgress_R(Self: TPicture; var T: TProgressEvent); begin T := Self.OnProgress; end;
  procedure TPictureOnChange_W(Self: TPicture; const T: TNotifyEvent); begin Self.OnChange := T; end;
  procedure TPictureOnChange_R(Self: TPicture; var T: TNotifyEvent); begin T := Self.OnChange; end;
  procedure TPictureMetafile_W(Self: TPicture; const T: TMetafile); begin Self.Metafile := T; end;
  procedure TPictureMetafile_R(Self: TPicture; var T: TMetafile); begin T := Self.Metafile; end;
  procedure TPictureIcon_W(Self: TPicture; const T: TIcon); begin Self.Icon := T; end;
  procedure TPictureIcon_R(Self: TPicture; var T: TIcon); begin T := Self.Icon; end;
  //procedure TPicturePictureAdapter_W(Self: TPicture; const T: IChangeNotifier); begin Self.PictureAdapter := T; end;
  //procedure TPicturePictureAdapter_R(Self: TPicture; var T: IChangeNotifier); begin T := Self.PictureAdapter; end;
  procedure TPictureGraphic_W(Self: TPicture; const T: TGraphic); begin Self.Graphic := T; end;
  procedure TPictureGraphic_R(Self: TPicture; var T: TGraphic); begin T := Self.Graphic; end;
{$ENDIF}
procedure TPictureBitmap_W(Self: TPicture; const T: TBitmap); begin Self.Bitmap := T; end;
procedure TPictureBitmap_R(Self: TPicture; var T: TBitmap); begin T := Self.Bitmap; end;
{$IFNDEF PS_MINIVCL}
  procedure TPictureWidth_R(Self: TPicture; var T: Integer); begin T := Self.Width; end;
  procedure TPictureHeight_R(Self: TPicture; var T: Integer); begin T := Self.Height; end;
{$ENDIF}

procedure RIRegisterTPicture(CL: TPSRuntimeClassImporter; Streams: Boolean);
begin
  with CL.Add(TPicture) do
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
    RegisterPropertyHelper(@TPictureGraphic_R,@TPictureGraphic_W,'Graphic');
    //RegisterPropertyHelper(@TPicturePictureAdapter_R,@TPicturePictureAdapter_W,'PictureAdapter');
    RegisterPropertyHelper(@TPictureHeight_R,nil,'Height');
    RegisterPropertyHelper(@TPictureIcon_R,@TPictureIcon_W,'Icon');
    RegisterPropertyHelper(@TPictureMetafile_R,@TPictureMetafile_W,'Metafile');
    RegisterPropertyHelper(@TPictureWidth_R,nil,'Width');
    RegisterPropertyHelper(@TPictureOnChange_R,@TPictureOnChange_W,'OnChange');
    RegisterPropertyHelper(@TPictureOnProgress_R,@TPictureOnProgress_W,'OnProgress');
  {$ENDIF}
  end;
end;

{$IFNDEF PS_MINIVCL}
{ TIcon }
procedure TIconHandle_W(Self: TIcon; const T: HICON); begin Self.Handle := T; end;
procedure TIconHandle_R(Self: TIcon; var T: HICON); begin T := Self.Handle; end;

procedure RIRegisterTIcon(CL: TPSRuntimeClassImporter; Streams: Boolean);
begin
  with CL.Add(TIcon) do
  begin
    if Streams then begin
      RegisterMethod(@TIcon.LoadFromStream, 'LoadFromStream');
      RegisterMethod(@TIcon.SaveToStream, 'SaveToStream');
    end;
//    RegisterMethod(@TIcon.HandleAllocated, 'HandleAllocated');
    RegisterMethod(@TIcon.ReleaseHandle, 'ReleaseHandle');
    RegisterMethod(@TIcon.LoadFromResourceName, 'LoadFromResourceName');
    RegisterMethod(@TIcon.LoadFromResourceID, 'LoadFromResourceID');
    RegisterPropertyHelper(@TIconHandle_R,@TIconHandle_W,'Handle');
  end;
end;

{ TPngImage }
//procedure TPngImageAlphaScanline_R(Self: TPngImage; var T: pByteArray; const t1: Integer); begin T := Self.AlphaScanline[t1]; end;
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

procedure RIRegisterTPngImage(CL: TPSRuntimeClassImporter; Streams: Boolean);
begin
  with CL.Add(TPngImage) do
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
    //RegisterPropertyHelper(@TPngImageAlphaScanline_R,nil,'AlphaScanline');
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

procedure RIRegister_Graphics(Cl: TPSRuntimeClassImporter; Streams: Boolean);
begin
  RIRegisterTGRAPHICSOBJECT(cl);
  RIRegisterTFont(Cl);
  RIRegisterTCanvas(cl);
  RIRegisterTPEN(cl);
  RIRegisterTBRUSH(cl);
  RIRegisterTGraphic(CL);
  RIRegisterTBitmap(CL, Streams);
  RIRegisterTPicture(Cl, Streams);
{$IFNDEF PS_MINIVCL}
  RIRegisterTIcon(Cl, Streams);
  RIRegisterTPngImage(Cl, Streams);
{$ENDIF}
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)

end.