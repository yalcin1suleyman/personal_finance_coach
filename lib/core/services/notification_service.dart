import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  NotificationService._internal();

  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() => _instance;

  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _plugin.initialize(
      const InitializationSettings(android: androidInit, iOS: iosInit),
    );
    tz.initializeTimeZones();
    _initialized = true;
  }

  Future<void> scheduleRegretReminder({
    required String transactionId,
    required String title,
    required String body,
    required DateTime remindAt,
  }) async {
    await init();
    final scheduleDate = tz.TZDateTime.from(remindAt, tz.local);

    try {
      await _plugin.zonedSchedule(
        _notificationId(transactionId),
        title,
        body,
        scheduleDate,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'reminder_channel',
            'Pişmanlık Hatırlatıcıları',
            channelDescription: 'Giderler için geri bildirim hatırlatmaları',
            importance: Importance.max,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime,
      );
    } on PlatformException catch (error, stackTrace) {
      if (error.code == 'exact_alarms_not_permitted') {
        debugPrint(
          '[NotificationService] Exact alarms not permitted on this device. '
          'Skipping exact scheduling for transaction $transactionId.',
        );
        await _scheduleInexactReminder(
          transactionId: transactionId,
          title: title,
          body: body,
          scheduleDate: scheduleDate,
        );
      } else {
        debugPrint('[NotificationService] Failed to schedule reminder: $error');
        debugPrint('$stackTrace');
      }
    } catch (error, stackTrace) {
      debugPrint('[NotificationService] Unexpected scheduling error: $error');
      debugPrint('$stackTrace');
    }
  }

  Future<void> cancelReminder(String transactionId) async {
    await init();
    try {
      await _plugin.cancel(_notificationId(transactionId));
    } catch (error, stackTrace) {
      debugPrint('[NotificationService] Failed to cancel reminder: $error');
      debugPrint('$stackTrace');
    }
  }

  Future<void> _scheduleInexactReminder({
    required String transactionId,
    required String title,
    required String body,
    required tz.TZDateTime scheduleDate,
  }) async {
    try {
      await _plugin.zonedSchedule(
        _notificationId(transactionId),
        title,
        body,
        scheduleDate,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'reminder_channel_inexact',
            'Pişmanlık Hatırlatıcıları (Tahmini)',
            channelDescription: 'Exact izinleri olmadan planlanan hatırlatmalar',
            importance: Importance.defaultImportance,
            priority: Priority.defaultPriority,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime,
      );
    } catch (error, stackTrace) {
      debugPrint('[NotificationService] Failed to schedule inexact reminder: $error');
      debugPrint('$stackTrace');
    }
  }

  int _notificationId(String transactionId) => transactionId.hashCode & 0x7fffffff;
}




