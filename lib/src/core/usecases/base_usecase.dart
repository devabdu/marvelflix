import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:marvelflix/src/core/utils/error/failure.dart';

abstract class BaseUseCase<Type, Parameters> {
  Future<Either<ServerFailure, Type>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}
