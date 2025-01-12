import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:kakaninai/widgets/kakanin/kakanin_widget.dart';

// // SQL package
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// Future<Database> initializeDatabase() async {
//   // Get the path to the database directory
//   final databasePath = await getDatabasesPath();
//   final path = join(databasePath, 'kakaninpedia.db');

//   // Open the database
//   return openDatabase(path);
// }

class KakaninClassDetails extends StatefulWidget {
  final Map<String, dynamic> kakaninList;

  const KakaninClassDetails({super.key, required this.kakaninList});

  @override
  State<KakaninClassDetails> createState() => _KakaninClassDetailsState();
}

class _KakaninClassDetailsState extends State<KakaninClassDetails> {
  List<Map<String, dynamic>> data = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchDataFromDatabase();
//   }

//   Future<List<Map<String, dynamic>>> fetchData() async {
//     final db = await initializeDatabase();
//     return await db.rawQuery('''
//         SELECT *, image_file_location AS image 
//         FROM kakanin
//         LEFT JOIN regions ON kakanin.region_id = regions.region_id
//         LEFT JOIN provinces ON kakanin.province_id = provinces.province_id
//         LEFT JOIN municipalities ON kakanin.municipality_id = municipalities.municipality_id
//         WHERE kakanin.kakanin_class_id = ?
//     ''', [widget.kakaninList['kakanin_class_id']]);
//     }

//   Future<void> fetchDataFromDatabase() async {
//     final dbData = await fetchData(); // Call your fetchData function
//     setState(() {
//       data = dbData;
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.kakaninList['kakanin_name']!),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: DynamicHeightGridView(
                  builder: (context, index) {
                    return KakaninWidget(
                      kakanin: widget.kakaninList,
                    );
                  },
                  itemCount: data.length,
                  crossAxisCount: 2),
            )
          ],
        ),
      ),
    );
  }
}
