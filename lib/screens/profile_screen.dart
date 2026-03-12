import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حسابي')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildWalletCard(context),
            _buildSectionTitle('الإعدادات العامة'),
            _buildMenuItem(Icons.notifications_active, 'الإشعارات', () {}),
            _buildMenuItem(Icons.security, 'الأمان والخصوصية', () {}),
            _buildMenuItem(Icons.language, 'اللغة', () {}),
            _buildMenuItem(Icons.payment, 'طرق الدفع', () {}),
            _buildSectionTitle('عن التطبيق'),
            _buildMenuItem(Icons.info_outline, 'عن فلكس يمن', () {}),
            _buildMenuItem(Icons.policy_outlined, 'سياسة التطبيق', () {}),
            _buildMenuItem(Icons.help_outline, 'المساعدة والدعم', () {}),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text('تسجيل الخروج', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          const CircleAvatar(radius: 40, backgroundColor: AppTheme.goldColor, child: Icon(Icons.person, size: 40)),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('مستخدم تجريبي', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('778898765', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWalletCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.goldColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: const [
              Text('رصيد المحفظة', style: TextStyle(color: Colors.black54)),
              Text('150,000 ريال', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/wallet'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: const Text('تفاصيل'),
          )
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Align(alignment: Alignment.centerRight, child: Text(title, style: const TextStyle(color: AppTheme.goldColor, fontWeight: FontWeight.bold))),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.goldColor),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
