{ Runtime FontAwesome support }
unit uPSR_fontawesome;

{$I PascalScript.inc}

interface

uses
  uPSRuntime, uPSUtils;

procedure RIRegister_TFontAwesome(Cl: TPSRuntimeClassImporter);
procedure RIRegister_FontAwesome(Cl: TPSRuntimeClassImporter);

implementation

uses
  Winapi.GDIPOBJ, Winapi.GDIPAPI, Winapi.Windows, System.Classes,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Graphics, Vcl.Styles.FontAwesome;

{ TFontAwesome --------------------------------------------------------------- }
//function TFontAwesomeGetIcon1_P(Self: TFontAwesome;  const ACode: Word; Width, Height, CharX, CharY: Integer; AColor, ABackColor: TColor; Orientation: Integer; ImageAlignment: TImageAlignment): HICON;
//begin Result := Self.GetIcon(ACode, Width, Height, CharX, CharY, AColor, ABackColor, Orientation, ImageAlignment); end;

function TFontAwesomeGetIcon_P(Self: TFontAwesome;  const ACode: Word; Width, Height: Integer; AColor, ABackColor: TColor; Orientation: Integer; ImageAlignment: TImageAlignment): HICON;
begin Result := Self.GetIcon(ACode, Width, Height, AColor, ABackColor, Orientation, ImageAlignment); end;

//procedure TFontAwesomeDrawChar3_P(Self: TFontAwesome;  DC: HDC; const ACode: Word; DestRect: TRect; AFontHeight: Integer; AColor: TColor; Orientation: Integer; ImageAlignment: TImageAlignment);
//begin Self.DrawChar(DC, ACode, DestRect, AFontHeight, AColor, Orientation, ImageAlignment); end;

procedure TFontAwesomeDrawChar2_P(Self: TFontAwesome;  DC: HDC; const ACode: Word; DestRect: TRect; AColor: TColor; Orientation: Integer; ImageAlignment: TImageAlignment);
begin Self.DrawChar(DC, ACode, DestRect, AColor, Orientation, ImageAlignment); end;

//procedure TFontAwesomeDrawChar1_P(Self: TFontAwesome;  DC: HDC; const AChar: Char; DestRect: TRect; AFontHeight: Integer; AColor: TColor; Orientation: Integer; ImageAlignment: TImageAlignment);
//begin Self.DrawChar(DC, AChar, DestRect, AFontHeight, AColor, Orientation, ImageAlignment); end;

procedure TFontAwesomeDrawChar_P(Self: TFontAwesome;  DC: HDC; const AChar: Char; DestRect: TRect; AColor: TColor; Orientation: Integer; ImageAlignment: TImageAlignment);
begin Self.DrawChar(DC, AChar, DestRect, AColor, Orientation, ImageAlignment); end;

procedure RIRegister_TFontAwesome(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TFontAwesome) do
  begin
    RegisterConstructor(@TFontAwesome.Create, 'Create');
    RegisterMethod(@TFontAwesomeDrawChar_P, 'DrawChar');
    //RegisterMethod(@TFontAwesomeDrawChar1_P, 'DrawChar1');
    RegisterMethod(@TFontAwesomeDrawChar2_P, 'DrawChar2');
    //RegisterMethod(@TFontAwesomeDrawChar3_P, 'DrawChar3');
    RegisterMethod(@TFontAwesomeGetIcon_P, 'GetIcon');
    //RegisterMethod(@TFontAwesomeGetIcon1_P, 'GetIcon1');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_FontAwesome(Cl: TPSRuntimeClassImporter);
begin
  RIRegister_TFontAwesome(Cl);
end;

end.
