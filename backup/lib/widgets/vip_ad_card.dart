import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class VipAdCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  const VipAdCard({super.key, required this.title, required this.price, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.goldColor, width: 2),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [Colors.black, Colors.grey[900]!],
        ),
        boxShadow: [
          BoxShadow(color: AppTheme.goldColor.withOpacity(0.2), blurRadius: 10, spreadRadius: 1)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: Container(
              height: 100,
              width: double.infinity,
              color: Colors.grey[800],
              child: const Icon(Icons.star, color: AppTheme.goldColor, size: 40),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('⭐ إعلان VIP', style: TextStyle(color: AppTheme.goldColor, fontSize: 10, fontWeight: FontWeight.bold)),
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), maxLines: 1),
                Text(price, style: const TextStyle(color: AppTheme.goldColor, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
