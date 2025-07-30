import 'package:flutter/material.dart';
import 'package:learn_flutter/main_layout.dart';

class GridSatu extends StatelessWidget {
  const GridSatu({super.key});

  @override
  Widget build(BuildContext context){
    return MainLayout(
      title: 'Grid Satu', 
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
          crossAxisCount: 4, 
        ),
        children: [
          Container(color: Colors.blue,width: 200,child: const Text('1')),
          Container(color: Colors.red, width: 200,child: const Text('2')),
          Container(color: Colors.green, width: 200,child: const Text('3')),
          Container(color: Colors.yellow, width: 200,child: const Text('4')),
        ],
        ), 
      );
  }
}