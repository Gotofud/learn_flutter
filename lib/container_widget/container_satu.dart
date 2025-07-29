import 'package:flutter/material.dart';
import 'package:learn_flutter/main_layout.dart';

class ContainerSatu extends StatelessWidget {
  const ContainerSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Container Satu',
      body: Container(
        margin: const EdgeInsets.all(10),
        color: Colors.blue,
        width: 200,
        height: 200,
        child: Container(
          margin: const EdgeInsets.all(10),
          color: Colors.redAccent,
          child: const Text('Text'),
        ),
      ),
    );
  }
}
