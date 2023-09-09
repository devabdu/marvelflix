import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvelflix/src/core/utils/enums/enums.dart';
import 'package:marvelflix/src/core/utils/resources/app_colors.dart';
import 'package:marvelflix/src/features/main/presentation/controllers/movie_controller/movie_cubit.dart';
import 'package:marvelflix/src/features/main/presentation/ui/screens/movies_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      buildWhen: (previous, current) =>
          previous.allMoviesDataState != current.allMoviesDataState,
      builder: (context, state) {
        switch (state.allMoviesDataState) {
          case RequestApiDataState.dataLoading:
            return const SizedBox(
              height: 400,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              ),
            );
          case RequestApiDataState.dataLoaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(16),
                itemCount: state.allMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.allMovies[index];
                  return Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MoviesDetailsScreen(id: movie.id),
                          ),
                        );
                      },
                      // child: ListTile(
                      //   leading: ClipRRect(
                      //     borderRadius:
                      //         const BorderRadius.all(Radius.circular(8.0)),
                      //     child: CachedNetworkImage(
                      //       width: 85,
                      //       height: 120,
                      //       fit: BoxFit.cover,
                      //       imageUrl: movie.coverUrl,
                      //       placeholder: (context, url) => Shimmer.fromColors(
                      //         baseColor: Colors.black,
                      //         highlightColor: Colors.black,
                      //         child: Container(
                      //           height: 170.0,
                      //           width: 120.0,
                      //           decoration: BoxDecoration(
                      //             color: Colors.black,
                      //             borderRadius: BorderRadius.circular(8.0),
                      //           ),
                      //         ),
                      //       ),
                      //       errorWidget: (context, url, error) =>
                      //           const Icon(Icons.save),
                      //     ),
                      //   ),
                      //   title: Text(
                      //     movie.title,
                      //     style: GoogleFonts.mulish(
                      //       fontSize: 14,
                      //       fontWeight: FontWeight.w700,
                      //       color: AppColors.black,
                      //     ),
                      //   ),
                      //   subtitle: Column(
                      //     children: [
                      //       Text(
                      //         movie.directedBy,
                      //         style: GoogleFonts.mulish(
                      //           fontSize: 12,
                      //           fontWeight: FontWeight.w400,
                      //           color: AppColors.black,
                      //         ),
                      //       ),
                      //       Text(
                      //         movie.directedBy,
                      //         style: GoogleFonts.mulish(
                      //           fontSize: 12,
                      //           fontWeight: FontWeight.w400,
                      //           color: AppColors.black,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      //   isThreeLine: true,
                      // ),

                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            child: CachedNetworkImage(
                              width: 85,
                              height: 120,
                              fit: BoxFit.cover,
                              imageUrl: movie.coverUrl,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.black,
                                highlightColor: Colors.black,
                                child: Container(
                                  height: 120.0,
                                  width: 85.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.save),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                movie.title,
                                style: GoogleFonts.mulish(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black,
                                ),
                              ),
                              Text(
                                movie.directedBy,
                                style: GoogleFonts.mulish(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                              Text(
                                movie.releaseDate,
                                style: GoogleFonts.mulish(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          case RequestApiDataState.dataError:
            return SizedBox(
              height: 400,
              child: Center(
                child: Text(state.allMoviesMessageState),
              ),
            );
        }
      },
    );
  }
}
