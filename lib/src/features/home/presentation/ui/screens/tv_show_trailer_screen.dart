import 'package:flutter/material.dart';

class TvShowTrailerScreen extends StatelessWidget {
  final int tvShowId;
  const TvShowTrailerScreen({super.key, required this.tvShowId});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // body: BlocProvider(
        //   create: (context) =>
        //       serviceLocator<TvShowDetailsCubit>()..getMovieDetails(id),
        //   lazy: false,
        //   child: const MovieDetailsWidget(),
        // ),
        );
  }
}
