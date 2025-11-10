import 'package:kinder_app/features/authentication/domain/entities/auth_entity.dart';

abstract class AuthRepoDomain {
  Future<void> createAccount({
    required String name,
    required String email,
    required String type,
  });
  Future<void> loginAccount({required String email});
  Future<AuthEntity> verifyAccount({
    required String email,
    required String otp,
  });
}
