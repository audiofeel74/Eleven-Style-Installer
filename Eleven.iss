
; - Eleven Style
; - FMXInno.dll 28-Sep-2024
; - Audiofeel
; - Last Edit: 07-Oct-2024

#if VER >= 0x06030000  /* InnoSetup 6.3.0 or newer */
  #define Public ReadMInI(Str sFunc, Str sParams) \
    Local[0] = sFunc + " " + sParams + " """ + AddBackSlash(SourcePath) + "Eleven.ini" + """" , ExecAndGetFirstLine(AddBackSlash(SourcePath) + "Plugin\MInI\MInI.exe", Local[0], "")

#else  /* Old InnoSetup Versions */
  #define Public ReadMInI(Str sFunc, Str sParams) \
    Local[0] = AddBackSlash(GetEnv("TEMP")) + "MInI_.istmp_", DeleteFile(Local[0]), Local[1] = sFunc + " " + sParams + " " + "/o=""" + Local[0] + """" +" """ + AddBackSlash(SourcePath) + "Eleven.ini" + """" , \
    Exec(AddBackSlash(SourcePath) + "Plugin\MInI\MInI.exe", Local[1], "", 1, SW_HIDE), Local[2] = FileOpen(Local[0]), Local[3] = FileRead(Local[2]), FileClose(Local[2]), DeleteFile(Local[0]), Local[3]
#endif

#define Public i 0

// AppExes:
#define Public MAX_ICONS Int(ReadMInI('GetSubSectionsCount', '/MainSec=Execs /RootOnly=true'))
// Compos:
#define Public MAX_COMPO Int(ReadMInI('GetSubSectionsCount', '/MainSec=Compos /RootOnly=true'))
// Redists:
#define Public MAX_REDIST Int(ReadMInI('GetSubSectionsCount', '/MainSec=Redists /RootOnly=true'))
// Disks:
#define Public MAX_DISKS Int(ReadMInI('GetSubSectionsCount', '/MainSec=Datas /RootOnly=true'))

#define Public DiskPassword (ReadMInI('ReadString', '/Sec=Game /Key=Password'))

#define Public NeedSize (ReadMInI('ReadString', '/Sec=Game /Key=Size'))

[Setup]
AllowNoIcons=True
AppId={{04B790A0-E9E9-4A5A-8827-5989527544CA}
AppName={#ReadMInI('ReadString', '/Sec=Game /Key=Name')}
AppPublisher={#ReadMInI('ReadString', '/Sec=Game /Key=Publisher')}
AppVersion={#ReadMInI('ReadString', '/Sec=Game /Key=Version')}
Compression=none
DefaultDirName={autopf}\{#SetupSetting('AppName')}
DefaultGroupName={#SetupSetting('AppName')}
DirExistsWarning=False
DisableProgramGroupPage=False
DisableWelcomePage=False
InternalCompressLevel=none
OutputBaseFilename=mysetup
SolidCompression=False
UninstallDisplayIcon={uninstallexe}
UninstallDisplayName={#SetupSetting('AppName')}
UninstallFilesDir={app}\Uninstall
UsePreviousAppDir=False
UsePreviousGroup=False
UsePreviousSetupType=False
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[CustomMessages]
english.TitleBarLbl=Setup - {#SetupSetting('AppName')}
english.ButtonLbl1=Home
english.ButtonLbl2=Information
english.ButtonLbl3=Select Directory
english.ButtonLbl4=Components
english.ButtonLbl5=System Requirements
english.ButtonLbl6=Installing
english.ButtonLbl7=Finished
english.PageLayerLbl={#SetupSetting('AppName')}

english.Page1Lbll=Home
english.Page1Lbl2=WELCOME
english.Page1Lbl3=NAVIGATION
english.Page1Lbl4=GUIDE FOR INSTALLATION
english.Page1Lbl5=Welcome to {#SetupSetting('AppName')} setup wizard%nThis will install {#SetupSetting('AppName')} on your computer
english.Page1Lbl6=Us the sidebar on the left to browse through the setup
english.Page1Lbl7=Follow these guides to help installation run smoothly
english.Page1Memo=It is highly recommended to%n   • Disable the Antivirus Before Installation%n   • Close all Other Programs and Apps%n   • Restart Before Installation may get faster Installation

english.Page2Lbl1=Select Directory
english.Page2Lbl2=SELECT INSTALLATION DIRECTORY
english.Page2Lbl3=TIPS
english.Page2Lbl4=SELECTED DRIVE
english.Page2Lbl5=OTHER
english.Page2Lbl6=Make sure you have enough space for installation
english.Page2Lbl7A=is needed from selected directory
english.Page2Lbl7B=is available from the selected drive
english.Page2Lbl8=Used
#if MAX_ICONS > 0
english.IconLbl1=Desktop Shortcuts
english.IconLbl2=Startmenu shortcuts
english.IconLbl3=On
english.IconLbl4=Off
#endif

english.Page3Lbl1=Components
english.Page3Lbl2=SELECT INSTALLATION COMPONENTS
english.Page3Lbl3=TIPS
english.Page3Lbl4=Please select the components you wish to install and uncheck the ones that are not required
english.Page3Lbl5=Make sure you have enough space for installation
#if MAX_REDIST > 0
english.SectionRedist=Redistributable packages
#endif
#if MAX_COMPO > 0
english.SectionCompo=Selectable components
#endif
english.Page3Lbl6=Current selection requires at least %1 of disk space

english.Page4Lbl1=System requirements
english.Page4Lbl2=GUID
english.Page4Lbl3=Us the sidebar on the left to browse through the setup
english.Page4Lbl4=CPU
english.Page4Lbl5=RAM
english.Page4Lbl6=GPU
english.Page4Lbl7=PROCESSOR
english.Page4Lbl8=MEMORY
english.Page4Lbl9=GRAPHIC CARD
english.Page4Lbl13=* All the data provided is approximate

english.Page5Lbl1=Installation
english.Page5Lbl2=PROGRESS
english.Page5Lbl3=TIPS
english.Page5Lbl4=INSTALLATION TIMES
english.Page5Lbl5=INSTALLATION DETAILS
english.Page5Lbl7=Please be patient while setup wizard installs application
english.Page5Lbl8A=Elapsed time:
english.Page5Lbl8B=Remaining time:
english.Page5Lbl9=Extract:

english.Page6Lbl1=Finishing installation
english.Page6Lbl2=COMPLETING SETUP
english.Page6Lbl3=NAVIGATION
english.Page6Lbl4=GUIDE FOR APPLICATION
english.Page6Lbl5={#SetupSetting('AppName')} has been successfully instaled
english.Page6Lbl5ERR={#SetupSetting('AppName')} installation has failed
english.Page6Lbl6=Us the sidebar on the left to browse through the setup
english.Page6Lbl7=Follow these guides to help installation run smoothly
english.Page6Lbl7ERR=Follow these guides to help reinstall {#SetupSetting('AppName')}
english.Page6Memo=It is highly recommended to%n   • You can now launch the application from your desktop%n   • You can find another launcher under your startmenu%n   • Use control panel's programs and features to uninstall the app
english.Page6MemoERR=It is highly recommended to%n   • Please make sure antivirus is turned off throughout installation%n   • Make sure you have enough disk space for installatiion%n   • If this is an online installation, please make sure you have internet

english.DirBrowseForm=BROWSE FOR FOLDER
english.DirBrowseFormOkBtn=Ok
english.DirBrowseFormCancelBtn=Cancel

english.MessageFormOkBtn=Ok
english.Error=GUIDE FOR INSTALLATION
english.DiskError=Free up space or select another disk, after which you can continue
english.ISArcExErrorA=No archive was found for unpacking
english.ISArcExErrorB=An error has occurred while extracting the data

english.ExitFormLbl1=EXIT FROM INSTALLER?
english.ExitFormLbl2=If you exit now, the installation will not complete
english.ExitFormYesBtn=Exit
english.ExitFormNoBtn=Cancel

[Files]
Source: "Modules\FMXInno.dll"; Flags: dontcopy
Source: "Files\*"; Flags: dontcopy

Source: "Plugin\FluentApi\FluentApi.dll"; DestDir: {app}\Uninstall

Source: "Unpack\English.ini"; Flags: dontcopy
Source: "Unpack\arc.ini"; Flags: dontcopy
Source: "Unpack\unarc.dll"; Flags: dontcopy
Source: "Unpack\CLS.ini"; Flags: dontcopy
Source: "Unpack\Facompress.dll"; Flags: dontcopy

#include "Script_ToolsList.iss"

#if MAX_ICONS > 0
[Icons]
#sub InitAppIcons
  #define IcnSubSec ReadMInI('GetSubSection', '/MainSec=Execs /Idx=' + Str(i) + ' /RootOnly=true')
  #if IcnSubSec != ""
    #define IcnName ReadMInI('ReadSubString', '/MainSec=Execs /SubSec=' + IcnSubSec + ' /Key=Name')
    #define IcnExe ReadMInI('ReadSubString', '/MainSec=Execs /SubSec=' + IcnSubSec + ' /Key=Exe')
    #define IcnIcon ReadMInI('ReadSubString', '/MainSec=Execs /SubSec=' + IcnSubSec + ' /Key=Icon')
    #define IcnIconIdx ReadMInI('ReadSubString', '/MainSec=Execs /SubSec=' + IcnSubSec + ' /Key=IconIdx')
    #define IcnArgs ReadMInI('ReadSubString', '/MainSec=Execs /SubSec=' + IcnSubSec + ' /Key=Args')
    #define IcnWorkingDir ReadMInI('ReadSubString', '/MainSec=Execs /SubSec=' + IcnSubSec + ' /Key=WorkingDir')
Name: "{autodesktop}\{#IcnName}"; Filename: "{#IcnWorkingDir}\{#IcnExe}"; IconFilename: "{#IcnWorkingDir}\{#IcnIcon}"; IconIndex: {#IcnIconIdx}; Parameters: {#IcnArgs}; WorkingDir: "{#IcnWorkingDir}"; Check: CreateDesktopIcons;
Name: "{group}\{#IcnName}"; Filename: "{#IcnWorkingDir}\{#IcnExe}"; IconFilename: "{#IcnWorkingDir}\{#IcnIcon}"; IconIndex: {#IcnIconIdx}; Parameters: {#IcnArgs}; WorkingDir: "{#IcnWorkingDir}"; Check: CreateGroupIcons;
  #endif
#endsub
#for {i = 0; i < MAX_ICONS; i++} InitAppIcons
#endif

[UninstallDelete]
Type: filesandordirs; Name: {app};

[Code]
#include "Modules\FMXInnoHandle.iss"

type
  TMyData = record
    Caption, FileName, Args, SizeTxt: String;
    SizeMB: Integer;
  end;

var
  FMXForm: FForm;
  ComponentSize : Integer;
  SkipDirPage, SkipProgramGroupPage, SkipReadyPage, FMXFirstRun: Boolean;

  TitleBar: FLayout;
  TitleBarIcn: FLabel;
  TitleBarLbl: FLabel;
  TitleBarExitBtn: FRectangle;
  TitleBarExitBtnIcn: FLabel;
  TitleBarMinBtn: FRectangle;
  TitleBarMinBtnIcn: FLabel;
  
  ControlBtn: FRectangle;
  ControlBtnIcn: FLabel;
  
  ButtonPanel: FLayout;
  Button: array [1..6] of FRectangle;
  ButtonIcn: array [1..6] of FLabel;
  ButtonLbl: array [1..6] of FLabel;
  ButtonIndicator: FSIndicator;
  ButtonPanelAnim: FFloatAnimation;

  PageLayer: FRectangle;
  PageLayerLbl: FLabel;

  Page1: FCustomPage;
  Page1Lbl: array [1..7] of FLabel;
  Page1Line: array [1..3] of FRectangle;
  Page1Memo: FMemo;

  Page2: FCustomPage;
  Page2Lbl: array [1..8] of FLabel;
  Page2Line: array [1..4] of FRectangle;
  Page2Edit: FEdit;
  Page2Arc: FModernArc2;
  Page2DiskUsage: FDiskUsage;
#if MAX_ICONS > 0
  IconLbl: array [1..4] of FLabel;
  IconSwitch: array [1..2] of FSwitch;
#endif

  Page3: FCustomPage;
  Page3Lbl: array [1..6] of FLabel;
  Page3Line: array [1..2] of FRectangle;
  Page3Memo: FMemo;
  Page3CheckboxTree: FCheckboxTree;
#if MAX_REDIST > 0
  SectionRedist: Longint;
  RedistCheckBox: array [1..{#MAX_REDIST}] of Longint;
  RedistData: array [1..{#MAX_REDIST}] of TMyData;
#endif
#if MAX_COMPO > 0
  SectionCompo: Longint;
  CompoCheckBox: array [1..{#MAX_COMPO}] of Longint;
  CompoData: array [1..{#MAX_COMPO}] of TMyData;
#endif

  Page4: FCustomPage;
  Page4Lbl: array [1..13] of FLabel;
  Page4Line: array [1..4] of FRectangle;
  Page4Arc: array [1..3] of FModernArc2;
  CpuUsage: FCpuUsage;
  RamUsage: FRamUsage;
  GpuInfo: FGPUInfo;

  Page5: FCustomPage;
  Page5Lbl: array [1..11] of FLabel;
  Page5Line: array [1..4] of FRectangle;
  Page5Arc: FModernArc;

  Page6: FCustomPage;
  Page6Lbl: array [1..7] of FLabel;
  Page6Line: array [1..3] of FRectangle;
  Page6Memo: FMemo;
  WaterMarkLbl: FLabel;

  DirBrowseForm: FFluentDirBrowse;
 	DirBrowseFormOkBtn: FButton;
  DirBrowseFormCancelBtn: FButton;

  MessageForm: FCustomFluentWindow;
 	MessageFormLbl: array [1..2] of FLabel;
  MessageFormPanel: FRectangle;
 	MessageFormOkBtn: FButton;

  ExitForm: FCustomFluentWindow;
 	ExitFormLbl: array [1..2] of FLabel;
  ExitFormPanel: FRectangle;
 	ExitFormYesBtn: FButton;
  ExitFormNoBtn: FButton;

procedure FMXInnoInit;
var
  i: Integer;
begin
  FMXForm:= InitFormHandle;

  TitleBar:= InitLayoutHandle;
  TitleBarIcn:= InitLabelHandle;
  TitleBarLbl:= InitLabelHandle;
  TitleBarExitBtn:= InitRectangleHandle;
  TitleBarExitBtnIcn:= InitLabelHandle;
  TitleBarMinBtn:= InitRectangleHandle;
  TitleBarMinBtnIcn:= InitLabelHandle;
  
  ControlBtn:= InitRectangleHandle;
  ControlBtnIcn:= InitLabelHandle;
  
  ButtonPanel:= InitLayoutHandle;
  for i:= 1 to 6 do
  begin
    Button[i]:= InitRectangleHandle;
    ButtonIcn[i]:= InitLabelHandle;
    ButtonLbl[i]:= InitLabelHandle;
  end;
  ButtonIndicator:= InitSIndicator;
  ButtonPanelAnim:= InitFloatAnimationHandle;

  PageLayer:= InitRectangleHandle;
  PageLayerLbl:= InitLabelHandle;

  Page1:= InitCustomPageHandle;
  for i:= 1 to 7 do
    Page1Lbl[i]:= InitLabelHandle;
  for i:= 1 to 3 do
    Page1Line[i]:= InitRectangleHandle;
  Page1Memo:= InitMemoHandle;

  Page2:= InitCustomPageHandle;
  for i:= 1 to 8 do
    Page2Lbl[i]:= InitLabelHandle;
  for i:= 1 to 4 do
    Page2Line[i]:= InitRectangleHandle;
  Page2Edit:= InitEditHandle;
  Page2Arc:= InitModernArc2Handle;
  Page2DiskUsage:= InitDiskUsage;
#if MAX_ICONS > 0
  for i:= 1 to 4 do
    IconLbl[i]:= InitLabelHandle;
  for i:= 1 to 2 do
    IconSwitch[i]:= InitSwitchHandle;
#endif

  Page3:= InitCustomPageHandle;
  for i:= 1 to 6 do
    Page3Lbl[i]:= InitLabelHandle;
  for i:= 1 to 2 do
    Page3Line[i]:= InitRectangleHandle;
  Page3Memo:= InitMemoHandle;
  Page3CheckboxTree:= InitCheckboxTreeHandle;

  Page4:= InitCustomPageHandle;
  for i:= 1 to 13 do
    Page4Lbl[i]:= InitLabelHandle;
  for i:= 1 to 4 do
    Page4Line[i]:= InitRectangleHandle;
  for i:= 1 to 3 do
    Page4Arc[i]:= InitModernArc2Handle;
  CpuUsage:= InitCpuUsage;
  RamUsage:= InitRamUsage;
  GpuInfo:= InitGPUInfo;

  Page5:= InitCustomPageHandle;
  for i:= 1 to 11 do
    Page5Lbl[i]:= InitLabelHandle;
  for i:= 1 to 4 do
    Page5Line[i]:= InitRectangleHandle;
  Page5Arc:= InitModernArcHandle;

  Page6:= InitCustomPageHandle;
  for i:= 1 to 7 do
    Page6Lbl[i]:= InitLabelHandle;
  for i:= 1 to 3 do
    Page6Line[i]:= InitRectangleHandle;
  Page6Memo:= InitMemoHandle;
  WaterMarkLbl:= InitLabelHandle;

  DirBrowseForm:= InitFluentDirBrowse;
  DirBrowseFormOkBtn:= InitButtonHandle;
  DirBrowseFormCancelBtn:= InitButtonHandle;

  MessageForm:= InitCustomFluentWindow;
  for i:= 1 to 2 do
  	MessageFormLbl[i]:= InitLabelHandle;
  MessageFormPanel:= InitRectangleHandle;
  MessageFormOkBtn:= InitButtonHandle;

  ExitForm:= InitCustomFluentWindow;
  for i:= 1 to 2 do
  	ExitFormLbl[i]:= InitLabelHandle;
  ExitFormPanel:= InitRectangleHandle;
 	ExitFormYesBtn:= InitButtonHandle;
  ExitFormNoBtn:= InitButtonHandle;
end;

function InitializeSetup: Boolean;
begin
  AddFontResource2(ExtractAndLoad('Eleven-Icons.ttf'));

  FMXInnoInit;
  Result:= True;
end;

procedure DeinitializeSetup();
begin
  RemoveFontResource2(ExpandConstant('{tmp}\Eleven-Icons.ttf'));

  FMXInnoShutDown;
end;

procedure ShowMessageForm(const Title, SubTitle: String);
begin
  MessageFormLbl[1].Text(Title);
  MessageFormLbl[2].Text(SubTitle);
  MessageForm.Show;
  PlayWavFile1(ExpandConstant('{win}\Media\Windows Background.wav'));
end;

function ProgressCallback(OverallPct, CurrentPct, DiskTotalMB, DiskExtractedMB: Integer; DiskName, CurrentFile, RemainsTimeS, ElapsedTimeS, CurSpeed, AvgSpeed: WideString): longword;
begin
  Page5Arc.Angle(OverallPct, 1000);
  Page5Lbl[6].Text(MinimizePathName(ExpandConstant('{app}\') + CurrentFile, WizardForm.FileNameLabel.Font, WizardForm.FileNameLabel.Width));
  Page5Lbl[8].Text(CustomMessage('Page5Lbl8A') + ' ' + ElapsedTimeS + #13 +
                   CustomMessage('Page5Lbl8B') + ' ' + RemainsTimeS);
  Page5Lbl[9].Text(CustomMessage('Page5Lbl9') + ' ' + DiskName);

  Result:= ISArcExCancel;
end;

#if MAX_ICONS > 0
function CreateDesktopIcons: Boolean;
begin
  Result:= (not ISArcExError) and IconSwitch[1].ISSwitchedOn;
end;

function CreateGroupIcons: Boolean;
begin
  Result:= (not ISArcExError) and IconSwitch[2].ISSwitchedOn;
end;
#endif

procedure CalculateSize(Sender: TObject);
var
  AdditionalSize, i : Integer;
begin
  AdditionalSize := {#NeedSize};
                                             
#if MAX_COMPO > 0
  for i := 1 to GetArrayLength(CompoData) do
    if Page3CheckboxTree.CheckboxGetChecked(CompoCheckBox[i]) then
      AdditionalSize := AdditionalSize + CompoData[i].SizeMB;
#endif

  ComponentSize := AdditionalSize;

  Page2DiskUsage.SetDir(WizardForm.DirEdit.Text);
  Page2Arc.Angle(Page2DiskUsage.DiskLoad, 100);
  Page2Lbl[7].Text(MbOrTb(ComponentSize, 2) + ' ' + CustomMessage('Page2Lbl7A') + #13 +
                   MbOrTb(Page2DiskUsage.FreeSpace, 2) + ' ' + CustomMessage('Page2Lbl7B'));
  Page3Lbl[6].Text(FmtMessage(CustomMessage('Page3Lbl6'), [MbOrTb(ComponentSize, 2)]));

  if Round(Page2DiskUsage.FreeSpace) > Round(ComponentSize) then
  begin
    Button[5].Enabled(True);
  end else
  begin
    Button[5].Enabled(False);
    ShowMessageForm(CustomMessage('Error'), CustomMessage('DiskError'));
  end;
end;

procedure CommonFinish(Sender: TObject);
begin
  ButtonPanelAnim.Enabled(False);
end;

procedure CancelButtonClick(CurPageID: Integer; var Cancel, Confirm: Boolean);
begin
  Confirm:= False;
end;

procedure CommonOnClick(Sender: TObject);
var
  ADir: WideString;
begin
  case Sender of
    TObject(TitleBarExitBtn.GetObject), TObject(Button[6].GetObject):
    begin
      if WizardForm.CurPageID = wpInstalling then
      begin
        ISArcExSuspendProc;
        ExitForm.Show;
      end else
      if WizardForm.CurPageID = wpFinished then
        WizardForm.NextButton.OnClick(Sender)
      else
        ExitForm.Show;
    end;

    TObject(TitleBarMinBtn.GetObject):
      pMinimizeWindow(WizardForm.Handle);

    TObject(ControlBtn.GetObject):
    begin
      if ButtonPanel.GetWidth = 50 then
      begin
        ButtonPanelAnim.SetValues(50, 242);
        ButtonPanelAnim.Enabled(True);
      end else
      begin
        ButtonPanelAnim.SetValues(242, 50);
        ButtonPanelAnim.Enabled(True);
      end;
    end;    

    TObject(Button[1].GetObject):
    begin
      case WizardForm.CurPageID of
        wpSelectDir:
          WizardForm.BackButton.OnClick(Sender);
        wpSelectProgramGroup:
        begin
          SkipDirPage:= True;
          WizardForm.BackButton.OnClick(Sender);
        end;
        wpReady:
        begin
          SkipDirPage:= True;
          SkipProgramGroupPage:= True;
          WizardForm.BackButton.OnClick(Sender);
        end;
      end;
    end;

    TObject(Button[2].GetObject):
    begin
      case WizardForm.CurPageID of
        wpWelcome:
          WizardForm.NextButton.OnClick(Sender);
        wpSelectProgramGroup:
          WizardForm.BackButton.OnClick(Sender);
        wpReady:
        begin
          SkipProgramGroupPage:= True;
          WizardForm.BackButton.OnClick(Sender);
        end;
      end;
    end;

    TObject(Button[3].GetObject):
    begin
      case WizardForm.CurPageID of
        wpWelcome:
        begin
          SkipDirPage:= True;
          WizardForm.NextButton.OnClick(Sender);
        end;
        wpSelectDir:
          WizardForm.NextButton.OnClick(Sender);
        wpReady:
          WizardForm.BackButton.OnClick(Sender);
      end;
    end;

    TObject(Button[4].GetObject):
    begin
      case WizardForm.CurPageID of
        wpWelcome:
        begin
          SkipDirPage:= True;
          SkipProgramGroupPage:= True;
          WizardForm.NextButton.OnClick(Sender);
        end;
        wpSelectDir:
        begin
          SkipProgramGroupPage:= True;
          WizardForm.NextButton.OnClick(Sender);
        end;
        wpSelectProgramGroup:
          WizardForm.NextButton.OnClick(Sender);
      end;
    end;

    TObject(Button[5].GetObject):
    begin
      case WizardForm.CurPageID of
        wpWelcome:
        begin
          SkipDirPage:= True;
          SkipProgramGroupPage:= True;
          SkipReadyPage:= True;
          WizardForm.NextButton.OnClick(sender);
        end;
        wpSelectDir:
        begin
          SkipProgramGroupPage:= True;
          SkipReadyPage:= True;
          WizardForm.NextButton.OnClick(sender);
        end;
        wpSelectProgramGroup:
        begin
          SkipReadyPage:= True;
          WizardForm.NextButton.OnClick(sender);
        end;
        wpReady:
          WizardForm.NextButton.OnClick(sender);
      end;
    end;

    TObject(Page2Edit.GetSearchBtnObject):
    begin
      DirBrowseForm.ChangeDirectory(WizardForm.DirEdit.Text);
      DirBrowseForm.DoBrowse(ADir);
      WizardForm.DirEdit.Text:= ADir;
      Page2Edit.Text(MinimizePathName(ADir, WizardForm.DirEdit.Font, WizardForm.DirEdit.Width));
      CalculateSize(nil);
    end;

    TObject(DirBrowseFormOkBtn.GetObject):
      CallNotifyEvents(DirBrowseForm.GetOkBtnClickEvent, Longint(Sender));

    TObject(DirBrowseFormCancelBtn.GetObject):
      CallNotifyEvents(DirBrowseForm.GetCancelBtnClickEvent, Longint(Sender));

  #if MAX_ICONS > 0
    TObject(IconSwitch[1].GetObject):
    begin
      if IconSwitch[1].ISSwitchedOn then
        IconLbl[3].Text(CustomMessage('IconLbl3'))
      else
        IconLbl[3].Text(CustomMessage('IconLbl4'));
    end;

    TObject(IconSwitch[2].GetObject):
    begin
      if IconSwitch[2].ISSwitchedOn then
        IconLbl[4].Text(CustomMessage('IconLbl3'))
      else
        IconLbl[4].Text(CustomMessage('IconLbl4'));
    end;
  #endif

    TObject(MessageFormOkBtn.GetObject):
      MessageForm.Close;

    TObject(ExitFormYesBtn.GetObject):
    begin
      if WizardForm.CurPageID = wpInstalling then
      begin
        ISArcExCancel:= 1;
        if ISArcExIsSuspended then
          ISArcExResumeProc;
        ExitForm.Close;
      end else
        WizardForm.CancelButton.OnClick(Sender);
    end;

    TObject(ExitFormNoBtn.GetObject):
    begin
      if WizardForm.CurPageID = wpInstalling then
      begin
        ISArcExCancel:= 0;
        if ISArcExIsSuspended then
          ISArcExResumeProc;
      end;
      ExitForm.Close;
    end;

  end;
end;

procedure CommonOnEnter(Sender: TObject);
begin
  case Sender of
    TObject(TitleBarExitBtn.GetObject):
      TitleBarExitBtn.FillColor($FFC42B1C);

    TObject(TitleBarMinBtn.GetObject):
      TitleBarMinBtn.FillColor($4D3F506D);

    TObject(ControlBtn.GetObject):
      ControlBtn.FillColor($4D3F506D);

    TObject(Button[1].GetObject):
    begin
      if WizardForm.CurPageID = wpWelcome then
        Button[1].FillColor($343F506D)
      else
        Button[1].FillColor($4D3F506D);
    end;

    TObject(Button[2].GetObject):
    begin
      if WizardForm.CurPageID = wpSelectDir then
        Button[2].FillColor($343F506D)
      else
        Button[2].FillColor($4D3F506D);
    end;

    TObject(Button[3].GetObject):
    begin
      if WizardForm.CurPageID = wpSelectComponents then
        Button[3].FillColor($343F506D)
      else
        Button[3].FillColor($4D3F506D);
    end;

    TObject(Button[4].GetObject):
    begin
      if WizardForm.CurPageID = wpReady then
        Button[4].FillColor($343F506D)
      else
        Button[4].FillColor($4D3F506D);
    end;

    TObject(Button[5].GetObject):
    begin
      if WizardForm.CurPageID = wpInstalling then
        Button[5].FillColor($343F506D)
      else
        Button[5].FillColor($4D3F506D);
    end;

    TObject(Button[6].GetObject):
    begin
      if WizardForm.CurPageID = wpFinished then
        Button[6].FillColor($343F506D)
      else
        Button[6].FillColor($4D3F506D);
    end;

  end;
end;

procedure CommonOnLeave(Sender: TObject);
begin
  case Sender of
    TObject(TitleBarExitBtn.GetObject):
      TitleBarExitBtn.FillColor($00000000);

    TObject(TitleBarMinBtn.GetObject):
      TitleBarMinBtn.FillColor($00000000);

    TObject(ControlBtn.GetObject):
      ControlBtn.FillColor($00000000);

    TObject(Button[1].GetObject):
    begin
      if WizardForm.CurPageID = wpWelcome then
        Button[1].FillColor($4D3F506D)
      else
        Button[1].FillColor($00000000);
    end;

    TObject(Button[2].GetObject):
    begin
      if WizardForm.CurPageID = wpSelectDir then
        Button[2].FillColor($4D3F506D)
      else
        Button[2].FillColor($00000000);
    end;

    TObject(Button[3].GetObject):
    begin
      if WizardForm.CurPageID = wpSelectComponents then
        Button[3].FillColor($4D3F506D)
      else
        Button[3].FillColor($00000000);
    end;

    TObject(Button[4].GetObject):
    begin
      if WizardForm.CurPageID = wpReady then
        Button[4].FillColor($4D3F506D)
      else
        Button[4].FillColor($00000000);
    end;

    TObject(Button[5].GetObject):
    begin
      if WizardForm.CurPageID = wpInstalling then
        Button[5].FillColor($4D3F506D)
      else
        Button[5].FillColor($00000000);
    end;

    TObject(Button[6].GetObject):
    begin
      if WizardForm.CurPageID = wpFinished then
        Button[6].FillColor($4D3F506D)
      else
        Button[6].FillColor($00000000);
    end;

  end;
end;

function FMXInnoBuildDate: String;
var
  YearW, MonthW, DayW: Word;
begin
  wGetFMXInnoBuildDateEx(YearW, MonthW, DayW);

  Result:= Format('FMXInno Build Date:  %d-%d-%d', [YearW, MonthW, DayW]);
end;

procedure FMXDesigning;
begin
  if not IsOSMatched(B_WIN11_21H2) then
    FMXForm.FCreateBlankForm(WizardForm.Handle, $FF0E192B, '')
  else
    FMXForm.FCreateFluentColor(WizardForm.Handle, $002B190E, False, 0.87, 0);
  FMXForm.LoadStyleFromFile(ExtractAndLoad('style.style'));

  TitleBar.FCreate(FMXForm.Handle);
  TitleBar.Align(MostTop);
  TitleBar.Height(32);

  TitleBarIcn.FCreate(TitleBar.Handle, #$e7fc);
  TitleBarIcn.Position(15, 3);
  TitleBarIcn.Align(Left);
  TitleBarIcn.Margins(15, 3, 0, 0);
  TitleBarIcn.AutoSize(True);
  TitleBarIcn.FontSetting('Eleven Icons', 20, $FFFFFFFF);
  TitleBarIcn.TextSetting(False, txLeading, txCenter);
  
  TitleBarLbl.FCreate(TitleBar.Handle, CustomMessage('TitleBarLbl'));
  TitleBarLbl.Position(57, 0);
  TitleBarLbl.Align(Left);
  TitleBarLbl.Margins(17, 0, 0, 0);
  TitleBarLbl.AutoSize(True);
  TitleBarLbl.FontSetting('Segoe UI', 14, $FFFFFFFF);
  TitleBarLbl.TextSetting(False, txLeading, txCenter);

  TitleBarExitBtn.FCreate(TitleBar.Handle);
  TitleBarExitBtn.Position(807, 0);
  TitleBarExitBtn.Align(Right);
  TitleBarExitBtn.Width(46);
  TitleBarExitBtn.FillColor($00000000);
  TitleBarExitBtn.OnMouseEnter(@CommonOnEnter);
  TitleBarExitBtn.OnMouseLeave(@CommonOnLeave);
  TitleBarExitBtn.OnClick(@CommonOnClick);
  TitleBarExitBtnIcn.FCreate(TitleBarExitBtn.Handle, #$e711);
  TitleBarExitBtnIcn.Align(Client);
  TitleBarExitBtnIcn.FontSetting('Eleven Icons', 16, $FFFFFFFF);
  TitleBarExitBtnIcn.TextSetting(False, txCenter, txCenter);

  TitleBarMinBtn.FCreate(TitleBar.Handle);
  TitleBarMinBtn.Position(761, 0);
  TitleBarMinBtn.Align(Right);
  TitleBarMinBtn.Width(46);
  TitleBarMinBtn.FillColor($00000000);
  TitleBarMinBtn.OnMouseEnter(@CommonOnEnter);
  TitleBarMinBtn.OnMouseLeave(@CommonOnLeave);
  TitleBarMinBtn.OnClick(@CommonOnClick);
  TitleBarMinBtnIcn.FCreate(TitleBarMinBtn.Handle, #$e738);
  TitleBarMinBtnIcn.Align(Client);
  TitleBarMinBtnIcn.FontSetting('Eleven Icons', 16, $FFFFFFFF);
  TitleBarMinBtnIcn.TextSetting(False, txCenter, txCenter);

  ControlBtn.FCreate(FMXForm.Handle);
  ControlBtn.Position(5, 37);
  ControlBtn.Margins(5, 5, 5, 5);
  ControlBtn.Width(40);
  ControlBtn.Height(35);
  ControlBtn.FillColor($00000000);
  ControlBtn.CornerStyle(5, 5, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
  ControlBtn.OnMouseEnter(@CommonOnEnter);
  ControlBtn.OnMouseLeave(@CommonOnLeave);
  ControlBtn.OnClick(@CommonOnClick);
  ControlBtnIcn.FCreate(ControlBtn.Handle, #$e700);
  ControlBtnIcn.Align(Center);
  ControlBtnIcn.AutoSize(True);
  ControlBtnIcn.FontSetting('Eleven Icons', 16, $FFFFFFFF);
  ControlBtnIcn.TextSetting(False, txLeading, txCenter);

  ButtonPanel.FCreate(FMXForm.Handle);
  ButtonPanel.Position(0, 75);
  ButtonPanel.Align(Left);
  ButtonPanel.Width(50);
  ButtonPanel.Margins(0, 43, 0, 0);

  Button[1].FCreate(ButtonPanel.Handle);
  Button[1].Position(5, 3);
  Button[1].Align(Top);
  Button[1].Margins(5, 2, 5, 3);
  Button[1].Width(40);
  Button[1].Height(35);
  Button[1].FillColor($4D3F506D);
  Button[1].CornerStyle(5, 5, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
  Button[1].OnMouseEnter(@CommonOnEnter);
  Button[1].OnMouseLeave(@CommonOnLeave);
  Button[1].OnClick(@CommonOnClick);
  ButtonIcn[1].FCreate(Button[1].Handle, #$e80f);
  ButtonIcn[1].Align(Left);
  ButtonIcn[1].Margins(12, 0, 5, 0);
  ButtonIcn[1].AutoSize(True);
  ButtonIcn[1].FontSetting('Eleven Icons', 16, $FFFFFFFF);
  ButtonIcn[1].TextSetting(False, txLeading, txCenter);
  ButtonLbl[1].FCreate(Button[1].Handle, CustomMessage('ButtonLbl1'));
  ButtonLbl[1].Align(Client);
  ButtonLbl[1].Margins(14, 0, 0, 0);
  ButtonLbl[1].AutoSize(True);
  ButtonLbl[1].FontSetting('Segoe UI', 14, $FFFFFFFF);
  ButtonLbl[1].TextSetting(False, txLeading, txCenter);

  Button[2].FCreate(ButtonPanel.Handle);
  Button[2].Position(5, 83);
  Button[2].Align(Top);
  Button[2].Margins(5, 2, 5, 3);
  Button[2].Width(40);
  Button[2].Height(35);
  Button[2].FillColor($00000000);
  Button[2].CornerStyle(5, 5, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
  Button[2].OnMouseEnter(@CommonOnEnter);
  Button[2].OnMouseLeave(@CommonOnLeave);
  Button[2].OnClick(@CommonOnClick);
  ButtonIcn[2].FCreate(Button[2].Handle, #$e8f4);
  ButtonIcn[2].Align(Left);
  ButtonIcn[2].Margins(12, 0, 5, 0);
  ButtonIcn[2].AutoSize(True);
  ButtonIcn[2].FontSetting('Eleven Icons', 16, $FFFFFFFF);
  ButtonIcn[2].TextSetting(False, txLeading, txCenter);
  ButtonLbl[2].FCreate(Button[2].Handle, CustomMessage('ButtonLbl3'));
  ButtonLbl[2].Align(Client);
  ButtonLbl[2].Margins(14, 0, 0, 0);
  ButtonLbl[2].AutoSize(True);
  ButtonLbl[2].FontSetting('Segoe UI', 14, $FFFFFFFF);
  ButtonLbl[2].TextSetting(False, txLeading, txCenter);

  Button[3].FCreate(ButtonPanel.Handle);
  Button[3].Position(5, 123);
  Button[3].Align(Top);
  Button[3].Margins(5, 2, 5, 3);
  Button[3].Width(40);
  Button[3].Height(35);
  Button[3].FillColor($00000000);
  Button[3].CornerStyle(5, 5, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
  Button[3].OnMouseEnter(@CommonOnEnter);
  Button[3].OnMouseLeave(@CommonOnLeave);
  Button[3].OnClick(@CommonOnClick);
  ButtonIcn[3].FCreate(Button[3].Handle, #$e9d5);
  ButtonIcn[3].Align(Left);
  ButtonIcn[3].Margins(12, 0, 5, 0);
  ButtonIcn[3].AutoSize(True);
  ButtonIcn[3].FontSetting('Eleven Icons', 16, $FFFFFFFF);
  ButtonIcn[3].TextSetting(False, txLeading, txCenter);
  ButtonLbl[3].FCreate(Button[3].Handle, CustomMessage('ButtonLbl4'));
  ButtonLbl[3].Align(Client);
  ButtonLbl[3].Margins(14, 0, 0, 0);
  ButtonLbl[3].AutoSize(True);
  ButtonLbl[3].FontSetting('Segoe UI', 14, $FFFFFFFF);
  ButtonLbl[3].TextSetting(False, txLeading, txCenter);

  Button[4].FCreate(ButtonPanel.Handle);
  Button[4].Position(5, 163);
  Button[4].Align(Top);
  Button[4].Margins(5, 2, 5, 3);
  Button[4].Width(40);
  Button[4].Height(35);
  Button[4].FillColor($00000000);
  Button[4].CornerStyle(5, 5, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
  Button[4].OnMouseEnter(@CommonOnEnter);
  Button[4].OnMouseLeave(@CommonOnLeave);
  Button[4].OnClick(@CommonOnClick);
  ButtonIcn[4].FCreate(Button[4].Handle, #$e977);
  ButtonIcn[4].Align(Left);
  ButtonIcn[4].Margins(12, 0, 5, 0);
  ButtonIcn[4].AutoSize(True);
  ButtonIcn[4].FontSetting('Eleven Icons', 16, $FFFFFFFF);
  ButtonIcn[4].TextSetting(False, txLeading, txCenter);
  ButtonLbl[4].FCreate(Button[4].Handle, CustomMessage('ButtonLbl5'));
  ButtonLbl[4].Align(Client);
  ButtonLbl[4].Margins(14, 0, 0, 0);
  ButtonLbl[4].AutoSize(True);
  ButtonLbl[4].FontSetting('Segoe UI', 14, $FFFFFFFF);
  ButtonLbl[4].TextSetting(False, txLeading, txCenter);

  Button[5].FCreate(ButtonPanel.Handle);
  Button[5].Position(5, 203);
  Button[5].Align(Top);
  Button[5].Margins(5, 2, 5, 3);
  Button[5].Width(40);
  Button[5].Height(35);
  Button[5].FillColor($00000000);
  Button[5].CornerStyle(5, 5, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
  Button[5].OnMouseEnter(@CommonOnEnter);
  Button[5].OnMouseLeave(@CommonOnLeave);
  Button[5].OnClick(@CommonOnClick);
  ButtonIcn[5].FCreate(Button[5].Handle, #$e792);
  ButtonIcn[5].Align(Left);
  ButtonIcn[5].Margins(12, 0, 5, 0);
  ButtonIcn[5].AutoSize(True);
  ButtonIcn[5].FontSetting('Eleven Icons', 16, $FFFFFFFF);
  ButtonIcn[5].TextSetting(False, txLeading, txCenter);
  ButtonLbl[5].FCreate(Button[5].Handle, CustomMessage('ButtonLbl6'));
  ButtonLbl[5].Align(Client);
  ButtonLbl[5].Margins(14, 0, 0, 0);
  ButtonLbl[5].AutoSize(True);
  ButtonLbl[5].FontSetting('Segoe UI', 14, $FFFFFFFF);
  ButtonLbl[5].TextSetting(False, txLeading, txCenter);

  Button[6].FCreate(ButtonPanel.Handle);
  Button[6].Position(5, 406);
  Button[6].Align(Bottom);
  Button[6].Margins(5, 5, 5, 5);
  Button[6].Width(40);
  Button[6].Height(35);
  Button[6].FillColor($00000000);
  Button[6].CornerStyle(5, 5, [tcTopLeft, tcTopRight, tcBottomLeft, tcBottomRight], ctRound);
  Button[6].OnMouseEnter(@CommonOnEnter);
  Button[6].OnMouseLeave(@CommonOnLeave);
  Button[6].OnClick(@CommonOnClick);
  ButtonIcn[6].FCreate(Button[6].Handle, #$e7e8);
  ButtonIcn[6].Align(Left);
  ButtonIcn[6].Margins(12, 0, 5, 0);
  ButtonIcn[6].AutoSize(True);
  ButtonIcn[6].FontSetting('Eleven Icons', 16, $FFFFFFFF);
  ButtonIcn[6].TextSetting(False, txLeading, txCenter);
  ButtonLbl[6].FCreate(Button[6].Handle, CustomMessage('ButtonLbl7'));
  ButtonLbl[6].Align(Client);
  ButtonLbl[6].Margins(14, 0, 0, 0);
  ButtonLbl[6].AutoSize(True);
  ButtonLbl[6].FontSetting('Segoe UI', 14, $FFFFFFFF);
  ButtonLbl[6].TextSetting(False, txLeading, txCenter);

  ButtonIndicator.FCreate(ButtonPanel.Handle, Button[1].GetLeft, Button[1].GetTop + 10, $FF5172EF, True);
  ButtonIndicator.IndicatorSize(3, 16);

  ButtonPanelAnim.FCreate(ButtonPanel.Handle);
  ButtonPanelAnim.AnimationType(atInOut, 0.4, 0.1, False, False, False);
  ButtonPanelAnim.Enabled(False);
  ButtonPanelAnim.Interpolation(itQuartic);
  ButtonPanelAnim.PropertyName('Width');
  ButtonPanelAnim.OnFinish(@CommonFinish);

  PageLayer.FCreate(FMXForm.Handle);
  PageLayer.Position(50, 32);
  PageLayer.Align(Client);
  PageLayer.FillColor(FMXColorSetOpacity($FF16253D, 0.9));
  PageLayer.StrokeColor($FF203858);
  PageLayer.StrokeSetting(1, scFlat, sdSolid, sjMiter);
  PageLayer.CornerStyle(6, 6, [tcTopLeft], ctRound);

  PageLayerLbl.FCreate(PageLayer.Handle, CustomMessage('PageLayerLbl'));
  PageLayerLbl.Position(20, 2);
  PageLayerLbl.AutoSize(True);
  PageLayerLbl.FontSetting('Segoe UI', 32, $FFFFFFFF);
  PageLayerLbl.TextSetting(False, txLeading, txLeading);

  Page1.FCreate(PageLayer.Handle);
  Page1.AnimPropertyName('Position.Y');
  Page1.AnimDuration(0.2);
  Page1.AnimInterpolation(itSinusoidal);

  Page1Lbl[1].FCreate(Page1.Handle, CustomMessage('Page1Lbll'));
  Page1Lbl[1].Position(20, 62);
  Page1Lbl[1].AutoSize(True);
  Page1Lbl[1].FontSetting('Segoe UI', 22, $FFFFFFFF);
  Page1Lbl[1].TextSetting(False, txLeading, txLeading);

  Page1Lbl[2].FCreate(Page1.Handle, CustomMessage('Page1Lbl2'));
  Page1Lbl[2].Position(20, 106);
  Page1Lbl[2].AutoSize(True);
  Page1Lbl[2].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page1Lbl[2].TextSetting(False, txLeading, txLeading);

  Page1Lbl[3].FCreate(Page1.Handle, CustomMessage('Page1Lbl3'));
  Page1Lbl[3].Position(520, 106);
  Page1Lbl[3].AutoSize(True);
  Page1Lbl[3].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page1Lbl[3].TextSetting(False, txLeading, txLeading);

  Page1Lbl[4].FCreate(Page1.Handle, CustomMessage('Page1Lbl4'));
  Page1Lbl[4].Position(20, 196);
  Page1Lbl[4].AutoSize(True);
  Page1Lbl[4].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page1Lbl[4].TextSetting(False, txLeading, txLeading);

  Page1Lbl[5].FCreate(Page1.Handle, CustomMessage('Page1Lbl5'));
  Page1Lbl[5].SetBounds(20, 141, 390, 40);
  Page1Lbl[5].FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page1Lbl[5].TextSetting(True, txLeading, txLeading);

  Page1Lbl[6].FCreate(Page1.Handle, CustomMessage('Page1Lbl6'));
  Page1Lbl[6].SetBounds(520, 141, 240, 40);
  Page1Lbl[6].FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page1Lbl[6].TextSetting(True, txLeading, txLeading);

  Page1Lbl[7].FCreate(Page1.Handle, CustomMessage('Page1Lbl7'));
  Page1Lbl[7].Position(20, 231);
  Page1Lbl[7].AutoSize(True);
  Page1Lbl[7].FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page1Lbl[7].TextSetting(False, txLeading, txLeading);

  Page1Line[1].FCreate(Page1.Handle);
  Page1Line[1].SetBounds(20, 135, 462, 1);
  Page1Line[1].FillColor($FF344F7A);

  Page1Line[2].FCreate(Page1.Handle);
  Page1Line[2].SetBounds(520, 135, 254, 1);
  Page1Line[2].FillColor($FF344F7A);

  Page1Line[3].FCreate(Page1.Handle);
  Page1Line[3].SetBounds(20, 225, 462, 1);
  Page1Line[3].FillColor($FF344F7A);

  Page1Memo.FCreate(Page1.Handle, False);
  Page1Memo.SetBounds(38, 256, 444, 140);
  Page1Memo.AddLine(CustomMessage('Page1Memo'));
  Page1Memo.WordWrap(True);
  Page1Memo.FontSetting('Segoe UI', 12,  $FFFFFFFF);
  Page1Memo.ShowScrollBars(True);
  Page1Memo.ReadOnly(True);

  Page2.FCreate(PageLayer.Handle);
  Page2.AnimPropertyName('Position.Y');
  Page2.AnimDuration(0.2);
  Page2.AnimInterpolation(itSinusoidal);

  Page2Lbl[1].FCreate(Page2.Handle, CustomMessage('Page2Lbl1'));
  Page2Lbl[1].Position(20, 62);
  Page2Lbl[1].AutoSize(True);
  Page2Lbl[1].FontSetting('Segoe UI', 22, $FFFFFFFF);
  Page2Lbl[1].TextSetting(False, txLeading, txLeading);

  Page2Lbl[2].FCreate(Page2.Handle, CustomMessage('Page2Lbl2'));
  Page2Lbl[2].Position(20, 106);
  Page2Lbl[2].AutoSize(True);
  Page2Lbl[2].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page2Lbl[2].TextSetting(False, txLeading, txLeading);

  Page2Lbl[3].FCreate(Page2.Handle, CustomMessage('Page2Lbl3'));
  Page2Lbl[3].Position(520, 106);
  Page2Lbl[3].AutoSize(True);
  Page2Lbl[3].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page2Lbl[3].TextSetting(False, txLeading, txLeading);

  Page2Lbl[4].FCreate(Page2.Handle, CustomMessage('Page2Lbl4'));
  Page2Lbl[4].Position(128, 199);
  Page2Lbl[4].AutoSize(True);
  Page2Lbl[4].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page2Lbl[4].TextSetting(False, txLeading, txLeading);

  Page2Lbl[5].FCreate(Page2.Handle, CustomMessage('Page2Lbl5'));
  Page2Lbl[5].Position(20, 289);
  Page2Lbl[5].AutoSize(True);
  Page2Lbl[5].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page2Lbl[5].TextSetting(False, txLeading, txLeading);

  Page2Lbl[6].FCreate(Page2.Handle, CustomMessage('Page2Lbl6'));
  Page2Lbl[6].SetBounds(520, 141, 240, 40);
  Page2Lbl[6].FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page2Lbl[6].TextSetting(True, txLeading, txLeading);

  Page2Lbl[7].FCreate(Page2.Handle, '');
  Page2Lbl[7].SetBounds(128, 235, 290, 40);
  Page2Lbl[7].FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page2Lbl[7].TextSetting(True, txLeading, txLeading);

  Page2Lbl[8].FCreate(Page2.Handle, CustomMessage('Page2Lbl8'));
  Page2Lbl[8].SetBounds(18, 259, 100, 22);
  Page2Lbl[8].FontSetting('Segoe UI SemiBold', 13, $FFFFFFFF);
  Page2Lbl[8].TextSetting(True, txCenter, txLeading);

  Page2Line[1].FCreate(Page2.Handle);
  Page2Line[1].SetBounds(20, 135, 462, 1);
  Page2Line[1].FillColor($FF344F7A);

  Page2Line[2].FCreate(Page2.Handle);
  Page2Line[2].SetBounds(520, 135, 254, 1);
  Page2Line[2].FillColor($FF344F7A);

  Page2Line[3].FCreate(Page2.Handle);
  Page2Line[3].SetBounds(128, 229, 353, 1);
  Page2Line[3].FillColor($FF344F7A);

  Page2Line[4].FCreate(Page2.Handle);
  Page2Line[4].SetBounds(20, 317, 462, 1);
  Page2Line[4].FillColor($FF344F7A);

  Page2Edit.FCreate(Page2.Handle);
  Page2Edit.SetBounds(20, 145, 462, 30);
  Page2Edit.FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page2Edit.AddSearchButton(@CommonOnClick);
  Page2Edit.Text(MinimizePathName(WizardForm.DirEdit.Text, WizardForm.DirEdit.Font, WizardForm.DirEdit.Width));

  Page2Arc.FCreate(Page2.Handle, 18, 184, 100, $FF5172EF, $FF5172EF);
  Page2Arc.ShadowSetting($00000000, 0, 0);
  Page2Arc.TextSetting('Segoe UI SemiBold', $FFFFFFFF);

#if MAX_ICONS > 0
  IconLbl[1].FCreate(Page2.Handle, CustomMessage('IconLbl1'));
  IconLbl[1].Position(20, 324);
  IconLbl[1].AutoSize(True);
  IconLbl[1].FontSetting('Segoe UI SemiBold', 13, $FFFFFFFF);
  IconLbl[1].TextSetting(True, txLeading, txLeading);

  IconLbl[2].FCreate(Page2.Handle, CustomMessage('IconLbl2'));
  IconLbl[2].Position(246, 324);
  IconLbl[2].AutoSize(True);
  IconLbl[2].FontSetting('Segoe UI SemiBold', 13, $FFFFFFFF);
  IconLbl[2].TextSetting(True, txLeading, txLeading);

  IconLbl[3].FCreate(Page2.Handle, CustomMessage('IconLbl3'));
  IconLbl[3].Position(65, 350);
  IconLbl[3].AutoSize(True);
  IconLbl[3].FontSetting('Segoe UI', 13, $FFFFFFFF);
  IconLbl[3].TextSetting(True, txLeading, txLeading);

  IconLbl[4].FCreate(Page2.Handle, CustomMessage('IconLbl4'));
  IconLbl[4].Position(291, 350);
  IconLbl[4].AutoSize(True);
  IconLbl[4].FontSetting('Segoe UI', 13, $FFFFFFFF);
  IconLbl[4].TextSetting(True, txLeading, txLeading);

  IconSwitch[1].FCreate(Page2.Handle, True);
  IconSwitch[1].Position(20, 349);
  IconSwitch[1].OnClick(@CommonOnClick);

  IconSwitch[2].FCreate(Page2.Handle, False);
  IconSwitch[2].Position(246, 349);
  IconSwitch[2].OnClick(@CommonOnClick);
#endif

  Page3.FCreate(PageLayer.Handle);
  Page3.AnimPropertyName('Position.Y');
  Page3.AnimDuration(0.2);
  Page3.AnimInterpolation(itSinusoidal);

  Page3Lbl[1].FCreate(Page3.Handle, CustomMessage('Page3Lbl1'));
  Page3Lbl[1].Position(20, 62);
  Page3Lbl[1].AutoSize(True);
  Page3Lbl[1].FontSetting('Segoe UI', 22, $FFFFFFFF);
  Page3Lbl[1].TextSetting(False, txLeading, txLeading);

  Page3Lbl[2].FCreate(Page3.Handle, CustomMessage('Page3Lbl2'));
  Page3Lbl[2].Position(20, 106);
  Page3Lbl[2].AutoSize(True);
  Page3Lbl[2].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page3Lbl[2].TextSetting(False, txLeading, txLeading);

  Page3Lbl[3].FCreate(Page3.Handle, CustomMessage('Page3Lbl3'));
  Page3Lbl[3].Position(520, 106);
  Page3Lbl[3].AutoSize(True);
  Page3Lbl[3].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page3Lbl[3].TextSetting(False, txLeading, txLeading);

  Page3Lbl[4].FCreate(Page3.Handle, CustomMessage('Page3Lbl4'));
  Page3Lbl[4].SetBounds(20, 141, 440, 40);
  Page3Lbl[4].FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page3Lbl[4].TextSetting(True, txLeading, txLeading);

  Page3Lbl[5].FCreate(Page3.Handle, CustomMessage('Page3Lbl5'));
  Page3Lbl[5].SetBounds(520, 141, 240, 40);
  Page3Lbl[5].FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page3Lbl[5].TextSetting(True, txLeading, txLeading);

  Page3Line[1].FCreate(Page3.Handle);
  Page3Line[1].SetBounds(20, 135, 462, 1);
  Page3Line[1].FillColor($FF344F7A);

  Page3Line[2].FCreate(Page3.Handle);
  Page3Line[2].SetBounds(520, 135, 254, 1);
  Page3Line[2].FillColor($FF344F7A);

  Page3Memo.FCreate(Page3.Handle, False);
  Page3Memo.SetBounds(38, 185, 444, 188);
  Page3Memo.ShowScrollBars(False);
  Page3Memo.CanFocus(False);

  Page3CheckboxTree.FCreate(Page3.Handle, 42, 190, 438, 178, True);
  Page3CheckboxTree.OverrideDefaultOnChangeEvents;
  Page3CheckboxTree.SmoothScroll(True);

#if MAX_REDIST > 0
  SectionRedist:= Page3CheckboxTree.AddEmptySection(CustomMessage('SectionRedist'), Longint(Page3CheckboxTree.BaseHandle));
  Page3CheckboxTree.SectionFontSetting(SectionRedist, 'Segoe UI', 12, $FFFFFFFF);
#sub InitRedists
  #define SubSec ReadMInI('GetSubSection', '/MainSec=Redists /Idx=' + Str(i) + ' /RootOnly=true')
  #if SubSec != ""
  RedistData[{#i} + 1].Caption:= '{#ReadMInI('ReadSubString', '/MainSec=Redists /SubSec=' + SubSec + ' /Key=Name')}';
  RedistData[{#i} + 1].FileName:= ExpandConstant('{#ReadMInI('ReadSubString', '/MainSec=Redists /SubSec=' + SubSec + ' /Key=File')}');
  RedistData[{#i} + 1].Args:= '{#ReadMInI('ReadSubString', '/MainSec=Redists /SubSec=' + SubSec + ' /Key=Args')}';

  RedistCheckBox[{#i} + 1]:= Page3CheckboxTree.AddCheckBox(RedistData[{#i} + 1].Caption, SectionRedist, False);
  Page3CheckboxTree.CheckboxSetWidth(RedistCheckBox[{#i} + 1], 390);
  Page3CheckboxTree.CheckBoxFontSetting(RedistCheckBox[{#i} + 1], 'Segoe UI', 12, $FFFFFFFF);
  #endif
#endsub
#for {i = 0; i < MAX_REDIST; i++} InitRedists
  Page3CheckboxTree.SectionExpandAll(SectionRedist);
#endif

#if MAX_COMPO > 0
  SectionCompo:= Page3CheckboxTree.AddEmptySection(CustomMessage('SectionCompo'), Longint(Page3CheckboxTree.BaseHandle));
  Page3CheckboxTree.SectionFontSetting(SectionCompo, 'Segoe UI', 12, $FFFFFFFF);
#sub InitCompos
  #define CompoSubSec ReadMInI('GetSubSection', '/MainSec=Compos /Idx=' + Str(i) + ' /RootOnly=true')
  #if CompoSubSec != ""
  CompoData[{#i} + 1].Caption:= '{#ReadMInI('ReadSubString', '/MainSec=Compos /SubSec=' + CompoSubSec + ' /Key=Name')}';
  CompoData[{#i} + 1].FileName:= ExpandConstant('{#ReadMInI('ReadSubString', '/MainSec=Compos /SubSec=' + CompoSubSec + ' /Key=File')}');
  CompoData[{#i} + 1].SizeMB := StrToInt(ExpandConstant('{#ReadMInI('ReadSubString', '/MainSec=Compos /SubSec=' + CompoSubSec + ' /Key=SizeMB')}'));
  CompoData[{#i} + 1].SizeTxt := '  [{#ReadMInI('ReadSubString', '/MainSec=Compos /SubSec=' + CompoSubSec + ' /Key=SizeMB')} Mb]';

  CompoCheckBox[{#i} + 1]:= Page3CheckboxTree.AddCheckBox(CompoData[{#i} + 1].Caption + CompoData[{#i} + 1].SizeTxt, SectionCompo, False);
  Page3CheckboxTree.CheckboxSetWidth(CompoCheckBox[{#i} + 1], 390);
  Page3CheckboxTree.CheckBoxFontSetting(CompoCheckBox[{#i} + 1], 'Segoe UI', 12, $FFFFFFFF);
  Page3CheckboxTree.CheckBoxOnChange(CompoCheckBox[{#i} + 1], @CalculateSize);
  #endif
#endsub
#for {i = 0; i < MAX_COMPO; i++} InitCompos
  Page3CheckboxTree.SectionExpandAll(SectionCompo);
#endif

  Page3Lbl[6].FCreate(Page3.Handle, CustomMessage('Page3Lbl6'));
  Page3Lbl[6].Position(24, 394);
  Page3Lbl[6].AutoSize(True);
  Page3Lbl[6].FontSetting('Segoe UI', 13, $FF778899);
  Page3Lbl[6].TextSetting(False, txLeading, txLeading);

  Page4.FCreate(PageLayer.Handle);
  Page4.AnimPropertyName('Position.Y');
  Page4.AnimDuration(0.2);
  Page4.AnimInterpolation(itSinusoidal);

  Page4Lbl[1].FCreate(Page4.Handle, CustomMessage('Page4Lbl1'));
  Page4Lbl[1].Position(20, 62);
  Page4Lbl[1].AutoSize(True);
  Page4Lbl[1].FontSetting('Segoe UI', 22, $FFFFFFFF);
  Page4Lbl[1].TextSetting(False, txLeading, txLeading);

  Page4Lbl[2].FCreate(Page4.Handle, CustomMessage('Page4Lbl2'));
  Page4Lbl[2].Position(520, 106);
  Page4Lbl[2].AutoSize(True);
  Page4Lbl[2].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page4Lbl[2].TextSetting(False, txLeading, txLeading);

  Page4Lbl[3].FCreate(Page4.Handle, CustomMessage('Page4Lbl3'));
  Page4Lbl[3].SetBounds(520, 141, 240, 40);
  Page4Lbl[3].FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page4Lbl[3].TextSetting(True, txLeading, txLeading);

  Page4Line[1].FCreate(Page4.Handle);
  Page4Line[1].SetBounds(520, 135, 254, 1);
  Page4Line[1].FillColor($FF344F7A);

  Page4Line[2].FCreate(Page4.Handle);
  Page4Line[2].SetBounds(128, 135, 353, 1);
  Page4Line[2].FillColor($FF344F7A);

  Page4Line[3].FCreate(Page4.Handle);
  Page4Line[3].SetBounds(128, 231, 353, 1);
  Page4Line[3].FillColor($FF344F7A);

  Page4Line[4].FCreate(Page4.Handle);
  Page4Line[4].SetBounds(128, 327, 353, 1);
  Page4Line[4].FillColor($FF344F7A);

  Page4Arc[1].FCreate(Page4.Handle, 18, 93, 100, $FF5172EF, $FF5172EF);
  Page4Arc[1].ShadowSetting($00000000, 0, 0);
  Page4Arc[1].TextSetting('Segoe UI', $FFFFFFFF);
  Page4Arc[1].Angle(CpuUsage.Cores, {#ReadMInI('ReadString', '/Sec=Game /Key=CPUCores')});

  Page4Arc[2].FCreate(Page4.Handle, 18, 189, 100, $FF5172EF, $FF5172EF);
  Page4Arc[2].ShadowSetting($00000000, 0, 0);
  Page4Arc[2].TextSetting('Segoe UI', $FFFFFFFF);
  Page4Arc[2].Angle(RamUsage.TotalRam, {#ReadMInI('ReadString', '/Sec=Game /Key=RAM')});

  Page4Arc[3].FCreate(Page4.Handle, 18, 285, 100, $FF5172EF, $FF5172EF);
  Page4Arc[3].ShadowSetting($00000000, 0, 0);
  Page4Arc[3].TextSetting('Segoe UI', $FFFFFFFF);
  Page4Arc[3].Angle(GpuInfo.GPUMemory, {#ReadMInI('ReadString', '/Sec=Game /Key=GPURAM')});

  Page4Lbl[4].FCreate(Page4.Handle, CustomMessage('Page4Lbl4'));
  Page4Lbl[4].SetBounds(18, 168, 100, 22);
  Page4Lbl[4].FontSetting('Segoe UI SemiBold', 13, $FFFFFFFF);
  Page4Lbl[4].TextSetting(True, txCenter, txLeading);

  Page4Lbl[5].FCreate(Page4.Handle, CustomMessage('Page4Lbl5'));
  Page4Lbl[5].SetBounds(18, 264, 100, 22);
  Page4Lbl[5].FontSetting('Segoe UI SemiBold', 13, $FFFFFFFF);
  Page4Lbl[5].TextSetting(True, txCenter, txLeading);

  Page4Lbl[6].FCreate(Page4.Handle, CustomMessage('Page4Lbl6'));
  Page4Lbl[6].SetBounds(18, 360, 100, 22);
  Page4Lbl[6].FontSetting('Segoe UI SemiBold', 13, $FFFFFFFF);
  Page4Lbl[6].TextSetting(True, txCenter, txLeading);

  Page4Lbl[7].FCreate(Page4.Handle, CustomMessage('Page4Lbl7'));
  Page4Lbl[7].Position(128, 106);
  Page4Lbl[7].AutoSize(True);
  Page4Lbl[7].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page4Lbl[7].TextSetting(False, txLeading, txLeading);

  Page4Lbl[8].FCreate(Page4.Handle, CustomMessage('Page4Lbl8'));
  Page4Lbl[8].Position(128, 202);
  Page4Lbl[8].AutoSize(True);
  Page4Lbl[8].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page4Lbl[8].TextSetting(False, txLeading, txLeading);

  Page4Lbl[9].FCreate(Page4.Handle, CustomMessage('Page4Lbl9'));
  Page4Lbl[9].Position(128, 298);
  Page4Lbl[9].AutoSize(True);
  Page4Lbl[9].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page4Lbl[9].TextSetting(False, txLeading, txLeading);

  Page4Lbl[10].FCreate(Page4.Handle, CpuUsage.Name + ' CPU @ ' + MHzOrGHz(CpuUsage.Speed, 2) + #13 +
                       IntToStr(CpuUsage.Cores) + ' Cores (' + IntToStr(CpuUsage.Threads) + ' threads' + ')');
  Page4Lbl[10].SetBounds(128, 141, 350, 40);
  Page4Lbl[10].FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page4Lbl[10].TextSetting(True, txLeading, txLeading);

  Page4Lbl[11].FCreate(Page4.Handle, 'Total memory ' + MbOrTb(RamUsage.TotalRam, 1) + #13 +
                                     'Free memory ' + MbOrTb(RamUsage.FreeRam, 1));
  Page4Lbl[11].SetBounds(128, 237, 350, 40);
  Page4Lbl[11].FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page4Lbl[11].TextSetting(True, txLeading, txLeading);

  Page4Lbl[12].FCreate(Page4.Handle, GpuInfo.GPUName + ' (' + MbOrTb(GpuInfo.GPUMemory, 0) + ') ' + #13 + 'DirectX ' + GetDirectXVersion(True));
  Page4Lbl[12].SetBounds(128, 333, 350, 40);
  Page4Lbl[12].FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page4Lbl[12].TextSetting(True, txLeading, txLeading);

  Page4Lbl[13].FCreate(Page4.Handle, CustomMessage('Page4Lbl13'));
  Page4Lbl[13].Position(24, 394);
  Page4Lbl[13].AutoSize(True);
  Page4Lbl[13].FontSetting('Segoe UI', 13, $FF778899);
  Page4Lbl[13].TextSetting(False, txLeading, txLeading);

  Page5.FCreate(PageLayer.Handle);
  Page5.AnimPropertyName('Position.Y');
  Page5.AnimDuration(0.2);
  Page5.AnimInterpolation(itSinusoidal);

  Page5Lbl[1].FCreate(Page5.Handle, CustomMessage('Page5Lbl1'));
  Page5Lbl[1].Position(20, 62);
  Page5Lbl[1].AutoSize(True);
  Page5Lbl[1].FontSetting('Segoe UI', 22, $FFFFFFFF);
  Page5Lbl[1].TextSetting(False, txLeading, txLeading);

  Page5Lbl[2].FCreate(Page5.Handle, CustomMessage('Page5Lbl2'));
  Page5Lbl[2].Position(20, 106);
  Page5Lbl[2].AutoSize(True);
  Page5Lbl[2].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page5Lbl[2].TextSetting(False, txLeading, txLeading);

  Page5Lbl[3].FCreate(Page5.Handle, CustomMessage('Page5Lbl3'));
  Page5Lbl[3].Position(520, 106);
  Page5Lbl[3].AutoSize(True);
  Page5Lbl[3].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page5Lbl[3].TextSetting(False, txLeading, txLeading);

  Page5Lbl[4].FCreate(Page5.Handle, CustomMessage('Page5Lbl4'));
  Page5Lbl[4].Position(230, 186);
  Page5Lbl[4].AutoSize(True);
  Page5Lbl[4].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page5Lbl[4].TextSetting(False, txLeading, txLeading);

  Page5Lbl[5].FCreate(Page5.Handle, CustomMessage('Page5Lbl5'));
  Page5Lbl[5].Position(230, 280);
  Page5Lbl[5].AutoSize(True);
  Page5Lbl[5].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page5Lbl[5].TextSetting(False, txLeading, txLeading);

  Page5Line[1].FCreate(Page5.Handle);
  Page5Line[1].SetBounds(20, 135, 462, 1);
  Page5Line[1].FillColor($FF344F7A);

  Page5Line[2].FCreate(Page5.Handle);
  Page5Line[2].SetBounds(520, 135, 254, 1);
  Page5Line[2].FillColor($FF344F7A);

  Page5Line[3].FCreate(Page5.Handle);
  Page5Line[3].SetBounds(230, 214, 254, 1);
  Page5Line[3].FillColor($FF344F7A);

  Page5Line[4].FCreate(Page5.Handle);
  Page5Line[4].SetBounds(230, 307, 254, 1);
  Page5Line[4].FillColor($FF344F7A);

  Page5Lbl[6].FCreate(Page5.Handle, '');
  Page5Lbl[6].SetBounds(20, 141, 462, 22);
  Page5Lbl[6].FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page5Lbl[6].TextSetting(False, txLeading, txLeading);

  Page5Lbl[7].FCreate(Page5.Handle, CustomMessage('Page5Lbl7'));
  Page5Lbl[7].SetBounds(520, 141, 240, 40);
  Page5Lbl[7].FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page5Lbl[7].TextSetting(True, txLeading, txLeading);

  Page5Lbl[8].FCreate(Page5.Handle, '');
  Page5Lbl[8].SetBounds(230, 220, 250, 45);
  Page5Lbl[8].AutoSize(True);
  Page5Lbl[8].FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page5Lbl[8].TextSetting(False, txLeading, txLeading);

  Page5Lbl[9].FCreate(Page5.Handle, '');
  Page5Lbl[9].Position(230, 312);
  Page5Lbl[9].AutoSize(True);
  Page5Lbl[9].FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page5Lbl[9].TextSetting(False, txLeading, txLeading);

  Page5Arc.FCreate(Page5.Handle, 20, 159, 199, $FF5172EF, $FF5172EF);
  Page5Arc.Opacity(0);
  Page5Arc.TextSetting('Segoe UI', $FFFFFFFF);
  Page5Arc.ShadowSetting($00000000, 0, 0)

  Page6.FCreate(PageLayer.Handle);
  Page6.AnimPropertyName('Position.Y');
  Page6.AnimDuration(0.2);
  Page6.AnimInterpolation(itSinusoidal);

  Page6Lbl[1].FCreate(Page6.Handle, CustomMessage('Page6Lbl1'));
  Page6Lbl[1].Position(20, 62);
  Page6Lbl[1].AutoSize(True);
  Page6Lbl[1].FontSetting('Segoe UI', 22, $FFFFFFFF);
  Page6Lbl[1].TextSetting(False, txLeading, txLeading);

  Page6Lbl[2].FCreate(Page6.Handle, CustomMessage('Page6Lbl2'));
  Page6Lbl[2].Position(20, 106);
  Page6Lbl[2].AutoSize(True);
  Page6Lbl[2].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page6Lbl[2].TextSetting(False, txLeading, txLeading);

  Page6Lbl[3].FCreate(Page6.Handle, CustomMessage('Page6Lbl3'));
  Page6Lbl[3].Position(520, 106);
  Page6Lbl[3].AutoSize(True);
  Page6Lbl[3].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page6Lbl[3].TextSetting(False, txLeading, txLeading);

  Page6Lbl[4].FCreate(Page6.Handle, CustomMessage('Page6Lbl4'));
  Page6Lbl[4].Position(20, 179);
  Page6Lbl[4].AutoSize(True);
  Page6Lbl[4].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  Page6Lbl[4].TextSetting(False, txLeading, txLeading);

  Page6Lbl[5].FCreate(Page6.Handle, CustomMessage('Page6Lbl5'));
  Page6Lbl[5].SetBounds(20, 141, 390, 22);
  Page6Lbl[5].FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page6Lbl[5].TextSetting(True, txLeading, txLeading);

  Page6Lbl[6].FCreate(Page6.Handle, CustomMessage('Page6Lbl6'));
  Page6Lbl[6].SetBounds(520, 141, 240, 40);
  Page6Lbl[6].FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page6Lbl[6].TextSetting(True, txLeading, txLeading);

  Page6Lbl[7].FCreate(Page6.Handle, CustomMessage('Page6Lbl7'));
  Page6Lbl[7].Position(20, 215);
  Page6Lbl[7].AutoSize(True);
  Page6Lbl[7].FontSetting('Segoe UI', 13, $FFFFFFFF);
  Page6Lbl[7].TextSetting(False, txLeading, txLeading);

  Page6Line[1].FCreate(Page6.Handle);
  Page6Line[1].SetBounds(20, 135, 462, 1);
  Page6Line[1].FillColor($FF344F7A);

  Page6Line[2].FCreate(Page6.Handle);
  Page6Line[2].SetBounds(520, 135, 254, 1);
  Page6Line[2].FillColor($FF344F7A);

  Page6Line[3].FCreate(Page6.Handle);
  Page6Line[3].SetBounds(20, 208, 462, 1);
  Page6Line[3].FillColor($FF344F7A);

  Page6Memo.FCreate(Page6.Handle, False);
  Page6Memo.SetBounds(38, 240, 444, 140);
  Page6Memo.AddLine(CustomMessage('Page6Memo'));
  Page6Memo.WordWrap(True);
  Page6Memo.FontSetting('Segoe UI', 12,  $FFFFFFFF);
  Page6Memo.ShowScrollBars(True);
  Page6Memo.ReadOnly(True);

  WaterMarkLbl.FCreate(FMXForm.Handle, FMXInnoBuildDate);
  WaterMarkLbl.SetBounds(652, 494, 190, 22);
  WaterMarkLbl.FontSetting('Segoe UI Bold', 11, FMXColorSetOpacity($FF708090, 0.1));
  WaterMarkLbl.TextSetting(False, txTrailing, txLeading);

  if not IsOSMatched(B_WIN11_21H2) then
    DirBrowseForm.FCreateBlankForm($FF0E192B, CustomMessage('DirBrowseForm'), WizardForm.DirEdit.Text, '')
  else
    DirBrowseForm.FCreate2(CustomMessage('DirBrowseForm'), WizardForm.DirEdit.Text, $002B190E, False, 0.87, 0);
  DirBrowseForm.EditFontSettings('Segoe UI', 12, $FFFFFFFF);
  DirBrowseForm.TextFontSettings('Segoe UI SemiBold', 14, $FFFFFFFF);
  DirBrowseForm.HideButtons(True, True, True);

  DirBrowseFormOkBtn.FCreate(DirBrowseForm.Handle);
  DirBrowseFormOkBtn.SetBounds(130, 418, 120, 29);
  DirBrowseFormOkBtn.Text(CustomMessage('DirBrowseFormOkBtn'));
  DirBrowseFormOkBtn.FontSetting('Segoe UI', 14, $FFFFFFFF);
  DirBrowseFormOkBtn.SetFocus;
  DirBrowseFormOkBtn.OnClick(@CommonOnClick);

  DirBrowseFormCancelBtn.FCreate(DirBrowseForm.Handle);
  DirBrowseFormCancelBtn.SetBounds(262, 418, 120, 29);
  DirBrowseFormCancelBtn.Text(CustomMessage('DirBrowseFormCancelBtn'));
  DirBrowseFormCancelBtn.FontSetting('Segoe UI', 14, $FFFFFFFF);
  DirBrowseFormCancelBtn.CanFocus(False);
  DirBrowseFormCancelBtn.OnClick(@CommonOnClick);

  if not IsOSMatched(B_WIN11_21H2) then
    MessageForm.FCreateBlankForm(FMXForm.HandleHWND, $FF0E192B, '')
  else
    MessageForm.FCreateColor(FMXForm.HandleHWND, $002B190E, False, 0.87, 0);
  MessageForm.Height(187);
  MessageForm.Width(372);

  MessageFormLbl[1].FCreate(MessageForm.Handle, '');
  MessageFormLbl[1].Position(27, 27);
  MessageFormLbl[1].AutoSize(True);
  MessageFormLbl[1].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  MessageFormLbl[1].TextSetting(False, txLeading, txLeading);

  MessageFormLbl[2].FCreate(MessageForm.Handle, '');
  MessageFormLbl[2].SetBounds(27, 50, 318, 40);
  MessageFormLbl[2].FontSetting('Segoe UI', 13, $FFFFFFFF);
  MessageFormLbl[2].TextSetting(True, txLeading, txCenter);

  MessageFormPanel.FCreate(MessageForm.Handle);
  MessageFormPanel.Align(Bottom);
  MessageFormPanel.Height(79);
  MessageFormPanel.FillColor(FMXColorSetOpacity($FF16253D, 0.9));
  MessageFormPanel.StrokeColor($FF203858);
  MessageFormPanel.StrokeSetting(1, scFlat, sdSolid, sjMiter);

  MessageFormOkBtn.FCreate(MessageFormPanel.Handle);
  MessageFormOkBtn.SetBounds(111, 23, 150, 30);
  MessageFormOkBtn.Text(CustomMessage('MessageFormOkBtn'));
  MessageFormOkBtn.FontSetting('Segoe UI', 14, $FFFFFFFF);
  MessageFormOkBtn.SetFocus;
  MessageFormOkBtn.OnClick(@CommonOnClick);

  if not IsOSMatched(B_WIN11_21H2) then
    ExitForm.FCreateBlankForm(FMXForm.HandleHWND, $FF0E192B, '')
  else
    ExitForm.FCreateColor(FMXForm.HandleHWND, $002B190E, False, 0.87, 0);
  ExitForm.Height(187);
  ExitForm.Width(372);

  ExitFormLbl[1].FCreate(ExitForm.Handle, CustomMessage('ExitFormLbl1'));
  ExitFormLbl[1].Position(27, 27);
  ExitFormLbl[1].AutoSize(True);
  ExitFormLbl[1].FontSetting('Segoe UI SemiBold', 14, $FFFFFFFF);
  ExitFormLbl[1].TextSetting(False, txLeading, txLeading);

  ExitFormLbl[2].FCreate(ExitForm.Handle, CustomMessage('ExitFormLbl2'));
  ExitFormLbl[2].Position(27, 60);
  ExitFormLbl[2].AutoSize(True);
  ExitFormLbl[2].FontSetting('Segoe UI', 13, $FFFFFFFF);
  ExitFormLbl[2].TextSetting(False, txLeading, txLeading);

  ExitFormPanel.FCreate(ExitForm.Handle);
  ExitFormPanel.Align(Bottom);
  ExitFormPanel.Height(79);
  ExitFormPanel.FillColor(FMXColorSetOpacity($FF16253D, 0.9));
  ExitFormPanel.StrokeColor($FF203858);
  ExitFormPanel.StrokeSetting(1, scFlat, sdSolid, sjMiter);

  ExitFormYesBtn.FCreate(ExitFormPanel.Handle);
  ExitFormYesBtn.SetBounds(29, 23, 150, 30);
  ExitFormYesBtn.Text(CustomMessage('ExitFormYesBtn'));
  ExitFormYesBtn.FontSetting('Segoe UI', 14, $FFFFFFFF);
  ExitFormYesBtn.SetFocus;
  ExitFormYesBtn.OnClick(@CommonOnClick);

  ExitFormNoBtn.FCreate(ExitFormPanel.Handle);
  ExitFormNoBtn.SetBounds(193, 23, 150, 30);
  ExitFormNoBtn.Text(CustomMessage('ExitFormNoBtn'));
  ExitFormNoBtn.FontSetting('Segoe UI', 14, $FFFFFFFF);
  ExitFormNoBtn.CanFocus(False);
  ExitFormNoBtn.OnClick(@CommonOnClick);

end;
 
procedure InitializeWizard();
begin
  EmptyWizardForm(True, 854, 521);

  FMXDesigning;
  FMXForm.Show;

  FMXFirstRun:= True;
end;

procedure HideComponents;
var
  i : Integer;
begin
  Page1.Visible(False);
  Page2.Visible(False);
  Page3.Visible(False);
  Page4.Visible(False);
  Page5.Visible(False);
  Page6.Visible(False);

#if MAX_REDIST > 0
  for i:= 1 to GetArrayLength(RedistData) do
  if not FileExists(RedistData[i].FileName) then
  begin
    Page3CheckboxTree.CheckBoxSetChecked(RedistCheckBox[i], False);
    Page3CheckboxTree.CheckboxEnable(RedistCheckBox[i], False);
  end;
#endif

#if MAX_COMPO > 0
  for i:= 1 to GetArrayLength(CompoData) do
  if not FileExists(CompoData[i].FileName) then
  begin
    Page3CheckboxTree.CheckBoxSetChecked(CompoCheckBox[i], False);
    Page3CheckboxTree.CheckboxEnable(CompoCheckBox[i], False);
  end;
#endif
end;

procedure ShowComponents(CurPageID: integer);
begin
  SkipDirPage:= False;
  SkipProgramGroupPage:= False;
  SkipReadyPage:= False;

  Button[1].FillColor($00000000);
  Button[2].FillColor($00000000);
  Button[3].FillColor($00000000);
  Button[4].FillColor($00000000);
  Button[5].FillColor($00000000);

  CalculateSize(nil);

  case CurPageID of
    wpWelcome:
    begin
      Page1.Visible(True);
      Button[1].FillColor($343F506D);
      if FMXFirstRun then
      begin
        FMXFirstRun:= False;
        Page1.AnimEnable(False);
      end else
      begin
        Page1.AnimSetValues(95, 0);
        Page1.AnimEnable(True);
        ButtonIndicator.SetNewPos(Button[1].GetTop + 10);
        ButtonIndicator.DoPlay;
      end;
    end;

    wpSelectDir:
    begin
      Page2.Visible(True);
      Page2.AnimSetValues(95, 0);
      Page2.AnimEnable(True);

      Button[2].FillColor($343F506D);

      ButtonIndicator.SetNewPos(Button[2].GetTop + 10);
      ButtonIndicator.DoPlay;
		end;

    wpSelectProgramGroup:
    begin
      Page3.Visible(True);
      Page3.AnimSetValues(95, 0);
      Page3.AnimEnable(True);

      Button[3].FillColor($343F506D);

      ButtonIndicator.SetNewPos(Button[3].GetTop + 10);
      ButtonIndicator.DoPlay;
	   end;

    wpReady:
    begin
      Page4.Visible(True);
      Page4.AnimSetValues(95, 0);
      Page4.AnimEnable(True);

      Button[4].FillColor($343F506D);

      ButtonIndicator.SetNewPos(Button[4].GetTop + 10);
      ButtonIndicator.DoPlay;
    end;

    wpInstalling:
    begin
      Page5.Visible(True);
      Page5.AnimSetValues(95, 0);
      Page5.AnimEnable(True);

      Button[5].FillColor($343F506D);

      ButtonIndicator.SetNewPos(Button[5].GetTop + 10);
      ButtonIndicator.DoPlay;
    end;

    wpFinished:
    begin
      Page6.Visible(True);
      Page6.AnimSetValues(95, 0);
      Page6.AnimEnable(True);

      Button[6].FillColor($343F506D);

      ButtonIndicator.SetNewPos(Button[6].GetTop + 10);
      ButtonIndicator.DoPlay;

      if ISArcExError then
      begin
        Page6Lbl[5].Text(CustomMessage('Page6Lbl5ERR'));
        Page6Lbl[7].Text(CustomMessage('Page6Lbl7ERR'));
        Page6Memo.Clear;
        Page6Memo.AddLine(CustomMessage('Page6MemoERR'));
      end;
    end;

  end;
end;

procedure CurPageChanged(CurPageID : Integer);
begin
  HideComponents;
  ShowComponents(CurPageID);
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  case PageID of
    wpSelectDir:
      Result:= SkipDirPage;
    wpSelectProgramGroup: 
      Result:= SkipProgramGroupPage;
    wpReady:
      Result:= SkipReadyPage;
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  i, ErrorCode: Integer;
  CompoFailed: Boolean;
begin
  if CurStep = ssInstall then
  begin
    ISArcExCancel:= 0;
    ISArcExDiskCount:= 0;
    ISArcDiskAddingSuccess:= False;
    ISArcExError:= True;
    CompoFailed:= False;

    ExtractTemporaryFile('English.ini');
    ExtractTemporaryFile('unarc.dll');
    ExtractTemporaryFile('arc.ini');
    ExtractTemporaryFile('CLS.ini');
    ExtractTemporaryFile('Facompress.dll');

    #include "Script_ToolsList_Init.iss"

    repeat

      #if MAX_DISKS > 0
      #sub InitDataFiles
        #define DataSubSec ReadMInI('GetSubSection', '/MainSec=Datas /Idx=' + Str(i) + ' /RootOnly=true')
        #if DataSubSec != ""
          #define DataFile ReadMInI('ReadSubString', '/MainSec=Datas /SubSec=' + DataSubSec + ' /Key=File')
          if FileExists(ExpandConstant('{#DataFile}')) then
          begin
            ISArcDiskAddingSuccess:= ISArcExAddDisks(ExpandConstant('{#DataFile}'), '{#DiskPassword}', ExpandConstant('{app}'));
            if not ISArcDiskAddingSuccess then 
              break;
            ISArcExDiskCount := ISArcExDiskCount + 1;
          end;

        #endif
      #endsub
      #for {i = 0; i < MAX_DISKS; i++} InitDataFiles
      #endif

    #if MAX_COMPO > 0
      for i:= 1 to GetArrayLength(CompoData) do
      begin
        if Page3CheckboxTree.CheckboxGetChecked(CompoCheckBox[i]) then
        begin
          ISArcDiskAddingSuccess:= ISArcExAddDisks(CompoData[i].FileName, '{#DiskPassword}', ExpandConstant('{app}'));
          if not ISArcDiskAddingSuccess then
          begin
            CompoFailed:= True;
            break;
          end;
          ISArcExDiskCount:= ISArcExDiskCount + 1;
        end;
      end;

      if CompoFailed then 
        break;
    #endif

    until true;

    if ISArcExDiskCount = 0 then
      ShowMessageForm(CustomMessage('Error'), CustomMessage('ISArcExErrorA'));

    if (ISArcDiskAddingSuccess) and ISArcExInit(MainForm.Handle, 2, @ProgressCallback) then
    begin
      repeat
        ISArcExReduceCalcAccuracy(1);
        ISArcExChangeLanguage('English');

        for i:= 1 to ISArcExDiskCount do
        begin
          ISArcExError := not ISArcExExtract(i, ExpandConstant('{tmp}\arc.ini'), ExpandConstant('{app}'));
          if ISArcExError then break;
        end;
      until true;

      ISArcExStop;

      if ISArcExError then
        ShowMessageForm(CustomMessage('Error'), CustomMessage('ISArcExErrorB'));

    end;
  end;

  if (CurStep = ssPostInstall) and ISArcExError then
  begin
    Exec2(ExpandConstant('{uninstallexe}'), '/VERYSILENT', false);
    DelTree(ExpandConstant('{app}'), True, True, True);
    RemoveDir(ExpandConstant('{app}'));
  end else
  if (CurStep = ssPostInstall) and (not ISArcExError) then
  begin
  #if MAX_REDIST > 0
    for i:= 1 to GetArrayLength(RedistData) do
    begin
      if Page3CheckboxTree.CheckboxGetChecked(RedistCheckBox[i]) then
        Exec(RedistData[i].FileName, RedistData[i].Args, '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
    end;
  #endif
    RegWriteDWordValue(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{#StringChange(SetupSetting("AppId"), "{{", "{")}_is1', 'EstimatedSize', ComponentSize * 1024);
  end;
end;

function EnableFluent(const WinHandle: HWND; DarkTheme, NoBorders, NoTitleBar: Boolean; Opacity: Single; BrightnessPct: Byte): Integer;
  external 'faC1222296@{tmp}\FluentApi.dll stdcall uninstallonly delayload';

function InitializeUninstall: Boolean;
begin
  Result:= FileCopy(ExpandConstant('{app}\Uninstall\FluentApi.dll'), ExpandConstant('{tmp}\FluentApi.dll'), False);

  if not Result then
    MsgBox('FluentApi.dll  did not found!', mbError, MB_OK);
end;

procedure InitializeUninstallProgressForm;
begin
  with UninstallProgressForm do
  begin
    Color:= clNone;
    Caption:= '';
    Position:= poScreenCenter;
    ClientWidth:= ScaleX(500);
    ClientHeight:= ScaleY(150);
    CancelButton.Hide;
    Bevel.Hide;
    OuterNotebook.Hide;
    InnerNotebook.Hide;
    PageNameLabel.Hide;
    ProgressBar.Parent:= UninstallProgressForm;
    ProgressBar.Top:= ScaleY(100);
    ProgressBar.Width:= ScaleX(430);
    ProgressBar.Left:= (ClientWidth - ProgressBar.Width) div 2;
    ProgressBar.Height:= ScaleY(17);
  end;

  with TLabel.Create(nil) do
  begin
    Parent:= UninstallProgressForm;
    AutoSize:= True;
    Left:= UninstallProgressForm.PageNameLabel.Left;
    Top:= ScaleY(20);
    Caption:= UninstallProgressForm.PageNameLabel.Caption;
    Font.Size:= 14;
    Font.Name:= 'Segoe UI';
    Font.Color:= $00AA55FF;
  end;

  with TLabel.Create(nil) do
  begin
    Parent:= UninstallProgressForm;
    WordWrap:= True;
    Left:= UninstallProgressForm.PageDescriptionLabel.Left - ScaleX(2);
    Top:= ScaleY(55);
    Width:= UninstallProgressForm.ProgressBar.Width;
    Height:= UninstallProgressForm.PageDescriptionLabel.Height  + ScaleY(45);
    Caption:= UninstallProgressForm.PageDescriptionLabel.Caption;
    Font.Size:= 10;
    Font.Name:= 'Segoe UI';
    Font.Color:= $00CAC8B9;
  end;

  EnableFluent(UninstallProgressForm.Handle, True, False, True, 86, 0);
end;

#if VER < 0x06030000
#expr SaveToFile(AddBackslash(SourcePath) + "Example_Preprocessed.iss")
#endif
