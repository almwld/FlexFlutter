import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المساعدة والدعم')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Center(
            child: Icon(Icons.support_agent, size: 80, color: AppTheme.goldColor),
          ),
          const SizedBox(height: 20),
          const Text(
            'كيف يمكننا مساعدتك اليوم؟',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          _buildSupportTile(
            Icons.chat_bubble_outline, 
            'تحدث معنا عبر واتساب', 
            'رد سريع ومباشر على استفساراتك',
            () => launchUrl(Uri.parse('https://wa.me/967770000000'))
          ),
          _buildSupportTile(
            Icons.phone_in_talk_outlined, 
            'اتصل بنا', 
            'الدعم الفني متاح 24/7',
            () => launchUrl(Uri.parse('tel:967770000000'))
          ),
          _buildSupportTile(
            Icons.email_outlined, 
            'البريد الإلكتروني', 
            'للمقترحات والشكاوى الرسمية',
            () {}
          ),
          const SizedBox(height: 20),
          const Divider(),
          const Text('الأسئلة الشائعة', style: TextStyle(fontWeight: FontWeight.bold)),
          const ExpansionTile(
            title: Text('كيف يمكنني شحن المحفظة؟'),
            children: [Padding(padding: EdgeInsets.all(15), child: Text('يمكنك الشحن عبر مكاتب الكريمي أو عبر التحويل المباشر لخدمة فلكس.'))],
          ),
        ],
      ),
    );
  }

  Widget _buildSupportTile(IconData icon, String title, String sub, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.goldColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(sub, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
        onTap: onTap,
      ),
    );
  }
}
