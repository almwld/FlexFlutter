import 'package:flutter/material.dart';
import '../services/supabase_service.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = SupabaseService.currentUser;
    return Scaffold(
      appBar: AppBar(title: const Text('معلومات حسابي')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
          ListTile(title: const Text('البريد الإلكتروني'), subtitle: Text(user?.email ?? 'ضيف')),
          const ListTile(title: Text('رقم الهاتف'), subtitle: Text('+967 77XXXXXXX')),
          const ListTile(title: Text('المدينة'), subtitle: Text('صنعاء')),
          const Divider(),
          ElevatedButton(onPressed: () => SupabaseService.signOut(), child: const Text('تسجيل الخروج')),
        ],
      ),
    );
  }
}
