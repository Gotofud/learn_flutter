import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, String> design;

  const DetailScreen(
      {super.key, required this.design, required Map<String, String> desain});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(design['title']!)),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.network(design['image']!, height: 200),
            const SizedBox(height: 20),
            Text(design['desc']!, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}