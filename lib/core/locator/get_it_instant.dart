import 'package:get_it/get_it.dart';
import 'package:kinder_app/core/repo/local/local_repo.dart';

abstract class InstantGetIt {
  static final boxStorage = GetIt.I.get<LocalData>();
  
}
