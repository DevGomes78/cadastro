import 'package:cadastro/controller/call_api.dart';
import 'package:cadastro/models/user_model.dart';
import 'package:flutter/material.dart';


class BuscaUsuario extends SearchDelegate {
  static search(String query) async {

  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );

  }
  DataUser userList = DataUser();

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: buildFutureBuilder(),
    );


  }

  FutureBuilder<List<UserModel>> buildFutureBuilder() {
    return FutureBuilder<List<UserModel>>(
        future: DataUser().getUserList(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      snapshot.data![index].name.toString(),
                    ),
                    subtitle: Text(
                      snapshot.data![index].email.toString(),
                    ),
                  );
                });
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {


    return Center(child: Text('search Users'),);
  }


}