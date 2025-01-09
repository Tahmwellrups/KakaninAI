import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:kakaninai/widgets/app_name_text.dart';
import 'package:kakaninai/widgets/kakanin/kakanin_widget.dart';
import 'package:kakaninai/widgets/titles_text.dart';

// SQL package
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> initializeDatabase() async {
  // Get the path to the database directory
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, 'kakaninpedia.db');

  return openDatabase(path);
}

Future<List<Map<String, dynamic>>> fetchData() async {
  final db = await initializeDatabase();
  return await db.rawQuery('''
    SELECT * 
    FROM kakanin
    LEFT JOIN regions ON kakanin.region_id = regions.region_id
    LEFT JOIN provinces ON kakanin.province_id = provinces.province_id
    LEFT JOIN municipalities ON kakanin.municipality_id = municipalities.municipality_id
    ''');
}

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  late TextEditingController searchController;
  List<Map<String, dynamic>> kakaninList = [];

  Future<void> fetchDataFromDatabase() async {
    final dbData = await fetchData(); // Call your fetchData function
    setState(() {
      kakaninList = dbData;
    });
  }

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    fetchDataFromDatabase();
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
                  builder: (context, index) {
                    return KakaninWidget(
                      kakanin: kakaninList[index],
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
