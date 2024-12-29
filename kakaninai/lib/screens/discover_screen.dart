import 'package:flutter/material.dart';
import 'package:kakaninai/widgets/app_name_text.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Discover Screen'),
      ),
    );
  }
}
