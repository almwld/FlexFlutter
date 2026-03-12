import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool _bioEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الأمان والخصوصية')),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('تفعيل بصمة الإصبع / الوجه'),
            subtitle: const Text('استخدم القياسات الحيوية لفتح المحفظة'),
            value: _bioEnabled,
            activeColor: AppTheme.goldColor,
            onChanged: (val) => setState(() => _bioEnabled = val),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text('تغيير كلمة المرور'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.phonelink_lock),
            title: const Text('الأجهزة المرتبطة'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            title: const Text('حذف الحساب نهائياً', style: TextStyle(color: Colors.red)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
