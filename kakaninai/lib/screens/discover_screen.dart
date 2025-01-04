import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:kakaninai/consts/app_constants.dart';
import 'package:kakaninai/widgets/app_name_text.dart';
import 'package:kakaninai/widgets/kakanin/kakanin_widget.dart';
import 'package:kakaninai/widgets/titles_text.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  late TextEditingController searchController;

  // Sample data for kakanin
  final List<Map<String, dynamic>> kakaninList = [
    {
      'imageUrl': AppConstants.productImageUrl,
      'name': 'Bibingka',
      // 'price': 120.00,
    },
    {
      'imageUrl': AppConstants.productImageUrl,
      'name': 'Puto Bumbong',
      // 'price': 100.00,
    },
    {
      'imageUrl': AppConstants.productImageUrl,
      'name': 'Kutsinta',
      // 'price': 50.00,
    },
    // Add more entries as needed
  ];

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const AppNameTextWidget(),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleTextWidget(
                label: 'Discover',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search for kakanin',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      searchController.clear();
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onFieldSubmitted: (value) {
                  // Add search functionality here
                  print(searchController.text);
                },
              ),
              const SizedBox(height: 24),
              const TitleTextWidget(
                label: 'Kakanin Types',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: DynamicHeightGridView(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  builder: (context, index) {
                    final kakanin = kakaninList[index];
                    return KakaninWidget(
                      imageUrl: kakanin['imageUrl'],
                      name: kakanin['name'],
                      // price: kakanin['price'],
                    );
                  },
                  itemCount: kakaninList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
