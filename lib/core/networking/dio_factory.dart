import 'package:bookia/core/networking/api_endpoints.dart';
import 'package:bookia/core/services/locale/locale_helper.dart';
import 'package:bookia/core/utils/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio? dio;
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = LocaleHelper.prefs?.getString(AppConstants.userToken);
          if (token != null && token.trim().isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          } else {
            options.headers.remove("Authorization");
          }
          handler.next(options);
        },
      ),
    );
    dio?.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args){
            // don't print requests with uris containing '/posts' 
            if(options.path.contains('/posts')){
              return false;
            }
            // don't print responses with unit8 list data
            return !args.isResponse || !args.hasUint8ListData;
          }
      )
    );
  }
}