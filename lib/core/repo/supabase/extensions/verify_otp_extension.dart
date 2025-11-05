part of '../supabase_integration.dart';

extension VerifyOTP on SupabaseIntegration {
  Future<Result<VerifyResponse, CustomException>> verifyOTP({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await _supabase.auth.verifyOTP(
        email: email,
        token: otp,
        type: OtpType.magiclink,
      );
      final dataResponse = {
        "token": response.session!.accessToken,
        "refresh": response.session!.refreshToken,
        "id": response.session!.user.id,
      };
      return Success(VerifyResponseMapper.fromMap(dataResponse));
    } catch (error) {
      return Error(CustomException(error.toString()));
    }
  }
}



//re_Mmy54SRL_FMiTWGr1CJ9CeRRjeWfeBBWA


