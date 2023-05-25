{ Compiletime Classes support }
unit uPSC_classes;

{$I PascalScript.inc}

interface

uses
  uPSCompiler, uPSUtils;

{

  Will register files from:
    Classes (exception TPersistent and TComponent)

  Register STD first

}

procedure SIRegister_Classes_TypesAndConsts(Cl: TPSPascalCompiler);

procedure SIRegisterTStrings(Cl: TPSPascalCompiler; Streams: Boolean);
procedure SIRegisterTStringList(Cl: TPSPascalCompiler);
{$IFNDEF PS_MINIVCL}
  procedure SIRegisterTBITS(Cl: TPSPascalCompiler);
{$ENDIF}
procedure SIRegisterTSTREAM(Cl: TPSPascalCompiler);
procedure SIRegisterTHANDLESTREAM(Cl: TPSPascalCompiler);
procedure SIRegisterTFILESTREAM(Cl: TPSPascalCompiler);
procedure SIRegisterTSTRINGSTREAM(Cl: TPSPascalCompiler);
{$IFNDEF PS_MINIVCL}
  procedure SIRegisterTCUSTOMMEMORYSTREAM(Cl: TPSPascalCompiler);
  procedure SIRegisterTMEMORYSTREAM(Cl: TPSPascalCompiler);
  procedure SIRegisterTRESOURCESTREAM(Cl: TPSPascalCompiler);
  procedure SIRegisterTPARSER(Cl: TPSPascalCompiler);
  procedure SIRegisterTCOLLECTIONITEM(Cl: TPSPascalCompiler);
  procedure SIRegisterTCOLLECTION(Cl: TPSPascalCompiler);
  {$IFDEF DELPHI3UP}
    procedure SIRegisterTOWNEDCOLLECTION(Cl: TPSPascalCompiler);
  {$ENDIF}
{$ENDIF}

procedure SIRegister_Classes(Cl: TPSPascalCompiler; Streams: Boolean{$IFDEF D4PLUS}=True{$ENDIF});

implementation

{ TStrings ------------------------------------------------------------------- }
procedure SIRegisterTStrings(Cl: TPSPascalCompiler; Streams: Boolean); // requires TPersistent
begin
  with Cl.AddClassN(Cl.FindClass('TPersistent'), 'TStrings') do
  begin
    IsAbstract := True;
    {$IFDEF DELPHI2005UP}
      RegisterMethod('constructor Create;');
    {$ENDIF}
    RegisterMethod('function Add(S: string): Integer;');
    RegisterMethod('procedure Append(S: string);');
    RegisterMethod('procedure AddStrings(Strings: TStrings);');
    RegisterMethod('procedure Clear;');
    RegisterMethod('procedure Delete(Index: Integer);');
    RegisterMethod('function IndexOf(const S: string): Integer;');
    RegisterMethod('procedure Insert(Index: Integer; S: string);');
    RegisterProperty('Capacity', 'Integer', iptrw);
    RegisterProperty('Delimiter', 'Char', iptrw);
    {$IFDEF DELPHI2006UP}
      RegisterProperty('StrictDelimiter', 'Boolean', iptrw);
    {$ENDIF}
    RegisterProperty('DelimitedText', 'string', iptrw);
    RegisterProperty('NameValueSeparator', 'Char', iptrw);
    RegisterProperty('QuoteChar', 'Char', iptrw);
    RegisterProperty('Count', 'Integer', iptr);
    RegisterProperty('Text', 'string', iptrw);
    RegisterProperty('CommaText', 'string', iptrw);
    if Streams then
    begin
      RegisterMethod('procedure LoadFromFile(FileName: string);');
      RegisterMethod('procedure SaveToFile(FileName: string);');
    end;
    RegisterProperty('Strings', 'string Integer', iptrw);
    SetDefaultPropery('Strings');
    RegisterProperty('Objects', 'TObject Integer', iptrw);
    {$IFNDEF PS_MINIVCL}
      RegisterMethod('procedure BeginUpdate;');
      RegisterMethod('procedure EndUpdate;');
      RegisterMethod('function Equals(Strings: TStrings): Boolean;');
      RegisterMethod('procedure Exchange(Index1, Index2: Integer);');
      RegisterMethod('function IndexOfName(Name: string): Integer;');
      if Streams then
        RegisterMethod('procedure LoadFromStream(Stream: TStream);');
      RegisterMethod('procedure Move(CurIndex, NewIndex: Integer);');
      if Streams then
        RegisterMethod('procedure SaveToStream(Stream: TStream);');
      RegisterMethod('procedure SetText(Text: PChar); ');
      RegisterProperty('Names', 'string Integer', iptr);
      RegisterProperty('Values', 'string string', iptrw);
      RegisterProperty('ValueFromIndex', 'string Integer', iptrw);
      RegisterMethod('function AddObject(S: string; AObject: TObject): Integer');
      RegisterMethod('function GetText: PChar');
      RegisterMethod('function IndexOfObject(AObject: TObject): Integer');
      RegisterMethod('procedure InsertObject(Index: Integer; S: string; AObject: TObject)');
    {$ENDIF}
  end;
