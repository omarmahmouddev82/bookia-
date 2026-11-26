import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductHeader extends StatefulWidget {
  const ProductHeader({super.key});

  @override
  State<ProductHeader> createState() => _ProductHeaderState();
}

class _ProductHeaderState extends State<ProductHeader> {
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColor.outlineGray),
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 18.r,
              color: AppColor.black,
            ),
          ),
        ),

        const Spacer(),
        Center(
          child: Text(
            'Book Details',
            style: AppTextStyle.dmRegular24.copyWith(color: AppColor.black),
          ),
        ),

        const Spacer(),
        IconButton(
          onPressed: () {
            setState(() {
              isSaved = !isSaved;
            });
          },
          icon: isSaved?
          Icon(Icons.bookmark, color: AppColor.mainColor, size: 24.r,):
          SvgPicture.asset('assets/icons/Bookmark.svg'),
        ),
      ],
    );
  }
}