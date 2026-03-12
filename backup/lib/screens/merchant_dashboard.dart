import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MerchantDashboard extends StatelessWidget {
  const MerchantDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('لوحة تحكم التاجر')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildStatCards(),
            const SizedBox(height: 25),
            _buildSalesChart(),
            const SizedBox(height: 25),
            _buildRecentAdsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCards() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      children: [
        _statItem('إجمالي المبيعات', '1,250,000', Icons.account_balance_wallet, Colors.green),
        _statItem('مشاهدات الإعلانات', '45.2K', Icons.remove_red_eye, AppTheme.goldColor),
        _statItem('الإعلانات النشطة', '12', Icons.ad_units, Colors.blue),
        _statItem('طلبات معلقة', '5', Icons.pending_actions, Colors.orange),
      ],
    );
  }

  Widget _statItem(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.goldColor.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 10),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildSalesChart() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('نمو المشاهدات (آخر 7 أيام)', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Container(height: 100, color: Colors.transparent, child: const Center(child: Text('رسم بياني توضيحي قادم...'))),
        ],
      ),
    );
  }

  Widget _buildRecentAdsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('إعلاناتك الأخيرة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) => Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: const CircleAvatar(backgroundColor: AppTheme.goldColor, child: Icon(Icons.star, color: Colors.black)),
              title: Text('إعلان عقار مميز #$index'),
              subtitle: const Text('المشاهدات: 1,200'),
              trailing: const Icon(Icons.edit, size: 18),
            ),
          ),
        ),
      ],
    );
  }
}
