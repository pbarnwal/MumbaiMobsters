@echo off
set PAUSE_ERRORS=1
cd "F:\work\Don FaceOff(New)\don-faceoff-master\source\bin-debug"
"C:\Program Files\Adobe\Adobe Flash Builder 4.6\sdks\flex_sdk_4.6.0.23201\bin\adt" -package -target ipa-debug -storetype pkcs12 -storepass mangogames -keystore F:\work\Don FaceOff(New)\don-faceoff-master\source\cert\Don_FaceOff_10-06-2012.p12 -provisioning-profile F:\work\Don FaceOff(New)\don-faceoff-master\source\cert\FaceOff.mobileprovision DonFaceOff.ipa FaceOff-app.xml -C F:\work\Don FaceOff(New)\don-faceoff-master\source\bin-debug assets\xml assets\icons assets\images FaceOff.swf -extdir F:\work\Don FaceOff(New)\don-faceoff-master\source\packagedExtensions
pause