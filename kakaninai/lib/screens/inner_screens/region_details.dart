import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:kakaninai/widgets/kakanin/kakanin_widget.dart';

// SQL package
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> initializeDatabase() async {
  // Get the path to the database directory
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, 'kakaninpedia.db');

  // Open the database
  return openDatabase(path);
}

class RegionDetails extends StatefulWidget {
  final Map<String, dynamic> region;

  const RegionDetails({super.key, required this.region});

  @override
  State<RegionDetails> createState() => _RegionDetailsState();
}

class _RegionDetailsState extends State<RegionDetails> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromDatabase();
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    final db = await initializeDatabase();
    return await db.rawQuery('''
      SELECT *, image_file_location AS image 
      FROM kakanin
      LEFT JOIN regions ON kakanin.region_id = regions.region_id
      LEFT JOIN provinces ON kakanin.province_id = provinces.province_id
      LEFT JOIN municipalities ON kakanin.municipality_id = municipalities.municipality_id
      WHERE kakanin.region_id = ?''', [widget.region['region_id']]);
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
        title: Text(widget.region['region_name']!),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         widget.region['region_name']!,
      //         style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //       ),
      //       const SizedBox(height: 16),
      //       // for (var item in data) Text(item['kakanin_name']),
      //       // ListView.builder(
      //       //   // itemCount: data.length,
      //       //   itemCount: 1,
      //       //   padding: const EdgeInsets.symmetric(vertical: 8.0),
      //       //   itemBuilder: (context, index) {
      //       //     // final region = data[index];
      //       //     return Card(
      //       //         margin: const EdgeInsets.symmetric(
      //       //             vertical: 8.0, horizontal: 16.0),
      //       //         shape: RoundedRectangleBorder(
      //       //           borderRadius: BorderRadius.circular(12.0),
      //       //         ),
      //       //         elevation: 4.0,
      //       //         child: GestureDetector(
      //       //           // onTap: () {
      //       //           //   Navigator.push(
      //       //           //     context,
      //       //           //     MaterialPageRoute(
      //       //           //       builder: (context) => KakaninDetails(kakanin: region),
      //       //           //     ),
      //       //           //   );
      //       //           // },
      //       //           child: ListTile(
      //       //             leading: ClipRRect(
      //       //               borderRadius: BorderRadius.circular(8.0),
      //       //               // child: Image.asset(
      //       //               //   region['image']!,
      //       //               //   // 'images/region_images/ncr-1.png',
      //       //               //   // 'https://via.placeholder.com/150',
      //       //               //   width: 50,
      //       //               //   height: 50,
      //       //               //   fit: BoxFit.cover,
      //       //               //   color: const Color.fromARGB(255, 247, 242, 250),
      //       //               //   colorBlendMode: BlendMode.multiply,
      //       //               //   // loadingBuilder: (context, child, loadingProgress) {
      //       //               //   //   if (loadingProgress == null) return child;
      //       //               //   //   return const Center(
      //       //               //   //     child: CircularProgressIndicator(),
      //       //               //   //   );
      //       //               //   // },
      //       //               //   // errorBuilder: (context, error, stackTrace) {
      //       //               //   //   return const Icon(
      //       //               //   //     Icons.broken_image,
      //       //               //   //     size: 50,
      //       //               //   //     color: Colors.grey,
      //       //               //   //   );
      //       //               //   // },
      //       //               // ),
      //       //             ),
      //       //             title: const Text(
      //       //               'TITEEE', // FIX THIS
      //       //               style: TextStyle(
      //       //                 fontSize: 16.0,
      //       //                 fontWeight: FontWeight.bold,
      //       //               ),
      //       //             ),
      //       //             trailing: const Icon(Icons.arrow_forward_ios),
      //       //           ),
      //       //         ));
      //       //   },
      //       // ),
      //     ],
      //   ),
      // ),
      // body: ListView.builder(
      //   itemCount: data.length,
      //   // itemCount: 1,
      //   padding: const EdgeInsets.symmetric(vertical: 8.0),
      //   itemBuilder: (context, index) {
      //     final kakanin = data[index];
      //     // print(kakanin['kakanin_name']);
      //     return Card(
      //         margin:
      //             const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(12.0),
      //         ),
      //         elevation: 4.0,
      //         child: GestureDetector(
      //           // onTap: () {
      //           //   Navigator.push(
      //           //     context,
      //           //     MaterialPageRoute(
      //           //       builder: (context) => KakaninDetails(kakanin: region),
      //           //     ),
      //           //   );
      //           // },
      //           child: ListTile(
      //             leading: ClipRRect(
      //               borderRadius: BorderRadius.circular(8.0),
      //               // child: Image.asset(
      //               //   region['image']!,
      //               //   // 'images/region_images/ncr-1.png',
      //               //   // 'https://via.placeholder.com/150',
      //               //   width: 50,
      //               //   height: 50,
      //               //   fit: BoxFit.cover,
      //               //   color: const Color.fromARGB(255, 247, 242, 250),
      //               //   colorBlendMode: BlendMode.multiply,
      //               //   // loadingBuilder: (context, child, loadingProgress) {
      //               //   //   if (loadingProgress == null) return child;
      //               //   //   return const Center(
      //               //   //     child: CircularProgressIndicator(),
      //               //   //   );
      //               //   // },
      //               //   // errorBuilder: (context, error, stackTrace) {
      //               //   //   return const Icon(
      //               //   //     Icons.broken_image,
      //               //   //     size: 50,
      //               //   //     color: Colors.grey,
      //               //   //   );
      //               //   // },
      //               // ),
      //             ),
      //             title: Text(
      //               kakanin['kakanin_name'], // FIXED
      //               style: const TextStyle(
      //                 fontSize: 16.0,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //             trailing: const Icon(Icons.arrow_forward_ios),
      //           ),
      //         ));
      //   },
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: DynamicHeightGridView(
                  builder: (context, index) {
                    return KakaninWidget(
                      kakanin: data[index],
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
