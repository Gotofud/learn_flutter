import 'package:flutter/material.dart';
import 'package:learn_flutter/latihan/event_orginizer/event_layout.dart';

class EventDetail extends StatelessWidget {
  final Map<String, String> data;
  const EventDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return EventLayout(
      title: data['name']!,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.network(
              data['image']!,
              height: 200,
            ),
            const SizedBox(height: 18.5),
            Text(data['name']!, style: const TextStyle(fontSize: 50)),
            Text(data['price']!, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 25),
            Text(data['description']!, style: const TextStyle(fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
