import 'package:flutter/material.dart';
import 'package:third_planet/components/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: const Text('Home')),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedRotation(
              turns: 150,
              duration: const Duration(hours: 1),
              curve: Curves.linear,
              child: Icon(
                Icons.public,
                size: 300,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),  // Add some spacing between icon and text
            const Text('The third planet in the solar system', 
              style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}