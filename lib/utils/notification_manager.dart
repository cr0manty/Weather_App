import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationManager {
  static final NotificationManager instance = NotificationManager._internal();
  final StreamController<Map> _onMessage = StreamController<Map>.broadcast();

  Stream<Map> get onMessage => _onMessage.stream;


  NotificationManager._internal();

  FirebaseMessaging _fcm;

  Future configure() async {
    _fcm = FirebaseMessaging();
    await _fcm.requestNotificationPermissions();

    _fcm.onTokenRefresh.listen((token) async {
      print('FCM Token: $token');
    });

    _fcm.configure(
      onMessage: _onMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  Future<String> getToken() {
    return _fcm.getToken();
  }

  Future _onMessageHandler(Map<String, dynamic> message) async {
    print("onMessage: $message");

    if (message.containsKey('data')) {
      _onMessage.add(message);
    }
  }

  void dispose() {
    _onMessage?.close();
  }
}