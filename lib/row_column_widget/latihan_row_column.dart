import 'package:flutter/material.dart';
import 'package:learn_flutter/main_layout.dart';

class LatihanRowColumn extends StatelessWidget {
  const LatihanRowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Latihan Row Column',
      body: Center(
        child: Container(
          height: 70,
          width: double.infinity,
          color: Colors.blueAccent,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.call,
                    size: 40,
                  ),
                  Text('Call'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.navigation,
                    size: 40,
                  ),
                  Text('Route'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.share,
                    size: 40,
                  ),
                  Text('Share'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
