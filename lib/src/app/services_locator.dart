import 'package:get_it/get_it.dart';
import 'package:marvelflix/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:marvelflix/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:marvelflix/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:marvelflix/src/features/auth/domain/usecases/sign_in_with_email_password_usecase.dart';
import 'package:marvelflix/src/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:marvelflix/src/features/auth/domain/usecases/sign_up_with_email_password_usecase.dart';
import 'package:marvelflix/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:marvelflix/src/features/home/data/datasources/movie_remote_datasource.dart';
import 'package:marvelflix/src/features/home/data/datasources/tv_show_remote_datasource.dart';
import 'package:marvelflix/src/features/home/data/repositories/movie_repository_impl.dart';
import 'package:marvelflix/src/features/home/data/repositories/tv_show_repository_impl.dart';
import 'package:marvelflix/src/features/home/domain/repositories/movie_repository.dart';
import 'package:marvelflix/src/features/home/domain/repositories/tv_show_repository.dart';
import 'package:marvelflix/src/features/home/domain/usecases/movies_usecases/get_all_movies_usecase.dart';
import 'package:marvelflix/src/features/home/domain/usecases/movies_usecases/get_movie_details_usecase.dart';
import 'package:marvelflix/src/features/home/domain/usecases/tv_show_usecase/get_all_tv_shows.usecase.dart';
import 'package:marvelflix/src/features/home/domain/usecases/tv_show_usecase/get_show_tv_details_usecase.dart';
import 'package:marvelflix/src/features/home/presentation/controllers/movie_controller/movie_cubit.dart';
import 'package:marvelflix/src/features/home/presentation/controllers/movie_controller/movie_details_cubit.dart';
import 'package:marvelflix/src/features/home/presentation/controllers/tv_show_controller/tv_show_cubit.dart';
import 'package:marvelflix/src/features/home/presentation/controllers/tv_show_controller/tv_show_details_cubit.dart';

final serviceLocator = GetIt.instance;

class ServicesLocator {
  void init() async {
    // Bloc
    serviceLocator.registerFactory(() => AuthCubit(
          serviceLocator(),
          serviceLocator(),
          serviceLocator(),
        ));
    serviceLocator.registerFactory(() => MovieCubit(serviceLocator()));
    serviceLocator.registerFactory(() => MovieDetailsCubit(serviceLocator()));
    serviceLocator.registerFactory(() => TvShowCubit(serviceLocator()));
    serviceLocator.registerFactory(() => TvShowDetailsCubit(serviceLocator()));

    /// Use Cases
    /// serviceLocator
    serviceLocator.registerLazySingleton(
        () => SignInWithEmailAndPasswordUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(
        () => SignUpWithEmailAndPasswordUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(
        () => SignOutUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => GetAllMoviesUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => GetMovieDetailsUseCase(serviceLocator()));

    serviceLocator
        .registerLazySingleton(() => GetAllTvShowsUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => GetTvShowDetailsuseCase(serviceLocator()));

    ///Repository
    serviceLocator.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(authRemoteDataSource: serviceLocator()));
    serviceLocator.registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImpl(movieRemoteDataSource: serviceLocator()));
    serviceLocator.registerLazySingleton<TvShowRepository>(
        () => TvShowRepositoryImpl(tvShowRemoteDataSource: serviceLocator()));

    ///Data Source
    serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl());
    serviceLocator.registerLazySingleton<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl());
    serviceLocator.registerLazySingleton<TvShowRemoteDataSource>(
        () => TvShowRemoteDataSourceImpl());
  }
}
