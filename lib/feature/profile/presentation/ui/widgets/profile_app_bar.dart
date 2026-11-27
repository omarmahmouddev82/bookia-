import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/services/locale/locale_helper.dart';
import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/utils/app_constants.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          "Profile",
          style: AppTextStyle.dmRegular24,
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: IconButton(
            onPressed: () {
              showDialog(
                context: context, 
                builder: (context)=> AlertDialog(
                  title: Text("Do you want to log out?"),
                  content: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            title: "Confirm",
                            bgColor: Colors.transparent,
                            textColor: AppColor.black,
                            onTap: () {
                              LocaleHelper.prefs?.remove(AppConstants.userToken);
                              Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginScreen, (e)=>false);
                            },
                          )
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: AppButton(
                            title: "Cancel",
                            onTap: () => Navigator.pop(context),
                          )
                        ),
                      ],
                    ),
                  ),
                )
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ),
      ],
    );
  }
}