import 'package:flutter/material.dart';

class GuidelinesPage extends StatelessWidget {
  const GuidelinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 8),
            const Text("Guidelines", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Spacer(),
            const Icon(Icons.location_on),
          ],
        ),
        const SizedBox(height: 10),
        const Text("Select Waste Type"),
        DropdownButton<String>(
          value: "Organic",
          items: const [
            DropdownMenuItem(value: "Organic", child: Text("Organic")),
            DropdownMenuItem(value: "Recyclable", child: Text("Recyclable")),
            DropdownMenuItem(value: "Landfill", child: Text("Landfill")),
          ],
          onChanged: (value) {},
        ),
        const SizedBox(height: 20),
        _buildWasteCard("Organic Waste", "Biodegradable waste from food and garden.", ["Vegetable peels", "Leftovers"], ["Use compost bins"], ["Don’t mix with plastic"]),
        _buildWasteCard("Recyclable Waste", "Items that can be recycled.", ["Paper", "Glass bottles"], ["Clean before recycling"], ["No food residue"]),
        _buildWasteCard("Landfill Waste", "Non-recyclable materials.", ["Styrofoam", "Broken glass"], ["Minimize usage"], ["Don’t burn"]),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {},
          child: const Text("Learn more about city-specific regulations"),
        )
      ],
    );
  }

  Widget _buildWasteCard(String title, String desc, List<String> examples, List<String> dos, List<String> donts) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(desc),
            const SizedBox(height: 6),
            const Text("Examples:", style: TextStyle(fontWeight: FontWeight.bold)),
            ...examples.map((e) => Text("• $e")),
            const Text("Do's:", style: TextStyle(fontWeight: FontWeight.bold)),
            ...dos.map((e) => Row(children: [Icon(Icons.check, color: Colors.green), const SizedBox(width: 4), Text(e)])),
            const Text("Don'ts:", style: TextStyle(fontWeight: FontWeight.bold)),
            ...donts.map((e) => Row(children: [Icon(Icons.close, color: Colors.red), const SizedBox(width: 4), Text(e)])),
            const SizedBox(height: 4),
            const Text("Note: Check with your local municipality.", style: TextStyle(fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
