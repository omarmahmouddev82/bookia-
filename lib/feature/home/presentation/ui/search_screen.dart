import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/widgets/custom_text_form_felid.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/ui/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.verticalSpace,
              Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColor.outlineGray),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                      iconSize: 18.sp,
                      color: AppColor.black,
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: CustomTextFormFelid(
                      hintText: "Search",
                      autofocus: true,
                      onChanged: (v) {
                        context.read<HomeCubit>().search(v ?? "");
                      },
                    ),
                  ),
                ],
              ),
              24.verticalSpace,
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is SearchSuccess) {
                    final products = state.products ?? [];
                    if (products.isEmpty) {
                      return const Expanded(
                        child: Center(child: Text("No results found")),
                      );
                    }
                    return Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .50,
                          mainAxisSpacing: 14.h,
                          crossAxisSpacing: 18.w,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) =>
                            BookItem(product: products[index]),
                      ),
                    );
                  } else {
                    return const Expanded(
                      child: Center(child: Text("Search for a book")),
                    );
                  }
                },
              ),
              24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}