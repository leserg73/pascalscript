{ Runtime Buttons support }
unit uPSR_buttons;

{$I PascalScript.inc}

interface

uses
  uPSRuntime, uPSUtils;

procedure RIRegisterTSPEEDBUTTON(Cl: TPSRuntimeClassImporter);
procedure RIRegisterTBITBTN(Cl: TPSRuntimeClassImporter);

procedure RIRegister_Buttons(Cl: TPSRuntimeClassImporter);

implementation

uses
  Classes{$IFDEF CLX}, QControls, QButtons{$ELSE}, Controls, Buttons{$ENDIF};

{ TSpeedButton --------------------------------------------------------------- }
procedure RIRegisterTSPEEDBUTTON(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TSPEEDBUTTON) do
  begin
    {$IFDEF DELPHI4UP}
      RegisterVirtualConstructor(@TSPEEDBUTTON.CREATE, 'Create');
    {$ELSE}
      RegisterConstructor(@TSPEEDBUTTON.CREATE, 'Create');
    {$ENDIF}
    //RegisterMethod(@TSPEEDBUTTON.CLICK, 'Click');
    //RegisterMethod(@TSPEEDBUTTON.DEFOCUSCONTROL, 'DefocusControl');
    //RegisterMethod(@TSPEEDBUTTON.FOCUSCONTROL, 'FocusControl');
    //RegisterMethod(@TSPEEDBUTTON.SETFOCUSEDCONTROL, 'SetFocusedControl');
  end;
end;

{ TBitBtn -------------------------------------------------------------------- }
procedure RIRegisterTBITBTN(Cl: TPSRuntimeClassImporter);
begin
  with Cl.Add(TBITBTN) do
  begin
    {$IFDEF DELPHI4UP}
      RegisterVirtualConstructor(@TBITBTN.CREATE, 'Create');
    {$ELSE}
      RegisterConstructor(@TBITBTN.CREATE, 'Create');
    {$ENDIF}
    //RegisterMethod(@TBITBTN.CLICK, 'Click');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_Buttons(Cl: TPSRuntimeClassImporter);
begin
  RIRegisterTSpeedButton(Cl);
  RIRegisterTBitBtn(Cl);
end;

// PS_MINIVCL changes by Martijn Laan
end.
