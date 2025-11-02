part of '../supabase_integration.dart';

extension LoginSupabase on SupabaseIntegration {
  login() {
    _supabase.auth.signInWithPassword(password: "password");

    return {};
  }
}
