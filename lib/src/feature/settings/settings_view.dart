import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:space_app/main.dart';
import 'package:space_app/src/common/modal/action_sheet.dart';

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
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          // Glue the SettingsController to the theme selection DropdownButton.
          //
          // When a user selects a theme from the dropdown list, the
          // SettingsController is updated, which rebuilds the MaterialApp.
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Theme'),
                  CupertinoButton(
                    onPressed: () {
                      CupertinoAction.show(context,
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              context.pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          actions: [
                            CupertinoActionSheetAction(
                              onPressed: () {
                                settingsController
                                    .updateThemeMode(Brightness.light);
                                context.pop();
                              },
                              child: const Text('Light'),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                settingsController
                                    .updateThemeMode(Brightness.dark);
                                context.pop();
                              },
                              child: const Text('Dark'),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                settingsController
                                    .setDefaultThemeMode();
                                context.pop();
                              },
                              child: const Text('System'),
                            ),
                          ],
                          title: const Text('Select Theme'));
                    },
                    child: const Text('Change '),
                  ),
                ],
              )
              // CupertinoPicker(
              //   itemExtent: 32,
              //
              //   onSelectedItemChanged: (int index) {
              //     settingsController.updateThemeMode(Brightness.values[index]);
              //   },
              //   children: const [
              //     Text('Dark'),
              //     Text('Light'),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
