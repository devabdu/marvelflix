import 'package:firebase_auth/firebase_auth.dart';
import 'package:marvelflix/src/features/auth/data/auth_expection_habdler.dart';
import 'package:marvelflix/src/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:marvelflix/src/features/auth/domain/usecases/sign_up_with_email_password_usecase.dart';

abstract class AuthRemoteDataSource {
  Future<void> signInWithEmailAndPassword(SignInParameters parameters);
  Future<void> signUpWithEmailAndPassword(SignUpParameters parameters);
  Future<void> signOut();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signInWithEmailAndPassword(SignInParameters parameters) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: parameters.email, password: parameters.password);
    } catch (error) {
      AuthExceptionHandler.handleException(error);
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword(SignUpParameters parameters) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: parameters.email, password: parameters.password);
    } catch (error) {
      AuthExceptionHandler.handleException(error);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (error) {
      AuthExceptionHandler.handleException(error);
    }
  }
}
