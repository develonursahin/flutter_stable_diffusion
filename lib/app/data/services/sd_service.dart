import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_stable_diffusion/app/core/base/model/base_request_model.dart';
import 'package:flutter_stable_diffusion/app/core/enum/service_path.dart';
import 'package:flutter_stable_diffusion/app/core/manager/network_manager.dart';
import 'package:flutter_stable_diffusion/app/data/models/image2image_model.dart';
import 'package:flutter_stable_diffusion/app/data/models/text2image_model.dart';

class SDService {
  final _headers = {
    'Content-Type': 'application/json',
  };
  Future<List<String>> fetchModels() async {
    try {
      var sdModels = await NetworkManager.instance.dio.get(
        ServicePath.sdModels.subUrl,
        options: Options(responseType: ResponseType.json),
      );

      if (sdModels.statusCode == 200) {
        final List<dynamic> modelsJson = sdModels.data;
        final List<String> models =
            modelsJson.map((model) => model["model_name"].toString()).toList();
        return models;
      } else {
        _printError("Error: API response status code is not 200 - ${sdModels.statusCode}");
        return [];
      }
    } catch (e) {
      _printError("Error: $e");
      return [];
    }
  }

  Future<bool> setOptions(Map<String, dynamic> options) async {
    try {
      var response = await NetworkManager.instance.dio.post(
        ServicePath.options.subUrl,
        options: Options(headers: _headers),
        data: options,
      );
      return response.statusCode == 200;
    } catch (e) {
      _printError("Error setting options: $e");
      return false;
    }
  }

  Future getObjectData<T extends BaseModel>({
    required T objectModel,
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await NetworkManager.instance.dio.get(
        path,
        options: Options(headers: _headers),
        queryParameters: queryParameters,
      );

      if (response.statusCode == HttpStatus.ok) {
        log(response.toString());
        return objectModel.fromJson(response.data['data']);
      }
    } on DioException catch (e) {
      log(e.response?.data);
      log('ERROR: $e');
    }
  }

  Future<Response?> postData<T extends BaseModel>({
    required T objectModel,
    required ServicePath path,
    Map<String, dynamic>? queryParams,
  }) async {
    Response? response;
    response = await NetworkManager.instance.dio.post(
      path.subUrl,
      data: objectModel.toJson(),
      queryParameters: queryParams,
      options: Options(
        headers: _headers,
      ),
    );
    return response;
  }

  Future<String?> text2Image({
    required Text2ImageModel text2ImageModel,
  }) async {
    try {
      var response = await NetworkManager.instance.dio.post(
        ServicePath.txt2img.subUrl,
        options: Options(headers: _headers),
        data: text2ImageModel,
      );

      if (response.statusCode == 200) {
        final images = response.data['images'];

        if (images != null && images.isNotEmpty) {
          final imageData = images[0];
          return imageData;
        } else {
          _printError("Error: Images not found in the response");
          return null;
        }
      } else {
        _printError("Error: API response status code is not 200 - ${response.statusCode}");
        return null;
      }
    } catch (e) {
      _printError("Error setting options: $e");
      return null;
    }
  }

  Future<String?> image2Image({
    required Image2ImageModel image2ImageModel,
  }) async {
    try {
      var response = await NetworkManager.instance.dio.post(
        ServicePath.img2img.subUrl,
        options: Options(headers: _headers),
        data: image2ImageModel,
      );

      if (response.statusCode == 200) {
        final images = response.data['images'];

        if (images != null && images.isNotEmpty) {
          final imageData = images[0];
          return imageData;
        } else {
          _printError("Error: Images not found in the response");
          return null;
        }
      } else {
        _printError("Error: API response status code is not 200 - ${response.statusCode}");
        return null;
      }
    } catch (e) {
      _printError("Error setting options: $e");
      return null;
    }
  }

  void _printError(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
