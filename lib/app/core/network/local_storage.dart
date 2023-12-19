import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final storage = const FlutterSecureStorage();

  Future<void> saveStorageData(
      {required String key, required String data}) async {
    await storage.write(key: key, value: data);
  }

  Future<String?> getStorageData({required String key}) async {
    return await storage.read(key: key);
  }

  Future<void> removeStorageData({required String key}) async {
    await storage.delete(key: key);
  }
}
