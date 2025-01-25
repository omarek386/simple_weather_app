import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/weather_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return Center(
            child: TextButton(
                onPressed: () {
                  context.read<WeatherCubit>().getWeather('London', 7);
                },
                child: const Text('Get Weather')),
          );
        },
      ),
    );
  }
}
