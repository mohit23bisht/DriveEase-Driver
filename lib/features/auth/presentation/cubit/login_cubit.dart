import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const LoginLoading());

    try {
      await Future.delayed(const Duration(seconds: 2));

      if (email == "admin@test.com" &&
          password == "123456") {
        emit(const LoginSuccess());
      } else {
        emit(const LoginError("Invalid email or password"));
      }
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}