import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'dart:math';

class SpinWheel extends StatefulWidget {
  const SpinWheel({super.key});

  @override
  State<SpinWheel> createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
  }

  void _spin() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RotationTransition(
          turns: _animation,
          child: Image.asset('assets/icons/app_icon.png', width: 200, height: 200),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _spin,
          style: ElevatedButton.styleFrom(backgroundColor: AppTheme.goldColor),
          child: const Text('جرب حظك واربح خصومات!', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
