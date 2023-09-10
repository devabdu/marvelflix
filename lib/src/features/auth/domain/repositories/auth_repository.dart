import 'package:dartz/dartz.dart';
import 'package:marvelflix/src/core/utils/error/failure.dart';
import 'package:marvelflix/src/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:marvelflix/src/features/auth/domain/usecases/sign_up_with_email_password_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> signInWithEmailAndPassword(
      SignInParameters parameters);
  Future<Either<Failure, void>> signUpWithEmailAndPassword(
      SignUpParameters parameters);
  Future<Either<Failure, void>> signOut();
}
