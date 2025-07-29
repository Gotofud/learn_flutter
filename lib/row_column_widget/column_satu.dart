import 'package:flutter/material.dart';
import 'package:learn_flutter/main_layout.dart';

class ColumnSatu extends StatelessWidget {
  const ColumnSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      title: 'Column Satu',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Text Column 1'),
          Text('Text Column 2'),
          Text('Text Column 3'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Text Row 1'),
              Text('Text Row 2'),
            ],
          )
        ],
      ),
    );
  }
}
