import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/forecast.dart';
import 'my_container.dart';

class TodayStatus extends StatelessWidget {
  const TodayStatus({
    super.key,
    required this.forecast,
  });

  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      height: 70,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Type=cloud-rain-light.png',
            color: Colors.black,
          ),
          Text('${forecast.days[0].day.willItRain.toString()}%',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp)),
          Image.asset(
            'assets/Type=thermometer-simple-light.png',
            color: Colors.black,
          ),
          Text('${forecast.days[0].day.minTemp.toString()}° C',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp)),
          Image.asset(
            'assets/Type=sun-dim-light.png',
            color: Colors.black,
          ),
          Text('${forecast.days[0].day.maxTemp.toString()}° C',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp))
        ],
      ),
    );
  }
}
