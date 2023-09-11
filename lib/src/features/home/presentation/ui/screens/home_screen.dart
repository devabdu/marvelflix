import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelflix/src/core/utils/helper/shared_components.dart';
import 'package:marvelflix/src/core/utils/resources/app_lists.dart';
import 'package:marvelflix/src/core/utils/resources/app_icons.dart';
import 'package:marvelflix/src/core/utils/resources/app_strings.dart';
import 'package:marvelflix/src/core/utils/resources/app_values.dart';
import 'package:marvelflix/src/core/utils/widgets/custom_singlechildscrollview_vertical.dart';
import 'package:marvelflix/src/core/utils/widgets/custom_sizedbox_height.dart';
import 'package:marvelflix/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:marvelflix/src/features/auth/presentation/screens/register_screen.dart';
import 'package:marvelflix/src/features/home/presentation/ui/widgets/custom_category_section.dart';
import 'package:marvelflix/src/features/home/presentation/ui/widgets/custom_circular_progress_indicator.dart';
import 'package:marvelflix/src/features/home/presentation/ui/widgets/custom_headline_text.dart';
import 'package:marvelflix/src/features/home/presentation/ui/widgets/custom_svg_icon.dart';
import 'package:marvelflix/src/features/home/presentation/ui/widgets/movies_widget.dart';
import 'package:marvelflix/src/features/home/presentation/ui/widgets/tv_shows_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
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
      actions: [
        Padding(
          padding: AppEdgeInsetsPaddings.appBarActionsPadding,
          child: InkWell(
            child: const CustomSvgIcon(icon: AppSvgIcons.notification),
            onTap: () {
              const CustomCircularProgressIndicator();
              BlocProvider.of<AuthCubit>(context).signOut();
              navigateTo(context, const ReigsterScreen());
            },
          ),
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
    return Scaffold(
      appBar: _buildAppBar(context),
      body: CustomSingleChildScrollViewVertical(
        children: [
          _buildTvShowSection(),
          const CustomSizedBoxHeight(height: AppSize.s10),
          _buildMovieSection(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
