import 'dart:convert';

import 'package:quran_app/models/ayah.dart';
import 'package:quran_app/models/surah.dart';
import 'package:http/http.dart' as http;

class QuranApi {
  // api base url
  final baseUrl = 'https://api.alquran.cloud/v1/';
  // convert json from api to Surahs List
  List<Surah> _convertJsonToSurahsList(String body) {
    List<dynamic> js = jsonDecode(body)['data'];
    return js.map((e) => Surah.fromJson(e)).toList();
  }

  Future<List<Surah>> fetchSurahList() async {
    var url = Uri.parse(baseUrl + 'surah');
    var res = await http.get(url);
    if (res.statusCode == 200) {
      return _convertJsonToSurahsList(res.body);
    } else {
      throw 'Error';
    }
  }

  // convert json from api to Surahs List
  List<Ayah> _convertJsonToAyahList(String body) {
    List<Ayah> ayahList = [];
    List<dynamic> js = jsonDecode(body)['data'];

    var ayahLength = js[0]['numberOfAyahs'];
    for (int i = 0; i < ayahLength; i++) {
      ayahList.add(Ayah(
          number: i + 1,
          audio: js[0]['ayahs'][i]['audio'],
          ayahTextAr: js[0]['ayahs'][i]['text'],
          ayahTextEn: js[1]['ayahs'][i]['text'],
          sajda: js[0]['ayahs'][i]['sajda'] == false ? false : true));
    }

    return ayahList;
  }

  Future<List<Ayah>> fetchAyahBySuarh(int surahNum) async {
    var url =
        Uri.parse(baseUrl + 'surah/$surahNum/editions/ar.alafasy,en.asad');
    var res = await http.get(url);
    if (res.statusCode == 200) {
      return _convertJsonToAyahList(res.body);
    } else {
      throw 'error';
    }
  }
}
