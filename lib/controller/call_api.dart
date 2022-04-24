import 'dart:convert';
import 'package:cadastro/models/user_model.dart';
import 'package:http/http.dart' as http;

class DataUser {
  var data = [];
  List<UserModel> results = [];
  String url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<UserModel>> getUserList( {String? query}) async {
    var baseUrl = Uri.parse(url);
    var response = await http.get(baseUrl);
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      results = data.map((item) => UserModel.fromJson(item)).toList();
      if (query != null) {
        results = results
            .where(
              (element) => element.name!.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .toList();
      }
    } else {
      print('api erro');
    }
    return results;
  }
}
