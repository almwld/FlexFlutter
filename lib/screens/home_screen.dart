import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('فلكس يمن', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.goldColor)),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('مرحباً بك في منصة العميل - قيد التطوير'),
      ),
    );
  }
}
