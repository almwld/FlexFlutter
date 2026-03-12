import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('محفظة فلكس'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 25),
            _buildMainActions(),
            const SizedBox(height: 30),
            _buildSectionTitle('خدمات الدفع السريع'),
            _buildServicesGrid(),
            const SizedBox(height: 30),
            _buildSectionTitle('آخر العمليات'),
            _buildTransactionList(),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [AppTheme.goldColor, Color(0xFFB8860B)]),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: AppTheme.goldColor.withOpacity(0.3), blurRadius: 15)],
      ),
      child: Column(
        children: const [
          Text('رصيدك المتاح', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('450,000', style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold)),
          Text('ريال يمني', style: TextStyle(color: Colors.black87, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildMainActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _actionCircle(Icons.add_card, 'إيداع'),
        _actionCircle(Icons.account_balance_wallet, 'سحب'),
        _actionCircle(Icons.swap_horizontal_circle, 'تحويل'),
      ],
    );
  }

  Widget _actionCircle(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(color: AppTheme.goldColor.withOpacity(0.1), shape: BoxShape.circle),
          child: Icon(icon, color: AppTheme.goldColor, size: 30),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildServicesGrid() {
    final services = [
      {'icon': Icons.phone_android, 'label': 'رصيد'},
      {'icon': Icons.wifi, 'label': 'إنترنت'},
      {'icon': Icons.lightbulb, 'label': 'كهرباء'},
      {'icon': Icons.water_drop, 'label': 'مياه'},
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 10),
      itemCount: services.length,
      itemBuilder: (context, i) => Column(
        children: [
          Icon(services[i]['icon'] as IconData, color: Colors.grey),
          const SizedBox(height: 5),
          Text(services[i]['label'] as String, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildTransactionList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, i) => ListTile(
        leading: CircleAvatar(
          backgroundColor: i == 1 ? Colors.red.withOpacity(0.1) : Colors.green.withOpacity(0.1),
          child: Icon(i == 1 ? Icons.arrow_upward : Icons.arrow_downward, color: i == 1 ? Colors.red : Colors.green),
        ),
        title: Text(i == 1 ? 'شراء إعلان VIP' : 'إيداع من صرافة الكريمي'),
        subtitle: const Text('2026-03-12'),
        trailing: Text(i == 1 ? '-2000' : '+5000', style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.goldColor)),
    );
  }
}
