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
echo 0.0.0.0 ic.adobe.io
0.0.0.0 cc-api-data.adobe.io
0.0.0.0 prod.adobegenuine.com
0.0.0.0 gocart-web-prod-ue1-alb-1461435473.us-east-1.elb.amazonaws.com
0.0.0.0 dyzt55url8.adobe.io
0.0.0.0 b5kbg2ggog.adobe.io
0.0.0.0 5zgzzv92gn.adobe.io
0.0.0.0 0mo5a70cqa.adobe.io
0.0.0.0 pojvrj7ho5.adobe.io
0.0.0.0 i7pq6fgbsl.adobe.io
0.0.0.0 ph0f2h2csf.adobe.io
0.0.0.0 r3zj0yju1q.adobe.io
0.0.0.0 9ngulmtgqi.adobe.io
0.0.0.0 guzg78logz.adobe.io
0.0.0.0 2ftem87osk.adobe.io
0.0.0.0 1b9khekel6.adobe.io
0.0.0.0 3d3wqt96ht.adobe.io
0.0.0.0 23ynjitwt5.adobe.io
0.0.0.0 4vzokhpsbs.adobe.io
0.0.0.0 3ca52znvmj.adobe.io
0.0.0.0 r5hacgq5w6.adobe.io
0.0.0.0 gw8gfjbs05.adobe.io
0.0.0.0 lre1kgz2u4.adobe.io
0.0.0.0 ij0gdyrfka.adobe.io
0.0.0.0 8ncdzpmmrg.adobe.io
0.0.0.0 7sj9n87sls.adobe.io
0.0.0.0 7m31guub0q.adobe.io
0.0.0.0 7g2gzgk9g1.adobe.io
0.0.0.0 cd536oo20y.adobe.io
0.0.0.0 dxyeyf6ecy.adobe.io
0.0.0.0 jc95y2v12r.adobe.io
0.0.0.0 1hzopx6nz7.adobe.io
0.0.0.0 m59b4msyph.adobe.io
0.0.0.0 69tu0xswvq.adobe.io
0.0.0.0 vajcbj9qgq.adobe.io
0.0.0.0 p7uxzbht8h.adobe.io
0.0.0.0 vcorzsld2a.adobe.io
0.0.0.0 p0bjuoe16a.adobe.io
0.0.0.0 fqaq3pq1o9.adobe.io
0.0.0.0 aoorovjtha.adobe.io
0.0.0.0 pv256ds6c99.prod.cloud.adobe.io
0.0.0.0 cv2l4573ukh.prod.cloud.adobe.io
0.0.0.0 pv24v41zibm.prod.cloud.adobe.io
0.0.0.0 iv2nn9r0j2r.prod.cloud.adobe.io
0.0.0.0 iv2yt8sqmh0.prod.cloud.adobe.io
0.0.0.0 iv218qmzox6.prod.cloud.adobe.io
0.0.0.0 cv218qmzox6.prod.cloud.adobe.io
0.0.0.0 cv2b0yc07ls.prod.cloud.adobe.io
0.0.0.0 cv2nn9r0j2r.prod.cloud.adobe.io
0.0.0.0 pv2yt8sqmh0.prod.cloud.adobe.io
0.0.0.0 iv256ds6c99.prod.cloud.adobe.io
0.0.0.0 pv2zp87w2eo.prod.cloud.adobe.io
0.0.0.0 iv2ys4tjt9x.prod.cloud.adobe.io
0.0.0.0 cv2ska86hnt.prod.cloud.adobe.io
0.0.0.0 iv24b15c1z0.prod.cloud.adobe.io
0.0.0.0 cv256ds6c99.prod.cloud.adobe.io
0.0.0.0 pv2ska86hnt.prod.cloud.adobe.io
0.0.0.0 iv2b0yc07ls.prod.cloud.adobe.io
0.0.0.0 iv2l4573ukh.prod.cloud.adobe.io
0.0.0.0 cv24v41zibm.prod.cloud.adobe.io
0.0.0.0 iv2ska86hnt.prod.cloud.adobe.io
0.0.0.0 pv2l4573ukh.prod.cloud.adobe.io
0.0.0.0 iv24v41zibm.prod.cloud.adobe.io
0.0.0.0 iv2zp87w2eo.prod.cloud.adobe.io
0.0.0.0 pv2ys4tjt9x.prod.cloud.adobe.io
0.0.0.0 cv2ys4tjt9x.prod.cloud.adobe.io
0.0.0.0 cv2fcqvzl1r.prod.cloud.adobe.io
0.0.0.0 pv2fcqvzl1r.prod.cloud.adobe.io
0.0.0.0 cv24b15c1z0.prod.cloud.adobe.io
0.0.0.0 pv24b15c1z0.prod.cloud.adobe.io
0.0.0.0 cv2bqhsp36w.prod.cloud.adobe.io
0.0.0.0 pv2b0yc07ls.prod.cloud.adobe.io
0.0.0.0 pv218qmzox6.prod.cloud.adobe.io
0.0.0.0 cv2yt8sqmh0.prod.cloud.adobe.io
0.0.0.0 iv2fcqvzl1r.prod.cloud.adobe.io
0.0.0.0 pv2bqhsp36w.prod.cloud.adobe.io
0.0.0.0 pv2nn9r0j2r.prod.cloud.adobe.io
0.0.0.0 cv2zp87w2eo.prod.cloud.adobe.io
0.0.0.0 iv2bqhsp36w.prod.cloud.adobe.io
0.0.0.0 yj8yx3y8zo.adobestats.io
0.0.0.0 mpsige2va9.adobestats.io
0.0.0.0 ujqx8lhpz4.adobestats.io
0.0.0.0 y2r8jzsv4p.adobestats.io
0.0.0.0 eq7dbze88m.adobestats.io
0.0.0.0 q9hjwppxeq.adobestats.io
0.0.0.0 skg7pqn0al.adobestats.io
0.0.0.0 9iay914wzy.adobestats.io
0.0.0.0 yuzuoqo0il.adobestats.io
0.0.0.0 2o3c6rbyfr.adobestats.io
0.0.0.0 vicsj37lhf.adobestats.io
0.0.0.0 nhc73ypmli.adobestats.io
0.0.0.0 oxiz2n3i4v.adobestats.io
0.0.0.0 2qjz50z5lf.adobestats.io
0.0.0.0 i2x2ius9o5.adobestats.io
0.0.0.0 lnwbupw1s7.adobestats.io
0.0.0.0 n746qg9j4i.adobestats.io
0.0.0.0 2621x1nzeq.adobestats.io
0.0.0.0 r9r6oomgms.adobestats.io
0.0.0.0 99pfl4vazm.adobestats.io
0.0.0.0 zekdqanici.adobestats.io
0.0.0.0 g9cli80sqp.adobestats.io
0.0.0.0 dyv9axahup.adobestats.io
0.0.0.0 17ov1u3gio.adobestats.io
0.0.0.0 7l4xxjhvkt.adobestats.io
0.0.0.0 wcxqmuxd4z.adobestats.io
0.0.0.0 l558s6jwzy.adobestats.io
0.0.0.0 85n85uoa1h.adobestats.io
0.0.0.0 zrao5tdh1t.adobestats.io
0.0.0.0 eftcpaiu36.adobestats.io
0.0.0.0 2qj10f8rdg.adobestats.io
0.0.0.0 ffs3xik41x.adobestats.io
0.0.0.0 g3y09mbaam.adobestats.io
0.0.0.0 x880ulw3h0.adobestats.io
0.0.0.0 jaircqa037.adobestats.io
0.0.0.0 ppn4fq68w7.adobestats.io
0.0.0.0 1ei1f4k9yk.adobestats.io
0.0.0.0 6j0onv1tde.adobestats.io
0.0.0.0 pljm140ld1.adobestats.io
0.0.0.0 50sxgwgngu.adobestats.io
0.0.0.0 u31z50xvp9.adobestats.io
0.0.0.0 2dhh9vsp39.adobestats.io
0.0.0.0 rb0u8l34kr.adobestats.io
0.0.0.0 3odrrlydxt.adobestats.io
0.0.0.0 3u6k9as4bj.adobestats.io
0.0.0.0 curbpindd3.adobestats.io
0.0.0.0 4dviy9tb3o.adobestats.io
0.0.0.0 yb6j6g0r1n.adobestats.io
0.0.0.0 0bj2epfqn1.adobestats.io
0.0.0.0 ura7zj55r9.adobestats.io
0.0.0.0 xesnl0ss94.adobestats.io
0.0.0.0 xbd20b9wqa.adobestats.io
0.0.0.0 cr2fouxnpm.adobestats.io
0.0.0.0 zmg3v61bbr.adobestats.io
0.0.0.0 bk7y1gneyk.adobestats.io
0.0.0.0 dx0nvmv4hz.adobestats.io
0.0.0.0 eyiu19jd5w.adobestats.io
0.0.0.0 561r5c3bz1.adobestats.io
0.0.0.0 54cu4v5twu.adobestats.io
0.0.0.0 6eidhihhci.adobestats.io
0.0.0.0 31q40256l4.adobestats.io
0.0.0.0 bs2yhuojzm.adobestats.io
0.0.0.0 p50zgina3e.adobestats.io
0.0.0.0 yri0bsu0ak.adobestats.io
0.0.0.0 zu8yy3jkaz.adobestats.io
0.0.0.0 m59cps6x3n.adobestats.io
0.0.0.0 kgj0gsg3cf.adobestats.io
0.0.0.0 uf0onoepoe.adobestats.io
0.0.0.0 28t4psttw7.adobestats.io
0.0.0.0 hjs70w1pdi.adobestats.io
0.0.0.0 klw4np5a1x.adobestats.io
0.0.0.0 lz2x4rks1u.adobestats.io
0.0.0.0 pc6sk9bygv.adobestats.io
0.0.0.0 t9phy8ywkd.adobestats.io
0.0.0.0 dfnm3epsb7.adobestats.io
0.0.0.0 5ky0dijg73.adobestats.io
0.0.0.0 124hzdrtoi.adobestats.io
0.0.0.0 69rxfbohle.adobestats.io
0.0.0.0 9uffo0j6wj.adobestats.io
0.0.0.0 kwi5n2ruax.adobestats.io
0.0.0.0 nh8wam2qd9.adobestats.io
0.0.0.0 rm3xrk61n1.adobestats.io
0.0.0.0 rmnia8d0tr.adobestats.io
0.0.0.0 vrz9w7o7yv.adobestats.io
0.0.0.0 5m62o8ud26.adobestats.io
0.0.0.0 esx6aswt5e.adobestats.io
0.0.0.0 hwfqhlenbg.adobestats.io
0.0.0.0 je5ufnklzs.adobestats.io
0.0.0.0 jmx50quqz0.adobestats.io
0.0.0.0 jsxfc5yij1.adobestats.io
0.0.0.0 vfsjlgw02v.adobestats.io
0.0.0.0 yshuhythub.adobestats.io
0.0.0.0 zrbzvc9mel.adobestats.io
0.0.0.0 rj669kv2lc.adobestats.io
0.0.0.0 agxqobl83f.adobestats.io
0.0.0.0 zr60t8ia88.adobestats.io
0.0.0.0 a1y2b7wsna.adobestats.io
0.0.0.0 hf6s5jdv95.adobestats.io
0.0.0.0 tprqy2lgua.adobestats.io
0.0.0.0 c474kdh1ky.adobestats.io
0.0.0.0 d101mw99xq.adobestats.io
0.0.0.0 oh41yzugiz.adobestats.io
0.0.0.0 jwonv590qs.adobestats.io
0.0.0.0 7k1t5im229.adobestats.io
0.0.0.0 3xuuprv9lg.adobestats.io
0.0.0.0 9wm8di7ifk.adobestats.io
0.0.0.0 ebvf40engd.adobestats.io
0.0.0.0 hq0mnwz735.adobestats.io
0.0.0.0 j134yk6hv5.adobestats.io
0.0.0.0 j14y4uzge7.adobestats.io
0.0.0.0 jye4987hyr.adobestats.io
0.0.0.0 kvi8uopy6f.adobestats.io
0.0.0.0 lv5yrjxh6i.adobestats.io
0.0.0.0 m95pt874uw.adobestats.io
0.0.0.0 pdb7v5ul5q.adobestats.io
0.0.0.0 px8vklwioh.adobestats.io
0.0.0.0 qmyqpp3xs3.adobestats.io
0.0.0.0 r1lqxul5sr.adobestats.io
0.0.0.0 tf3an24xls.adobestats.io
0.0.0.0 tyradj47rp.adobestats.io
0.0.0.0 vp7ih9xoxg.adobestats.io
0.0.0.0 x5cupsunjc.adobestats.io
0.0.0.0 ll8xjr580v.adobestats.io
0.0.0.0 n0yaid7q47.adobestats.io
0.0.0.0 nhs5jfxg10.adobestats.io
0.0.0.0 wz8kjkd9gc.adobestats.io
0.0.0.0 zfzx6hae4g.adobestats.io
0.0.0.0 zu8yy3jkazad.adobestats.io >> C:\Windows\System32\drivers\etc\hosts
netsh advfirewall firewall add rule name="Block Outbound TrafficAD" dir=out action=block program="C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"
netsh advfirewall firewall add rule name="Block Outbound TrafficAGS" dir=out action=block program="C:\Program Files (x86)\Common Files\Adobe\Adobe Desktop Common\AdobeGenuineClient\AGSService.exe"
