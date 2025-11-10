import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kinder_app/core/repo/local/local_repo.dart';
import 'package:kinder_app/features/authentication/data/datasources/data_source.dart';
import 'package:kinder_app/features/authentication/data/repositories/repo_date_source.dart';
import 'package:kinder_app/features/authentication/domain/usecases/auth_use_case.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> setupInit() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['urlSupabase'].toString(),
    anonKey: dotenv.env['keySupabase'].toString(),
  );
  await GetStorage.init();

  GetStorage box = GetStorage();

  GetIt.I.registerSingleton<SupabaseClient>(Supabase.instance.client);

  GetIt.I.registerSingleton<LocalData>(LocalData(boxStorage: box));

  //------Features Authentication-------

  GetIt.I.registerLazySingleton<DatabaseDataSource>(
    () => DatabaseDataSource(supabase: GetIt.I.get<SupabaseClient>()),
  );

  GetIt.I.registerLazySingleton<RepoDateSource>(
    () => RepoDateSource(dataSource: GetIt.I.get<DatabaseDataSource>()),
  );
  GetIt.I.registerLazySingleton<AuthUseCase>(
    () => AuthUseCase(
      authRepoDate: RepoDateSource(
        dataSource: GetIt.I.get<DatabaseDataSource>(),
      ),
    ),
  );
}
