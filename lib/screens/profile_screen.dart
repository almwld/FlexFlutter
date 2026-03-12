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
            const Divider(),
            _buildMenuItem(Icons.security, 'الأمان والخصوصية', () => Navigator.pushNamed(context, '/security')),
            _buildMenuItem(Icons.policy_outlined, 'سياسة الخصوصية', () => Navigator.pushNamed(context, '/privacy')),
            _buildMenuItem(Icons.help_outline, 'المساعدة والدعم', () => Navigator.pushNamed(context, '/support')),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
              child: const Text('تسجيل الخروج', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
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
          const CircleAvatar(radius: 35, backgroundColor: AppTheme.goldColor, child: Icon(Icons.person, size: 35, color: Colors.black)),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('مستخدم فلكس', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('77XXXXXXX', style: TextStyle(color: Colors.grey)),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('الرصيد الحالي', style: TextStyle(color: Colors.black54)),
              Text('150,000 ريال', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/wallet'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white),
            child: const Text('المحفظة'),
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.goldColor),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: onTap,
    );
  }
}
