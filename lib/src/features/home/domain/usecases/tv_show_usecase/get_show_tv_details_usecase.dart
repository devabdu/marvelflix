import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:marvelflix/src/core/usecases/base_usecase.dart';
import 'package:marvelflix/src/core/utils/error/failure.dart';
import 'package:marvelflix/src/features/home/domain/entities/tv_show_entities/tv_show.dart';
import 'package:marvelflix/src/features/home/domain/repositories/tv_show_repository.dart';

class GetTvShowDetailsuseCase
    extends BaseUseCase<TvShow, TvShowDetailsParameters> {
  final TvShowRepository tvShowRepository;

  GetTvShowDetailsuseCase(this.tvShowRepository);

  @override
  Future<Either<Failure, TvShow>> call(
      TvShowDetailsParameters parameters) async {
    return await tvShowRepository.getTvShowDetails(parameters);
  }
}

class TvShowDetailsParameters extends Equatable {
  final int tvshowId;

  const TvShowDetailsParameters({required this.tvshowId});

  @override
  List<Object?> get props => [tvshowId];
}
