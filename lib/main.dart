import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third_planet/pages/home_page.dart';
import 'package:third_planet/themes/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => ThemeProvider(), child: const MyApp()),
  );
}

// root of your application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Third Planet',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
