import 'package:flutter/material.dart';
import 'package:learn_flutter/latihan/ulangan_hotel/hotelDetail.dart';
import 'package:learn_flutter/ulangan_hotel/hotelDetail.dart';
import 'data.dart';

class HotelForm extends StatelessWidget {
  const HotelForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiket Hotel'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: hotel.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.5,
          mainAxisSpacing: 10.5,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, i) {
          final htl = hotel.toList()[i];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HotelDetail(
                    detail: htl,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100],
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 6)
                ],
              ),
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(htl['img']!, fit: BoxFit.cover),
                    ),
                  ),
                  // Overlay
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  // Price & Name
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(htl['nama']!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 21.5)),
                        Text(htl['hargaPermalam']!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 13.5)),
                        Text(htl['bintang']!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}