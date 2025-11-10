import 'package:get_it/get_it.dart';
import 'package:kinder_app/features/authentication/data/models/auth_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/v8.dart';

abstract class BaseDataSource {
  Future<void> createAccount({
    required String name,
    required String email,
    required String type,
  });
  Future<void> loginAccount({required String email});
  Future<AuthModel> verifyAccount({required String email, required String otp});
}

///
///
///
///
///
///
///
///

class DatabaseDataSource implements BaseDataSource {
  final SupabaseClient supabase;

  DatabaseDataSource({required this.supabase});
  @override
  Future<void> createAccount({
    required String name,
    required String email,
    required String type,
  }) async {
    final id = UuidV8().generate();
    final userCreateAuth = await supabase.auth.signUp(
      email: email,
      password: id,
    );
    await supabase.from('users').insert({
      'auth_id': userCreateAuth.user!.id,
      'email': email,
      'full_name': name,
    });
  }

  ///
  ///
  ///
  ///
  ///
  @override
  Future<void> loginAccount({required String email}) async {
    await supabase.auth.signInWithOtp(email: email, shouldCreateUser: false);
  }

  ///
  ///
  ///
  ///

  @override
  Future<AuthModel> verifyAccount({
    required String email,
    required String otp,
  }) async {
    final user = await supabase.auth.verifyOTP(
      email: email,
      token: otp,
      type: OtpType.magiclink,
    );

    return AuthModel(
      token: user.session!.accessToken,
      refresh: user.session!.refreshToken!,
    );
  }
}
