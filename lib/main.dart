import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marvelflix/firebase_options.dart';
import 'package:marvelflix/src/app/my_app.dart';
import 'package:marvelflix/src/app/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
