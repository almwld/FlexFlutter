import 'package:flutter/material.dart';
import 'dart:async';

class MainSlider extends StatefulWidget {
  const MainSlider({super.key});

  @override
  State<MainSlider> createState() => _MainSliderState();
}

class _MainSliderState extends State<MainSlider> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  final List<Map<String, String>> slides = [
    {'title': 'إعلانات حصرية للتجار', 'color': '0xFFD4AF37'},
    {'title': 'عروض VIP الخاصة', 'color': '0xFF000000'},
    {'title': 'أفضل المطاعم في اليمن', 'color': '0xFFE74C3C'},
    {'title': 'المزادات: عقارات وسيارات وجنابي', 'color': '0xFF2C3E50'},
    {'title': 'أخبار منصة فلكس يمن', 'color': '0xFF2980B9'},
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_controller.hasClients) {
        _controller.animateToPage(_currentPage, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        controller: _controller,
        itemCount: slides.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(colors: [Color(int.parse(slides[index]['color']!)), Colors.orange]),
            ),
            child: Center(
              child: Text(slides[index]['title']!, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}
