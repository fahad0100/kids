import 'package:get_storage/get_storage.dart';

class LocalData {
  late GetStorage _boxStorage;

  LocalData({required GetStorage boxStorage}) {
    _boxStorage = boxStorage;
  }

  Future<void> saveLocal<T>({required String key, required T dataSave}) async {
    await _boxStorage.write(key, dataSave);
    await _boxStorage.save();
  }
}
