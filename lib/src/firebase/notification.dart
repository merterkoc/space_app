import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  factory NotificationService() {
    return _instance;
  }

  static final NotificationService _instance = NotificationService._internal();

  NotificationService._internal();

  Future<void> init() async {
    await _firebaseMessaging.requestPermission();
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    _firebaseMessaging.subscribeToTopic('all');
    final token = await getToken();
    Logger().i('FCM Token: $token');
  }

  Future<String?> getToken() async {
    if (Platform.isIOS) {
      return await _firebaseMessaging.getAPNSToken();
    } else if (Platform.isAndroid) {
      return await _firebaseMessaging.getToken();
    }
    return null;
  }

  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
  }

  Future<void> deleteToken() async {
    await _firebaseMessaging.deleteToken();
  }

  Future<void> onMessage(void Function(RemoteMessage message) callback) async {
    FirebaseMessaging.onMessage.listen(callback);
  }

  Future<void> onMessageOpenedApp(
      void Function(RemoteMessage message) callback) async {
    FirebaseMessaging.onMessageOpenedApp.listen(callback);
  }

  Future<void> onBackgroundMessage(
      void Function(RemoteMessage message) callback) async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) =>
      Future.value();

  Future<void> setForegroundNotificationPresentationOptions({
    bool alert = true,
    bool badge = true,
    bool sound = true,
  }) async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: alert,
      badge: badge,
      sound: sound,
    );
  }

  Future<void> setAutoInitEnabled(bool enabled) async {
    await _firebaseMessaging.setAutoInitEnabled(enabled);
  }
}
