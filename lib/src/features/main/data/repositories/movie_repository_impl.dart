import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:marvelflix/src/core/utils/error/exceptions.dart';
import 'package:marvelflix/src/core/utils/error/failure.dart';
import 'package:marvelflix/src/features/main/data/datasources/movie_remote_data_source.dart';
import 'package:marvelflix/src/features/main/domain/entities/movie_entities/movie.dart';
import 'package:marvelflix/src/features/main/domain/entities/movie_entities/movie_details.dart';
import 'package:marvelflix/src/features/main/domain/repositories/movie_repository.dart';
import 'package:marvelflix/src/features/main/domain/usecases/movies_usecases/get_movie_details_usecase.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl({required this.movieRemoteDataSource});

  @override
  Future<Either<ServerFailure, List<Movie>>> getAllMovies() async {
    final result = await movieRemoteDataSource.getAllMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      if (kDebugMode) {
        print(failure.errorMessageModel);
      }
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<ServerFailure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await movieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      if (kDebugMode) {
        print(failure.errorMessageModel);
      }
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }
}
