import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  void setThemeMode(bool isDark) async {
    SharedPreferences setThemeMode = await SharedPreferences.getInstance();
    setThemeMode.setBool('isDark', isDark);
  }

  Future<bool> getThemeMode() async {
    SharedPreferences getThemeMode = await SharedPreferences.getInstance();
    return getThemeMode.getBool('isDark') ?? true;
  }
}
