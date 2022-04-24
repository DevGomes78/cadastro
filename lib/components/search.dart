import 'package:cadastro/controller/call_api.dart';
import 'package:cadastro/models/user_model.dart';
import 'package:flutter/material.dart';

class BuscaUsuario extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<UserModel>?>(
        future: DataUser().getUser(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        snapshot.data![index].owner!.avatarUrl.toString(),
                      ),
                    ),
                    title: Text(
                      snapshot.data![index].name.toString(),
                    ),
                    subtitle: Text(
                      snapshot.data![index].htmlUrl.toString(),
                    ),
                  );
                });
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Bucar usuarios'),
    );
  }
}
