import 'package:flutter/material.dart';
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/services/quran_api.dart';

class QuranProvider extends ChangeNotifier {
  List<Surah> surahList = [];
  bool isLoding = true;

  getSurahList() async {
    if (isLoding) {
      List<Surah> data = await QuranApi().fetchSurahList();

      surahList = data;
      isLoding = false;
      notifyListeners();
    }
  }
}
