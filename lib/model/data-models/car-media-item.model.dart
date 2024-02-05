class CarMediaItemModel {
  num id;
  String name;
  String url;
  String type;

  CarMediaItemModel({
    required this.id,
    required this.name,
    required this.url,
    required this.type,
  });

  Map toJson() {
    return {
      "id": id,
      'name': name,
      'url': url,
      'type': type,
    };
  }

  factory CarMediaItemModel.fromJson(Map<dynamic, dynamic> json) {
    return CarMediaItemModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      url: json['url'] ?? '',
      type: json['type'] ?? '',
    );
  }

}
