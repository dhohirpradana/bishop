import 'package:bishop/controllers/cart_controller.dart';
import 'package:bishop/statics/api.dart';
import 'package:bishop/statics/app_color.dart';
import 'package:bishop/statics/behavior.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../../../statics/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: const Center(
                child: Text("CART",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600))),
            backgroundColor: AppColor.bodyColor),
        backgroundColor: AppColor.bodyColor,
        body: GetBuilder<CartController>(builder: (_) {
          return Column(
            children: [
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _cartController.carts.length,
                    itemBuilder: (context, i) {
                      final cart = _cartController.carts[i];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Slidable(
                          key: ValueKey(i),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                borderRadius: BorderRadius.circular(10),
                                onPressed: (context) {
                                  _cartController.remove(cart!.product.id);
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                width: Get.width,
                                margin: const EdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        height: 100.h,
                                        width: 100.w,
                                        cacheManager: CacheManager(Config(
                                            "cart image cache",
                                            stalePeriod:
                                                const Duration(days: 2))),
                                        memCacheHeight: 750.h.toInt(),
                                        fit: BoxFit.cover,
                                        imageUrl: cart!.product
                                                    .defaultPhoto["img_path"] ==
                                                ""
                                            ? "https://via.placeholder.com/300x400"
                                            : BaseUrl.imagePath +
                                                cart.product
                                                    .defaultPhoto["img_path"],
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cart.product.title.toTitleCase(),
                                          style: const TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          cart.product.price
                                              .toString()
                                              .toRupiah(),
                                          style: const TextStyle(
                                              color: Colors.amber,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Material(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.red[400],
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(4),
                                        child: const Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Icon(Icons.remove,
                                              color: Colors.white),
                                        ),
                                        onTap: () {
                                          _cartController
                                              .decrease(cart.product.id);
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                        cart.qty.toString(),
                                        style: const TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22),
                                      ),
                                    ),
                                    Material(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.cyan[700],
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(4),
                                        child: const Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Icon(Icons.add,
                                              color: Colors.white),
                                        ),
                                        onTap: () {
                                          _cartController
                                              .increase(cart.product);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Material(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(40)),
                elevation: 50,
                child: AnimatedContainer(
                  height: _cartController.carts.isEmpty ? 0 : 80,
                  decoration: const BoxDecoration(
                    // color: Colors.red,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40)),
                  ),
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Total Harga",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                            Text(
                              _cartController.priceTotal.toString().toRupiah(),
                              style: const TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 50),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "Order",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
