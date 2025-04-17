import 'package:flutter/material.dart';
import 'pages/main_screen.dart';

void main() {
  runApp(EcoSageApp());
}

class EcoSageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoSage',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainScreen(),
    );
  }
}
