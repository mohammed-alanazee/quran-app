class Reciter {
  final String name;
  final String server;
  final String rewaya;
  final List<int> surahs;
  Reciter({
    required this.name,
    required this.server,
    required this.rewaya,
    required this.surahs,
  });
  factory Reciter.fromJson(Map<String, dynamic> json) => Reciter(
      name: json['name'],
      server: json['Server'],
      rewaya: json['rewaya'],
      surahs: json['suras'].split(',').map((e) => int.parse(e)).toList());

  Map<String, dynamic> toJson() =>
      {'name': name, 'server': server, 'rewaya': rewaya, 'surahs': surahs};
}
