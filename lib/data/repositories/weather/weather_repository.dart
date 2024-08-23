import 'package:weather_app/data/api/dio_client.dart';

class WeatherRepository {
  final DioClient _dioClient;

  WeatherRepository({required DioClient dioClient}) : _dioClient = dioClient;

  Future<dynamic> getWeatherData(double lat, double lon, String apiKey, Map<String, dynamic> headers) async {
    final url = 'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey';
    // const url = 'https://api.openweathermap.org/data/2.5/forecast?lat=33.6995&lon=73.0363&appid=37ea9939152496e5de6ca532f93817fd';
    return await _dioClient.getService(url, headers);
  }
}
