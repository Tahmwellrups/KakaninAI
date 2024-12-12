import 'package:flutter/material.dart';

const Color customOrange = Color(0xFFFF784B);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      title: 'KakaninAI',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KakaninAI'),
        titleTextStyle: const TextStyle(
          fontSize: 23,
          color: customOrange,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 0.1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'KakaninAI',
                      style: TextStyle(
                        fontSize: 30,
                        color: customOrange, // Ensure customOrange is defined elsewhere
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8), // Add spacing between the texts
                    const Text(
                      'Discovering Filipino Kakanin',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16), // Add spacing before the button
                    ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: customOrange,
                        foregroundColor: Colors.white,
                        // elevation: 5,
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      ),
                      child: const Text(
                        'Upload Image',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Featured Kakanin',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildKakaninCard('Bibingka', 'assets/bibingka.jpg'),
              const SizedBox(height: 24),
              const Text(
                'Kakanin Types',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildKakaninTypes(),
              const SizedBox(height: 24),
              const Text(
                'My Kakanin Journey',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildJourneyCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKakaninCard(String name, String imagePath) {
    return Card(
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(name),
        subtitle: const Text('4.8/5'),
        trailing: const Icon(Icons.bookmark_border),
      ),
    );
  }

  Widget _buildKakaninTypes() {
    final types = ['Puto', 'Biko', 'Suman', 'Bibingka']; // Add more types
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: types.map((type) {
        return Chip(label: Text(type));
      }).toList(),
    );
  }

  Widget _buildJourneyCard() {
    return Card(
      child: ListTile(
        leading: Image.asset('assets/journey.jpg', width: 50, height: 50), // Replace
        title: const Text('Learning to Cook Kakanin'),
        subtitle: const LinearProgressIndicator(value: 0.85),
      ),
    );
  }
}
