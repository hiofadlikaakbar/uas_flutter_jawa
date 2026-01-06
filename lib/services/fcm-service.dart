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


Future<void> setupFcm() async{
  final messaging = FirebaseMessaging.instance;
  
}