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

  factory WeatherStates.fromJson(Map<String, dynamic> json) {
    try {
      final weatherModel = json['weatherModel'] != null ? WeatherModel.fromJson(json['weatherModel']) : null;
      final status = ApiStatus.values[json['status'] as int];
      return WeatherStates(
        status: status,
        weatherModel: weatherModel,
        errorMessage: json['errorMessage'] as String?,
      );
    } catch (e) {
      return const WeatherStates();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status.index,
      'weatherModel': weatherModel?.toJson(),
      'errorMessage': errorMessage,
    };
  }

  @override
  List<Object?> get props => [status, weatherModel, errorMessage];
}
