@echo off
set PAUSE_ERRORS=1
cd "F:\work\DonFaceOffNew\donfaceoff\source\bin-debug"
"C:\Program Files\Adobe\Adobe Flash Builder 4.6\sdks\flex_sdk_4.6.0.23201\bin\adt" -package -target ipa-app-store -storetype pkcs12 -storepass mangogames -keystore F:\work\rummy\Rummy-Flash\AS3\Rummy_Restruchered\SocialRummyAndroid\cert\Distribution_Certificates(IOS).p12 -provisioning-profile F:\work\DonFaceOffNew\donfaceoff\source\cert\MumbaiMobsters.mobileprovision MumbaiMobsters.ipa FaceOff-app.xml -C F:\work\DonFaceOffNew\donfaceoff\source\bin-debug assets\xml assets\icons assets\images FaceOff.swf -extdir F:\work\DonFaceOffNew\donfaceoff\source\packagedExtensions
pause