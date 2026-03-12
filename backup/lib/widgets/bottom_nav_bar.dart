import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final bool isDarkMode;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.isDarkMode,
    required this.onTap,
  });

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = currentIndex == index;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTap(index),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? AppTheme.goldColor : Colors.grey,
                size: 24,
              ),
              const SizedBox(height: 3),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? AppTheme.goldColor : Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Cairo',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: isDarkMode ? AppTheme.cardDark : Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      elevation: 8,
      child: Container(
        height: 65,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _buildNavItem(Icons.home_rounded, "الرئيسية", 0),
                _buildNavItem(Icons.map_outlined, "الخرائط", 1),
                _buildNavItem(Icons.storefront_outlined, "المتجر", 2),
              ],
            ),
            Row(
              children: [
                _buildNavItem(Icons.account_balance_wallet_outlined, "المحفظة", 4),
                _buildNavItem(Icons.chat_bubble_outline_rounded, "الدردشة", 5),
                _buildNavItem(Icons.person_outline_rounded, "حسابي", 6),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
