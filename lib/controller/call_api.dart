import 'dart:convert';
import 'package:cadastro/models/user_model.dart';
import 'package:http/http.dart' as http;

class DataUser {
  List<UserModel> lista = [];

  String url = 'https://api.github.com/repositories';

  Future<List<UserModel>?> getUser({String? query}) async {
    final baseUrl = Uri.parse(url);
    final response = await http.get(baseUrl);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      data.forEach((item) => lista.add(UserModel.fromJson(item)));
      if (query != null) {
        lista = lista
            .where((element) => element.name!.toLowerCase().contains(
                  query.toLowerCase(),
                ))
            .toList();
      }
      return lista;
    } else {
      print('erro');
    }
  }
}
