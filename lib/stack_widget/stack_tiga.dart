import 'package:flutter/material.dart';
import 'package:learn_flutter/main_layout.dart';

class StackThree extends StatelessWidget {
  const StackThree({super.key});

@override
Widget build(BuildContext context){
  return MainLayout(
    title: 'Image with stack',
    body: Stack(
      children: [
        Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlEU-P8yZZrTdzRpC_EvfLSxt5DCh9-mKL4A&s'
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Text('Mie Ayam'),
        )
      ],
    ),
  );
}
}