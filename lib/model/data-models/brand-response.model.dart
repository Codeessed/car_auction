import 'package:car_sale_app/model/data-models/brand-item.model.dart';
import 'package:car_sale_app/model/data-models/paginate-item.model.dart';

class BrandResponseModel {
  List<dynamic> makeList;
  Map<String, dynamic> pagination;

  BrandResponseModel({
    required this.makeList,
    required this.pagination,
  });

  Map toJson() {
    return {
      "makeList": makeList,
      'pagination': pagination
    };
  }

  factory BrandResponseModel.fromJson(Map<dynamic, dynamic> json) {
    return BrandResponseModel(
      makeList: json['makeList'],
      pagination: json['pagination'],
    );
  }

}
