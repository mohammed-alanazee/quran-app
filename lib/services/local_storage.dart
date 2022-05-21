import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quran_app/models/ayah.dart';

class BookMarkStorage {
  final storage = const FlutterSecureStorage();
  Future add(Ayah ayah, int surahNumber) async {
    await storage.write(
      key: '$surahNumber-${ayah.number}',
      // ignore: prefer_single_quotes
      value: jsonEncode(ayah.toJson()),
    );
  }

  Future deleteAll() async {
    return await storage.deleteAll();
  }

  Future delete(int ayahNumber, int surahNumber) async {
    return await storage.delete(key: '$surahNumber-$ayahNumber');
  }

  Future getAllBookMarked() async {
    return await storage.readAll();
  }
}
