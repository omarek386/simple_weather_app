import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/Routes/routes.dart';
import 'package:weather_app/extensions/navigation.dart';
import 'package:weather_app/logic/weather_cubit.dart';
import 'package:weather_app/presentation/widgets/title_box_widget.dart';

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
              icon: Icon(Icons.search_sharp, color: Colors.white),
            )
          ],
        ),
        backgroundColor: Color(0xff4EA3DB),
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(city: 'London', days: 1);

              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherLoaded) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20.h,
                  children: [
                    SizedBox(
                      width: double.infinity,
                    ),
                    TitleBoxWidget(
                      city: state.location.name,
                      region: state.location.country,
                    ),
                    Image.network(
                        width: 100.w,
                        height: 100.h,
                        fit: BoxFit.fill,
                        'https:${state.forecast.days[0].day.condition.icon}'),
                    Text(
                      '${state.forecast.days[0].day.avgTemp}° C',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 48.sp),
                    ),
                    Text(
                      state.forecast.days[0].day.condition.text,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 16.sp),
                    ),
                    Container(
                      height: 70.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.24),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              state.forecast.days[0].day.willItRain.toString()),
                          Text(state.forecast.days[0].day.minTemp.toString()),
                          Text(state.forecast.days[0].day.maxTemp.toString())
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: Text('Failed to load data'),
              );
            }
          },
        ));
  }
}
