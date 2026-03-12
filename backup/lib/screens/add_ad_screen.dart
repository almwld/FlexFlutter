import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddAdScreen extends StatefulWidget {
  const AddAdScreen({super.key});

  @override
  State<AddAdScreen> createState() => _AddAdScreenState();
}

class _AddAdScreenState extends State<AddAdScreen> {
  final List<File> _images = [];
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _images.add(File(pickedFile.path)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إضافة إعلان جديد')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Wrap(
              children: _images.map((img) => Image.file(img, width: 100, height: 100)).toList() 
              + [IconButton(icon: const Icon(Icons.add_a_photo, size: 50), onPressed: pickImage)],
            ),
            const TextField(decoration: InputDecoration(labelText: 'عنوان الإعلان')),
            const TextField(decoration: InputDecoration(labelText: 'السعر (ر.ي)')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text('نشر الإعلان')),
          ],
        ),
      ),
    );
  }
}
