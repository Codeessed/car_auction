
class ServerResponse {
  Object? data;
  String? msg;
  int? code;
  Object? errors;

  ServerResponse({
    this.data,
    this.msg,
    this.code,
    this.errors
  });
}