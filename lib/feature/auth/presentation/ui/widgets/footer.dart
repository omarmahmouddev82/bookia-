import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthFooter extends StatelessWidget {
  final String message;
  final String actionText;
  final VoidCallback onTap;

  const AuthFooter({
    super.key,
    required this.message,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Text(
            message,
            style: AppTextStyle.dmRegular14.copyWith(color: AppColor.black),
            textDirection: TextDirection.ltr,
          ),
        ),
        Text(
          actionText,
          style: AppTextStyle.dmRegular14.copyWith(color: AppColor.mainColor),
        ),
        SizedBox(width: 6.w),
      ],
    );
  }
}
