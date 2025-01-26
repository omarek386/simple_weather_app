import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyContainer extends StatelessWidget {
  const MyContainer(
      {super.key,
      required this.child,
      required this.height,
      required this.width});
  final Widget child;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.24),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: child,
    );
  }
}
