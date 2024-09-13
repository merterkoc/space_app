import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:space_app/app.dart';
import 'package:space_app/app_initialize.dart';
import 'package:space_app/src/feature/settings/settings_controller.dart';
import 'package:space_app/src/feature/settings/settings_service.dart';
import 'package:space_app/src/ui/space_ui.dart';
import 'login_screen.dart';

final settingsController = SettingsController(SettingsService());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AppInitializationService.initialize();
  runApp(const SpaceApp());
}

class SpaceApp extends StatelessWidget {
  const SpaceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), 
    );
  }
}