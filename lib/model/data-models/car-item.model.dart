class CarItemModel {
  String id;
  String title;
  String imageUrl;
  num gradeScore;
  int marketplacePrice;
  String city;
  String state;

  CarItemModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.gradeScore,
    required this.marketplacePrice,
    required this.city,
    required this.state,
  });

  Map toJson() {
    return {
      "id": id,
      'title': title,
      'imageUrl': imageUrl,
      'gradeScore': gradeScore,
      'marketplacePrice': marketplacePrice,
      'city': city,
      'state': state,
    };
  }

  factory CarItemModel.fromJson(Map<dynamic, dynamic> json) {
    return CarItemModel(
      id: json['id'],
      title: json['title'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      gradeScore: json['gradeScore'] ?? 0.0,
      marketplacePrice: json['marketplacePrice'] ?? 0,
      city: json['city'],
      state: json['state'],
    );
  }

}
