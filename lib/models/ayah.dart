class Ayah {
  final int id;
  final int jozz;
  final int sora;
  final String soraNameEn;
  final String soraNameAr;
  final int page;
  final int lineStart;
  final int lineEnd;
  final int ayaNo;
  final String ayaText;
  final String ayaTextEmlaey;

  Ayah(
      {required this.id,
      required this.jozz,
      required this.sora,
      required this.soraNameEn,
      required this.soraNameAr,
      required this.page,
      required this.lineStart,
      required this.lineEnd,
      required this.ayaNo,
      required this.ayaText,
      required this.ayaTextEmlaey});

  factory Ayah.fromJson(
    Map<String, dynamic> json,
  ) =>
      Ayah(
          id: json['id'],
          jozz: json['jozz'],
          sora: json['sora'],
          soraNameEn: json['sora_name_en'],
          soraNameAr: json['sora_name_ar'],
          page: json['page'],
          lineStart: json['line_start'],
          lineEnd: json['line_end'],
          ayaNo: json['aya_no'],
          ayaText: json['aya_text'],
          ayaTextEmlaey: json['aya_text_emlaey']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'jozz': jozz,
        'sora': sora,
        'sora_name_en': soraNameEn,
        'sora_name_ar': soraNameAr,
        'page': page,
        'line_start': lineStart,
        'line_end': lineEnd,
        'aya_no': ayaNo,
        'aya_text': ayaText,
        'aya_text_emlaey': ayaTextEmlaey
      };
}
