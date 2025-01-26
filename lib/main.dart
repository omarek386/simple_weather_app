import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/Routes/app_router.dart';
import 'core/Routes/routes.dart';
import 'core/logic/weather_cubit.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => BlocProvider(
        create: (context) => WeatherCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          onGenerateRoute: appRouter.onGenerateRoute,
          initialRoute: Routes.homeScreen,
        ),
      ),
    );
  }
}
