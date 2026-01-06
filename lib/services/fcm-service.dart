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
  
  //foreground message(saat aplikasi sedang dilihat)
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("Menerima pesan foreground: ${message.messageId}");

    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null && android != null) {
      try {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: android.smallIcon ?? '@mipmap/ic_launcher',
              importance: Importance.max,
              priority: Priority.high,
              showWhen: true,
            ),
          ),
        );

        print("Notifikasi foreground ditampilkan: ${notification.title}");
      } catch (e) {
        print("Error saat menampilkan notifikasi foreground: $e");
      }
    }
  });

  //background message (saat apk di background)
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("Klik notif dari BACKGROUND");
  });
}
