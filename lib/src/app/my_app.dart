import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelflix/main.dart';
import 'package:marvelflix/src/app/services_locator.dart';
import 'package:marvelflix/src/config/router/app_routes.dart';
import 'package:marvelflix/src/config/themes/light_theme.dart';
import 'package:marvelflix/src/features/auth/presentation/cubit/auth_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<AuthCubit>()..signUpUseCase,
        ),
        BlocProvider(
          create: (context) => serviceLocator<AuthCubit>()..signInUseCase,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appLightTheme(),
        onGenerateRoute: AppRoutesGenerator.generatePageRoute,
        initialRoute: initialRoute,
      ),
    );
  }
}
