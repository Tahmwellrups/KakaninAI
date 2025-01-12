import 'package:flutter/material.dart';
// import 'package:kakaninai/screens/inner_screens/kakanin_details.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'consts/theme_data.dart';
import 'root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'KakaninAI',
            theme: Styles.themeData(
                isDarkTheme: themeProvider.darkTheme, context: context),
            home: const RootScreen(),
            // routes: {
            //   KakaninDetails.routeName: (context) => const KakaninDetails(),
            // },
          );
        },
      ),
    );
  }
}
