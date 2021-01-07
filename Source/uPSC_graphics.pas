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
procedure SIRegisterTCanvas(cl: TPSPascalCompiler);
procedure SIRegisterTGraphic(CL: TPSPascalCompiler);
procedure SIRegisterTBitmap(CL: TPSPascalCompiler; Streams: Boolean);
procedure SIRegisterTPicture(CL: TPSPascalCompiler; Streams: Boolean);

{$IFNDEF PS_MINIVCL}
  procedure SIRegisterTIcon(CL: TPSPascalCompiler; Streams: Boolean);
  procedure SIRegisterTPngImage(CL: TPSPascalCompiler; Streams: Boolean);
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

procedure SIRegisterTGRAPHICSOBJECT(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TPersistent'), 'TGraphicsObject') do
  begin
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
  end;
end;

procedure SIRegisterTFont(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TGraphicsObject'), 'TFont') do
  begin
    RegisterMethod('constructor Create;');
{$IFNDEF CLX}
    RegisterProperty('Handle', 'Integer', iptRW);
{$ENDIF}
    RegisterProperty('Color', 'TColor', iptRW);
    RegisterProperty('Height', 'Integer', iptRW);
    RegisterProperty('Name', 'string', iptRW);
    RegisterProperty('Pitch', 'Byte', iptRW);
    RegisterProperty('Size', 'Integer', iptRW);
    RegisterProperty('PixelsPerInch', 'Integer', iptRW);
    RegisterProperty('Style', 'TFontStyles', iptrw);
  end;
end;

procedure SIRegisterTCanvas(cl: TPSPascalCompiler); // requires TPersistent
begin
  with Cl.AddClassN(cl.FindClass('TPersistent'), 'TCanvas') do
  begin
    RegisterMethod('procedure Arc(X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer);');
    RegisterMethod('procedure Chord(X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer);');
    RegisterMethod('procedure Draw(X, Y: Integer; Graphic: TGraphic);');
    RegisterMethod('procedure Ellipse(X1, Y1, X2, Y2: Integer);');
    RegisterMethod('procedure FillRect(const Rect: TRect);');
{$IFNDEF CLX}
    RegisterMethod('procedure FloodFill(X, Y: Integer; Color: TColor; FillStyle: Byte);');
{$ENDIF}
    RegisterMethod('procedure LineTo(X, Y: Integer);');
    RegisterMethod('procedure MoveTo(X, Y: Integer);');
    RegisterMethod('procedure Pie(X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer);');
    RegisterMethod('procedure Rectangle(X1, Y1, X2, Y2: Integer);');
    RegisterMethod('procedure Refresh;');
    RegisterMethod('procedure RoundRect(X1, Y1, X2, Y2, X3, Y3: Integer);');
    RegisterMethod('function TextHeight(Text: string): Integer;');
    RegisterMethod('procedure TextOut(X, Y: Integer; Text: string);');
    RegisterMethod('function TextWidth(Text: string): Integer;');
{$IFNDEF CLX}
    RegisterProperty('Handle', 'Integer', iptRw);
{$ENDIF}
    RegisterProperty('Pixels', 'Integer Integer Integer', iptRW);
    RegisterProperty('Brush', 'TBrush', iptR);
    RegisterProperty('CopyMode', 'Byte', iptRw);
    RegisterProperty('Font', 'TFont', iptR);
    RegisterProperty('Pen', 'TPen', iptR);
  end;
end;

procedure SIRegisterTPEN(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TGraphicsObject'), 'TPen') do
  begin
    RegisterMethod('constructor Create');
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Mode', 'TPenMode', iptrw);
    RegisterProperty('Style', 'TPenStyle', iptrw);
    RegisterProperty('Width', 'Integer', iptrw);
  end;
end;

procedure SIRegisterTBRUSH(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(cl.FindClass('TGraphicsObject'), 'TBrush') do
  begin
    RegisterMethod('constructor Create');
    RegisterProperty('Color', 'TColor', iptrw);
    RegisterProperty('Style', 'TBrushStyle', iptrw);
  end;
end;

procedure SIRegister_Graphics_TypesAndConsts(Cl: TPSPascalCompiler);
{$IFDEF PS_NOGRAPHCONST}
const
  clSystemColor = {$IFDEF DELPHI7UP} $FF000000 {$ELSE} $80000000 {$ENDIF};
{$ENDIF}
begin
{$IFNDEF PS_NOGRAPHCONST}
  cl.AddConstantN('clScrollBar', 'Integer').Value.ts32 := clScrollBar;
  cl.AddConstantN('clBackground', 'Integer').Value.ts32 := clBackground;
  cl.AddConstantN('clActiveCaption', 'Integer').Value.ts32 := clActiveCaption;
  cl.AddConstantN('clInactiveCaption', 'Integer').Value.ts32 := clInactiveCaption;
  cl.AddConstantN('clMenu', 'Integer').Value.ts32 := clMenu;
  cl.AddConstantN('clWindow', 'Integer').Value.ts32 := clWindow;
  cl.AddConstantN('clWindowFrame', 'Integer').Value.ts32 := clWindowFrame;
  cl.AddConstantN('clMenuText', 'Integer').Value.ts32 := clMenuText;
  cl.AddConstantN('clWindowText', 'Integer').Value.ts32 := clWindowText;
  cl.AddConstantN('clCaptionText', 'Integer').Value.ts32 := clCaptionText;
  cl.AddConstantN('clActiveBorder', 'Integer').Value.ts32 := clActiveBorder;
  cl.AddConstantN('clInactiveBorder', 'Integer').Value.ts32 := clInactiveCaption;
  cl.AddConstantN('clAppWorkSpace', 'Integer').Value.ts32 := clAppWorkSpace;
  cl.AddConstantN('clHighlight', 'Integer').Value.ts32 := clHighlight;
  cl.AddConstantN('clHighlightText', 'Integer').Value.ts32 := clHighlightText;
  cl.AddConstantN('clBtnFace', 'Integer').Value.ts32 := clBtnFace;
  cl.AddConstantN('clBtnShadow', 'Integer').Value.ts32 := clBtnShadow;
  cl.AddConstantN('clGrayText', 'Integer').Value.ts32 := clGrayText;
  cl.AddConstantN('clBtnText', 'Integer').Value.ts32 := clBtnText;
  cl.AddConstantN('clInactiveCaptionText', 'Integer').Value.ts32 := clInactiveCaptionText;
  cl.AddConstantN('clBtnHighlight', 'Integer').Value.ts32 := clBtnHighlight;
  cl.AddConstantN('cl3DDkShadow', 'Integer').Value.ts32 := cl3DDkShadow;
  cl.AddConstantN('cl3DLight', 'Integer').Value.ts32 := cl3DLight;
  cl.AddConstantN('clInfoText', 'Integer').Value.ts32 := clInfoText;
  cl.AddConstantN('clInfoBk', 'Integer').Value.ts32 := clInfoBk;
{$ELSE}
{$IFNDEF CLX}  // These are VCL-only; CLX uses different constant values
  cl.AddConstantN('clScrollBar', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_SCROLLBAR);
  cl.AddConstantN('clBackground', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_BACKGROUND);
  cl.AddConstantN('clActiveCaption', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_ACTIVECAPTION);
  cl.AddConstantN('clInactiveCaption', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_INACTIVECAPTION);
  cl.AddConstantN('clMenu', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_MENU);
  cl.AddConstantN('clWindow', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_WINDOW);
  cl.AddConstantN('clWindowFrame', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_WINDOWFRAME);
  cl.AddConstantN('clMenuText', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_MENUTEXT);
  cl.AddConstantN('clWindowText', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_WINDOWTEXT);
  cl.AddConstantN('clCaptionText', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_CAPTIONTEXT);
  cl.AddConstantN('clActiveBorder', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_ACTIVEBORDER);
  cl.AddConstantN('clInactiveBorder', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_INACTIVEBORDER);
  cl.AddConstantN('clAppWorkSpace', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_APPWORKSPACE);
  cl.AddConstantN('clHighlight', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_HIGHLIGHT);
  cl.AddConstantN('clHighlightText', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_HIGHLIGHTTEXT);
  cl.AddConstantN('clBtnFace', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_BTNFACE);
  cl.AddConstantN('clBtnShadow', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_BTNSHADOW);
  cl.AddConstantN('clGrayText', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_GRAYTEXT);
  cl.AddConstantN('clBtnText', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_BTNTEXT);
  cl.AddConstantN('clInactiveCaptionText', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_INACTIVECAPTIONTEXT);
  cl.AddConstantN('clBtnHighlight', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_BTNHIGHLIGHT);
  cl.AddConstantN('cl3DDkShadow', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_3DDKSHADOW);
  cl.AddConstantN('cl3DLight', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_3DLIGHT);
  cl.AddConstantN('clInfoText', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_INFOTEXT);
  cl.AddConstantN('clInfoBk', 'Integer').Value.ts32 := Integer(clSystemColor or COLOR_INFOBK);
{$ENDIF}
{$ENDIF}
  cl.AddConstantN('clBlack', 'Integer').Value.ts32 := $000000;
  cl.AddConstantN('clMaroon', 'Integer').Value.ts32 := $000080;
  cl.AddConstantN('clGreen', 'Integer').Value.ts32 := $008000;
  cl.AddConstantN('clOlive', 'Integer').Value.ts32 := $008080;
  cl.AddConstantN('clNavy', 'Integer').Value.ts32 := $800000;
  cl.AddConstantN('clPurple', 'Integer').Value.ts32 := $800080;
  cl.AddConstantN('clTeal', 'Integer').Value.ts32 := $808000;
  cl.AddConstantN('clGray', 'Integer').Value.ts32 := $808080;
  cl.AddConstantN('clSilver', 'Integer').Value.ts32 := $C0C0C0;
  cl.AddConstantN('clRed', 'Integer').Value.ts32 := $0000FF;
  cl.AddConstantN('clLime', 'Integer').Value.ts32 := $00FF00;
  cl.AddConstantN('clYellow', 'Integer').Value.ts32 := $00FFFF;
  cl.AddConstantN('clBlue', 'Integer').Value.ts32 := $FF0000;
  cl.AddConstantN('clFuchsia', 'Integer').Value.ts32 := $FF00FF;
  cl.AddConstantN('clAqua', 'Integer').Value.ts32 := $FFFF00;
  cl.AddConstantN('clLtGray', 'Integer').Value.ts32 := $C0C0C0;
  cl.AddConstantN('clDkGray', 'Integer').Value.ts32 := $808080;
  cl.AddConstantN('clWhite', 'Integer').Value.ts32 := $FFFFFF;
  cl.AddConstantN('clNone', 'Integer').Value.ts32 := $1FFFFFFF;
  cl.AddConstantN('clDefault', 'Integer').Value.ts32 := $20000000;

  Cl.addTypeS('TFontStyle', '(fsBold, fsItalic, fsUnderline, fsStrikeOut)');
  Cl.addTypeS('TFontStyles', 'set of TFontStyle');

  cl.AddTypeS('TFontPitch', '(fpDefault, fpVariable, fpFixed)');
  cl.AddTypeS('TPenStyle', '(psSolid, psDash, psDot, psDashDot, psDashDotDot, psClear, psInsideFrame)');
  cl.AddTypeS('TPenMode', '(pmBlack, pmWhite, pmNop, pmNot, pmCopy, pmNotCopy, pmMergePenNot, pmMaskPenNot, pmMergeNotPen, pmMaskNotPen, pmMerge, pmNotMerge, pmMask, pmNotMask, pmXor, pmNotXor)');
  cl.AddTypeS('TBrushStyle', '(bsSolid, bsClear, bsHorizontal, bsVertical, bsFDiagonal, bsBDiagonal, bsCross, bsDiagCross)');
  cl.addTypeS('TColor', 'Integer');

{$IFNDEF CLX}
  cl.addTypeS('HBITMAP', 'Integer');
  cl.addTypeS('HPALETTE', 'Integer');
{$IFNDEF PS_MINIVCL}
  cl.addTypeS('HICON', 'Integer');
{$ENDIF}
{$ENDIF}
end;

procedure SIRegisterTGraphic(CL: TPSPascalCompiler);
begin
  with CL.AddClassN(CL.FindClass('TPersistent'),'TGraphic') do
  begin
    RegisterMethod('constructor Create');
    RegisterMethod('procedure LoadFromFile(const FileName: string)');
    RegisterMethod('procedure SaveToFile(const FileName: string)');
    RegisterProperty('Empty', 'Boolean', iptr);
    RegisterProperty('Height', 'Integer', iptrw);
    RegisterProperty('Modified', 'Boolean', iptrw);
    RegisterProperty('Width', 'Integer', iptrw);
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
  end;
end;

procedure SIRegisterTBitmap(CL: TPSPascalCompiler; Streams: Boolean);
begin
  with CL.AddClassN(CL.FindClass('TGraphic'),'TBitmap') do
  begin
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
      RegisterProperty('TransparentColor', 'TColor', iptr);
    {$ENDIF}
  end;
end;

{ TPicture }
procedure SIRegisterTPicture(CL: TPSPascalCompiler; Streams: Boolean);
begin
  with CL.AddClassN(CL.FindClass('TPersistent'),'TPicture') do
  begin
  {$IFNDEF PS_MINIVCL}
    {$IFNDEF VER200}
      if Streams then begin
        RegisterMethod('procedure LoadFromStream(Stream: TStream)');
        RegisterMethod('procedure SaveToStream(Stream: TStream)');
      end;
    {$ENDIF}
    RegisterMethod('Constructor Create');
    RegisterMethod('Procedure LoadFromFile(const Filename: string)');
    RegisterMethod('Procedure SaveToFile(const Filename: string)');
    //RegisterMethod('Procedure LoadFromClipboardFormat( AFormat : Word; AData : THandle; APalette : HPALETTE)');
    //RegisterMethod('Procedure SaveToClipboardFormat( var AFormat : Word; var AData : THandle; var APalette : HPALETTE)');
    //RegisterMethod('Function SupportsClipboardFormat( AFormat : Word) : Boolean');
    //RegisterMethod('Procedure RegisterFileFormat( const AExtension, ADescription : string; AGraphicClass : TGraphicClass)');
    //RegisterMethod('Procedure RegisterFileFormatRes( const AExtension : String; ADescriptionResID : Integer; AGraphicClass : TGraphicClass)');
    //RegisterMethod('Procedure RegisterClipboardFormat( AFormat : Word; AGraphicClass : TGraphicClass)');
    //RegisterMethod('Procedure UnregisterGraphicClass( AClass : TGraphicClass)');
  {$ENDIF}
    RegisterProperty('Bitmap', 'TBitmap', iptrw);
  {$IFNDEF PS_MINIVCL}
    RegisterProperty('Graphic', 'TGraphic', iptrw);
    //RegisterProperty('PictureAdapter', 'IChangeNotifier', iptrw);
    RegisterProperty('Height', 'Integer', iptr);
    RegisterProperty('Icon', 'TIcon', iptrw);
    RegisterProperty('Metafile', 'TMetafile', iptrw);
    RegisterProperty('Width', 'Integer', iptr);
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
    RegisterProperty('OnProgress', 'TProgressEvent', iptrw);
  {$ENDIF}
  end;
end;

{$IFNDEF PS_MINIVCL}
{ TIcon }
procedure SIRegisterTIcon(CL: TPSPascalCompiler; Streams: Boolean);
begin
  //with RegClassS(CL,'TGraphic', 'TIcon') do
  with CL.AddClassN(CL.FindClass('TGraphic'), 'TIcon') do
  begin
    if Streams then begin
      RegisterMethod('procedure LoadFromStream(Stream: TStream)');
      RegisterMethod('procedure SaveToStream(Stream: TStream)');
    end;
//    RegisterMethod('Function HandleAllocated : Boolean');
    RegisterMethod('Function ReleaseHandle : HICON');
    RegisterMethod('Procedure LoadFromResourceName(Instance : THandle; const ResName: String)');
    RegisterMethod('Procedure LoadFromResourceID(Instance : THandle; ResID: Integer)');
    RegisterProperty('Handle', 'HICON', iptrw);
  end;
end;

{ TPngImage }
procedure SIRegisterTPngImage(CL: TPSPascalCompiler; Streams: Boolean);
begin
  //with RegClassS(CL,'TGraphic', 'TPngImage') do
  with CL.AddClassN(CL.FindClass('TGraphic'),'TPngImage') do
  begin
    if Streams then begin
      RegisterMethod('procedure LoadFromStream(Stream: TStream)');
      RegisterMethod('procedure SaveToStream(Stream: TStream)');
    end;
    RegisterMethod('Constructor Create');
    //RegisterMethod('Constructor CreateBlank( ColorType, Bitdepth : Cardinal; cx, cy : Integer)');
    //RegisterMethod('Procedure AddtEXt( const Keyword, Text : AnsiString)');
    //RegisterMethod('Procedure AddzTXt( const Keyword, Text : AnsiString)');
    //RegisterMethod('Procedure AssignHandle( Handle : HBitmap; Transparent : Boolean; TransparentColor : ColorRef)');
    //RegisterMethod('Procedure CreateAlpha');
    //RegisterMethod('Procedure DrawUsingPixelInformation( Canvas : TCanvas; Point : TPoint)');
    RegisterMethod('Procedure LoadFromFile(const Filename: String)');
    RegisterMethod('Procedure LoadFromResourceID(Instance: THandle; ResID: Integer)');
    RegisterMethod('Procedure LoadFromResourceName(Instance: THandle; const Name: String)');
    //RegisterMethod('Procedure RaiseError( ExceptionClass : ExceptClass; Text : String)');
    //RegisterMethod('Procedure RemoveTransparency');
    RegisterMethod('Procedure Resize(const CX, CY: Integer)');
    //RegisterMethod('Procedure SaveToFile( const Filename : String)');
    //RegisterProperty('AlphaScanline', 'pByteArray Integer', iptr);
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

procedure SIRegister_Graphics(Cl: TPSPascalCompiler; Streams: Boolean);
begin
  SIRegister_Graphics_TypesAndConsts(Cl);
  SIRegisterTGRAPHICSOBJECT(Cl);
  SIRegisterTGraphic(Cl);
  SIRegisterTFont(Cl);
  SIRegisterTPEN(cl);
  SIRegisterTBRUSH(cl);
  SIRegisterTCanvas(cl);
  SIRegisterTBitmap(Cl, Streams);
  SIRegisterTPicture(Cl, Streams);
{$IFNDEF PS_MINIVCL}
  SIRegisterTIcon(Cl, Streams);
  SIRegisterTPngImage(Cl, Streams);
{$ENDIF}
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)

End.