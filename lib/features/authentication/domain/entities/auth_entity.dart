import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String token;
  final String refresh;

  const AuthEntity({required this.token, required this.refresh});

  @override
  List<Object?> get props => [token, refresh];
}
