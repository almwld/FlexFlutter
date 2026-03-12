import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'cart_badge.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDarkMode;
  final int cartCount;
  final VoidCallback onThemeToggle;
  final VoidCallback onSettingsPressed;

  const CustomAppBar({
    super.key,
    required this.isDarkMode,
    required this.cartCount,
    required this.onThemeToggle,
    required this.onSettingsPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.settings_outlined, color: AppTheme.goldColor),
        onPressed: onSettingsPressed,
        tooltip: 'الإعدادات',
      ),
      title: const Center(
        child: Text(
          "FLEX YEMEN",
          style: TextStyle(
            color: AppTheme.goldColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontSize: 20,
          ),
        ),
      ),
      actions: [
        CartBadge(count: cartCount),
        IconButton(
          icon: Icon(
            isDarkMode ? Icons.wb_sunny_outlined : Icons.nights_stay_outlined,
            color: AppTheme.goldColor,
          ),
          onPressed: onThemeToggle,
          tooltip: isDarkMode ? 'الوضع النهاري' : 'الوضع الليلي',
        ),
      ],
    );
  }
}
