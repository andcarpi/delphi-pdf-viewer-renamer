unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Winapi.WebView2, Winapi.ActiveX,
  Vcl.ButtonGroup, Vcl.FileCtrl, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Edge,
  System.Actions, Vcl.ActnList;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    EdgeBrowser1: TEdgeBrowser;
    Panel2: TPanel;
    Splitter1: TSplitter;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    Splitter2: TSplitter;
    FileListBox1: TFileListBox;
    ButtonGroup1: TButtonGroup;
    RemoverNome: TButton;
    AdicionarNome: TButton;
    procedure DriveComboBox1Change(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure AdicionarBotaoNoBG(const Caption: String);
    procedure AdicionarNomeClick(Sender: TObject);
    procedure RemoverNomeClick(Sender: TObject);
    procedure ButtonGroup1ButtonClicked(Sender: TObject; Index: Integer);
    procedure CarregarButtonGroup;
    procedure SalvarButtonGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AdicionarBotaoNoBG(const Caption: String);
begin
  if Caption.Trim.Length > 0 then begin
    ButtonGroup1.Items.Add();
    ButtonGroup1.Items[ButtonGroup1.Items.Count-1].Caption := Caption;
  end;
end;

procedure TForm1.AdicionarNomeClick(Sender: TObject);
begin
  AdicionarBotaoNoBG(InputBox('Adicionar Nome', 'Digite o Nome que será adicionado', ''));
end;

procedure TForm1.ButtonGroup1ButtonClicked(Sender: TObject; Index: Integer);
begin
  if FileListBox1.ItemIndex < 0 then
    Abort;
    
  if RenameFile(FileListBox1.FileName, ExtractFilePath(FileListBox1.FileName) + ButtonGroup1.Items[Index].Caption + '.pdf') then begin
    ShowMessage('OK!');
    FileListBox1.Update;
  end else
    ShowMessage('Ops!');

end;

procedure TForm1.CarregarButtonGroup;
var
  Nomes: TStringList;
  i: Integer;
begin
  if FileExists(ExtractFilePath(ParamStr(0)) + 'nomes.data') then begin
    Nomes := TStringList.Create;
    Nomes.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'nomes.data');
    for i := 0 to Nomes.Count-1 do begin
      AdicionarBotaoNoBG(Nomes.Strings[i]);
    end;
    Nomes.Free;      
  end;         
end;

procedure TForm1.DirectoryListBox1Change(Sender: TObject);
begin
  FileListBox1.Directory := DirectoryListBox1.Directory;
end;

procedure TForm1.DriveComboBox1Change(Sender: TObject);
begin
  DirectoryListBox1.Drive := DriveComboBox1.Drive;
end;

procedure TForm1.FileListBox1Change(Sender: TObject);
begin
  EdgeBrowser1.Navigate('file://' + FileListBox1.FileName);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvarButtonGroup;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CarregarButtonGroup;
end;

procedure TForm1.RemoverNomeClick(Sender: TObject);
var
  botao: string;
  cont: integer;
begin
  botao := InputBox('Remover Nome', 'Digite o Nome que será removido', '');
  for cont := 0 to ButtonGroup1.Items.Count-1 do begin
    if ButtonGroup1.Items[cont].Caption = botao then begin
      ButtonGroup1.Items.Delete(cont);
      Break;
    end;
  end;
              
end;

procedure TForm1.SalvarButtonGroup;
var
  Nomes: TStringList;
  i: Integer;
begin
  if ButtonGroup1.Items.Count > 0 then begin
    Nomes := TStringList.Create;
    for i := 0 to ButtonGroup1.Items.Count-1 do
      Nomes.Add(ButtonGroup1.Items[i].Caption);
    Nomes.SaveToFile(ExtractFilePath(ParamStr(0)) + 'nomes.data');
    Nomes.Free;
  end;
end;

end.
