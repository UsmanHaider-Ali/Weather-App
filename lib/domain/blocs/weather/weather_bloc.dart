import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_app/data/repositories/weather/weather_repository.dart';
import 'package:weather_app/domain/blocs/weather/weather_events.dart';
import 'package:weather_app/domain/blocs/weather/weather_states.dart';
import 'package:weather_app/domain/models/weather/weather_model.dart';
import 'package:weather_app/utils/enums.dart';
import 'package:weather_app/utils/functions.dart';

class WeatherBloc extends HydratedBloc<WeatherEvents, WeatherStates> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(const WeatherStates()) {
    on<FetchWeather>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(FetchWeather event, Emitter<WeatherStates> emit) async {
    if (state.weatherModel == null) {
      emit(state.copyWith(status: ApiStatus.loading));
    }

    final isConnected = await isConnectedToInternet();
    if (!isConnected) {
      if (state.weatherModel != null) {
        emit(state.copyWith(status: ApiStatus.success, errorMessage: "No internet connection. Showing cached data."));
      } else {
        emit(state.copyWith(status: ApiStatus.error, errorMessage: "No internet connection and no cached data available."));
      }
      return;
    }

    try {
      final weatherData = await weatherRepository.getWeatherData({'lat': event.latitude, 'lon': event.latitude}, {});

      debugPrint('Weather Data: $weatherData');

      emit(state.copyWith(status: ApiStatus.success, weatherModel: WeatherModel.fromJson(weatherData)));
    } catch (error) {
      debugPrint('Error: $error');
      String errorMessage = error.toString();
      emit(state.copyWith(status: ApiStatus.error, errorMessage: errorMessage));
    }
  }

  @override
  WeatherStates? fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return null;
    try {
      return WeatherStates.fromJson(json);
    } catch (e) {
      debugPrint('Failed to parse WeatherStates from JSON: $e');
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(WeatherStates state) {
    if (state.weatherModel == null) return null;
    try {
      return state.toJson();
    } catch (e) {
      debugPrint('Failed to convert WeatherStates to JSON: $e');
      return null;
    }
  }
}
