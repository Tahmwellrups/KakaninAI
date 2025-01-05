import 'package:flutter/material.dart';
import 'package:kakaninai/widgets/titles_text.dart';

class KakaninDetails extends StatelessWidget {
  final String region;
  final String province;
  final String municipality;
  final String kakaninClass;
  final String kakanin;
  final String geographicalLocation;
  final String summary;
  final String culturalBearer;
  final String modeOfTransmission;
  final String csHistory;
  final String csAesthetic;
  final String csCultural;
  final String csSocial;
  final String csSpiritual;
  final String csScientific;
  final String csSocioEconomic;
  final String csSocioPolitical;
  final String csEconomic;
  final String status;
  final String constraints;
  final String safeguardingMeasures;
  final String stories;
  final String ingredients;
  final String procedure;
  final String image;

  const KakaninDetails({
    super.key,
    required this.region,
    required this.province,
    required this.municipality,
    required this.kakaninClass,
    required this.kakanin,
    required this.geographicalLocation,
    required this.summary,
    required this.culturalBearer,
    required this.modeOfTransmission,
    required this.csHistory,
    required this.csAesthetic,
    required this.csCultural,
    required this.csSocial,
    required this.csSpiritual,
    required this.csScientific,
    required this.csSocioEconomic,
    required this.csSocioPolitical,
    required this.csEconomic,
    required this.status,
    required this.constraints,
    required this.safeguardingMeasures,
    required this.stories,
    required this.ingredients,
    required this.procedure,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(kakanin),
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
                child: Image.network(
                  image,
                  height: size.height * 0.3,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              // Kakanin Name
              Text(
                kakanin,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Origin
              Text(
                '$municipality, $province',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              // Description
              Text(
                summary,
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
                ingredients,
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
                procedure,
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
                    subtitle: Text(geographicalLocation),
                  ),
                  ListTile(
                    title: const Text('Cultural Bearer'),
                    subtitle: Text(culturalBearer),
                  ),
                  ListTile(
                    title: const Text('Mode of Transmission'),
                    subtitle: Text(modeOfTransmission),
                  ),
                  ListTile(
                    title: const Text('Cultural Significance (History)'),
                    subtitle: Text(csHistory),
                  ),
                  ListTile(
                    title: const Text('Aesthetic Value'),
                    subtitle: Text(csAesthetic),
                  ),
                  ListTile(
                    title: const Text('Social Significance'),
                    subtitle: Text(csSocial),
                  ),
                  ListTile(
                    title: const Text('Spiritual Value'),
                    subtitle: Text(csSpiritual),
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
