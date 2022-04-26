import 'dart:convert';

import 'package:cadastro/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserController {
  List<Data> lista = [];
  var results;
  String url = 'https://reqres.in/api/users?page=2';

  Future<List<Data>> getData({String? query}) async {
    final baseUrl = Uri.parse(url);
    final response = await http.get(baseUrl);
    if (response.statusCode == 200) {
      results = jsonDecode(response.body);
      results['data'].forEach((item) => lista.add(Data.fromJson(item)));
      if (query!.length > 1) {
        lista = lista
            .where((item) => item.firstName!.toLowerCase().contains(
                  query.toLowerCase(),
                ))
            .toList();
      }
      return lista;
    } else {
      throw Exception('erro');
    }
  }
}
