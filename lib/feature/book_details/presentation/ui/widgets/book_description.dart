import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDescription extends StatelessWidget {
  final String description;

  const ProductDescription({super.key, required this.description});

  String _removeHtmlTags(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>'), '').trim();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: AppTextStyle.dmRegular20.copyWith(color: AppColor.black),
        ),

        10.verticalSpace,

        Text(
          _removeHtmlTags(description),
          style: AppTextStyle.dmRegular16.copyWith(
            color: AppColor.gray80,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}