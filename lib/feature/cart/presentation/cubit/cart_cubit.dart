import 'package:bloc/bloc.dart';
import 'package:bookia/feature/cart/data/models/cart_response.dart';
import 'package:bookia/feature/cart/data/repo/cart_repo.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  getCartData() async {
    final response = await CartRepo.getCartData();
    if (response is CartData) {
      emit(GetCartSuccess(response));
    } 
    else {
      emit(GetCartError());
    }
  }
}
