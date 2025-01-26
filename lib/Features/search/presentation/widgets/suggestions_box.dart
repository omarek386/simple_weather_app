import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/logic/weather_cubit.dart';

class SuggestionsBox extends StatelessWidget {
  const SuggestionsBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.read<WeatherCubit>().searchController.text.isNotEmpty,
      child: Expanded(
        child: ListView.builder(
          itemCount: context.read<WeatherCubit>().suggestions.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(context.read<WeatherCubit>().suggestions[index].name,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp)),
              subtitle: Text(
                  textAlign: TextAlign.end,
                  context.read<WeatherCubit>().suggestions[index].country,
                  style: TextStyle(fontSize: 14.sp)),
              onTap: () {
                context.read<WeatherCubit>().setSearchController =
                    context.read<WeatherCubit>().suggestions[index].name;
                context.read<WeatherCubit>().getWeather();
                context.read<WeatherCubit>().searchController.clear();
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
    );
  }
}
