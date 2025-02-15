# Starion

### Rename App ID

```
flutter pub run change_app_package-name:main com.stardev.starion
```


### SHA-256

This commands work better wi Java Version 17 or 11

```
cd android
./gradlew signingReport
```

Set android PATH variable (temporary)

```
export JAVA_HOME=$(/usr/libexec/java_home -v 11)
```

## Add Google API KEY for Android  

```
android/gradle.properties
API_KEY=YOUR_API_KEY
```

## Add Google API KEY for iOS 

```
ios/Keys.xcconfig
API_KEY=YOUR_API_KEY
```