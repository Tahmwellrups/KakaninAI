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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Kakanin Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        kakanin['image_file_location']!,
                        height: size.height * 0.3,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
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
                        if (kakanin['geographical_location'] == null ||
                            kakanin['geographical_location']!.isEmpty)
                          const ListTile(
                            title: Text('Geographical Location'),
                            subtitle: Text('No available information.'),
                          )
                        else
                          ListTile(
                            title: const Text('Geographical Location'),
                            subtitle: Text(kakanin['geographical_location']!,
                                textAlign: TextAlign.justify),
                          ),
                        if (kakanin['cultural_bearer_practitioner'] == null ||
                            kakanin['cultural_bearer_practitioner']!.isEmpty)
                          const ListTile(
                            title: Text('Cultural Bearer'),
                            subtitle: Text('No available information.'),
                          )
                        else
                          ListTile(
                            title: const Text('Cultural Bearer'),
                            subtitle: Text(
                                kakanin['cultural_bearer_practitioner']!,
                                textAlign: TextAlign.justify),
                          ),
                        if (kakanin['mode_of_transmission'] == null ||
                            kakanin['mode_of_transmission']!.isEmpty)
                          const ListTile(
                            title: Text('Mode of Transmission'),
                            subtitle: Text('No available information.'),
                          )
                        else
                          ListTile(
                            title: const Text('Mode of Transmission'),
                            subtitle: Text(kakanin['mode_of_transmission']!,
                                textAlign: TextAlign.justify),
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
                                    textAlign: TextAlign.justify,
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: '• History: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
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
                                    textAlign: TextAlign.justify,
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: '• Aesthetic Value: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
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
                                    textAlign: TextAlign.justify,
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: '• Cultural Value: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
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
                                    textAlign: TextAlign.justify,
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: '• Social Significance: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
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
                                    textAlign: TextAlign.justify,
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: '• Spiritual Value: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
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
                                    textAlign: TextAlign.justify,
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: '• Scientific Value: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
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
                                    textAlign: TextAlign.justify,
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: '• Socio-Economic Value: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                            text: kakanin['socio_economic']),
                                      ],
                                    ),
                                  ),
                                ),
                              if (kakanin['socio_political'] != null &&
                                  kakanin['socio_political']!.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text.rich(
                                    textAlign: TextAlign.justify,
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: '• Socio-Political Value: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: kakanin['socio_political'],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (kakanin['economic'] != null &&
                                  kakanin['economic']!.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text.rich(
                                    textAlign: TextAlign.justify,
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: '• Economic Value: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
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
                    ExpansionTile(
                      title: const Text(
                        'Assessment of the Practice',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        if (kakanin['condition_status'] == null ||
                            kakanin['condition_status']!.isEmpty)
                          const ListTile(
                            title: Text('Condition/Status of Kakanin'),
                            subtitle: Text('No available information.'),
                          )
                        else
                          ListTile(
                            title: const Text('Condition/Status of Kakanin'),
                            subtitle: Text(kakanin['condition_status']!,
                                textAlign: TextAlign.justify),
                          ),
                        if (kakanin['constraints_issues'] == null ||
                            kakanin['constraints_issues']!.isEmpty)
                          const ListTile(
                            title:
                                Text('Constraints/Threats/Issues/Challenges'),
                            subtitle: Text('No available information.'),
                          )
                        else
                          ListTile(
                            title: const Text(
                                'Constraints/Threats/Issues/Challenges'),
                            subtitle: Text(kakanin['constraints_issues']!,
                                textAlign: TextAlign.justify),
                          ),
                        if (kakanin['safeguarding_measures'] == null ||
                            kakanin['safeguarding_measures']!.isEmpty)
                          const ListTile(
                            title: Text('Safeguarding Measures'),
                            subtitle: Text('No available information.'),
                          )
                        else
                          ListTile(
                            title: const Text('Safeguarding Measures'),
                            subtitle: Text(kakanin['safeguarding_measures']!,
                                textAlign: TextAlign.justify),
                          ),
                      ],
                    ),
                    ExpansionTile(
                      title: const Text(
                        'Stories/Narratives',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        if (kakanin['stories_narratives'] == null ||
                            kakanin['stories_narratives']!.isEmpty)
                          const ListTile(
                            title: Text('No stories or narratives available.'),
                          )
                        else
                          ListTile(
                            title: const Text('Stories/Narratives'),
                            subtitle: Text(
                              kakanin['stories_narratives']!,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
