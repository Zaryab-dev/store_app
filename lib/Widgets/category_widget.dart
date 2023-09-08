import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/model/product_model.dart';

class CategoryWidget extends StatelessWidget {
  String title, imageUrl;
  CategoryWidget({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: size.height*0.2,
          width: size.width*0.46,
          // color: Colors.blue,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FancyShimmerImage(
                    errorWidget: const Icon(Icons.error_outline,color: Colors.red,size: 28,),
                    imageUrl: imageUrl),
              ),
              Align(
                alignment: Alignment.center,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                title, style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
              ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
