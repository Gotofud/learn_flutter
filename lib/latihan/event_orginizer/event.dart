// gridview_example.dart
import 'package:flutter/material.dart';
import 'package:learn_flutter/latihan/event_orginizer/event_detail.dart';
import 'package:learn_flutter/latihan/event_orginizer/event_layout.dart';

class Event extends StatelessWidget {
  const Event({super.key});

  final List<Map<String, String>> event = const [
    {
      'name': 'Paket Ulang Tahun',
      'price': 'Rp550.000',
      'image': 'https://media.tenor.com/lNLzQz-e9V8AAAAM/pro.gif',
      'description':
          '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."'
    },
    {
      'name': 'Paket Special',
      'price': 'Rp1.300.000',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT05SGJuVw1UOhSwpGRoFkCvOIrUY-D8DB5qpmB61Q6ASRgl52u_Pdgt9xbKLx0MnPZ6es&usqp=CAU',
      'description':
          '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."'
    },
    {
      'name': 'Paket Horeg',
      'price': 'Rp1.200.000',
      'image':
          'https://media.suara.com/pictures/653x366/2025/07/25/15042-sosok-edi-sound-digadang-gadang-sebagai-penemu-sound-horeg.jpg',
      'description':
          '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."'
    },
    {
      'name': 'Paket Kelulusan',
      'price': 'Rp500.000',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcumdv1aASmzT0ueypKQHdkh6MmtEDzeJ7WxIXja0HP4F1I6XTfmr32jXYIC0k2HXxVfo&usqp=CAU',
      'description':
          '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."'
    },
    {
      'name': 'Paket Haloween',
      'price': 'Rp420.000',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREOZtzxPWot462Lp1a07VIWCFNVcBzi6qahg&s',
      'description':
          '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."'
    },
    {
      'name': 'Paket Lansia',
      'price': 'Rp580.000',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6KPv3SPs0mdl641sbtFaaz2nRcZbmRpm1GJoNdn_NAKQX1XcT_cFeuD-fkH8HqP-VVOw&usqp=CAU',
      'description':
          '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return EventLayout(
      title: 'Grid View',
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: GridView.builder(
          itemCount: event.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 kolom
            crossAxisSpacing: 10.5,
            mainAxisSpacing: 10.5,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final event_org = event[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EventDetail(data: event_org),
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
                        child: Image.network(event_org['image']!,
                            fit: BoxFit.cover),
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
                          Text(event_org['name']!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.5)),
                          Text(event_org['price']!,
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
      ),
    );
  }
}