end;

{ TStringList ---------------------------------------------------------------- }
procedure SIRegisterTSTRINGLIST(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TStrings'), 'TStringList') do
  begin
    {$IFDEF DELPHI2005UP}
      RegisterMethod('constructor Create;');
    {$ENDIF}
    RegisterMethod('function Find(S: string; var Index: Integer): Boolean');
    RegisterMethod('procedure Sort');
    RegisterProperty('CaseSensitive', 'Boolean', iptrw);
    RegisterProperty('Duplicates', 'TDuplicates', iptrw);
    RegisterProperty('Sorted', 'Boolean', iptrw);
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
    RegisterProperty('OnChanging', 'TNotifyEvent', iptrw);
  end;
end;

{$IFNDEF PS_MINIVCL}
{ TBits ---------------------------------------------------------------------- }
  procedure SIRegisterTBITS(Cl: TPSPascalCompiler);
  begin
    with Cl.AddClassN(Cl.FindClass('TObject'), 'TBits') do
    begin
      RegisterMethod('function OpenBit: Integer');
      RegisterProperty('Bits', 'Boolean Integer', iptrw);
      RegisterProperty('Size', 'Integer', iptrw);
    end;
  end;
{$ENDIF}

{ TStream -------------------------------------------------------------------- }
procedure SIRegisterTSTREAM(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TObject'), 'TStream') do
  begin
    IsAbstract := True;
    RegisterMethod('function Read(Buffer: string; Count: LongInt): LongInt');
    RegisterMethod('function Write(Buffer: string; Count: LongInt): LongInt');
    {$IFDEF DELPHI_TOKYO_UP}
      {$IFNDEF PS_NOINT64}
        RegisterMethod('function Seek(Offset: Int64; Origin: Word): Int64');
      {$ENDIF}
    {$ELSE}
      RegisterMethod('function Seek(Offset: LongInt; Origin: Word): LongInt');
    {$ENDIF}
    RegisterMethod('procedure ReadBuffer(Buffer: string; Count: LongInt)');
    RegisterMethod('procedure WriteBuffer(Buffer: string; Count: LongInt)');
    {$IFDEF DELPHI4UP}
      {$IFNDEF PS_NOINT64}
        RegisterMethod('function CopyFrom(Source: TStream; Count: Int64): Int64');
      {$ENDIF}
    {$ELSE}
      RegisterMethod('function CopyFrom(Source: TStream; Count: Integer): LongInt');
    {$ENDIF}
    RegisterProperty('Position', 'LongInt', iptrw);
    RegisterProperty('Size', 'LongInt', iptrw);
  end;
end;

{ THandleStream -------------------------------------------------------------- }
procedure SIRegisterTHANDLESTREAM(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TStream'), 'THandleStream') do
  begin
    RegisterMethod('constructor Create(AHandle: Integer)');
    RegisterProperty('Handle', 'Integer', iptr);
  end;
end;

{ TFileStream ---------------------------------------------------------------- }
procedure SIRegisterTFILESTREAM(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('THandleStream'), 'TFileStream') do
  begin
    RegisterMethod('constructor Create(FileName: string; Mode: Word)');
  end;
end;

{ TStringStream -------------------------------------------------------------- }
procedure SIRegisterTSTRINGSTREAM(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TStream'), 'TStringStream') do
  begin
    RegisterMethod('constructor Create(AString: string)');
  end;
end;

{$IFNDEF PS_MINIVCL}
{ TCustomMemoryStream -------------------------------------------------------- }
procedure SIRegisterTCUSTOMMEMORYSTREAM(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TStream'), 'TCustomMemoryStream') do
  begin
    IsAbstract := True;
    RegisterMethod('procedure SaveToStream(Stream: TStream)');
    RegisterMethod('procedure SaveToFile(FileName: string)');
    RegisterProperty('Memory', 'LongInt', iptr);
  end;
end;

{ TMemoryStream -------------------------------------------------------------- }
procedure SIRegisterTMEMORYSTREAM(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomMemoryStream'), 'TMemoryStream') do
  begin
    RegisterMethod('procedure Clear');
    RegisterMethod('procedure LoadFromStream(Stream: TStream)');
    RegisterMethod('procedure LoadFromFile(FileName: string)');
    RegisterMethod('procedure SetSize(NewSize: LongInt)');
  end;
end;

{ TResourceStream ------------------------------------------------------------ }
procedure SIRegisterTRESOURCESTREAM(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TCustomMemoryStream'), 'TResourceStream') do
  begin
    // var ReaType was changed from PChar to Integer by Leserg
    RegisterMethod('constructor Create(Instance: THandle; const ResName: string; ResType: Integer)');
    RegisterMethod('constructor CreateFromID(Instance: THandle; ResID: Integer; ResType: Integer)');
    RegisterProperty('Size', 'LongInt', iptr);
    RegisterProperty('Memory', 'LongInt', iptr);
  end;
end;

{ TParser -------------------------------------------------------------------- }
procedure SIRegisterTPARSER(Cl: TPSPascalCompiler);
begin
  with Cl.AddClassN(Cl.FindClass('TObject'), 'TParser') do
  begin
    RegisterMethod('constructor Create(Stream: TStream)');
    RegisterMethod('procedure CheckToken(T: Char)');
    RegisterMethod('procedure CheckTokenSymbol(S: string)');
    RegisterMethod('procedure Error(Ident: Integer)');
    RegisterMethod('procedure ErrorStr(Message: string)');
    RegisterMethod('procedure HexToBinary(Stream: TStream)');
    RegisterMethod('function NextToken: Char');
    RegisterMethod('function SourcePos: LongInt');
    RegisterMethod('function TokenComponentIdent: string');
    RegisterMethod('function TokenFloat: Extended');
    RegisterMethod('function TokenInt: LongInt');
    RegisterMethod('function TokenString: string');
    RegisterMethod('function TokenSymbolIs(S: string): Boolean');
    RegisterProperty('SourceLine', 'Integer', iptr);
    RegisterProperty('Token', 'Char', iptr);
  end;
end;

{ TCollectionItem ------------------------------------------------------------ }
procedure SIRegisterTCOLLECTIONITEM(Cl: TPSPascalCompiler);
begin
  if Cl.FindClass('TCollection') = nil then Cl.AddClassN(Cl.FindClass('TPersistent'), 'TCollection');
    with Cl.AddClassN(Cl.FindClass('TPersistent'),'TCollectionItem') do
    begin
      RegisterMethod('constructor Create(Collection: TCollection)');
      RegisterProperty('Collection', 'TCollection', iptrw);
      {$IFDEF DELPHI3UP}
        RegisterProperty('ID', 'Integer', iptr);
      {$ENDIF}
      RegisterProperty('Index', 'Integer', iptrw);
      {$IFDEF DELPHI3UP}
        RegisterProperty('DisplayName', 'string', iptrw);
      {$ENDIF}
    end;
end;

{ TCollection ---------------------------------------------------------------- }
procedure SIRegisterTCOLLECTION(Cl: TPSPascalCompiler);
var
  cr: TPSCompileTimeClass;
begin
  cr := Cl.FindClass('TCollection');
  if cr = nil then cr := Cl.AddClassN(Cl.FindClass('TPersistent'), 'TCollection');
  with cr do
  begin
    //  RegisterMethod('constructor Create(ItemClass: TCollectionItemClass)');
    {$IFDEF DELPHI3UP}
      RegisterMethod('function Owner: TPersistent');
    {$ENDIF}
    RegisterMethod('function Add: TCollectionItem');
    RegisterMethod('procedure BeginUpdate');
    RegisterMethod('procedure Clear');
    {$IFDEF DELPHI5UP}
      RegisterMethod('procedure Delete(Index: Integer)');
    {$ENDIF}
    RegisterMethod('procedure EndUpdate');
    {$IFDEF DELPHI3UP}
      RegisterMethod('function FindItemID(ID: Integer): TCollectionItem');
    {$ENDIF}
    {$IFDEF DELPHI3UP}
      RegisterMethod('function Insert(Index: Integer): TCollectionItem');
    {$ENDIF}
    RegisterProperty('Count', 'Integer', iptr);
    {$IFDEF DELPHI3UP}
      RegisterProperty('ItemClass', 'TCollectionItemClass', iptr);
    {$ENDIF}
    RegisterProperty('Items', 'TCollectionItem Integer', iptrw);
  end;
end;

  {$IFDEF DELPHI3UP}
    procedure SIRegisterTOWNEDCOLLECTION(Cl: TPSPascalCompiler);
    begin
      with Cl.AddClassN(Cl.FindClass('TCollection'),'TOwnedCollection') do
      begin
      //  RegisterMethod('constructor Create(AOwner: TPersistent; ItemClass: TCollectionItemClass)');
      end;
    end;
  {$ENDIF}
{$ENDIF}

{ Types And Consts ----------------------------------------------------------- }
procedure SIRegister_Classes_TypesAndConsts(Cl: TPSPascalCompiler);
begin
  Cl.AddConstantN('soFromBeginning', 'LongInt').Value.ts32 := 0;
  Cl.AddConstantN('soFromCurrent', 'LongInt').Value.ts32 := 1;
  Cl.AddConstantN('soFromEnd', 'LongInt').Value.ts32 := 2;
  Cl.AddConstantN('toEOF', 'Char').SetString(#0);
  Cl.AddConstantN('toSymbol', 'Char').SetString(#1);
  Cl.AddConstantN('toString', 'Char').SetString(#2);
  Cl.AddConstantN('ToInteger', 'Char').SetString(#3);
  Cl.AddConstantN('toFloat', 'Char').SetString(#4);
  Cl.AddConstantN('fmCreate', 'LongInt').Value.ts32 := $FFFF;
  Cl.AddConstantN('fmOpenRead', 'LongInt').Value.ts32 := 0;
  Cl.AddConstantN('fmOpenWrite', 'LongInt').Value.ts32 := 1;
  Cl.AddConstantN('fmOpenReadWrite', 'LongInt').Value.ts32 := 2;
  Cl.AddConstantN('fmShareCompat', 'LongInt').Value.ts32 := 0;
  Cl.AddConstantN('fmShareExclusive', 'LongInt').Value.ts32 := $10;
  Cl.AddConstantN('fmShareDenyWrite', 'LongInt').Value.ts32 := $20;
  Cl.AddConstantN('fmShareDenyRead', 'LongInt').Value.ts32 := $30;
  Cl.AddConstantN('fmShareDenyNone', 'LongInt').Value.ts32 := $40;
  Cl.AddConstantN('SecsPerDay', 'LongInt').Value.ts32 := 86400;
  Cl.AddConstantN('MSecPerDay', 'LongInt').Value.ts32 := 86400000;
  Cl.AddConstantN('DateDelta', 'LongInt').Value.ts32 := 693594;
  Cl.AddTypeS('TAlignment', '(taLeftJustify, taRightJustify, taCenter)');
  Cl.AddTypeS('THelpEvent', 'function (Command: Word; Data: LongInt; var CallHelp: Boolean): Boolean');
  Cl.AddTypeS('TGetStrProc', 'procedure(const S: string)');
  Cl.AddTypeS('TDuplicates', '(dupIgnore, dupAccept, dupError)');
  Cl.AddTypeS('TOperation', '(opInsert, opRemove)');
  Cl.AddTypeS('THandle', 'LongInt');

  Cl.AddTypeS('TNotifyEvent', 'procedure (Sender: TObject)');
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_Classes(Cl: TPSPascalCompiler; Streams: Boolean);
begin
  SIRegister_Classes_TypesAndConsts(Cl);
  if Streams then
    SIRegisterTSTREAM(Cl);
  SIRegisterTStrings(Cl, Streams);
  SIRegisterTStringList(Cl);
  {$IFNDEF PS_MINIVCL}
    SIRegisterTBITS(Cl);
  {$ENDIF}
  if Streams then
    begin
      SIRegisterTHANDLESTREAM(Cl);
      SIRegisterTFILESTREAM(Cl);
      SIRegisterTSTRINGSTREAM(Cl);
      {$IFNDEF PS_MINIVCL}
        SIRegisterTCUSTOMMEMORYSTREAM(Cl);
        SIRegisterTMEMORYSTREAM(Cl);
        SIRegisterTRESOURCESTREAM(Cl);
      {$ENDIF}
    end;
  {$IFNDEF PS_MINIVCL}
    SIRegisterTPARSER(Cl);
    SIRegisterTCOLLECTIONITEM(Cl);
    SIRegisterTCOLLECTION(Cl);
    {$IFDEF DELPHI3UP}
      SIRegisterTOWNEDCOLLECTION(Cl);
    {$ENDIF}
  {$ENDIF}
end;

// PS_MINIVCL changes by Martijn Laan (mlaan at wintax _dot_ nl)
end.
