import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../theme/app_theme.dart';

class MainSlider extends StatelessWidget {
  const MainSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {'t': 'إعلانات تجار حصرية', 'i': Icons.business, 'c': Colors.blue},
      {'t': 'عروض VIP المميزة', 'i': Icons.stars, 'c': Colors.amber},
      {'t': 'أفضل مطاعم اليمن', 'i': Icons.restaurant, 'c': Colors.orange},
      {'t': 'مزادات (سيارات وعقارات)', 'i': Icons.gavel, 'c': Colors.red},
      {'t': 'أخبار فلكس يمن', 'i': Icons.campaign, 'c': AppTheme.goldColor},
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 4),
      ),
      items: items.map((item) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [item['c'], Colors.black.withOpacity(0.7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item['i'], size: 50, color: Colors.white),
              const SizedBox(height: 10),
              Text(item['t'], style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        );
      }).toList(),
    );
  }
}
