import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'screens/home_screen.dart';
import 'screens/discover_screen.dart';
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
    const DiscoverScreen(),
    const RegionsScreen(),
    const MoreScreen(),
  ];

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            currentScreen = index;
          });
        },
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreen,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        height: kBottomNavigationBarHeight,
        elevation: 5,
        onDestinationSelected: (value) {
          setState(() {
            currentScreen = value;
          });
          controller.jumpToPage(currentScreen);
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(HeroiconsSolid.home), // Selected icon
            icon: Icon(HeroiconsOutline.home), // Default icon
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(HeroiconsSolid.magnifyingGlass), // Selected icon
            icon: Icon(HeroiconsOutline.magnifyingGlass), // Default icon
            label: 'Discover',
          ),
          NavigationDestination(
            selectedIcon: Icon(HeroiconsSolid.map), // Selected icon
            icon: Icon(HeroiconsOutline.map), // Default icon
            label: 'Regions',
          ),
          NavigationDestination(
            selectedIcon:
                Icon(HeroiconsSolid.ellipsisHorizontalCircle), // Selected icon
            icon:
                Icon(HeroiconsOutline.ellipsisHorizontalCircle), // Default icon
            label: 'More',
          ),
        ],
      ),
    );
  }
}
