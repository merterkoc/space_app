import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:space_app/src/firebase/notification.dart';

class AppInitializationService {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await settingsController.loadSettings();
    await Firebase.initializeApp();
    NotificationService().init();
  }

  AppInitializationService._();
}