import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third_planet/components/my_drawer.dart';
import 'package:third_planet/themes/theme_provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('S E T T I N G S')),
      drawer: MyDrawer(),
      body: Container(
        decoration: BoxDecoration(  
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text("Dark Mode", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
          Switch(
            value: Provider.of<ThemeProvider>(context).isDarkMode,
            onChanged: (value) {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
              (Set<WidgetState> states) {
                final isDark = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
                return isDark
                    ? Icon(Icons.dark_mode, color: Colors.amber[100])
                    : Icon(Icons.light_mode, color: Colors.amber[400]);
              },
            ),
          ),
        ],),
      )
    );
  }
}