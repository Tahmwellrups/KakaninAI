import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:kakaninai/widgets/app_name_text.dart';
import '../widgets/search_delegate.dart';
import '../widgets/kakanin_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(HeroiconsSolid.magnifyingGlass),
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
            // Header Section
            buildHeader(),

            const SizedBox(height: 24),

            // Featured Kakanin Section
            const Text(
              'Featured Kakanin',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            // Carousel Slider
            CarouselSlider(
              options: CarouselOptions(
                height: size.height * 0.25,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: [
                'https://themayakitchen.com/wp-content/uploads/2018/10/SAPIN-SAPIN-500x500.jpg',
                'https://www.seriouseats.com/thmb/W9cK95wrWNLlRtrxS3jqUWHonFs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/20210617-biko-vicky-wasik-seriouseats-seriouseats-27-62f3c7854d1443dfbe36f1b29dc1dae5.jpg',
                'https://static01.nyt.com/images/2016/11/11/dining/COOKING-BIBINGKA1/COOKING-FILIPINO1-master768.jpg',
              ].map((imageUrl) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            // Discover Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/discover');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Center(
                child: Text(
                  'Discover All Kakanin',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Categories Section
            const Text(
              'Explore by Category',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryChip('Sweet Kakanin'),
                  _buildCategoryChip('Festive Favorites'),
                  _buildCategoryChip('Sticky Rice Cakes'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Trivia Section
            const Text(
              'Did You Know?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'The word "kakanin" comes from the Tagalog words "kain" (to eat) and "kanin" (rice).',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.orange[100],
      ),
    );
  }
}
