part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoadingState extends AuthState {}

final class SuccessLoginState extends AuthState {}

final class SuccessSignUpState extends AuthState {}

final class SuccessRestPasswordState extends AuthState {}

final class ErrorState extends AuthState {
  final String msg;

  ErrorState({required this.msg});
}
