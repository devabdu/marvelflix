import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelflix/src/app/services_locator.dart';
import 'package:marvelflix/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:marvelflix/src/features/auth/presentation/screens/login_screen.dart';
import 'package:marvelflix/src/features/auth/presentation/screens/register_screen.dart';
import 'package:marvelflix/src/features/home/presentation/controllers/movie_controller/movie_cubit.dart';
import 'package:marvelflix/src/features/home/presentation/controllers/tv_show_controller/tv_show_cubit.dart';
import 'package:marvelflix/src/features/home/presentation/ui/screens/home_screen.dart';
import 'package:marvelflix/src/features/home/presentation/ui/screens/movie_trailer_screen.dart';
import 'package:marvelflix/src/features/home/presentation/ui/screens/movies_details_screen.dart';
import 'package:marvelflix/src/features/home/presentation/ui/screens/tv_show_details_screen.dart';
import 'package:marvelflix/src/features/home/presentation/ui/screens/tv_show_trailer_screen.dart';

class AppRoutesName {
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String homeRoute = "/home";
  static const String movieDetailsRoute = "/movieDetails";
  static const String tvShowDetailsRoute = "/tvShowDetails";
  static const String movieTrailerRoute = "/movieTrailer";
  static const String tvShowTrailerRoute = "/tvShowTrailer";
}

class AppRoutesGenerator {
  static Route<dynamic> generatePageRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutesName.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case AppRoutesName.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const ReigsterScreen(),
        );
      case AppRoutesName.homeRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    serviceLocator<TvShowCubit>()..getAllTvShows(),
              ),
              BlocProvider(
                create: (context) =>
                    serviceLocator<MovieCubit>()..getAllMovies(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<AuthCubit>()..signOut(),
              )
            ],
            child: const HomeScreen(),
          ),
        );
      case AppRoutesName.movieDetailsRoute:
        final movieId = routeSettings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => MoviesDetailsScreen(id: movieId),
        );
      case AppRoutesName.tvShowDetailsRoute:
        final tvShowId = routeSettings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => TvShowDetailsScreen(id: tvShowId),
        );
      case AppRoutesName.movieTrailerRoute:
        final movieTrailerId = routeSettings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => MovieTrailerScreen(
                  movieTrailerId: movieTrailerId,
                ));
      case AppRoutesName.tvShowTrailerRoute:
        final tvShowTrailerId = routeSettings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => TvShowTrailerScreen(tvShowId: tvShowTrailerId));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text('No Route Found'),
            ),
          )),
    );
  }
}
