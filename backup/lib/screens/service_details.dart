import 'package:flutter/material.dart';

class GenericServicePage extends StatelessWidget {
  final String title;
  const GenericServicePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(title), backgroundColor: const Color(0xFF1E1E1E)),
      body: Center(
        child: Text('صفحة $title قيد التطوير حالياً', 
        style: const TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
