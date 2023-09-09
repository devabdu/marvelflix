import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvelflix/src/app/services_locator.dart';
import 'package:marvelflix/src/core/utils/resources/app_colors.dart';
import 'package:marvelflix/src/core/utils/resources/app_icons.dart';
import 'package:marvelflix/src/core/utils/resources/app_strings.dart';
import 'package:marvelflix/src/features/main/presentation/controllers/movie_controller/movie_cubit.dart';
import 'package:marvelflix/src/features/main/presentation/controllers/tv_show_controller/tv_show_cubit.dart';
import 'package:marvelflix/src/features/main/presentation/ui/widgets/custom_container.dart';
import 'package:marvelflix/src/features/main/presentation/ui/widgets/movies_widget.dart';
import 'package:marvelflix/src/features/main/presentation/ui/widgets/tv_shows_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Container(
              padding: const EdgeInsets.all(4),
              child: SvgPicture.asset(
                AppSvgIcons.menu,
              ),
            ),
          ),
          title: Text(
            AppStrings.marvel,
            style: GoogleFonts.merriweather(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.15,
              color: AppColors.darkBlue,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: SvgPicture.asset(
                AppSvgIcons.notification,
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          key: const Key('mainScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomContainer(
                nameOfCategory: AppStrings.tvShows,
                pressSeeMore: () {
                  /// Todo Navigation Popular Screen
                },
              ),
              const TvShowsWidget(),
              CustomContainer(
                nameOfCategory: AppStrings.movies,
                pressSeeMore: () {
                  /// Todo Navigation Popular Screen
                },
              ),
              const MoviesWidget(),
            ],
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(items: const [
        //   BottomNavigationBarItem(icon: Icon(Icons.movie)),
        //   BottomNavigationBarItem(icon: Icon(Icons.hourglass_empty)),
        //   BottomNavigationBarItem(icon: Icon(Icons.bookmark_border)),
        // ]),
      ),
    );
  }
}
