import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvelflix/src/core/usecases/base_usecase.dart';
import 'package:marvelflix/src/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:marvelflix/src/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:marvelflix/src/features/auth/domain/usecases/sign_up_with_email_password_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInWithEmailAndPasswordUseCase signInUseCase;
  final SignUpWithEmailAndPasswordUseCase signUpUseCase;
  final SignOutUseCase signOutUseCase;

  AuthCubit(this.signInUseCase, this.signUpUseCase, this.signOutUseCase)
      : super(AuthInitial());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final response =
        await signInUseCase(SignInParameters(email: email, password: password));

    response.fold(
      (l) => emit(SignInError(error: l.message)),
      (r) => emit(SignInSuccess()),
    );
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    final response =
        await signUpUseCase(SignUpParameters(email: email, password: password));

    response.fold(
      (l) => emit(SignUpError(error: l.message)),
      (r) => emit(SignUpSuccess()),
    );
  }

  Future<void> signOut() async {
    final response = await signOutUseCase(const NoParameters());

    response.fold(
      (l) => emit(SignOutError(error: l.message)),
      (r) => emit(SignOutSuccess()),
    );
  }
}
