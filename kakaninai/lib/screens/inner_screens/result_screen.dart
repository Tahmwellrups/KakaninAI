import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:kakaninai/widgets/app_name_text.dart';
import 'package:kakaninai/widgets/search_delegate.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(HeroiconsSolid.magnifyingGlass),
            padding: const EdgeInsets.only(right: 16.0),
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Uploaded Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/f/f2/Kutsinta.jpg', // Replace with dynamic URL
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.broken_image,
                    size: 200,
                    color: Colors.grey,
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Upload Button
            ElevatedButton(
              onPressed: () {
                // Add functionality to upload an image
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 12.0,
                ),
              ),
              child: const Text(
                'Upload Image',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 24),
            // Classification Result Card
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Classification Result',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Result Image
                    ClipOval(
                      child: Image.network(
                        'https://your-cloud-storage-url.com/classification-result.jpg', // Replace with dynamic URL
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.broken_image,
                            size: 100,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Puto - 92.5%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        // Navigate to details page
                      },
                      child: const Text(
                        'Learn more >>',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
