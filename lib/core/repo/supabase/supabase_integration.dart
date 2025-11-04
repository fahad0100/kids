import 'package:kinder_app/core/utils/Exception/custom_exception.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:sembast/blob.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
part 'extensions/login_extension.dart';
part 'extensions/sign_up_extension.dart';

class SupabaseIntegration {
  late SupabaseClient _supabase;

  SupabaseIntegration({required SupabaseClient supabase}) {
    _supabase = supabase;
  }

  // login() {
  //   _supabase.auth.signInWithPassword(password: "password");

  //   return {};
  // }

  // signup() {}

  // logout() {}

  // checkAuth({required String token}) {
  //   _supabase.auth.signInAnonymously();
  // }
}
