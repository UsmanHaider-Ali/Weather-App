import 'package:flutter/material.dart';
import 'package:weather_app/app/routes/routes_name.dart';
import 'package:weather_app/presentation/screens/future_weather/future_weather_screen.dart';
import 'package:weather_app/presentation/screens/home/home_screen.dart';
import 'package:weather_app/presentation/screens/splash/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments as Map<String, dynamic>?;

    switch (routeSettings.name) {
      case RoutesName.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesName.mainRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RoutesName.futureWeatherRoute:
        return MaterialPageRoute(
          builder: (_) => FutureWeatherScreen(weatherModel: args?['weatherModel']),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}.'),
            ),
          ),
        );
    }
  }
}
