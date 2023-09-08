import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store_app/Screens/all_product_screen.dart';
import 'package:store_app/Screens/categories.dart';
import 'package:store_app/Screens/user_screen.dart';
import 'package:store_app/Services/api_handler.dart';
import 'package:store_app/Utils/constants.dart';
import 'package:store_app/Widgets/app_bar_widget.dart';
import 'package:store_app/Widgets/feeds_widget.dart';
import 'package:store_app/Widgets/sale_widget.dart';

import '../model/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController controller;
  // List<ProductModel> productsList = [];

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  //
  // @override
  // void didChangeDependencies() {
  //   getProducts();
  //   super.didChangeDependencies();
  // }
  //
  // Future<void> getProducts() async{
  //   productsList = await ProductAPI.getProducts();
  //   setState(() {
  //
  //   });
  // }


  ProductAPI productAPI = ProductAPI();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Home',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: AppBarIcon(icon: IconlyBold.category, onPress: () {
            Navigator.push(context, PageTransition(child: CategoriesScreen(), type: PageTransitionType.size,alignment: Alignment.center));
          }),
          actions: [AppBarIcon(icon: IconlyBold.user3, onPress: () {
            Navigator.push(context, PageTransition(child: UserListScreen(), type: PageTransitionType.size,alignment: Alignment.center));
          })],
        ),
        body: Column(
          children: [
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: TextFormField(
                controller: controller,
                cursorColor: pinkColor,
                decoration: InputDecoration(
                    hintText: 'Search',
                    suffixIcon: Icon(CupertinoIcons.search, color: pinkColor,),
                    hintStyle: const TextStyle(color: pinkColor),
                    filled: true,
                    fillColor: CupertinoColors.systemGrey5,
                    contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: pinkColor),
                        borderRadius: BorderRadius.circular(50)
                    )
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Expanded(child: SingleChildScrollView(child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.2,
                  child: Swiper(
                    onTap: (value) {
                    },
                    // controller: SwiperController(),
                    pagination: const SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        builder: DotSwiperPaginationBuilder(
                          color: Colors.white,activeColor: CupertinoColors.destructiveRed,
                        )
                    ),itemCount: 3,itemBuilder: (context , index) {
                    return const SaleWidget();
                  },),
                ),
                const SizedBox(height: 10,),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Latest Product', style: TextStyle(fontWeight: FontWeight.bold),),
                      InkWell(
                          onTap: () {
                            Navigator.push(context, PageTransition(child: AllProduct(), type: PageTransitionType.size,childCurrent: HomeScreen(), duration: Duration(milliseconds: 500),alignment: Alignment.bottomLeft),);
                          },
                          child: const Icon(IconlyBold.arrowUpCircle))
                    ],
                  ),
                ),
                FutureBuilder(
                    future: ProductAPI.getProducts('products'),
                    builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return
                      GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.84,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                      ),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {

                            return FeedWidget(
                              id: snapshot.data![index].id.toString(),
                              title: snapshot.data![index].title.toString(),
                              imageUrl: snapshot.data![index].images![0],
                              price: snapshot.data![index].price!.toDouble(),
                              description: snapshot.data![index].description.toString(),
                              category: snapshot.data![index].category!.name.toString(),
                            );

                          });
                  }else{
                    return const Padding(
                      padding: EdgeInsets.only(top: 58.0),
                      child: Center(child: CircularProgressIndicator(),),
                    );
                  }
                })
              ],
            ),))
          ],
        ),
      ),
    );
  }
}
