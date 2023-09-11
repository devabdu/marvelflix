import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvelflix/src/core/utils/enums/enums.dart';
import 'package:marvelflix/src/features/home/domain/entities/movie_entities/movie_details.dart';
import 'package:marvelflix/src/features/home/domain/usecases/movies_usecases/get_movie_details_usecase.dart';
part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  MovieDetailsCubit(this.getMovieDetailsUseCase)
      : super(const MovieDetailsState());

  FutureOr<void> getMovieDetails(int id) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: id));
    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsDataState: RequestApiDataState.dataError,
          movieDetailsMessageState: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailsDataState: RequestApiDataState.dataLoaded,
        ),
      ),
    );
  }

  FutureOr<void> getMovieTrailer(int id) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: id));
    result.fold(
      (l) => emit(
        state.copyWith(
          movieTrailerDataState: RequestApiDataState.dataError,
          movieTrailerMessageState: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieTrailer: r,
          movieTrailerDataState: RequestApiDataState.dataLoaded,
        ),
      ),
    );
  }

  void togglePlayPause() {
    if (state ==
        const MovieDetailsState(videoPlayerState: VideoPlayerState.playing)) {
      emit(
        state.copyWith(videoPlayerState: VideoPlayerState.playing),
      );
    } else {
      emit(
        state.copyWith(videoPlayerState: VideoPlayerState.paused),
      );
    }
  }
}
