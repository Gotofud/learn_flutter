// gridview_example.dart
import 'package:flutter/material.dart';
import 'package:learn_flutter/main_layout.dart';

class GridProductPage extends StatelessWidget {
  const GridProductPage({super.key});

  final List<Map<String, String>> products = const [
    {
      'name': 'Kaos Flutter',
      'price': 'Rp120.000',
      'image': 'https://media.tenor.com/lNLzQz-e9V8AAAAM/pro.gif'
    },
    {
      'name': 'Hoodie Dart',
      'price': 'Rp220.000',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT05SGJuVw1UOhSwpGRoFkCvOIrUY-D8DB5qpmB61Q6ASRgl52u_Pdgt9xbKLx0MnPZ6es&usqp=CAU'
    },
    {
      'name': 'Sticker UI',
      'price': 'Rp20.000',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREOZtzxPWot462Lp1a07VIWCFNVcBzi6qahg&s'
    },
    {
      'name': 'Totebag Dev',
      'price': 'Rp80.000',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdjOrkt3GyEeVMDAb9JfcXZI-oTEBIgv9ZcA&s'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Grid View',
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 kolom
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
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
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(product['image']!, fit: BoxFit.cover),
                    ),
                  ),
                  // Overlay
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
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
                        Text(product['name']!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text(product['price']!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}