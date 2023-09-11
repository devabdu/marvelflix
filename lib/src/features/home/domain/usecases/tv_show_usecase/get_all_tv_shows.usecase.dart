import 'package:dartz/dartz.dart';
import 'package:marvelflix/src/core/usecases/base_usecase.dart';
import 'package:marvelflix/src/core/utils/error/failure.dart';
import 'package:marvelflix/src/features/home/domain/entities/tv_show_entities/tv_show.dart';
import 'package:marvelflix/src/features/home/domain/repositories/tv_show_repository.dart';

class GetAllTvShowsUseCase extends BaseUseCase<List<TvShow>, NoParameters> {
  final TvShowRepository tvShowRepository;

  GetAllTvShowsUseCase(this.tvShowRepository);

  @override
  Future<Either<Failure, List<TvShow>>> call(
      NoParameters parameters) async {
    return await tvShowRepository.getAllTvShows();
  }
}
