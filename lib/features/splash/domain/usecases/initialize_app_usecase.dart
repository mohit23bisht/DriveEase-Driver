import '../entities/splash_result.dart';
import '../repositories/splash_repository.dart';

class InitializeAppUseCase {
  final SplashRepository repository;

  InitializeAppUseCase(this.repository);

  Future<SplashResult> call() {
    return repository.initializeApp();
  }
}