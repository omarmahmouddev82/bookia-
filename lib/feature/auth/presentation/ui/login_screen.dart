import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/feature/auth/presentation/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome back! Glad \nto see you, Again!",
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  style: AppTextStyle.dmRegular30,
                ),
              ),
              32.verticalSpace,
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}