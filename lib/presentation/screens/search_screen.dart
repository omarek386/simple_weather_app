import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/weather_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Screen'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Column(
              children: [
                SearchBar(
                  controller: context.read<WeatherCubit>().searchController,
                  onChanged: (value) {
                    context.read<WeatherCubit>().searchController.text = value;
                    context.read<WeatherCubit>().searchAutoComplete();
                  },
                ),
                Visibility(
                  visible: context
                      .read<WeatherCubit>()
                      .searchController
                      .text
                      .isNotEmpty,
                  child: Expanded(
                    child: ListView.builder(
                      itemCount:
                          context.read<WeatherCubit>().suggestions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(
                                '${context.read<WeatherCubit>().suggestions[index].name}'));
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
