import 'package:kinder_app/features/authentication/data/datasources/data_source.dart';
import 'package:kinder_app/features/authentication/domain/entities/auth_entity.dart';
import 'package:kinder_app/features/authentication/domain/repositories/auth_repo_domain.dart';

class RepoDateSource implements AuthRepoDomain {
  final BaseDataSource dataSource;

  RepoDateSource({required this.dataSource});

  @override
  Future<void> createAccount({
    required String name,
    required String email,
    required String type,
  }) async {
    await dataSource.createAccount(name: name, email: email, type: type);
  }

  @override
  Future<void> loginAccount({required String email}) async {
    await dataSource.loginAccount(email: email);
  }

  @override
  Future<AuthEntity> verifyAccount({
    required String email,
    required String otp,
  }) async {
    return await dataSource.verifyAccount(email: email, otp: otp);
  }
}
