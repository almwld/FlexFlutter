import 'screens/forgot_password_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/referral_screen.dart';
import 'screens/vip_store_screen.dart';
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
import 'screens/auction_screen.dart';
import 'screens/merchant_dashboard.dart';
import 'screens/order_tracking_screen.dart';
import 'screens/coupons_screen.dart'; // استيراد الكوبونات

class FlexYemenApp extends StatelessWidget {
  const FlexYemenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flex Yemen',
      debugShowCheckedModeBanner: false,
      
      // إعدادات اللغات (الافتراضي عربي)
      locale: const Locale('ar', 'YE'),
      supportedLocales: const [Locale('ar', 'YE'), Locale('en', 'US')],
      
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, 
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/wallet': (context) => const WalletScreen(),
        '/add_ad': (context) => const AddAdScreen(),
        '/map': (context) => const MapScreen(),
        '/privacy': (context) => const PrivacyScreen(),
        '/support': (context) => const SupportScreen(),
        '/security': (context) => const SecurityScreen(),
        '/auctions': (context) => const AuctionScreen(),
        '/merchant': (context) => const MerchantDashboard(),
        '/vip_store': (context) => const VipStoreScreen(),
        '/referral': (context) => const ReferralScreen(),
        '/forgot_password': (context) => const ForgotPasswordScreen(),
        '/tracking': (context) => const OrderTrackingScreen(),
        '/coupons': (context) => const CouponsScreen(), // مسار الكوبونات
      },
    );
  }
}
