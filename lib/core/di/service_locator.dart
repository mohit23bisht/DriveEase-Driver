import 'package:get_it/get_it.dart';

import '../../features/splash/splash.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {

  // Local Data Source
  getIt.registerLazySingleton<SplashLocalDataSource>(
    () => SplashLocalDataSource(),
  );

  // Repository
  getIt.registerLazySingleton<SplashRepository>(
    () => SplashRepositoryImpl(getIt()),
  );

  // UseCase
  getIt.registerLazySingleton<InitializeAppUseCase>(
    () => InitializeAppUseCase(getIt()),
  );

  // Cubit
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt()),
  );
}