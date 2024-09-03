import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:space_app/main.dart';
import 'package:space_app/src/bloc/astronomic_event_bloc.dart';
import 'package:space_app/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:space_app/src/bloc/user_bloc/user_bloc.dart';
import 'package:space_app/src/route/router.dart';
import 'package:space_app/src/ui/component/button/small_button.dart';
import 'package:space_app/src/util/extensions/theme_extension.dart';

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(lazy: true, create: (context) => AuthenticationBloc()),
        BlocProvider(create: (context) => AstronomicEventBloc()),
        BlocProvider(create: (context) => UserBloc()),
      ],
      child: ListenableBuilder(
        listenable: settingsController,
        builder: (BuildContext context, Widget? child) {
          return CupertinoApp.router(
            backButtonDispatcher: goRouter.backButtonDispatcher,
            routeInformationProvider: goRouter.routeInformationProvider,
            routeInformationParser: goRouter.routeInformationParser,
            routerDelegate: goRouter.routerDelegate,
            theme: CupertinoThemeData(
              primaryColor: context.myThemeColors.primaryColor,
              brightness: settingsController.themeMode,
            ),
            title: 'Space',
          );
        },
      ),
    );
  }
}
