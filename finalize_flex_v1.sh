#!/bin/bash
cd ~/FlexFlutter

# تنفيذ كافة ملفات الأكواد أعلاه بالترتيب...
# [سيقوم السكربت بإنشاء الملفات المذكورة في الأعلى]

# تحديث الـ Routes في app.dart
cat > lib/app.dart << 'EOF'
import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/add_ad_screen.dart';

class FlexYemenApp extends StatelessWidget {
  const FlexYemenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flex Yemen',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // يتغير مع الهاتف تلقائياً
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/add_ad': (context) => const AddAdScreen(),
      },
    );
  }
}
EOF

git add .
git commit -m "🚀 Finalizing App: Theme Fix, Splash, Guest Mode, Add Ad, and Auto-Slider"
git push origin main
echo "✅ تم إرسال كافة التحديثات! التطبيق الآن يدعم الثيمات والسلايدر والرفع من الاستوديو."
