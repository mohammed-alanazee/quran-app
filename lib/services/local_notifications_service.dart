import 'dart:io' show Platform;
import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

// ignore: constant_identifier_names
const channel_id = '1';
List<String> ayahs = [
  'إِنَّ مَعَ الْعُسْرِ يُسْرًا',
  'وَذَكِّرْ فَإِنَّ الذِّكْرَىٰ تَنفَعُ الْمُؤْمِنِينَ',
  'وَإِذَا سَأَلَكَ عِبَادِي عَنِّي فَإِنِّي قَرِيبٌ',
  'فَاذْكُرُونِي أَذْكُرْكُمْ وَاشْكُرُوا لِي وَلَا تَكْفُرُونِ',
  'الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُمْ بِذِكْرِ اللَّهِ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ',
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
    scheduleDaily10Notification();
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

  Future<void> scheduleDaily10Notification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      ayahs[Random().nextInt(ayahs.length - 1)],
      '',
      _nextInstanceOfTenAM(),
      const NotificationDetails(
        // android
        android: AndroidNotificationDetails(
          channel_id,
          'Quran App',
          importance: Importance.max,
          priority: Priority.max,
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

  tz.TZDateTime _nextInstanceOfTenAM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      10,
    );
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(seconds: 1));
    }
    return scheduledDate;
  }
}
