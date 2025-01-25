import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/models/weather_model.dart';

import '../services/weather_api.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  Future<void> getWeather(String city, int days) async {
    emit(WeatherLoading());
    try {
      final Map<String, dynamic> response =
          await WeatherApi(dio: Dio()).getWeather(city, days);

      final WeatherModel weatherModel = WeatherModel.fromJson(response);
      final Location location = weatherModel.location;
      final Forecast forecast = weatherModel.forecast;
      log('Location: ${location.name}, ${location.region}, ${location.country} , Forecast: ${forecast.days.length} days');
      emit(WeatherLoaded(forecast, location));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
