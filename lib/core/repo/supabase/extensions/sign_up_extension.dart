part of '../supabase_integration.dart';

extension SignUpSupabase on SupabaseIntegration {
  Future<Result<bool, CustomException>> signUp({required String email}) async {
    try {
      final password = Uuid().v6();
      await _supabase.auth.signUp(email: email, password: password);
      return Success(true);
    } catch (error) {
      print("Error:$error");
      return Error(CustomException(error.toString()));
    }
  }
}



//re_Mmy54SRL_FMiTWGr1CJ9CeRRjeWfeBBWA