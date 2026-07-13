import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Register your dependencies here

  // Example:
  // getIt.registerLazySingleton<ApiClient>(() => ApiClient());

  // Example:
  // getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));
}