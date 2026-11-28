import 'package:bookia/core/networking/api_endpoints.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/feature/cart/data/models/cart_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CartRepo {
  static Future<CartData?> getCartData() async {
    try {
      final response = await DioFactory.dio?.get(ApiEndpoints.cart);

      if (response?.statusCode == 200) {
        final cartResponse = CartResponseModel.fromJson(
          Map<String, dynamic>.from(response!.data),
        );

        return cartResponse.data;
      }

      return null;
    } 
    catch (e) {
      debugPrint('Cart Api Error: $e');
      return null;
    }
  }

  static Future<bool> addToCart(int productId) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiEndpoints.addToCart,
        data: {'product_id': productId},
      );

      debugPrint('Add to Cart Status: ${response?.statusCode}');
      debugPrint('Add to Cart Data: ${response?.data}');

      return response?.statusCode == 200 || response?.statusCode == 201;
    } on DioException catch (e) {
      debugPrint('Add to Cart Error: ${e.message}');
      debugPrint('Add to Cart Status: ${e.response?.statusCode}');
      debugPrint('Add to Cart Response: ${e.response?.data}');
      debugPrint('Add to Cart URL: ${e.requestOptions.uri}');

      return false;
    } catch (e) {
      debugPrint('Add to Cart Status: $e');
      return false;
    }
  }

  static Future<bool> updateCart({
    required int cartItemId,
    required int quantity,
  }) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiEndpoints.updateCart,
        data: {'cart_item_id': cartItemId, 'quantity': quantity},
      );

      debugPrint('Update Cart Status: ${response?.statusCode}');
      debugPrint('Update Cart Response: ${response?.data}');

      return response?.statusCode == 200 || response?.statusCode == 201;
    } on DioException catch (e) {
      debugPrint('Update Cart Error: ${e.response?.data}');
      return false;
    } catch (e) {
      debugPrint('Update Cart Unknown Error: $e');
      return false;
    }
  }

  static Future<bool> removeFromCart(int cartItemId) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiEndpoints.removeFromCart,
        data: {'cart_item_id': cartItemId},
      );

      debugPrint('Remove Cart Status: ${response?.statusCode}');
      debugPrint('Remove Cart Response: ${response?.data}');

      return response?.statusCode == 200 || response?.statusCode == 201;
    } on DioException catch (e) {
      debugPrint('Remove Cart Error: ${e.response?.data}');
      return false;
    } catch (e) {
      debugPrint('Remove Cart Unknown Error: $e');
      return false;
    }
  }
}