import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  void _goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => _goBack(context),
        ),
        title: const Text('Profile'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(radius: 40, backgroundColor: Colors.green, child: Icon(Icons.person, size: 40, color: Colors.white)),
          const SizedBox(height: 10),
          const Center(child: Text("Username: Guest", style: TextStyle(fontSize: 18))),
          const Center(child: Text("Account Type: Guest")),
          const SizedBox(height: 10),
          TextButton.icon(onPressed: () {}, icon: const Icon(Icons.edit), label: const Text("Edit Profile")),
          const Divider(),
          const Text("Progress", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text("Total Points: 215"),
          const Text("Badges: Recycler x3, Waste Wise x1"),
          const Text("Items Sorted: 89 (Organic, Recyclable, Landfill)"),
          const Divider(),
          const Text("Settings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SwitchListTile(title: const Text("Notifications"), value: true, onChanged: (val) {}),
          ListTile(title: const Text("Language"), subtitle: const Text("English")),
          ListTile(title: const Text("Email"), subtitle: const Text("Not linked")),
          const Divider(),
          ListTile(title: const Text("View Sorting History"), onTap: () {}),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: () {}, child: const Text("Log Out")),
          const SizedBox(height: 5),
          TextButton(onPressed: () {}, child: const Text("Delete Account", style: TextStyle(color: Colors.red))),
        ],
      ),
    );
  }
}
