import 'package:flutter/material.dart';
import '../consts/app_colors.dart';

class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'KakaninAI',
      style: TextStyle(
        fontSize: 23,
        color: AppColors.customOrange,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    );
  }
}
