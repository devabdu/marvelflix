import 'package:dio/dio.dart';
import 'package:marvelflix/src/core/network/api_const.dart';
import 'package:marvelflix/src/core/network/error_message_model.dart';
import 'package:marvelflix/src/core/utils/error/exceptions.dart';
import 'package:marvelflix/src/features/home/data/models/movie_models/movie_details_model.dart';
import 'package:marvelflix/src/features/home/data/models/movie_models/movie_model.dart';
import 'package:marvelflix/src/features/home/domain/usecases/movies_usecases/get_movie_details_usecase.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getAllMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getAllMovies() async {
    final response = await Dio().get(ApiConst.allMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data[ApiConst.data] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConst.movieDetailsPath(parameters.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
