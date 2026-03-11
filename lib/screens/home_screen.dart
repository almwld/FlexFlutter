import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // شريط البحث
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: '...ابحث عن ما تريد',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
            ),
          ),
          
          // فئات سريعة
          SliverToBoxAdapter(
            child: Container(
              height: 45,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCategoryChip('مطاعم', Icons.restaurant),
                  _buildCategoryChip('عقارات', Icons.home),
                  _buildCategoryChip('سفر', Icons.flight),
                  _buildCategoryChip('شحن ألعاب', Icons.sports_esports),
                  _buildCategoryChip('سيارات', Icons.directions_car),
                  _buildCategoryChip('إلكترونيات', Icons.phone_android),
                ],
              ),
            ),
          ),
          
          // البانر الرئيسي
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.deepOrange],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Stack(
                  children: [
                    // خلفية Flutter
                    Positioned(
                      left: -20,
                      top: -20,
                      child: Opacity(
                        opacity: 0.3,
                        child: Icon(
                          Icons.flutter_dash,
                          size: 200,
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                    ),
                    // النص
                    const Positioned(
                      right: 20,
                      top: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'مزاد الجنابي',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'الأسبوعي',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // العقارات والاستثمارات
          SliverToBoxAdapter(
            child: _buildSectionTitle('العقارات والاستثمارات', Icons.home),
          ),
          
          SliverToBoxAdapter(
            child: Container(
              height: 120,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildPropertyCard('شقق للإيجار', Icons.apartment),
                  _buildPropertyCard('فلل للبيع', Icons.villa),
                  _buildPropertyCard('أراضي استثمارية', Icons.landscape),
                  _buildPropertyCard('مكاتب تجارية', Icons.business),
                  _buildPropertyCard('مخططات سكنية', Icons.map),
                  _buildPropertyCard('مقاولات بناء', Icons.construction),
                  _buildPropertyCard('ديكور وتصميم', Icons.design_services),
                ],
              ),
            ),
          ),
          
          // عالم الإلكترونيات والتقنية
          SliverToBoxAdapter(
            child: _buildSectionTitle('عالم الإلكترونيات والتقنية', Icons.computer),
          ),
          
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildTechCard('هواتف ذكية', Icons.smartphone),
                  _buildTechCard('لابتوب وكمبيوتر', Icons.laptop),
                  _buildTechCard('ستلايت وإنترنت', Icons.satellite_alt),
                  _buildTechCard('كاميرات', Icons.camera_alt),
                  _buildTechCard('ألعاب', Icons.games),
                ],
              ),
            ),
          ),
          
          // السيارات
          SliverToBoxAdapter(
            child: _buildSectionTitle('السيارات', Icons.directions_car),
          ),
          
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              delegate: SliverChildListDelegate([
                _buildCarCard(
                  'جندية صيفاني قديمة',
                  '5,000',
                  '00:02:34',
                  'https://via.placeholder.com/150',
                ),
                _buildCarCard(
                  'شاص 2024',
                  '35,000',
                  '00:12:33',
                  'https://via.placeholder.com/150',
                ),
                _buildCarCard(
                  'شاص 2024',
                  '8,000',
                  '07:03:36',
                  'https://via.placeholder.com/150',
                ),
                _buildCarCard(
                  'شاص 2024',
                  '75,000',
                  '07:03:39',
                  'https://via.placeholder.com/150',
                ),
              ]),
            ),
          ),
          
          // مسافة للـ BottomNav
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.grey[800],
        side: BorderSide(color: Colors.grey[700]!),
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.goldColor, size: 24),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyCard(String title, IconData icon) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.blue, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildTechCard(String title, IconData icon) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.purple, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11),
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildCarCard(String title, String price, String time, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.goldColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة السيارة
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // التفاصيل
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$price ر.ي',
                        style: TextStyle(
                          color: AppTheme.goldColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
