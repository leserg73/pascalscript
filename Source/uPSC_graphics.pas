{ Compiletime Graphics support }
unit uPSC_graphics;

{$I PascalScript.inc}

interface

uses
  uPSCompiler, uPSUtils;

procedure SIRegister_Graphics_TypesAndConsts(Cl: TPSPascalCompiler);
procedure SIRegisterTGRAPHICSOBJECT(Cl: TPSPascalCompiler);
procedure SIRegisterTFont(Cl: TPSPascalCompiler);
procedure SIRegisterTPEN(Cl: TPSPascalCompiler);
procedure SIRegisterTBRUSH(Cl: TPSPascalCompiler);
procedure SIRegisterTCustomCanvas(Cl: TPSPascalCompiler);
procedure SIRegisterTCanvas(Cl: TPSPascalCompiler);
procedure SIRegisterTGraphic(Cl: TPSPascalCompiler; Streams: Boolean);
procedure SIRegisterTBitmap(Cl: TPSPascalCompiler; Streams: Boolean);
procedure SIRegisterTPicture(Cl: TPSPascalCompiler; Streams: Boolean);
{$IFNDEF PS_MINIVCL}
  procedure SIRegisterTIcon(Cl: TPSPascalCompiler; Streams: Boolean);
  procedure SIRegisterTPngImage(Cl: TPSPascalCompiler; Streams: Boolean);
  procedure SIRegisterTMetafile(Cl: TPSPascalCompiler);
  procedure SIRegisterTMetafileCanvas(Cl: TPSPascalCompiler);
{$ENDIF}

procedure SIRegister_Graphics(Cl: TPSPascalCompiler; Streams: Boolean);

implementation
{$IFNDEF PS_NOGRAPHCONST}
uses
  {$IFDEF CLX}QGraphics{$ELSE}Graphics{$ENDIF};
{$ELSE}
{$IFNDEF CLX}
{$IFNDEF FPC}
uses
  Windows;
{$ENDIF}
{$ENDIF}
{$ENDIF}

