import 'package:dartz/dartz.dart';
import 'package:marvelflix/src/core/utils/error/failure.dart';
import 'package:marvelflix/src/features/home/domain/entities/movie_entities/movie.dart';
import 'package:marvelflix/src/features/home/domain/entities/movie_entities/movie_details.dart';
import 'package:marvelflix/src/features/home/domain/usecases/movies_usecases/get_movie_details_usecase.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getAllMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);
}
