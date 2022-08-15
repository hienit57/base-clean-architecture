# base_clean_architecture

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

Generate localized keys
flutter pub run easy_localization:generate -S "assets/localizations" -f keys -o locale_keys.g.dart

Generate file \*.g.dart:
flutter pub run build_runner build --delete-conflicting-outputs

//Build android app:

#Alpha
flutter build appbundle --flavor alpha -t lib/main_alpha.dart --debug
flutter build apk --flavor alpha -t lib/main_alpha.dart --debug

#Production
flutter build appbundle --flavor production -t lib/main_production.dart --release
flutter build apk --flavor production -t lib/main_production.dart --release

#Web
flutter build web --web-renderer canvaskit
