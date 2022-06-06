class Radio {
  final String name;
  final String url;
  Radio({required this.name, required this.url});
  factory Radio.fromJson(Map<String, dynamic> json) => Radio(
        name: json['Name'].toString().replaceAll('-', ''),
        url: json['URL'],
      );
  Map<String, dynamic> toJson() =>
      {'name': name.replaceAll('-', ''), 'url': url};
}
