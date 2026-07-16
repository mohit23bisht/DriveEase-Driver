import '../../domain/entities/splash_result.dart';
import '../../domain/repositories/splash_repository.dart';
import '../datasources/splash_local_data_source.dart';

class SplashRepositoryImpl implements SplashRepository {

  final SplashLocalDataSource localDataSource;

  SplashRepositoryImpl(this.localDataSource);

  @override
  Future<SplashResult> initializeApp() async {

    final loggedIn = await localDataSource.isLoggedIn();
    final firstLaunch = await localDataSource.isFirstLaunch();

    return SplashResult(
      isLoggedIn: loggedIn,
      isFirstLaunch: firstLaunch,
    );
  }
}