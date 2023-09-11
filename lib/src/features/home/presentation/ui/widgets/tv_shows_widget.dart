import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvelflix/src/core/utils/enums/enums.dart';
import 'package:marvelflix/src/core/utils/resources/app_colors.dart';
import 'package:marvelflix/src/core/utils/resources/app_icons.dart';
import 'package:marvelflix/src/core/utils/resources/app_font.dart';
import 'package:marvelflix/src/core/utils/resources/app_values.dart';
import 'package:marvelflix/src/core/utils/widgets/custom_sizedbox_height.dart';
import 'package:marvelflix/src/features/home/presentation/controllers/tv_show_controller/tv_show_cubit.dart';
import 'package:marvelflix/src/features/home/presentation/ui/screens/tv_show_details_screen.dart';
import 'package:marvelflix/src/features/home/presentation/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:marvelflix/src/features/home/presentation/ui/widgets/custom_sizedbox_tv_show.dart';
import 'package:shimmer/shimmer.dart';

class TvShowsWidget extends StatelessWidget {
  const TvShowsWidget({super.key});

  Widget _buildWidgetWhenDataIsLoading() {
    return const CustomSizedBoxTvShow(
      child: Center(
        child: CustomCircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowCubit, TvShowState>(
      buildWhen: (previous, current) =>
          previous.allTvShowsDataState != current.allTvShowsDataState,
      builder: (context, state) {
        switch (state.allTvShowsDataState) {
          case RequestApiDataState.dataLoading:
            return _buildWidgetWhenDataIsLoading();
          case RequestApiDataState.dataLoaded:
            return FadeIn(
              duration: AppDurations.milliSeconds_500,
              child: CustomSizedBoxTvShow(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: AppEdgeInsetsPaddings.tvShowListViewPadding,
                  itemCount: state.allTvShows.length,
                  itemBuilder: (context, index) {
                    final tvShow = state.allTvShows[index];
                    return Container(
                      width: AppSize.s145,
                      padding:
                          AppEdgeInsetsPaddings.tvShowListViewContainerPadding,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(AppSize.s8),
                              ),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                width: AppSize.s145,
                                height: AppSize.s215,
                                imageUrl: tvShow.coverUrl,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: AppColors.lightGrey,
                                  highlightColor: AppColors.darkBlue,
                                  child: Container(
                                    height: AppSize.s170,
                                    width: AppSize.s130,
                                    decoration: const BoxDecoration(
                                      color: AppColors.darkBlue,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(AppSize.s8),
                                      ),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(AppIcons.error),
                              ),
                            ),
                            const CustomSizedBoxHeight(height: AppSize.s10),
                            Expanded(
                              child: Text(
                                tvShow.title,
                                style: GoogleFonts.mulish(
                                  fontSize: AppFontSize.s14,
                                  fontWeight: AppFontWeight.bold,
                                  color: AppColors.black,
                                ),
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
            return CustomSizedBoxTvShow(
              child: Center(
                child: Text(state.allTvShowsMessageState),
              ),
            );
        }
      },
    );
  }
}
