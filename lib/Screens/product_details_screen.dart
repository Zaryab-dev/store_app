import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/Services/api_handler.dart';
import 'package:store_app/Services/product_detail_api.dart';
import 'package:store_app/Utils/constants.dart';

class ProductDetails extends StatefulWidget {
  final String id;
  const ProductDetails({super.key, required this.id});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  void didChangeDependencies() {
    ProductDetailApi.getSingleProduct(widget.id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
        padding: const EdgeInsets.all(0),
        child: FutureBuilder(
          future: ProductDetailApi.getSingleProduct(widget.id),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(snapshot.data!.category!.name.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FittedBox(
                              fit: BoxFit.cover,
                              child: Text(snapshot.data!.title.toString(),overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                          RichText(text: TextSpan(text: '\$',style: TextStyle(color: pinkColor,fontWeight: FontWeight.bold,fontSize: 24),children: [
                            TextSpan(text: snapshot.data!.price.toString(), style: TextStyle(color: Colors.black,fontSize: 24))
                          ])),
                        ],),
                    ),
                    const SizedBox(height: 10,),
                    Container(height: size.height*0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Swiper(
                        itemCount: 3,
                        pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                              color: CupertinoColors.activeGreen, activeColor: pinkColor,
                            )
                        ),
                        itemBuilder: (context, index) {
                          return FancyShimmerImage(
                            // height: MediaQuery.of(context).size.height*1,
                            imageUrl: snapshot.data!.images![index].toString(),
                            errorWidget: const Icon(Icons.error_outline,color: Colors.red,size: 28,),
                            boxFit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Description', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(snapshot.data!.description.toString()),
                    )
                  ],
                );

            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
        ),
    );
  }
}
