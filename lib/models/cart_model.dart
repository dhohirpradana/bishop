import 'dart:convert';

import 'package:bishop/models/product_model.dart';

class Cart {
  Product product;
  int qty;
  Cart({
    required this.product,
    required this.qty,
  });

  Cart copyWith({
    Product? product,
    int? qty,
  }) {
    return Cart(
      product: product ?? this.product,
      qty: qty ?? this.qty,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'qty': qty,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      product: Product.fromMap(map['product']),
      qty: map['qty']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  @override
  String toString() => 'Cart(product: $product, qty: $qty)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cart && other.product == product && other.qty == qty;
  }

  @override
  int get hashCode => product.hashCode ^ qty.hashCode;
}
