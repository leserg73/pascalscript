{ Compiletime ComObj support }
unit uPSC_comobj;

{$I PascalScript.inc}

interface

uses
  uPSCompiler, uPSUtils;

{
 
  Will register:
 
    function CreateOleObject(const ClassName: String): IDispatch;
    function GetActiveOleObject(const ClassName: String): IDispatch;

}

procedure SIRegister_ComObj(Cl: TPSPascalCompiler);

implementation

(*----------------------------------------------------------------------------*)
procedure SIRegister_ComObj(Cl: TPSPascalCompiler);
begin
  {$IFDEF FPC}
    {$IFDEF PS_FPC_HAS_COM}
      Cl.AddTypeS('HResult', 'LongInt');
      Cl.AddTypeS('TGUID', 'record D1: LongWord; D2: Word; D3: Word; D4: array[0..7] of Byte; end;');
      Cl.AddTypeS('TCLSID', 'TGUID');
      Cl.AddTypeS('TIID', 'TGUID');
      Cl.AddDelphiFunction('procedure OleCheck(Result: HResult);');
      Cl.AddDelphiFunction('function StringToGUID(const S: string): TGUID;');
      Cl.AddDelphiFunction('function CreateComObject(const ClassID: TGUID): IUnknown;');
      Cl.AddDelphiFunction('function CreateOleObject(const ClassName: string): IDispatch;');
      Cl.AddDelphiFunction('function GetActiveOleObject(const ClassName: string): IDispatch;');
    {$ENDIF}
  {$ELSE}
    Cl.AddTypeS('HResult', 'LongInt');
    Cl.AddTypeS('TGUID', 'record D1: LongWord; D2: Word; D3: Word; D4: array[0..7] of Byte; end;');
    Cl.AddTypeS('TCLSID', 'TGUID');
    Cl.AddTypeS('TIID', 'TGUID');
    Cl.AddDelphiFunction('procedure OleCheck(Result: HResult);');
    {$IFNDEF PS_NOINTERFACES}
      {$IFDEF DELPHI3UP}
        Cl.AddDelphiFunction('function StringToGUID(const S: string): TGUID;');
        Cl.AddDelphiFunction('function CreateComObject(const ClassID: TGUID): IUnknown;');
      {$ENDIF}
    {$ENDIF}
    Cl.AddDelphiFunction('function CreateOleObject(const ClassName: string): IDispatch;');
    Cl.AddDelphiFunction('function GetActiveOleObject(const ClassName: string): IDispatch;');
  {$ENDIF}  
end;

end.
