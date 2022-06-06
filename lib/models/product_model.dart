import 'dart:convert';
import 'package:flutter/foundation.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final bool isHalal;
  final bool isSoldOut;
  final Map itemLocation;
  final Map user;
  final Map defaultPhoto;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.isHalal,
    required this.isSoldOut,
    required this.itemLocation,
    required this.user,
    required this.defaultPhoto,
  });

  Product copyWith({
    String? id,
    String? title,
    int? price,
    bool? isHalal,
    bool? isSoldOut,
    Map? itemLocation,
    Map? user,
    Map? defaultPhoto,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      isHalal: isHalal ?? this.isHalal,
      isSoldOut: isSoldOut ?? this.isSoldOut,
      itemLocation: itemLocation ?? this.itemLocation,
      user: user ?? this.user,
      defaultPhoto: defaultPhoto ?? this.defaultPhoto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'isHalal': isHalal,
      'isSoldOut': isSoldOut,
      'itemLocation': itemLocation,
      'user': user,
      'defaultPhoto': defaultPhoto,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      price: int.parse(map['price']),
      isHalal: map['is_halal'] == "1" ? true : false,
      isSoldOut: map['is_sold_out'] == "1" ? true : false,
      itemLocation: Map.from(map['item_location']),
      user: Map.from(map['user']),
      defaultPhoto: Map.from(map['default_photo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id,title: $title, price: $price, isHalal: $isHalal, isSoldOut: $isSoldOut, itemLocation: $itemLocation, user: $user, defaultPhoto: $defaultPhoto)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.title == title &&
        other.price == price &&
        other.isHalal == isHalal &&
        other.isSoldOut == isSoldOut &&
        mapEquals(other.itemLocation, itemLocation) &&
        mapEquals(other.user, user) &&
        mapEquals(other.defaultPhoto, defaultPhoto);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        isHalal.hashCode ^
        isSoldOut.hashCode ^
        itemLocation.hashCode ^
        user.hashCode ^
        defaultPhoto.hashCode;
  }
}
