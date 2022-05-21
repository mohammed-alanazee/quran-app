import 'package:flutter/material.dart';
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/services/quran_api.dart';

// quran provider dealing with anything is relation with quran
// like surah list ayat
class QuranProvider extends ChangeNotifier {
  List<Surah> surahList = [];

  bool isLoding = true;

  // home screen //
  getSurahList() async {
    if (isLoding) {
      List<Surah> data = await QuranApi().fetchSurahList();
      surahList = data;
      isLoding = false;
      notifyListeners();
    }
  }
}
