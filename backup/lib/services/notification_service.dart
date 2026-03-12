import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class NotificationService {
  static Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
      null, // استخدام الأيقونة الافتراضية
      [
        NotificationChannel(
          channelKey: 'flex_alerts',
          channelName: 'تنبيهات فلكس',
          channelDescription: 'إشعارات المزادات والعمليات المالية',
          defaultColor: AppTheme.goldColor,
          ledColor: Colors.white,
          importance: NotificationImportance.High,
        )
      ],
      debug: true,
    );
  }

  static Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'flex_alerts',
        title: title,
        body: body,
        notificationLayout: NotificationLayout.Default,
      ),
    );
  }
}
