import 'package:bookia/core/services/locale/locale_helper.dart';
import 'package:bookia/core/utils/app_constants.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  static Dio dio = Dio();

  static Future<bool> login({required String email, required String Password}) async {
    try {
      final response = await dio.post(
        "https://codingarabic.eraapro.com/api/login",
        data: {"email": email, "password": Password},
      );
      if (response.statusCode == 200) {
        String? token = response.data["data"]["token"];
        saveToken(token ?? "");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<String?> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await dio.post(
        "https://codingarabic.eraapro.com/api/register",
        data: {
          "name": username,
          "email": email,
          "password": password,
          "password_confirmation": confirmPassword,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        String? token = response.data["data"]["token"];
        await saveToken(token ?? "");
        return null;
      } 
      else {
        return "Register Failed, Please try again";
      }
    } on DioException catch (e) {
      final data = e.response?.data;
      if (data is Map) {
        final errors = data["errors"];
        if (errors is Map && errors.isNotEmpty) {
          final first = errors.values.first;
          if (first is List && first.isNotEmpty) {
            return first.first.toString();
          }
        }
        if (data["message"] != null) {
          return data["message"].toString();
        }
      }
      return "Register Failed, Please try again";
    } 
    catch (e) {
      return "Register Failed, Please try again";
    }
  }

  static saveToken(String? token) async {
    await LocaleHelper.prefs?.setString(AppConstants.userToken, token ?? "");
  }
}