import 'days.dart';

class Forecast {
  List<Days> days;

  Forecast({
    required this.days,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    List<Days> days = [];
    for (final dynamic day in json['forecastday']) {
      days.add(Days.fromJson(day));
    }
    return Forecast(days: days);
  }
}
