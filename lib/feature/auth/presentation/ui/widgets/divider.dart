import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // بيجبر الـ Container ياخد عرض الشاشة بالكامل
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // الخط اللي على الشمال
          Expanded(
            child: Divider(
              color: AppColor.outlineGray,
              thickness: 1.5,
              endIndent: 16.w, // مسافة بين الخط وكلمة Or
            ),
          ),
          
          // كلمة Or في النص
          Text(
            'Or',
            style: AppTextStyle.dmRegular14.copyWith(
              color: AppColor.darkGrayColor,
            ),
          ),
          
          // الخط اللي على اليمين
          Expanded(
            child: Divider(
              color: AppColor.outlineGray,
              thickness: 1.5,
              indent: 16.w, // مسافة بين كلمة Or والخط اليمين
            ),
          ),
        ],
      ),
    );
  }
}