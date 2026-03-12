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
  final List<String> slides = [
    'إعلانات تجار حصرية',
    'عروض VIP الخاصة',
    'أفضل المطاعم اليمنية',
    'مزادات الجنابي والسيارات',
    'إعلانات منصة فلكس'
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
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(colors: [Colors.black, Colors.grey[850]!]),
              border: Border.all(color: const Color(0xFFD4AF37), width: 1),
            ),
            child: Center(
              child: Text(slides[index], style: const TextStyle(color: Color(0xFFD4AF37), fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}
