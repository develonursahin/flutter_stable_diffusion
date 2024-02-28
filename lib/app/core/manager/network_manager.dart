import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_stable_diffusion/app/core/constants/app_statics.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  final String _baseUrl = AppStatics.baseUrl;
  late final Dio dio;

  NetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: _baseUrl))
      ..interceptors.add(
        InterceptorsWrapper(
          onError: (DioException error, ErrorInterceptorHandler handler) async {
            if (error.response?.statusCode == 404) {
              if (kDebugMode) {
                print("404 Hatası: İstenen kaynak bulunamadı.");
              }
              return handler.resolve(Response(
                requestOptions: error.requestOptions,
                statusCode: 404,
              ));
            }
            return handler.next(error);
          },
        ),
      );
  }
}
