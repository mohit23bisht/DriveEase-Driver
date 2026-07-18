import 'package:driveease_driver/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:driveease_driver/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:driveease_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:driveease_driver/features/auth/domain/usecases/signup_usecase.dart';
import 'package:driveease_driver/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
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


// Firebase
getIt.registerLazySingleton<FirebaseAuth>(
  () => FirebaseAuth.instance,
);

// Data Source
getIt.registerLazySingleton<AuthRemoteDataSource>(
  () => AuthRemoteDataSourceImpl(getIt()),
);

// Repository
getIt.registerLazySingleton<AuthRepository>(
  () => AuthRepositoryImpl(getIt()),
);

// UseCase
getIt.registerLazySingleton<SignupUseCase>(
  () => SignupUseCase(getIt()),
);

// Cubit
getIt.registerFactory<SignupCubit>(
  () => SignupCubit(getIt()),
);

}