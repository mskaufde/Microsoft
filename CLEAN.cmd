@ECHO OFF
taskkill /f /im "AGMService.exe"
taskkill /f /im "AGSService.exe"
taskkill /f /im "AdobeIPCBroker.exe"
taskkill /f /im "AdobeGCClient.exe"
sc delete AdobeARMservice
sc delete AGMService
sc delete AGSService
sc delete AdobeGCClient
del /F /Q "C:\Program Files (x86)\Common Files\Adobe\AdobeGCClient\AdobeGCClient.exe"
schtasks.exe /change /tn "Adobe Acrobat Update Task" /disable
schtasks.exe /change /tn "AdobeGCInvoker-1.0" /disable
DEL /Q "%WINDIR%\SYSTEM32\TASKS\Adobe Acrobat Update Task" >NUL
DEL /Q "%WINDIR%\SYSTEM32\TASKS\AdobeGCInvoker-1.0" >NUL
echo y| schtasks /delete /tn "Adobe Acrobat Update Task" /f
echo y| schtasks /delete /tn "AdobeGCInvoker-1.0" /f

if exist "%COMMONPROGRAMFILES(X86)%\Adobe\OOBE\PDApp\IPC" (
DEL "%COMMONPROGRAMFILES(X86)%\Adobe\OOBE\PDApp\IPC\*.*" /Q /S /F
RD "%COMMONPROGRAMFILES(X86)%\Adobe\OOBE\PDApp\IPC" /Q /S
)

if exist "%COMMONPROGRAMFILES%\Adobe\OOBE\PDApp\IPC" (
DEL "%COMMONPROGRAMFILES%\Adobe\OOBE\PDApp\IPC\*.*" /Q /S /F
RD "%COMMONPROGRAMFILES%\Adobe\OOBE\PDApp\IPC" /Q /S
)
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "AdobeGCInvoker-1.0" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "AdobeAAMUpdater-1.0" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Acrobat Assistant 8.0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Adobe\Adobe Acrobat\DC\Activation" /v "IsAMTEnforced" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Adobe\Adobe Acrobat\DC\Activation" /v "IsAMTEnforced" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Adobe\Adobe Acrobat\DC\AVGeneral" /v "aActiveUITheme" /t REG_SZ /d "DarkTheme" /f
Reg.exe add "HKCU\Software\Adobe\Adobe Acrobat\DC\AVGeneral" /v "bappFirstLaunchForNotifications" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Adobe\Adobe Acrobat\DC\FTEDialog" /v "iFTEVersion" /t REG_DWORD /d "10" /f
Reg.exe add "HKCU\Software\Adobe\Adobe Acrobat\DC\FTEDialog" /v "iLastCardShown" /t REG_DWORD /d "0" /f
echo 0.0.0.0 ic.adobe.io 0.0.0.0 r3zj0yju1q.adobe.io 0.0.0.0 >> C:\Windows\System32\drivers\etc\hosts
netsh advfirewall firewall add rule name="Block Outbound TrafficAD" dir=out action=block program="C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"
netsh advfirewall firewall add rule name="Block Outbound TrafficAGS" dir=out action=block program="C:\Program Files (x86)\Common Files\Adobe\Adobe Desktop Common\AdobeGenuineClient\AGSService.exe"
