import 'package:flutter/material.dart';
import 'package:learn_flutter/main_layout.dart';

class ListDua extends StatelessWidget {
  ListDua({super.key});

  final List<Map<String, dynamic>> listData = [
    {'color': Colors.red, 'partai': 'PDO'},
    {'color': Colors.blue, 'partai': 'Demokrit'},
    {'color': Colors.green, 'partai': 'Nasi Bungkus'},
    {'color': Colors.black, 'partai': 'Hitam Bersaudara'},
  ];

  @override
  Widget build(BuildContext context){
    return MainLayout(
      title: 'List Builder',
      body: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, i){
        final  data = listData[i];
        return Container(
          color: data['color'],
          width: 200,
          height: 200,
          child: Center(child: Text(data['partai']),),
        );
        },
      ),
    );
  }
}
