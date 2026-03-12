import 'map_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';       // المنصة (فلكس يمن)
import 'wallet_screen.dart';     // المحفظة
import 'add_ad_screen.dart';      // رفع منتج
import 'profile_detail_screen.dart';
import 'service_details.dart';
import '../theme/app_theme.dart';

class MainParentScreen extends StatefulWidget {
  const MainParentScreen({super.key});

  @override
  State<MainParentScreen> createState() => _MainParentScreenState();
}

class _MainParentScreenState extends State<MainParentScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),               // 0: المنصة
    const GenericServicePage(title: 'الأقسام'), // 1
    const WalletScreen(),             // 2: المحفظة
    const AddAdScreen(),              // 3: رفع منتج
    const GenericServicePage(title: 'الدردشة'), // 4
    const GenericServicePage(title: 'الخرائط'), // 5: (بدلاً من التنبيهات)
    const ProfileDetailScreen(),      // 6: حسابي
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _selectedIndex = 3),
        backgroundColor: AppTheme.goldColor,
        child: const Icon(Icons.add, color: Colors.black, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: const Color(0xFF1E1E1E),
        child: Container(
          height: 65,
          child: Row(
            children: [
              // الجهة اليمنى
              Expanded(child: _buildNavItem(Icons.store, 'المنصة', 0)),
              Expanded(child: _buildNavItem(Icons.grid_view, 'الأقسام', 1)),
              Expanded(child: _buildNavItem(Icons.account_balance_wallet, 'المحفظة', 2)),
              
              const SizedBox(width: 45), // فراغ زر الرفع
              
              // الجهة اليسرى
              Expanded(child: _buildNavItem(Icons.chat_bubble_outline, 'دردشة', 4)),
              Expanded(child: _buildNavItem(Icons.map_outlined, 'خرائط', 5)), // تم التعديل هنا
              Expanded(child: _buildNavItem(Icons.person_outline, 'حسابي', 6)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => setState(() => _selectedIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? AppTheme.goldColor : Colors.grey, size: 22),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppTheme.goldColor : Colors.grey,
              fontSize: 8.5,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
