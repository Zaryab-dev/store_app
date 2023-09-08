import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/Services/api_handler.dart';
import 'package:store_app/Widgets/category_widget.dart';

import '../model/product_model.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: ProductAPI.getCategory(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryWidget(imageUrl: snapshot.data![index].image.toString(), title: snapshot.data![index].name.toString());

                  });
            }
            else{
              return Center(child: CircularProgressIndicator(),);
            }
          }),
    );
  }
}
