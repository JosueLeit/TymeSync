#define MyAppName "Sincronizador de Horário"
#define MyAppVersion "1.0"
#define MyAppPublisher "TimeSync"
#define MyAppExeName "install_task.bat"

[Setup]
AppId={{A1B2C3D4-E5F6-G7H8-I9J0-K1L2M3N4O5P6}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=LICENSE.txt
OutputDir=output
OutputBaseFilename=TimeSync_Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "sync_time.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "install_task.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "uninstall_task.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "README.md"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: runascurrentuser postinstall nowait

[Messages]
WelcomeLabel2=Este programa irá instalar o Sincronizador de Horário no seu computador.%n%nÉ recomendado fechar todas as outras aplicações antes de continuar.
FinishedLabel=O Sincronizador de Horário foi instalado com sucesso!%n%nO programa será executado automaticamente para configurar a sincronização de horário. 