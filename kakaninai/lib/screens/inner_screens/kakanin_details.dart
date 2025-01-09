import 'package:flutter/material.dart';
import 'package:kakaninai/widgets/titles_text.dart';

class KakaninDetails extends StatelessWidget {
  final Map<String, dynamic> kakanin;

  const KakaninDetails({
    super.key,
    required this.kakanin,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(kakanin['kakanin_name']!),
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

              // Cultural Background Dropdown
              ExpansionTile(
                title: const Text(
                  'Cultural Background',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  ListTile(
                    title: const Text('Geographical Location'),
                    subtitle: Text(kakanin['geographical_location']!),
                  ),
                  ListTile(
                    title: const Text('Cultural Bearer'),
                    subtitle: Text(kakanin['cultural_bearer_practitioner']!),
                  ),
                  ListTile(
                    title: const Text('Mode of Transmission'),
                    subtitle: Text(kakanin['mode_of_transmission']!),
                  ),
                  ListTile(
                    title: const Text('Cultural Significance (History)'),
                    subtitle: Text(kakanin['cultural']!),
                  ),
                  ListTile(
                    title: const Text('Aesthetic Value'),
                    subtitle: Text(kakanin['aesthetic']!),
                  ),
                  ListTile(
                    title: const Text('Social Significance'),
                    subtitle: Text(kakanin['social']!),
                  ),
                  ListTile(
                    title: const Text('Spiritual Value'),
                    subtitle: Text(kakanin['spiritual']!),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
