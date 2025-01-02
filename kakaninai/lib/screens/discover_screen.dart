import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:kakaninai/widgets/app_name_text.dart';
import 'package:kakaninai/widgets/products/products_widget.dart';
// import 'package:kakaninai/widgets/kakanin_widgets.dart';
import 'package:kakaninai/widgets/titles_text.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  late TextEditingController searchController;

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
                  label: 'Discover', fontSize: 20, fontWeight: FontWeight.bold),
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
                  print(searchController.text);
                },
              ),
              const SizedBox(height: 24),
              const TitleTextWidget(
                  label: 'Kakanin Types',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              const SizedBox(height: 8),
              Expanded(
                child: DynamicHeightGridView(
                  crossAxisCount: 2,
                  builder: (context, index) {
                    return const ProductWidget();
                    // return Container(
                    //   decoration: BoxDecoration(
                    //     color: Colors.grey[200],
                    //     borderRadius: BorderRadius.circular(8),
                    //   ),
                    //   child: Center(
                    //     child: Text('Kakanin $index'),
                    //   ),
                    // );
                  },
                  itemCount: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
