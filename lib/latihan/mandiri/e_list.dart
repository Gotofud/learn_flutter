import 'package:flutter/material.dart';
import 'package:learn_flutter/latihan/mandiri/e_detail.dart';
import 'e_data.dart';

class ListScreen extends StatelessWidget {
  final String categoryId;
  final String categoryName;

  const ListScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    final items = event[categoryId]!;

    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(
                      design: item,
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 6)
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        image: DecorationImage(
                          image: NetworkImage(item['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(item['title']!,
                              style: const TextStyle(fontSize: 13)),
                          Text(item['price']!,
                              style: const TextStyle(fontSize: 10)),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            );
          }),
    );
  }
}