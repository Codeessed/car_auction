
class CarResponseModel {
  List<dynamic> result;
  Map<String, dynamic> pagination;

  CarResponseModel({
    required this.result,
    required this.pagination,
  });

  Map toJson() {
    return {
      "result": result,
      'pagination': pagination
    };
  }

  factory CarResponseModel.fromJson(Map<dynamic, dynamic> json) {
    return CarResponseModel(
      result: json['result'],
      pagination: json['pagination'],
    );
  }

}
