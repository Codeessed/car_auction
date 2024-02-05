class CarDetailsModel {
  String id;
  String title;
  String imageUrl;
  num gradeScore;
  int marketplacePrice;
  int year;
  String city;
  String state;
  String carName;
  String fuelType;
  String country;
  String transmission;
  String sellingCondition;
  String ownerType;
  String mileageUnit;
  String engineType;
  bool insured;
  bool sold;
  num mileage;
  num loanValue;
  num installment;

  CarDetailsModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.gradeScore,
    required this.marketplacePrice,
    required this.city,
    required this.state,
    required this.year,
    required this.insured,
    required this.mileage,
    required this.mileageUnit,
    required this.sellingCondition,
    required this.engineType,
    required this.fuelType,
    required this.transmission,
    required this.ownerType,
    required this.carName,
    required this.installment,
    required this.loanValue,
    required this.sold,
    required this.country,
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
      'year': year,
      'insured': insured,
      'mileage': mileage,
      'mileageUnit': mileageUnit,
      'sellingCondition': sellingCondition,
      'engineType': engineType,
      'fuelType': fuelType,
      'transmission': transmission,
      'ownerType': ownerType,
      'carName': carName,
      'installment': installment,
      'loanValue': loanValue,
      'sold': sold,
      'country': country,
    };
  }

  factory CarDetailsModel.fromJson(Map<dynamic, dynamic> json) {
    return CarDetailsModel(
      id: json['id'],
      title: json['title'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      gradeScore: json['gradeScore'] ?? 0.0,
      marketplacePrice: json['marketplacePrice'] ?? 0,
      city: json['city'],
      state: json['state'],
      year: json['year'],
      insured: json['insured'],
      mileage: json['mileage'],
      mileageUnit: json['mileageUnit'],
      sellingCondition: json['sellingCondition'],
      engineType: json['engineType'],
      fuelType: json['fuelType'],
      transmission: json['transmission'],
      ownerType: json['ownerType'],
      carName: json['carName'],
      loanValue: json['loanValue'],
      sold: json['sold'],
      country: json['country'],
      installment: json['installment'],
    );
  }

}
