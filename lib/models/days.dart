import 'package:weather_app/models/astro.dart';
import 'package:weather_app/models/day.dart';

class Days {
  final String date;
  final Day day;
  final Astro astro;

  Days({
    required this.date,
    required this.day,
    required this.astro,
  });

  factory Days.fromJson(Map<String, dynamic> json) {
    return Days(
      date: json['date'],
      day: Day.fromJson(json['day']),
      astro: Astro.fromJson(json['astro']),
    );
  }
}
