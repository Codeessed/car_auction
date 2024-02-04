class PaginateItemModel {
  int total;
  int currentPage;
  int pageSize;

  PaginateItemModel({
    required this.total,
    required this.currentPage,
    required this.pageSize,
  });

  Map toJson() {
    return {
      "total": total,
      'name': currentPage,
      'pageSize': pageSize
    };
  }

  factory PaginateItemModel.fromJson(Map<dynamic, dynamic> json) {
    return PaginateItemModel(
      total: json['total'],
      currentPage: json['currentPage'] ?? '',
      pageSize: json['pageSize'] ?? '',
    );
  }

}
