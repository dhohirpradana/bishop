import 'package:bishop/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController with StateMixin {
  List<Cart?> carts = <Cart?>[];
  int priceTotal = 0;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  addCart(Cart cart) {
    var target = carts.firstWhere((item) => item!.product.id == cart.product.id,
        orElse: () => null);

    if (target == null) {
      carts.add(cart);
      countPriceTotal();
      Get.snackbar(
        "Info",
        "Dimasukan ke keranjang.",
        icon: const Icon(Icons.done, color: Colors.white),
        margin: const EdgeInsets.all(10),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(milliseconds: 1500),
        forwardAnimationCurve: Curves.easeOut,
        dismissDirection: DismissDirection.none,
        backgroundColor: Colors.black87,
      );
    } else {
      // target.qty = target.qty + 1;
      increase(cart.product);
    }
  }

  increase(product) {
    if (product.price > 0) {
      var target = carts.firstWhere((item) => item!.product.id == product.id);
      target!.qty = target.qty + 1;
      countPriceTotal();
      Get.snackbar(
        "Info",
        "Ditambahkan ke keranjang.",
        icon: const Icon(Icons.done, color: Colors.white),
        margin: const EdgeInsets.all(10),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(milliseconds: 1500),
        forwardAnimationCurve: Curves.easeOut,
        dismissDirection: DismissDirection.none,
        backgroundColor: Colors.black87,
      );
    } else {
      Get.snackbar(
          "Info", "Product gratis tidak bisa dipesan lebih dari 1 kali.",
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          icon: const Icon(Icons.warning_amber, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black87);
    }
  }

  decrease(productId) {
    var target = carts.firstWhere((item) => item!.product.id == productId);
    if (target!.qty > 1) {
      target.qty = target.qty - 1;
      countPriceTotal();
    }
  }

  remove(productId) {
    carts.removeWhere((element) => element!.product.id == productId);
    countPriceTotal();
  }

  countPriceTotal() {
    priceTotal = 0;
    for (var item in carts) {
      priceTotal += item!.product.price * item.qty;
    }
    update();
  }
}
