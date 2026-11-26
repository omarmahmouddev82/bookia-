import 'package:bookia/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle dmRegular30= TextStyle(
    fontSize: 30,
    color: AppColor.darkColor,
  );
  static TextStyle hintTextStyle = TextStyle(
    fontSize: 16,
    color: AppColor.grayColor,
  );
  static TextStyle dmRegular18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static TextStyle dmRegular14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColor.darkGrayColor,
  );
  static TextStyle dmRegular16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle dmRegular24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle dmRegular20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  );
}