import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _capturedImage;
  final ImagePicker _picker = ImagePicker();
  int _currentIndex = 0;

  // Capture an image using the phone's camera.
  Future<void> _captureImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _capturedImage = File(pickedFile.path);
      });
    }
  }

  // When "Identify" is pressed, navigate to the Details page.
  void _onIdentifyPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DetailsPage()),
    );
  }

  // Dummy handler for bottom navigation bar taps.
  void _onBottomNavTapped(int index) {
    setState(() {
      _currentIndex = index;
      // Later, you can add navigation actions based on the index.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Header Section: AppBar with title "EcoSage"
      appBar: AppBar(
        title: const Text('EcoSage'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title: "Image Selection"
            const Text(
              'Image Selection',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            // Image Capture Frame: Tapping opens the camera.
            Center(
              child: GestureDetector(
                onTap: _captureImage,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: _capturedImage != null
                        ? Image.file(
                      _capturedImage!,
                      fit: BoxFit.cover,
                    )
                        : Image.asset(
                      'assets/images/plastic_bottle.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // Action Button: "Identify"
            Center(
              child: ElevatedButton(
                onPressed: _onIdentifyPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Identify',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar with four items.
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onBottomNavTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: "Classify",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Guidelines",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: "Rewards",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
