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
}
