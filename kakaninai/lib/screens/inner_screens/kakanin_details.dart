import 'package:flutter/material.dart';
import 'package:kakaninai/consts/app_colors.dart';
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
                    title: const Text('Cultural Significance'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (kakanin['history'] != null &&
                            kakanin['history']!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: '• History: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: kakanin['history']),
                                ],
                              ),
                            ),
                          ),
                        if (kakanin['aesthetic'] != null &&
                            kakanin['aesthetic']!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: '• Aesthetic Value: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: kakanin['aesthetic']),
                                ],
                              ),
                            ),
                          ),
                        if (kakanin['cultural'] != null &&
                            kakanin['cultural']!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: '• Cultural Value: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: kakanin['cultural']),
                                ],
                              ),
                            ),
                          ),
                        if (kakanin['social'] != null &&
                            kakanin['social']!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: '• Social Significance: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: kakanin['social']),
                                ],
                              ),
                            ),
                          ),
                        if (kakanin['spiritual'] != null &&
                            kakanin['spiritual']!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: '• Spiritual Value: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: kakanin['spiritual']),
                                ],
                              ),
                            ),
                          ),
                        if (kakanin['scientific'] != null &&
                            kakanin['scientific']!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: '• Scientific Value: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: kakanin['scientific']),
                                ],
                              ),
                            ),
                          ),
                        if (kakanin['socio_economic'] != null &&
                            kakanin['socio_economic']!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: '• Socio-Economic Value: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: kakanin['socio_economic']),
                                ],
                              ),
                            ),
                          ),
                        if (kakanin['socio_political'] != null &&
                            kakanin['socio_political']!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: '• Socio-Political Value: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: kakanin['socio_political']),
                                ],
                              ),
                            ),
                          ),
                        if (kakanin['economic'] != null &&
                            kakanin['economic']!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: '• Economic Value: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: kakanin['economic']),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
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
