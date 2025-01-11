import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:kakaninai/consts/app_colors.dart';
import 'package:kakaninai/widgets/titles_text.dart';

class KakaninType extends StatelessWidget {
  final Map<String, dynamic> kakanin;

  const KakaninType({
    super.key,
    required this.kakanin,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          kakanin['kakanin_name']!,
          style: const TextStyle(
            fontSize: 23,
            color: AppColors.customOrange,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kakanin Image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                // child: Image.network(
                //   kakanin['image']!,
                //   height: size.height * 0.3,
                //   width: double.infinity,
                //   fit: BoxFit.cover,
                // ),
              ),
              const SizedBox(height: 16),
              // Kakanin Name
              Text(
                kakanin['kakanin_name']!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Origin
              Text(
                '${kakanin['municipality_name']}, ${kakanin['province_name']}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              // Description
              Text(
                kakanin['summary']!,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              const TitleTextWidget(
                label: 'Ingredients',
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8),
              Text(
                kakanin['ingredients']!,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              const TitleTextWidget(
                label: 'Procedure',
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8),
              Text(
                kakanin['procedure']!,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Similar Items',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Column(
              //     children: [
              //       Expanded(
              //         child: DynamicHeightGridView(
              //             builder: (context, index) {
              //               return KakaninWidget(
              //                 kakanin: data[index],
              //               );
              //             },
              //             itemCount: data.length,
              //             crossAxisCount: 2),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
