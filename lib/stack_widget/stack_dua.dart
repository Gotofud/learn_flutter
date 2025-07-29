import 'package:flutter/material.dart';

class StackTwo extends StatelessWidget {
  const StackTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          color: Colors.amber),
      const  Positioned(
          top: 10,
          left: 10,
          child: Icon(Icons.star),
        ),
       const Positioned(
          top: 10,
          right: 340,
          child: Icon(Icons.star),
        ),
       const Positioned(
          top: 75,
          left: 87.25,
          child: Icon(Icons.star),
        ),
       const Positioned(
          top: 150,
          left: 10,
          child: Icon(Icons.star),
        ),
       const Positioned(
          top: 150,
          right: 340,
          child: Icon(Icons.star),
        ),
      ],
    );
  }
}
