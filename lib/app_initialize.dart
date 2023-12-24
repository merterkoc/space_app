import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:space_app/main.dart';
import 'package:space_app/src/cache/shared_preferences.dart';
import 'package:space_app/src/firebase/notification.dart';
import 'package:space_app/src/handlers/location_handler.dart';

class AppInitializationService {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Load the user's preferred theme while the splash screen is displayed.
    // This prevents a sudden theme change when the app is first displayed.
    await Shared().init();
    await settingsController.loadSettings();
    await Firebase.initializeApp();
    NotificationService().init();
    await LocationHandler().initialize();
  }

  AppInitializationService._();
}
