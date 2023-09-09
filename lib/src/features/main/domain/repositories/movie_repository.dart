import 'package:dartz/dartz.dart';
import 'package:marvelflix/src/core/utils/error/failure.dart';
import 'package:marvelflix/src/features/main/domain/entities/movie_entities/movie.dart';
import 'package:marvelflix/src/features/main/domain/entities/movie_entities/movie_details.dart';
import 'package:marvelflix/src/features/main/domain/usecases/movies_usecases/get_movie_details_usecase.dart';

abstract class MovieRepository {
  Future<Either<ServerFailure, List<Movie>>> getAllMovies();
  Future<Either<ServerFailure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);
}
