import 'package:dartz/dartz.dart';
import 'package:marvelflix/src/core/utils/error/exceptions.dart';
import 'package:marvelflix/src/core/utils/error/failure.dart';
import 'package:marvelflix/src/features/home/data/datasources/tv_show_remote_datasource.dart';
import 'package:marvelflix/src/features/home/domain/entities/tv_show_entities/tv_show.dart';
import 'package:marvelflix/src/features/home/domain/repositories/tv_show_repository.dart';
import 'package:marvelflix/src/features/home/domain/usecases/tv_show_usecase/get_show_tv_details_usecase.dart';

class TvShowRepositoryImpl extends TvShowRepository {
  TvShowRemoteDataSource tvShowRemoteDataSource;
  TvShowRepositoryImpl({required this.tvShowRemoteDataSource});

  @override
  Future<Either<Failure, List<TvShow>>> getAllTvShows() async {
    try {
      final result = await tvShowRemoteDataSource.getAllTvShows();
      return Right(result);
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(exception.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, TvShow>> getTvShowDetails(
      TvShowDetailsParameters parameters) async {
    try {
      final result = await tvShowRemoteDataSource.getTvShowsDetails(parameters);
      return Right(result);
    } on ServerException catch (exception) {
      return Left(
        ServerFailure(exception.errorMessageModel.statusMessage),
      );
    }
  }
}
