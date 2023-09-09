import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvelflix/src/core/utils/enums/enums.dart';
import 'package:marvelflix/src/features/main/presentation/controllers/movie_controller/movie_details_cubit.dart';

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        switch (state.movieDetailsDataState) {
          case RequestApiDataState.dataLoading:
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          case RequestApiDataState.dataLoaded:
            return CustomScrollView(
              key: const Key('tvShowDetailScrollView'),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0.0, 0.5, 1.0, 1.0],
                          ).createShader(
                            Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          imageUrl: 
                              state.movieDetails!.coverUrl,
                          fit: BoxFit.cover, 
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.movieDetails!.title,
                              style: GoogleFonts.poppins(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.2,
                              )),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2.0,
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text(
                                  state.movieDetails!.directedBy,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20.0,
                                  ),
                                  SizedBox(width: 4.0),
                                  // Text(
                                  //   (state.tvShowDetails!.movieVoteAverageDetail /
                                  //           2)
                                  //       .toStringAsFixed(1),
                                  //   style: const TextStyle(
                                  //     fontSize: 16.0,
                                  //     fontWeight: FontWeight.w500,
                                  //     letterSpacing: 1.2,
                                  //   ),
                                  // ),
                                  // const SizedBox(width: 4.0),
                                  // Text(
                                  //   '(${state.movieDetail!.movieVoteAverageDetail})',
                                  //   style: const TextStyle(
                                  //     fontSize: 1.0,
                                  //     fontWeight: FontWeight.w500,
                                  //     letterSpacing: 1.2,
                                  //   ),
                                  // ),
                                ],
                              ),
                              const SizedBox(width: 16.0),
                              // Text(
                              //   _showDuration(
                              //       state.tvShowDetails!.),
                              //   style: const TextStyle(
                              //     color: Colors.white70,
                              //     fontSize: 16.0,
                              //     fontWeight: FontWeight.w500,
                              //     letterSpacing: 1.2,
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            state.movieDetails!.overview,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          // Text(
                          //   'Genres: ${_showGenres(state.movieDetail!.movieGenres)}',
                          //   style: const TextStyle(
                          //     color: Colors.white70,
                          //     fontSize: 12.0,
                          //     fontWeight: FontWeight.w500,
                          //     letterSpacing: 1.2,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: SliverToBoxAdapter(
                    child: FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        'More like this'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                // Tab(text: 'More like this'.toUpperCase()),
              ],
            );
          case RequestApiDataState.dataError:
            return Center(
              child: Text(state.movieDetailsMessageState),
            );
        }
      },
    );
  }
}
