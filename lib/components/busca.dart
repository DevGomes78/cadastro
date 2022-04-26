import 'package:cadastro/controller/user_controller.dart';
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
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
   return FutureBuilder<List<Data>>(
       future: UserController().getData(query: query),
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
                       snapshot.data![index].avatar.toString(),
                     ),
                   ),
                   title: Text(
                     snapshot.data![index].firstName.toString(),
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
    return const Center(
      child: Text('Buscar'),
    );
  }
}
