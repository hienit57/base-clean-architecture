
flutter emulators
# iOS
flutter emulators --launch apple_ios_simulator
# Android
flutter emulators --launch Pixel_6_Pro_API_32
flutter run
```



```
flutter run
```



- web

```
flutter build web --web-renderer canvaskit --dart-define=FLUTTER_WEB_CANVASKIT_URL=web/assets/canvaskit/ --release
```

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# pimspoints

* Generate localized keys
Command: flutter pub run easy_localization:generate -S "assets/localization" -f keys -o locale_keys.g.dart

* Generate JsonSeriable
Command: flutter pub run build_runner build --delete-conflicting-outputs

Firebase:
dart pub global activate flutterfire_cli
flutterfire configure

#Web
flutter build web --web-renderer canvaskit

//Build android app:
flutter build appbundle --release

//Upgrade version
flutter pub upgrade --major-versions

//Deploy specific target
firebase target:apply hosting alpha participantbeta
firebase target:apply hosting live pimspoints-330113

installl pod m1: arch -x86_64 pod install

#Alpha
flutter build apk lib/main.dart --debug

#Production
flutter build apk lib/main.dart --release

#Deploy Web
flutter clean
flutter pub get
flutter build web --web-renderer canvaskit --release
firebase deploy

