class Ayah {
  final int number;
  final String audio;
  final String ayahTextAr;
  final String ayahTextEn;
  final bool sajda;
  final bool isMarked;

  Ayah({
    required this.number,
    required this.audio,
    required this.ayahTextAr,
    required this.ayahTextEn,
    required this.sajda,
    required this.isMarked,
  });
  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: json['number'],
        audio: json['audio'],
        ayahTextAr: json['ayahTextAr'],
        ayahTextEn: json['ayahTextEn'],
        sajda: json['sajda'],
        isMarked: json['isMarked'],
      );
  Map<String, dynamic> toJson() => {
        'number': number,
        'audio': audio,
        'ayahTextAr': ayahTextAr,
        'ayahTextEn': ayahTextEn,
        'sajda': sajda,
        'isMarked': isMarked,
      };
}
