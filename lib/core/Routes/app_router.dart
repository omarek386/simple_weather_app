import 'package:flutter/material.dart';
import 'routes.dart';
import '../../Features/home/presentation/screens/home_screen.dart';
import '../../Features/search/presentation/screens/search_screen.dart';

class AppRouter {
  // WeatherCubit weatherCubit = WeatherCubit();
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      // case '/register':
      //   return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
