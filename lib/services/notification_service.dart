import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static Future<void> initialize() async {
    await AwesomeNotifications().initialize(
      null, // استخدام أيقونة التطبيق الافتراضية
      [
        NotificationChannel(
          channelKey: 'flex_alerts',
          channelName: 'تنبيهات فلكس',
          channelDescription: 'إشعارات العمليات المالية والعروض',
          defaultColor: const Color(0xFFD4AF37),
          ledColor: Colors.white,
          importance: NotificationImportance.High,
        )
      ],
    );
  }

  static Future<void> showPaymentNotification(double amount, String type) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'flex_alerts',
        title: type == 'deposit' ? '✅ تم الإيداع بنجاح' : '💸 تم خصم مبلغ',
        body: 'المبلغ: $amount ريال يمني. تفقد محفظتك الآن.',
        notificationLayout: NotificationLayout.Default,
        backgroundColor: const Color(0xFFD4AF37),
      ),
    );
  }
}
