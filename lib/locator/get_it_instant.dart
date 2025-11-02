import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:kinder_app/repo/local/local_repo.dart';
import 'package:kinder_app/repo/supabase/supabase_integration.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get_storage/get_storage.dart';

abstract class InstantGetIt {
  static final supabase = GetIt.I.get<SupabaseIntegration>();
  static final boxStorage = GetIt.I.get<LocalData>();

  static Future<void> setup() async {
    await dotenv.load(fileName: ".env");
    await Supabase.initialize(
      url: dotenv.env['urlSupabase'].toString(),
      anonKey: dotenv.env['keySupabase'].toString(),
    );
    await GetStorage.init();

    GetStorage box = GetStorage();

    GetIt.I.registerSingleton<SupabaseIntegration>(
      SupabaseIntegration(supabase: Supabase.instance.client),
    );

    GetIt.I.registerSingleton<LocalData>(LocalData(boxStorage: box));
  }
}
