part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;

  LoginEvent({required this.email});
}

class SignUpEvent extends AuthEvent {
  final String email;

  SignUpEvent({required this.email});
}

class RestPasswordEvent extends AuthEvent {
  final String email;

  RestPasswordEvent({required this.email});
}
