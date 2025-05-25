import 'package:flutter/material.dart';
import 'package:third_planet/components/my_drawer.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
@override
Widget build(BuildContext context) {
  return FutureBuilder<PackageInfo>(
    future: PackageInfo.fromPlatform(),
    builder: (context, snapshot) {
      String version = '...';
      String code = '...';
      if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
        version = snapshot.data!.version;
        code = snapshot.data!.buildNumber;
      }
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
                  Text("Version $version+$code", style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 16),
                  const Text("Developed by Wai Lok Cheng", style: TextStyle(fontSize: 16)),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
}