import 'package:flutter/material.dart';
import 'package:space_app/main.dart';
import 'package:space_app/router.dart';
import 'package:space_app/src/theme/color_theme.dart';
import 'package:space_app/src/theme/text_theme.dart';

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          theme: ThemeData.light(useMaterial3: true).copyWith(
            colorScheme: CustomColorScheme.light(),
            textTheme: SpaceTextTheme().lightTextTheme,
          ),
          darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
            colorScheme: CustomColorScheme.dark(),
            textTheme: SpaceTextTheme().darkTextTheme,
          ),
          themeMode: settingsController.themeMode,
          title: 'Space',
          routerConfig: goRouter,
        );
      },
    );
  }
}
