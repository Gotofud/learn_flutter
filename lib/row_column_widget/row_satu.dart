import 'package:flutter/material.dart';
import 'package:learn_flutter/main_layout.dart';

class RowOne extends StatelessWidget {
  const RowOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      title: 'Row Satu',
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
            Text('Text row 1'), 
            Text('Text row 2'), 
            Text('Text row 3'),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text('Text Column 1'),Text('Text Column 2')],)],
      ),
    );
  }
}
