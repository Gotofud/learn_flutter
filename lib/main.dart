// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learn_flutter/container_widget/container_dua.dart';
import 'package:learn_flutter/container_widget/container_satu.dart';
import 'package:learn_flutter/grid_view/grid_satu.dart';
import 'package:learn_flutter/grid_view/grid_screen.dart';
import 'package:learn_flutter/latihan/latihan_satu.dart';
import 'package:learn_flutter/latihan/roblox_card/roblox_card.dart';
import 'package:learn_flutter/list_widget/list_satu.dart';
import 'package:learn_flutter/list_widget/list_screen.dart';
import 'package:learn_flutter/main_layout.dart';
import 'package:learn_flutter/row_column_widget/column_satu.dart';
import 'package:learn_flutter/row_column_widget/latihan_row_column.dart';
import 'package:learn_flutter/row_column_widget/row_satu.dart';
import 'package:learn_flutter/stack_widget/stack_dua.dart';
import 'package:learn_flutter/stack_widget/stack_satu.dart';
import 'package:learn_flutter/stack_widget/stack_tiga.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridProductPage()
    );
  }
}

class HelloFlutter extends StatelessWidget {
  const HelloFlutter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Mie Ayam',
      body: Center(
        child: Text(
          'Hello Fazli',
          style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              backgroundColor: Colors.blueAccent),
        ),
      ),
    );
  }
}
