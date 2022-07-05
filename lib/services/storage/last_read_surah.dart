import 'dart:convert';

import 'package:quran_app/models/surah.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LastReadSurah {
  final String storageName = 'lastread';
  Future<void> add(Surah surah) async {
    final prefs = await SharedPreferences.getInstance();
    await remove();
    prefs.setString(storageName, jsonEncode(surah.toJson()));
  }

  Future<void> remove() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(storageName);
  }

  Future<Surah?> getLastRead() async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(storageName);
    if (value != null) {
      return Surah.fromJson(jsonDecode(value));
    }

    return null;
  }
}
