import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/map_screen.dart';
import '../screens/store_screen.dart';
import '../screens/add_ad_screen.dart';
import '../screens/wallet_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/settings_screen.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_nav_bar.dart';
import '../theme/app_theme.dart';

class MainNavigation extends StatefulWidget {
  final bool isDarkMode;
  final int cartCount;
  final VoidCallback onThemeToggle;
  final VoidCallback onAddToCart;

  const MainNavigation({
    super.key,
    required this.isDarkMode,
    required this.cartCount,
    required this.onThemeToggle,
    required this.onAddToCart,
  });

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeScreen(),
      const MapScreen(),
      StoreScreen(onAdd: widget.onAddToCart),
      const AddAdScreen(),
      const WalletScreen(),
      const ChatScreen(),
      const ProfileScreen(),
      const SettingsScreen(),
    ];
  }

  void _onSettingsPressed() => setState(() => _currentIndex = 7);
  void _onAddAdPressed() => setState(() => _currentIndex = 3);
  void _onNavTap(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isDarkMode: widget.isDarkMode,
        cartCount: widget.cartCount,
        onThemeToggle: widget.onThemeToggle,
        onSettingsPressed: _onSettingsPressed,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        isDarkMode: widget.isDarkMode,
        onTap: _onNavTap,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAddAdPressed,
        backgroundColor: AppTheme.goldColor,
        elevation: 8,
        shape: const CircleBorder(),
        child: const Icon(Icons.add_rounded, color: Colors.black, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
