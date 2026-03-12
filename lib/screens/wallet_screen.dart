import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('محفظة فلكس'),
        actions: [IconButton(icon: const Icon(Icons.help_outline), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBalanceCard(),
            _buildQuickActions(),
            _buildServiceGrid(),
            _buildTransactionHistory(isDark),
          ],
        ),
      ),
    );
  }

  // كرت الرصيد
  Widget _buildBalanceCard() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFFD4AF37), Color(0xFF8C6E12)]),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('الرصيد الكلي', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('750,000', style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold)),
              Text('ريال يمني', style: TextStyle(color: Colors.black87, fontSize: 16)),
            ],
          ),
          const Divider(color: Colors.black12),
          const Text('رقم المحفظة: 77XXXXXXX', style: TextStyle(color: Colors.black45, fontSize: 12)),
        ],
      ),
    );
  }

  // أزرار العمليات الأساسية
  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _actionItem(Icons.add_to_photos_rounded, 'إيداع'),
        _actionItem(Icons.account_balance_wallet_rounded, 'سحب'),
        _actionItem(Icons.send_rounded, 'تحويل'),
        _actionItem(Icons.qr_code_scanner_rounded, 'مسح QR'),
      ],
    );
  }

  Widget _actionItem(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(radius: 28, backgroundColor: AppTheme.goldColor.withOpacity(0.15), child: Icon(icon, color: AppTheme.goldColor)),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
      ],
    );
  }

  // شبكة الخدمات الإضافية
  Widget _buildServiceGrid() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('خدمات الدفع', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            mainAxisSpacing: 20,
            children: [
              _serviceItem(Icons.phone_android, 'رصيد'),
              _serviceItem(Icons.wifi, 'إنترنت'),
              _serviceItem(Icons.lightbulb_outline, 'كهرباء'),
              _serviceItem(Icons.water_drop_outlined, 'مياه'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _serviceItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }

  // سجل العمليات
  Widget _buildTransactionHistory(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('آخر العمليات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: const Text('عرض الكل', style: TextStyle(color: AppTheme.goldColor))),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                color: isDark ? Colors.grey[900] : Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: index.isEven ? Colors.green[100] : Colors.red[100],
                    child: Icon(index.isEven ? Icons.arrow_downward : Icons.arrow_upward, color: index.isEven ? Colors.green : Colors.red, size: 18),
                  ),
                  title: Text(index.isEven ? 'إيداع من الكريمي' : 'دفع قيمة إعلان'),
                  subtitle: const Text('12 مارس 2026'),
                  trailing: Text(
                    '${index.isEven ? "+" : "-"} 5000',
                    style: TextStyle(fontWeight: FontWeight.bold, color: index.isEven ? Colors.green : Colors.red),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
