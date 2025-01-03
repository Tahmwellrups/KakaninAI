import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'consts/theme_data.dart';
import 'root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false, 
            title: 'KakaninAI',
            theme: Styles.themeData(
              isDarkTheme: themeProvider.darkTheme, context: context),
            home: const RootScreen(),
          );
        },
      ),
   
    );
  }
}

// class BottomNavScreen extends StatefulWidget {
//   const BottomNavScreen({super.key});

//   @override
//   State<BottomNavScreen> createState() => _BottomNavScreenState();
// }

// class _BottomNavScreenState extends State<BottomNavScreen> {
//   int _selectedIndex = 0;

//   static const List<Widget> _pages = [
//     HomeScreen(),
//     CatalogueScreen(),
//     RegionsScreen(),
//     MoreScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Catalogue'),
//           BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Regions'),
//           BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: AppColors.customOrange,
//         unselectedItemColor: Colors.grey,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
