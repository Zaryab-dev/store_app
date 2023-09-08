import 'package:flutter/material.dart';
import 'package:store_app/Screens/product_details_screen.dart';
import 'package:store_app/Services/api_handler.dart';

import '../Widgets/feeds_widget.dart';
import '../model/product_model.dart';

class AllProduct extends StatefulWidget {
  AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  List<ProductModel> productsList = [];

  @override
  void didChangeDependencies() {
    getProduct();
    super.didChangeDependencies();
  }

  Future<void> getProduct() async {
    productsList = await ProductAPI.getProducts('products');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Products"),
        ),
        body: FutureBuilder(
            future: ProductAPI.getProducts('products'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.84,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                    ),
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return FeedWidget(
                        id: snapshot.data![index].id.toString(),
                        title: snapshot.data![index].title.toString(),
                        imageUrl: snapshot.data![index].images![0],
                        price: snapshot.data![index].price!.toDouble(),
                        description:
                            snapshot.data![index].description.toString(),
                        category:
                            snapshot.data![index].category!.name.toString(),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
