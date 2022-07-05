class Reciter {
  final int id;
  final String name;
  final String server;
  final String rewaya;
  final List<dynamic> surahs;

  Reciter({
    required this.id,
    required this.name,
    required this.server,
    required this.rewaya,
    required this.surahs,
  });
  factory Reciter.fromJson(Map<String, dynamic> json) => Reciter(
        id: int.parse(json['id']),
        name: json['name'],
        server: json['Server'],
        rewaya: json['rewaya'],
        surahs:
            json['suras'].split(',').map((String e) => int.parse(e)).toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'server': server,
        'rewaya': rewaya,
        'surahs': surahs,
      };
}
