import 'package:bookia/core/networking/api_endpoints.dart';
import 'package:bookia/core/networking/doi_factory.dart';
import 'package:bookia/feature/cart/data/models/cart_response.dart';
import 'package:dio/dio.dart';

class CartRepo {
  static Future<CartData?> getCartData() async{
    try{
      final response = await DoiFactory.dio?.get(ApiEndpoints.cart);
      if (response?.statusCode == 200){
        CartResponseModel cart = CartResponseModel.fromJson(response?.data);
        return cart.data;
      }
      else {
        return null;
      }
    }
    catch(e) {
      return null;
    }
  }
}