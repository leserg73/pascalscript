
unit uPSR_extctrls;

{$I PascalScript.inc}
interface
uses
  uPSRuntime, uPSUtils;


procedure RIRegister_ExtCtrls(cl: TPSRuntimeClassImporter);

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
{$IFNDEF FPC}procedure RIRegisterTHEADER(Cl: TPSRuntimeClassImporter);{$ENDIF}
{$ENDIF}
procedure RIRegisterTCUSTOMRADIOGROUP(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTRADIOGROUP(Cl: TPSRuntimeClassImporter);

implementation

uses
  {$IFDEF CLX}
  QExtCtrls, QGraphics;
  {$ELSE}
  ExtCtrls, Graphics;
  {$ENDIF}

procedure RIRegisterTSHAPE(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TSHAPE) do
  begin
    {$IFNDEF PS_MINIVCL}
    RegisterMethod(@TSHAPE.STYLECHANGED, 'StyleChanged');
    {$ENDIF}
  end;
end;

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

procedure TPAINTBOXCANVAS_R(Self: TPAINTBOX; var T: TCanvas); begin T := Self.CANVAS; end;

procedure RIRegisterTPAINTBOX(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TPAINTBOX) do
  begin
    RegisterPropertyHelper(@TPAINTBOXCANVAS_R, nil, 'Canvas');
  end;
end;

procedure RIRegisterTBEVEL(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TBEVEL);
end;

procedure RIRegisterTTIMER(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TTIMER);
end;

procedure RIRegisterTCUSTOMPANEL(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TCUSTOMPANEL);
end;

procedure RIRegisterTPANEL(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TPANEL);
end;
{$IFNDEF CLX}
procedure RIRegisterTPAGE(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TPAGE);
end;

procedure RIRegisterTNOTEBOOK(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TNOTEBOOK);
end;

{$IFNDEF FPC}
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

procedure RIRegisterTCUSTOMRADIOGROUP(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TCUSTOMRADIOGROUP);
end;

procedure RIRegisterTRADIOGROUP(Cl: TPSRuntimeClassImporter);
begin
  Cl.Add(TRADIOGROUP);
end;

procedure RIRegister_ExtCtrls(cl: TPSRuntimeClassImporter);
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
  {$ENDIF}
end;

end.


