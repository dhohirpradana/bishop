import 'package:bishop/controllers/product_controller.dart';
import 'package:bishop/statics/app_color.dart';
import 'package:bishop/views/widgets/home/card_product.dart';
import 'package:bishop/views/widgets/home/products_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  final _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.bodyColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          width: 140,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [Icon(Icons.list), Text("Category")]),
              ),
              Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [Icon(Icons.list), Text("Filter")]),
            ],
          ),
        ),
        body: _productController.obx(
          (state) {
            final products = _productController.products;
            return MasonryGridView.count(
              itemCount: products.length,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder: (context, index) {
                return CardProduct(product: products[index]);
              },
            );
          },
          onLoading: const ProductsLoadingWidget(),
        ));
  }
}
