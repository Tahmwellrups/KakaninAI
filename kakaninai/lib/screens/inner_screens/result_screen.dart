import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:kakaninai/consts/app_colors.dart';
import 'package:kakaninai/widgets/app_name_text.dart';
import 'package:kakaninai/widgets/search_delegate.dart';

class ResultScreen extends StatelessWidget {

  ResultScreen({super.key});

  final List<Map<String, dynamic>> kakanin = [
    {
      'kakanin_name': 'Puto',
      'image': 'https://www.recipesbynora.com/wp-content/uploads/2023/09/Kutsinta-on-a-banana-leaf-featured-image-1.jpg',
      'summary': 'Puto is a type of steamed rice cake usually served as snack or as accompaniment to savory dishes such as dinuguan or pancit in the Philippines. It is also known as kakanin, derived from the word "kanin" which means rice in Tagalog.',
      'municipality': 'Various',
      'province': 'Various',
      'region': 'Region 3 - Central Luzon',
    },
    {
      'kakanin_name': 'Kutsinta',
      'image': 'https://www.recipesbynora.com/wp-content/uploads/2023/09/Kutsinta-on-a-banana-leaf-featured-image-1.jpg',
      'summary': 'Kutsinta is a type of steamed rice cake usually served as snack or as accompaniment to savory dishes such as dinuguan or pancit in the Philippines. It is also known as kakanin, derived from the word "kanin" which means rice in Tagalog.',
      'municipality': 'Various',
      'province': 'Various',
    },
    {
      'kakanin_name': 'Puto Bumbong',
      'image': 'https://www.recipesbynora.com/wp-content/uploads/2023/09/Kutsinta-on-a-banana-leaf-featured-image-1.jpg',
      'summary': 'Puto Bumbong is a type of steamed rice cake usually served as snack or as accompaniment to savory dishes such as dinuguan or pancit in the Philippines. It is also known as kakanin, derived from the word "kanin" which means rice in Tagalog.',
      'municipality': 'Various',
      'province': 'Various',
    },
  ];

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
                    ClipRect(
                      child: Image.network(
                        'https://www.recipesbynora.com/wp-content/uploads/2023/09/Kutsinta-on-a-banana-leaf-featured-image-1.jpg', // Replace with dynamic URL
                        height: 100,
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
                            size: 100,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Kakanin Class: Puto',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Puto Kutsinta',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.red,
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
                          color: AppColors.customOrange,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Similar Items
            const Text(
              'Similar Items',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // ListView of Items
            Expanded(
              child: Container(
                color:
                    Colors.grey[200], // Set your desired background color here
                child: ListView.builder(
                  itemCount: 3, // Example item count
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      leading: SizedBox(
                        width: 50, // Constrain the width of the leading widget
                        height:
                            50, // Constrain the height of the leading widget
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/f/f2/Kutsinta.jpg', // Replace with dynamic URL
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
                                size: 50,
                                color: Colors.grey,
                              );
                            },
                          ),
                        ),
                      ),
                      title: const Text(
                        'Kutsinta',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
