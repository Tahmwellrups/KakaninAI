import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:kakaninai/screens/inner_screens/kakanin_details.dart';

class KakaninWidget extends StatelessWidget {
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

  const KakaninWidget({
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

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KakaninDetails(
              region: region,
              province: province,
              municipality: municipality,
              kakaninClass: kakaninClass,
              kakanin: kakanin,
              geographicalLocation: geographicalLocation,
              summary: summary,
              culturalBearer: culturalBearer,
              modeOfTransmission: modeOfTransmission,
              csHistory: csHistory,
              csAesthetic: csAesthetic,
              csCultural: csCultural,
              csSocial: csSocial,
              csSpiritual: csSpiritual,
              csScientific: csScientific,
              csSocioEconomic: csSocioEconomic,
              csSocioPolitical: csSocioPolitical,
              csEconomic: csEconomic,
              status: status,
              constraints: constraints,
              safeguardingMeasures: safeguardingMeasures,
              stories: stories,
              ingredients: ingredients,
              procedure: procedure,
              image: image,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: FancyShimmerImage(
                imageUrl: image,
                height: size.height * 0.18,
                boxFit: BoxFit.cover,
              ),
            ),
            // Product Details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kakanin,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    province,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Text(
                  //   description,
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: const TextStyle(
                  //     fontSize: 12,
                  //     color: Colors.black87,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