{ TGraphicsObject ------------------------------------------------------------ }
procedure SIRegisterTGRAPHICSOBJECT(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TPersistent'), 'TGraphicsObject') do
  begin
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
  end;
end;

{ TFont ---------------------------------------------------------------------- }
procedure SIRegisterTFont(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TGraphicsObject'), 'TFont') do
  begin
    RegisterMethod('constructor Create;');
    {$IFNDEF CLX}
      RegisterProperty('Handle', 'Integer', iptrw);
    {$ENDIF}
    RegisterProperty('Charset', 'TFontCharset', iptrw);
    RegisterProperty('Orientation', 'Integer', iptrw);
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Height', 'Integer', iptrw);
    RegisterProperty('Name', 'String', iptrw);
    RegisterProperty('Pitch', 'Byte', iptrw);
    RegisterProperty('Size', 'Integer', iptrw);
    RegisterProperty('PixelsPerInch', 'Integer', iptrw);
    RegisterProperty('Style', 'TFontStyles', iptrw);
  end;
end;

{ TCustomCanvas -------------------------------------------------------------- }
procedure SIRegisterTCustomCanvas(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TPersistent', 'TCustomCanvas') do
  with Cl.AddClassN(Cl.FindClass('TPersistent'),'TCustomCanvas') do
  begin
    RegisterMethod('procedure Arc(X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer)');
    RegisterMethod('procedure ArcTo(X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer)');
    RegisterMethod('procedure AngleArc(X, Y: Integer; Radius: Cardinal; StartAngle, SweepAngle: Single)');
    RegisterMethod('procedure BrushCopy(const Dest: TRect; Bitmap: TBitmap; const Source: TRect; Color: TColor)');
    RegisterMethod('procedure Chord(X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer)');
    RegisterMethod('procedure Draw(X, Y: Integer; Graphic: TGraphic);');
    //RegisterMethod('procedure Draw1(X, Y: Integer; Graphic: TGraphic; Opacity: Byte);');
    RegisterMethod('procedure DrawFocusRect(const Rect: TRect)');
    RegisterMethod('procedure Ellipse(X1, Y1, X2, Y2: Integer);');
    RegisterMethod('procedure Ellipse1(const Rect: TRect);');
    RegisterMethod('procedure FillRect(const Rect: TRect)');
    {$IFNDEF CLX}
      RegisterMethod('procedure FloodFill(X, Y: Integer; Color: TColor; FillStyle: TFillStyle)');
    {$ENDIF}
    RegisterMethod('procedure FrameRect(const Rect: TRect)');
    RegisterMethod('procedure LineTo(X, Y: Integer)');
    RegisterMethod('procedure Lock');
    RegisterMethod('procedure MoveTo(X, Y: Integer)');
    RegisterMethod('procedure Pie(X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer)');
    RegisterMethod('procedure Polygon(const Points: array of TPoint)');
    RegisterMethod('procedure Polyline(const Points: array of TPoint)');
    RegisterMethod('procedure PolyBezier(const Points: array of TPoint)');
    RegisterMethod('procedure PolyBezierTo(const Points: array of TPoint)');
    RegisterMethod('procedure Rectangle(X1, Y1, X2, Y2: Integer);');
    RegisterMethod('procedure Rectangle1(const Rect: TRect);');
    RegisterMethod('procedure Refresh');
    RegisterMethod('procedure RoundRect(X1, Y1, X2, Y2, X3, Y3: Integer);');
    RegisterMethod('procedure RoundRect1(const Rect: TRect; CX, CY: Integer);');
    RegisterMethod('procedure StretchDraw(const Rect: TRect; Graphic: TGraphic)');
    RegisterMethod('function TextExtent(const Text: string): TSize');
    RegisterMethod('function TextHeight(const Text: string): Integer');
    RegisterMethod('procedure TextOut(X, Y: Integer; const Text: string)');
    //RegisterMethod('procedure TextRect(var Rect: TRect; var Text: string; TextFormat: TTextFormat);');
    RegisterMethod('procedure TextRect1(Rect: TRect; X, Y: Integer; const Text: string);');
    RegisterMethod('function TextWidth(const Text: string): Integer');
    RegisterMethod('function TryLock: Boolean');
    RegisterMethod('procedure Unlock');
    RegisterProperty('ClipRect', 'TRect', iptr);
    RegisterProperty('LockCount', 'Integer', iptr);
    RegisterProperty('CanvasOrientation', 'TCanvasOrientation', iptr);
    RegisterProperty('PenPos', 'TPoint', iptrw);
    RegisterProperty('Pixels', 'TColor Integer Integer', iptrw);
    RegisterProperty('TextFlags', 'Longint', iptrw);
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
    RegisterProperty('OnChanging', 'TNotifyEvent', iptrw);
  end;
end;

{ TCanvas -------------------------------------------------------------------- }
procedure SIRegisterTCanvas(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomCanvas'), 'TCanvas') do
  begin
    RegisterMethod('constructor Create');
    RegisterMethod('procedure CopyRect(const Dest: TRect; Canvas: TCanvas; const Source: TRect)');
    RegisterMethod('function HandleAllocated: Boolean');
    RegisterMethod('procedure Arc(X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer);');
    RegisterMethod('procedure BrushCopy(const Dest: TRect; Bitmap: TBitmap; const Source: TRect; Color: TColor)');
    RegisterMethod('procedure Chord(X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer);');
    RegisterMethod('procedure Draw(X, Y: Integer; Graphic: TGraphic);');
    RegisterMethod('procedure Draw2(X, Y: Integer; Graphic: TGraphic; Opacity: Byte);');
    RegisterMethod('procedure DrawFocusRect(const Rect: TRect);');
    RegisterMethod('procedure Ellipse(X1, Y1, X2, Y2: Integer);');
    RegisterMethod('procedure Ellipse2(const Rect: TRect);');
    RegisterMethod('procedure FillRect(const Rect: TRect);');
    RegisterMethod('procedure FrameRect(const Rect: TRect);');
    RegisterMethod('procedure CopyRect(const Dest: TRect; Canvas: TCanvas; const Source: TRect);');
    RegisterMethod('procedure StretchDraw(const Rect: TRect; Graphic: TGraphic);');
    RegisterMethod('procedure Polyline(const Points: array of TPoint);');
    RegisterMethod('procedure Polygon(const Points: array of TPoint);');
    RegisterMethod('procedure PolyBezier(const Points: array of TPoint);');
    RegisterMethod('procedure PolyBezierTo(const Points: array of TPoint);');
    {$IFNDEF CLX}
      RegisterMethod('procedure FloodFill(X, Y: Integer; Color: TColor; FillStyle: TFillStyle)');
    {$ENDIF}
    RegisterMethod('procedure LineTo(X, Y: Integer);');
    RegisterMethod('procedure MoveTo(X, Y: Integer);');
    RegisterMethod('procedure Pie(X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer);');
    RegisterMethod('procedure Rectangle(X1, Y1, X2, Y2: Integer);');
    RegisterMethod('procedure Rectangle2(const Rect: TRect);');
    RegisterMethod('procedure Refresh;');
    RegisterMethod('procedure RoundRect(X1, Y1, X2, Y2, X3, Y3: Integer);');
    RegisterMethod('procedure RoundRect2(const Rect: TRect; CX, CY: Integer);');
    RegisterMethod('function TextWidth(Text: String): Integer;');
    RegisterMethod('function TextHeight(Text: String): Integer;');
    RegisterMethod('procedure TextOut(X, Y: Integer; Text: String);');
    RegisterMethod('procedure TextRect(Rect: TRect; X: Integer; Y: Integer; const Text: string);');
    RegisterMethod('procedure TextRect2(var Rect: TRect; var Text: string; TextFormat: TTextFormat);');
    {$IFNDEF CLX}
      RegisterProperty('Handle', 'Integer', iptrw);
    {$ENDIF}
    RegisterMethod('function HandleAllocated:Boolean');
    RegisterMethod('procedure Lock');
    RegisterMethod('function TryLock: Boolean');
    RegisterMethod('procedure Unlock');
    RegisterProperty('Pixels', 'Integer Integer Integer', iptrw);
    RegisterProperty('Brush', 'TBrush', iptr);
    RegisterProperty('CanvasOrientation', 'TCanvasOrientation', iptr);
    RegisterProperty('ClipRect','TRect', iptr);
    RegisterProperty('CopyMode', 'TCopyMode', iptrw);
    RegisterProperty('Font', 'TFont', iptr);
    RegisterProperty('LockCount', 'Integer', iptr);
    RegisterProperty('Pen', 'TPen', iptr);
    RegisterProperty('PenPos', 'TPoint', iptrw);
    RegisterProperty('TextFlags', 'Longint', iptrw);
  end;
end;

{ TPen ----------------------------------------------------------------------- }
procedure SIRegisterTPEN(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TGraphicsObject'), 'TPen') do
  begin
    RegisterMethod('constructor Create');
    {$IFNDEF PS_MINIVCL}
      RegisterProperty('Handle', 'HPen', iptrw); 
    {$ENDIF}
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Mode', 'TPenMode', iptrw);
    RegisterProperty('Style', 'TPenStyle', iptrw);
    RegisterProperty('Width', 'Integer', iptrw);
  end;
end;

{ TBrush --------------------------------------------------------------------- }
procedure SIRegisterTBRUSH(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TGraphicsObject'), 'TBrush') do
  begin
    RegisterMethod('constructor Create');
    {$IFNDEF PS_MINIVCL}
      RegisterProperty('Handle', 'HBrush', iptrw);
    {$ENDIF} 
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Style', 'TBrushStyle', iptrw);
  end;
end;

{ TGraphic ------------------------------------------------------------------- }
procedure SIRegisterTGraphic(Cl: TPSPascalCompiler; Streams: Boolean);
begin
  with Cl.AddClassN(Cl.FindClass('TPersistent'),'TGraphic') do
  begin
    RegisterMethod('constructor Create');
    RegisterMethod('procedure LoadFromFile(const FileName: string)');
    RegisterMethod('procedure SaveToFile(const FileName: string)');
    if Streams then begin
      RegisterMethod('procedure LoadFromStream(Stream: TStream)');
      RegisterMethod('procedure SaveToStream(Stream: TStream)');
    end;
    RegisterMethod('procedure SetSize(AWidth, AHeight: Integer)');
    RegisterProperty('Palette', 'HPALETTE', iptrw);
    RegisterProperty('PaletteModified', 'Boolean', iptrw);
    RegisterProperty('Transparent', 'Boolean', iptrw);
    RegisterProperty('Empty', 'Boolean', iptr);
    RegisterProperty('Height', 'Integer', iptrw);
    RegisterProperty('Modified', 'Boolean', iptrw);
    RegisterProperty('Width', 'Integer', iptrw);
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
  end;
end;

{ TBitmap -------------------------------------------------------------------- }
procedure SIRegisterTBitmap(Cl: TPSPascalCompiler; Streams: Boolean);
begin
  with Cl.AddClassN(Cl.FindClass('TGraphic'),'TBitmap') do
  begin
    RegisterMethod('constructor Create');
    if Streams then begin
      RegisterMethod('procedure LoadFromStream(Stream: TStream)');
      RegisterMethod('procedure SaveToStream(Stream: TStream)');
    end;
    RegisterProperty('Canvas', 'TCanvas', iptr);
    {$IFNDEF CLX}
      RegisterProperty('Handle', 'HBITMAP', iptrw);
    {$ENDIF}
    {$IFNDEF PS_MINIVCL}
      RegisterMethod('procedure Dormant');
      RegisterMethod('procedure FreeImage');
      {$IFNDEF CLX}
        RegisterMethod('procedure LoadFromClipboardFormat(AFormat: Word; AData: THandle; APalette: HPALETTE)');
      {$ENDIF}
      RegisterMethod('procedure LoadFromResourceName(Instance: THandle; const ResName: string)');
      RegisterMethod('procedure LoadFromResourceID(Instance: THandle; ResID: Integer)');
      {$IFNDEF CLX}
        RegisterMethod('function ReleaseHandle: HBITMAP');
        RegisterMethod('function ReleasePalette: HPALETTE');
        RegisterMethod('procedure SaveToClipboardFormat(var Format: Word; var Data: THandle; var APalette: HPALETTE)');
        RegisterProperty('Monochrome', 'Boolean', iptrw);
        RegisterProperty('Palette', 'HPALETTE', iptrw);
        RegisterProperty('IgnorePalette', 'Boolean', iptrw);
      {$ENDIF}
      RegisterProperty('TransparentColor', 'TColor', iptrw);
      RegisterProperty('TransparentMode', 'TTransparentMode', iptrw);
      RegisterMethod('procedure Mask(TransparentColor: TColor)');
      RegisterMethod('function ReleaseMaskHandle: HBITMAP');
      //RegisterProperty('AlphaFormat', 'TAlphaFormat', iptrw);
      RegisterProperty('HandleType', 'TBitmapHandleType', iptrw);
      RegisterProperty('MaskHandle', 'HBITMAP', iptrw);
      RegisterProperty('PixelFormat', 'TPixelFormat', iptrw);
      RegisterProperty('ScanLine', 'Cardinal Integer', iptr);
    {$ENDIF}
  end;
end;

{$IFNDEF PS_MINIVCL}
{ TIcon ---------------------------------------------------------------------- }
procedure SIRegisterTIcon(Cl: TPSPascalCompiler; Streams: Boolean);
begin
  //with RegClassS(Cl,'TGraphic', 'TIcon') do
  with Cl.AddClassN(Cl.FindClass('TGraphic'), 'TIcon') do
  begin
    RegisterMethod('constructor Create');
    if Streams then begin
      RegisterMethod('procedure LoadFromStream(Stream: TStream)');
      RegisterMethod('procedure SaveToStream(Stream: TStream)');
    end;
    RegisterMethod('function HandleAllocated: Boolean');
    RegisterMethod('function ReleaseHandle: HICON');
    RegisterMethod('procedure LoadFromResourceName(Instance: THandle; const ResName: String)');
    RegisterMethod('procedure LoadFromResourceID(Instance: THandle; ResID: Integer)');
    RegisterMethod('function ReleaseHandle: HICON');
    RegisterProperty('Handle', 'HICON', iptrw);
  end;
end;

{ TMetafile ------------------------------------------------------------------ }
procedure SIRegisterTMetafile(Cl: TPSPascalCompiler);
begin
  //with RegClassS(Cl,'TGraphic', 'TMetafile') do
  with Cl.AddClassN(Cl.FindClass('TGraphic'),'TMetafile') do begin
    RegisterMethod('constructor Create');
    RegisterMethod('procedure Clear');
    RegisterMethod('function HandleAllocated: Boolean');
    RegisterMethod('function ReleaseHandle: HENHMETAFILE');
    RegisterProperty('CreatedBy', 'String', iptr);
    RegisterProperty('Description', 'String', iptr);
    RegisterProperty('Enhanced', 'Boolean', iptrw);
    RegisterProperty('Handle', 'HENHMETAFILE', iptrw);
    RegisterProperty('MMWidth', 'Integer', iptrw);
    RegisterProperty('MMHeight', 'Integer', iptrw);
    RegisterProperty('Inch', 'Word', iptrw);
  end;
end;

{ TMetafileCanvas ------------------------------------------------------------ }
procedure SIRegisterTMetafileCanvas(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCanvas'),'TMetafileCanvas') do
  begin
    RegisterMethod('constructor Create(AMetafile: TMetafile; ReferenceDevice: HDC)');
    RegisterMethod('constructor CreateWithComment(AMetafile: TMetafile; ReferenceDevice: HDC; const CreatedBy, Description: String)');
  end;
end;

{ TPngImage ------------------------------------------------------------------ }
procedure SIRegisterTPngImage(Cl: TPSPascalCompiler; Streams: Boolean);
begin
  //with RegClassS(Cl,'TGraphic', 'TPngImage') do
  with Cl.AddClassN(Cl.FindClass('TGraphic'),'TPngImage') do
  begin
    if Streams then begin
      RegisterMethod('procedure LoadFromStream(Stream: TStream)');
      RegisterMethod('procedure SaveToStream(Stream: TStream)');
    end;
    RegisterMethod('constructor Create');
    //RegisterMethod('constructor CreateBlank(ColorType, Bitdepth: Cardinal; cx, cy: Integer)');
    //RegisterMethod('procedure AddtEXt(const Keyword, Text: AnsiString)');
    //RegisterMethod('procedure AddzTXt(const Keyword, Text: AnsiString)');
    //RegisterMethod('procedure AssignHandle(Handle: HBitmap; Transparent: Boolean; TransparentColor: ColorRef)');
    //RegisterMethod('procedure CreateAlpha');
    //RegisterMethod('procedure DrawUsingPixelInformation(Canvas: TCanvas; Point: TPoint)');
    RegisterMethod('procedure LoadFromFile(const Filename: String)');
    RegisterMethod('procedure LoadFromResourceID(Instance: THandle; ResID: Integer)');
    RegisterMethod('procedure LoadFromResourceName(Instance: THandle; const Name: String)');
    //RegisterMethod('procedure RaiseError(ExceptionClass: ExceptClass; Text: String)');
    //RegisterMethod('procedure RemoveTransparency');
    RegisterMethod('procedure Resize(const CX, CY: Integer)');
    //RegisterMethod('procedure SaveToFile(const Filename: String)');
    RegisterProperty('AlphaScanline', 'Cardinal Integer', iptr); // pByteArray
    RegisterProperty('Canvas', 'TCanvas', iptr);
    //RegisterProperty('Chunks', 'TPngList', iptr);
    //RegisterProperty('CompressionLevel', 'TCompressionLevel', iptrw);
    RegisterProperty('Empty', 'Boolean', iptr);
    //RegisterProperty('Filters', 'TFilters', iptrw);
    //RegisterProperty('Header', 'TChunkIHDR', iptr);
    RegisterProperty('Height', 'Integer', iptr);
    //RegisterProperty('InterlaceMethod', 'TInterlaceMethod', iptrw);
    //RegisterProperty('MaxIdatSize', 'Integer', iptrw);
    RegisterProperty('Palette', 'HPalette', iptrw);
    //RegisterProperty('PixelInformation', 'TChunkpHYs', iptr);
    //RegisterProperty('Pixels', 'TColor Integer Integer', iptrw);
    //RegisterProperty('Scanline', 'Pointer Integer', iptr);
    //RegisterProperty('TransparencyMode', 'TPNGTransparencyMode', iptr);
    RegisterProperty('TransparentColor', 'TColor', iptrw);
    //RegisterProperty('Version', 'String', iptr);
    RegisterProperty('Width', 'Integer', iptr);
  end;
end;
{$ENDIF}

{ TPicture ------------------------------------------------------------------- }
procedure SIRegisterTPicture(Cl: TPSPascalCompiler; Streams: Boolean);
begin
  with Cl.AddClassN(Cl.FindClass('TPersistent'),'TPicture') do
  begin
  {$IFNDEF PS_MINIVCL}
    {$IFNDEF VER200}
      if Streams then begin
        RegisterMethod('procedure LoadFromStream(Stream: TStream)');
        RegisterMethod('procedure SaveToStream(Stream: TStream)');
      end;
    {$ENDIF}
    RegisterMethod('constructor Create');
    RegisterMethod('procedure LoadFromFile(const Filename: string)');
    RegisterMethod('procedure SaveToFile(const Filename: string)');
    //RegisterMethod('procedure LoadFromClipboardFormat(AFormat: Word; AData: THandle; APalette: HPALETTE)');
    //RegisterMethod('procedure SaveToClipboardFormat(var AFormat: Word; var AData: THandle; var APalette: HPALETTE)');
    //RegisterMethod('function SupportsClipboardFormat(AFormat: Word): Boolean');
    //RegisterMethod('procedure RegisterFileFormat(const AExtension, ADescription: string; AGraphicClass: TGraphicClass)');
    //RegisterMethod('procedure RegisterFileFormatRes(const AExtension: String; ADescriptionResID: Integer; AGraphicClass: TGraphicClass)');
    //RegisterMethod('procedure RegisterClipboardFormat(AFormat: Word; AGraphicClass: TGraphicClass)');
    //RegisterMethod('procedure UnregisterGraphicClass(AClass: TGraphicClass)');
  {$ENDIF}
    RegisterProperty('Bitmap', 'TBitmap', iptrw);
  {$IFNDEF PS_MINIVCL}
    RegisterProperty('Graphic', 'TGraphic', iptrw);
    RegisterProperty('Icon', 'TIcon', iptrw);
    RegisterProperty('Height', 'Integer', iptr);
    RegisterProperty('Width', 'Integer', iptr);
    RegisterProperty('Metafile', 'TMetafile', iptrw);
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
    RegisterProperty('OnProgress', 'TProgressEvent', iptrw);
  {$ENDIF}
  end;
end;

{ Types And Consts ----------------------------------------------------------- }
procedure SIRegister_Graphics_TypesAndConsts(Cl: TPSPascalCompiler);
{$IFDEF PS_NOGRAPHCONST}
const
  clSystemColor = {$IFDEF DELPHI7UP} $FF000000 {$ELSE} $80000000 {$ENDIF};
{$ENDIF}
begin
{$IFNDEF PS_NOGRAPHCONST}
  Cl.AddConstantN('clScrollBar', 'Integer').Value.ts32 := clScrollBar;
  Cl.AddConstantN('clBackground', 'Integer').Value.ts32 := clBackground;
  Cl.AddConstantN('clActiveCaption', 'Integer').Value.ts32 := clActiveCaption;
  Cl.AddConstantN('clInactiveCaption', 'Integer').Value.ts32 := clInactiveCaption;
  Cl.AddConstantN('clMenu', 'Integer').Value.ts32 := clMenu;
  Cl.AddConstantN('clWindow', 'Integer').Value.ts32 := clWindow;
  Cl.AddConstantN('clWindowFrame', 'Integer').Value.ts32 := clWindowFrame;
  Cl.AddConstantN('clMenuText', 'Integer').Value.ts32 := clMenuText;
  Cl.AddConstantN('clWindowText', 'Integer').Value.ts32 := clWindowText;
  Cl.AddConstantN('clCaptionText', 'Integer').Value.ts32 := clCaptionText;
  Cl.AddConstantN('clActiveBorder', 'Integer').Value.ts32 := clActiveBorder;
  Cl.AddConstantN('clInactiveBorder', 'Integer').Value.ts32 := clInactiveCaption;
  Cl.AddConstantN('clAppWorkSpace', 'Integer').Value.ts32 := clAppWorkSpace;
  Cl.AddConstantN('clHighlight', 'Integer').Value.ts32 := clHighlight;
  Cl.AddConstantN('clHighlightText', 'Integer').Value.ts32 := clHighlightText;
  Cl.AddConstantN('clBtnFace', 'Integer').Value.ts32 := clBtnFace;
  Cl.AddConstantN('clBtnShadow', 'Integer').Value.ts32 := clBtnShadow;
  Cl.AddConstantN('clGrayText', 'Integer').Value.ts32 := clGrayText;
  Cl.AddConstantN('clBtnText', 'Integer').Value.ts32 := clBtnText;
  Cl.AddConstantN('clInactiveCaptionText', 'Integer').Value.ts32 := clInactiveCaptionText;
  Cl.AddConstantN('clBtnHighlight', 'Integer').Value.ts32 := clBtnHighlight;
  Cl.AddConstantN('cl3DDkShadow', 'Integer').Value.ts32 := cl3DDkShadow;
  Cl.AddConstantN('cl3DLight', 'Integer').Value.ts32 := cl3DLight;
  Cl.AddConstantN('clInfoText', 'Integer').Value.ts32 := clInfoText;
  Cl.AddConstantN('clInfoBk', 'Integer').Value.ts32 := clInfoBk;
{$ELSE}
{$IFNDEF CLX}  // These are VCL-only; CLX uses different constant values
  Cl.AddConstantN('clScrollBar', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_SCROLLBAR);
  Cl.AddConstantN('clBackground', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_BACKGROUND);
  Cl.AddConstantN('clActiveCaption', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_ACTIVECAPTION);
  Cl.AddConstantN('clInactiveCaption', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_INACTIVECAPTION);
  Cl.AddConstantN('clMenu', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_MENU);
  Cl.AddConstantN('clWindow', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_WINDOW);
  Cl.AddConstantN('clWindowFrame', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_WINDOWFRAME);
  Cl.AddConstantN('clMenuText', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_MENUTEXT);
  Cl.AddConstantN('clWindowText', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_WINDOWTEXT);
  Cl.AddConstantN('clCaptionText', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_CAPTIONTEXT);
  Cl.AddConstantN('clActiveBorder', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_ACTIVEBORDER);
  Cl.AddConstantN('clInactiveBorder', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_INACTIVEBORDER);
  Cl.AddConstantN('clAppWorkSpace', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_APPWORKSPACE);
  Cl.AddConstantN('clHighlight', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_HIGHLIGHT);
  Cl.AddConstantN('clHighlightText', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_HIGHLIGHTTEXT);
  Cl.AddConstantN('clBtnFace', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_BTNFACE);
  Cl.AddConstantN('clBtnShadow', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_BTNSHADOW);
  Cl.AddConstantN('clGrayText', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_GRAYTEXT);
  Cl.AddConstantN('clBtnText', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_BTNTEXT);
  Cl.AddConstantN('clInactiveCaptionText', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_INACTIVECAPTIONTEXT);
  Cl.AddConstantN('clBtnHighlight', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_BTNHIGHLIGHT);
  Cl.AddConstantN('cl3DDkShadow', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_3DDKSHADOW);
  Cl.AddConstantN('cl3DLight', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_3DLIGHT);
  Cl.AddConstantN('clInfoText', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_INFOTEXT);
  Cl.AddConstantN('clInfoBk', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_INFOBK);
{$ENDIF}
{$ENDIF}
  Cl.AddConstantN('clBlack', 'Integer').Value.ts32 := $000000;
  Cl.AddConstantN('clMaroon', 'Integer').Value.ts32 := $000080;
  Cl.AddConstantN('clGreen', 'Integer').Value.ts32 := $008000;
  Cl.AddConstantN('clOlive', 'Integer').Value.ts32 := $008080;
  Cl.AddConstantN('clNavy', 'Integer').Value.ts32 := $800000;
  Cl.AddConstantN('clPurple', 'Integer').Value.ts32 := $800080;
  Cl.AddConstantN('clTeal', 'Integer').Value.ts32 := $808000;
  Cl.AddConstantN('clGray', 'Integer').Value.ts32 := $808080;
  Cl.AddConstantN('clSilver', 'Integer').Value.ts32 := $C0C0C0;
  Cl.AddConstantN('clRed', 'Integer').Value.ts32 := $0000FF;
  Cl.AddConstantN('clLime', 'Integer').Value.ts32 := $00FF00;
  Cl.AddConstantN('clYellow', 'Integer').Value.ts32 := $00FFFF;
  Cl.AddConstantN('clBlue', 'Integer').Value.ts32 := $FF0000;
  Cl.AddConstantN('clFuchsia', 'Integer').Value.ts32 := $FF00FF;
  Cl.AddConstantN('clAqua', 'Integer').Value.ts32 := $FFFF00;
  Cl.AddConstantN('clLtGray', 'Integer').Value.ts32 := $C0C0C0;
  Cl.AddConstantN('clDkGray', 'Integer').Value.ts32 := $808080;
  Cl.AddConstantN('clWhite', 'Integer').Value.ts32 := $FFFFFF;
  Cl.AddConstantN('clNone', 'Integer').Value.ts32 := $1FFFFFFF;
  Cl.AddConstantN('clDefault', 'Integer').Value.ts32 := $20000000;
  Cl.AddTypeS('TFontName', 'string');
  Cl.AddTypeS('TFontCharset', 'Integer');
  Cl.AddTypeS('TFillStyle', '(fsSurface, fsBorder)');
  Cl.AddTypeS('TFillMode', '(fmAlternate, fmWinding)');
  Cl.AddTypeS('TCopyMode', 'Longint');
  Cl.AddTypeS('TCanvasStates', '(csHandleValid, csFontValid, csPenValid, csBrushValid)');
  Cl.AddTypeS('TCanvasState', 'set of TCanvasStates');
  Cl.AddTypeS('TCanvasOrientation', '(coLeftToRight, coRightToLeft)');
  Cl.AddTypeS('TTextFormats', '(tfBottom, tfCalcRect, tfCenter, tfEditControl,'
   +' tfEndEllipsis, tfPathEllipsis, tfExpandTabs, tfExternalLeading, tfLeft, t'
   +'fModifyString, tfNoClip, tfNoPrefix, tfRight, tfRtlReading, tfSingleLine, '
   +'tfTop, tfVerticalCenter, tfWordBreak)');
  Cl.AddTypeS('TTextFormat', 'set of TTextFormats');

  Cl.addTypeS('TFontStyle', '(fsBold, fsItalic, fsUnderline, fsStrikeOut)');
  Cl.addTypeS('TFontStyles', 'set of TFontStyle');

  Cl.AddTypeS('TFontPitch', '(fpDefault, fpVariable, fpFixed)');
  Cl.AddTypeS('TPenStyle', '(psSolid, psDash, psDot, psDashDot, psDashDotDot, psClear, psInsideFrame)');
  Cl.AddTypeS('TPenMode', '(pmBlack, pmWhite, pmNop, pmNot, pmCopy, pmNotCopy, pmMergePenNot, pmMaskPenNot, pmMergeNotPen, pmMaskNotPen, pmMerge, pmNotMerge, pmMask, pmNotMask, pmXor, pmNotXor)');
  Cl.AddTypeS('TBrushStyle', '(bsSolid, bsClear, bsHorizontal, bsVertical, bsFDiagonal, bsBDiagonal, bsCross, bsDiagCross)');
  Cl.addTypeS('TColor', 'Integer');

  Cl.AddTypeS('TBitmapHandleType', '(bmDIB, bmDDB)');
  Cl.AddTypeS('TPixelFormat', '(pfDevice, pf1bit, pf4bit, pf8bit, pf15bit, pf16bit, pf24bit, pf32bit, pfCustom)');
  //Cl.AddTypeS('TAlphaFormat', '(afIgnored, afDefined, afPremultiplied)');
  Cl.AddTypeS('TTransparentMode', '(tmAuto, tmFixed)');

  {$IFNDEF CLX}
    Cl.addTypeS('HBITMAP', 'Integer');
    Cl.addTypeS('HPALETTE', 'Integer');
  {$IFNDEF PS_MINIVCL}
    Cl.AddTypeS('HMETAFILE', 'Integer');
    Cl.AddTypeS('HENHMETAFILE', 'Integer');
    Cl.addTypeS('HPEN', 'LongWord');
    Cl.addTypeS('HBRUSH', 'LongWord');
    Cl.addTypeS('HDC', 'LongWord');
    Cl.AddTypeS('HICON','LongWord');
    Cl.AddTypeS('TByteArray','array[0..$FFFF] of Byte');
  {$ENDIF}
{$ENDIF}
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_Graphics(Cl: TPSPascalCompiler; Streams: Boolean);
begin
  SIRegister_Graphics_TypesAndConsts(Cl);
  SIRegisterTGRAPHICSOBJECT(Cl);
  SIRegisterTGraphic(Cl, Streams);
  SIRegisterTFont(Cl);
  SIRegisterTPEN(Cl);
  SIRegisterTBRUSH(Cl);
  SIRegisterTCustomCanvas(Cl);
  SIRegisterTCanvas(Cl);
  SIRegisterTBitmap(Cl, Streams);
  {$IFNDEF PS_MINIVCL}
    SIRegisterTIcon(Cl, Streams);
    SIRegisterTMetafile(Cl);
    SIRegisterTMetafileCanvas(Cl);
    SIRegisterTPngImage(Cl, Streams);
  {$ENDIF}
  SIRegisterTPicture(Cl, Streams);
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)
end.
