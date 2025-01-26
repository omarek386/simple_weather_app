import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../Features/home/models/forecast.dart';
import '../../Features/home/models/location.dart';
import '../../Features/home/models/weather_model.dart';
import '../../Features/search/models/suggestions.dart';

import '../services/weather_api.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  SearchController searchController = SearchController();
  List<Suggestions> suggestions = [];
  set setSearchController(String value) => searchController.text = value;

  Future<void> getWeather({int days = 14}) async {
    emit(WeatherLoading());

    try {
      Map<String, dynamic> response = await WeatherApi(dio: Dio()).getWeather(
          searchController.text.isEmpty ? 'london' : searchController.text,
          days);

      WeatherModel weatherModel = WeatherModel.fromJson(response);
      Location location = weatherModel.location;
      Forecast forecast = weatherModel.forecast;
      log('Forecast: ${forecast.days} Location: ${location.name}');

      emit(WeatherLoaded(forecast, location));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }

  Future<void> searchAutoComplete() async {
    try {
      suggestions = await WeatherApi(dio: Dio()).autoCompleteSearch(
          searchController.text.isEmpty ? 'New York' : searchController.text);

      emit(AutoCompleteLoaded(suggestions));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
