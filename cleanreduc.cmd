taskkill /f /im "AGMService.exe"
taskkill /f /im "AGSService.exe"
taskkill /f /im "AdobeIPCBroker.exe"
taskkill /f /im "AdobeGCClient.exe"
sc delete AdobeARMservice
sc delete AGMService
sc delete AGSService
sc delete AdobeGCClient
del /F /Q "C:\Program Files (x86)\Common Files\Adobe\AdobeGCClient\AdobeGCClient.exe"
schtasks.exe /change /tn "AdobeGCInvoker-1.0" /disable
DEL /Q "%WINDIR%\SYSTEM32\TASKS\AdobeGCInvoker-1.0" >NUL
echo y| schtasks /delete /tn "AdobeGCInvoker-1.0" /f
powershell -Command "Get-AppxPackage -AllUsers *AdobeNotificationClient* | Remove-AppxPackage"
if exist "%COMMONPROGRAMFILES(X86)%\Adobe\OOBE\PDApp\IPC" (
DEL "%COMMONPROGRAMFILES(X86)%\Adobe\OOBE\PDApp\IPC\*.*" /Q /S /F
RD "%COMMONPROGRAMFILES(X86)%\Adobe\OOBE\PDApp\IPC" /Q /S
)

if exist "%COMMONPROGRAMFILES%\Adobe\OOBE\PDApp\IPC" (
DEL "%COMMONPROGRAMFILES%\Adobe\OOBE\PDApp\IPC\*.*" /Q /S /F
RD "%COMMONPROGRAMFILES%\Adobe\OOBE\PDApp\IPC" /Q /S
)
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "AdobeGCInvoker-1.0" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "AdobeAAMUpdater-1.0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f
