import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color? bgColor;
  final Color? textColor;
  final Function()? onTap;
  const AppButton({super.key, required this.title, this.bgColor, this.textColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
          color: bgColor?? AppColor.mainColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(title,
          style: AppTextStyle.hintTextStyle.copyWith(color:textColor?? Colors.white),
        ),
      ),
    );
  }
}