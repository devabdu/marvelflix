import 'package:dartz/dartz.dart';
import 'package:marvelflix/src/core/usecases/base_usecase.dart';
import 'package:marvelflix/src/core/utils/error/failure.dart';
import 'package:marvelflix/src/features/home/domain/entities/movie_entities/movie.dart';
import 'package:marvelflix/src/features/home/domain/repositories/movie_repository.dart';

class GetAllMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final MovieRepository movieRepository;

  GetAllMoviesUseCase(this.movieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await movieRepository.getAllMovies();
  }
}
