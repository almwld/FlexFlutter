import '../widgets/search_filters.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/main_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('فلكس يمن', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
          IconButton(icon: const Icon(Icons.tune), onPressed: () { showModalBottomSheet(context: context, isScrollControlled: true, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))), builder: (context) => const SearchFilters()); }),
        ],
      ),
      body: products == null ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Column(
          children: [
            const MainSlider(),
            _buildSectionHeader('المزادات الجارية', () {}),
            _buildAuctionsList(),
            _buildSectionHeader('أحدث الإعلانات', () {}),
            _buildAdsGrid(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add_ad'),
        backgroundColor: AppTheme.goldColor,
        child: const Icon(Icons.add, color: Colors.black, size: 30),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          TextButton(onPressed: onTap, child: const Text('عرض الكل', style: TextStyle(color: AppTheme.goldColor))),
        ],
      ),
    );
  }

  Widget _buildAuctionsList() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/auctions'),
          child: Container(
            width: 150,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppTheme.goldColor.withOpacity(0.5)),
              gradient: const LinearGradient(colors: [Colors.black, Color(0xFF1A1A1A)]),
            ),
            child: const Center(
              child: Text('مزاد مباشر 🔴', style: TextStyle(color: AppTheme.goldColor, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAdsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15, childAspectRatio: 0.8),
      itemCount: 4,
      itemBuilder: (context, index) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Expanded(child: Container(color: Colors.grey[300], child: const Icon(Icons.image, size: 50))),
            const Padding(padding: EdgeInsets.all(8), child: Text('عنوان الإعلان التجريبي')),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      onTap: (index) {
        if (index == 3) Navigator.pushNamed(context, '/profile');
        if (index == 2) Navigator.pushNamed(context, '/map');
        if (index == 1) Navigator.pushNamed(context, '/wallet');
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
        BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'المحفظة'),
        BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'الخريطة'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
      ],
    );
  }
}
