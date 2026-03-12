import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('محفظتي الرقمية', style: TextStyle(color: AppTheme.goldColor)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // عرض الأرصدة في بطاقات متحركة
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildBalanceCard('الريال اليمني', '1,250,000', 'YER', Colors.redAccent),
                  _buildBalanceCard('الريال السعودي', '4,500', 'SAR', Colors.green),
                  _buildBalanceCard('الدولار الأمريكي', '1,200', 'USD', Colors.blue),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            // أزرار العمليات السريعة
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildActionButton(Icons.add_card, 'إيداع'),
                  _buildActionButton(Icons.send_rounded, 'تحويل'),
                  _buildActionButton(Icons.history, 'السجل'),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // قائمة آخر العمليات
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('آخر العمليات', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  _buildTransactionItem('شراء عقار - صنعاء', '- 500,000 YER', Icons.home_work, Colors.red),
                  _buildTransactionItem('إيداع نقدي', '+ 200 SAR', Icons.account_balance_wallet, Colors.green),
                  _buildTransactionItem('بيع سيارة تويوتا', '+ 5,000 USD', Icons.directions_car, Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard(String title, String amount, String currency, Color color) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.4), color.withOpacity(0.1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(color: Colors.white70, fontSize: 16)),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(amount, style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(width: 10),
              Text(currency, style: const TextStyle(color: AppTheme.goldColor, fontSize: 18)),
            ],
          ),
          const SizedBox(height: 20),
          const Text('**** **** **** 4419', style: TextStyle(color: Colors.white38, letterSpacing: 2)),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppTheme.goldColor.withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.goldColor.withOpacity(0.5)),
          ),
          child: Icon(icon, color: AppTheme.goldColor),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }

  Widget _buildTransactionItem(String title, String amount, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, color: Colors.white24),
      title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)),
      trailing: Text(amount, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      contentPadding: EdgeInsets.zero,
    );
  }
}
