import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/add_ad_screen.dart';
import 'screens/map_screen.dart';
import 'screens/privacy_screen.dart';
import 'screens/support_screen.dart';
import 'screens/security_screen.dart';
import 'screens/auction_screen.dart'; // استيراد المزاد

class FlexYemenApp extends StatelessWidget {
  const FlexYemenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flex Yemen',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, 
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/wallet': (context) => const WalletScreen(),
        '/add_ad': (context) => const AddAdScreen(),
        '/map': (context) => const MapScreen(),
        '/privacy': (context) => const PrivacyScreen(),
        '/support': (context) => const SupportScreen(),
        '/security': (context) => const SecurityScreen(),
        '/auctions': (context) => const AuctionScreen(), // إضافة المزاد
      },
    );
  }
}
