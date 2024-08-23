import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/di/locator.dart';
import 'package:weather_app/app/routes/routes_name.dart';
import 'package:weather_app/domain/blocs/weather/weather_bloc.dart';
import 'package:weather_app/domain/blocs/weather/weather_events.dart';
import 'package:weather_app/domain/blocs/weather/weather_states.dart';
import 'package:weather_app/utils/enums.dart';
import 'package:weather_app/widgets/custom_background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherBloc weatherBloc = locator<WeatherBloc>();

  @override
  void initState() {
    super.initState();
    weatherBloc.add(const FetchWeather(33.6995, 73.0363, "37ea9939152496e5de6ca532f93817fd"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocProvider(
            create: (_) => weatherBloc,
            child: BlocBuilder<WeatherBloc, WeatherStates>(
              builder: (context, state) {
                if (state.status == ApiStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.status == ApiStatus.error) {
                  return Center(child: Text(state.errorMessage!, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center));
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("21\u00B0C", style: Theme.of(context).textTheme.headlineLarge, textAlign: TextAlign.center),
                    Text("Cloudy", style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20), textAlign: TextAlign.center),
                    Text("Saturday 25 - 09:00am", style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
                    Text("Islamabad, Pakistan", style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        getTitleDescription(context, "Sumraise", "06:00am"),
                        getTitleDescription(context, "Sunset", "06:00pm"),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        getTitleDescription(context, "Wind", "10km/h"),
                        getTitleDescription(context, "Rain", "10%"),
                        getTitleDescription(context, "Humaidity", "50%"),
                      ],
                    ),
                    const SizedBox(height: 48),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.futureWeatherRoute);
                      },
                      child: Text("Next Days", style: Theme.of(context).textTheme.headlineMedium),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Column getTitleDescription(BuildContext context, String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.start),
        Text(description, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.start),
      ],
    );
  }
}
