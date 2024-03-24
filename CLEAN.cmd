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
@echo off && (echo 0.0.0.0 ic.adobe.io & echo 0.0.0.0 cc-api-data.adobe.io & echo 0.0.0.0 prod.adobegenuine.com & echo 0.0.0.0 gocart-web-prod-ue1-alb-1461435473.us-east-1.elb.amazonaws.com & echo 0.0.0.0 dyzt55url8.adobe.io & echo 0.0.0.0 b5kbg2ggog.adobe.io & echo 0.0.0.0 5zgzzv92gn.adobe.io & echo 0.0.0.0 0mo5a70cqa.adobe.io & echo 0.0.0.0 pojvrj7ho5.adobe.io & echo 0.0.0.0 i7pq6fgbsl.adobe.io & echo 0.0.0.0 ph0f2h2csf.adobe.io & echo 0.0.0.0 r3zj0yju1q.adobe.io & echo 0.0.0.0 9ngulmtgqi.adobe.io & echo 0.0.0.0 guzg78logz.adobe.io & echo 0.0.0.0 2ftem87osk.adobe.io & echo 0.0.0.0 1b9khekel6.adobe.io & echo 0.0.0.0 3d3wqt96ht.adobe.io & echo 0.0.0.0 23ynjitwt5.adobe.io & echo 0.0.0.0 4vzokhpsbs.adobe.io & echo 0.0.0.0 3ca52znvmj.adobe.io & echo 0.0.0.0 r5hacgq5w6.adobe.io & echo 0.0.0.0 gw8gfjbs05.adobe.io & echo 0.0.0.0 lre1kgz2u4.adobe.io & echo 0.0.0.0 ij0gdyrfka.adobe.io & echo 0.0.0.0 8ncdzpmmrg.adobe.io & echo 0.0.0.0 7sj9n87sls.adobe.io & echo 0.0.0.0 7m31guub0q.adobe.io & echo 0.0.0.0 7g2gzgk9g1.adobe.io & echo 0.0.0.0 cd536oo20y.adobe.io & echo 0.0.0.0 dxyeyf6ecy.adobe.io & echo 0.0.0.0 jc95y2v12r.adobe.io & echo 0.0.0.0 1hzopx6nz7.adobe.io & echo 0.0.0.0 m59b4msyph.adobe.io & echo 0.0.0.0 69tu0xswvq.adobe.io & echo 0.0.0.0 vajcbj9qgq.adobe.io & echo 0.0.0.0 p7uxzbht8h.adobe.io & echo 0.0.0.0 vcorzsld2a.adobe.io & echo 0.0.0.0 p0bjuoe16a.adobe.io & echo 0.0.0.0 fqaq3pq1o9.adobe.io & echo 0.0.0.0 aoorovjtha.adobe.io & echo 0.0.0.0 pv256ds6c99.prod.cloud.adobe.io & echo 0.0.0.0 cv2l4573ukh.prod.cloud.adobe.io & echo 0.0.0.0 pv24v41zibm.prod.cloud.adobe.io & echo 0.0.0.0 iv2nn9r0j2r.prod.cloud.adobe.io & echo 0.0.0.0 iv2yt8sqmh0.prod.cloud.adobe.io & echo 0.0.0.0 iv218qmzox6.prod.cloud.adobe.io & echo 0.0.0.0 cv218qmzox6.prod.cloud.adobe.io & echo 0.0.0.0 cv2b0yc07ls.prod.cloud.adobe.io & echo 0.0.0.0 cv2nn9r0j2r.prod.cloud.adobe.io & echo 0.0.0.0 pv2yt8sqmh0.prod.cloud.adobe.io & echo 0.0.0.0 iv256ds6c99.prod.cloud.adobe.io & echo 0.0.0.0 pv2zp87w2eo.prod.cloud.adobe.io & echo 0.0.0.0 iv2ys4tjt9x.prod.cloud.adobe.io & echo 0.0.0.0 cv2ska86hnt.prod.cloud.adobe.io & echo 0.0.0.0 iv24b15c1z0.prod.cloud.adobe.io & echo 0.0.0.0 cv256ds6c99.prod.cloud.adobe.io & echo 0.0.0.0 pv2ska86hnt.prod.cloud.adobe.io & echo 0.0.0.0 iv2b0yc07ls.prod.cloud.adobe.io & echo 0.0.0.0 iv2l4573ukh.prod.cloud.adobe.io & echo 0.0.0.0 cv24v41zibm.prod.cloud.adobe.io & echo 0.0.0.0 iv2ska86hnt.prod.cloud.adobe.io & echo 0.0.0.0 pv2l4573ukh.prod.cloud.adobe.io & echo 0.0.0.0 iv24v41zibm.prod.cloud.adobe.io & echo 0.0.0.0 iv2zp87w2eo.prod.cloud.adobe.io & echo 0.0.0.0 pv2ys4tjt9x.prod.cloud.adobe.io & echo 0.0.0.0 cv2ys4tjt9x.prod.cloud.adobe.io & echo 0.0.0.0 cv2fcqvzl1r.prod.cloud.adobe.io & echo 0.0.0.0 pv2fcqvzl1r.prod.cloud.adobe.io & echo 0.0.0.0 cv24b15

netsh advfirewall firewall add rule name="Block Outbound TrafficAD" dir=out action=block program="C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"
netsh advfirewall firewall add rule name="Block Outbound TrafficAGS" dir=out action=block program="C:\Program Files (x86)\Common Files\Adobe\Adobe Desktop Common\AdobeGenuineClient\AGSService.exe"
