import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/forecast.dart';
import 'my_container.dart';

class ForecastDays extends StatelessWidget {
  const ForecastDays({
    super.key,
    required this.forecast,
  });

  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      width: double.infinity,
      child: ListView.builder(
          itemCount: forecast.days.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: MyContainer(
                height: 0,
                width: 100,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        forecast.days[index].date,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 10.sp),
                      ),
                      Image.network(
                          'https:${forecast.days[index].day.condition.icon}'),
                      SizedBox(height: 10.h),
                      Text(
                        'Avg: ${forecast.days[index].day.avgTemp}° C',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 10.sp),
                      ),
                      Text(
                        'Max: ${forecast.days[index].day.maxTemp}° C',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 10.sp),
                      ),
                      Text(
                        'Min: ${forecast.days[index].day.minTemp}° C',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 10.sp),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
