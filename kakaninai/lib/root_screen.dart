import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/catalogue_screen.dart';
import 'screens/regions_screen.dart';
import 'screens/more_screen.dart';
// import 'consts/app_colors.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late PageController controller;
  int currentScreen = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const CatalogueScreen(),
    const RegionsScreen(),
    const MoreScreen(),
  ];

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: currentScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: screens,
      ),
    
    );
  }
}