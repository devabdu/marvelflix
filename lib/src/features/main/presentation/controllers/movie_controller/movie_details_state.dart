part of 'movie_details_cubit.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestApiDataState movieDetailsDataState;
  final String movieDetailsMessageState;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsDataState = RequestApiDataState.dataLoading,
    this.movieDetailsMessageState = '',
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestApiDataState? movieDetailsDataState,
    String? movieDetailsMessageState,
    int? movieId,
  }) =>
      MovieDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsDataState:
            movieDetailsDataState ?? this.movieDetailsDataState,
        movieDetailsMessageState:
            movieDetailsMessageState ?? this.movieDetailsMessageState,
      );

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsDataState,
        movieDetailsMessageState,
      ];
}
