import 'package:flutter/material.dart';

/// Flutter code sample for [AppBar] with improved styling and functionality.

class AppBarExample extends StatelessWidget {
  final String title;
  final Widget body;
  
  const AppBarExample({
    Key? key, 
    required this.title, 
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 28,
            ),
            tooltip: 'Search',
            onPressed: () => _showSnackBar(context, 'Search Game'),
          ),
          IconButton(
            icon: const Icon(
              Icons.qr_code_scanner,
              color: Colors.black,
              size: 28,
            ),
            tooltip: 'QR Scanner',
            onPressed: () => _showSnackBar(context, 'QR Scanner opened'),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
              size: 28,
            ),
            tooltip: 'Settings',
            onPressed: () => _navigateToSettings(context),
          ),
          const SizedBox(width: 8), // Add some spacing from the edge
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        child: body,
      ),
    );
  }

  /// Show snackbar with custom styling
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color(0xFF4A90E2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// Navigate to settings page with consistent styling
  void _navigateToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const SettingsPage(),
      ),
    );
  }
}

/// Separate settings page widget for better organization
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2C2C),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.settings,
              size: 80,
              color: Colors.white70,
            ),
            SizedBox(height: 20),
            Text(
              'Settings Page',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Configure your preferences here',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}