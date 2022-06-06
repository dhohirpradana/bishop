import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class ProductsLoadingWidget extends StatelessWidget {
  const ProductsLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      itemCount: 4,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          direction: ShimmerDirection.ltr,
          baseColor: Colors.black26,
          highlightColor: Colors.black12,
          child: SizedBox(
            height: 520.h,
            width: 400.w,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
      },
    );
  }
}
