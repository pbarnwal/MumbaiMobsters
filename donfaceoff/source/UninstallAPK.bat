@echo off
set PAUSE_ERRORS=1
cd "D:\devenderData\NewFriend\FaceOff\bin-debug"
echo "Uninstalling app..."
"C:\Program Files (x86)\Adobe\Adobe Flash Builder 4.5\sdks\4.6_3.2\bin\adt" -uninstallApp -platform android -device 001926060d343f -appid com.mangogames.donfaceoff
cd..
pause