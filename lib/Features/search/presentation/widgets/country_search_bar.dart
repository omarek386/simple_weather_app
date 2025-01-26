import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/weather_cubit.dart';

class CountrySearchBar extends StatelessWidget {
  const CountrySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      trailing: [
        IconButton(
            onPressed: () {
              context.read<WeatherCubit>().searchController.clear();
              context.read<WeatherCubit>().searchAutoComplete();
            },
            icon: const Icon(Icons.clear, color: Colors.black)),
      ],
      hintText: 'Search for a country',
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.search_rounded, color: Colors.black),
      ),
      controller: context.read<WeatherCubit>().searchController,
      onChanged: (value) {
        context.read<WeatherCubit>().searchAutoComplete();
      },
      onSubmitted: (value) {
        context.read<WeatherCubit>().getWeather();
        context.read<WeatherCubit>().searchController.clear();
        Navigator.of(context).pop();
      },
    );
  }
}
