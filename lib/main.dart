import 'package:flutter/material.dart';
import 'package:weather_app/app/di/locator.dart';
import 'package:weather_app/app/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(const MyApp());
}
