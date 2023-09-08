import 'package:flutter/cupertino.dart';

import 'category_model.dart';

class ProductModel{
  int? id;
  String? title;
  int? price;
  String? description;
  Category? category;
  List<String>? images;

  ProductModel(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.images});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['images'] = this.images;
    return data;
  }
  static List<ProductModel> productFromSnapshot(List snapshot) {
    return snapshot.map((e) {
      return ProductModel.fromJson(e);
    }).toList();
  }
}
