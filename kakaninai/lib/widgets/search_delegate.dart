import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class MySearchDelegate extends SearchDelegate<String> {
  final List<String> _kakaninList = ['Bibingka', 'Puto', 'Biko', 'Suman'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(HeroiconsSolid.xMark),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(HeroiconsSolid.arrowLeft),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _kakaninList
        .where((kakanin) => kakanin.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return _buildList(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = _kakaninList
        .where((kakanin) => kakanin.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return _buildList(suggestions);
  }

  Widget _buildList(List<String> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
          onTap: () => close(context, items[index]),
        );
      },
    );
  }
}
