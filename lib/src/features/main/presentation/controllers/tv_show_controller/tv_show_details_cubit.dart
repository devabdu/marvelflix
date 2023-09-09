import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvelflix/src/core/utils/enums/enums.dart';
import 'package:marvelflix/src/features/main/domain/entities/tv_show_entities/tv_show.dart';
import 'package:marvelflix/src/features/main/domain/usecases/tv_show_usecase/get_show_tv_details_usecase.dart';
part 'tv_show_details_state.dart';

class TvShowDetailsCubit extends Cubit<TvShowDetailsState> {
  final GetTvShowDetailsuseCase getTvShowDetailsuseCase;
  TvShowDetailsCubit(this.getTvShowDetailsuseCase)
      : super(const TvShowDetailsState());

  FutureOr<void> getTvShowDetails(int id) async {
    final result =
        await getTvShowDetailsuseCase(TvShowDetailsParameters(tvshowId: id));
    result.fold(
      (l) => emit(
        state.copyWith(
          tvShowDetailsDataState: RequestApiDataState.dataError,
          tvShowDetailsMessageState: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          tvShowDetails: r,
          tvShowDetailsDataState: RequestApiDataState.dataLoaded,
        ),
      ),
    );
  }
}
