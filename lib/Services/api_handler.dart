import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/product_model.dart';
import 'package:store_app/model/category_model.dart' as model;

class ProductAPI {
  static Future<List<ProductModel>> getProducts(String name) async{
    var response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/$name'));
      var data = json.decode(response.body.toString());
      var tempList = [];
      for (var v in data) {
        tempList.add(v);
      }
        return ProductModel.productFromSnapshot(tempList);
  }
  static Future<List<model.Category>> getCategory() async{
    var response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/categories'));
      var data = json.decode(response.body.toString());
      var tempList = [];
      for (var v in data) {
        tempList.add(v);
      }
        return model.Category.categoryFromSnapshot(tempList);
  }
  static Future<dynamic> getCategories() async{
    var response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/categories'));
    if(response.statusCode == 200) {
      var data = json.decode(response.body.toString());
      // print(data);
      return model.Category.fromJson(data);
    }else{
      return CircularProgressIndicator();
    }
  }
}