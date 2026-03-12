import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Widget _buildSettingTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.goldColor),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          "الإعدادات",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        _buildSettingTile(Icons.notifications_outlined, "الإشعارات", () {}),
        _buildSettingTile(Icons.security_outlined, "الأمان والخصوصية", () {}),
        _buildSettingTile(Icons.language_outlined, "اللغة", () {}),
        _buildSettingTile(Icons.payment_outlined, "طرق الدفع", () {}),
        _buildSettingTile(Icons.help_outline, "المساعدة والدعم", () {}),
        _buildSettingTile(Icons.info_outline, "عن التطبيق", () {}),
      ],
    );
  }
}
