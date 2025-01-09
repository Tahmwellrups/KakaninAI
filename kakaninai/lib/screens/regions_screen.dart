import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:kakaninai/widgets/app_name_text.dart';
import 'package:kakaninai/widgets/regions/region_widget.dart';
import 'package:kakaninai/widgets/search_delegate.dart';

// SQL package
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';

Future<Database> initializeDatabase() async {
  // Get the path to the database directory
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, 'kakaninpedia.db');

  // Check if the database already exists
  final exists = await databaseExists(path);

  // if (!exists) {
  // Copy the database from assets to the writable location
  try {
    final data = await rootBundle.load('assets/kakaninpedia.db');
    final bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write the database file
    await File(path).writeAsBytes(bytes, flush: true);
    print("Database copied to $path");
  } catch (e) {
    throw Exception("Error copying database: $e");
  }
  // } else {
  //   print("Database already exists at $path");
  // }

  // Open the database
  return openDatabase(path);
}

Future<List<Map<String, dynamic>>> fetchData() async {
  final db = await initializeDatabase();
  return await db
      .query('regions'); // Replace 'table_name' with your table's name
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
