import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelflix/src/app/services_locator.dart';
import 'package:marvelflix/src/features/home/presentation/controllers/tv_show_controller/tv_show_details_cubit.dart';

class TvShowTrailerScreen extends StatelessWidget {
  final int tvShowId;
  const TvShowTrailerScreen({super.key, required this.tvShowId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: BlocProvider(
        //   create: (context) =>
        //       serviceLocator<TvShowDetailsCubit>()..getMovieDetails(id),
        //   lazy: false,
        //   child: const MovieDetailsWidget(),
        // ),
        );
  }
}
