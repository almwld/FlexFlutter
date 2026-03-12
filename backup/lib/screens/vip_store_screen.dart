import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class VipStoreScreen extends StatelessWidget {
  const VipStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A), // خلفية سوداء ملكية
      appBar: AppBar(
        title: const Text('متجر النخبة VIP', style: TextStyle(color: AppTheme.goldColor, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          _buildVipHeader(),
          _buildVipCategories(),
          _buildVipProductsGrid(),
        ],
      ),
    );
  }

  Widget _buildVipHeader() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [AppTheme.goldColor, Color(0xFF8B6B1B)]),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('عالم التميز', style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
            Text('منتجات مختارة بعناية لأصحاب الذوق الرفيع', style: TextStyle(color: Colors.black54, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildVipCategories() {
    final categories = ['خناجر', 'سيارات فارهة', 'ساعات', 'عقارات VIP'];
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemCount: categories.length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.goldColor.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(child: Text(categories[index], style: const TextStyle(color: AppTheme.goldColor))),
          ),
        ),
      ),
    );
  }

  Widget _buildVipProductsGrid() {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.7,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => _buildVipProductCard(index),
          childCount: 4,
        ),
      ),
    );
  }

  Widget _buildVipProductCard(int index) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.goldColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Container(
                width: double.infinity,
                color: Colors.grey[900],
                child: const Icon(Icons.star, color: AppTheme.goldColor, size: 50), // مؤقت لصورة المنتج
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('منتج VIP فاخر', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('5,000,000 ريال', style: TextStyle(color: AppTheme.goldColor, fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
