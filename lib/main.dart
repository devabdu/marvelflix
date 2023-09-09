import 'package:flutter/material.dart';
import 'package:marvelflix/src/app/my_app.dart';
import 'package:marvelflix/src/app/services_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  runApp(const MyApp());
}
