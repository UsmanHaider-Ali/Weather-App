import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/repositories/weather/weather_repository.dart';
import 'package:weather_app/domain/blocs/weather/weather_events.dart';
import 'package:weather_app/domain/blocs/weather/weather_states.dart';
import 'package:weather_app/domain/models/weather/weather_model.dart';
import 'package:weather_app/utils/enums.dart';

class WeatherBloc extends Bloc<WeatherEvents, WeatherStates> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(const WeatherStates()) {
    on<FetchWeather>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(
    FetchWeather event,
    Emitter<WeatherStates> emit,
  ) async {
    emit(state.copyWith(status: ApiStatus.loading));

    try {
      final weatherData = await weatherRepository.getWeatherData(event.latitude, event.longitude, event.apiKey, {});

      emit(state.copyWith(status: ApiStatus.success, weatherModel: WeatherModel.fromJson(weatherData)));
    } catch (error) {
      debugPrint('Error: $error');
      String errorMessage = error.toString();

      emit(state.copyWith(status: ApiStatus.error, errorMessage: errorMessage));
    }
  }
}
