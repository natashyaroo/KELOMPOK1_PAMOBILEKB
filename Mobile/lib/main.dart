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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
              '/': (context) => HomePage(),
              '/filter': (context) => FilterPage(),
              '/results': (context) => ResultsPage(),
              '/settings': (context) => SettingsPage(),
              '/about': (context) => AboutPage(), // AboutPage route
              '/details': (context) => DetailsPage(), // DetailsPage route
            },
          );
        },
      ),
    );
  }
}
