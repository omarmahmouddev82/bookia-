import 'package:bookia/feature/home/data/models/books_model.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/ui/widgets/book_item.dart';
import 'package:bookia/feature/home/presentation/ui/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required Null Function() onNavigateToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppBar(),
                24.verticalSpace,
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is GetBestSellerLoading) {
                      return Expanded(
                        child: Skeletonizer(
                          enabled: true,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: .50,
                                  mainAxisSpacing: 14.w,
                                  crossAxisSpacing: 18.h,
                                ),
                            itemBuilder: (context, index) =>
                                BookItem(
                                  product: Products(
                                    name: "name test",
                                    price: "240",
                                    image: "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg",
                                  )
                                ),
                            itemCount: 8,
                          ),
                        ),
                      );
                    } else if (state is GetBestSellerSuccess) {
                      return Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .50,
                                mainAxisSpacing: 14.w,
                                crossAxisSpacing: 18.h,
                              ),
                          itemBuilder: (context, index) =>
                              BookItem(product: state.products?[index]),
                          itemCount: state.products?.length,
                        ),
                      );
                    } else {
                      return Center(child: Text("Error"));
                    }
                  },
                ),
                24.verticalSpace
              ],
            ),
          ),
        ),
      ),
    );
  }
}