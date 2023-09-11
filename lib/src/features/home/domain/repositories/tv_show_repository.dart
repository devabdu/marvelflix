import 'package:dartz/dartz.dart';
import 'package:marvelflix/src/core/utils/error/failure.dart';
import 'package:marvelflix/src/features/home/domain/entities/tv_show_entities/tv_show.dart';
import 'package:marvelflix/src/features/home/domain/usecases/tv_show_usecase/get_show_tv_details_usecase.dart';

abstract class TvShowRepository {
  Future<Either<Failure, List<TvShow>>> getAllTvShows();
  Future<Either<Failure, TvShow>> getTvShowDetails(
      TvShowDetailsParameters parameters);
}
