import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/data/api/api_services.dart';
import 'package:weather_app/domain/exceptions/exceptions.dart';

class DioClient extends ApiServices {
  final Dio dio;

  DioClient({required this.dio});

  @override
  Future getService(String url, headers) async {
    dynamic jsonResponse;

    try {
      final response = await dio.get(url, options: Options(headers: headers));

      jsonResponse = handleResponse(response);
    } on DioException catch (e) {
      debugPrint("DioException => $e");
    } on Exception catch (e) {
      debugPrint("Exception => $e");
    }

    return jsonResponse;
  }
}

dynamic handleResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return response.data;
    case 400:
      throw BadRequestException(response.data.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.data.toString());
    default:
      throw FetchDataException("Error occurred while communicating with server with status code: ${response.statusCode}");
  }
}
