program rotrics_calc;

uses
  Vcl.Forms,
  uRotricsJog in 'uRotricsJog.pas' {frmRotricsJog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRotricsJog, frmRotricsJog);
  Application.Run;
end.
