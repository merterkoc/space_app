import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:space_app/main.dart';
import 'package:space_app/src/bloc/astronomic_event_bloc.dart';
import 'package:space_app/src/route/router.dart';
import 'package:space_app/src/theme/color_theme.dart';
import 'package:space_app/src/theme/text_theme.dart';

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => AstronomicEventBloc()),
      ],
      child: ListenableBuilder(
        listenable: settingsController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            backButtonDispatcher: goRouter.backButtonDispatcher,
            routeInformationProvider: goRouter.routeInformationProvider,
            routeInformationParser: goRouter.routeInformationParser,
            routerDelegate: goRouter.routerDelegate,
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
          );
        },
      ),
    );
  }
}
