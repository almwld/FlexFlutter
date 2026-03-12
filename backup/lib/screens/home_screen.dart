import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/main_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('فلكس يمن', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.goldColor)),
        centerTitle: true,
        leading: const Icon(Icons.menu, color: AppTheme.goldColor),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MainSlider(), // السلايدر الإعلاني
            _buildSectionTitle('المزادات المباشرة 🔴', context),
            _buildAuctionsList(),
            _buildSectionTitle('أحدث العروض', context),
            _buildAdsGrid(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.goldColor,
        child: const Icon(Icons.add, color: Colors.black),
        onPressed: () => Navigator.pushNamed(context, '/login'), // يطلب التسجيل فقط عند الرغبة في النشر
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Text('عرض الكل', style: TextStyle(color: AppTheme.goldColor, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildAuctionsList() {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 15),
        itemCount: 5,
        itemBuilder: (context, index) => Container(
          width: 200,
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: NetworkImage('https://via.placeholder.com/200x130'), // صورة مؤقتة للمزاد
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [Colors.black.withOpacity(0.8), Colors.transparent]),
            ),
            padding: const EdgeInsets.all(10),
            child: const Align(alignment: Alignment.bottomRight, child: Text('سيارة تيوتا 2024', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.8),
      itemCount: 6,
      itemBuilder: (context, index) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Expanded(child: Container(decoration: BoxDecoration(color: Colors.grey[200], borderRadius: const BorderRadius.vertical(top: Radius.circular(15))), child: const Icon(Icons.image, size: 40))),
            const Padding(padding: EdgeInsets.all(8.0), child: Text('إعلان يمني مميز', style: TextStyle(fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(icon: const Icon(Icons.home, color: AppTheme.goldColor), onPressed: () {}),
          IconButton(icon: const Icon(Icons.location_on), onPressed: () => Navigator.pushNamed(context, '/map')),
          const SizedBox(width: 40),
          IconButton(icon: const Icon(Icons.wallet), onPressed: () => Navigator.pushNamed(context, '/wallet')),
          IconButton(icon: const Icon(Icons.person), onPressed: () => Navigator.pushNamed(context, '/profile')),
        ],
      ),
    );
  }
}
