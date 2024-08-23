import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_background.dart';
import 'package:weather_app/widgets/weather_tile.dart';

class FutureWeatherScreen extends StatelessWidget {
  const FutureWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Future Weather"),
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
            itemCount: 5,
            itemBuilder: (context, index) => const WeatherTile(),
            separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white, thickness: 0.10),
          ),
        ),
      ),
    );
  }
}
