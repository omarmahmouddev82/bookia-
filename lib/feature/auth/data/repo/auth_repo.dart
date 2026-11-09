import 'package:bookia/core/services/locale/locale_helper.dart';
import 'package:bookia/core/utils/app_constants.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  static Dio dio = Dio();
   static Future <bool> login ({required String email , required String Password}) async {
    try {
      final response = await dio.post (
        "https://codingarabic.eraapro.com/api/login",
        data: {"email": email, "password": Password},
      );
      if (response.statusCode == 200){
        String? token = response.data ["data"]["teken"];
        saveToken(token??"");
        return true;
      }
      else{
        return false;
      }
    }
    catch(email) {
      return false;
    }
   }
   static saveToken (String? token)async{
    await LocaleHelper.prefs?.setString(AppConstants.userToken,token??"");
   }
}