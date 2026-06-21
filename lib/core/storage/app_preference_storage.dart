import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  HiveStorage._();

  static final HiveStorage instance = HiveStorage._();

  /// Open box
  Future<Box> openBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box(boxName);
    }

    return await Hive.openBox(boxName);
  }

  /// Write
  Future<void> put({
    required String boxName,
    required String key,
    required dynamic value,
  }) async {
    final box = await openBox(boxName);
    await box.put(key, value);
  }

  /// Read
  Future<T?> get<T>({required String boxName, required String key}) async {
    final box = await openBox(boxName);
    return box.get(key) as T?;
  }

  /// Delete
  Future<void> delete({required String boxName, required String key}) async {
    final box = await openBox(boxName);
    await box.delete(key);
  }

  /// Clear box
  Future<void> clear(String boxName) async {
    final box = await openBox(boxName);
    await box.clear();
  }

  /// Check key exists
  Future<bool> containsKey({
    required String boxName,
    required String key,
  }) async {
    final box = await openBox(boxName);
    return box.containsKey(key);
  }

  /// Get all values
  Future<List<dynamic>> getAllValues(String boxName) async {
    final box = await openBox(boxName);
    return box.values.toList();
  }

  /// Get all keys
  Future<List<dynamic>> getAllKeys(String boxName) async {
    final box = await openBox(boxName);
    return box.keys.toList();
  }

  /// Close box
  Future<void> closeBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box(boxName).close();
    }
  }

  /// Close all boxes
  Future<void> closeAll() async {
    await Hive.close();
  }
}
