import 'package:flutter/material.dart';
import '../widgets/search_delegate.dart';
import '../widgets/kakanin_widgets.dart';
import '../consts/app_colors.dart';

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
          color: AppColors.customOrange,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
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
            buildHeader(),
            const SizedBox(height: 24),
            const Text(
              'Featured Kakanin',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            buildKakaninCard('Bibingka', 'images/bibingka.jpg'),
            const SizedBox(height: 24),
            const Text(
              'Kakanin Types',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            buildKakaninTypes(),
          ],
        ),
      ),
    );
  }
}