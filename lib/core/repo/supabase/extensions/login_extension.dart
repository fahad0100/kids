part of '../supabase_integration.dart';

extension LoginSupabase on SupabaseIntegration {
  Future<Result<bool, CustomException>> login({required String email}) async {
    try {
      await _supabase.auth.signInWithOtp(email: email);
      return Success(true);
    } catch (error) {
      return Error(CustomException("There is error"));
    }
  }
}
