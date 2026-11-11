import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/ui/widgets/footer.dart';
import 'package:bookia/feature/auth/presentation/ui/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Directionality(
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
                        border: Border.all(
                          color: AppColor.outlineGray,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new,),
                        iconSize: 18.sp,
                        color: AppColor.black,
                      ),
                    ),
                    24.verticalSpace,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hello! Register to get \nstarted",
                        textAlign: TextAlign.left,
                        style: AppTextStyle.dmRegular30,
                      ),
                    ),
                    32.verticalSpace,
                    RegisterForm(),
                    40.verticalSpace,
                    AuthFooter(
                      message: 'Already have an account?',
                      actionText: 'Login Now',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    24.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}