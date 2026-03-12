import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // تدرج لوني في الخلفية
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.5,
                  colors: [AppTheme.goldColor.withOpacity(0.1), Colors.black],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.flash_on, size: 80, color: AppTheme.goldColor),
                  const SizedBox(height: 10),
                  const Text('FLEX YEMEN', style: TextStyle(color: AppTheme.goldColor, fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 5)),
                  const Text('بوابتك للتجارة الذكية', style: TextStyle(color: Colors.white54, fontSize: 14)),
                  const SizedBox(height: 60),
                  
                  // زر الدخول كضيف
                  _buildButton(
                    context, 
                    'تصفح كضيف', 
                    Colors.transparent, 
                    AppTheme.goldColor, 
                    () => Navigator.pushReplacementNamed(context, '/home'),
                    isOutlined: true
                  ),
                  const SizedBox(height: 20),
                  
                  // زر تسجيل الدخول
                  _buildButton(
                    context, 
                    'تسجيل الدخول', 
                    AppTheme.goldColor, 
                    Colors.black, 
                    () {}
                  ),
                  
                  const SizedBox(height: 20),
                  const Text('أو سجل عبر', style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 20),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialIcon(Icons.phone),
                      const SizedBox(width: 20),
                      _socialIcon(Icons.g_mobiledata_rounded),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Color bg, Color textColor, VoidCallback onTap, {bool isOutlined = false}) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: textColor,
          side: isOutlined ? BorderSide(color: AppTheme.goldColor) : BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: isOutlined ? 0 : 5,
        ),
        child: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _socialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white24)),
      child: Icon(icon, color: Colors.white, size: 30),
    );
  }
}
