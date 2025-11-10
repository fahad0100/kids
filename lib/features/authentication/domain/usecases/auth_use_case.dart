import 'package:kinder_app/features/authentication/domain/entities/auth_entity.dart';
import 'package:kinder_app/features/authentication/domain/repositories/auth_repo_domain.dart';

class AuthUseCase {
  final AuthRepoDomain authRepoDate;

  AuthUseCase({required this.authRepoDate});

  Future<void> createAccount({
    required String name,
    required String email,
    required String type,
  }) async {
    await authRepoDate.createAccount(name: name, email: email, type: type);
  }

  Future<void> loginAccount({required String email}) async {
    await authRepoDate.loginAccount(email: email);
  }

  //----
  Future<AuthEntity> verifyAccount({
    required String email,
    required String otp,
  }) async {
    return await authRepoDate.verifyAccount(email: email, otp: otp);
  }
}
