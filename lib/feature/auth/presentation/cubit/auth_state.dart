part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoadingState extends AuthState {}
final class LoginSuccesState extends AuthState {}
final class LoginErrorState extends AuthState {}


final class RegisterLoadingState extends AuthState {}
final class RegisterSuccessState extends AuthState {}
final class RegisterErrorState extends AuthState {
  final String message;
  RegisterErrorState(this.message);
}