import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:marvelflix/src/core/usecases/base_usecase.dart';
import 'package:marvelflix/src/core/utils/error/failure.dart';
import 'package:marvelflix/src/features/home/domain/entities/movie_entities/movie_details.dart';
import 'package:marvelflix/src/features/home/domain/repositories/movie_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final MovieRepository movieRepository;

  GetMovieDetailsUseCase(this.movieRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParameters parameters) async {
    return await movieRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({
    required this.movieId,
  });

  @override
  List<Object?> get props => [movieId];
}
