import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/Services/user_api.dart';
import 'package:store_app/Widgets/user_list_widget.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User List'),),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: FutureBuilder(
              future: UserListApi.getUserList(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider.value(
                            value: snapshot.data![index],
                            child: UserListWidget());
                      });
                }else{
                  return const Center(child: CircularProgressIndicator(),);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
