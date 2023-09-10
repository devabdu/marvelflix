import 'package:dartz/dartz.dart';
import 'package:marvelflix/src/core/usecases/base_usecase.dart';
import 'package:marvelflix/src/core/utils/error/failure.dart';
import 'package:marvelflix/src/features/auth/domain/repositories/auth_repository.dart';

class SignOutUseCase extends BaseUseCase<void, NoParameters> {
  final AuthRepository authRepository;

  SignOutUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(NoParameters parameters) async {
    return await authRepository.signOut();
  }
}
