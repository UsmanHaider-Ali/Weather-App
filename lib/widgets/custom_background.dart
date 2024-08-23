import 'package:flutter/material.dart';
import 'package:weather_app/resources/colors_manager.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;

  const CustomBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorsManager.backgroundColorOne,
            ColorsManager.backgroundColorTwo,
            ColorsManager.backgroundColorThree,
            ColorsManager.backgroundColorFour,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
