import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:third_planet/components/my_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:third_planet/env/env.dart';  // Import your environment variables if needed

// This page is to display information about Earth, the third planet in the solar system.

class EarthPage extends StatefulWidget {
  const EarthPage({super.key});

  @override
  State<EarthPage> createState() => _EarthPageState();
}

class _EarthPageState extends State<EarthPage> {
  // fetch data from an API
  Future<http.Response> fetchData() async {
    final response = await http.get(Uri.parse('${Env.endpoint}/EPIC/api/natural?api_key=${Env.apiKey}'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load data');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: const Text('Earth')),
      drawer: MyDrawer(),
      body: Center(
        child: FutureBuilder<http.Response>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final res = jsonDecode(snapshot.data?.body ?? '');
              if (res.isEmpty) {
                return const Text('No data available');
              }
              final mostRecentImageDate = res[res.length-1]['date'];
              final mostRecentImageDateYear = mostRecentImageDate.substring(0, 4);
              final mostRecentImageDateMonth = mostRecentImageDate.substring(5, 7);
              final mostRecentImageDateDay = mostRecentImageDate.substring(8, 10);
              final mostRecentImageName = res[res.length-1]['image'];
              final mostRecentImageCaption = res[res.length-1]['caption'];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    mostRecentImageCaption,
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Image.network(
                    '${Env.imageUrl}/archive/natural/$mostRecentImageDateYear/$mostRecentImageDateMonth/$mostRecentImageDateDay/png/$mostRecentImageName.png',
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: SizedBox(
                          height: 300,
                          width: 300,
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Most recent image of Earth:',
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '$mostRecentImageDate',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}