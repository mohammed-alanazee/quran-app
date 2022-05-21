import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quran_app/models/ayah.dart';
import 'package:quran_app/services/local_storage.dart';

class BookMarkProvider extends ChangeNotifier {
  List<Ayah> markedAyahList = [];
  getMarkedAyahList() async {
    Map<String, String> data = await BookMarkStorage().getAllBookMarked();
    markedAyahList = data.values.map((e) {
      return Ayah.fromJson(jsonDecode(e));
    }).toList();
    notifyListeners();
  }

  // GET ALL AYAH IN BOOKMARK
  getMarkedAyah(String ayahTextAr) {
    bool isMarked =
        markedAyahList.any((element) => element.ayahTextAr == ayahTextAr);
    return isMarked;
  }

  addAyahToBookMark(Ayah ayah, int surahNumber) {
    bool isMarked =
        !markedAyahList.any((element) => element.ayahTextAr == ayah.ayahTextAr);

    if (isMarked) {
      markedAyahList.add(ayah);
      BookMarkStorage().add(ayah, surahNumber);
      notifyListeners();
    }
  }

  deleteMarkedAyah(Ayah ayah, int surahNumber) {
    BookMarkStorage().delete(ayah.number, surahNumber);
    markedAyahList
        .removeWhere((element) => element.ayahTextAr == ayah.ayahTextAr);
    notifyListeners();
  }
}
