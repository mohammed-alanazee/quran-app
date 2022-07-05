import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quran_app/models/ayah.dart';

class BookMarkStorage {
  Future<void> add(Ayah ayah) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      '${ayah.surahNumber}-${ayah.number}',
      jsonEncode(ayah.toJson()),
    );
  }

  Future<void> delete(Ayah ayah) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('${ayah.surahNumber}-${ayah.number}');
  }

  Future<List<Ayah>> getAllBookMarked() async {
    List<Ayah> _markedAyahList = [];
    final prefs = await SharedPreferences.getInstance();
    Iterable<String> keys = prefs.getKeys().where((key) => key.contains('-'));
    for (String key in keys) {
      String? value = prefs.getString(key);

      _markedAyahList.add(Ayah.fromJson(jsonDecode(value!)));
    }

    return _markedAyahList;
  }
}
