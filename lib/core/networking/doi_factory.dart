import 'package:bookia/core/networking/api_endpoints.dart';
import 'package:dio/dio.dart';

class DoiFactory {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(baseUrl: ApiEndpoints.baseUrl)
    );
  }
}