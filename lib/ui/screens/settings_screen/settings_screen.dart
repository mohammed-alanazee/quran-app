import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/providers/theme_provider.dart';
import 'package:quran_app/utils/theme_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ThemePreferences theme = ThemePreferences();
  @override
  Widget build(BuildContext context) {
    var themeProv = context.watch<ThemeProvider>();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            themeProv.isDark = !themeProv.isDark;
          },
          child: const Text('ChangeTheme'),
        ),
      ),
    );
  }
}
