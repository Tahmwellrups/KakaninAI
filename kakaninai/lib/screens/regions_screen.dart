import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:kakaninai/widgets/app_name_text.dart';
import 'package:kakaninai/widgets/regions/region_widget.dart';
import 'package:kakaninai/widgets/search_delegate.dart';

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
  return await db.query('regions');
}

class RegionsScreen extends StatefulWidget {
  const RegionsScreen({super.key});

  @override
  State<RegionsScreen> createState() => _RegionsScreenState();
}

class _RegionsScreenState extends State<RegionsScreen> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromDatabase();
  }

  Future<void> fetchDataFromDatabase() async {
    final dbData = await fetchData(); // Call your fetchData function
    setState(() {
      data = dbData;
    });
  }

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
        itemCount: data.length,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemBuilder: (context, index) {
          final region = data[index];
          return GestureDetector(
            onTap: () {
              // Navigate to the details screen of the selected region
              // Add your navigation logic here
            },
            child: Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 4.0,
                child: RegionWidget(region: region)),
          );
        },
      ),
    );
  }
}
