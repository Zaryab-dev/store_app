import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/model/user_model.dart';

class UserListApi {
  static Future<UserModel> getUser() async {
    var response = await http.get(
        Uri.parse('https://api.escuelajs.co/api/v1/users/2'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return UserModel.fromJson(data);
    } else {
      throw 'Error';
    }
  }

  static Future<List<UserListModel>> getUserList() async {
    var response = await http.get(
        Uri.parse('https://api.escuelajs.co/api/v1/users'));
    var data = jsonDecode(response.body.toString()) as List;

    if (response.statusCode == 200) {
      return data.map((e) {
        // print(data);
        var map = e as Map<String, dynamic>;
        return UserListModel.fromJson(map);
      }).toList();
    } else if(response.statusCode == 522 || response.statusCode == 403 || response.statusCode == 404){
      throw ('Error');
    }else{
      throw('object');
    }
  }
}

// List tempList = [];
// for(var v in data) {
// tempList.add(v);
// }
// return UserListModel.fromJson(tempList as Map<String, dynamic>);
// }