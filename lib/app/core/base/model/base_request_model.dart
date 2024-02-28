import 'dart:io';

import 'package:dio/dio.dart';

abstract class BaseModel<T> {
  Map<String, dynamic>? toJson();
  BaseModel fromJson(Map<String, dynamic> json);
  BaseModel();
  FormData toFormData() {
    FormData formData = FormData();
    Map<String, dynamic>? json = toJson();

    json?.forEach((key, value) {
      if (value != null) {
        if (value is File) {
          formData.files.add(MapEntry(
            key,
            MultipartFile.fromFileSync(value.path),
          ));
        } else {
          formData.fields.add(MapEntry(key, value.toString()));
        }
      }
    });

    return formData;
  }
}
