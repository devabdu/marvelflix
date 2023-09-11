import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelflix/src/app/services_locator.dart';
import 'package:marvelflix/src/core/utils/resources/app_lists.dart';
import 'package:marvelflix/src/core/utils/resources/app_icons.dart';
import 'package:marvelflix/src/core/utils/resources/app_strings.dart';
import 'package:marvelflix/src/core/utils/resources/app_values.dart';
import 'package:marvelflix/src/core/utils/widgets/custom_singlechildscrollview_vertical.dart';
import 'package:marvelflix/src/core/utils/widgets/custom_sizedbox_height.dart';
import 'package:marvelflix/src/features/home/presentation/controllers/movie_controller/movie_cubit.dart';
import 'package:marvelflix/src/features/home/presentation/controllers/tv_show_controller/tv_show_cubit.dart';
import 'package:marvelflix/src/features/home/presentation/ui/widgets/custom_category_section.dart';
import 'package:marvelflix/src/features/home/presentation/ui/widgets/custom_headline_text.dart';
import 'package:marvelflix/src/features/home/presentation/ui/widgets/custom_svg_icon.dart';
import 'package:marvelflix/src/features/home/presentation/ui/widgets/movies_widget.dart';
import 'package:marvelflix/src/features/home/presentation/ui/widgets/tv_shows_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  PreferredSizeWidget? _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: AppEdgeInsetsPaddings.appBarLeadingPadding,
        child: Container(
          padding: AppEdgeInsetsPaddings.appBarLeadingIconPadding,
          child: const CustomSvgIcon(icon: AppSvgIcons.menu),
        ),
      ),
      title: const CustomHeadLineText(headLine: AppStrings.marvel),
      centerTitle: true,
      actions: const [
        Padding(
          padding: AppEdgeInsetsPaddings.appBarActionsPadding,
          child: CustomSvgIcon(icon: AppSvgIcons.notification),
        ),
      ],
    );
  }

  Widget _buildTvShowSection() {
    return CustomCategorySection(
      nameOfCategory: AppStrings.tvShows,
      pressSeeMore: () {
        // Todo Navigation See <ore TvShows Screen
      },
      widgetOfCategory: const TvShowsWidget(),
    );
  }

  Widget _buildMovieSection() {
    return CustomCategorySection(
      nameOfCategory: AppStrings.movies,
      pressSeeMore: () {
        // Todo Navigation See More Movies Screen
      },
      widgetOfCategory: const MoviesWidget(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(items: AppLists.items);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<TvShowCubit>()..getAllTvShows(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<MovieCubit>()..getAllMovies(),
        ),
      ],
      child: Scaffold(
        appBar: _buildAppBar(),
        body: CustomSingleChildScrollViewVertical(
          children: [
            _buildTvShowSection(),
            const CustomSizedBoxHeight(height: AppSize.s10),
            _buildMovieSection(),
          ],
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }
}
