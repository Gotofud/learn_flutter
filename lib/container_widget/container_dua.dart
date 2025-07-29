import 'package:flutter/material.dart';
import 'package:learn_flutter/container_widget/container_satu.dart';
import 'package:learn_flutter/main_layout.dart';

class ContainerDua extends StatelessWidget {
  const ContainerDua({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Container Dua',
      body: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Colors.lightBlueAccent,
            Colors.redAccent,
            Colors.purpleAccent,
          ], begin: Alignment.bottomRight, end: Alignment.topLeft),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ContainerSatu()));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            child: const Text(
              'pindah ke halaman 1',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
