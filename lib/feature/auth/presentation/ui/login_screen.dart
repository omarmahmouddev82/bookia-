import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/feature/auth/presentation/ui/register_screen.dart';
import 'package:bookia/feature/auth/presentation/ui/widgets/divider.dart';
import 'package:bookia/feature/auth/presentation/ui/widgets/footer.dart';
import 'package:bookia/feature/auth/presentation/ui/widgets/login_form.dart';
import 'package:bookia/feature/auth/presentation/ui/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  24.verticalSpace,
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColor.outlineGray),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_ios_new),
                      iconSize: 18.sp,
                      color: AppColor.black,
                    ),
                  ),
                  24.verticalSpace,
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
                  32.verticalSpace,
                  // Divider(),
                  const AuthDivider(),
                  24.verticalSpace,
                  SocialAuthButton(
                    text: 'Sign Up with Google',
                    backgroundColor: AppColor.white,
                    foregroundColor: AppColor.darkGrayColor,
                    side: BorderSide(color: AppColor.outlineGray),
                    onPressed: () {},
                    imagePath: 'assets/images/google.png',
                  ),
                  16.verticalSpace,
                  SocialAuthButton(
                    text: 'Sign Up with Apple',
                    backgroundColor: AppColor.white,
                    foregroundColor: AppColor.darkGrayColor,
                    side: BorderSide(color: AppColor.outlineGray),
                    onPressed: () {},
                    imagePath: 'assets/images/apple.png',
                  ),
                  50.verticalSpace,
                  AuthFooter(
                    message: 'Don’t have an account?',
                    actionText: 'Register Now',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}