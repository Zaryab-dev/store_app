

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store_app/Screens/product_details_screen.dart';
import 'package:store_app/Services/api_handler.dart';
import 'package:store_app/Utils/constants.dart';

import '../model/product_model.dart';

class FeedWidget extends StatelessWidget {
  final String title, imageUrl, description, category,id;
  double price;
  FeedWidget({super.key,required this.id, required this.price, required this.title, required this.imageUrl, required this.description, required this.category});

  // List<ProductModel> productList = [];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 10,),
        Container(
          height: height.height*0.25,
          width: width.height*0.22,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: CupertinoColors.systemGrey5,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              Navigator.push(context, PageTransition(child: ProductDetails(id: id.toString(),), type: PageTransitionType.fade));
            },
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(text: TextSpan(text: '\$',style: TextStyle(color: pinkColor,fontWeight: FontWeight.bold), children: [
                          TextSpan(text: price.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))
                        ])),
                        Icon(IconlyBold.heart, color: pinkColor,)
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  ClipRRect(
                    // borderRadius: BorderRadius.circular(10),
                    child: FancyShimmerImage(
                      height: height.height*0.15,
                      width: double.infinity,
                      errorWidget: const Icon(IconlyBold.danger, color: Colors.red,size: 28,),
                      imageUrl: imageUrl,
                      boxFit: BoxFit.fill,
                      shimmerHighlightColor: pinkColor,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(title,overflow: TextOverflow.ellipsis,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
