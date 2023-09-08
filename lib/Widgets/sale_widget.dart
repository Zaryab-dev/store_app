import 'dart:ui';

import 'package:flutter/material.dart';

class SaleWidget extends StatelessWidget {
  const SaleWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Container(
            height: size.height * 0.2,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: FractionalOffset.topRight,
                end: FractionalOffset.bottomRight,
                transform: GradientRotation(180),
                tileMode: TileMode.mirror,
                colors: [
                  Color(0xff09bd03),
                  Color(0xff00c799),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(color: Color(0x77ffd6d6),borderRadius: BorderRadius.circular(20)),
                      child: const Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Column(
                          children: [
                            SizedBox(height: 6,),
                            Text('Get the Special Discount', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            SizedBox(height: 20,),
                            Flexible(child: SizedBox(
                              width: double.infinity,
                              child: FittedBox(
                                child: Text('50% \nOFF', style: TextStyle(color: Colors.white,  fontWeight: FontWeight.bold),),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Flexible(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(right: 18.0),
                    child: Image(image: AssetImage('assets/shoe.png')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
