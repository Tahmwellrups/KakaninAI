import 'package:flutter/material.dart';
import 'package:kakaninai/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SwitchListTile(
          title: Text(themeProvider.darkTheme ? 'Dark Mode' : 'Light Mode'),
          value: themeProvider.darkTheme,
          onChanged: (value) {
            themeProvider.setDarkTheme(themevalue: value);
          },
        )
      ],
    );
  }
}
