import 'package:flutter/material.dart';
import 'package:quran_app/models/radio.dart';
import 'package:quran_app/models/reciter.dart';
import 'package:quran_app/services/api/radio_api.dart';

class RadioProvider extends ChangeNotifier {
  List<Reciter> reciters = [];
  List<RadioModel> radios = [];

  // get all radios and reciters list
  Future getLists() async {
    reciters = await RadioApi().getRecitersList();
    radios = await RadioApi().getRadiosList();
    notifyListeners();
  }
}
