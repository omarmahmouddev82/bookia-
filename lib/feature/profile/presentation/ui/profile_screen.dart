import 'package:bookia/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia/feature/profile/presentation/ui/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            12.verticalSpace,
            ProfileAppBar(),
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is GetProfileLoading) {
                  return CircularProgressIndicator();
                } 
                else if (state is GetProfileSucsess) {
                  return Row(
                    children: [
                      CircleAvatar(
                        radius: 36.r,
                        backgroundImage: Image.network(state.profileData?.image??"").image,
                      ),
                      12.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(state.profileData?.name??""), 
                            Text(state.profileData?.email??""),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                else {
                  return Text("Error");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}