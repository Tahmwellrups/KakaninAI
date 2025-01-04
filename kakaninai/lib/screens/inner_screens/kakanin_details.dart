import 'package:flutter/material.dart';

class KakaninDetails extends StatefulWidget {
  const KakaninDetails({super.key});

  @override
  State<KakaninDetails> createState() => _KakaninDetailsState();
}

class _KakaninDetailsState extends State<KakaninDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kakanin Details'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Kakanin Details Screen'),
      ),
    );
  }
}