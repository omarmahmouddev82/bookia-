import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              "assets/images/bg_welcome.png",
            ).image,
          ),
        ),
        child: Column(
          children: [
            135.verticalSpace,
            Image.asset(
              "assets/images/splash screen.png",
              width: 240.w,
              height: 80.h,
            ),
            12.verticalSpace,

            Text(
              "Order Your Book Now!",
              style: AppTextStyle.dmRegular18,
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
            ),
            const Spacer(),

            AppButton(
              title: "Login",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.loginScreen,
                );
              },
            ),
            16.verticalSpace,
            AppButton(
              title: "Register",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.registerScreen,
                );
              },
              bgColor: Colors.white,
              textColor: Colors.black,
            ),
            100.verticalSpace,
          ],
        ),
      ),
    );
  }
}