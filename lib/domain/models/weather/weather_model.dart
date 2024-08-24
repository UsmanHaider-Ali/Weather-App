import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    @Default("") String cod,
    @Default(0) int message,
    @Default(0) int cnt,
    @Default([]) List<WeatherData> list,
    @Default(City()) City city,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
}

@freezed
class WeatherData with _$WeatherData {
  const factory WeatherData({
    @Default(0) int dt,
    @Default(Main()) Main main,
    @Default([]) List<Weather> weather,
    @Default(Clouds()) Clouds clouds,
    @Default(Wind()) Wind wind,
    @Default(0) int visibility,
    @Default(0) int pop,
    @Default(Rain()) Rain rain,
    @Default(Sys()) Sys sys,
    @JsonKey(name: "dt_txt") DateTime? dtTxt,
  }) = _WeatherData;

  factory WeatherData.fromJson(Map<String, dynamic> json) => _$WeatherDataFromJson(json);
}

@freezed
class Main with _$Main {
  const factory Main({
    @Default(0.0) double temp,
    @JsonKey(name: "feels_like") @Default(0.0) double feelsLike,
    @JsonKey(name: "temp_min") @Default(0.0) double tempMin,
    @JsonKey(name: "temp_max") @Default(0.0) double tempMax,
    @Default(0) int pressure,
    @JsonKey(name: "sea_level") @Default(0) int seaLevel,
    @JsonKey(name: "grnd_level") @Default(0) int grndLevel,
    @Default(0) int humidity,
    @JsonKey(name: "temp_kf") @Default(0.0) double tempKf,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
class Weather with _$Weather {
  const factory Weather({
    @Default(0) int id,
    @Default("") String main,
    @Default("") String description,
    @Default("") String icon,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}

@freezed
class Clouds with _$Clouds {
  const factory Clouds({
    @Default(0) int all,
  }) = _Clouds;

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@freezed
class Wind with _$Wind {
  const factory Wind({
    @Default(0.0) double speed,
    @Default(0) int deg,
    @Default(0.0) double gust,
  }) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}

@freezed
class Rain with _$Rain {
  const factory Rain({
    @JsonKey(name: "3h") @Default(0.0) double threeH,
  }) = _Rain;

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);
}

@freezed
class Sys with _$Sys {
  const factory Sys({
    @Default("") String pod,
  }) = _Sys;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

@freezed
class City with _$City {
  const factory City({
    @Default(0) int id,
    @Default("") String name,
    @Default(Coord()) Coord coord,
    @Default("") String country,
    @Default(0) int population,
    @Default(0) int timezone,
    @Default(0) int sunrise,
    @Default(0) int sunset,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@freezed
class Coord with _$Coord {
  const factory Coord({
    @Default(0.0) double lat,
    @Default(0.0) double lon,
  }) = _Coord;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}
