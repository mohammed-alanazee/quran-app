import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/utils/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = context.read<ThemeProvider>();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              themeProvider.isDark = !themeProvider.isDark;
              print(themeProvider);
            },
            child: const Text('ChangeTheme')),
      ),
    );
  }
}
