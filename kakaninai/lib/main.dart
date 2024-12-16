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
      home: const BottomNavScreen(),
    );
  }
}

// Main Navigation Screen
class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  // List of screens for navigation
  static const List<Widget> _pages = [
    HomeScreen(),
    CatalogueScreen(),
    RegionsScreen(),
    FunFactsScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Catalogue',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Regions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Fun Facts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: customOrange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Home Screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context, 
                delegate: MySearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/puto.jpg'),
                      opacity: 0.3, 
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20), 
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'KakaninAI',
                          style: TextStyle(
                            fontSize: 30,
                            color: customOrange,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Discovering Filipino Kakanin',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: customOrange,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          ),
                          label: const Text(
                            'Upload Image',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Featured Kakanin',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildKakaninCard('Bibingka', 'images/bibingka.jpg'),
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
              // _buildJourneyCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKakaninCard(String name, String imagePath) {
    return Card(
      child: ListTile(
        leading:
            Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(name),
        subtitle: const Text('4.8/5'),
        trailing: const Icon(Icons.bookmark_border),
      ),
    );
  }

  Widget _buildKakaninTypes() {
    final types = ['Puto', 'Biko', 'Suman', 'Bibingka']; // Add more types
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: types.map((type) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Chip(label: Text(type)),
          );
        }).toList(),
      ),
    );
  }

  // Widget _buildJourneyCard() {
  //   return Card(
  //     child: ListTile(
  //       leading: Image.asset('assets/journey.jpg', width: 50, height: 50),
  //       title: const Text('Learning to Cook Kakanin'),
  //       subtitle: const LinearProgressIndicator(value: 0.85),
  //     ),
  //   );
  // }
}

class MySearchDelegate extends SearchDelegate<String> {
    final List<String> _kakaninList = [
      'Bibingka',
      'Puto',
      'Biko',
      'Suman',
      // Add more kakanin names here
    ];

    @override
    List<Widget> buildActions(BuildContext context) {
      return [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        ),
      ];
    }

    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, '');
        },
      );
    }

    @override
    Widget buildResults(BuildContext context) {
      final results = _kakaninList.where((kakanin) => kakanin.toLowerCase().contains(query.toLowerCase())).toList();

      return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(results[index]),
            onTap: () {
              close(context, results[index]);
            },
          );
        },
      );
    }

    @override
    Widget buildSuggestions(BuildContext context) {
      final suggestions = _kakaninList.where((kakanin) => kakanin.toLowerCase().contains(query.toLowerCase())).toList();

      return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suggestions[index]),
            onTap: () {
              query = suggestions[index];
              showResults(context);
            },
          );
        },
      );
    }
  } 

// Placeholder Screens for Navigation
class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Catalogue Screen'));
  }
}

class RegionsScreen extends StatelessWidget {
  const RegionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Regions Screen'));
  }
}

class FunFactsScreen extends StatelessWidget {
  const FunFactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Fun Facts Screen'));
  }
}

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('More Screen'));
  }
}
