import 'dart:async';
import 'package:flutter/material.dart';
import 'package:third_planet/components/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String get _header => 'Earth';
  String get _subHeader => 'The third planet in the solar system';
  List<MapEntry<String, double>> _headerChars = [];
  List<MapEntry<String, double>> _subHeaderChars = [];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _headerChars = _header.split('').map((char) => MapEntry(char, 0.0)).toList();
    _subHeaderChars = _subHeader.split('').map((char) => MapEntry(char, 0.0)).toList();
    _startAnimation();
  }

  void _startAnimation() {
    int index = 0;
    int totalLength = _headerChars.length + _subHeaderChars.length;
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (index < totalLength) {
        setState(() {
          if (index < _headerChars.length) {
            _headerChars[index] = MapEntry(_headerChars[index].key, 1.0);
          } else {
            int subIndex = index - _headerChars.length;
            _subHeaderChars[subIndex] = MapEntry(_subHeaderChars[subIndex].key, 1.0);
          }
        });
        index++;
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      drawer: const MyDrawer(),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/earth_home.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            alignment: Alignment.topLeft,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90.0, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    children: _headerChars
                        .map(
                          (character) => AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: character.value,
                            child: Text(
                              character.key,
                              style: TextStyle(
                                fontSize: 40,
                                color: Theme.of(context).colorScheme.inversePrimary,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    children: _subHeaderChars
                        .map(
                          (character) => AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: character.value,
                            child: Text(
                              character.key,
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.inversePrimary,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}