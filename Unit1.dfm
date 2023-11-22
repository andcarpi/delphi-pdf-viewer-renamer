object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 733
  ClientWidth = 1127
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 185
    Top = 0
    Height = 733
    ExplicitLeft = 190
    ExplicitTop = -8
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 733
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitLeft = 368
    ExplicitTop = 352
    ExplicitHeight = 41
    object Splitter2: TSplitter
      Left = 1
      Top = 329
      Width = 183
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitWidth = 403
    end
    object DriveComboBox1: TDriveComboBox
      Left = 1
      Top = 1
      Width = 183
      Height = 21
      Align = alTop
      TabOrder = 0
      OnChange = DriveComboBox1Change
      ExplicitLeft = 16
      ExplicitTop = 24
      ExplicitWidth = 145
    end
    object DirectoryListBox1: TDirectoryListBox
      Left = 1
      Top = 22
      Width = 183
      Height = 307
      Align = alTop
      TabOrder = 1
      OnChange = DirectoryListBox1Change
    end
    object FileListBox1: TFileListBox
      Left = 1
      Top = 332
      Width = 183
      Height = 400
      Align = alClient
      ItemHeight = 15
      Mask = '*.pdf'
      TabOrder = 2
      OnChange = FileListBox1Change
    end
  end
  object EdgeBrowser1: TEdgeBrowser
    Left = 373
    Top = 0
    Width = 754
    Height = 733
    Align = alClient
    TabOrder = 1
    AllowSingleSignOnUsingOSPrimaryAccount = False
    TargetCompatibleBrowserVersion = '117.0.2045.28'
    UserDataFolder = '%LOCALAPPDATA%\bds.exe.WebView2'
    ExplicitLeft = 96
    ExplicitTop = 24
    ExplicitWidth = 100
    ExplicitHeight = 40
  end
  object Panel2: TPanel
    Left = 188
    Top = 0
    Width = 185
    Height = 733
    Align = alLeft
    Caption = 'Panel2'
    TabOrder = 2
    ExplicitLeft = 379
    object ButtonGroup1: TButtonGroup
      Left = 1
      Top = 1
      Width = 183
      Height = 681
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ButtonOptions = [gboFullSize, gboShowCaptions]
      Items = <>
      TabOrder = 0
      OnButtonClicked = ButtonGroup1ButtonClicked
      ExplicitLeft = 2
      ExplicitTop = 2
      ExplicitHeight = 731
    end
    object RemoverNome: TButton
      Left = 1
      Top = 707
      Width = 183
      Height = 25
      Align = alBottom
      Caption = 'Remover Nome'
      TabOrder = 1
      OnClick = RemoverNomeClick
      ExplicitLeft = 110
      ExplicitTop = 376
      ExplicitWidth = 75
    end
    object AdicionarNome: TButton
      Left = 1
      Top = 682
      Width = 183
      Height = 25
      Align = alBottom
      Caption = 'Adicionar Nome'
      TabOrder = 2
      OnClick = AdicionarNomeClick
      ExplicitLeft = 110
      ExplicitTop = 376
      ExplicitWidth = 75
    end
  end
end
