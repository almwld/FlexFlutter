import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الكوبونات والخصومات')),
      body: Column(
        children: [
          _buildCouponInput(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Align(alignment: Alignment.centerRight, child: Text('القسائم المتاحة لك', style: TextStyle(fontWeight: FontWeight.bold))),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildCouponCard('خصم الجمعة', 'FLEX-FRI', '15%', Colors.orange),
                _buildCouponCard('مستخدم جديد', 'WELCOME', '10%', AppTheme.goldColor),
                _buildCouponCard('عرض رمضان', 'RAMADAN26', '20%', Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCouponInput() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.black,
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.goldColor, foregroundColor: Colors.black),
            child: const Text('تطبيق'),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'أدخل رمز الخصم',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCouponCard(String title, String code, String discount, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text('الرمز: $code', style: TextStyle(color: color, fontSize: 12)),
            ],
          ),
          Text(discount, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
