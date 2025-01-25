import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Routes/routes.dart';
import 'package:weather_app/logic/weather_cubit.dart';
import 'package:weather_app/presentation/screens/home_screen.dart';
import 'package:weather_app/presentation/screens/search_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    WeatherCubit weatherCubit = WeatherCubit();
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => weatherCubit,
                  child: HomeScreen(),
                ));
      case Routes.searchScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => weatherCubit,
                  child: SearchScreen(),
                ));
      // case '/register':
      //   return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
