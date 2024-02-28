// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class BaseResponseModel<T> {
  String? result;
  String? message;
  String? url;

  T? data;
  BaseResponseModel({
    this.result,
    this.message,
    this.data,
    this.url,
  });
  Map<String, dynamic>? toJson();
  BaseResponseModel fromJson(Map<String, dynamic> json);
}
