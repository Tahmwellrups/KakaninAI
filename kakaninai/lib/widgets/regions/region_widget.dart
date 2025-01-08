import 'package:flutter/material.dart';
import 'package:kakaninai/screens/inner_screens/region_details.dart';

class RegionWidget extends StatelessWidget {
  final Map<String, dynamic> region;

  const RegionWidget({super.key, required this.region});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegionDetails(region: region),
          ),
        );
      },
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            region['image']!,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.broken_image,
                size: 50,
                color: Colors.grey,
              );
            },
          ),
        ),
        title: Text(
          region['region_name']!,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
