object frmRotricsJog: TfrmRotricsJog
  Left = 0
  Top = 0
  Caption = 'Rotrics Jog Control'
  ClientHeight = 580
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlJog: TPanel
    Left = 0
    Top = 236
    Width = 217
    Height = 344
    Align = alLeft
    Enabled = False
    TabOrder = 0
    object spdMove10: TSpeedButton
      Left = 8
      Top = 48
      Width = 40
      Height = 22
      GroupIndex = 1
      Down = True
      Caption = '10'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = spdMove10Click
    end
    object SpeedButton1: TSpeedButton
      Left = 48
      Top = 86
      Width = 30
      Height = 25
      Caption = '+Y'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton10: TSpeedButton
      Left = 138
      Top = 136
      Width = 30
      Height = 25
      Caption = '-Z'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton10Click
    end
    object SpeedButton2: TSpeedButton
      Left = 17
      Top = 116
      Width = 30
      Height = 25
      Caption = '-X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 79
      Top = 116
      Width = 30
      Height = 25
      Caption = '+X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 48
      Top = 146
      Width = 30
      Height = 25
      Caption = '-Y'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton4Click
    end
    object SpeedButton5: TSpeedButton
      Left = 138
      Top = 92
      Width = 30
      Height = 25
      Caption = '+Z'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton5Click
    end
    object SpeedButton6: TSpeedButton
      Left = 48
      Top = 48
      Width = 40
      Height = 22
      GroupIndex = 1
      Caption = '5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = spdMove10Click
    end
    object SpeedButton7: TSpeedButton
      Left = 88
      Top = 48
      Width = 40
      Height = 22
      GroupIndex = 1
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = spdMove10Click
    end
    object SpeedButton8: TSpeedButton
      Left = 128
      Top = 48
      Width = 40
      Height = 22
      GroupIndex = 1
      Caption = '0.5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = spdMove10Click
    end
    object SpeedButton9: TSpeedButton
      Left = 168
      Top = 48
      Width = 40
      Height = 22
      GroupIndex = 1
      Caption = '0.1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = spdMove10Click
    end
    object Label1: TLabel
      Left = 11
      Top = 8
      Width = 156
      Height = 23
      Caption = 'Rotrics Jog Control'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnGotoWorkOrigin: TButton
      Left = 8
      Top = 209
      Width = 194
      Height = 25
      Caption = 'Go to Work Origin'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnGotoWorkOriginClick
    end
    object btnGoToX0Y0Z10: TButton
      Left = 8
      Top = 240
      Width = 194
      Height = 25
      Caption = 'Go to X0 Y0 Z10'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnGoToX0Y0Z10Click
    end
    object btnSetWorkOrigin: TButton
      Left = 8
      Top = 271
      Width = 194
      Height = 25
      Caption = 'Set Work Origin'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnSetWorkOriginClick
    end
    object btnRequestCurrentPosition: TButton
      Left = 8
      Top = 302
      Width = 194
      Height = 25
      Caption = 'Requst Current Position'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnRequestCurrentPositionClick
    end
  end
  object pnlCalc: TPanel
    Left = 217
    Top = 236
    Width = 436
    Height = 344
    Align = alClient
    Enabled = False
    TabOrder = 1
    object Label2: TLabel
      Left = 19
      Top = 7
      Width = 82
      Height = 23
      Caption = 'Calculator'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edFomula: TEdit
      Left = 19
      Top = 49
      Width = 326
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object btnCalc: TButton
      Left = 351
      Top = 48
      Width = 75
      Height = 32
      Caption = 'CALC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCalcClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 653
    Height = 236
    Align = alTop
    Caption = 'Panel3'
    TabOrder = 2
    object pnlCommand: TPanel
      Left = 1
      Top = 194
      Width = 651
      Height = 41
      Align = alBottom
      Enabled = False
      TabOrder = 0
      object edCommand: TEdit
        Left = 7
        Top = 6
        Width = 554
        Height = 29
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = edCommandKeyPress
      end
      object btnSend: TButton
        Left = 567
        Top = 6
        Width = 75
        Height = 30
        Caption = 'Send'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnSendClick
      end
    end
    object Panel5: TPanel
      Left = 467
      Top = 1
      Width = 185
      Height = 193
      Align = alRight
      TabOrder = 1
      object btnComPortSettings: TButton
        Left = 6
        Top = 8
        Width = 171
        Height = 25
        Caption = 'Com Port Settings'
        TabOrder = 0
        OnClick = btnComPortSettingsClick
      end
      object btnConnect: TButton
        Left = 6
        Top = 39
        Width = 171
        Height = 25
        Caption = 'Connect to Rotrics'
        Enabled = False
        TabOrder = 1
        OnClick = btnConnectClick
      end
    end
    object memoCom: TMemo
      Left = 1
      Top = 1
      Width = 466
      Height = 193
      Align = alClient
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 2
    end
  end
  object ComPort: TComPort
    BaudRate = br115200
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    DiscardNull = True
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrEnable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    OnAfterOpen = ComPortAfterOpen
    OnAfterClose = ComPortAfterClose
    OnRxChar = ComPortRxChar
    Left = 416
    Top = 16
  end
end
