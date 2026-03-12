import 'package:flutter/material.dart';

class StaticPage extends StatelessWidget {
  final String title;
  const StaticPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('محتوى صفحة $title سوف يظهر هنا')),
    );
  }
}
