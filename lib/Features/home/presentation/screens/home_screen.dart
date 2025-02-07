import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/show_data.dart';
import '../../../../core/logic/weather_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherInitial) {
          log('Initial State');
          context.read<WeatherCubit>().getWeather();

          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherLoaded) {
          return ShowData(
            location: state.location,
            forecast: state.forecast,
          );
        } else if (state is WeatherError) {
          return Center(
            child: Text('Failed to load data ${state.message}'),
          );
        } else if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text('No data found'),
          );
        }
      },
    ));
  }
}
