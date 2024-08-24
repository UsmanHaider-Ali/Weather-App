import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/domain/models/weather/weather_model.dart';
import 'package:connectivity/connectivity.dart';

String convertTimestampTo12HourFormat(int timestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch((timestamp * 1000));
  String formattedTime = DateFormat('h:mm a').format(dateTime);
  return formattedTime;
}

String formatDateTime(String inputDateTime) {
  DateFormat inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  DateFormat outputFormat = DateFormat('EEEE d - hh:mm a');

  DateTime dateTime = inputFormat.parse(inputDateTime);
  return outputFormat.format(dateTime);
}

String formatDateTimeAsDay(String inputDateTime) {
  DateFormat inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  DateFormat outputFormat = DateFormat('EEEE');

  DateTime dateTime = inputFormat.parse(inputDateTime);
  return outputFormat.format(dateTime);
}

WeatherData findClosestData(List<WeatherData> elements) {
  DateTime now = DateTime.now();

  WeatherData? closestElement;
  Duration smallestDifference = const Duration(days: 99999);

  for (var element in elements) {
    Duration difference = element.dtTxt.difference(now).abs();

    if (difference < smallestDifference) {
      smallestDifference = difference;
      closestElement = element;
    }
  }

  return closestElement!;
}

double kelvinToCelsius(double kelvin) {
  return kelvin - 273.15;
}

List<WeatherData> getUniqueWeatherDataByDay(List<WeatherData> weatherDataList) {
  Map<String, WeatherData> weatherDataByDate = {};

  for (var data in weatherDataList) {
    String dateKey = "${data.dtTxt.year}-${data.dtTxt.month.toString().padLeft(2, '0')}-${data.dtTxt.day.toString().padLeft(2, '0')}";

    weatherDataByDate[dateKey] = data;
  }

  return weatherDataByDate.values.toList();
}

Future<bool> isConnectedToInternet() async {
  var connectivityResult = await Connectivity().checkConnectivity();

  debugPrint('Connectivity: $connectivityResult');

  return connectivityResult != ConnectivityResult.none;
}
