part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Forecast forecast;
  final Location location;
  WeatherLoaded(this.forecast, this.location);
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}

class AutoCompleteLoaded extends WeatherState {
  final List<Suggestions> suggestions;
  AutoCompleteLoaded(this.suggestions);
}
