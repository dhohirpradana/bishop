import 'package:bishop/models/product_model.dart';
import 'package:bishop/statics/api.dart';
import 'package:bishop/views/widgets/home/image_loading_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../statics/string_extension.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  const CardProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 520.h,
      width: 400.w,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        key: ValueKey(product.id),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedNetworkImage(
                height: 300.h,
                width: 400.w,
                cacheManager: CacheManager(Config("product image cache",
                    stalePeriod: const Duration(days: 2))),
                memCacheHeight: 750.h.toInt(),
                fit: BoxFit.cover,
                imageUrl: product.defaultPhoto["img_path"] == ""
                    ? "https://via.placeholder.com/300x400"
                    : BaseUrl.imagePath + product.defaultPhoto["img_path"],
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    ShimmerLoading(
                        isLoading: true,
                        child: SizedBox(
                          height: 300.h,
                          width: 400.w,
                          child: const Card(),
                        )),
                errorWidget: (context, url, error) => const Icon(Icons.error)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.toTitleCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    product.price != 0
                        ? (product.price).toString().toRupiah()
                        : "FREE",
                    style: const TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.location_on,
                                    size: 16, color: Colors.black54),
                                Flexible(
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    strutStyle: const StrutStyle(fontSize: 16),
                                    text: TextSpan(
                                        style: const TextStyle(
                                            color: Colors.black54),
                                        text: product.itemLocation["name"] == ""
                                            ? "no location".toTitleCase()
                                            : product.itemLocation["name"]),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.person,
                                    size: 16, color: Colors.black54),
                                Flexible(
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    strutStyle: const StrutStyle(fontSize: 16),
                                    text: TextSpan(
                                        style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16),
                                        text: product.user["user_name"]),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: Colors.blue[400],
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                    child: Text(
                                  "Add Cart",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                      product.isHalal
                          ? Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Image.asset("lib/assets/image/halal.png",
                                  width: 80.w),
                            )
                          : SizedBox(width: 90.w)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
