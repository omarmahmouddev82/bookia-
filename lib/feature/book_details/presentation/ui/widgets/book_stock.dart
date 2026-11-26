import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ProductStock extends StatelessWidget {
  final int stock;

  const ProductStock({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Available Stock: $stock',
      style: AppTextStyle.dmRegular16.copyWith(color: AppColor.mainColor),
    );
  }
}