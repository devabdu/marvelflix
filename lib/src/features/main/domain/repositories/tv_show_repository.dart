import 'package:dartz/dartz.dart';
import 'package:marvelflix/src/core/utils/error/failure.dart';
import 'package:marvelflix/src/features/main/domain/entities/tv_show_entities/tv_show.dart';
import 'package:marvelflix/src/features/main/domain/usecases/tv_show_usecase/get_show_tv_details_usecase.dart';

abstract class TvShowRepository {
  Future<Either<ServerFailure, List<TvShow>>> getAllTvShows();
  Future<Either<ServerFailure, TvShow>> getTvShowDetails(
      TvShowDetailsParameters parameters);
}
