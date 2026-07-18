import 'package:driveease_driver/core/error/failure.dart';
import 'package:driveease_driver/features/auth/domain/entities/auth_result.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> signup(SignupParams params);

  Future<bool> login({
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<bool> isLoggedIn();
}