import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("تسجيل الدخول", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.goldColor, minimumSize: const Size(double.infinity, 50)),
              child: const Text("تسجيل الدخول", style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 15),
            OutlinedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
              style: OutlinedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              child: const Text("تصفح كضيف"),
            ),
          ],
        ),
      ),
    );
  }
}
