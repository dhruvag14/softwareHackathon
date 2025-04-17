import 'package:firebase_auth/firebase_auth.dart';
import 'package:waste/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // Get the currently signed-in user
  final User? user = Auth().currentUser;

  // Sign out method
  Future<void> signOut(BuildContext context) async {
    try {
      await Auth().signOut();
      // Navigate back to the login screen after signing out
      Navigator.of(context).pop();
    } catch (e) {
      // Show an error dialog if sign out fails
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Sign Out Error'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  // App title
  Widget _title() {
    return const Text('EcoSage');
  }

  // Display user email or placeholder text
  Widget _userEmail() {
    return Text(
      user?.email ?? 'No email available',
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  // Sign out button
  Widget _signOutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => signOut(context),
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _userEmail(),
              const SizedBox(height: 20),
              _signOutButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
