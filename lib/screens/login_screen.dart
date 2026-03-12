import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              'مرحباً بك في فلكس يمن',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 10),
            const Text('اختر نوع الحساب للمتابعة', style: TextStyle(color: Colors.grey)),
            
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // بطاقة تسجيل دخول كعميل
                    _AccountTypeCard(
                      title: 'تسجيل دخول كعميل',
                      subtitle: 'تصفح، اشتري، وشارك في المزادات',
                      icon: Icons.person_pin_rounded,
                      route: '/home', // أو صفحة دخول العميل المخصصة
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // بطاقة تسجيل دخول كتاجر
                    _AccountTypeCard(
                      title: 'تسجيل دخول كتاجر',
                      subtitle: 'أضف إعلاناتك، بع منتجاتك، وتابع أرباحك',
                      icon: Icons.store_rounded,
                      route: '/merchant',
                      isMerchant: true,
                    ),
                  ],
                ),
              ),
            ),
            
            // خيار الدخول كضيف في الأسفل
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('تصفح كضيف الآن', style: TextStyle(color: Colors.black54, fontSize: 16)),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_ios, size: 14, color: AppTheme.goldColor),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountTypeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String route;
  final bool isMerchant;

  const _AccountTypeCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.route,
    this.isMerchant = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isMerchant ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isMerchant ? AppTheme.goldColor : Colors.black12,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, color: isMerchant ? Colors.black : Colors.black, size: 30),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold, 
                      color: isMerchant ? Colors.white : Colors.black
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12, 
                      color: isMerchant ? Colors.white70 : Colors.grey
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
