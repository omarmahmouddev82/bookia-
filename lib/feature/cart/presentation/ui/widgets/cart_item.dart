import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/feature/cart/presentation/ui/widgets/quantityButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  final String name;
  final String image;
  final double price;
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const CartItem({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColor.outlineGray),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              image,
              width: 94.w,
              height: 105.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 94.w,
                  height: 106.h,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.book),
                );
              },
            ),
          ),
          16.horizontalSpace,

          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Book name and remove button
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.dmRegular18
                      ),
                    ),
                    SizedBox(
                      width: 28.w,
                      height: 28.h,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: onRemove,
                        icon: Icon(
                          Icons.cancel_outlined,
                          size: 20.r,
                          color: AppColor.black,
                        ),
                      ),
                    ),
                  ],
                ),
                8.verticalSpace,

                Text(
                  'EGP ${price.toStringAsFixed(2)}',
                  style: AppTextStyle.dmRegular16.copyWith(
                    color: AppColor.black,
                  ),
                ),
                12.verticalSpace,                
                Row(
                  children: [
                    QuantityButton(icon: Icons.add, onTap: onIncrease),
                    8.horizontalSpace,
                    Text('$quantity', style: AppTextStyle.dmRegular18),
                    8.horizontalSpace,
                    QuantityButton(icon: Icons.remove, onTap: onDecrease),
                    const Spacer(),
                    Flexible(
                      child: Text(
                        'EGP ${(price * quantity).toStringAsFixed(2)}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        style: AppTextStyle.dmRegular14.copyWith(
                          color: AppColor.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}