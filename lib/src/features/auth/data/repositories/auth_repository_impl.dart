import 'package:dartz/dartz.dart';
import 'package:marvelflix/src/core/utils/error/exceptions.dart';
import 'package:marvelflix/src/core/utils/error/failure.dart';
import 'package:marvelflix/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:marvelflix/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:marvelflix/src/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:marvelflix/src/features/auth/domain/usecases/sign_up_with_email_password_usecase.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, void>> signInWithEmailAndPassword(
      SignInParameters parameters) async {
    try {
      final response =
          await authRemoteDataSource.signInWithEmailAndPassword(parameters);
      return Right(response);
    } on FirebaseException catch (exception) {
      return Left(FirebaseFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, void>> signUpWithEmailAndPassword(
      SignUpParameters parameters) async {
    try {
      final response =
          await authRemoteDataSource.signUpWithEmailAndPassword(parameters);
      return Right(response);
    } on FirebaseException catch (exception) {
      return Left(FirebaseFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final response = await authRemoteDataSource.signOut();
      return Right(response);
    } on FirebaseException catch (exception) {
      return Left(FirebaseFailure(exception.message!));
    }
  }
}
