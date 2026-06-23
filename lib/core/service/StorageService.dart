import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService{

  FlutterSecureStorage storage=FlutterSecureStorage();

   Future<void> setTheme(String value) async{
    return storage.write(key: "theme", value: value);
  }

  Future<String?> getTheme() async{
    return storage.read(key: "theme");
  }

  Future<void> setToken(String value) async{
    return storage.write(key: "token", value: value);
  }

  Future<String?> getToken() async{
    return storage.read(key: "token");
  }
}