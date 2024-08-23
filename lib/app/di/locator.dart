import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/data/api/dio_client.dart';
import 'package:weather_app/data/api/endpoints.dart';
import 'package:weather_app/data/repositories/weather/weather_repository.dart';
import 'package:weather_app/domain/blocs/weather/weather_bloc.dart';

final locator = GetIt.instance;
void setupLocator() {
   locator.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: Endpoints.baseUrl)));
  locator.registerLazySingleton<DioClient>(() => DioClient(dio: locator()));

  locator.registerLazySingleton<WeatherRepository>(() => WeatherRepository(dioClient: locator()));

  locator.registerFactory<WeatherBloc>(() =>WeatherBloc(weatherRepository: locator()));
}
