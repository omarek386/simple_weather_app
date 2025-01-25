import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/location.dart';

class WeatherModel {
  final Location location;
  final Forecast forecast;

  WeatherModel({
    required this.location,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: Location.fromJson(json['location']),
      forecast: Forecast.fromJson(json['forecast']),
    );
  }
}
