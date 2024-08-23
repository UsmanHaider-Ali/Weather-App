library weather_model;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'dart:convert';
import 'serializers.dart'; // Import the serializers file

part 'weather_model.g.dart';
abstract class WeatherModel implements Built<WeatherModel, WeatherModelBuilder> {
  @BuiltValueField(wireName: 'cod')
  String get cod;
  
  @BuiltValueField(wireName: 'message')
  int get message;
  
  @BuiltValueField(wireName: 'cnt')
  int get cnt;
  
  @BuiltValueField(wireName: 'list')
  BuiltList<WeatherData> get list;

  WeatherModel._();
  factory WeatherModel([void Function(WeatherModelBuilder) updates]) = _$WeatherModel;

  static WeatherModel fromJson(Map<String, dynamic> jsonData) {
    return serializers.deserializeWith(WeatherModel.serializer, jsonData) ?? WeatherModel();
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(WeatherModel.serializer, this) as Map<String, dynamic>;
  }

  static Serializer<WeatherModel> get serializer => _$weatherModelSerializer;
}

abstract class WeatherData implements Built<WeatherData, WeatherDataBuilder> {
  @BuiltValueField(wireName: 'dt')
  int get dt;

  @BuiltValueField(wireName: 'main')
  MainWeather get main;

  @BuiltValueField(wireName: 'weather')
  BuiltList<Weather> get weather;

  @BuiltValueField(wireName: 'clouds')
  Clouds get clouds;

  @BuiltValueField(wireName: 'wind')
  Wind get wind;

  @BuiltValueField(wireName: 'visibility')
  int get visibility;

  @BuiltValueField(wireName: 'pop')
  double get pop;

  @BuiltValueField(wireName: 'rain')
  Rain? get rain;

  @BuiltValueField(wireName: 'sys')
  Sys get sys;

  @BuiltValueField(wireName: 'dt_txt')
  String get dtTxt;

  WeatherData._();
  factory WeatherData([void Function(WeatherDataBuilder) updates]) = _$WeatherData;

  static WeatherData fromJson(String jsonString) {
    final jsonData = json.decode(jsonString);
    return serializers.deserializeWith(WeatherData.serializer, jsonData) ?? WeatherData();
  }

  String toJson() {
    return json.encode(serializers.serializeWith(WeatherData.serializer, this));
  }

  static Serializer<WeatherData> get serializer => _$weatherDataSerializer;
}

abstract class MainWeather implements Built<MainWeather, MainWeatherBuilder> {
  @BuiltValueField(wireName: 'temp')
  double get temp;

  @BuiltValueField(wireName: 'feels_like')
  double get feelsLike;

  @BuiltValueField(wireName: 'temp_min')
  double get tempMin;

  @BuiltValueField(wireName: 'temp_max')
  double get tempMax;

  @BuiltValueField(wireName: 'pressure')
  int get pressure;

  @BuiltValueField(wireName: 'sea_level')
  int get seaLevel;

  @BuiltValueField(wireName: 'grnd_level')
  int get grndLevel;

  @BuiltValueField(wireName: 'humidity')
  int get humidity;

  @BuiltValueField(wireName: 'temp_kf')
  double get tempKf;

  MainWeather._();
  factory MainWeather([void Function(MainWeatherBuilder) updates]) = _$MainWeather;

  static MainWeather fromJson(String jsonString) {
    final jsonData = json.decode(jsonString);
    return serializers.deserializeWith(MainWeather.serializer, jsonData) ?? MainWeather();
  }

  String toJson() {
    return json.encode(serializers.serializeWith(MainWeather.serializer, this));
  }

  static Serializer<MainWeather> get serializer => _$mainWeatherSerializer;
}

abstract class Weather implements Built<Weather, WeatherBuilder> {
  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'main')
  String get main;

  @BuiltValueField(wireName: 'description')
  String get description;

  @BuiltValueField(wireName: 'icon')
  String get icon;

  Weather._();
  factory Weather([void Function(WeatherBuilder) updates]) = _$Weather;

  static Weather fromJson(String jsonString) {
    final jsonData = json.decode(jsonString);
    return serializers.deserializeWith(Weather.serializer, jsonData) ?? Weather();
  }

  String toJson() {
    return json.encode(serializers.serializeWith(Weather.serializer, this));
  }

  static Serializer<Weather> get serializer => _$weatherSerializer;
}

abstract class Clouds implements Built<Clouds, CloudsBuilder> {
  @BuiltValueField(wireName: 'all')
  int get all;

  Clouds._();
  factory Clouds([void Function(CloudsBuilder) updates]) = _$Clouds;

  static Clouds fromJson(String jsonString) {
    final jsonData = json.decode(jsonString);
    return serializers.deserializeWith(Clouds.serializer, jsonData) ?? Clouds();
  }

  String toJson() {
    return json.encode(serializers.serializeWith(Clouds.serializer, this));
  }

  static Serializer<Clouds> get serializer => _$cloudsSerializer;
}

abstract class Wind implements Built<Wind, WindBuilder> {
  @BuiltValueField(wireName: 'speed')
  double get speed;

  @BuiltValueField(wireName: 'deg')
  int get deg;

  @BuiltValueField(wireName: 'gust')
  double get gust;

  Wind._();
  factory Wind([void Function(WindBuilder) updates]) = _$Wind;

  static Wind fromJson(String jsonString) {
    final jsonData = json.decode(jsonString);
    return serializers.deserializeWith(Wind.serializer, jsonData) ?? Wind();
  }

  String toJson() {
    return json.encode(serializers.serializeWith(Wind.serializer, this));
  }

  static Serializer<Wind> get serializer => _$windSerializer;
}

abstract class Rain implements Built<Rain, RainBuilder> {
  @BuiltValueField(wireName: '3h')
  double? get threeHours;

  Rain._();
  factory Rain([void Function(RainBuilder) updates]) = _$Rain;

  static Rain fromJson(String jsonString) {
    final jsonData = json.decode(jsonString);
    return serializers.deserializeWith(Rain.serializer, jsonData) ?? Rain();
  }

  String toJson() {
    return json.encode(serializers.serializeWith(Rain.serializer, this));
  }

  static Serializer<Rain> get serializer => _$rainSerializer;
}

abstract class Sys implements Built<Sys, SysBuilder> {
  @BuiltValueField(wireName: 'pod')
  String get pod;

  Sys._();
  factory Sys([void Function(SysBuilder) updates]) = _$Sys;

  static Sys fromJson(String jsonString) {
    final jsonData = json.decode(jsonString);
    return serializers.deserializeWith(Sys.serializer, jsonData) ?? Sys();
  }

  String toJson() {
    return json.encode(serializers.serializeWith(Sys.serializer, this));
  }

  static Serializer<Sys> get serializer => _$sysSerializer;
}
