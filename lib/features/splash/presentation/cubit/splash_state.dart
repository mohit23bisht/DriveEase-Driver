import '../../domain/entities/splash_result.dart';

sealed class SplashState {
  const SplashState();
}

class SplashInitial extends SplashState {
  const SplashInitial();
}

class SplashLoading extends SplashState {
  const SplashLoading();
}

class SplashLoaded extends SplashState {

  final SplashResult result;

  const SplashLoaded(
    this.result,
  );

}

class SplashError extends SplashState {

  final String message;

  const SplashError(
    this.message,
  );

}