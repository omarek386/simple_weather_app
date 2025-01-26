import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/forecast.dart';
import '../../models/location.dart';
import 'forecast_days.dart';
import 'sun_rise_box.dart';
import 'sun_set_box.dart';
import 'title_box_widget.dart';
import 'today_status.dart';

class ShowData extends StatelessWidget {
  const ShowData({
    super.key,
    required this.location,
    required this.forecast,
  });
  final Location location;
  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20.h,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            TitleBoxWidget(
              city: location.name,
              region: location.country,
            ),
            Image.network(
                width: 100.w,
                height: 100.h,
                fit: BoxFit.fill,
                'https:${forecast.days[0].day.condition.icon}'),
            Text(
              '${forecast.days[0].day.avgTemp}° C',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 48.sp),
            ),
            Text(
              forecast.days[0].day.condition.text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp),
            ),
            TodayStatus(forecast: forecast),
            SunRiseBox(forecast: forecast),
            SunSetBox(forecast: forecast),
            ForecastDays(forecast: forecast),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
