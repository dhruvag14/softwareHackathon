import 'package:flutter/material.dart';

class GamificationPage extends StatelessWidget {
  const GamificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Icon(Icons.emoji_events, size: 64, color: Colors.amber),
          const SizedBox(height: 10),
          const Text(
            '215 Points',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Chip(label: Text('Recycler x3')),
              Chip(label: Text('Waste Wise x1')),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Great Sorting!',
            style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 10),
          const Text(
            'Rules Sorted',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
