import 'package:dartz/dartz.dart';
import 'package:marvelflix/src/core/usecases/base_usecase.dart';
import 'package:marvelflix/src/core/utils/error/failure.dart';
import 'package:marvelflix/src/features/main/domain/entities/tv_show_entities/tv_show.dart';
import 'package:marvelflix/src/features/main/domain/repositories/tv_show_repository.dart';

class GetAllTvShowsUseCase extends BaseUseCase<List<TvShow>, NoParameters> {
  final TvShowRepository tvShowRepository;

  GetAllTvShowsUseCase(this.tvShowRepository);

  @override
  Future<Either<ServerFailure, List<TvShow>>> call(
      NoParameters parameters) async {
    return await tvShowRepository.getAllTvShows();
  }
}
