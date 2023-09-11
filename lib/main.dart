import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marvelflix/firebase_options.dart';
import 'package:marvelflix/src/app/my_app.dart';
import 'package:marvelflix/src/app/services_locator.dart';
import 'package:marvelflix/src/config/router/app_routes.dart';

late String initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((user) => user == null
      ? initialRoute = AppRoutesName.registerRoute
      : initialRoute = AppRoutesName.homeRoute);
  runApp(const MyApp());
}
