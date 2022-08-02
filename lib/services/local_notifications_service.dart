import 'dart:io' show Platform;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

// ignore: constant_identifier_names
const channel_id = '1';
List<String> athkar = [
  'سبحان الله وبحمده',
  'استغفر الله العظيم',
  'لا إله إلا الله'
];

class LoaclNotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final LoaclNotificationService _loaclNotificationService =
      LoaclNotificationService._internal();
  factory LoaclNotificationService() {
    return _loaclNotificationService;
  }
  LoaclNotificationService._internal();
  Future<void> init() async {
    if (Platform.isIOS) {
      requestIOSPermission();
    }
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    _initializeLocalNotificationPlugin(initializationSettings);
    tz.initializeTimeZones();
    scheduleDailyNotification(athkar[0], _scheduleTime(10));
    scheduleDailyNotification(athkar[1], _scheduleTime(20));
    scheduleDailyNotification(athkar[2], _scheduleTime(15));
    scheduleDailyNotification(athkar[0], _scheduleTime(2));
  }

  void _initializeLocalNotificationPlugin(
      InitializationSettings initializationSettings) async {
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  requestIOSPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()!
        .requestPermissions(alert: true, badge: true, sound: true);
  }

  Future<void> scheduleDailyNotification(String thekr, hour) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      thekr,
      '',
      hour,
      const NotificationDetails(
        // android
        android: AndroidNotificationDetails(
          channel_id,
          'القرآن الكريم',
          importance: Importance.high,
          priority: Priority.high,
        ),
        // ios
        iOS: IOSNotificationDetails(
          sound: 'default.wav',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  Future<void> cancelAll() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  tz.TZDateTime _scheduleTime(int hour) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
    );
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(seconds: 1));
    }
    return scheduledDate;
  }
}
