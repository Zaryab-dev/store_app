import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final String title, imageUrl, email,role;
  const UserDetails({super.key, required this.role, required this.email , required this.title , required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title\'s Details'),
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: CupertinoColors.systemGrey5,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: CupertinoColors.systemGrey5),
              ),
              child: Center(child: Text('Username ${title}'),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: CupertinoColors.systemGrey5),
              ),
              child: Center(child: Text('User Email ${email}'),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: CupertinoColors.systemGrey5),
              ),
              child: Center(child: Text('User Role ${role}'),),
            ),
          ),
        ],
      ),
    );
  }
}
