import 'package:flutter/material.dart';
import 'package:weather_app/app/config/app_config.dart';
import 'package:weather_app/app/config/theme.dart';
import 'package:weather_app/app/routes/app_routes.dart';
import 'package:weather_app/app/routes/routes_name.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      theme: AppTheme.lightTheme,
      initialRoute: RoutesName.splashRoute,
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
