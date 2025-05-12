import 'package:flutter/material.dart';
import 'package:third_planet/components/my_drawer.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      drawer: MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Third Planet", style: TextStyle(fontSize: 32)),
                const SizedBox(height: 8),
                const Text("Version 1.0.0", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 16),
                const Text("Developed by Wai Lok Cheng", style: TextStyle(fontSize: 16)),
              ],
            )
          ],
        ),
      ),
    );
  }
}