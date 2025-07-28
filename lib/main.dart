// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learn_flutter/main_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HelloFlutter(),
    );
  }
}

class HelloFlutter extends StatelessWidget {
  const HelloFlutter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Mie Ayam',
      body: Center(
        child: Text(
          'Hello Fazli',
          style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              backgroundColor: Colors.blueAccent),
        ),
      ),
    );
  }
}
