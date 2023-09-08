

import 'dart:convert';

import 'package:store_app/model/product_model.dart';
import 'package:http/http.dart'as http;

class ProductDetailApi{
  static Future<ProductModel> getSingleProduct(String id) async{
    var response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products/$id'));
      var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200) {
      return ProductModel.fromJson(data);
    }else{
      throw 'Error';
    }
  }
}