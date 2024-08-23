import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget {
  const WeatherTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Saturday", style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center),
        Text("Cloudy", style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
        Text("21\u00B0C", style: Theme.of(context).textTheme.headlineLarge!.copyWith(), textAlign: TextAlign.center),
      ],
    );
  }
}
