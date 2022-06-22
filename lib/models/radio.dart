class RadioModel {
  final String name;
  final String url;

  RadioModel({
    required this.name,
    required this.url,
  });
  factory RadioModel.fromJson(Map<String, dynamic> json) => RadioModel(
        name: json['Name'].toString().replaceAll('-', ''),
        url: json['URL'],
      );
  Map<String, dynamic> toJson() => {
        'name': name.replaceAll('-', ''),
        'url': url,
      };
}
