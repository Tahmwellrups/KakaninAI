import 'package:flutter/material.dart';
import 'package:kakaninai/consts/app_colors.dart';
import 'package:kakaninai/screens/inner_screens/result_screen.dart';

Widget buildHeader(BuildContext context) {
  return Center(
    child: SizedBox(
      height: 200,
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
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.customOrange,
              foregroundColor: Colors.white,
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
  );
}
