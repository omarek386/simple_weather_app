import 'condition.dart';

class Day {
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  double maxWind;
  num willItRain;
  Condition condition;

  Day({
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
    required this.maxWind,
    required this.willItRain,
    required this.condition,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxTemp: json['maxtemp_c'],
      minTemp: json['mintemp_c'],
      avgTemp: json['avgtemp_c'],
      maxWind: json['maxwind_kph'],
      willItRain: json['daily_chance_of_rain'],
      condition: Condition.fromJson(json['condition']),
    );
  }
}
