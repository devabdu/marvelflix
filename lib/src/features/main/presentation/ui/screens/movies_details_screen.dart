import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelflix/src/app/services_locator.dart';
import 'package:marvelflix/src/features/main/presentation/controllers/movie_controller/movie_details_cubit.dart';
import 'package:marvelflix/src/features/main/presentation/ui/widgets/movies_details_widget.dart';

class MoviesDetailsScreen extends StatelessWidget {
  final int id;
  const MoviesDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            serviceLocator<MovieDetailsCubit>()..getMovieDetails(id),
        lazy: false,
        child: const MovieDetailsWidget(),
      ),
    );
  }
}
