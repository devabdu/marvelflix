import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:marvelflix/src/core/utils/error/exceptions.dart';
import 'package:marvelflix/src/core/utils/error/failure.dart';
import 'package:marvelflix/src/features/home/data/datasources/movie_remote_datasource.dart';
import 'package:marvelflix/src/features/home/domain/entities/movie_entities/movie.dart';
import 'package:marvelflix/src/features/home/domain/entities/movie_entities/movie_details.dart';
import 'package:marvelflix/src/features/home/domain/repositories/movie_repository.dart';
import 'package:marvelflix/src/features/home/domain/usecases/movies_usecases/get_movie_details_usecase.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl({required this.movieRemoteDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getAllMovies() async {
    try {
      final result = await movieRemoteDataSource.getAllMovies();
      return Right(result);
    } on ServerException catch (exception) {
      return Left(ServerFailure(exception.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    try {
      final result = await movieRemoteDataSource.getMovieDetails(parameters);
      return Right(result);
    } on ServerException catch (exception) {
      if (kDebugMode) {
        print(exception.errorMessageModel);
      }
      return Left(ServerFailure(exception.errorMessageModel.statusMessage));
    }
  }
}
