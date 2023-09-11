import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelflix/src/app/services_locator.dart';
import 'package:marvelflix/src/features/home/presentation/controllers/movie_controller/movie_details_cubit.dart';

class MovieTrailerScreen extends StatelessWidget {
  final int movieTrailerId;

  const MovieTrailerScreen({super.key, required this.movieTrailerId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator<MovieDetailsCubit>()..getMovieTrailer(movieTrailerId),
      lazy: false,
      // not finshed
      // child: const MovieTrailerWidget(),
    );
  }
}
