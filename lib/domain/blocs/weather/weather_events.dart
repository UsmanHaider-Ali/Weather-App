import 'package:equatable/equatable.dart';

abstract class WeatherEvents extends Equatable {
  const WeatherEvents();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvents {
  final double latitude;
  final double longitude;

  const FetchWeather(this.latitude, this.longitude);

  @override
  List<Object> get props => [latitude, longitude];
}

class RefreshWeather extends WeatherEvents {
  final double latitude;
  final double longitude;

  const RefreshWeather(this.latitude, this.longitude);

  @override
  List<Object> get props => [latitude, longitude];
}
