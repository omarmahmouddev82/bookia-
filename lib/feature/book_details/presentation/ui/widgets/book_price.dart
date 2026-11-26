import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductPrice extends StatelessWidget {
  final double price;
  final double? discountPrice;

  const ProductPrice({super.key, required this.price, this.discountPrice});

  @override
  Widget build(BuildContext context) {
    final hasDiscount = discountPrice != null && discountPrice! < price;

    return Row(
      children: [
        Text(
          'EGP ${(hasDiscount ? discountPrice! : price).toStringAsFixed(2)}',
          style: AppTextStyle.dmRegular24.copyWith(color: AppColor.mainColor),
        ),

        if (hasDiscount) ...[
          12.horizontalSpace,
          Text(
            'EGP ${price.toStringAsFixed(2)}',
            style: AppTextStyle.dmRegular20.copyWith(
              color: AppColor.gray80,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ],
    );
  }
}