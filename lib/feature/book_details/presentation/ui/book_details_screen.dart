import 'package:bookia/feature/book_details/presentation/cubit/book_details_cubit.dart';
import 'package:bookia/feature/book_details/presentation/ui/widgets/add_to_car.dart';
import 'package:bookia/feature/book_details/presentation/ui/widgets/book_description.dart';
import 'package:bookia/feature/book_details/presentation/ui/widgets/book_header.dart';
import 'package:bookia/feature/book_details/presentation/ui/widgets/book_image.dart';
import 'package:bookia/feature/book_details/presentation/ui/widgets/book_info.dart';
import 'package:bookia/feature/book_details/presentation/ui/widgets/book_price.dart';
import 'package:bookia/feature/book_details/presentation/ui/widgets/book_stock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<BookDetailsCubit, BookDetailsState>(
          builder: (context, state) {
            if (state is GetDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetDetailsSuccess) {
              final details = state.details;
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 22.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          16.verticalSpace,
                          const ProductHeader(),
                          24.verticalSpace,
                          ProductImage(image: details?.image ?? ""),
                          24.verticalSpace,
                          ProductInfo(
                            name: details?.name ?? "",
                            category: details?.category ?? "",
                          ),
                          16.verticalSpace,
                          ProductPrice(
                            price: double.tryParse(
                                    details?.price?.toString() ?? "0") ??
                                0,
                          ),
                          8.verticalSpace,
                          ProductStock(
                            stock: int.tryParse(
                                    details?.stock?.toString() ?? "0") ??
                                0,
                          ),
                          16.verticalSpace,
                          ProductDescription(
                            description: details?.description ?? "",
                          ),
                          24.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(22.w, 8.h, 22.w, 16.h),
                    child: AddToCartButton(onPressed: () {}),
                  ),
                ],
              );
            } else {
              return const Center(child: Text("Error"));
            }
          },
        ),
      ),
    );
  }
}