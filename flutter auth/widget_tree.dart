import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waste/auth.dart';
import 'package:waste/pages/home_page.dart';
import 'package:waste/pages/login_register_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        // Debugging information
        debugPrint('Auth state connection: ${snapshot.connectionState}');
        debugPrint('Is user logged in: ${snapshot.hasData}');

        // Show the appropriate widget based on the authentication state
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return const LoginPage();
          }
        }

        // Show a loading indicator while waiting for the connection
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
