import 'package:dio/dio.dart';
import 'package:weather_app/constants/api_constants.dart';

class WeatherApi {
  final Dio dio;
  WeatherApi({required this.dio});

  Future<Map<String, dynamic>> getWeather(String city, int days) async {
    try {
      final response = await dio.get(
        '$baseUrl/$typeUrl?key=$apiKey&q=$city&days=$days&aqi=no&alerts=no',
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
