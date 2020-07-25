unit uRotricsJog;

// Rotrics jog controller and calculator demo for Delphi
// Copyright (c)2020 Tateo Nagai. All rights reserved.
// License: MIT License
//
// GitHub Repository
// https://github.com/tnagai2019/rotrics_calc_for_delphi
//
// NOTE:
// This demo program requires Embarcadero Delphi 10.3 (Community Edition is OK)
// To build and run this app, you need to install the following component:
//
// ComPort Library
// https://github.com/CWBudde/ComPort-Library
// By Christian Budde (CWBudde)

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CPort, CPortCtl, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, Generics.Collections;

type
  TfrmRotricsJog = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    spdMove10: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton10: TSpeedButton;
    btnGoToX0Y0Z10: TButton;
    btnSetWorkOrigin: TButton;
    btnGotoWorkOrigin: TButton;
    edFomula: TEdit;
    pnlJog: TPanel;
    Label1: TLabel;
    pnlCalc: TPanel;
    Label2: TLabel;
    btnCalc: TButton;
    Panel3: TPanel;
    pnlCommand: TPanel;
    Panel5: TPanel;
    memoCom: TMemo;
    btnComPortSettings: TButton;
    btnConnect: TButton;
    ComPort: TComPort;
    edCommand: TEdit;
    btnSend: TButton;
    btnRequestCurrentPosition: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure spdMove10Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure btnGoToX0Y0Z10Click(Sender: TObject);
    procedure btnSetWorkOriginClick(Sender: TObject);
    procedure btnGotoWorkOriginClick(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure btnComPortSettingsClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure ComPortAfterClose(Sender: TObject);
    procedure ComPortAfterOpen(Sender: TObject);
    procedure ComPortRxChar(Sender: TObject; Count: Integer);
    procedure edCommandKeyPress(Sender: TObject; var Key: Char);
    procedure btnRequestCurrentPositionClick(Sender: TObject);
  private
    FComPortReady: boolean;
    FGCodeQue: TStringList;
    FIsAbsoluteMode: boolean;
    FIsRelativeMode: boolean;
    FMoveUnit: string;
    FLocations: TDictionary<string, string>;
    FPreviousComStr: string;
    procedure SetComPortReady(const Value: boolean);
    { Private declarations }
    procedure processGcode;
    procedure addGCode(gcode: string);
    procedure switchToAbsoluteMode;
    procedure switchToRelativeMode;
  public
    { Public declarations }
    property ComPortReady: boolean read FComPortReady write SetComPortReady;
    procedure initCalc;
  end;

var
  frmRotricsJog: TfrmRotricsJog;

implementation

{$R *.dfm}

{ TForm2 }

procedure TfrmRotricsJog.addGCode(gcode: string);
begin
  FGCodeQue.Add(gcode);
  if FComPortReady then
  begin
    processGcode;
  end;
end;

procedure TfrmRotricsJog.btnCalcClick(Sender: TObject);
var
  idx: Integer;
  chr: string;
  fomulaStr: string;
  gcode: string;
begin
  fomulaStr := 'C' + edFomula.Text;
  for idx := 1 to length(fomulaStr) do
  begin
    chr := fomulaStr[idx];
    if FLocations.ContainsKey(chr) then
    begin
      //Move the pen 7mm above the corresponding button
      gcode := FLocations[chr] + ' Z7';
      addGCode(gcode);

      //Drop the pen to the 0mm (Z=0mm)
      gcode := FLocations[chr] + ' Z0';
      addGCode(gcode);

      //Lift the pen 7mm up
      gcode := FLocations[chr] + ' Z7';
      addGCode(gcode);
    end;
  end;
end;

procedure TfrmRotricsJog.btnGotoWorkOriginClick(Sender: TObject);
begin
  switchToAbsoluteMode;
  addGCode('G0 X0 Y0 Z0');
end;

procedure TfrmRotricsJog.btnGoToX0Y0Z10Click(Sender: TObject);
begin
  switchToAbsoluteMode;
  addGCode('G0 X0 Y0 Z10');
end;

procedure TfrmRotricsJog.btnRequestCurrentPositionClick(Sender: TObject);
begin
  addGCode('M114');
end;

procedure TfrmRotricsJog.btnSendClick(Sender: TObject);
var
  Str: string;
begin
  if length(trim(edCommand.Text)) > 0 then
  begin
    Str := trim(edCommand.Text) + #13#10;
    ComPort.WriteStr(Str);
    edCommand.Text := '';
  end;
end;

procedure TfrmRotricsJog.btnSetWorkOriginClick(Sender: TObject);
begin
  //Set the current position as the work origin
  addGCode('G92 X0 Y0 Z0');
end;

procedure TfrmRotricsJog.btnComPortSettingsClick(Sender: TObject);
begin
  ComPort.BaudRate := TBaudRate.br115200;
  //Change this default com port number to your PC's comport number for Rotrics
  ComPort.Port := 'COM5';
  ComPort.ShowSetupDialog;
  btnConnect.Enabled := True;
end;

procedure TfrmRotricsJog.btnConnectClick(Sender: TObject);
begin
  if ComPort.Connected then
    ComPort.Close
  else
    ComPort.Open;
  FPreviousComStr := '';
end;

procedure TfrmRotricsJog.ComPortAfterClose(Sender: TObject);
begin
  btnConnect.Caption := 'Connect to Rotrics';
  FComPortReady := False;
  pnlJog.Enabled := False;
  pnlCalc.Enabled := False;
  pnlCommand.Enabled := False;
end;

procedure TfrmRotricsJog.ComPortAfterOpen(Sender: TObject);
begin
  btnConnect.Caption := 'Disconnect';
  FComPortReady := True;
  pnlJog.Enabled := True;
  pnlCalc.Enabled := True;
  pnlCommand.Enabled := True;
end;

procedure TfrmRotricsJog.ComPortRxChar(Sender: TObject; Count: Integer);
var
  FullStr: String;
  line: string;
  idx: Integer;
  sl: TStringList;
  isEndingWithLF: boolean;
begin
  ComPort.ReadStr(FullStr, Count);

  //If the previous line did not end with <LF> then append the new line
  //to the previous line
  FullStr := FPreviousComStr + FullStr;
  FPreviousComStr := '';
  isEndingWithLF := FullStr[length(FullStr)] = #10;
  sl := TStringList.Create;
  try
    sl.Delimiter := #10;
    sl.StrictDelimiter := True;

    //Split received strings by <LF> ($0A) into TStringList
    sl.DelimitedText := FullStr;

    //Process each line if received strings contains multiple lines
    for idx := 0 to sl.Count - 1 do
    begin
      line := sl[idx];
      if length(line) > 0 then
      begin
        memoCom.Lines.Add(line + '<LF>');
        if line = 'ok' then
        begin
          ComPortReady := True;
        end;
      end;
    end;

    //If the last line did not end with <LF> then keep it until the next response
    if not isEndingWithLF then
    begin
      FPreviousComStr := sl[sl.count - 1];
    end;
  finally
    sl.Free;
  end;
end;

procedure TfrmRotricsJog.edCommandKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    btnSendClick(nil);
    key := #0;
  end;
end;

procedure TfrmRotricsJog.FormCreate(Sender: TObject);
begin
  FComPortReady := False;
  FGCodeQue := TStringList.Create;
  FLocations := TDictionary<string, string>.create;
  FIsAbsoluteMode := False;
  FIsRelativeMode := False;
  FMoveUnit := '10';
  initCalc;
end;

procedure TfrmRotricsJog.FormDestroy(Sender: TObject);
begin
  if ComPort.Connected then
    ComPort.Close;
  FGCodeQue.Free;
  FLocations.Free;
end;

procedure TfrmRotricsJog.initCalc;
begin
  //Create a dictionay of button and location in G-Code format
  FLocations.Add('C', 'G0 X-30 Y15');
  FLocations.Add('0', 'G0 X-15 Y-30');
  FLocations.Add('1', 'G0 X-15 Y-15');
  FLocations.Add('2', 'G0 X0 Y-15');
  FLocations.Add('3', 'G0 X15 Y-15');
  FLocations.Add('4', 'G0 X-15 Y0');
  FLocations.Add('5', 'G0 X0 Y0');
  FLocations.Add('6', 'G0 X15 Y0');
  FLocations.Add('7', 'G0 X-15 Y15');
  FLocations.Add('8', 'G0 X0 Y15');
  FLocations.Add('9', 'G0 X15 Y15');
  FLocations.Add('.', 'G0 X0 Y-30');
  FLocations.Add('+', 'G0 X30 Y-20');
  FLocations.Add('-', 'G0 X30 Y0');
  FLocations.Add('*', 'G0 X30 Y15');
  FLocations.Add('/', 'G0 X45 Y15');
  FLocations.Add('=', 'G0 X15 Y-30');
end;

procedure TfrmRotricsJog.processGcode;
begin
  if FGCodeQue.Count > 0 then
  begin
    FComPortReady := False;
    //Send the top G-Code command in the que
    ComPort.WriteStr(FGCodeQue[0] + #13#10);

    //Remove the sent G-Code command from the que
    FGCodeQue.Delete(0);

    //This sleep 0.5 second seems necessary to avoid com port buffer problem?
    //There may be a better solution than this.
    Sleep(500);
  end;
end;

procedure TfrmRotricsJog.SetComPortReady(const Value: boolean);
begin
  FComPortReady := Value;
  if (Value = True) and (FGCodeQue.Count > 0) then
  begin
    processGcode;
  end;
end;

procedure TfrmRotricsJog.SpeedButton10Click(Sender: TObject);
begin
  switchToRelativeMode;
  addGcode('G0 Z-' + FMoveUnit);

end;

procedure TfrmRotricsJog.SpeedButton1Click(Sender: TObject);
begin
  switchToRelativeMode;
  addGcode('G0 Y' + FMoveUnit);
end;

procedure TfrmRotricsJog.SpeedButton2Click(Sender: TObject);
begin
  switchToRelativeMode;
  addGcode('G0 X-' + FMoveUnit);

end;

procedure TfrmRotricsJog.SpeedButton3Click(Sender: TObject);
begin
  switchToRelativeMode;
  addGcode('G0 X' + FMoveUnit);

end;

procedure TfrmRotricsJog.SpeedButton4Click(Sender: TObject);
begin
  switchToRelativeMode;
  addGcode('G0 Y-' + FMoveUnit);
end;

procedure TfrmRotricsJog.SpeedButton5Click(Sender: TObject);
begin
  switchToRelativeMode;
  addGcode('G0 Z' + FMoveUnit);
end;

procedure TfrmRotricsJog.spdMove10Click(Sender: TObject);
begin
  FMoveUnit := (Sender as TSpeedButton).Caption;
end;

procedure TfrmRotricsJog.switchToAbsoluteMode;
begin
  if not FIsAbsoluteMode then
  begin
    FIsAbsoluteMode := True;
    FIsRelativeMode := False;
    addGCode('G90');
  end;
end;

procedure TfrmRotricsJog.switchToRelativeMode;
begin
  if not FIsRelativeMode then
  begin
    FIsAbsoluteMode := False;
    FIsRelativeMode := True;
    addGCode('G91');
  end;

end;

end.
