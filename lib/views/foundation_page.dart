import 'package:badges/badges.dart';
import 'package:bishop/controllers/cart_controller.dart';
import 'package:bishop/statics/app_color.dart';
import 'package:bishop/views/pages/cart_page.dart';
import 'package:bishop/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FoundationPage extends StatelessWidget {
  FoundationPage({Key? key}) : super(key: key);

  final _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bodyColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                Get.to(() => CartPage());
              },
              icon: GetBuilder<CartController>(builder: (_) {
                return Badge(
                  animationType: BadgeAnimationType.scale,
                  showBadge: _cartController.carts.isNotEmpty,
                  badgeContent: Text(
                    _cartController.carts.length.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: const Icon(
                    MdiIcons.cartVariant,
                    color: Colors.black54,
                  ),
                );
              }),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white60,
      body: Homepage(),
    ));
  }
}
