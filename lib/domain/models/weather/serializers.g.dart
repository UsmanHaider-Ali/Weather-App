// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(Clouds.serializer)
      ..add(MainWeather.serializer)
      ..add(Rain.serializer)
      ..add(Sys.serializer)
      ..add(Weather.serializer)
      ..add(WeatherData.serializer)
      ..add(WeatherModel.serializer)
      ..add(Wind.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Weather)]),
          () => new ListBuilder<Weather>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(WeatherData)]),
          () => new ListBuilder<WeatherData>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
