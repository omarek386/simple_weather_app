import 'package:weather_app/models/days.dart';

class Forecast {
  final List<Days> days;

  Forecast({
    required this.days,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    final List<Days> days = [];
    for (final day in json['forecastday']) {
      days.add(Days.fromJson(day));
    }
    return Forecast(days: days);
  }
}
