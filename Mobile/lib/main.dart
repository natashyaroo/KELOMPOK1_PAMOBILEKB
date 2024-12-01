import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'pages/home_page.dart';
import 'pages/filter_page.dart';
import 'pages/results_page.dart';
import 'pages/settings_page.dart';
import 'pages/about_page.dart'; // Import AboutPage
import 'pages/details_page.dart'; // Import DetailsPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Builder(
        builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Prediksi Laptop',
            themeMode: themeProvider.themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            initialRoute: '/',
            routes: {
              '/': (context) => const HomePage(),
              '/filter': (context) => const FilterPage(),
              '/results': (context) => const ResultsPage(),
              '/settings': (context) => const SettingsPage(),
              '/about': (context) => const AboutPage(), // AboutPage route
              '/details': (context) => const DetailsPage(), // DetailsPage route
            },
          );
        },
      ),
    );
  }
}
