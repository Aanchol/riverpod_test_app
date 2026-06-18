import '../../../../core/constants/app_storage_keys.dart';
import '../../../../core/storage/hive_storage.dart';
import 'auth_local_datasource.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final HiveStorage storage;

  AuthLocalDataSourceImpl(this.storage);

  // @override
  // Future<void> saveToken(String token) async {
  //   await storage.saveToken(token);
  // }
  @override
  Future<void> saveToken(String token) async {
    await HiveStorage.instance.put(
      boxName: 'app_box',
      key: AppStorageKeys.accessToken,
      value: token,
    );
  }

  @override
  Future<String?> getToken() async {
    final token = await HiveStorage.instance.get<String>(
      boxName: 'app_box',
      key: AppStorageKeys.accessToken,
    );

    return token;
  }
}
