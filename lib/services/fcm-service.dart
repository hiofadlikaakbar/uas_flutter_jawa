import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'default_channel',
  'Default Notification',
  description: 'Channel untuk FCM',
  importance: Importance.high,
);

Future<void> setupFcm() async {
  final messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('Status permission: ${settings.authorizationStatus}');

  if (settings.authorizationStatus == AuthorizationStatus.denied) {
    print("User menolak permission notifikasi");
    return;
  }

  //permintaan token untuk test di backend
  String? token = await messaging.getToken();
  print("FCM TOKEN: $token");
}
