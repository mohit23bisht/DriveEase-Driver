
import 'package:driveease_driver/features/auth/domain/entities/auth_result.dart';
import 'package:driveease_driver/features/auth/domain/usecases/signup_usecase.dart';
import 'package:driveease_driver/features/auth/presentation/cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {

  SignupCubit(this._signupUseCase)
      : super(const SignupState());

  final SignupUseCase _signupUseCase;

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {

    emit(state.copyWith(status: SignupStatus.loading));

    final result = await _signupUseCase(
      SignupParams(
        name: name,
        email: email,
        password: password,
      ),
    );

    result.fold(

      (failure) {

        emit(
          state.copyWith(
            status: SignupStatus.failure,
            message: failure.message,
          ),
        );
      },

      (_) {

        emit(
          state.copyWith(
            status: SignupStatus.success,
          ),
        );
      },
    );
  }
}