import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quran_app/models/radio.dart';
import 'package:quran_app/models/reciter.dart';

class RadioApi {
  final recitersUrl = Uri.parse('https://www.mp3quran.net/api/_arabic.json');
  final radiosUrl =
      Uri.parse('https://www.mp3quran.net/api/radio/radio_ar.json');
  Future<List<Radio>> getRadiosList() async {
    var res = await http.get(radiosUrl);
    if (res.statusCode == 200) {
      List<Map<String, dynamic>> json = jsonDecode(res.body)['Radios'];
      return json.map((e) => Radio.fromJson(e)).toList();
    } else {
      throw 'error';
    }
  }

  Future<List<Reciter>> getRecitersList() async {
    var res = await http.get(recitersUrl);
    if (res.statusCode == 200) {
      List<Map<String, dynamic>> json = jsonDecode(res.body)['reciters'];
      return json.map((e) => Reciter.fromJson(e)).toList();
    } else {
      throw 'error';
    }
  }
}
