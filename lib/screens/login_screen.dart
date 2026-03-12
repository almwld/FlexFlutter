import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.black, Colors.grey[900]!, Colors.black],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 60),
                // الشعار الذهبي
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme.goldColor, width: 2),
                  ),
                  child: const Icon(Icons.shopping_bag_outlined, size: 80, color: AppTheme.goldColor),
                ),
                const SizedBox(height: 20),
                const Text('FLEX YEMEN', style: TextStyle(color: AppTheme.goldColor, fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: 4)),
                const Text('السوق اليمني المتكامل', style: TextStyle(color: Colors.white70, fontSize: 14)),
                const Spacer(),
                
                // زر الدخول كضيف (أولاً لإعطاء حرية للمستخدم)
                _buildGuestButton(context),
                const SizedBox(height: 20),
                
                // أزرار تسجيل الدخول
                _buildLoginButton(context),
                const SizedBox(height: 15),
                
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[800])),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Text('أو', style: TextStyle(color: Colors.grey))),
                    Expanded(child: Divider(color: Colors.grey[800])),
                  ],
                ),
                const SizedBox(height: 15),
                _buildSocialButton(Icons.phone, 'التسجيل عبر رقم الهاتف'),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGuestButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppTheme.goldColor),
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: const Text('التصفح كضيف', style: TextStyle(color: AppTheme.goldColor, fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.goldColor,
        foregroundColor: Colors.black,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: const Text('تسجيل الدخول', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildSocialButton(IconData icon, String text) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white70),
      label: Text(text, style: const TextStyle(color: Colors.white70)),
    );
  }
}
