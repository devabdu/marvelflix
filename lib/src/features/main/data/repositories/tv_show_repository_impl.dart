// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:marvelflix/src/core/utils/error/exceptions.dart';

import 'package:marvelflix/src/core/utils/error/failure.dart';
import 'package:marvelflix/src/features/main/data/datasources/tv_show_remote_data_source.dart';
import 'package:marvelflix/src/features/main/domain/entities/tv_show_entities/tv_show.dart';
import 'package:marvelflix/src/features/main/domain/repositories/tv_show_repository.dart';
import 'package:marvelflix/src/features/main/domain/usecases/tv_show_usecase/get_show_tv_details_usecase.dart';

class TvShowRepositoryImpl extends TvShowRepository {
  TvShowRemoteDataSource tvShowRemoteDataSource;
  TvShowRepositoryImpl({required this.tvShowRemoteDataSource});

  @override
  Future<Either<ServerFailure, List<TvShow>>> getAllTvShows() async {
    final result = await tvShowRemoteDataSource.getAllTvShows();
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
  Future<Either<ServerFailure, TvShow>> getTvShowDetails(
      TvShowDetailsParameters parameters) async {
    final result = await tvShowRemoteDataSource.getTvShowsDetails(parameters);
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
