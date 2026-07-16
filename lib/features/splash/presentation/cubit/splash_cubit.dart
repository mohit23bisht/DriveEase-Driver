import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/initialize_app_usecase.dart';
import '../../splash.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final InitializeAppUseCase initializeAppUseCase;

  SplashCubit(this.initializeAppUseCase) : super(const SplashInitial());

  Future<void> initializeApp() async {
    emit(const SplashLoading());

    try {

    final results = await Future.wait([

      initializeAppUseCase(), // Initialization

      Future.delayed(const Duration(seconds: 3)), // Minimum splash time

    ]);

    final splashResult = results.first as SplashResult;

    emit(SplashLoaded(splashResult));

  } catch (e) {

    emit(SplashError(e.toString()));

  }
  }
}
