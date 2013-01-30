@echo off
set PAUSE_ERRORS=1
"C:\Program Files (x86)\Adobe\Adobe Flash Builder 4.5\sdks\4.6_3.4\bin\adl.exe" -runtime "C:\Program Files (x86)\Adobe\Adobe Flash Builder 4.5\sdks\4.6_3.4\runtimes\air\win" -profile mobileDevice -screensize 640x920:640x960 -XscreenDPI 326 -XversionPlatform IOS D:\devenderData\NewFriend\FaceOff\bin-debug\FaceOff-app.xml D:\devenderData\NewFriend\FaceOff\bin-debug -extdir D:\devenderData\NewFriend\FaceOff\ext\ -nodebug

::"C:\Program Files (x86)\Adobe\Adobe Flash Builder 4.5\sdks\4.6_3.2\bin\adt.exe" -package -target apk -storetype pkcs12 -keystore D:\devenderData\NewFriend\FaceOff\cert\AndroidCertificate.p12 FaceOff.apk FaceOff-app.xml -extdir D:\devenderData\NewFriend\FaceOff\ext\

::"C:\Program Files (x86)\Adobe\Adobe Flash Builder 4.5\sdks\4.6_3.2\bin\adt.exe" -package -target ios -storetype pkcs12 -keystore D:\devenderData\NewFriend\FaceOff\cert\AndroidCertificate.p12 FaceOff.apk FaceOff-app.xml -extdir D:\devenderData\NewFriend\FaceOff\ext\
pause