import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/show_data.dart';
import '../../../../core/Routes/routes.dart';
import '../../../../core/extensions/navigation.dart';
import '../../../../core/logic/weather_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Weather App',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp),
          ),
          actions: [
            IconButton(
              onPressed: () => context.navigateTo(Routes.searchScreen),
              icon: const Icon(Icons.search_sharp, color: Colors.white),
            )
          ],
        ),
        backgroundColor: const Color(0xff4EA3DB),
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              log('Initial State');
              context.read<WeatherCubit>().getWeather();

              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherLoaded) {
              log('Weather Loaded');
              log('Location: ${state.location.name}');
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
