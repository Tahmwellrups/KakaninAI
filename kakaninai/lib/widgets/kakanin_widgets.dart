import 'package:flutter/material.dart';
import 'package:kakaninai/consts/app_colors.dart';


Widget buildHeader() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'KakaninAI',
          style: TextStyle(
            fontSize: 30,
            color: AppColors.customOrange,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const Text(
          'Discovering Filipino Kakanin',
          style: TextStyle(
              fontSize: 18
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {

          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.customOrange,
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
  );
}

Widget buildKakaninCard(String name, String imagePath) {
  return Card(
    child: ListTile(
      leading: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(name),
      subtitle: const Text('4.8/5'),
      trailing: const Icon(Icons.bookmark_border),
    ),
  );
}

Widget buildKakaninTypes() {
  final types = ['Puto', 'Biko', 'Suman', 'Bibingka'];
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
