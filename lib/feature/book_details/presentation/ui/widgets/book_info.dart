import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInfo extends StatelessWidget {
  final String name;
  final String category;

  const ProductInfo({super.key, required this.name, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.dmRegular30.copyWith(color: AppColor.black),
          ),
        ),

        10.verticalSpace,

        Center(
          child: Text(
            category,
            style: AppTextStyle.dmRegular16.copyWith(color: AppColor.mainColor),
          ),
        ),
      ],
    );
  }
}