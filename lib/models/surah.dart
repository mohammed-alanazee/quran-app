class Surah {
  final int number;
  final String name;
  final String enName;
  final String enNameTrans;
  final int numberOfAyahs;
  final String place;
  Surah(
      {required this.number,
      required this.name,
      required this.enName,
      required this.enNameTrans,
      required this.numberOfAyahs,
      required this.place});
  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
      number: json['number'],
      name: json['name'],
      enName: json['englishName'],
      enNameTrans: json['englishNameTranslation'],
      numberOfAyahs: json['numberOfAyahs'],
      place: json['revelationType']);
  Map<String, dynamic> toJson() => {
        'number': number,
        'name': name,
        'enName': enName,
        'enNameTrans': enNameTrans,
        'numberOfAyahs': numberOfAyahs,
        'place': place,
      };
}
