import 'package:driveease_driver/core/error/failure.dart';
import 'package:driveease_driver/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:driveease_driver/features/auth/domain/entities/auth_result.dart';
import 'package:driveease_driver/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> signup(SignupParams params) async {
    try {
      await remoteDataSource.signup(
        email: params.email,
        password: params.password,
      );

      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.message ?? "Authentication failed"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<bool> isLoggedIn() {
    // TODO: implement isLoggedIn
    throw UnimplementedError();
  }
  
  @override
  Future<bool> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }
  
  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}