import 'package:flutter/material.dart';
import 'package:weather_app/domain/models/weather/weather_model.dart';
import 'package:weather_app/utils/functions.dart';

class WeatherTile extends StatelessWidget {
  const WeatherTile({super.key, required this.weatherData});

  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(formatDateTimeAsDay(weatherData.dtTxt.toString()), style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.start),
        Expanded(child: Center(child: Text(weatherData.weather[0].main, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.start))),
        Text("${kelvinToCelsius(weatherData.main.temp).toStringAsFixed(0)}\u00B0C",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 40), textAlign: TextAlign.center),
      ],
    );
  }
}
