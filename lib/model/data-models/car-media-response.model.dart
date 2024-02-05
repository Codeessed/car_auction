import 'package:car_sale_app/model/data-models/brand-item.model.dart';
import 'package:car_sale_app/model/data-models/paginate-item.model.dart';

class CarMediaResponseModel {
  List<dynamic> carMediaList;
  Map<String, dynamic> pagination;

  CarMediaResponseModel({
    required this.carMediaList,
    required this.pagination,
  });

  Map toJson() {
    return {
      "carMediaList": carMediaList,
      'pagination': pagination
    };
  }

  factory CarMediaResponseModel.fromJson(Map<dynamic, dynamic> json) {
    return CarMediaResponseModel(
      carMediaList: json['carMediaList'],
      pagination: json['pagination'],
    );
  }

}
