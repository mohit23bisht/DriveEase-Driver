import '../entities/splash_result.dart';

abstract class SplashRepository {
  Future<SplashResult> initializeApp();
}