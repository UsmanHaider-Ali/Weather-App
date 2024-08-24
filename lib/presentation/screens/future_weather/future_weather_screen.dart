import 'package:flutter/material.dart';
import 'package:weather_app/domain/models/weather/weather_model.dart';
import 'package:weather_app/utils/functions.dart';
import 'package:weather_app/widgets/custom_background.dart';
import 'package:weather_app/widgets/weather_tile.dart';

class FutureWeatherScreen extends StatelessWidget {
  final WeatherModel weatherModel;

  const FutureWeatherScreen({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    List<WeatherData> uniqueWeatherModelForNextDays = getUniqueWeatherDataByDay(weatherModel.list);

    debugPrint(uniqueWeatherModelForNextDays.toString());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(weatherModel.city.name),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: CustomBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: ListView.separated(
            itemCount: uniqueWeatherModelForNextDays.length,
            itemBuilder: (context, index) => WeatherTile(weatherData: uniqueWeatherModelForNextDays[index]),
            separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white, thickness: 0.10, height: 40),
          ),
        ),
      ),
    );
  }
}
