import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ClassifyPage extends StatefulWidget {
  const ClassifyPage({Key? key}) : super(key: key);

  @override
  State<ClassifyPage> createState() => _ClassifyPageState();
}

class _ClassifyPageState extends State<ClassifyPage> {
  File? _image;
  Map<String, dynamic>? classificationResult;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        classificationResult = {
          'label': 'Plastic Bottle',
          'category': 'Plastic'
        }; // Replace with actual model logic
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Classify Waste')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image != null
                  ? Column(
                children: [
                  Image.file(_image!),
                  const SizedBox(height: 20),
                  if (classificationResult != null)
                    Card(
                      margin: const EdgeInsets.all(16),
                      child: ListTile(
                        title: Text("Label: ${classificationResult!['label']}"),
                        subtitle: Text("Category: ${classificationResult!['category']}"),
                      ),
                    ),
                ],
              )
                  : const Text('No image selected.'),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.camera_alt),
                label: const Text('Capture Image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
