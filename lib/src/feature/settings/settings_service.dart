import 'package:flutter/cupertino.dart';
import 'package:space_app/src/cache/shared_preferences.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<Brightness> themeMode() async {
    final theme = await Shared().getInt('theme');
    if (theme == null || theme.isNegative || theme > Brightness.values.length) {
      return WidgetsBinding.instance.platformDispatcher.platformBrightness;
    }
    return Brightness.values[theme];
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(Brightness theme) async {
    Shared().setInt('theme', theme.index);
  }

  void updateDefaultThemeMode() {
    Shared().remove('theme');
  }
}
