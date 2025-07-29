import 'package:flutter/material.dart';
import 'package:learn_flutter/latihan/roblox_card/roblox_layout.dart';  

class RobloxCard extends StatelessWidget {
  const RobloxCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarExample(
      title: 'Roblox Card',
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildGameCard(
              imageUrl: 'https://i.imgflip.com/8qpcqb.jpg',
              title: 'Military Simulator',
              subtitle: 'Action RPG',
            ),
            _buildGameCard(
              imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlPkL1JxjaeA_k_n6dbHYNzessJXYJGDNCQTRt_CDoeaPYf5onwHdS3PP_Y443tm9onnc&usqp=CAU',
              title: 'Get Free UGC 😨',
              subtitle: 'Simulation',
            ),
            _buildGameCard(
              imageUrl: 'https://tr.rbxcdn.com/180DAY-d92b1e0a1cad806ea3f331639df0e1fd/500/280/Image/Jpeg/noFilter',
              title: 'Grow A Job[UPDATE]',
              subtitle: 'Simulation',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameCard({
    required String imageUrl,
    required String title,
    required String subtitle,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Card Container
        Container(
          width: 135,
          height: 155,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                // Background Image
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Dark Overlay
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Text Information Below Card
        SizedBox(
          width: 135,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}