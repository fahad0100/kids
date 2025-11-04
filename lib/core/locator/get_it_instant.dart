import 'package:get_it/get_it.dart';
import 'package:kinder_app/core/repo/local/local_repo.dart';
import 'package:kinder_app/core/repo/supabase/supabase_integration.dart';

abstract class InstantGetIt {
  static final supabase = GetIt.I.get<SupabaseIntegration>();
  static final boxStorage = GetIt.I.get<LocalData>();
}
