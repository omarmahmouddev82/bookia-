import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartBottomBar extends StatelessWidget {
  final double total;
  final VoidCallback onCheckout;

  const CartBottomBar({
    super.key,
    required this.total,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      color: AppColor.backGround,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total:',
                style: AppTextStyle.dmRegular20.copyWith(
                  color: AppColor.gray80,
                ),
              ),
              Text(
                'EGP ${total.toStringAsFixed(2)}',
                style: AppTextStyle.dmRegular20.copyWith(
                  color: AppColor.black,
                ),
              ),
            ],
          ),
          18.verticalSpace,

          SizedBox(
            width: double.infinity,
            height: 56.h,
            child: ElevatedButton(
              onPressed: onCheckout,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.mainColor,
                foregroundColor: AppColor.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              child: Text(
                'Checkout',
                style: AppTextStyle.dmRegular20.copyWith(
                  color: AppColor.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}