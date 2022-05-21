import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              theme.setThemeMode(!theme.getThemeMode());
            },
            child: const Text('ChangeTheme')),
      ),
    );
  }
}
