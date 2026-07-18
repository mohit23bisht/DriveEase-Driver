import 'package:driveease_driver/core/error/failure.dart';
import 'package:driveease_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/auth_result.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<Either<Failure, void>> call(SignupParams params) {
    return repository.signup(
      params
    );
  }
}