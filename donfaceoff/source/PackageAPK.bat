@echo off
set PAUSE_ERRORS=1
cd "D:\devenderData\NewFriend\FaceOff\bin-debug"
"C:\Program Files (x86)\Adobe\Adobe Flash Builder 4.5\sdks\4.6_3.4\bin\adt" -package -target apk -storetype pkcs12 -storepass password -keystore D:\devenderData\NewFriend\FaceOff\cert\AndroidCertificate.p12 DonFaceOff.apk FaceOff-app.xml -C D:\devenderData\NewFriend\FaceOff\bin-debug assets\xml assets\icons assets\images FaceOff.swf -extdir D:\devenderData\NewFriend\FaceOff\packagedExtensions
cd..
pause