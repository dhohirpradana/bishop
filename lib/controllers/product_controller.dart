import 'package:bishop/models/product_model.dart';
import 'package:bishop/statics/api.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProductController extends GetxController with StateMixin {
  final _dio = Dio();
  List<Product> products = [];

  @override
  void onInit() {
    _fetchProducts();
    super.onInit();
  }

  _fetchProducts() async {
    // make status to loading
    change(null, status: RxStatus.loading());

    try {
      final res = await _dio.post(BaseUrl.products);
      if (res.statusCode == 200) {
        for (Map i in res.data) {
          products.add(Product.fromMap(i as Map<String, dynamic>));
        }
      }
      update();
    } catch (e) {
      // print(e);
    }

    // if done, change status to success
    change(null, status: RxStatus.success());
  }
}
