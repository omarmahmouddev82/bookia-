import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColor.outlineGray, thickness: 2)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            'Or',
            style: AppTextStyle.dmRegular14.copyWith(
              color: AppColor.darkGrayColor,
            ),
          ),
        ),
        Expanded(child: Divider(color: AppColor.outlineGray, thickness: 2)),
      ],
    );
  }
}