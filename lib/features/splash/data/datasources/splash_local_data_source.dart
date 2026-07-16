import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class SplashLocalDataSource {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<bool> isLoggedIn() async {
    final token = await storage.read(key: "token");

    return token != null;
  }

  Future<bool> isFirstLaunch() async {
    final isFirstLaunch = await storage.read(key: "isFirstLaunch");
    return isFirstLaunch == null || isFirstLaunch == "true";
  }
}
