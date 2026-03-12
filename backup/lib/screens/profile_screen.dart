import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("حسابي")),
      body: ListView(
        children: [
          _buildWalletCard(context),
          _buildMenuTile(Icons.notifications, "الإشعارات"),
          _buildMenuTile(Icons.security, "الأمان"),
          _buildMenuTile(Icons.payment, "طرق الدفع"),
          _buildMenuTile(Icons.help, "الدعم والمساعدة"),
          _buildMenuTile(Icons.info, "عن التطبيق"),
          _buildMenuTile(Icons.logout, "تسجيل الخروج", isRed: true),
        ],
      ),
    );
  }

  Widget _buildWalletCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppTheme.goldColor, borderRadius: BorderRadius.circular(15)),
      child: const Column(
        children: [
          Text("الرصيد المحفظة", style: TextStyle(color: Colors.black)),
          Text("150,000 YR", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildMenuTile(IconData icon, String title, {bool isRed = false}) {
    return ListTile(
      leading: Icon(icon, color: isRed ? Colors.red : AppTheme.goldColor),
      title: Text(title, style: TextStyle(color: isRed ? Colors.red : null)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
