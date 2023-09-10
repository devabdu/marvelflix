// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class SignInSuccess extends AuthState {}

class SignInError extends AuthState {
  final String error;

  const SignInError({required this.error});

  @override
  List<Object> get props => [error];
}

class SignUpSuccess extends AuthState {}

class SignUpError extends AuthState {
  final String error;

  const SignUpError({required this.error});

  @override
  List<Object> get props => [error];
}

class SignOutSuccess extends AuthState {}

class SignOutError extends AuthState {
  final String error;

  const SignOutError({required this.error});

  @override
  List<Object> get props => [error];
}
