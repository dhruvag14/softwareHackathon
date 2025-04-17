import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:waste/widget_tree.dart';

Future<void> main() async {
  // Ensure Flutter binding is initialized before Firebase
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase and handle potential errors
  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint('Error initializing Firebase: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const WidgetTree(), // Setting WidgetTree as the initial screen
    );
  }
}
