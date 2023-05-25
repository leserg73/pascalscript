{ Compile time Date Time library }
unit uPSC_dateutils;

interface

uses
  SysUtils, uPSCompiler, uPSUtils;

procedure RegisterDateTimeLibrary_C(Cl: TPSPascalCompiler);

implementation

procedure RegisterDatetimeLibrary_C(Cl: TPSPascalCompiler);
begin
  //Cl.AddType('TDateTime', btDouble).ExportName := True;
  Cl.AddDelphiFunction('function EncodeDate(Year, Month, Day: Word): TDateTime;');
  Cl.AddDelphiFunction('function EncodeTime(Hour, Min, Sec, MSec: Word): TDateTime;');
  Cl.AddDelphiFunction('function TryEncodeDate(Year, Month, Day: Word; var Date: TDateTime): Boolean;');
  Cl.AddDelphiFunction('function TryEncodeTime(Hour, Min, Sec, MSec: Word; var Time: TDateTime): Boolean;');
  Cl.AddDelphiFunction('procedure DecodeDate(const DateTime: TDateTime; var Year, Month, Day: Word);');
  Cl.AddDelphiFunction('procedure DecodeTime(const DateTime: TDateTime; var Hour, Min, Sec, MSec: Word);');
  Cl.AddDelphiFunction('function DayOfWeek(const DateTime: TDateTime): Word;');
  Cl.AddDelphiFunction('function Date: TDateTime;');
  Cl.AddDelphiFunction('function Time: TDateTime;');
  Cl.AddDelphiFunction('function Now: TDateTime;');
  Cl.AddDelphiFunction('function DateTimeToUnix(D: TDateTime): Int64;');
  Cl.AddDelphiFunction('function UnixToDateTime(U: Int64): TDateTime;');

  Cl.AddDelphiFunction('function DateToStr(D: TDateTime): String;');
  Cl.AddDelphiFunction('function StrToDate(const S: String): TDateTime;');
  Cl.AddDelphiFunction('function FormatDateTime(const fmt: String; D: TDateTime): String;');

  Cl.AddDelphiFunction('function TimeToStr(Time: TDateTime): String;');
  Cl.AddDelphiFunction('function StrToDateTime(const S: String): TDateTime;');
  Cl.AddDelphiFunction('function StrToTime(const S: String): TDateTime;');
  Cl.AddDelphiFunction('function DateTimeToStr(DateTime: TDateTime): String;');
  Cl.AddDelphiFunction('procedure DateTimeToString(var Result: String; const Format: String; DateTime: TDateTime);');
end;

end.
