# space_app

## Any Problem? So Use This Command

```bash
flutter clean
rm -Rf ios/Pods
rm -Rf ios/.symlinks
rm -Rf ios/Flutter/Flutter.framework
rm -Rf ios/Flutter/Flutter.podspec
rm -Rf ios/Podfile.lock
pod cache clean --all
flutter pub get
cd ios
arch -x86_64 pod install
cd ..
flutter build ios
```

## Run build watcher

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```
