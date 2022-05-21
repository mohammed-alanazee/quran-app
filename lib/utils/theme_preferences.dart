import 'package:hive/hive.dart';

class ThemePreferences {
  var box = Hive.box('darkMode');

  bool getThemeMode() {
    var darkMode = box.get('darkMode', defaultValue: true);
    return darkMode;
  }

  void setThemeMode(bool value) {
    box.put('darkMode', value);
  }
}
