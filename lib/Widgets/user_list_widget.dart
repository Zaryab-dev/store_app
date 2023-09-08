import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store_app/Services/api_handler.dart';
import 'package:store_app/Services/user_api.dart';
import 'package:store_app/Utils/constants.dart';
import 'package:store_app/Widgets/user_details.dart';
import 'package:store_app/model/user_model.dart';

class UserListWidget extends StatefulWidget {
  UserListWidget({super.key});

  @override
  State<UserListWidget> createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {

  @override
  void didChangeDependencies() {
    UserListApi.getUserList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    UserListModel userListModel = Provider.of<UserListModel>(context, listen: false);
    return Consumer<UserListModel>(
      builder: (context, value, child) {
        return ListTile(
          onTap: () {
            Navigator.push(context, PageTransition(child: UserDetails(imageUrl: userListModel.avatar.toString(),role: userListModel.role.toString(), title: userListModel.name.toString(), email: userListModel.email.toString(),), type: PageTransitionType.fade));
          },
          leading: FancyShimmerImage(
            width: size.width * 0.15,
            height: size.height * 0.15,
            errorWidget: const Icon(Icons.error, size: 28,color: Colors.red,),
            boxFit: BoxFit.cover,
            imageUrl: value.avatar.toString(),),
          title: Text(userListModel.name.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text(userListModel.email.toString()),
          trailing: Text(userListModel.role.toString(), style: TextStyle(color: pinkColor, fontSize: 15),),
        );
      },
    );
  }
}
