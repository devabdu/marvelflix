import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:marvelflix/src/core/usecases/base_usecase.dart';
import 'package:marvelflix/src/core/utils/error/failure.dart';
import 'package:marvelflix/src/features/main/domain/entities/movie_entities/movie_details.dart';
import 'package:marvelflix/src/features/main/domain/repositories/movie_repository.dart';

class GetMovieDetailsuseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final MovieRepository movieRepository;

  GetMovieDetailsuseCase({required this.movieRepository});

  @override
  Future<Either<ServerFailure, MovieDetails>> call(
      MovieDetailsParameters parameters) async {
    return await movieRepository.getMovieDetail(parameters);
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
