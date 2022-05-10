import 'dart:convert';
import 'dart:developer';

import 'package:quran_app/models/surah.dart';
import 'package:http/http.dart' as http;

class QuranApi {
  // api base url
  final baseUrl = 'https://api.alquran.cloud/v1/';
  // convert data from api to json
  List<dynamic> convertToJson(String body) {
    List<dynamic> js = jsonDecode(body)['data'];

    return js;
  }

  Future<List<Surah>> fetchSurahList() async {
    var url = Uri.parse(baseUrl + 'surah');
    var res = await http.get(url);
    if (res.statusCode == 200) {
      log(url.toString());

      return convertToJson(res.body).map((e) => Surah.fromJson(e)).toList();
    } else {
      log(url.toString());
      throw 'Error';
    }
  }
}
