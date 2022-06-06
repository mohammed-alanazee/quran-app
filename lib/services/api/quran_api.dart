import 'dart:convert';
import 'package:quran_app/models/ayah.dart';
import 'package:http/http.dart' as http;

class QuranApi {
  // api base url
  final baseUrl = 'https://api.alquran.cloud/v1/';

  // convert json from api to Ayah List
  List<Ayah> _convertJsonToAyahList(String body, int surahNum) {
    List<Ayah> ayahList = [];
    List<dynamic> js = jsonDecode(body)['data'];

    var ayahLength = js[0]['numberOfAyahs'];
    for (int i = 0; i < ayahLength; i++) {
      ayahList.add(Ayah(
          number: i + 1,
          surahNumber: surahNum,
          audio: js[0]['ayahs'][i]['audio'],
          ayahTextAr: js[0]['ayahs'][i]['text'],
          ayahTextEn: js[1]['ayahs'][i]['text'],
          sajda: js[0]['ayahs'][i]['sajda'] == false ? false : true,
          isMarked: false));
    }

    return ayahList;
  }

  Future<List<Ayah>> fetchAyahBySuarh(int surahNum) async {
    var url =
        Uri.parse(baseUrl + 'surah/$surahNum/editions/ar.alafasy,en.asad');
    var res = await http.get(url).timeout(const Duration(seconds: 5));
    if (res.statusCode == 200) {
      return _convertJsonToAyahList(res.body, surahNum);
    } else {
      throw 'error';
    }
  }
}
