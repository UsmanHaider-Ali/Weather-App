import 'package:weather_app/data/api/dio_client.dart';
import 'package:weather_app/data/api/endpoints.dart';

class WeatherRepository {
  final DioClient _dioClient;

  WeatherRepository({required DioClient dioClient}) : _dioClient = dioClient;

  Future<dynamic> getWeatherData(Map<String, dynamic> params, Map<String, dynamic> headers) async {
    return await _dioClient.getService(Endpoints.weatherUrl, params, headers);
  }
}
