import 'package:flutter/material.dart';
import 'package:kakaninai/screens/inner_screens/kakanin_details.dart';

// SQL package
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> initializeDatabase() async {
  // Get the path to the database directory
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, 'kakaninpedia.db');

  // Check if the database already exists
  // final exists = await databaseExists(path);

  // if (!exists) {
  //   // Copy the database from assets to the writable location
  //   try {
  //     final data = await rootBundle.load('assets/kakaninpedia.db');
  //     final bytes =
  //         data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

  //     // Write the database file
  //     await File(path).writeAsBytes(bytes, flush: true);
  //     print("Database copied to $path");
  //   } catch (e) {
  //     throw Exception("Error copying database: $e");
  //   }
  // } else {
  //   print("Database already exists at $path");
  // }

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
      SELECT kakanin_id, kakanin_name FROM kakanin 
      WHERE region_id = ?''', [widget.region['region_id']]);
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.region['region_name']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            for (var item in data) Text(item['kakanin_name']),
            ListView.builder(
              itemCount: data.length,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemBuilder: (context, index) {
                final region = data[index];
                return Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 4.0,
                    child: GestureDetector(
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => KakaninDetails(kakanin: region),
                      //     ),
                      //   );
                      // },
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            region['image']!,
                            // 'images/region_images/ncr-1.png',
                            // 'https://via.placeholder.com/150',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            color: const Color.fromARGB(255, 247, 242, 250),
                            colorBlendMode: BlendMode.multiply,
                            // loadingBuilder: (context, child, loadingProgress) {
                            //   if (loadingProgress == null) return child;
                            //   return const Center(
                            //     child: CircularProgressIndicator(),
                            //   );
                            // },
                            // errorBuilder: (context, error, stackTrace) {
                            //   return const Icon(
                            //     Icons.broken_image,
                            //     size: 50,
                            //     color: Colors.grey,
                            //   );
                            // },
                          ),
                        ),
                        title: Text(
                          data, // FIX THIS
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
