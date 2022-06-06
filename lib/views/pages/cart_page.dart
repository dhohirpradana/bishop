import 'package:bishop/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../statics/string_extension.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffececec),
      body: GetBuilder<CartController>(builder: (_) {
        return Column(
          children: [
            const Spacer(),
            Material(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(40)),
              elevation: 50,
              child: AnimatedContainer(
                height: _cartController.carts.isEmpty ? 0 : 80,
                decoration: const BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
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
                            20000.toString().toRupiah(),
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
    );
  }
}
