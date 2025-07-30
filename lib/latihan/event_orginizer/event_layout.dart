import 'package:flutter/material.dart';

/// Flutter code sample for [AppBar] with improved styling and functionality.

class EventLayout extends StatelessWidget {
  final String title;
  final Widget body;

  const EventLayout({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        title: const Text(
          'Private Party Organizer',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey[100],
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: body,
      ),
    );
  }
}