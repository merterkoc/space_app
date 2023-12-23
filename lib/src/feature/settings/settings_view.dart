import 'package:flutter/cupertino.dart';
import 'package:space_app/main.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          // Glue the SettingsController to the theme selection DropdownButton.
          //
          // When a user selects a theme from the dropdown list, the
          // SettingsController is updated, which rebuilds the MaterialApp.
          child: CupertinoPicker(
            itemExtent: 32,

            onSelectedItemChanged: (int index) {
              settingsController.updateThemeMode(Brightness.values[index]);
            },
            children: const [
              Text('Dark'),
              Text('Light'),
            ],
          ),
        ),
      ),
    );
  }
}
