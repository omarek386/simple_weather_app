import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/Routes/routes.dart';
import 'package:weather_app/core/extensions/navigation.dart';

class TitleWithSearch extends StatelessWidget {
  const TitleWithSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Weather App',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp),
        ),
        IconButton(
          onPressed: () => context.navigateTo(Routes.searchScreen),
          icon: const Icon(Icons.search_sharp, color: Colors.white),
        ),
      ],
    );
  }
}
