import 'package:flutter/material.dart';
import 'package:learn_flutter/main_layout.dart';

class ListSatu extends StatelessWidget {
  const ListSatu({super.key});

@override
Widget build(BuildContext context){
  return MainLayout(
    title: 'List Builder',
    body: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index){
      return Container(
        color: Colors.blue,
        margin: const EdgeInsets.all(10),
        width: 100,
        height: 100,
        child: Text('Text' + index.toString()),
      );
      },
      scrollDirection: Axis.horizontal,
    ),
  );
}
}
