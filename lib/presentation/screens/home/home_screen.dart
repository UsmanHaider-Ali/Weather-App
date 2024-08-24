import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/app/di/locator.dart';
import 'package:weather_app/app/routes/routes_name.dart';
import 'package:weather_app/domain/blocs/weather/weather_bloc.dart';
import 'package:weather_app/domain/blocs/weather/weather_events.dart';
import 'package:weather_app/domain/blocs/weather/weather_states.dart';
import 'package:weather_app/domain/models/weather/weather_model.dart';
import 'package:weather_app/utils/enums.dart';
import 'package:weather_app/utils/functions.dart';
import 'package:weather_app/widgets/custom_background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final WeatherBloc weatherBloc;

  Position? currentPosition;
  String locationMessage = "";

  @override
  void initState() {
    super.initState();
    weatherBloc = locator<WeatherBloc>();

    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => locationMessage = "Location services are disabled.");
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        setState(() => locationMessage = "Location permissions are denied.");
        return;
      }
    }

    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {
        currentPosition = position;
        locationMessage = "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
        weatherBloc.add(FetchWeather(currentPosition!.latitude, currentPosition!.longitude));
      });
    } catch (e) {
      setState(() => locationMessage = "Failed to get location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocProvider.value(
            value: weatherBloc,
            child: BlocBuilder<WeatherBloc, WeatherStates>(
              builder: (context, state) {
                if (state.status == ApiStatus.loading || state.status == ApiStatus.initial) {
                  return const Center(child: CircularProgressIndicator(color: Colors.white));
                }

                if (state.status == ApiStatus.error) {
                  return Center(
                      child: Text(state.errorMessage ?? "An error occurred.",
                          style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center));
                }

                if (state.weatherModel == null) {
                  return Center(
                      child:
                          Text("Something went wrong, please try again.", style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center));
                }

                WeatherData closestUpdate = findClosestData(state.weatherModel!.list);

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${kelvinToCelsius(closestUpdate.main.temp).toStringAsFixed(2)}\u00B0C",
                        style: Theme.of(context).textTheme.headlineLarge, textAlign: TextAlign.center),
                    Text(closestUpdate.weather[0].main,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20), textAlign: TextAlign.center),
                    Text(formatDateTime(closestUpdate.dtTxt.toString()), style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
                    Text("${state.weatherModel!.city.name} ${state.weatherModel!.city.country}",
                        style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        getTitleDescription(context, "Sunrise", convertTimestampTo12HourFormat(state.weatherModel!.city.sunrise)),
                        getTitleDescription(context, "Sunset", convertTimestampTo12HourFormat(state.weatherModel!.city.sunset)),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        getTitleDescription(context, "Wind", "${closestUpdate.wind.speed}m/s"),
                        getTitleDescription(context, "Rain", "${closestUpdate.rain.threeH}mm"),
                        getTitleDescription(context, "Humidity", "${closestUpdate.main.humidity}%"),
                      ],
                    ),
                    const SizedBox(height: 48),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.futureWeatherRoute, arguments: {'weatherModel': state.weatherModel});
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
