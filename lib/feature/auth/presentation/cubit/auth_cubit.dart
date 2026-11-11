import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookia/feature/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() :super(AuthInitial());
  login({required String email, required String password}) async {
    emit(LoginLoadingState());
    final response = await AuthRepo.login(email: email, Password: password);
    if (response) {
      emit(LoginSuccesState());
    } else {
      emit(LoginErrorState());
    }
  }
  register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(RegisterLoadingState());
    final error = await AuthRepo.register(
      username:username, email:email,
      password: password, confirmPassword:confirmPassword,
    );
    if (error == null) {
      emit(RegisterSuccessState());
    } 
    else {
      emit(RegisterErrorState(error));
    }
  }
}