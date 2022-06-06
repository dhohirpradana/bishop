import 'package:badges/badges.dart';
import 'package:bishop/views/pages/cart_page.dart';
import 'package:bishop/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FoundationPage extends StatelessWidget {
  const FoundationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                Get.to(() => CartPage());
              },
              icon: Badge(
                badgeContent: const Text(
                  '5',
                  style: TextStyle(color: Colors.white),
                ),
                child: const Icon(
                  MdiIcons.cartVariant,
                  color: Colors.black54,
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white60,
      body: Homepage(),
    ));
  }
}
