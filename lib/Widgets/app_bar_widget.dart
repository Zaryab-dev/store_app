import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/Utils/constants.dart';

class AppBarIcon extends StatelessWidget {
  VoidCallback onPress;
  IconData icon;
  AppBarIcon({super.key, required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(6),
    child: GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: CupertinoColors.systemGrey6,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon, color: pinkColor,),
        ),
      ),
    ),
    );
  }
}
