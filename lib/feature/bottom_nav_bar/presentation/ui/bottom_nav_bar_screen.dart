import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/feature/cart/presentation/ui/cart_screen.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/ui/home_screen.dart';
import 'package:bookia/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia/feature/profile/presentation/ui/profile_screen.dart';
import 'package:bookia/feature/wishlist/presentation/ui/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            body: IndexedStack(
              index: currentIndex,
              children: [
                BlocProvider(
                  create: (_) => HomeCubit()..getBestSellerBooks(),
                  child: HomeScreen(
                    onNavigateToCart: () {
                      setState(() {
                        currentIndex = 2;
                      });
                    },
                  ),
                ),
    
                const WishlistScreen(),
    
                const CartScreen(),
    
                BlocProvider(
                  create: (_) => ProfileCubit()..getProfileData(),
                  child: const ProfileScreen(),
                ),
              ],
            ),
    
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColor.backGround,
              selectedItemColor: AppColor.mainColor,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/home.svg',
                    colorFilter: ColorFilter.mode(
                      currentIndex == 0 ? AppColor.mainColor : AppColor.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/Bookmark.svg',
                    colorFilter: ColorFilter.mode(
                      currentIndex == 1 ? AppColor.mainColor : AppColor.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Saved',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/cart.svg',
                    colorFilter: ColorFilter.mode(
                      currentIndex == 2 ? AppColor.mainColor : AppColor.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/profile.svg',
                    colorFilter: ColorFilter.mode(
                      currentIndex == 3 ? AppColor.mainColor : AppColor.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}