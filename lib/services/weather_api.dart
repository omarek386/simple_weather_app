import 'package:dio/dio.dart';
import 'package:weather_app/constants/api_constants.dart';
import 'package:weather_app/models/auto_complete.dart';

class WeatherApi {
  final Dio dio;
  WeatherApi({required this.dio});

  Future<Map<String, dynamic>> getWeather(String city, int days) async {
    try {
      final Response response = await dio.get(
        '$baseUrl/$forecast?key=$apiKey&q=$city&days=$days&aqi=no&alerts=no',
      );
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Suggestions>> autoCompleteSearch(String query) async {
    try {
      final Response response = await dio.get(
        '$baseUrl/$autoCompleteUrl?key=$apiKey&q=$query',
      );
      List<Suggestions> suggestions =
          AutoComplete.fromJson(response.data).suggestions;
      return suggestions;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
