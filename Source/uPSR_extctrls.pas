{ Runtime Extctrls support }
unit uPSR_extctrls;

{$I PascalScript.inc}

interface

uses
  uPSRuntime, uPSUtils;

procedure RIRegister_ExtCtrls(Cl: TPSRuntimeClassImporter);

procedure RIRegisterTSHAPE(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTIMAGE(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTPAINTBOX(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTBEVEL(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTTIMER(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTCUSTOMPANEL(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTPANEL(Cl: TPSRuntimeClassImporter);
{$IFNDEF CLX}
  procedure RIRegisterTPAGE(Cl: TPSRuntimeClassImporter);
  procedure RIRegisterTNOTEBOOK(Cl: TPSRuntimeClassImporter);
  {$IFNDEF FPC}
    procedure RIRegisterTHEADER(Cl: TPSRuntimeClassImporter);
  {$ENDIF}
{$ENDIF}
procedure RIRegisterTCUSTOMRADIOGROUP(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTRADIOGROUP(Cl: TPSRuntimeClassImporter);
{$IFDEF DELPHI12UP}
  procedure RIRegisterTCUSTOMLINKLABEL(Cl: TPSRuntimeClassImporter);
  procedure RIRegisterTLINKLABEL(Cl: TPSRuntimeClassImporter);
{$ENDIF}
{$IFNDEF PS_MINIVCL}
  procedure RIRegister_TColorBox(Cl: TPSRuntimeClassImporter);
  procedure RIRegister_TCustomColorBox(Cl: TPSRuntimeClassImporter);
{$ENDIF}

implementation

uses
  {$IFDEF CLX}
  QExtCtrls, QGraphics;
  {$ELSE}
  ExtCtrls, Graphics;
  {$ENDIF}

{ TShape --------------------------------------------------------------------- }
procedure RIRegisterTSHAPE(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TSHAPE) do
  begin
    {$IFNDEF PS_MINIVCL}
    RegisterMethod(@TSHAPE.STYLECHANGED, 'StyleChanged');
    {$ENDIF}
  end;
end;

{ TImage --------------------------------------------------------------------- }
procedure TIMAGECANVAS_R(Self: TIMAGE; var T: TCANVAS); begin T := Self.CANVAS; end;
procedure TImageCenter_W(Self: TImage; const T: Boolean); begin Self.Center := T; end;
procedure TImageCenter_R(Self: TImage; var T: Boolean); begin T := Self.Center; end;
procedure TImageProportional_W(Self: TImage; const T: Boolean); begin Self.Proportional := T; end;
procedure TImageProportional_R(Self: TImage; var T: Boolean); begin T := Self.Proportional; end;
procedure TImagePicture_W(Self: TImage; const T: TPicture); begin Self.Picture := T; end;
procedure TImagePicture_R(Self: TImage; var T: TPicture); begin T := Self.Picture; end;
procedure TImageStretch_W(Self: TImage; const T: Boolean); begin Self.Stretch := T; end;
procedure TImageStretch_R(Self: TImage; var T: Boolean); begin T := Self.Stretch; end;
procedure TImageTransparent_W(Self: TImage; const T: Boolean); begin Self.Transparent := T; end;
procedure TImageTransparent_R(Self: TImage; var T: Boolean); begin T := Self.Transparent; end;

procedure RIRegisterTIMAGE(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TIMAGE) do
  begin
    RegisterPropertyHelper(@TIMAGECANVAS_R, nil, 'Canvas');
    RegisterPropertyHelper(@TImageCenter_R,@TImageCenter_W,'Center');
    RegisterPropertyHelper(@TImagePicture_R,@TImagePicture_W,'Picture');
    RegisterPropertyHelper(@TImageProportional_R,@TImageProportional_W,'Proportional');
    RegisterPropertyHelper(@TImageStretch_R,@TImageStretch_W,'Stretch');
    RegisterPropertyHelper(@TImageTransparent_R,@TImageTransparent_W,'Transparent');
  end;
end;

{ TPaintBox ------------------------------------------------------------------ }
procedure TPAINTBOXCANVAS_R(Self: TPAINTBOX; var T: TCanvas); begin T := Self.CANVAS; end;

procedure RIRegisterTPAINTBOX(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TPAINTBOX) do
  begin
    RegisterPropertyHelper(@TPAINTBOXCANVAS_R, nil, 'Canvas');
  end;
end;

{ TBevel --------------------------------------------------------------------- }
procedure RIRegisterTBEVEL(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TBEVEL);
end;

{ TTimer --------------------------------------------------------------------- }
procedure RIRegisterTTIMER(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TTIMER);
end;

{ TCustomPanel --------------------------------------------------------------- }
procedure RIRegisterTCUSTOMPANEL(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TCUSTOMPANEL);
end;

{ TPanel --------------------------------------------------------------------- }
procedure RIRegisterTPANEL(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TPANEL);
end;

{$IFNDEF CLX}
{ TPage ---------------------------------------------------------------------- }
procedure RIRegisterTPAGE(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TPAGE);
end;

{ TNotebook ------------------------------------------------------------------ }
procedure RIRegisterTNOTEBOOK(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TNOTEBOOK);
end;

  {$IFNDEF FPC}
{ THeader -------------------------------------------------------------------- }
  procedure THEADERSECTIONWIDTH_R(Self: THEADER; var T: INTEGER; t1: INTEGER); begin T := Self.SECTIONWIDTH[t1]; end;
  procedure THEADERSECTIONWIDTH_W(Self: THEADER; T: INTEGER; t1: INTEGER); begin Self.SECTIONWIDTH[t1] := T; end;
  
  procedure RIRegisterTHEADER(Cl: TPSRuntimeClassImporter);
  begin
    with Cl.Add(THEADER) do
    begin
      RegisterPropertyHelper(@THEADERSECTIONWIDTH_R, @THEADERSECTIONWIDTH_W, 'SectionWidth');
    end;
  end;
  {$ENDIF}
{$ENDIF}

{ TCustomRadioGroup ---------------------------------------------------------- }
procedure RIRegisterTCUSTOMRADIOGROUP(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TCUSTOMRADIOGROUP);
end;

{ TRadioGroup ---------------------------------------------------------------- }
procedure RIRegisterTRADIOGROUP(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TRADIOGROUP);
end;

{$IFDEF DELPHI12UP}
{ TCustomLinkLabel ----------------------------------------------------------- }
procedure TCUSTOMLINKLABELALIGNMENT_R(Self: TCUSTOMLINKLABEL; var T: TCustomLinkLabel.TLinkAlignment); begin T := Self.ALIGNMENT; end;
procedure TCUSTOMLINKLABELALIGNMENT_W(Self: TCUSTOMLINKLABEL; T: TCustomLinkLabel.TLinkAlignment); begin Self.ALIGNMENT := T; end;
procedure TCUSTOMLINKLABELAUTOSIZE_R(Self: TCUSTOMLINKLABEL; var T: Boolean); begin T := Self.AUTOSIZE; end;
procedure TCUSTOMLINKLABELAUTOSIZE_W(Self: TCUSTOMLINKLABEL; T: Boolean); begin Self.AUTOSIZE := T; end;
procedure TCUSTOMLINKLABELUSEVISUALSTYLE_R(Self: TCUSTOMLINKLABEL; var T: Boolean); begin T := Self.USEVISUALSTYLE; end;
procedure TCUSTOMLINKLABELUSEVISUALSTYLE_W(Self: TCUSTOMLINKLABEL; T: Boolean); begin Self.USEVISUALSTYLE := T; end;
procedure TCUSTOMLINKLABELONLINKCLICK_R(Self: TCUSTOMLINKLABEL; var T: TSysLinkEvent); begin T := Self.ONLINKCLICK; end;
procedure TCUSTOMLINKLABELONLINKCLICK_W(Self: TCUSTOMLINKLABEL; T: TSysLinkEvent); begin Self.ONLINKCLICK := T; end;

procedure RIRegisterTCUSTOMLINKLABEL(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCUSTOMLINKLABEL) do
  begin
    RegisterPropertyHelper(@TCUSTOMLINKLABELALIGNMENT_R, @TCUSTOMLINKLABELALIGNMENT_W, 'Alignment');
    RegisterPropertyHelper(@TCUSTOMLINKLABELAUTOSIZE_R, @TCUSTOMLINKLABELAUTOSIZE_W, 'AutoSize');
    RegisterPropertyHelper(@TCUSTOMLINKLABELUSEVISUALSTYLE_R, @TCUSTOMLINKLABELUSEVISUALSTYLE_W, 'UseVisualStyle');
    RegisterPropertyHelper(@TCUSTOMLINKLABELONLINKCLICK_R, @TCUSTOMLINKLABELONLINKCLICK_W, 'OnLinkClick');
  end;
end;

{ TTLinkLabel ---------------------------------------------------------------- }
procedure RIRegisterTLINKLABEL(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TLINKLABEL);
end;
{$ENDIF}

{$IFNDEF PS_MINIVCL}
{ TColorBox ------------------------------------------------------------------ }
procedure RIRegister_TColorBox(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TColorBox) do
  begin
  end;
end;

{ TCustomColorBox ------------------------------------------------------------ }
procedure TCustomColorBoxOnGetColors_W(Self: TCustomColorBox; const T: TGetColorsEvent); begin Self.OnGetColors := T; end;
procedure TCustomColorBoxOnGetColors_R(Self: TCustomColorBox; var T: TGetColorsEvent); begin T := Self.OnGetColors; end;
procedure TCustomColorBoxNoneColorColor_W(Self: TCustomColorBox; const T: TColor); begin Self.NoneColorColor := T; end;
procedure TCustomColorBoxNoneColorColor_R(Self: TCustomColorBox; var T: TColor); begin T := Self.NoneColorColor; end;
procedure TCustomColorBoxDefaultColorColor_W(Self: TCustomColorBox; const T: TColor); begin Self.DefaultColorColor := T; end;
procedure TCustomColorBoxDefaultColorColor_R(Self: TCustomColorBox; var T: TColor); begin T := Self.DefaultColorColor; end;
procedure TCustomColorBoxSelected_W(Self: TCustomColorBox; const T: TColor); begin Self.Selected := T; end;
procedure TCustomColorBoxSelected_R(Self: TCustomColorBox; var T: TColor); begin T := Self.Selected; end;
procedure TCustomColorBoxColorNames_R(Self: TCustomColorBox; var T: string; const t1: Integer); begin T := Self.ColorNames[t1]; end;
procedure TCustomColorBoxColors_R(Self: TCustomColorBox; var T: TColor; const t1: Integer); begin T := Self.Colors[t1]; end;
procedure TCustomColorBoxStyle_W(Self: TCustomColorBox; const T: TColorBoxStyle); begin Self.Style := T; end;
procedure TCustomColorBoxStyle_R(Self: TCustomColorBox; var T: TColorBoxStyle); begin T := Self.Style; end;

procedure RIRegister_TCustomColorBox(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TCustomColorBox) do
  begin
    RegisterPropertyHelper(@TCustomColorBoxStyle_R,@TCustomColorBoxStyle_W,'Style');
    RegisterPropertyHelper(@TCustomColorBoxColors_R,nil,'Colors');
    RegisterPropertyHelper(@TCustomColorBoxColorNames_R,nil,'ColorNames');
    RegisterPropertyHelper(@TCustomColorBoxSelected_R,@TCustomColorBoxSelected_W,'Selected');
    RegisterPropertyHelper(@TCustomColorBoxDefaultColorColor_R,@TCustomColorBoxDefaultColorColor_W,'DefaultColorColor');
    RegisterPropertyHelper(@TCustomColorBoxNoneColorColor_R,@TCustomColorBoxNoneColorColor_W,'NoneColorColor');
    RegisterPropertyHelper(@TCustomColorBoxOnGetColors_R,@TCustomColorBoxOnGetColors_W,'OnGetColors');
  end;
end;
{$ENDIF}

(*----------------------------------------------------------------------------*)
procedure RIRegister_ExtCtrls(Cl: TPSRuntimeClassImporter);
begin
  {$IFNDEF PS_MINIVCL}
    RIRegisterTSHAPE(Cl);
    RIRegisterTIMAGE(Cl);
    RIRegisterTPAINTBOX(Cl);
  {$ENDIF}
  RIRegisterTBEVEL(Cl);
  {$IFNDEF PS_MINIVCL}
    RIRegisterTTIMER(Cl);
  {$ENDIF}
  RIRegisterTCUSTOMPANEL(Cl);
  {$IFNDEF CLX}
    RIRegisterTPANEL(Cl);
  {$ENDIF}
  {$IFNDEF PS_MINIVCL}
    {$IFNDEF CLX}
      RIRegisterTPAGE(Cl);
	  RIRegisterTNOTEBOOK(Cl);
      {$IFNDEF FPC}
	    RIRegisterTHEADER(Cl);
      {$ENDIF}{FPC}
    {$ENDIF}
    RIRegisterTCUSTOMRADIOGROUP(Cl);
    RIRegisterTRADIOGROUP(Cl);
    RIRegister_TCustomColorBox(Cl);
    RIRegister_TColorBox(Cl);
  {$ENDIF}
  {$IFDEF DELPHI12UP}
    RIRegisterTCUSTOMLINKLABEL(Cl);
    RIRegisterTLINKLABEL(Cl);
  {$ENDIF}
end;

end.
