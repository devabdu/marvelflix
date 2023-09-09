import 'package:get_it/get_it.dart';
import 'package:marvelflix/src/features/main/data/datasources/movie_remote_data_source.dart';
import 'package:marvelflix/src/features/main/data/datasources/tv_show_remote_data_source.dart';
import 'package:marvelflix/src/features/main/data/repositories/movie_repository_impl.dart';
import 'package:marvelflix/src/features/main/data/repositories/tv_show_repository_impl.dart';
import 'package:marvelflix/src/features/main/domain/repositories/movie_repository.dart';
import 'package:marvelflix/src/features/main/domain/repositories/tv_show_repository.dart';
import 'package:marvelflix/src/features/main/domain/usecases/movies_usecases/get_all_movies_usecase.dart';
import 'package:marvelflix/src/features/main/domain/usecases/movies_usecases/get_movie_details_usecase.dart';
import 'package:marvelflix/src/features/main/domain/usecases/tv_show_usecase/get_all_tv_shows.usecase.dart';
import 'package:marvelflix/src/features/main/domain/usecases/tv_show_usecase/get_show_tv_details_usecase.dart';
import 'package:marvelflix/src/features/main/presentation/controllers/movie_controller/movie_cubit.dart';
import 'package:marvelflix/src/features/main/presentation/controllers/movie_controller/movie_details_cubit.dart';
import 'package:marvelflix/src/features/main/presentation/controllers/tv_show_controller/tv_show_cubit.dart';
import 'package:marvelflix/src/features/main/presentation/controllers/tv_show_controller/tv_show_details_cubit.dart';

final serviceLocator = GetIt.instance;

class ServicesLocator {
  void init() {
    // Bloc
    serviceLocator.registerFactory(() => MovieCubit(serviceLocator()));
    serviceLocator.registerFactory(() => MovieDetailsCubit(serviceLocator()));
    serviceLocator.registerFactory(() => TvShowCubit(serviceLocator()));
    serviceLocator.registerFactory(() => TvShowDetailsCubit(serviceLocator()));

    /// Use Cases
    serviceLocator
        .registerLazySingleton(() => GetAllMoviesUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => GetMovieDetailsUseCase(serviceLocator()));

    serviceLocator
        .registerLazySingleton(() => GetAllTvShowsUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => GetTvShowDetailsuseCase(serviceLocator()));

    ///Repository
    serviceLocator.registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImpl(movieRemoteDataSource: serviceLocator()));
    serviceLocator.registerLazySingleton<TvShowRepository>(
        () => TvShowRepositoryImpl(tvShowRemoteDataSource: serviceLocator()));

    ///Data Source
    serviceLocator.registerLazySingleton<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl());
    serviceLocator.registerLazySingleton<TvShowRemoteDataSource>(
        () => TvShowRemoteDataSourceImpl());
  }
}
