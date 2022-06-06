class Ayah {
  final int number;
  final int surahNumber;
  final String audio;
  final String ayahTextAr;
  final String ayahTextEn;
  final bool sajda;
  final bool isMarked;

  Ayah({
    required this.number,
    required this.surahNumber,
    required this.audio,
    required this.ayahTextAr,
    required this.ayahTextEn,
    required this.sajda,
    required this.isMarked,
  });
  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: json['number'],
        surahNumber: json['surahNumber'],
        audio: json['audio'],
        ayahTextAr: json['ayahTextAr'],
        ayahTextEn: json['ayahTextEn'],
        sajda: json['sajda'],
        isMarked: json['isMarked'],
      );
  Map<String, dynamic> toJson() => {
        'number': number,
        'surahNumber': surahNumber,
        'audio': audio,
        'ayahTextAr': ayahTextAr,
        'ayahTextEn': ayahTextEn,
        'sajda': sajda,
        'isMarked': isMarked,
      };
}
