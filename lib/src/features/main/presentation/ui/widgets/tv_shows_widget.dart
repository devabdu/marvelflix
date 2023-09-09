import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvelflix/src/core/utils/enums/enums.dart';
import 'package:marvelflix/src/core/utils/resources/app_colors.dart';
import 'package:marvelflix/src/features/main/presentation/controllers/tv_show_controller/tv_show_cubit.dart';
import 'package:marvelflix/src/features/main/presentation/ui/screens/tv_show_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class TvShowsWidget extends StatelessWidget {
  const TvShowsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowCubit, TvShowState>(
      buildWhen: (previous, current) =>
          previous.allTvShowsDataState != current.allTvShowsDataState,
      builder: (context, state) {
        switch (state.allTvShowsDataState) {
          case RequestApiDataState.dataLoading:
            return const SizedBox(
              height: 242,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              ),
            );
          case RequestApiDataState.dataLoaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 242,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  itemCount: state.allTvShows.length,
                  itemBuilder: (context, index) {
                    final tvShow = state.allTvShows[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 14.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TvShowDetailsScreen(id: tvShow.id),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              child: CachedNetworkImage(
                                width: 143.0,
                                height: 212.0,
                                fit: BoxFit.cover,
                                imageUrl: tvShow.coverUrl,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey[850]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(
                                    height: 170.0,
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                tvShow.title,
                                style: GoogleFonts.mulish(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black,
                                ),
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestApiDataState.dataError:
            return SizedBox(
              height: 242,
              child: Center(
                child: Text(state.allTvShowsMessageState),
              ),
            );
        }
      },
    );
  }
}
