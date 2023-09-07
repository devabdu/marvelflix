import 'package:equatable/equatable.dart';
import 'package:marvelflix/src/features/main/domain/entities/movie_entities/movie_recommendation.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final int duration;
  final String overview;
  final String trailerUrl;
  final String directedBy;
  final int phase;
  final List<MovieRecommendation> movieRecommendation;

  const MovieDetails(
      {required this.id,
      required this.title,
      required this.duration,
      required this.overview,
      required this.trailerUrl,
      required this.directedBy,
      required this.phase,
      required this.movieRecommendation});

  @override
  List<Object?> get props => [
        id,
        title,
        duration,
        overview,
        trailerUrl,
        directedBy,
        phase,
        movieRecommendation,
      ];
}
