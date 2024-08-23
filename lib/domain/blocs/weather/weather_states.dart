import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/models/weather/weather_model.dart';
import 'package:weather_app/utils/enums.dart';

class WeatherStates extends Equatable {
  final ApiStatus status;
  final WeatherModel? weatherModel;
  final String? errorMessage;

  const WeatherStates({
    this.status = ApiStatus.initial,
    this.weatherModel,
    this.errorMessage,
  });

  WeatherStates copyWith({
    ApiStatus? status,
    WeatherModel? weatherModel,
    String? errorMessage,
  }) {
    return WeatherStates(
      status: status ?? this.status,
      weatherModel: weatherModel ?? this.weatherModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, weatherModel, errorMessage];
}
