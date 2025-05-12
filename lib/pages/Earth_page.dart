import 'package:flutter/material.dart';
import 'package:third_planet/components/my_drawer.dart';

class EarthPage extends StatefulWidget {
  const EarthPage({super.key});

  @override
  State<EarthPage> createState() => _EarthPageState();
}

class _EarthPageState extends State<EarthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: const Text('Earth')),
      drawer: MyDrawer(),
    );
  }
}