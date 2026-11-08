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
}