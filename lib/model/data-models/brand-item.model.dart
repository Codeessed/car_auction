class BrandItemModel {
  int id;
  String name;
  String imageUrl;

  BrandItemModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  Map toJson() {
    return {
      "id": id,
      'name': name,
      'imageUrl': imageUrl
    };
  }

  factory BrandItemModel.fromJson(Map<dynamic, dynamic> json) {
    return BrandItemModel(
      id: json['id'],
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

}
