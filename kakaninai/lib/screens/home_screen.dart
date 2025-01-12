import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:kakaninai/widgets/app_name_text.dart';
import 'package:kakaninai/widgets/header_widget.dart';
import 'package:kakaninai/widgets/search_delegate.dart';

import '../widgets/kakanin/kakanin_class_widget.dart';
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

  if (!exists) {
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
  } else {
    print("Database already exists at $path");
  }

  // Open the database
  return openDatabase(path);
}

Future<List<Map<String, dynamic>>> fetchData() async {
  final db = await initializeDatabase();
  return await db.query('kakanin_class');
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> kakaninList = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromDatabase();
  }

  Future<void> fetchDataFromDatabase() async {
    final dbData = await fetchData(); // Call your fetchData function
    setState(() {
      kakaninList = dbData;
    });
  }

  // final List<Map<String, dynamic>> kakaninList = [
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(context),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Get Started",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // Horizontal ListView
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildFeatureCard(
                    "https://static01.nyt.com/images/2016/11/11/dining/COOKING-BIBINGKA1/COOKING-FILIPINO1-master768.jpg",
                    "How to Cook Bibingka",
                    "Lifestyle",
                  ),
                  buildFeatureCard(
                    "https://themayakitchen.com/wp-content/uploads/2018/10/SAPIN-SAPIN-500x500.jpg",
                    "Types of Kakanin",
                    "Guide",
                  ),
                  buildFeatureCard(
                    "https://www.seriouseats.com/thmb/W9cK95wrWNLlRtrxS3jqUWHonFs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/20210617-biko-vicky-wasik-seriouseats-seriouseats-27-62f3c7854d1443dfbe36f1b29dc1dae5.jpg",
                    "Popular Kakanin",
                    "Top Picks",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Popular Kakanin",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // DynamicHeightGridView
            SizedBox(
              height: 400, // Fixed height for the grid
              child: DynamicHeightGridView(
                crossAxisCount: 2,
                builder: (context, index) {
                  return KakaninClassWidget(kakanin: kakaninList[index]);
                },
                itemCount: kakaninList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFeatureCard(String imageUrl, String title, String subtitle) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
