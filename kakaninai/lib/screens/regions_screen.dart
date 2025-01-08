import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:kakaninai/widgets/app_name_text.dart';
import 'package:kakaninai/widgets/regions/region_widget.dart';
import 'package:kakaninai/widgets/search_delegate.dart';

class RegionsScreen extends StatefulWidget {
  const RegionsScreen({super.key});

  @override
  State<RegionsScreen> createState() => _RegionsScreenState();
}

class _RegionsScreenState extends State<RegionsScreen> {
  final List<Map<String, dynamic>> regions = [
    {
      'region_name': 'Region 1 - Ilocos Region',
      'kakanin_name': ['Puto', 'Puto Bumbong', 'Puto Calasiao', 'Puto Seko', 'Puto Sulot', 'Puto Maya'],
      'image': 'https://via.placeholder.com/150',
    },
    {
      'region_name': 'Region 2 - Cagayan Valley',
      'kakanin_name': ['Pancit Cabagan', 'Pancit Batil Patung', 'Pancit Cagayan', 'Pancit Miki', 'Pancit Tuguegarao', 'Pancit Ybanag', 'Pancit Batil Patung', 'Pancit Cabagan', 'Pancit Miki', 'Pancit Tuguegarao', 'Pancit Ybanag', 'Pancit Cagayan'],
      'image': 'https://via.placeholder.com/150',
    },
    {
      'region_name': 'Region 3 - Central Luzon',
      'kakanin_name': 'Puto, Puto Bumbong, Puto Calasiao, Puto Seko, Puto Sulot, Puto Maya, Puto Lanson, Puto Manapla, Puto Binan, Puto Pao, Puto Kutsinta, Puto Pao, Puto Kutsinta, Puto Binan, Puto Manapla, Puto Lanson, Puto Maya, Puto Sulot, Puto Seko, Puto Calasiao, Puto Bumbong, Puto',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'region_name': 'Region 4A - Calabarzon',
      'kakanin_name': 'Puto, Puto Bumbong, Puto Calasiao, Puto Seko, Puto Sulot, Puto Maya',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'region_name': 'Region 4B - Mimaropa',
      'kakanin_name': 'Puto, Puto Bumbong, Puto Calasiao, Puto Seko, Puto Sulot, Puto Maya',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'region_name': 'Region 5 - Bicol Region',
      'kakanin_name': 'Puto, Puto Bumbong, Puto Calasiao, Puto Seko, Puto Sulot, Puto Maya',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'region_name': 'Region 6 - Western Visayas',
      'kakanin_name': 'Puto, Puto Bumbong, Puto Calasiao, Puto Seko, Puto Sulot, Puto Maya',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'region_name': 'Region 7 - Central Visayas',
      'kakanin_name': 'Puto, Puto Bumbong, Puto Calasiao, Puto Seko, Puto Sulot, Puto Maya',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'region_name': 'Region 8 - Eastern Visayas',
      'kakanin_name': 'Puto, Puto Bumbong, Puto Calasiao, Puto Seko, Puto Sulot, Puto Maya',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'region_name': 'Region 9 - Zamboanga Peninsula',
      'kakanin_name': 'Puto, Puto Bumbong, Puto Calasiao, Puto Seko, Puto Sulot, Puto Maya',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'region_name': 'Region 10 - Northern Mindanao',
      'kakanin_name': 'Puto, Puto Bumbong, Puto Calasiao, Puto Seko, Puto Sulot, Puto Maya',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'region_name': 'Region 11 - Davao Region',
      'kakanin_name': 'Puto, Puto Bumbong, Puto Calasiao, Puto Seko, Puto Sulot, Puto Maya',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'region_name': 'Region 12 - Soccsksargen',
      'kakanin_name': 'Puto, Puto Bumbong, Puto Calasiao, Puto Seko, Puto Sulot, Puto Maya',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'region_name': 'Region 13 - Caraga',
      'kakanin_name': 'Puto, Puto Bumbong, Puto Calasiao, Puto Seko, Puto Sulot, Puto Maya',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'region_name': 'Region 14 - Bangsamoro Autonomous Region in Muslim Mindanao (BARMM)',
      'kakanin_name': 'Puto, Puto Bumbong, Puto Calasiao, Puto Seko, Puto Sulot, Puto Maya',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'region_name': 'Region 15 - Cordillera Administrative Region (CAR)',
      'kakanin_name': 'Puto, Puto Bumbong, Puto Calasiao, Puto Seko, Puto Sulot, Puto Maya',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'region_name': 'Region 16 - National Capital Region (NCR)',
      'kakanin_name': 'Puto, Puto Bumbong, Puto Calasiao, Puto Seko, Puto Sulot, Puto Maya',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'region_name': 'Region 17 - Bangsamoro Autonomous Region in Muslim Mindanao (BARMM)',
      'kakanin_name': 'Puto, Puto Bumbong, Puto Calasiao, Puto Seko, Puto Sulot, Puto Maya',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'region_name': 'Region 18 - Cordillera Administrative Region (CAR)',
      'kakanin_name': 'Puto, Puto Bumbong, Puto Calasiao, Puto Seko, Puto Sulot, Puto Maya',
      'image': 'https://via.placeholder.com/150',
    },

  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(HeroiconsSolid.magnifyingGlass),
            padding: const EdgeInsets.only(right: 16.0),
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: regions.length,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemBuilder: (context, index) {
          final region = regions[index];
          return GestureDetector(
            onTap: () {
              // Navigate to the details screen of the selected region
              // Add your navigation logic here
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 4.0,
              child: RegionWidget(region: region)
            ),
          );
        },
      ),
    );
  }
}
