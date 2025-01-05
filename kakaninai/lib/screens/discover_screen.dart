import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:kakaninai/consts/app_constants.dart';
import 'package:kakaninai/widgets/app_name_text.dart';
import 'package:kakaninai/widgets/kakanin/kakanin_widget.dart';
import 'package:kakaninai/widgets/titles_text.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  late TextEditingController searchController;

  // Sample data for kakanin
  final List<Map<String, dynamic>> kakaninList = [
    {
      'region': 'Cordillera Administrative Region',
      'province': 'Kalinga',
      'municipality': 'Lubuagan',
      'kakanin_class': 'Suman',
      'kakanin': 'Ilanchila',
      'geographical_location':
          'Whole municipality of Lubuagan and the rest of the municipalities of the province of Kalinga',
      'summary':
          'Ilanchila (coined from the native terms silan, which means "like," and chila, which means "tongue," as it looks "like a tongue") is the most popular traditional snack served not only in Lubuagan but also in other municipalities of the province of Kalinga.',
      'cultural_bearer':
          'Some iLubuagen women usually aged 40 years old and above',
      'mode_of_transmission':
          'Through the demonstration of the women in the community which is observed by the young ones',
      'cs_history':
          'Ilanchila is a snack that is part of the Ilubuagen’s way of life since the past. It is greatly valued as the tastiest snack being utilized or served during the performance of almost all traditional rites in Lubuagan.',
      'cs_aesthetic':
          'The Ilanchila’s chewiness makes it tasty and the sweet and nutty flavor of the coconut milk and coconut milk curds make the snack irresistible.',
      'cs_cultural': '',
      'cs_social':
          'The ilanchila is served as a snack during rites; thus, usually shared together with relatives, friends, and neighbors.',
      'cs_spiritual':
          'The ilanchila is being offered as a food provision for a recently buried dead.',
      'cs_scientific': '',
      'cs_socioEconomic': '',
      'cs_socioPolitical': '',
      'cs_economic': '',
      'status':
          'Always cooked during atod, sibit, umila and songot and even served nowadays in other occasions',
      'constraints': '',
      'safeguarding_measures':
          'transmission, particularly through non-formal education, identification, documentation, research, promotion, enhancement',
      'stories':
          'Once upon a time, there was a woman named Alus. She wanted to get a byatok (tattoo) so she decided to visit mambyabyatok (tattooist) Asselegen in the village of Sumadel of the municipality of Tinglayan.',
      'ingredients':
          'Iyug (coconut), Takung Leaf (taktakkong), Wallay/Wallayan (white sticky rice)',
      'procedure':
          '1. Grate the coconut and extract the coconut milk. 2. Mix the coconut milk with the sticky rice. 3. Wrap the mixture in takung leaves. 4. Steam the wrapped mixture for 30 minutes. 5. Serve.',
      'image':
          'https://scontent.fmnl25-4.fna.fbcdn.net/v/t39.30808-6/227853265_4015658188546560_3182755794155100115_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeElGLWUgxuU-AFx_ceWW2VG-MIsWx3_46z4wixbHf_jrIRaAUT7h9Vz2qVmuU23_KpXE8xdAbd8-DcISR8NSixB&_nc_ohc=qbwPHisC2AkQ7kNvgHUtlDa&_nc_zt=23&_nc_ht=scontent.fmnl25-4.fna&_nc_gid=AnfaDpntg4j5jb5l7ugyTE3&oh=00_AYA0-hEDBgi3dEgYnFRVNHGRKI8q_0r28pqxxHyrpcgBoA&oe=6780107D',
    },
    // Add more items as needed
  ];

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const AppNameTextWidget(),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleTextWidget(
                label: 'Discover',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search for kakanin',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      searchController.clear();
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onFieldSubmitted: (value) {
                  // Add search functionality here
                  print(searchController.text);
                },
              ),
              const SizedBox(height: 24),
              const TitleTextWidget(
                label: 'Kakanin Types',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: DynamicHeightGridView(
                  crossAxisCount: 2,
                  builder: (context, index) {
                    final kakanin = kakaninList[index];
                    return KakaninWidget(
                      region: kakanin['region'],
                      province: kakanin['province'],
                      municipality: kakanin['municipality'],
                      kakaninClass: kakanin['kakanin_class'],
                      kakanin: kakanin['kakanin'],
                      geographicalLocation: kakanin['geographical_location'],
                      summary: kakanin['summary'],
                      culturalBearer: kakanin['cultural_bearer'],
                      modeOfTransmission: kakanin['mode_of_transmission'],
                      csHistory: kakanin['cs_history'],
                      csAesthetic: kakanin['cs_aesthetic'],
                      csCultural: kakanin['cs_cultural'],
                      csSocial: kakanin['cs_social'],
                      csSpiritual: kakanin['cs_spiritual'],
                      csScientific: kakanin['cs_scientific'],
                      csSocioEconomic: kakanin['cs_socioEconomic'],
                      csSocioPolitical: kakanin['cs_socioPolitical'],
                      csEconomic: kakanin['cs_economic'],
                      status: kakanin['status'],
                      constraints: kakanin['constraints'],
                      safeguardingMeasures: kakanin['safeguarding_measures'],
                      stories: kakanin['stories'],
                      ingredients: kakanin['ingredients'],
                      procedure: kakanin['procedure'],
                      image: kakanin['image'],
                    );
                  },
                  itemCount: kakaninList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
